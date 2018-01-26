From: <miles.chen@mediatek.com>
Subject: [PATCH] slub: remove obsolete comments of put_cpu_partial()
Date: Fri, 26 Jan 2018 20:09:10 +0800
Message-ID: <1516968550-1520-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <owner-linux-mm@kvack.org>
Sender: owner-linux-mm@kvack.org
To: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, Miles Chen <miles.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Miles Chen <miles.chen@mediatek.com>

The commit d6e0b7fa1186 ("slub: make dead caches discard free
slabs immediately") makes put_cpu_partial() run with preemption
disabled and interrupts disabled when calling unfreeze_partials().

The comment: "put_cpu_partial() is done without interrupts disabled
and without preemption disabled" looks obsolete, so remove it.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 mm/slub.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index cfd56e5a35fb..70447d39de90 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2220,9 +2220,7 @@ static void unfreeze_partials(struct kmem_cache *s,
 
 /*
  * Put a page that was just frozen (in __slab_free) into a partial page
- * slot if available. This is done without interrupts disabled and without
- * preemption disabled. The cmpxchg is racy and may put the partial page
- * onto a random cpus partial slot.
+ * slot if available.
  *
  * If we did not find a slot then simply move all the partials to the
  * per node partial list.
-- 
2.12.5

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
