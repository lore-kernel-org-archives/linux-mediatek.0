From: John Crispin <blogic@openwrt.org>
Subject: [PATCH V5 07/11] soc: mediatek: PMIC wrap: move wdt_src into the
 pmic_wrapper_type struct
Date: Sun,  7 Feb 2016 11:42:54 +0100
Message-ID: <1454841778-35529-8-git-send-email-blogic@openwrt.org>
References: <1454841778-35529-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1454841778-35529-1-git-send-email-blogic@openwrt.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Steven Liu <steven.liu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org

Make the handling of wdt_src consitent with the rest of the code.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 1653e64..7193d04 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -373,6 +373,7 @@ struct pmic_wrapper_type {
 	u32 arb_en_all;
 	u32 int_en_all;
 	u32 spi_w;
+	u32 wdt_src;
 	int (*init_reg_clock)(struct pmic_wrapper *wrp);
 	int (*init_special)(struct pmic_wrapper *wrp);
 };
@@ -829,6 +830,7 @@ static struct pmic_wrapper_type pwrap_mt8135 = {
 	.arb_en_all = 0x1ff,
 	.int_en_all = ~(BIT(31) | BIT(1)),
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
 	.init_reg_clock = pwrap_mt8135_init_reg_clock,
 	.init_special = pwrap_mt8135_init_special,
 };
@@ -839,6 +841,7 @@ static struct pmic_wrapper_type pwrap_mt8173 = {
 	.arb_en_all = 0x3f,
 	.int_en_all = ~(BIT(31) | BIT(1)),
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_NO_STAUPD,
 	.init_reg_clock = pwrap_mt8173_init_reg_clock,
 	.init_special = pwrap_mt8173_init_special,
 };
@@ -858,7 +861,7 @@ MODULE_DEVICE_TABLE(of, of_pwrap_match_tbl);
 
 static int pwrap_probe(struct platform_device *pdev)
 {
-	int ret, irq, wdt_src;
+	int ret, irq;
 	struct pmic_wrapper *wrp;
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *of_id =
@@ -948,9 +951,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	 * Since STAUPD was not used on mt8173 platform,
 	 * so STAUPD of WDT_SRC which should be turned off
 	 */
-	wdt_src = pwrap_is_mt8173(wrp) ?
-			PWRAP_WDT_SRC_MASK_NO_STAUPD : PWRAP_WDT_SRC_MASK_ALL;
-	pwrap_writel(wrp, wdt_src, PWRAP_WDT_SRC_EN);
+	pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN);
 	pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
 	pwrap_writel(wrp, wrp->master->int_en_all, PWRAP_INT_EN);
 
-- 
1.7.10.4
