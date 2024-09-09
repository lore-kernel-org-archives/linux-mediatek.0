Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3616ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FndzdmkQ1TyGddm5J1kGgfQG5PZMqaxnpW3JAkHAkvA=; b=T8z3GT8hdcOgDPjoDXShkCs4Cx
	W8KiDHEpnFdU9p04xgq1C33UYHeurmR9e6ZxxSeLjoEqEjZjCVu0SbPejkjuMBF7t7ih636jkAekg
	F77zLt1ZG5N5rtB0fkoiEJgnA7jTEWUjQZQ4c1X5a/ZwfCQu63qjb4ri5YscXGbm2ld6ioyf4cxqd
	ymG/ehoBNMPibm3UREIc/G67Nwvh9W7OUvY9BWJ+IeDxoK7gDBDKPCed+NpZLdWWFpa20ULWCd4an
	K6HwLn2p9MmXN3LTyGPk9TIx+S453NZLLCgUtoikSBKKvfR0jgY04dRV6zgCnZt9YNEHEmg08w+Uv
	tGpaTTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneuS-00000002Aaa-1Yf0;
	Mon, 09 Sep 2024 13:58:28 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneo1-000000028cs-3Aly
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:51 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c24b1ed83eso711380a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889908; x=1726494708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FndzdmkQ1TyGddm5J1kGgfQG5PZMqaxnpW3JAkHAkvA=;
        b=aIKsaI+iIClWRc1XoeAyA7/et+bCE8XAz6znhxCss5QjfgUYFHSDn9fQ34JDdNdk+U
         eJVPZAJrUlhE1D4xyDaglS/LYg2WnNDk7SqHmJg5jRqH2bH5xTY6Zak4X6X/uBV9b16r
         nJSE7lHvdMZGOUo+jyi2IhN932g49yYwOdCNPKq6AVVjCPBrnBcMyg6OTt0pqFHirlI0
         4i/ptfvSfIZnmIt9QyJQQKgnbRep2CMvDxO5uVrgcF/FEycxLyqzf8578q+2m/oFS8fm
         ctLPyj424Fmhx9rD+6Cocryj1T7ES/ubsYrW7ej0KF2aFe71jJtVNIUivJg1cxN0vQgq
         TtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889908; x=1726494708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FndzdmkQ1TyGddm5J1kGgfQG5PZMqaxnpW3JAkHAkvA=;
        b=fuWDPCF6LoWvGgcn4k5xHEjRd7N1CevuJIe8sQ942l6WxTrXDUKAAxtA6BiOE25/k5
         x+L6KxvimXQ0UpyPz3U2GzEKTbdBF63buryzDdSGMnr3jPxisJh9vBNJBqvD2ZCdEvlr
         SRTpkTxXhYNGzmvWNFaI/FJo94HF8tfXsdgIctn0dt7Y0cSjxsTPqSrYEtw9dsa0V8Ov
         z81/1XBhOsmP6AHFZrDanW5pP2Xl1HkECihBgcYKRq3GXUT83io8muWK/drJciIGdk7X
         YYt16yJp1F4xqKTqzqTjaqUVNbK0tHKKQGEnzvKGbT7yKTJhKs0qo+0tqvnqoIrptaRU
         Y0Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVNXgpI4RSOMaHfne74q2R+LDxtHHvOYb/47ZytfDLVty7/2RBwQjruPIuslYo5DlPsWjUPdxOw9dBG97gayQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqfLRjSYKVM8LSc3vHkuwUIyiW3EP9H4tRx//0VeCkFgqx509b
	UDzhXV2rGLt1WfS1tmpT+giMBycwkWiv27GYQNxl2KBpyudm+VTV7aTPAM55YpQ=
X-Google-Smtp-Source: AGHT+IFey0kfUyFLxagH6WYQeneAlVLduFYs1cyOv+swLVtBUWQ2bTPbM+NQhOdNSq4TWZKivO7V+g==
X-Received: by 2002:a17:907:3f87:b0:a8d:2624:1a85 with SMTP id a640c23a62f3a-a8d26242590mr191552266b.12.1725889908199;
        Mon, 09 Sep 2024 06:51:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:18 +0200
Subject: [PATCH 07/17] regulator: hi6421v600: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-7-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aQxdvJysaJsMuCiXGmuPsUG5zXaAXydDbTeDR80ECyI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1eEV9BEYMcFSBw7lfXCzYrANegqqdP0KgLr
 wLORiBbAs+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79XgAKCRDBN2bmhouD
 1/NGEACM/+upk2qItNXTCceOePEuc0yrqvApHPovnARhqgTaI4wjCEJjM3WbPMEs2it8jbbZY3R
 GWgKaMlU0NZCMQLdzbK6xCPCY0HAUlP5hXV7Z67Ga6wVt96WZRE3i3UvH5aLubbrFfPdsAdZWxc
 9A4DfZDmLK+ex/r4s9ef8DAk2U49qbgi17CR/BLEP0SVqJqNLTiyiLRGcPq24oKifYOQFnpxhAS
 KtLzPTPMLJFV5UQhgfwbPRBI28xbaJAlPyzqxW98B5cTUSz6Aln73tTlcSF620UGIUyFoKwRury
 BOep0BgcFjCQdaJJwn+Dq8kp4Eazcf9knQFU9TPu2T7Kwz9aRVGTXA2myWRdgBlJzhjcQWK+mOp
 j+9qAJ5Kbl+Y1Oy8grzj5aSPTbuo5b1Z79AqfRmD3QFOucMRzqU/OcOtIfVHUUQghwLE+j/asq9
 Few4VKtyywvJ0AcvBTNWRK3PrJvu4yNZqkIzoqNSeMV6WYl5ZPKLEu9A+O+R1cILiAE10eaE/Jc
 inkY3yW1Ccyj1xQxAf+DLVEKSbkpTOSmdlaos8Eh6zLj+JZjsB8Z7LNUgzCvaDqtwC8hRw3H7z5
 QLC2PSX21usUhZ+r+2B9ey/R10vItMc/Uwhxzhhkrb0vhzGWcObfrkEyjxtbYij4VEE+YX6NFud
 nxDwTMTP+ayKivA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065149_995187_A9B48D15 
X-CRM114-Status: GOOD (  13.64  )
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

Driver does not modify static data with regulator description (struct
hi6421_spmi_reg_info), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/hi6421v600-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/hi6421v600-regulator.c b/drivers/regulator/hi6421v600-regulator.c
index 4e10daa1e689..e5f6fbfc9016 100644
--- a/drivers/regulator/hi6421v600-regulator.c
+++ b/drivers/regulator/hi6421v600-regulator.c
@@ -118,7 +118,7 @@ static int hi6421_spmi_regulator_enable(struct regulator_dev *rdev)
 
 static unsigned int hi6421_spmi_regulator_get_mode(struct regulator_dev *rdev)
 {
-	struct hi6421_spmi_reg_info *sreg;
+	const struct hi6421_spmi_reg_info *sreg;
 	unsigned int reg_val;
 
 	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
@@ -133,7 +133,7 @@ static unsigned int hi6421_spmi_regulator_get_mode(struct regulator_dev *rdev)
 static int hi6421_spmi_regulator_set_mode(struct regulator_dev *rdev,
 					  unsigned int mode)
 {
-	struct hi6421_spmi_reg_info *sreg;
+	const struct hi6421_spmi_reg_info *sreg;
 	unsigned int val;
 
 	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
@@ -160,7 +160,7 @@ hi6421_spmi_regulator_get_optimum_mode(struct regulator_dev *rdev,
 				       int input_uV, int output_uV,
 				       int load_uA)
 {
-	struct hi6421_spmi_reg_info *sreg;
+	const struct hi6421_spmi_reg_info *sreg;
 
 	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
 
@@ -195,7 +195,7 @@ enum hi6421_spmi_regulator_id {
 	hi6421v600_ldo34,
 };
 
-static struct hi6421_spmi_reg_info regulator_info[] = {
+static const struct hi6421_spmi_reg_info regulator_info[] = {
 	HI6421V600_LDO(ldo3, range_1v5_to_2v0,
 		       0x16, 0x01, 0x51,
 		       20000, 120,
@@ -235,7 +235,7 @@ static int hi6421_spmi_regulator_probe(struct platform_device *pdev)
 	struct device *pmic_dev = pdev->dev.parent;
 	struct regulator_config config = { };
 	struct hi6421_spmi_reg_priv *priv;
-	struct hi6421_spmi_reg_info *info;
+	const struct hi6421_spmi_reg_info *info;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	struct regulator_dev *rdev;

-- 
2.43.0


