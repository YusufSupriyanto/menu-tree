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
import { Link, usePage } from "@inertiajs/react"; // Import Link dari Inertia
import logo from "@/assets/logo.png";

export default function MenuSidebar() {
  const [collapsed, setCollapsed] = useState(false);
  const [openDropdown, setOpenDropdown] = useState(null);

  // Ambil URL aktif dari Inertia
  const { url } = usePage();

  const menus = [
    {
      title: "Systems",
      icon: <Folder size={18} />,
      children: [
        { title: "System Code", icon: <LayoutGrid size={16} />, link: "/systems/code" },
        { title: "Properties", icon: <LayoutGrid size={16} />, link: "/systems/properties" },
        { title: "Menus", icon: <LayoutGrid size={16} />, link: "/menus" },
        { title: "API List", icon: <Network size={16} />, link: "/systems/apis" },
      ],
    },
    {
      title: "Users & Group",
      icon: <Users size={18} />,
      link: "/users",
    },
    {
      title: "Competition",
      icon: <Folder size={18} />,
      link: "/competition",
    },
  ];

  const toggleDropdown = (menuTitle) => {
    setOpenDropdown(openDropdown === menuTitle ? null : menuTitle);
  };

  // Fungsi bantu untuk cek apakah menu aktif
  const isActive = (path) => url.startsWith(path);

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
            {menu.children ? (
              <button
                onClick={() => toggleDropdown(menu.title)}
                className={`flex items-center justify-between w-full text-sm font-semibold px-2 py-2 rounded-lg transition-all duration-200
                  ${
                    openDropdown === menu.title
                      ? "bg-blue-600 text-white"
                      : "text-blue-100 hover:bg-blue-700"
                  }`}
              >
                <div className="flex items-center gap-2">
                  {menu.icon}
                  {!collapsed && <span>{menu.title}</span>}
                </div>
                {!collapsed && (
                  <span>
                    {openDropdown === menu.title ? (
                      <ChevronDown size={16} />
                    ) : (
                      <ChevronRight size={16} />
                    )}
                  </span>
                )}
              </button>
            ) : (
              //jika tidak punya children, jadikan link
              <Link
                href={menu.link}
                className={`flex items-center w-full text-sm font-semibold px-2 py-2 rounded-lg transition-all duration-200
                  ${
                    isActive(menu.link)
                      ? "bg-blue-600 text-white"
                      : "text-blue-100 hover:bg-blue-700"
                  }`}
              >
                <div className="flex items-center gap-2">
                  {menu.icon}
                  {!collapsed && <span>{menu.title}</span>}
                </div>
              </Link>
            )}

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
                  <Link
                    key={child.title}
                    href={child.link}
                    className={`flex items-center gap-2 w-full px-2 py-1 rounded-lg text-sm transition-all duration-200
                      ${
                        isActive(child.link)
                          ? "bg-blue-600 text-white"
                          : "text-blue-100 hover:bg-blue-700 hover:text-white"
                      }`}
                  >
                    <div className="flex items-center gap-2 pl-[2px]">
                      {child.icon}
                      {!collapsed && <span>{child.title}</span>}
                    </div>
                  </Link>
                ))}
              </div>
            )}
          </div>
        ))}
      </nav>
    </aside>
  );
}
