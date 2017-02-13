From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH v3] arm64: use is_vmalloc_addr
Date: Mon, 13 Feb 2017 20:58:35 +0800
Message-ID: <1486990715-2551-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Use is_vmalloc_addr() to check if an address is a vmalloc address
instead of checking VMALLOC_START and VMALLOC_END manually.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 arch/arm64/mm/ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
index 01e88c8..c4c8cd4 100644
--- a/arch/arm64/mm/ioremap.c
+++ b/arch/arm64/mm/ioremap.c
@@ -88,7 +88,7 @@ void __iounmap(volatile void __iomem *io_addr)
 	 * We could get an address outside vmalloc range in case
 	 * of ioremap_cache() reusing a RAM mapping.
 	 */
-	if (VMALLOC_START <= addr && addr < VMALLOC_END)
+	if (is_vmalloc_addr((void *)addr))
 		vunmap((void *)addr);
 }
 EXPORT_SYMBOL(__iounmap);
-- 
1.9.1
