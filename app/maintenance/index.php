<?php
if ( file_exists( $custom_index = dirname( __FILE__ ) . '/custom-index.php' ) ) {
        require $custom_index;
} else {
        echo 'This website is currently under scheduled maintenance.';
}
