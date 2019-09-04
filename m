From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: [PATCH 2/2] mm/page_owner: determine the last stack state of page with CONFIG_KASAN_DUMP_PAGE=y
Date: Wed, 4 Sep 2019 14:57:36 +0800
Message-ID: <20190904065736.20736-1-walter-zh.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@suse.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Walter Wu <walter-zh.wu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

When enable CONFIG_KASAN_DUMP_PAGE, then page_owner will record last stack,
So we need to know the last stack is allocation or free state.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
---
 mm/page_owner.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index addcbb2ae4e4..2756adca250e 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -418,6 +418,12 @@ void __dump_page_owner(struct page *page)
 	nr_entries = stack_depot_fetch(handle, &entries);
 	pr_alert("page allocated via order %u, migratetype %s, gfp_mask %#x(%pGg)\n",
 		 page_owner->order, migratetype_names[mt], gfp_mask, &gfp_mask);
+#ifdef CONFIG_KASAN_DUMP_PAGE
+	if ((unsigned long)page->flags & PAGE_FLAGS_CHECK_AT_PREP)
+		pr_info("Allocation stack of page:\n");
+	else
+		pr_info("Free stack of page:\n");
+#endif
 	stack_trace_print(entries, nr_entries, 0);
 
 	if (page_owner->last_migrate_reason != -1)
-- 
2.18.0
