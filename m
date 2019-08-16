From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] shmem: fix obsolete comment in shmem_getpage_gfp()
Date: Fri, 16 Aug 2019 18:02:04 +0800
Message-ID: <20190816100204.9781-1-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hugh Dickins <hughd@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Replace "fault_mm" with "vmf" in code comment
because the commit cfda05267f7b ("userfaultfd: shmem: add userfaultfd
hook for shared memory faults") has changed the prototpye of
shmem_getpage_gfp() - pass vmf instead of fault_mm to the function.

Before:
static int shmem_getpage_gfp(struct inode *inode, pgoff_t index,
		struct page **pagep, enum sgp_type sgp,
		gfp_t gfp, struct mm_struct *fault_mm, int *fault_type);
After:
static int shmem_getpage_gfp(struct inode *inode, pgoff_t index,
		struct page **pagep, enum sgp_type sgp,
		gfp_t gfp, struct vm_area_struct *vma,
		struct vm_fault *vmf, vm_fault_t *fault_type);

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 2bed4761f279..fed9ebea316c 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1719,7 +1719,7 @@ static int shmem_swapin_page(struct inode *inode, pgoff_t index,
  * vm. If we swap it in we mark it dirty since we also free the swap
  * entry since a page cannot live in both the swap and page cache.
  *
- * fault_mm and fault_type are only supplied by shmem_fault:
+ * vmf and fault_type are only supplied by shmem_fault:
  * otherwise they are NULL.
  */
 static int shmem_getpage_gfp(struct inode *inode, pgoff_t index,
-- 
2.18.0
