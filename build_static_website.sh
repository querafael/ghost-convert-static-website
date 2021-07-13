./download_localhost.sh $ghost_server_domain
echo

./replace_query_hash_filename.sh
echo

./replace_query_hash_entities.sh
echo

./replace_http_with_https.sh
echo

./replace_localhost_with_live_site.sh $ghost_server_domain $ghost_live_domain
echo

./replace_index_html_with_root.sh
echo