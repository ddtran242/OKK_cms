<?php
namespace Api\Model\Entity;

use Cake\ORM\Entity;

/**
 * Admin Entity.
 *
 * @property int $admin_id
 * @property \App\Model\Entity\Admin $admin
 * @property string $login_id
 * @property string $password
 * @property string $admin_name
 * @property string $role
 * @property \Cake\I18n\Time $created
 * @property \Cake\I18n\Time $updated
 */
class Admin extends Entity
{

    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        '*' => false,
        'admin_id' => false,
    ];
}
