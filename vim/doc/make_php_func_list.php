<?php
$funcs = get_defined_functions();
sort($funcs['internal']);
foreach($funcs['internal'] as $func)
{
    error_log($func."\n", 3, "php_func_list.txt");
}
