Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4F5CD4F39
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=; b=GUJka4Lk1d3230e+R/NbaOySwk
	7gvtDX+hJqIl38SyTIhfn1uELOmocsUyRmqu5wfgkmb+EDyjoHzphgfg8XIS5p6RnNEjkYNAaPX6V
	rzY1dfe2yYjOZ/U7vRpVJ9tFcwsJSeBPJcHzxClVYiEOGqUTrSFgZrklfnCrBh/FQuvt/mcVpxdzm
	PrKJJoNENCRHHczGS70Rhe3JHslT1OQM/UEyVGGXnBDuh/1J15vtNtliX0yhEpDBr+riEANTLJXFY
	83ObC6HL5KhJTVdvMtvK2fp0satXNeADZSjHW6OSAy5M4RdmfZwWSI5cjnYbtly+aCVt6msv0AupO
	G9wvNhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAa-000000051oi-2Jve;
	Thu, 14 May 2026 09:15:52 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAW-000000051jf-1mUr
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 09:15:50 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c828daf83e2so2253584a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 02:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750148; x=1779354948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=;
        b=ioe7H6PiBCqg5xr2VU40kuybNdMSLkJdmRvFtl4+8uGnqDU79lXlztpVhMBtlFHeK4
         4PZ1wqUmPaprgxdXkPE1YX9yFD3oxCLmPhsXeEtAi1ufeHDXTmdReCFsyvJl/qOXNcqK
         PSNhkaAVumRtVvrTXJf/dgp6Yu1IqY3nX5DzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750148; x=1779354948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=;
        b=sNeQt6dSFWzpotWYS7WFh7I3ixEXP4ebVBlV991qIhFp/vYjO7H0PkM0/NRCXKpJ2N
         eTspwAh8DpeAqooXHiDv6GaxyFIeqKHP/WsvZV7n3nDYsDo5E3C+7cPSb7qgN5nQzMCU
         dQKa7ke5TMOqNEhVB+xZ+5TANWg5bbEDORfz43dp1dGdQOMj4ycCeq0/FZpxqZszeTzR
         qRkU8QPc6ZLapWo5CW3yBN2i93Jntx4Qz39ROxlzefqHM1I+P/P849rPg303tCkPiePQ
         xLbdWjeRSL7+tNPr2LJIwwtH9prs/pBoR0CXR9usqnFxN8Vb8noYGEaUyWBvePe8X9PW
         PrVw==
X-Forwarded-Encrypted: i=1; AFNElJ/JZeByW2pBd9urTUO7awgSZWwQYhEmHswBaUH0ceHKB560UT5P442kS4zkZyesruGUgwD+9cCGHZ3JAzTIQA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9D49EK+vCKnhq2FZaC/PMRRsyUgA5CIXxoNzVV0nAFcKeDkT0
	mKCt6h4rvOuZBZEukR/PwWRTPs5EZapA1Ax43QPu8lV3DSv8ierTPotbqJxZXhS+0Q==
X-Gm-Gg: Acq92OGMTP3yiK+S6AnyeO403GmSYxKA9so6N8lJAB1OZJLin97TWztbmCRN8RjKbvM
	0eyGNlSFSwxOZruOSrf3xSG8lpzc3CgFeKm4VG/ntW3nTC/kUBqGzt8NZTS8cq57ZOfclXwzFwV
	+TzNF6YY38x7OB9NGJz3kbMP3XgA81+MFAqg/M/6pyTRgHtU/vD67t+SBHuPniHngCG+mHa+a6y
	zOp1s4iYHDgzoZHHi6BCR9cBag+PGgewhYBtMpG7DBhPOlnCiyJaveU/Rn7nE+RI38kuEtgENku
	pRD/L1taiLRx4mZFT+9gNod/+K/kCLH1WIZ2pm4m3WFhZXdle7/nKAoiQyLq7DwOJY6Ok3qvkh/
	cPEYruPxPvwxRqnOiX4WlobZi/R1zPvw4t1oZJs0l3YGJb+W4LIj0/mlM3pOJw6rQotujRo5EGk
	h+EQ1N9hAxwxOJg8gQfEdrUcMse7m6OP1G87I/XeyhTVfw5uYbAPS3+axAtT0jGNU2pGI2Uk5dh
	x4N3h2PQQIH892iWlY=
X-Received: by 2002:a05:6a21:9995:b0:3aa:c99b:5c64 with SMTP id adf61e73a8af0-3afb1a0aa29mr7653595637.42.1778750147593;
        Thu, 14 May 2026 02:15:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 4/6] regulator: mt6359: const-ify regulator descriptions
Date: Thu, 14 May 2026 17:15:17 +0800
Message-ID: <20260514091520.2718987-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021548_652542_C6DF6BC0 
X-CRM114-Status: GOOD (  15.83  )
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
2.54.0.563.g4f69b47b94-goog


