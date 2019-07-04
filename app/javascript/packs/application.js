console.log('Hello World from Webpacker')
var componentRequireContext = require.context('components', true);
var ReactRailsUJS = require('react_ujs');

require('jquery');
require('popper.js');
require('bootstrap');
require('perfect-scrollbar');
require('jquery-toast-plugin');

import 'bootstrap/dist/css/bootstrap'
import 'mdi/css/materialdesignicons.min'
import 'flag-icon-css/css/flag-icon.min.css'
import 'perfect-scrollbar/css/perfect-scrollbar'
import 'jquery-toast-plugin/dist/jquery.toast.min.css'

ReactRailsUJS.useContext(componentRequireContext);
window.jQuery = $;
window.$ = $;
