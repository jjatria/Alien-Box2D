# t/002_config.t - test config() functionality

use Test::More tests => 3;
use Alien::Box2D;

### test some config strings
like( Alien::Box2D->version,  qr/([0-9]+\.)*[0-9]+/, 'Testing ->version' );
like( Alien::Box2D->dist_dir, qr/.+/,                'Testing ->dist_dir' );

is( (-d Alien::Box2D->dist_dir), 1, 'Testing existence of install directory' );

diag 'VERSION=' . Alien::Box2D->version;
diag 'PREFIX='  . Alien::Box2D->dist_dir;
diag 'CFLAGS='  . Alien::Box2D->cflags;
diag 'LIBS='    . Alien::Box2D->libs;
