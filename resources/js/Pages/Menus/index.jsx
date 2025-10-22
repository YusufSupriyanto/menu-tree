import React, { useState, useEffect } from "react";
import { useForm } from "@inertiajs/react";
import { Menu as MenuIcon, X, Folder } from "lucide-react";
import MenuSidebar from "@/Components/MenuSidebar";
import MenuTree from "@/Components/MenuTree";
import { router } from "@inertiajs/react";
import axios from "axios"; // <- pastikan import axios

export default function Index({ menus: initialMenus }) {
  const [menuState, setMenuState] = useState(initialMenus || []);
  const { data, setData, post, reset } = useForm({
    name: "",
    parent_id: "",
  });

   
  const [mobileOpen, setMobileOpen] = useState(false);
  const [selectedMenuId, setSelectedMenuId] = useState(null);
  const [selectedNode, setSelectedNode] = useState(null);

   useEffect(() => {
    if (selectedMenuId) {
        const updatedNode = findNodeById(menuState, selectedMenuId);
        setSelectedNode(updatedNode);
    }
    }, [menuState, selectedMenuId]);


  // Fungsi rekursif untuk mencari node berdasarkan id
  const findNodeById = (data, id) => {
    for (const item of data) {
      if (String(item.id) === String(id)) return item;
      if (item.children && item.children.length) {
        const found = findNodeById(item.children, id);
        if (found) return found;
      }
    }
    return null;
  };

  // Membuat opsi dropdown secara nested
  const renderOptions = (data, prefix = "") => {
    return data.flatMap((item) => [
      <option key={item.id} value={item.id}>
        {prefix + item.name}
      </option>,
      ...(item.children ? renderOptions(item.children, prefix + "--") : []),
    ]);
  };

  const handleSelectChange = (e) => {
    const id = e.target.value;
    setSelectedMenuId(id);
    const node = findNodeById(menuState, id); 
    setSelectedNode(node);
  };

  
  const handleCreate = async (parent, values) => {
    try {
      const response = await axios.post("/menus", values);
      
      if (response.data && response.data.success) {
        const newMenu = response.data.menu;

        setMenuState((prev) => {
          if (!newMenu.parent_id) {
            return [...prev, { ...newMenu, children: [] }];
          }

          const updateChildren = (nodes) =>
            nodes.map((node) => {
              if (String(node.id) === String(newMenu.parent_id)) {
                return {
                  ...node,
                  children: [...(node.children || []), { ...newMenu, children: [] }],
                };
              }
              if (node.children) {
                return { ...node, children: updateChildren(node.children) };
              }
              return node;
            });

          return updateChildren(prev);
        });

        alert("Menu berhasil dibuat!");
      } else {
        console.error("Unexpected response:", response);
        alert("Gagal membuat menu!");
      }
    } catch (error) {
      console.error(error);
      alert("Gagal membuat menu!");
    }
  };

  const handleEdit = async (node, values) => {
    try {
      const response = await axios.put(`/menus/${node.id}`, values);
      if (response.data && response.data.success) {
        const updatedMenu = response.data.menu;
        setMenuState((prev) => {
          const updateNode = (nodes) =>
            nodes.map((n) => {
              if (String(n.id) === String(updatedMenu.id)) {
                return { ...n, ...updatedMenu };
              }
              if (n.children) {
                return { ...n, children: updateNode(n.children) };
              }
              return n;
            });
          return updateNode(prev);
        });
        alert("Menu berhasil diperbarui!");
      } else {
        alert("Gagal memperbarui menu!");
      }
    } catch (error) {
      console.error(error);
      alert("Gagal memperbarui menu!");
    }
  };

  const handleDelete = async (node) => {
    if (!confirm("Yakin ingin menghapus menu ini?")) return;

    try {
      const response = await axios.delete(`/menus/${node.id}`);
      if (response.data && response.data.success) {
        setMenuState((prev) => {
          const removeNode = (nodes) =>
            nodes
              .filter((n) => String(n.id) !== String(node.id))
              .map((n) => ({
                ...n,
                children: n.children ? removeNode(n.children) : [],
              }));
          return removeNode(prev);
        });
        alert("Menu berhasil dihapus!");
      } else {
        alert("Gagal menghapus menu!");
      }
    } catch (error) {
      console.error(error);
      alert("Gagal menghapus menu!");
    }
  };

  return (
    <div className="h-screen flex flex-col md:flex-row">
      {/* Sidebar */}
      <div className="hidden md:block p-2">
        <MenuSidebar />
      </div>

      {mobileOpen && (
        <div
          className="fixed inset-0 bg-black/40 z-40 md:hidden"
          onClick={() => setMobileOpen(false)}
        >
          <div
            className="absolute left-0 top-0 h-full bg-blue-800 rounded-r-xl p-2 w-64 text-white z-50"
            onClick={(e) => e.stopPropagation()}
          >
            <button
              onClick={() => setMobileOpen(false)}
              className="text-white mb-4 flex items-center gap-2 hover:text-blue-200"
            >
              <X size={20} /> Close
            </button>
            <MenuSidebar />
          </div>
        </div>
      )}

      {/* Konten utama */}
      <div className="flex-1 flex flex-col p-2 gap-2 overflow-hidden">
        <div className="md:hidden flex items-center justify-between mb-2">
          <button
            onClick={() => setMobileOpen(true)}
            className="bg-white text-black p-2 rounded-lg hover:bg-blue-700"
          >
            <MenuIcon size={22} />
          </button>
        </div>

        <div className="flex-1 bg-white rounded-xl shadow-sm p-4 overflow-auto">
          <div className="flex items-center gap-2 text-gray-600 text-sm mb-3">
            <Folder size={18} className="text-blue-600" />
            <span className="font-medium">/ Menus</span>
          </div>

          <div className="mb-4">
            <select
              value={selectedMenuId || ""}
              onChange={handleSelectChange}
              className="border p-2 rounded w-full"
            >
              <option value="">-- Select Menu --</option>
              {renderOptions(menuState)}
            </select>
          </div>

          <MenuTree
            data={selectedNode ? [selectedNode] : menuState}
            onCreate={handleCreate}
            onEdit={handleEdit}
            onDelete={handleDelete}
          />
        </div>
      </div>
    </div>
  );
}
