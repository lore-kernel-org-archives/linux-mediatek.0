Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47F2C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1k2VMq/xEBQgrYx56NRnCUxSLqT3eNK4Bv8qVRsAFkg=; b=P8/0ydyAlyDFWN/8FEX7ye99eA
	mkrvGDVYa3aRRzFfD787D1PoJLuhqLRCXrsZsx6/tZcA3JjRvV2pNougzLVF6P20DQ/3RDcbqK3GY
	ty152D5nggmova09pHRug4Y13IBbhfEHVYsDboOmekFnQrCdPRV5aeImFwuu7ZcDcfp6SowGo/YL/
	uBrpBfRwA9DNq5EElohBk52cwWq8flv3z8p3T5jUjynZe+CCQTmCkPvQ1QBdwb26kDv7Rdmf/xKF4
	0kMXGSa1hxt1kLfJw5LYu5IswhobGYq7V6fYMiuSmYZAhPVRAyU0vdLyXy4+Rxs3dLmWfWyQLCMSP
	tixY0PuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Ibz-00EcKs-9Y; Wed, 30 Nov 2022 08:38:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IbJ-00Ebzi-Kp; Wed, 30 Nov 2022 08:37:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id d3so10996820plr.10;
        Wed, 30 Nov 2022 00:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k2VMq/xEBQgrYx56NRnCUxSLqT3eNK4Bv8qVRsAFkg=;
        b=F5nEtoGDEZ09/SSA6t2aW9h7JPyuve/UEHu4gMo34iSiJwuesa7z3joKJsaYtVv4ET
         qWZLJ0vXNe/fsoTsZ7z4bY2Qmh11mkC3MjqLHAUwpXYL8w8fMfA8kVLuAWFBDTc6/n2G
         SOWhn5L2U49gXnj6EgPZzzON0ZpFtL/bYhiFoCdtEGsHc79aJg8T1q4aEYJfjGpTpWCw
         XQ8cdTqmVVHKB8tkqDMdrUsr2+Hqt5Gta7KCN6CoBNcoXWp1z0uHoImLMVxzK/fZuQoU
         38hzdixZuNpdl2tJIREYBQ4EICb8EWmIv3yHyzoegrmb5A95DQXmOJXRe9fhaonvMEqU
         8p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1k2VMq/xEBQgrYx56NRnCUxSLqT3eNK4Bv8qVRsAFkg=;
        b=IKFT7/UPKGbxC478nO/cQVRFi83OjIua4L5L7XdHxEUZh8iUSUnI1yIZGGk/EsOyMp
         LCLT01C6JU9Bb4bAJEAPfngiXgdLmfk3gACZZEyRfyXo3dbIDW4+vgfmJ0mZRk1iYlOT
         xDpUVbxV8rAJFXgIzml9+jw/99+myqxCqMprNBc3Ja72VgZtA46w/d5X8kIT8gqUc633
         5GF/gPfCgs4sCauPrK9rb/XFpHqSByckbWQnKA8aZdMGEoGWsYjaWVcMeERRtf265d2I
         5JFv/eVV789fteC2LnDpsdAWWhIfZ0VzL1WdfJ38IBzUh68iNl20QchfLSW3VeU4pxJa
         lTMw==
X-Gm-Message-State: ANoB5pn+tPBHgrFc8Krp/6GSKsa4oaCQoVl1eSkUdZoe8tBaYmj1CYX9
	q0F2f8r7HxDHwsvnTIgMvxrUvd1Lh4c=
X-Google-Smtp-Source: AA0mqf4wG5gplGLgqHhQj6WuLZFu7QA9DQ4QxZWLSwK/Vk4Y0EDIb43w1HCYlc3OD09KNnB3Drs08w==
X-Received: by 2002:a17:902:ec92:b0:189:377c:9aa with SMTP id x18-20020a170902ec9200b00189377c09aamr38702982plg.90.1669797470126;
        Wed, 30 Nov 2022 00:37:50 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:486:4b30:18c:3eab:7c3:c142])
        by smtp.gmail.com with ESMTPSA id c10-20020a056a00008a00b0057255b82bd1sm817583pfj.217.2022.11.30.00.37.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Nov 2022 00:37:49 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	yangyingliang@huawei.com,
	chiaen_wu@richtek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH 1/2] regulator: mt6370: Fix potential UAF issue
Date: Wed, 30 Nov 2022 16:37:42 +0800
Message-Id: <1669797463-24887-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_003753_747151_8E301D58 
X-CRM114-Status: GOOD (  18.69  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Following by the below patch, there's potential UAF issue.
https://lore.kernel.org/all/20221128143601.1698148-1-yangyingliang@huawei.com/

CPU A				|CPU B
mt6370_probe()			|
  devm_mfd_add_devices()	|
				|mt6370_regulator_probe()
				|  regulator_register()
				|    //allocate init_data and add it to
devres
				|    regulator_of_get_init_data()
i2c_unregister_device()		|
  device_del()			|
    devres_release_all()	|
      // init_data is freed	|
      release_nodes()		|
				|  // using init_data causes UAF
				|  regulator_register()

The original code uses i2c dev as the parent in order to reuse
the 'regulator_of_get_init_data'. But this will cause regulation
constraint devres attached to i2c dev, not the mfd cell platform
device.

Use 'of_regulator_match' to directly parse regulation constraint from
parent dev node. Correct all regulator devs parent back to the platform
device itself.

Fixes: 8171c93bac1b ("regulator: mt6370: Add mt6370 DisplayBias and VibLDO support")
Reported-by: Yang Yingliang <yangyingliang@huawei.com>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/regulator/mt6370-regulator.c | 61 ++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/regulator/mt6370-regulator.c b/drivers/regulator/mt6370-regulator.c
index e73f5a4..c2b589a 100644
--- a/drivers/regulator/mt6370-regulator.c
+++ b/drivers/regulator/mt6370-regulator.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
 
 enum {
 	MT6370_IDX_DSVBOOST = 0,
@@ -183,8 +184,6 @@ static int mt6370_of_parse_cb(struct device_node *np,
 static const struct regulator_desc mt6370_regulator_descs[] = {
 	{
 		.name = "mt6370-dsv-vbst",
-		.of_match = of_match_ptr("dsvbst"),
-		.regulators_node = of_match_ptr("regulators"),
 		.id = MT6370_IDX_DSVBOOST,
 		.type = REGULATOR_VOLTAGE,
 		.owner = THIS_MODULE,
@@ -200,8 +199,6 @@ static const struct regulator_desc mt6370_regulator_descs[] = {
 	},
 	{
 		.name = "mt6370-dsv-vpos",
-		.of_match = of_match_ptr("dsvpos"),
-		.regulators_node = of_match_ptr("regulators"),
 		.id = MT6370_IDX_DSVPOS,
 		.type = REGULATOR_VOLTAGE,
 		.owner = THIS_MODULE,
@@ -224,8 +221,6 @@ static const struct regulator_desc mt6370_regulator_descs[] = {
 	},
 	{
 		.name = "mt6370-dsv-vneg",
-		.of_match = of_match_ptr("dsvneg"),
-		.regulators_node = of_match_ptr("regulators"),
 		.id = MT6370_IDX_DSVNEG,
 		.type = REGULATOR_VOLTAGE,
 		.owner = THIS_MODULE,
@@ -248,8 +243,6 @@ static const struct regulator_desc mt6370_regulator_descs[] = {
 	},
 	{
 		.name = "mt6370-vib-ldo",
-		.of_match = of_match_ptr("vibldo"),
-		.regulators_node = of_match_ptr("regulators"),
 		.id = MT6370_IDX_VIBLDO,
 		.type = REGULATOR_VOLTAGE,
 		.owner = THIS_MODULE,
@@ -320,23 +313,57 @@ static int mt6370_regulator_irq_register(struct mt6370_priv *priv)
 	return 0;
 }
 
+static struct of_regulator_match mt6370_regulator_match[MT6370_MAX_IDX] =  {
+	[MT6370_IDX_DSVBOOST]	= { .name = "dsvbst" },
+	[MT6370_IDX_DSVPOS]	= { .name = "dsvpos" },
+	[MT6370_IDX_DSVNEG]	= { .name = "dsvneg" },
+	[MT6370_IDX_VIBLDO]	= { .name = "vibldo" },
+};
+
 static int mt6370_regualtor_register(struct mt6370_priv *priv)
 {
 	struct regulator_dev *rdev;
-	struct regulator_config cfg = {};
 	struct device *parent = priv->dev->parent;
-	int i;
+	struct device *dev = priv->dev;
+	struct device_node *regulator_np;
+	int i, ret;
+
+	regulator_np = of_get_child_by_name(parent->of_node, "regulators");
+	if (!regulator_np) {
+		dev_err(dev, "Could not find parent 'regulators' node\n");
+		return -ENODEV;
+	}
+
+	ret = of_regulator_match(dev, regulator_np, mt6370_regulator_match,
+				 ARRAY_SIZE(mt6370_regulator_match));
 
-	cfg.dev = parent;
-	cfg.driver_data = priv;
+	of_node_put(regulator_np);
+
+	if (ret < 0) {
+		dev_err(dev, "Error parsing regulator init data: %d\n", ret);
+		return ret;
+	}
 
 	for (i = 0; i < MT6370_MAX_IDX; i++) {
-		rdev = devm_regulator_register(priv->dev,
-					       mt6370_regulator_descs + i,
-					       &cfg);
+		const struct regulator_desc *desc = mt6370_regulator_descs + i;
+		struct regulator_config cfg = {};
+
+		cfg.dev = dev;
+		cfg.driver_data = priv;
+		cfg.init_data = mt6370_regulator_match[i].init_data;
+		cfg.of_node = mt6370_regulator_match[i].of_node;
+
+		if (cfg.of_node && desc->of_parse_cb) {
+			ret = desc->of_parse_cb(cfg.of_node, desc, &cfg);
+			if (ret) {
+				dev_err(dev, "Failed in of_parse_cb\n");
+				return ret;
+			}
+		}
+
+		rdev = devm_regulator_register(dev, desc, &cfg);
 		if (IS_ERR(rdev)) {
-			dev_err(priv->dev,
-				"Failed to register (%d) regulator\n", i);
+			dev_err(dev, "Failed to register (%d) regulator\n", i);
 			return PTR_ERR(rdev);
 		}
 
-- 
2.7.4


