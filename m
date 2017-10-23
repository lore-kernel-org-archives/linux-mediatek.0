From: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 2/2] mtd: nand: mtk: fix infinite ECC decode IRQ issue
Date: Mon, 23 Oct 2017 16:21:37 +0800
Message-ID: <1508746897-62291-3-git-send-email-xiaolei.li@mediatek.com>
References: <1508746897-62291-1-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1508746897-62291-1-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

For MT2701 NAND Controller, there may generate infinite ECC decode IRQ
during long time burn test on some platforms. Once this issue occurred,
the ECC decode IRQ status cannot be cleared in the IRQ handler function,
and threads cannot be scheduled.

ECC HW generates decode IRQ each sector, so there will have more than one
decode IRQ if read one page of large page NAND.

Currently, ECC IRQ handle flow is that we will check whether it is decode
IRQ at first by reading the register ECC_DECIRQ_STA. This is a read-clear
type register. If this IRQ is decode IRQ, then the ECC IRQ signal will be
cleared at the same time.
Secondly, we will check whether all sectors are decoded by reading the
register ECC_DECDONE. This is because the current IRQ may be not dealed
in time, and the next sectors have been decoded before reading the
register ECC_DECIRQ_STA. Then, the next sectors's decode IRQs will not
be generated.
Thirdly, if all sectors are decoded by comparing with ecc->sectors, then we
will complete ecc->done, set ecc->sectors as 0, and disable ECC IRQ by
programming the register ECC_IRQ_REG(op) as 0. Otherwise, wait for the
next ECC IRQ.

But, there is a timing issue between step one and two. When we read the
reigster ECC_DECIRQ_STA, all sectors are decoded except the last sector,
and the ECC IRQ signal is cleared. But the last sector is decoded before
reading ECC_DECDONE, so the ECC IRQ signal is enabled again by ECC HW, and
it means we will receive one extra ECC IRQ later. In step three, we will
find that all sectors were decoded, then disable ECC IRQ and return.
When deal with the extra ECC IRQ, the ECC IRQ status cannot be cleared
anymore. That is because the register ECC_DECIRQ_STA can only be cleared
when the register ECC_IRQ_REG(op) is enabled. But actually we have
disabled ECC IRQ in the previous ECC IRQ handle. So, there will
keep receiving ECC decode IRQ.

Now, we read the register ECC_DECIRQ_STA once again before completing the
ecc done event. This ensures that there will be no extra ECC decode IRQ.

MT2712 ECC HW is designed to generate only one decode IRQ each page, so
there is no this problem on MT2712 platforms.

Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/mtd/nand/mtk_ecc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index 82aa6f2..0e04323 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -115,6 +115,11 @@ static irqreturn_t mtk_ecc_irq(int irq, void *id)
 		op = ECC_DECODE;
 		dec = readw(ecc->regs + ECC_DECDONE);
 		if (dec & ecc->sectors) {
+			/**
+			 * Clear decode IRQ status once again to ensure that
+			 * there will be no extra IRQ.
+			 */
+			dec = readw(ecc->regs + ECC_DECIRQ_STA);
 			ecc->sectors = 0;
 			complete(&ecc->done);
 		} else {
-- 
1.9.1
