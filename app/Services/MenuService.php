<?php

namespace App\Services;

use App\Models\Menu;
use App\Repositories\MenuRepository;

class MenuService
{
    protected $repo;

    public function __construct(MenuRepository $repo)
    {
        $this->repo = $repo;
    }

    public function getMenuTree()
    {
        return $this->repo->getAll();
    }

    public function createMenu(array $data)
    {
        if (!empty($data['parent_id'])) {
            $parent = Menu::find($data['parent_id']);
            $data['depth'] = $parent ? $parent->depth + 1 : 1;
        } else {
            $data['depth'] = 1;
        }

        return $this->repo->create($data);
    }

    public function updateMenu(Menu $menu, array $data)
    {
        return $this->repo->update($menu, $data);
    }

    public function deleteMenu(Menu $menu)
    {
        return $this->repo->delete($menu);
    }
}