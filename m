From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] mm/page_owner: fix incorrect looping in __set_page_owner_handle()
Date: Fri, 4 Oct 2019 15:37:55 +0800
Message-ID: <20191004073755.3228-1-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>, Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>
List-Id: linux-mediatek@lists.infradead.org

In __set_page_owner_handle(), we should loop over page
[0...(1 << order) - 1] and setup their page_owner structures.

Currently, __set_page_owner_handle() update page_ext at the end of
the loop, sets the page_owner of (page + 0) twice and
misses the page_owner of (page + (1 << order) - 1).

Fix it by updating the page_ext at the start of the loop.

In i == 0 case:
for (i = 0; i < (1 << order); i++) {
	page_owner = get_page_owner(page_ext); <- page_ext belongs to page + 0
	...
	page_ext = lookup_page_ext(page + i); <- lookup_page_ext(page + 0)
}

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Michal Hocko <mhocko@suse.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
Fixes: 7e2f2a0cd17c ("mm, page_owner: record page owner for each subpage")
---
 mm/page_owner.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index dee931184788..110c3e1987f2 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -178,6 +178,7 @@ static inline void __set_page_owner_handle(struct page *page,
 	int i;
 
 	for (i = 0; i < (1 << order); i++) {
+		page_ext = lookup_page_ext(page + i);
 		page_owner = get_page_owner(page_ext);
 		page_owner->handle = handle;
 		page_owner->order = order;
@@ -185,8 +186,6 @@ static inline void __set_page_owner_handle(struct page *page,
 		page_owner->last_migrate_reason = -1;
 		__set_bit(PAGE_EXT_OWNER, &page_ext->flags);
 		__set_bit(PAGE_EXT_OWNER_ACTIVE, &page_ext->flags);
-
-		page_ext = lookup_page_ext(page + i);
 	}
 }
 
-- 
2.18.0
