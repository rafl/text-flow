#!/usr/bin/perl

use strict;
use warnings;

use Test::More no_plan => 1;
use Test::LongString;

BEGIN {
    use_ok('Text::Flow::Wrap');
}

my $wrapper = Text::Flow::Wrap->new(
    check_width => sub { length($_[0]) < 70 },
);

my $orig_text = join "" => <DATA>;

is_string(
$wrapper->wrap($orig_text),
q{Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis 
lobortis nisl in ante. Vestibulum dignissim facilisis turpis. Nunc 
rutrum sapien sed eros. Donec facilisis placerat dui. Vestibulum 
ante ipsum primis in faucibus orci luctus et ultrices posuere 
cubilia Curae; Aenean convallis, urna eget mattis accumsan, dolor 
augue condimentum est, id aliquam pede eros eget metus.

Proin felis. Nam hendrerit velit et lorem. Nulla ac mauris in nibh 
ornare porta. Fusce sodales porta orci. Aenean dolor. Proin nec 
ligula non eros tristique interdum. Sed aliquet ipsum vel leo.

Cras a urna vel tortor molestie tincidunt. Aenean risus. Quisque 
luctus ipsum sit amet massa. Class aptent taciti sociosqu ad litora 
torquent per conubia nostra, per inceptos hymenaeos. Nam lacus 
mauris, sagittis volutpat, rutrum eget, commodo non, elit.}, 
'... the string wrapped successfully');

# shorten it ...
$wrapper->check_width(sub { length($_[0]) < 45 });

is_string(
$wrapper->wrap($orig_text),
q{Lorem ipsum dolor sit amet, consectetuer 
adipiscing elit. Duis lobortis nisl in 
ante. Vestibulum dignissim facilisis 
turpis. Nunc rutrum sapien sed eros. Donec 
facilisis placerat dui. Vestibulum ante 
ipsum primis in faucibus orci luctus et 
ultrices posuere cubilia Curae; Aenean 
convallis, urna eget mattis accumsan, dolor 
augue condimentum est, id aliquam pede eros 
eget metus.

Proin felis. Nam hendrerit velit et lorem. 
Nulla ac mauris in nibh ornare porta. Fusce 
sodales porta orci. Aenean dolor. Proin nec 
ligula non eros tristique interdum. Sed 
aliquet ipsum vel leo.

Cras a urna vel tortor molestie tincidunt. 
Aenean risus. Quisque luctus ipsum sit amet 
massa. Class aptent taciti sociosqu ad 
litora torquent per conubia nostra, per 
inceptos hymenaeos. Nam lacus mauris, 
sagittis volutpat, rutrum eget, commodo 
non, elit.}, 
'... the string wrapped successfully');

# shorten it again ...
$wrapper->check_width(sub { length($_[0]) < 25 });

is_string(
$wrapper->wrap($orig_text),
q{Lorem ipsum dolor sit 
amet, consectetuer 
adipiscing elit. Duis 
lobortis nisl in ante. 
Vestibulum dignissim 
facilisis turpis. Nunc 
rutrum sapien sed eros. 
Donec facilisis 
placerat dui. 
Vestibulum ante ipsum 
primis in faucibus orci 
luctus et ultrices 
posuere cubilia Curae; 
Aenean convallis, urna 
eget mattis accumsan, 
dolor augue condimentum 
est, id aliquam pede 
eros eget metus.

Proin felis. Nam 
hendrerit velit et 
lorem. Nulla ac mauris 
in nibh ornare porta. 
Fusce sodales porta 
orci. Aenean dolor. 
Proin nec ligula non 
eros tristique 
interdum. Sed aliquet 
ipsum vel leo.

Cras a urna vel tortor 
molestie tincidunt. 
Aenean risus. Quisque 
luctus ipsum sit amet 
massa. Class aptent 
taciti sociosqu ad 
litora torquent per 
conubia nostra, per 
inceptos hymenaeos. Nam 
lacus mauris, sagittis 
volutpat, rutrum eget, 
commodo non, elit.}, 
'... the string wrapped successfully');


__DATA__
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis lobortis nisl in ante. Vestibulum dignissim facilisis turpis. Nunc rutrum sapien sed eros. Donec facilisis placerat dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean convallis, urna eget mattis accumsan, dolor augue condimentum est, id aliquam pede eros eget metus. 
Proin felis. Nam hendrerit velit et lorem. Nulla ac mauris in nibh ornare porta. Fusce sodales porta orci. Aenean dolor. Proin nec ligula non eros tristique interdum. Sed aliquet ipsum vel leo. 
Cras a urna vel tortor molestie tincidunt. Aenean risus. Quisque luctus ipsum sit amet massa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Nam lacus mauris, sagittis volutpat, rutrum eget, commodo non, elit.