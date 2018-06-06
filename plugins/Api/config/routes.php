<?php
use Cake\Routing\Router;

Router::plugin('Api', function ($routes) {

    $routes->extensions(['json', 'xml']);
    $routes->resources('Recipes');

    $routes->fallbacks('DashedRoute');
});
