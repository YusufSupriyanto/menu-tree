<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Services\MenuService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class MenuController extends Controller
{
    protected $service;

    public function __construct(MenuService $service)
    {
        $this->service = $service;
    }

    public function index()
    {
        $menus = $this->service->getMenuTree();
        return Inertia::render('Menus/index', ['menus' => $menus]);
    }

    public function store(Request $request)
    {

        $data = $request->validate([
            'name' => 'required|string|max:255',
            'parent_id' => 'nullable|uuid|exists:menus,id',
            'depth' => 'required|integer'
        ]);


        try {

            $this->service->createMenu($data);
            return redirect()->back()->with('success', 'Menu created successfully.');
        } catch (\Exception $e) {
            dd($e->getMessage());
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    public function update(Request $request, Menu $menu)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255'
        ]);

        try {

            $this->service->updateMenu($menu, $data);
            return redirect()->back()->with('success', 'Menu updated successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    public function delete(Menu $menu)
    {
        try {

            $this->service->deleteMenu($menu);
            return redirect()->back()->with('success', 'Menu deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}