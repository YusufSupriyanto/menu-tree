import React, { useState } from "react";
import { useForm } from "@inertiajs/react";
import { Menu as MenuIcon, X, Folder } from "lucide-react";
import MenuSidebar from "@/Components/MenuSidebar";
import MenuTree from "@/Components/MenuTree";
import { router } from "@inertiajs/react";

export default function Index({ menus }) {
  const { data, setData, post, reset } = useForm({
    name: "",
    parent_id: "",
  });
  console.log(menus);

  const [mobileOpen, setMobileOpen] = useState(false);
  const [selectedMenuId, setSelectedMenuId] = useState(null);
  const [selectedNode, setSelectedNode] = useState(null);

  // Fungsi rekursif untuk mencari node berdasarkan id
  const findNodeById = (data, id) => {
    for (const item of data) {
      if (item.id === id) return item;
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
    const node = findNodeById(menus, id);
    setSelectedNode(node);
  };

  const handleCreate = (parent, values) => {
    router.post("/menus", values, {
      onSuccess: () => {
        setData({ name: values.name, parent_id: parent.id });
        alert("Menu berhasil dibuat!");
      },
      onError: (errors) => {
        console.error(errors);
        alert("Gagal membuat menu!");
      },
    });
  };

  const handleEdit = (node, values) => {
    router.put(`/menus/${node.id}`, values, {
      onSuccess: () => {
        alert("Menu berhasil diperbarui!");
      },
      onError: (errors) => {
        console.error(errors);
        alert("Gagal memperbarui menu!");
      },
    });
  };

  const handleDelete = (node) => {
    router.delete(`/menus/${node.id}`, {
      onSuccess: () => {
        alert("Menu berhasil dihapus!");
      },
      onError: (errors) => {
        console.error(errors);
        alert("Gagal menghapus menu!");
      },
    });
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

          {/* Dropdown untuk pilih menu */}
          <div className="mb-4">
            <select
              value={selectedMenuId || ""}
              onChange={handleSelectChange}
              className="border p-2 rounded w-full"
            >
              <option value="">-- Select Menu --</option>
              {renderOptions(menus)}
            </select>
          </div>

          {/* Tampilkan node yang dipilih beserta children */}
          <MenuTree
            data={selectedNode ? [selectedNode] : menus}
            onCreate={handleCreate}
            onEdit={handleEdit}
            onDelete={handleDelete}
          />
        </div>
      </div>
    </div>
  );
}
