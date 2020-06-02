bundle exec middleman build --clean
sed 's/-H <span class="s2">"Host: example.org"<\/span> <span class="se">\\<\/span>/ /g' build/index.html > build/index_tmp.htm
sed 's/-H <span class="s2">"Cookie: "<\/span>/ /g' build/index_tmp.htm > build/index_tmp2.htm
sed 's/-H <span class="s2">"Content-Type: application\/json"<\/span> <span class="se">\\<\/span>/-H <span class="s2">"Content-Type: application\/json"<\/span>/g' build/index_tmp2.htm > build/index_tmp3.htm
sed 's/http:\/\/example.org\/download/https:\/\/www.opensubtitles.com\/download/g' build/index_tmp3.htm > build/index_tmp4.htm
sed '/^$/d' build/index_tmp4.htm > build/index.htm
rm build/index_tmp*	
rsync -av build/* ~/RailsProjects/osdb3/public/docs/api/html

