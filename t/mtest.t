use Test::More tests => 23;

use strict;
use warnings;

use Math::Matlab::Engine;

my $ep = Math::Matlab::Engine->new;
ok($ep->PutMatrix('N',2,3,[1,2,3,4,5,6]));
my $n;
ok($n=$ep->GetMatrix('N'));
ok($n->[0]->[0],1);
ok($n->[0]->[1],2);
ok($n->[0]->[2],3);
ok($n->[1]->[0],4);
ok($n->[1]->[1],5);
ok($n->[1]->[2],6);

ok($ep->PutMatrix('E1',3,1,[1,0,0]));
ok($ep->PutMatrix('E2',3,1,[0,1,0]));
ok($ep->PutMatrix('E3',3,1,[0,0,1]));

ok($ep->EvalString("N1=N*E1"));
ok($ep->EvalString("N2=N*E2"));
ok($ep->EvalString("N3=N*E3"));

my $n1 = $ep->GetMatrix('N1');
ok($n1->[0]->[0],1);
ok(!defined($n1->[0]->[1]));
ok($n1->[1]->[0],4);

my $n2 = $ep->GetMatrix('N2');
ok($n2->[0]->[0],2);
ok(!defined($n2->[0]->[1]));
ok($n2->[1]->[0],5);

my $n3 = $ep->GetMatrix('N3');
ok($n3->[0]->[0],3);
ok(!defined($n3->[0]->[1]));
ok($n3->[1]->[0],6);

$ep->Close;

done_testing;
