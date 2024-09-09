Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F6FECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4QKaI+3WBHRSwPufs3rtV0LI1aQyhehd6Wi2dpHTGg=; b=L4zEhdUFRzxRpBdZyOtdr0c39O
	xd9Cc342nSK+OBMSV4OkCPgEDV2BTvrW+ujUJp7UyAVVstOskOTDTufCG68mU4xyzps/pgZ7TyfeJ
	xbebnnDay59X+98YTyrrOYbMrK0BcusUUmuECTBzHtbbBmei4f5l1vgNbZTbCr80eEUdsQaRLeys8
	zOHpmmp3I755Fg64YtlqZCqn1cYWZ3RfCLSm+XlBj+QZz4sjnCP5ZA3080pO6rfRHn96MG313CpMG
	8SGAN3xLKgEG2IGoTMgWmuU2WsGFWh6HiA7k0yu6tx+G6FBWjmstikYKdFxCsGQx2lbfYhRIRs6se
	dYYyYziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snf6R-00000002DWG-0B4n;
	Mon, 09 Sep 2024 14:10:51 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneoG-000000028on-2LQ0
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:52:06 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a8a87c7c68dso12367666b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889923; x=1726494723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4QKaI+3WBHRSwPufs3rtV0LI1aQyhehd6Wi2dpHTGg=;
        b=E6Gc0HYE+M0Z/ogTlilNZFiLHwVllkWPnr6pjsOeQbkpT0MRcIGhYwG7G+z0Z4IYEX
         uAmBRlP+sYDCqMSkMRRwcO1Mh3wRPZQ/vuQsVuG2ILRz+jmqOpEXZMaqciBELVwjdfIa
         7jTmy+TPVlu3VSmO3jvZcFlnwVFyrbVZcYC2AwDVkNBujuhVx619pGQxlr1KoyWXY/0z
         0yzg+BC+Xbfl1Ns89oMTDipBY56a1HR1FVzsH4/Nd5g/ZFU8Mc7uPms/wDwDO5n29/hx
         YUioFlj4qp2dTC6lOTJwwSlcKD3aGIbrn02QnKNr5DbZ+LgCE+3D+aCgkNNZpfelySrc
         bd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889923; x=1726494723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4QKaI+3WBHRSwPufs3rtV0LI1aQyhehd6Wi2dpHTGg=;
        b=NmgVkviPFaJzfAq0r2fdxyTKhp+EuSE2bRAG66K0YyFxTqocmHbJrHAQQ+v+bJ7qu8
         qWE/EMn4ha21/DhOqNnYVVYUYNxtOUXp/MtJAYoxXfpnK6PrCZjcc8h0nzTiDkC0I6dr
         G5vurHfoXphpfKks3aW4EsF8pXcQGcV9GvTBv3w8rqFMHXU1OyrS9bZQbnWvhV6T2uhT
         Y2RD5yrFocMAWnCRlHLficA9jfiAhUXX+QM8hj84TANR3MHBzA3L+/wglvGIEuc8FMUC
         Rt877rGI1233t9i/tnxYPxBn5+Bzr7QN5saXwtk+qkY4y8raP1mniAUm/R+ZpnNKuzN6
         mqyA==
X-Forwarded-Encrypted: i=1; AJvYcCVeBwxMj2nNNnCTz+hCb94CL3YubwwFcyZxY4xRCpeag5OM2eqgTIYTjn5egwmuumQq34E+N2z4uERJYHv7yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaDpYdwo62htRHW2saWbi3TsmCdkQwCQb5JBT8WOvqLhbUdRgt
	Seq9N2J/C9dcNPDvShXd8jNSGS5R9d9jonuIvgDswyVpnjLVrHYkZ/WKMOPXqAk=
X-Google-Smtp-Source: AGHT+IFkB5FwZ6RP2VpeDYDu58V07W5VhL+BMyppWhQzRBjqI5M81sTuW26HDIwx4LByUJ7TdWVeBw==
X-Received: by 2002:a17:907:608a:b0:a8a:7189:2106 with SMTP id a640c23a62f3a-a8a88803359mr291596666b.6.1725889922892;
        Mon, 09 Sep 2024 06:52:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:52:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:28 +0200
Subject: [PATCH 17/17] regulator: max77650: Use container_of and constify
 static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-17-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5091;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pT3vklV3r+mZAGNAtUkG8vU9TQS654l0/1TCGybfK8Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1nXIJdWNbRtDH6jLRbfKirVbrDR9hrPibYD
 A0gRNKrWKKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79ZwAKCRDBN2bmhouD
 14qVEACRgLsVdWDXrS20GsTp4A3Ag89uPdX4Lm1yhjam8q9PHA1EcqEd03qyD9++DH9J+ze5ujx
 c9LiuV8Y4yAXbrIxGmNWOpx5u/7JoGvGjwsAKmG4P+E5hnO96bKsupFq0ZONfubtSA7efMP65qw
 xfW4XKiQcPq3KaXujdFdgnhdkG8ultcDksYS2ZU/MB3hiiFytZi6dddp7Mfzx7BEHgs7yF4s9m8
 yoigsGsbquv2hbcCDnb1ytwDxR+un6SE33cXwUfo5pNBXAW92nmpQbtbWykifj6vIMjV6CmbraR
 52C5s+4gdyII3bdtf4HvUTcz66Asm+/9ihcxYClBn5HiA6lUefRTJjN5zqznTDK0L3zPULYVR2h
 WbLPZiHzj8UDkLW4aGaclTo/gCX5gAgyzDPphNHbsFx185jVuudPHcW7xU1b+9qMguFXzZIwSlp
 5tmlv7aRCC/dGhe1JG9DX3G6ICnQW968kLzlnqDcw6EEHsON1+e8XB/FzHZM2TpHLPTUcRdr5D/
 1o0NHLpdQEnvyS5eZKbx08DylInn6xnZ9QbOZ4sYmBITYGcD8Ou4rdHa/lZHhBW1+E0C4QUP16t
 fLQaiHp2fnlt+GpZXPFrbgCuNfgB6MoliRVSldN2+bWRS5k1sbw8oTaQWBmbqNuZRtcbE5JSIsL
 1RjfoAwiIZmG/ZA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065204_691708_C2D71A94 
X-CRM114-Status: GOOD (  15.24  )
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

Switch from rdev_get_drvdata() to container_of(), so the static
'struct max77650_regulator_desc' holding 'struct regulator_desc' can
be made const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

[RFT]: Not tested, only built.
---
 drivers/regulator/max77650-regulator.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/regulator/max77650-regulator.c b/drivers/regulator/max77650-regulator.c
index 94abfbb2bc1e..7368f54f046d 100644
--- a/drivers/regulator/max77650-regulator.c
+++ b/drivers/regulator/max77650-regulator.c
@@ -43,8 +43,6 @@ struct max77650_regulator_desc {
 	unsigned int regB;
 };
 
-static struct max77650_regulator_desc max77651_SBB1_desc;
-
 static const unsigned int max77651_sbb1_volt_range_sel[] = {
 	0x0, 0x1, 0x2, 0x3
 };
@@ -66,11 +64,11 @@ static const unsigned int max77650_current_limit_table[] = {
 
 static int max77650_regulator_is_enabled(struct regulator_dev *rdev)
 {
-	struct max77650_regulator_desc *rdesc;
+	const struct max77650_regulator_desc *rdesc;
 	struct regmap *map;
 	int val, rv, en;
 
-	rdesc = rdev_get_drvdata(rdev);
+	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	rv = regmap_read(map, rdesc->regB, &val);
@@ -84,10 +82,10 @@ static int max77650_regulator_is_enabled(struct regulator_dev *rdev)
 
 static int max77650_regulator_enable(struct regulator_dev *rdev)
 {
-	struct max77650_regulator_desc *rdesc;
+	const struct max77650_regulator_desc *rdesc;
 	struct regmap *map;
 
-	rdesc = rdev_get_drvdata(rdev);
+	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	return regmap_update_bits(map, rdesc->regB,
@@ -97,10 +95,10 @@ static int max77650_regulator_enable(struct regulator_dev *rdev)
 
 static int max77650_regulator_disable(struct regulator_dev *rdev)
 {
-	struct max77650_regulator_desc *rdesc;
+	const struct max77650_regulator_desc *rdesc;
 	struct regmap *map;
 
-	rdesc = rdev_get_drvdata(rdev);
+	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	return regmap_update_bits(map, rdesc->regB,
@@ -145,7 +143,7 @@ static const struct regulator_ops max77651_SBB1_regulator_ops = {
 	.set_active_discharge	= regulator_set_active_discharge_regmap,
 };
 
-static struct max77650_regulator_desc max77650_LDO_desc = {
+static const struct max77650_regulator_desc max77650_LDO_desc = {
 	.desc = {
 		.name			= "ldo",
 		.of_match		= of_match_ptr("ldo"),
@@ -171,7 +169,7 @@ static struct max77650_regulator_desc max77650_LDO_desc = {
 	.regB		= MAX77650_REG_CNFG_LDO_B,
 };
 
-static struct max77650_regulator_desc max77650_SBB0_desc = {
+static const struct max77650_regulator_desc max77650_SBB0_desc = {
 	.desc = {
 		.name			= "sbb0",
 		.of_match		= of_match_ptr("sbb0"),
@@ -201,7 +199,7 @@ static struct max77650_regulator_desc max77650_SBB0_desc = {
 	.regB		= MAX77650_REG_CNFG_SBB0_B,
 };
 
-static struct max77650_regulator_desc max77650_SBB1_desc = {
+static const struct max77650_regulator_desc max77650_SBB1_desc = {
 	.desc = {
 		.name			= "sbb1",
 		.of_match		= of_match_ptr("sbb1"),
@@ -231,7 +229,7 @@ static struct max77650_regulator_desc max77650_SBB1_desc = {
 	.regB		= MAX77650_REG_CNFG_SBB1_B,
 };
 
-static struct max77650_regulator_desc max77651_SBB1_desc = {
+static const struct max77650_regulator_desc max77651_SBB1_desc = {
 	.desc = {
 		.name			= "sbb1",
 		.of_match		= of_match_ptr("sbb1"),
@@ -264,7 +262,7 @@ static struct max77650_regulator_desc max77651_SBB1_desc = {
 	.regB		= MAX77650_REG_CNFG_SBB1_B,
 };
 
-static struct max77650_regulator_desc max77650_SBB2_desc = {
+static const struct max77650_regulator_desc max77650_SBB2_desc = {
 	.desc = {
 		.name			= "sbb2",
 		.of_match		= of_match_ptr("sbb2"),
@@ -294,7 +292,7 @@ static struct max77650_regulator_desc max77650_SBB2_desc = {
 	.regB		= MAX77650_REG_CNFG_SBB2_B,
 };
 
-static struct max77650_regulator_desc max77651_SBB2_desc = {
+static const struct max77650_regulator_desc max77651_SBB2_desc = {
 	.desc = {
 		.name			= "sbb2",
 		.of_match		= of_match_ptr("sbb2"),
@@ -326,8 +324,8 @@ static struct max77650_regulator_desc max77651_SBB2_desc = {
 
 static int max77650_regulator_probe(struct platform_device *pdev)
 {
-	struct max77650_regulator_desc **rdescs;
-	struct max77650_regulator_desc *rdesc;
+	const struct max77650_regulator_desc **rdescs;
+	const struct max77650_regulator_desc *rdesc;
 	struct regulator_config config = { };
 	struct device *dev, *parent;
 	struct regulator_dev *rdev;
@@ -376,7 +374,6 @@ static int max77650_regulator_probe(struct platform_device *pdev)
 
 	for (i = 0; i < MAX77650_REGULATOR_NUM_REGULATORS; i++) {
 		rdesc = rdescs[i];
-		config.driver_data = rdesc;
 
 		rdev = devm_regulator_register(dev, &rdesc->desc, &config);
 		if (IS_ERR(rdev))

-- 
2.43.0


