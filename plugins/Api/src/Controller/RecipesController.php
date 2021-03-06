<?php
namespace Api\Controller;

use Api\Controller\AppController;
use Cake\ORM\TableRegistry;

/**
 * Recipes Controller
 *
 * @property \Api\Model\Table\RecipesTable $Recipes
 */
class RecipesController extends AppController
{

    /**
     * Index method
     *
     * @return void
     */
    public function index()
    {
        /*$this->set('recipes', $this->paginate($this->Recipes));
        $this->set('_serialize', ['recipes']);*/

        $adminTable = TableRegistry::get('Api.Admin');
        //debug($adminTable);die();
        $admins = $adminTable->find();
        $result = array(
            'status' => 200,
            'message' => 'success',
            'data' => [
                'admin' => $admins
            ]
        );

        $this->set(['result' => $result, '_serialize' => ['result']]);
    }

    /**
     * View method
     *
     * @param string|null $id Recipe id.
     * @return void
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function view($id = null)
    {
        $recipe = $this->Recipes->get($id, [
            'contain' => []
        ]);
        $this->set('recipe', $recipe);
        $this->set('_serialize', ['recipe']);
    }

    /**
     * Add method
     *
     * @return void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $recipe = $this->Recipes->newEntity();
        if ($this->request->is('post')) {
            $recipe = $this->Recipes->patchEntity($recipe, $this->request->data);
            if ($this->Recipes->save($recipe)) {
                $this->Flash->success(__('The recipe has been saved.'));
                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The recipe could not be saved. Please, try again.'));
            }
        }
        $this->set(compact('recipe'));
        $this->set('_serialize', ['recipe']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Recipe id.
     * @return void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $recipe = $this->Recipes->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $recipe = $this->Recipes->patchEntity($recipe, $this->request->data);
            if ($this->Recipes->save($recipe)) {
                $this->Flash->success(__('The recipe has been saved.'));
                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The recipe could not be saved. Please, try again.'));
            }
        }
        $this->set(compact('recipe'));
        $this->set('_serialize', ['recipe']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Recipe id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $recipe = $this->Recipes->get($id);
        if ($this->Recipes->delete($recipe)) {
            $this->Flash->success(__('The recipe has been deleted.'));
        } else {
            $this->Flash->error(__('The recipe could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'index']);
    }
}
