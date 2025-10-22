import { useState } from "react";
import {
  Folder,
  LayoutGrid,
  Users,
  Network,
  Menu as MenuIcon,
  ChevronDown,
  ChevronRight,
} from "lucide-react";
import logo from "@/assets/logo.png";

export default function MenuSidebar() {
  const [activeMenu, setActiveMenu] = useState("Menus");
  const [collapsed, setCollapsed] = useState(false);
  const [openDropdown, setOpenDropdown] = useState(null);

  const menus = [
    {
      title: "Systems",
      icon: <Folder size={18} />,
      children: [
        { title: "System Code", icon: <LayoutGrid size={16} /> },
        { title: "Properties", icon: <LayoutGrid size={16} /> },
        { title: "Menus", icon: <LayoutGrid size={16} /> },
        { title: "API List", icon: <Network size={16} /> },
      ],
    },
    {
      title: "Users & Group",
      icon: <Users size={18} />,
    },
    {
      title: "Competition",
      icon: <Folder size={18} />,
    },
  ];

  const toggleDropdown = (menuTitle) => {
    setOpenDropdown(openDropdown === menuTitle ? null : menuTitle);
  };

  return (
    <aside
      className={`${
        collapsed ? "w-20" : "w-56"
      } bg-blue-800 text-white min-h-screen flex flex-col transition-all duration-300 rounded-xl`}
    >
      {/* Header */}
      <div className="flex items-center justify-between px-4 py-4 border-b border-blue-700">
        {!collapsed && (
          <img src={logo} alt="Logo" className="w-[70px] object-scale-down" />
        )}
        <button
          onClick={() => setCollapsed(!collapsed)}
          className="text-white hover:text-blue-200"
        >
          <MenuIcon size={20} />
        </button>
      </div>

      {/* Menu Items */}
      <nav className="flex-1 mt-4 space-y-1 px-2">
        {menus.map((menu) => (
          <div key={menu.title}>
            {/* Main Menu */}
            <button
              onClick={() =>
                menu.children
                  ? toggleDropdown(menu.title)
                  : setActiveMenu(menu.title)
              }
              className={`flex items-center justify-between w-full text-sm font-semibold px-2 py-2 rounded-lg transition-all duration-200
                ${
                  activeMenu === menu.title
                    ? "bg-blue-600 text-white"
                    : "text-blue-100 hover:bg-blue-700"
                }`}
            >
              <div className="flex items-center gap-2">
                {menu.icon}
                {!collapsed && <span>{menu.title}</span>}
              </div>
              {!collapsed && menu.children && (
                <span>
                  {openDropdown === menu.title ? (
                    <ChevronDown size={16} />
                  ) : (
                    <ChevronRight size={16} />
                  )}
                </span>
              )}
            </button>

            {/* Submenus */}
            {!collapsed && menu.children && (
              <div
                className={`transition-all duration-300 overflow-hidden ${
                  openDropdown === menu.title
                    ? "max-h-96 opacity-100"
                    : "max-h-0 opacity-0"
                }`}
              >
                {menu.children.map((child) => (
                  <button
                    key={child.title}
                    onClick={() => setActiveMenu(child.title)}
                    className={`flex items-center gap-2 w-full px-2 py-1 rounded-lg text-sm transition-all duration-200
                      ${
                        activeMenu === child.title
                          ? "bg-blue-600 text-white"
                          : "text-blue-100 hover:bg-blue-700 hover:text-white"
                      }`}
                  >
                    <div className="flex items-center gap-2 pl-[2px]">
                      {child.icon}
                      {!collapsed && <span>{child.title}</span>}
                    </div>
                  </button>
                ))}
              </div>
            )}
          </div>
        ))}
      </nav>
    </aside>
  );
}
