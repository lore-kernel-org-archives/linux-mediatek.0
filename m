From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V2 3/4] soc: mediatek: PMIC wrap the SPI_W bit in
 PWRAP_MAN_CMD may vary
Date: Sun, 10 Jan 2016 17:04:43 +0100
Message-ID: <1452441884-25882-3-git-send-email-blogic@openwrt.org>
References: <1452441884-25882-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1452441884-25882-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

MT2701 and MT7623 use bit 14 instead of 13. Bit 13 is used on these SoCs to
select the slave type.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 82350d0..ceeac3a 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -405,6 +405,7 @@ struct pmic_wrapper_type {
 	enum pwrap_type type;
 	u32 arb_en_all;
 	u32 int_en_all;
+	u32 man_cmd_spi_w;
 };
 
 static struct pmic_wrapper_type pwrap_mt8135 = {
@@ -414,6 +415,7 @@ static struct pmic_wrapper_type pwrap_mt8135 = {
 	.type = PWRAP_MT8135,
 	.arb_en_all = 0x1ff,
 	.int_en_all = BIT(31) | BIT(1),
+	.man_cmd_spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 };
 
 static struct pmic_wrapper_type pwrap_mt8173 = {
@@ -423,6 +425,7 @@ static struct pmic_wrapper_type pwrap_mt8173 = {
 	.type = PWRAP_MT8173,
 	.arb_en_all = 0x3f,
 	.int_en_all = BIT(31) | BIT(1),
+	.man_cmd_spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 };
 
 struct pmic_wrapper {
@@ -435,6 +438,7 @@ struct pmic_wrapper {
 	enum pwrap_type type;
 	u32 arb_en_all;
 	u32 int_en_all;
+	u32 man_cmd_spi_w;
 	struct clk *clk_spi;
 	struct clk *clk_wrap;
 	struct reset_control *rstc;
@@ -572,15 +576,15 @@ static int pwrap_reset_spislave(struct pmic_wrapper *wrp)
 	pwrap_writel(wrp, 1, PWRAP_MAN_EN);
 	pwrap_writel(wrp, 0, PWRAP_DIO_EN);
 
-	pwrap_writel(wrp, PWRAP_MAN_CMD_SPI_WRITE | PWRAP_MAN_CMD_OP_CSL,
+	pwrap_writel(wrp, wrp->man_cmd_spi_w | PWRAP_MAN_CMD_OP_CSL,
 			PWRAP_MAN_CMD);
-	pwrap_writel(wrp, PWRAP_MAN_CMD_SPI_WRITE | PWRAP_MAN_CMD_OP_OUTS,
+	pwrap_writel(wrp, wrp->man_cmd_spi_w | PWRAP_MAN_CMD_OP_OUTS,
 			PWRAP_MAN_CMD);
-	pwrap_writel(wrp, PWRAP_MAN_CMD_SPI_WRITE | PWRAP_MAN_CMD_OP_CSH,
+	pwrap_writel(wrp, wrp->man_cmd_spi_w | PWRAP_MAN_CMD_OP_CSH,
 			PWRAP_MAN_CMD);
 
 	for (i = 0; i < 4; i++)
-		pwrap_writel(wrp, PWRAP_MAN_CMD_SPI_WRITE | PWRAP_MAN_CMD_OP_OUTS,
+		pwrap_writel(wrp, wrp->man_cmd_spi_w | PWRAP_MAN_CMD_OP_OUTS,
 				PWRAP_MAN_CMD);
 
 	ret = pwrap_wait_for_state(wrp, pwrap_is_sync_idle);
@@ -905,6 +909,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	wrp->dew_base = type->dew_base;
 	wrp->arb_en_all = type->arb_en_all;
 	wrp->int_en_all = type->int_en_all;
+	wrp->man_cmd_spi_w = type->man_cmd_spi_w;
 	wrp->dev = &pdev->dev;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwrap");
-- 
1.7.10.4
