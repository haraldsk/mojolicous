use Mojolicious::Lite;

app->config(hypnotoad => {listen => ['http://*:80']});

get '/' => {text => 'Hello Wor...ALL GLORY TO THE HYPNOTOAD!'};

app->start;
