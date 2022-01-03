Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09226C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 15:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m3N6ncQxSiPS8MLu1ipBfHv3QLMJjPinfHN5Y928URo=; b=jLvhZA+Moe9r9y
	FsInkNXVRfrDMxQn2GFofV9udMc9eBtw9nW/XJm+hc/WTQezv6N/RUTqQjY5+fwF7NopRMmMzQ7RE
	nowTvD5+FZSFM5+lpPCuFMtpiFNLEAsoXdM+lHf3j8RZ9AjSNpnwnsRDHsEcf+YTI/FbaUV29eW8v
	C+qCmep4zEznWaXPVYSAExNsiEx2Z5rcqDQ/026YZb42c/TLV6a/5EQ1QmGGP/M0IxfiZVl7IuQ2Y
	5STZWJzvfA+lM2a/tqea2jurAfgkI9+Iie2NeM3JDBj4WK6ASHs2HrRmjWHTN48rJVR+aDTf9a+99
	bG6fIJ0LEp2XvRgS4ZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PMu-009Mht-Vd; Mon, 03 Jan 2022 15:35:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PMj-009Me3-0I; Mon, 03 Jan 2022 15:35:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 62D041F4256D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641224115;
 bh=p5EAAH/x5etyTTXg0rGI1Jb/gnWuZUb3EEqjne7i8P4=;
 h=From:To:Cc:Subject:Date:From;
 b=j9kx1Tp7b+cQWBMh4lAdJma7UapFIlQDaVSebM0sPFE457Odj+7U3Q3N3t7srTcIc
 0xoLgHIpmrX6YzdqJ2dYTJldSOL4ut/EIKxaZJ9rkEWDWIvMl4fEDsLcvkastg9mJe
 pzmxd153lgRk7HhK19l1VxHNZ+UpQDvTeNvSiBF3VGnT6SHmWPhlVX1Q0TvEUgCs3H
 FfIBjy8lGkaSWTItBgEgsbfcPkO6Yz8ZouDqVQTOJf9yK2DL3ffi2W644uC8SoY9lV
 Ky3oz9qIutOvNl7AKrXHVjwQYNL4zehBnJM1di9YLahSUjrsD6HukRV2FYiGrRCN56
 k5J2vAz7OISzw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] pwm: pwm-mtk-disp: Switch to regmap for mmio access
Date: Mon,  3 Jan 2022 16:35:06 +0100
Message-Id: <20220103153506.50896-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_073517_345244_244AEF4E 
X-CRM114-Status: GOOD (  15.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Switch to using the generic regmap API instead of calls to readl/writel
for MMIO register access, allowing us to reduce code size.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pwm/pwm-mtk-disp.c | 77 ++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 45 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index c605013e4114..4a6fab144cee 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -14,6 +14,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #define DISP_PWM_EN		0x00
@@ -47,7 +48,7 @@ struct mtk_disp_pwm {
 	const struct mtk_pwm_data *data;
 	struct clk *clk_main;
 	struct clk *clk_mm;
-	void __iomem *base;
+	struct regmap *regmap;
 	bool enabled;
 };
 
@@ -56,22 +57,11 @@ static inline struct mtk_disp_pwm *to_mtk_disp_pwm(struct pwm_chip *chip)
 	return container_of(chip, struct mtk_disp_pwm, chip);
 }
 
-static void mtk_disp_pwm_update_bits(struct mtk_disp_pwm *mdp, u32 offset,
-				     u32 mask, u32 data)
-{
-	void __iomem *address = mdp->base + offset;
-	u32 value;
-
-	value = readl(address);
-	value &= ~mask;
-	value |= data;
-	writel(value, address);
-}
-
 static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			      const struct pwm_state *state)
 {
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
+	const struct mtk_pwm_data *pdata = mdp->data;
 	u32 clk_div, period, high_width, value;
 	u64 div, rate;
 	int err;
@@ -80,8 +70,7 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -EINVAL;
 
 	if (!state->enabled) {
-		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-					 0x0);
+		regmap_clear_bits(mdp->regmap, DISP_PWM_EN, pdata->enable_mask);
 
 		if (mdp->enabled) {
 			clk_disable_unprepare(mdp->clk_mm);
@@ -138,37 +127,25 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	high_width = mul_u64_u64_div_u64(state->duty_cycle, rate, div);
 	value = period | (high_width << PWM_HIGH_WIDTH_SHIFT);
 
-	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
-				 PWM_CLKDIV_MASK,
-				 clk_div << PWM_CLKDIV_SHIFT);
-	mtk_disp_pwm_update_bits(mdp, mdp->data->con1,
-				 PWM_PERIOD_MASK | PWM_HIGH_WIDTH_MASK,
-				 value);
+	regmap_update_bits(mdp->regmap, pdata->con0, PWM_CLKDIV_MASK,
+			   clk_div << PWM_CLKDIV_SHIFT);
+	regmap_update_bits(mdp->regmap, pdata->con1,
+			   PWM_PERIOD_MASK | PWM_HIGH_WIDTH_MASK, value);
 
 	if (mdp->data->has_commit) {
-		mtk_disp_pwm_update_bits(mdp, mdp->data->commit,
-					 mdp->data->commit_mask,
-					 mdp->data->commit_mask);
-		mtk_disp_pwm_update_bits(mdp, mdp->data->commit,
-					 mdp->data->commit_mask,
-					 0x0);
+		regmap_set_bits(mdp->regmap, pdata->commit, pdata->commit_mask);
+		regmap_clear_bits(mdp->regmap, pdata->commit, pdata->commit_mask);
 	} else {
 		/*
 		 * For MT2701, disable double buffer before writing register
 		 * and select manual mode and use PWM_PERIOD/PWM_HIGH_WIDTH.
 		 */
-		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
-					 mdp->data->bls_debug_mask,
-					 mdp->data->bls_debug_mask);
-		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
-					 mdp->data->con0_sel,
-					 mdp->data->con0_sel);
+		regmap_set_bits(mdp->regmap, pdata->bls_debug, pdata->bls_debug_mask);
+		regmap_set_bits(mdp->regmap, pdata->con0, pdata->con0_sel);
 	}
 
-	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-				 mdp->data->enable_mask);
+	regmap_set_bits(mdp->regmap, DISP_PWM_EN, pdata->enable_mask);
 	mdp->enabled = true;
-
 	return 0;
 }
 
@@ -195,8 +172,8 @@ static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	}
 
 	rate = clk_get_rate(mdp->clk_main);
-	con0 = readl(mdp->base + mdp->data->con0);
-	con1 = readl(mdp->base + mdp->data->con1);
+	regmap_read(mdp->regmap, mdp->data->con0, &con0);
+	regmap_read(mdp->regmap, mdp->data->con1, &con1);
 	state->enabled = !!(con0 & BIT(0));
 	clk_div = FIELD_GET(PWM_CLKDIV_MASK, con0);
 	period = FIELD_GET(PWM_PERIOD_MASK, con1);
@@ -219,9 +196,17 @@ static const struct pwm_ops mtk_disp_pwm_ops = {
 	.owner = THIS_MODULE,
 };
 
+static const struct regmap_config mtk_disp_pwm_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.disable_locking = true,
+};
+
 static int mtk_disp_pwm_probe(struct platform_device *pdev)
 {
 	struct mtk_disp_pwm *mdp;
+	void __iomem *base;
 	int ret;
 
 	mdp = devm_kzalloc(&pdev->dev, sizeof(*mdp), GFP_KERNEL);
@@ -230,9 +215,13 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 
 	mdp->data = of_device_get_match_data(&pdev->dev);
 
-	mdp->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mdp->base))
-		return PTR_ERR(mdp->base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	mdp->regmap = devm_regmap_init_mmio(&pdev->dev, base, &mtk_disp_pwm_regmap_config);
+	if (IS_ERR(mdp->regmap))
+		return PTR_ERR(mdp->regmap);
 
 	mdp->clk_main = devm_clk_get(&pdev->dev, "main");
 	if (IS_ERR(mdp->clk_main))
@@ -247,10 +236,8 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 	mdp->chip.npwm = 1;
 
 	ret = pwmchip_add(&mdp->chip);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "pwmchip_add() failed: %pe\n", ERR_PTR(ret));
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "pwmchip_add() failed\n");
 
 	platform_set_drvdata(pdev, mdp);
 
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
