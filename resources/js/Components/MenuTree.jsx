import React, { useState, useEffect } from "react";
import {
  ChevronDown,
  ChevronRight,
  Plus,
  Edit2,
  Trash2,
  Folder,
} from "lucide-react";
import MenuForm from "@/Components/MenuForm";

export default function MenuTree({ data, onCreate, onEdit, onDelete }) {
  const [treeData, setTreeData] = useState([]);
  const [expanded, setExpanded] = useState({});
  const [selectedNode, setSelectedNode] = useState(null);
  const [formMode, setFormMode] = useState(null); 

  //Tambahkan parent_name ke setiap anak
  const addParentName = (nodes, parentName = null) => {
    return nodes.map((node) => {
      const newNode = {
        ...node,
        parent_name: parentName,
      };
      if (node.children && node.children.length > 0) {
        newNode.children = addParentName(node.children, node.name);
      }
      return newNode;
    });
  };

  // Jalankan saat data berubah
  useEffect(() => {
    if (data && Array.isArray(data)) {
      setTreeData(addParentName(data));
    }
  }, [data]);

  const toggleNode = (id) => {
    setExpanded((prev) => ({ ...prev, [id]: !prev[id] }));
  };

  const expandAll = () => {
    const all = {};
    const traverse = (nodes) => {
      nodes.forEach((n) => {
        all[n.id] = true;
        if (n.children) traverse(n.children);
      });
    };
    traverse(treeData);
    setExpanded(all);
  };

  const collapseAll = () => setExpanded({});

  const handleCreate = (node) => {
    setSelectedNode(node);
    setFormMode("create");
  };

  const handleEdit = (node) => {
    setSelectedNode(node);
    setFormMode("edit");
  };

  const handleDelete = (node) => {
    if (confirm(`Yakin ingin menghapus "${node.name}"?`)) {
      onDelete(node);
    }
  };

  // Recursive render
  const renderTree = (nodes, depth = 0) => (
    <ul className={`pl-${depth * 4}`}>
      {nodes.map((node) => (
        <li key={node.id} className="mt-1">
          <div className="flex items-center gap-2 group cursor-pointer rounded-md hover:bg-gray-50 p-1">
            {node.children && node.children.length > 0 ? (
              <button onClick={() => toggleNode(node.id)} className="text-gray-500">
                {expanded[node.id] ? (
                  <ChevronDown size={16} />
                ) : (
                  <ChevronRight size={16} />
                )}
              </button>
            ) : (
              <span className="w-4" />
            )}

            <Folder size={16} className="text-blue-600" />
            <span className="text-sm text-gray-800">{node.name}</span>

            <div className="ml-auto flex items-center gap-1 opacity-0 group-hover:opacity-100 transition">
              <button
                onClick={() => handleCreate(node)}
                className="text-blue-500 hover:text-blue-700 p-1"
                title="Add submenu"
              >
                <Plus size={14} />
              </button>

              <>
                <button
                  onClick={() => handleEdit(node)}
                  className="text-green-500 hover:text-green-700 p-1"
                  title="Edit menu"
                >
                  <Edit2 size={14} />
                </button>
                {(!node.children || node.children.length === 0) && (
                <button
                onClick={() => handleDelete(node)}
                className="text-red-500 hover:text-red-700 p-1"
                title="Delete menu"
                >
                <Trash2 size={14} />
                </button>
            )}
              </>
            </div>
          </div>

          {/* Child nodes */}
          {expanded[node.id] && node.children && node.children.length > 0 && (
            <div className="ml-4 border-l border-gray-200 pl-2">
              {renderTree(node.children, depth + 1)}
            </div>
          )}
        </li>
      ))}
    </ul>
  );

  return (
    <div className="p-3">
      {/* Header */}
      <div className="flex justify-between items-center mb-3">
        <h2 className="font-semibold text-gray-700">Menu Tree</h2>
        <div className="flex gap-2">
          <button
            onClick={expandAll}
            className="text-sm px-3 py-1 rounded-full bg-gray-900 text-white hover:bg-gray-800 transition"
          >
            Expand All
          </button>
          <button
            onClick={collapseAll}
            className="text-sm px-3 py-1 rounded-full border border-gray-300 hover:bg-gray-100 transition"
          >
            Collapse All
          </button>
        </div>
      </div>

      {/* Tree structure */}
      <div className="text-gray-700 text-sm">{renderTree(treeData)}</div>

      {/* Modal Create/Edit */}
      {formMode && selectedNode && (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50">
          <div className="bg-white rounded-xl shadow-lg w-[400px] p-4">
            <h3 className="font-semibold text-lg mb-3">
              {formMode === "create" ? "Add Submenu" : "Edit Menu"}
            </h3>

           <MenuForm
            formMode={formMode}  
            initialData={
                formMode === "edit"
                ? {
                    menuId: selectedNode.id,
                    name: selectedNode.name,
                    parentData: selectedNode.parent_name,
                    depth: selectedNode.depth,
                    }
                : {
                    parentData: selectedNode.name,
                    parentId: selectedNode.id,
                    }
            }
            onSubmit={(values) => {
                if (formMode === "create") onCreate(selectedNode, values);
                if (formMode === "edit") onEdit(selectedNode, values);
                setFormMode(null);
            }}
            />


            <div className="flex justify-end mt-3">
              <button
                onClick={() => setFormMode(null)}
                className="px-3 py-1 text-sm border border-gray-300 rounded-lg hover:bg-gray-100"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
