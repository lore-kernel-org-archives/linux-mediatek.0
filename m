From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 05/11] arm: mediatek: force type of mtk_smp_base
Date: Tue,  8 Oct 2019 13:34:47 +0100
Message-ID: <20191008123453.1651-5-ben.dooks@codethink.co.uk>
References: <20191008123453.1651-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191008123453.1651-1-ben.dooks@codethink.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@lists.codethink.co.uk, Matthias Brugger <matthias.bgg@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

In __mtk_smp_prepare_cpus force the return of phys_to_virt()
to have __iomem on it to avoid the following sparse warning:

arch/arm/mach-mediatek/platsmp.c:105:30: warning: incorrect type in assignment (different address spaces)
arch/arm/mach-mediatek/platsmp.c:105:30:    expected void [noderef] <asn:2> *static [toplevel] mtk_smp_base
arch/arm/mach-mediatek/platsmp.c:105:30:    got void *

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
---
 arch/arm/mach-mediatek/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index 16a4ee6c9590..3717b960618d 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -102,7 +102,7 @@ static void __init __mtk_smp_prepare_cpus(unsigned int max_cpus, int trustzone)
 
 	if (trustzone) {
 		/* smp_base(trustzone-bootinfo) is reserved by device tree */
-		mtk_smp_base = phys_to_virt(mtk_smp_info->smp_base);
+		mtk_smp_base = (void __force __iomem *)phys_to_virt(mtk_smp_info->smp_base);
 	} else {
 		mtk_smp_base = ioremap(mtk_smp_info->smp_base, MTK_SMP_REG_SIZE);
 		if (!mtk_smp_base) {
-- 
2.23.0
