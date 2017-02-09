From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] arm64: use is_vmalloc_addr
Date: Thu, 9 Feb 2017 10:20:07 +0800
Message-ID: <1486606807-32097-1-git-send-email-miles.chen@mediatek.com>
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

To is_vmalloc_addr() to check if an address is a vmalloc address
instead of checking VMALLOC_START and VMALLOC_END manually.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 arch/arm64/mm/ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
index 01e88c8..71d6b04 100644
--- a/arch/arm64/mm/ioremap.c
+++ b/arch/arm64/mm/ioremap.c
@@ -88,7 +88,7 @@ void __iounmap(volatile void __iomem *io_addr)
 	 * We could get an address outside vmalloc range in case
 	 * of ioremap_cache() reusing a RAM mapping.
 	 */
-	if (VMALLOC_START <= addr && addr < VMALLOC_END)
+	if (is_vmalloc_addr(addr))
 		vunmap((void *)addr);
 }
 EXPORT_SYMBOL(__iounmap);
-- 
1.9.1
