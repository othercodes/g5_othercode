<?php
/**
 * @package   Gantry 5 Theme
 * @author    RocketTheme http://www.rockettheme.com
 * @copyright Copyright (C) 2007 - 2017 RocketTheme, LLC
 * @license   GNU/GPLv2 and later
 *
 * http://www.gnu.org/licenses/gpl-2.0.html
 */

defined('_JEXEC') or die;

// Bootstrap Gantry framework or fail gracefully (inside included file).
$gantry = include __DIR__ . '/includes/gantry.php';

/** @var \Gantry\Framework\Theme $theme */
$theme = $gantry['theme'];

$context = array(
    'errorcode' => isset($this->error) ? $this->error->getCode() : null,
    'error' => isset($this->error) ? $this->error->getMessage() : null,
    'debug' => $app->get('debug_lang', '0') == '1' || $app->get('debug', '0') == '1',
    'backtrace' => $this->debug ? $this->renderBacktrace() : null
);

// Reset used outline configuration.
unset($gantry['configuration']);

$layout = '_error';

/**
 * Small operation to search layouts with the http status
 * code as name, this allow us to create a outline named
 * 404 so this outline will be displayed automatically on
 * http 404 status instead of the normal error one.
 */
foreach ($gantry['outlines']->all() as $name => $title) {
    if ($context['errorcode'] == $title) {
        $layout = $name;
        break;
    }
}

// Render the page.
echo $theme
    ->setLayout($layout, true)
    ->render('error.html.twig', $context);
