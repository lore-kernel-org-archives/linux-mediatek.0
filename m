Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967DCFF8864
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2026 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49bfdYYbIg6tfnc++pVfPk+Atqcr9AmhHhh6IHuVStw=; b=p/R7WXiCfXvv8cHtMuKXUBc23E
	kXGLDm0npytd2Gu++OMIcTkDDziWzzOzI926+E6I/bgMSUq5hCyjlwD+9GGzz1suC/s1fAR/OinGs
	42Xt6MtiPe81xodXUu6FzjLF0kJEpkjwX1oCnw9oiQ9Ua+4buS04TN9KytgX6kWwmkwqjPO1j//wI
	dF3JKKK9t8DY6ke2EXSD9UaQ3QTYlNtcn3Bp9G9BEVO00SG5SlP6YkOMhFad7edc5TM4mogygQXl2
	CNROU5Yb8KLYfI6uJkHbDjzTmEtoHU4t/NlzXlInhj0u5MRRk2Rt4VC86as1EP1xByuG40sBqqtAB
	VJmBtrLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYK-00000003AvU-1zFc;
	Wed, 29 Apr 2026 07:41:48 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYD-00000003AoK-2BYD
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Apr 2026 07:41:42 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35d965648a2so10957526a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Apr 2026 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448500; x=1778053300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49bfdYYbIg6tfnc++pVfPk+Atqcr9AmhHhh6IHuVStw=;
        b=lN5QYxv8lK3Wurg2DLUyWn4UIB6VYvb5b4q6aVpUte8r37D4p9Yo/k7Nk0L7KPyFCE
         TOMjJscw3yzIyUelMT0xMJhEN5VIOZFMFxJ0LNUl81NTszBAEz2LbKMOqXZNEgxdc+LP
         Ha/1IvCW73rPuFg6QZ9ez+M5rRr9U7iii4+VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448500; x=1778053300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=49bfdYYbIg6tfnc++pVfPk+Atqcr9AmhHhh6IHuVStw=;
        b=fo9N3XI8r35prFiXT+pVx6gPHaOdY2NEXTVsFgPbVSOazD1/26aZ5pn0KOjkIjh0x5
         KR/ovhd98y6zMuJitYBHmMa30aaV97mIEinnG9Yut/FGm6CszHAoSLWsZHxNCTOw/gv8
         Gkjp/TmsVCQK/Wqelcj4PleqNdLp5qKgMI2ZPjnTq8iLCwp5XnGgxON++u3uKGeX1B4t
         RyTWAoWdooi+x68P8VrQm9c0KxbRUY7+W7M23ogPAQVSm/yHvgvaJsla+t/zZiPfs/Rx
         2Btmg2YHXKGKsAv2ZpEz3s1OcKLLsGdVkJY/qqxpOroDq1+RNAwTOzdKpnleO7Iq/KvB
         PUTw==
X-Forwarded-Encrypted: i=1; AFNElJ8PlV0UN9Xa3DsGsTo18ezGrlsE1Z6lEZOAQdDFGd851mi3e+IS6+gMXaryo5KG0Vyir5jtQoArxbTmVmJKDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpsW5dq2L0iKcwwHAaiptDKUW8Nuly1dqppCR9wVJIliybBWir
	JndbyfIDyVURHIBW3M3dcMofFSp9dSzMEm6yAnZrirCYZbb8sRPxp82RdgymLbFUjw==
X-Gm-Gg: AeBDiesKluktySLC8pPfBoJCgU/biVovj6JSB8LQXL5QfgCNYdizA6njbgkIDvW+7PZ
	tyNXYuluu+3Rn95czaDjL+LpgfQzeGTPIiL3r+rR2YKj6iy6tgyZt+7a11lLiZ9iwW/go5GFzsc
	eEreB5d0J7296Z65qKDfIJjmhRMhmeMADCl0R84Ct5kz2K1Ka38qyn18vMfcrjKN4H5pCUDc3XI
	51bnKaHSH0cWxmTBm0jPKTa+BoQOVzx1XQ/XMdnXmf8LVsoHRQiwYaMYho1fxBnEsGYwwFDPZK5
	hevugufiSsA1DxU9c+3q3Lr4oAZpHG7u2rgsAGEuEJ6/G9JulemmgwPr5H0u4DgMja6qqEEWuEq
	5occzs6AaATQoO/pHoO14O+njOwifqg/hKQcBsjrNslCVCX1Q9CplemAd2aMtgazahGXCqYldis
	uQROYN/PmE0a5PjvJFMkwZaQEJSD6aC2N2XF9W/jsQJKc02SOalPQ1XFeWhQECsyk0m3mduPPGF
	A7f4pTfChJjWNTJgcA=
X-Received: by 2002:a17:90b:3c05:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-364a0b1d676mr3078321a91.8.1777448500621;
        Wed, 29 Apr 2026 00:41:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/6] regulator: mt6359: const-ify regulator descriptions
Date: Wed, 29 Apr 2026 15:41:10 +0800
Message-ID: <20260429074113.3720271-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004141_558401_3ADDC442 
X-CRM114-Status: GOOD (  16.98  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The regulator descriptions and extended descriptions don't change at
runtime. The only reason they are not const is that the regulator
driver data is non-const.

Const-ify the descriptions and all references to them. For the driver
data, explicitly cast it to non-const void *.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch

This is included in the series as it touches the same context.

 drivers/regulator/mt6359-regulator.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index c8a788858824..bcf9a476a34e 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -251,7 +251,7 @@ static int mt6359_get_status(struct regulator_dev *rdev)
 {
 	int ret;
 	u32 regval;
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 
 	ret = regmap_read(rdev->regmap, info->status_reg, &regval);
 	if (ret != 0) {
@@ -267,7 +267,7 @@ static int mt6359_get_status(struct regulator_dev *rdev)
 
 static unsigned int mt6359_regulator_get_mode(struct regulator_dev *rdev)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret, regval;
 
 	ret = regmap_read(rdev->regmap, info->modeset_reg, &regval);
@@ -299,7 +299,7 @@ static unsigned int mt6359_regulator_get_mode(struct regulator_dev *rdev)
 static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret = 0, val;
 	int curr_mode;
 
@@ -354,7 +354,7 @@ static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 static int mt6359p_vemc_set_voltage_sel(struct regulator_dev *rdev,
 					u32 sel)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret;
 	u32 val = 0;
 
@@ -393,7 +393,7 @@ static int mt6359p_vemc_set_voltage_sel(struct regulator_dev *rdev,
 
 static int mt6359p_vemc_get_voltage_sel(struct regulator_dev *rdev)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret;
 	u32 val = 0;
 
@@ -469,7 +469,7 @@ static const struct regulator_ops mt6359p_vemc_ops = {
 };
 
 /* The array is indexed by id(MT6359_ID_XXX) */
-static struct mt6359_regulator_info mt6359_regulators[] = {
+static const struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500,
 		    MT6359_RG_BUCK_VS1_EN_ADDR,
 		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
@@ -705,7 +705,7 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT),
 };
 
-static struct mt6359_regulator_info mt6359p_regulators[] = {
+static const struct mt6359_regulator_info mt6359p_regulators[] = {
 	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500,
 		    MT6359_RG_BUCK_VS1_EN_ADDR,
 		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
@@ -950,7 +950,7 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
-	struct mt6359_regulator_info *mt6359_info;
+	const struct mt6359_regulator_info *mt6359_info;
 	int i, hw_ver, ret;
 
 	ret = regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
@@ -965,7 +965,8 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	config.dev = mt6397->dev;
 	config.regmap = mt6397->regmap;
 	for (i = 0; i < MT6359_MAX_REGULATOR; i++, mt6359_info++) {
-		config.driver_data = mt6359_info;
+		/* drop const here, but all uses in the driver are const */
+		config.driver_data = (void *)mt6359_info;
 		rdev = devm_regulator_register(&pdev->dev, &mt6359_info->desc, &config);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev, "failed to register %s\n", mt6359_info->desc.name);
-- 
2.54.0.545.g6539524ca2-goog


