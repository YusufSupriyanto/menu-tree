import { useState } from "react";


export default function MenuForm({ initialData = {}, onSubmit, formMode }) {
  const [formData, setFormData] = useState({
    id: initialData.menuId || "",
    depth: initialData.depth || "",
    parentData: initialData.parentData || "",
    parent_id: initialData.parentId || "",
    name: initialData.name || "",
  });



  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (onSubmit) onSubmit(formData);
  };

  return (
    <form
      onSubmit={handleSubmit}
      className="max-w-sm mx-auto p-6 bg-white rounded-2xl shadow-md space-y-4"
    >
      <div>
        <label className="block text-sm font-medium text-gray-600 mb-1">
          Menu ID
        </label>
        <input
          type="text"
          name="menuId"
          value={formData.id}
          readOnly
          onChange={handleChange}
          className="w-full bg-gray-100 border border-gray-200 text-gray-700 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
          placeholder="Enter menu ID"
        />
      </div>

      <div>
        <label className="block text-sm font-medium text-gray-600 mb-1">
          Depth
        </label>
            <input
        type="number"
        name="depth"
        disabled={formMode === "edit"}
        value={formData.depth}
        onChange={handleChange}
        readOnly
        className={`w-full bg-gray-100 border border-gray-200 text-gray-700 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500`}
        placeholder="Enter depth"
        />
      </div>

      <div>
        <label className="block text-sm font-medium text-gray-600 mb-1">
          Parent Data
        </label>
        <input
          type="text"
          name="parentData"
          value={formData.parentData}
          readOnly
          onChange={handleChange}
          className="w-full bg-gray-100 border border-gray-200 text-gray-700 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
          placeholder="Enter parent data"
        />
        <input
          type="hidden"
          name="parentId"
          value={formData.parent_id}
          onChange={handleChange}
        />
      </div>

      <div>
        <label className="block text-sm font-medium text-gray-600 mb-1">
          Name
        </label>
        <input
          type="text"
          name="name"
          value={formData.name}
          onChange={handleChange}
          className="w-full bg-gray-50 border border-gray-200 text-gray-700 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
          placeholder="Enter name"
        />
      </div>

      <button
        type="submit"
        className="w-full bg-blue-700 hover:bg-blue-800 text-white font-semibold py-2 rounded-full transition-colors"
      >
        Save
      </button>
    </form>
  );
}
