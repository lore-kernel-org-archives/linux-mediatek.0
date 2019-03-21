From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] arm64: setup min_low_pfn
Date: Thu, 21 Mar 2019 12:21:25 +0800
Message-ID: <1553142085-5800-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

When debugging with CONFIG_PAGE_OWNER, I noticed that the min_low_pfn
on arm64 is always zero and the page owner scanning has to start from zero.
We have to loop a while before we see the first valid pfn.
(see: read_page_owner())

Setup min_low_pfn to save some loops.

Before setting min_low_pfn:

[   21.265602] min_low_pfn=0, *ppos=0
Page allocated via order 0, mask 0x100cca(GFP_HIGHUSER_MOVABLE)
PFN 262144 type Movable Block 512 type Movable Flags 0x8001e
referenced|uptodate|dirty|lru|swapbacked)
prep_new_page+0x13c/0x140
get_page_from_freelist+0x254/0x1068
__alloc_pages_nodemask+0xd4/0xcb8

After setting min_low_pfn:

[   11.025787] min_low_pfn=262144, *ppos=0
Page allocated via order 0, mask 0x100cca(GFP_HIGHUSER_MOVABLE)
PFN 262144 type Movable Block 512 type Movable Flags 0x8001e
referenced|uptodate|dirty|lru|swapbacked)
prep_new_page+0x13c/0x140
get_page_from_freelist+0x254/0x1068
__alloc_pages_nodemask+0xd4/0xcb8
shmem_alloc_page+0x7c/0xa0
shmem_alloc_and_acct_page+0x124/0x1e8
shmem_getpage_gfp.isra.7+0x118/0x878
shmem_write_begin+0x38/0x68

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 arch/arm64/mm/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 6bc135042f5e..3dbd0c5ce780 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -440,6 +440,7 @@ void __init bootmem_init(void)
 	early_memtest(min << PAGE_SHIFT, max << PAGE_SHIFT);
 
 	max_pfn = max_low_pfn = max;
+	min_low_pfn = min;
 
 	arm64_numa_init();
 	/*
-- 
2.18.0
