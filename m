From: John Crispin <blogic@openwrt.org>
Subject: [PATCH V2 04/11] soc: mediatek: PMIC wrap: split SoC specific init
 into callback
Date: Wed, 20 Jan 2016 20:58:56 +0100
Message-ID: <1453319943-35491-4-git-send-email-blogic@openwrt.org>
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

This patch moves the SoC specific wrapper init code into separate callback
to avoid pwrap_init() getting too large.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c |   68 +++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index b22b664..ab2202d 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -372,6 +372,7 @@ struct pmic_wrapper_type {
 	enum pwrap_type type;
 	u32 arb_en_all;
 	int (*init_reg_clock)(struct pmic_wrapper *wrp);
+	int (*init_special)(struct pmic_wrapper *wrp);
 };
 
 static inline int pwrap_is_mt8135(struct pmic_wrapper *wrp)
@@ -665,6 +666,41 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	return 0;
 }
 
+static int pwrap_mt8135_init_special(struct pmic_wrapper *wrp)
+{
+	/* enable pwrap events and pwrap bridge in AP side */
+	pwrap_writel(wrp, 0x1, PWRAP_EVENT_IN_EN);
+	pwrap_writel(wrp, 0xffff, PWRAP_EVENT_DST_EN);
+	writel(0x7f, wrp->bridge_base + PWRAP_MT8135_BRIDGE_IORD_ARB_EN);
+	writel(0x1, wrp->bridge_base + PWRAP_MT8135_BRIDGE_WACS3_EN);
+	writel(0x1, wrp->bridge_base + PWRAP_MT8135_BRIDGE_WACS4_EN);
+	writel(0x1, wrp->bridge_base + PWRAP_MT8135_BRIDGE_WDT_UNIT);
+	writel(0xffff, wrp->bridge_base + PWRAP_MT8135_BRIDGE_WDT_SRC_EN);
+	writel(0x1, wrp->bridge_base + PWRAP_MT8135_BRIDGE_TIMER_EN);
+	writel(0x7ff, wrp->bridge_base + PWRAP_MT8135_BRIDGE_INT_EN);
+
+	/* enable PMIC event out and sources */
+	if (pwrap_write(wrp, PWRAP_DEW_EVENT_OUT_EN, 0x1) ||
+		pwrap_write(wrp, PWRAP_DEW_EVENT_SRC_EN, 0xffff)) {
+		dev_err(wrp->dev, "enable dewrap fail\n");
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int pwrap_mt8173_init_special(struct pmic_wrapper *wrp)
+{
+	/* PMIC_DEWRAP enables */
+	if (pwrap_write(wrp, PWRAP_DEW_EVENT_OUT_EN, 0x1) ||
+		pwrap_write(wrp, PWRAP_DEW_EVENT_SRC_EN, 0xffff)) {
+		dev_err(wrp->dev, "enable dewrap fail\n");
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
 static int pwrap_init(struct pmic_wrapper *wrp)
 {
 	int ret;
@@ -743,32 +779,10 @@ static int pwrap_init(struct pmic_wrapper *wrp)
 	pwrap_writel(wrp, 0x5, PWRAP_STAUPD_PRD);
 	pwrap_writel(wrp, 0xff, PWRAP_STAUPD_GRPEN);
 
-	if (pwrap_is_mt8135(wrp)) {
-		/* enable pwrap events and pwrap bridge in AP side */
-		pwrap_writel(wrp, 0x1, PWRAP_EVENT_IN_EN);
-		pwrap_writel(wrp, 0xffff, PWRAP_EVENT_DST_EN);
-		writel(0x7f, wrp->bridge_base + PWRAP_MT8135_BRIDGE_IORD_ARB_EN);
-		writel(0x1, wrp->bridge_base + PWRAP_MT8135_BRIDGE_WACS3_EN);
-		writel(0x1, wrp->bridge_base + PWRAP_MT8135_BRIDGE_WACS4_EN);
-		writel(0x1, wrp->bridge_base + PWRAP_MT8135_BRIDGE_WDT_UNIT);
-		writel(0xffff, wrp->bridge_base + PWRAP_MT8135_BRIDGE_WDT_SRC_EN);
-		writel(0x1, wrp->bridge_base + PWRAP_MT8135_BRIDGE_TIMER_EN);
-		writel(0x7ff, wrp->bridge_base + PWRAP_MT8135_BRIDGE_INT_EN);
-
-		/* enable PMIC event out and sources */
-		if (pwrap_write(wrp, PWRAP_DEW_EVENT_OUT_EN, 0x1) ||
-				pwrap_write(wrp, PWRAP_DEW_EVENT_SRC_EN, 0xffff)) {
-			dev_err(wrp->dev, "enable dewrap fail\n");
-			return -EFAULT;
-		}
-	} else {
-		/* PMIC_DEWRAP enables */
-		if (pwrap_write(wrp, PWRAP_DEW_EVENT_OUT_EN, 0x1) ||
-				pwrap_write(wrp, PWRAP_DEW_EVENT_SRC_EN, 0xffff)) {
-			dev_err(wrp->dev, "enable dewrap fail\n");
-			return -EFAULT;
-		}
-	}
+	if (wrp->master->init_special)
+		ret = wrp->master->init_special(wrp);
+	if (ret)
+		return ret;
 
 	/* Setup the init done registers */
 	pwrap_writel(wrp, 1, PWRAP_INIT_DONE2);
@@ -811,6 +825,7 @@ static struct pmic_wrapper_type pwrap_mt8135 = {
 	.type = PWRAP_MT8135,
 	.arb_en_all = 0x1ff,
 	.init_reg_clock = pwrap_mt8135_init_reg_clock,
+	.init_special = pwrap_mt8135_init_special,
 };
 
 static struct pmic_wrapper_type pwrap_mt8173 = {
@@ -818,6 +833,7 @@ static struct pmic_wrapper_type pwrap_mt8173 = {
 	.type = PWRAP_MT8173,
 	.arb_en_all = 0x3f,
 	.init_reg_clock = pwrap_mt8173_init_reg_clock,
+	.init_special = pwrap_mt8173_init_special,
 };
 
 static struct of_device_id of_pwrap_match_tbl[] = {
-- 
1.7.10.4
