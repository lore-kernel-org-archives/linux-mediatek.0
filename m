From: John Crispin <blogic@openwrt.org>
Subject: [PATCH V2 02/11] soc: mediatek: PMIC wrap: don't duplicate the
 wrapper data
Date: Wed, 20 Jan 2016 20:58:54 +0100
Message-ID: <1453319943-35491-2-git-send-email-blogic@openwrt.org>
References: <1453319943-35491-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1453319943-35491-1-git-send-email-blogic@openwrt.org>
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
Cc: Steven Liu <steven.liu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org

As we add support for more devices struct pmic_wrapper_type will grow and
we do not really want to start duplicating all the elements in
struct pmic_wrapper.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c |   22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0d9b19a..340c4b5 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -376,9 +376,7 @@ struct pmic_wrapper {
 	struct device *dev;
 	void __iomem *base;
 	struct regmap *regmap;
-	int *regs;
-	enum pwrap_type type;
-	u32 arb_en_all;
+	const struct pmic_wrapper_type *master;
 	struct clk *clk_spi;
 	struct clk *clk_wrap;
 	struct reset_control *rstc;
@@ -389,22 +387,22 @@ struct pmic_wrapper {
 
 static inline int pwrap_is_mt8135(struct pmic_wrapper *wrp)
 {
-	return wrp->type == PWRAP_MT8135;
+	return wrp->master->type == PWRAP_MT8135;
 }
 
 static inline int pwrap_is_mt8173(struct pmic_wrapper *wrp)
 {
-	return wrp->type == PWRAP_MT8173;
+	return wrp->master->type == PWRAP_MT8173;
 }
 
 static u32 pwrap_readl(struct pmic_wrapper *wrp, enum pwrap_regs reg)
 {
-	return readl(wrp->base + wrp->regs[reg]);
+	return readl(wrp->base + wrp->master->regs[reg]);
 }
 
 static void pwrap_writel(struct pmic_wrapper *wrp, u32 val, enum pwrap_regs reg)
 {
-	writel(val, wrp->base + wrp->regs[reg]);
+	writel(val, wrp->base + wrp->master->regs[reg]);
 }
 
 static bool pwrap_is_fsm_idle(struct pmic_wrapper *wrp)
@@ -697,7 +695,7 @@ static int pwrap_init(struct pmic_wrapper *wrp)
 
 	pwrap_writel(wrp, 1, PWRAP_WRAP_EN);
 
-	pwrap_writel(wrp, wrp->arb_en_all, PWRAP_HIPRIO_ARB_EN);
+	pwrap_writel(wrp, wrp->master->arb_en_all, PWRAP_HIPRIO_ARB_EN);
 
 	pwrap_writel(wrp, 1, PWRAP_WACS2_EN);
 
@@ -742,7 +740,7 @@ static int pwrap_init(struct pmic_wrapper *wrp)
 	pwrap_writel(wrp, 0x1, PWRAP_CRC_EN);
 	pwrap_writel(wrp, 0x0, PWRAP_SIG_MODE);
 	pwrap_writel(wrp, PWRAP_DEW_CRC_VAL, PWRAP_SIG_ADR);
-	pwrap_writel(wrp, wrp->arb_en_all, PWRAP_HIPRIO_ARB_EN);
+	pwrap_writel(wrp, wrp->master->arb_en_all, PWRAP_HIPRIO_ARB_EN);
 
 	if (pwrap_is_mt8135(wrp))
 		pwrap_writel(wrp, 0x7, PWRAP_RRARB_EN);
@@ -836,7 +834,6 @@ static int pwrap_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *of_id =
 		of_match_device(of_pwrap_match_tbl, &pdev->dev);
-	const struct pmic_wrapper_type *type;
 	struct resource *res;
 
 	wrp = devm_kzalloc(&pdev->dev, sizeof(*wrp), GFP_KERNEL);
@@ -845,10 +842,7 @@ static int pwrap_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, wrp);
 
-	type = of_id->data;
-	wrp->regs = type->regs;
-	wrp->type = type->type;
-	wrp->arb_en_all = type->arb_en_all;
+	wrp->master = of_id->data;
 	wrp->dev = &pdev->dev;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwrap");
-- 
1.7.10.4
