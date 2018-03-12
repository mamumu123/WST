#! /usr/bin/perl -w

## prints out all the values of an HTML form

use CGI;
$q = new CGI;

print $q->header,
      $q->start_html(-title  =>'Dump CGI',
                     -bgcolor=>'white'),
      $q->h1("Show Form Elements"),
      "In a most unexciting fashion but hey ..",
      $q->br(),
      $q->Dump(),
      $q->end_html;