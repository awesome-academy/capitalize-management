console.log('Hello World from Webpacker')
var componentRequireContext = require.context('components', true);
var ReactRailsUJS = require('react_ujs');

import 'bootstrap/dist/css/bootstrap'
import 'mdi/css/materialdesignicons.min'
import 'flag-icon-css/css/flag-icon.min.css'
import 'perfect-scrollbar/css/perfect-scrollbar'

require('jquery');
require('popper.js');
require('bootstrap');
require('perfect-scrollbar');

ReactRailsUJS.useContext(componentRequireContext);
window.jQuery = $;
window.$ = $;