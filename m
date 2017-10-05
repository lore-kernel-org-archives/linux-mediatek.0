From: <miles.chen@mediatek.com>
Subject: [PATCH] mm/slob: remove an unnecessary check for __GFP_ZERO
Date: Thu, 5 Oct 2017 19:32:21 +0800
Message-ID: <1507203141-11959-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <owner-linux-mm@kvack.org>
Sender: owner-linux-mm@kvack.org
To: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, Miles Chen <miles.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Miles Chen <miles.chen@mediatek.com>

Current flow guarantees a valid pointer when handling
the __GFP_ZERO case. So remove the unnecessary NULL pointer
check.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 mm/slob.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slob.c b/mm/slob.c
index a8bd6fa..a72649c 100644
--- a/mm/slob.c
+++ b/mm/slob.c
@@ -329,7 +329,7 @@ static void *slob_alloc(size_t size, gfp_t gfp, int align, int node)
 		BUG_ON(!b);
 		spin_unlock_irqrestore(&slob_lock, flags);
 	}
-	if (unlikely((gfp & __GFP_ZERO) && b))
+	if (unlikely(gfp & __GFP_ZERO))
 		memset(b, 0, size);
 	return b;
 }
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
