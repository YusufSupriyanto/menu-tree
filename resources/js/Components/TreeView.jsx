export default function TreeView({ data }) {
  return (
    <ul className="ml-4 border-l pl-3">
      {data.map((item) => (
        <li key={item.id} className="py-1">
          <div className="flex items-center justify-between">
            <span>{item.name}</span>
          </div>
          {item.children?.length > 0 && <TreeView data={item.children} />}
        </li>
      ))}
    </ul>
  );
}
