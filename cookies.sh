http --session=./foo.json "httpbin.org/cookies/set?username=foo"
http --session=./foo.json "https://httpbin.org/cookies/set/page/1"

pageFoo=$(jq --raw-output '.cookies.page.value//empty' foo.json)
echo "=======Foo Page======="
http "jsonplaceholder.typicode.com/posts?_page=$pageFoo&_limit=1"

http --session=./foo.json "https://httpbin.org/cookies/set/page/2"
pageFoo=$(jq --raw-output '.cookies.page.value//empty' foo.json)
echo "=======Foo Page======="
http "jsonplaceholder.typicode.com/posts?_page=$pageFoo&_limit=1"

http --session=./bar.json "httpbin.org/cookies/set?username=bar"
http --session=./bar.json "https://httpbin.org/cookies/set/page/3"
pageBar=$(jq --raw-output '.cookies.page.value//empty' bar.json)

echo "=======Foo Page======="
http "jsonplaceholder.typicode.com/posts?_page=$pageFoo&_limit=1"

echo "=======Bar Page======="
http "jsonplaceholder.typicode.com/posts?_page=$pageBar&_limit=1"

http --session=./bar.json "https://httpbin.org/cookies/set/page/4"
pageBar=$(jq --raw-output '.cookies.page.value//empty' bar.json)

echo "=======Foo Page======="
http "jsonplaceholder.typicode.com/posts?_page=$pageFoo&_limit=1"

echo "=======Bar Page======="
http "jsonplaceholder.typicode.com/posts?_page=$pageBar&_limit=1"
