Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B40DECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEAviafQzNR7Z9t5hpM5VZEKV85C26CtMxeL00PENiQ=; b=DKsimjMWFgRGd0KJo2Pups20rx
	mHPZ20Uw5qchKWrOkoVhjv4JPBzT5Baf1bDlefcEmKYgY4Aw731gCJAUP8K0tNfGq7vdHM5Q1bESU
	wUvo2OWn9JMp2KoTFv1oXRPZ4HAmLHjOSHMxsP92wd//lpa0Vm5MSklrmVL46zxbsXyF9QMzbWDgP
	8p7QH1iYA4spSYMp7i9dYzib4xfI2qXCRRMvR/ih6YQNP3o7IeTbNmXlmF5ZZrbPeM4TonekMmEuz
	TPKhQuZ+tf/dsLFtihstbwMossWsbmSedDA30JtJlMAm7sW8VHwtUsEY0KiUClWTf60nJ9ccltiDT
	l1coYAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snf4R-00000002D3h-3pEZ;
	Mon, 09 Sep 2024 14:08:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneoF-000000028nJ-0jok
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:52:04 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a8629ddffbaso51514166b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889921; x=1726494721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEAviafQzNR7Z9t5hpM5VZEKV85C26CtMxeL00PENiQ=;
        b=umz3a2BuKOn7ZCejY4QATVctQB7TStZtXNJFSbMPKG+hVDpUy+Xi77Nj+O8NJ+CQov
         JbfsuSlbHNbHkW/z768MRV5ssv2VgslmWBbICDxzMupkQUUBUyIqbNYjzOpFk1EKd7qt
         RM2kvtfq6l/WK9DjJKd2YI9A/qZD3Zr1Jw6k/O0Ko8VZsXFiMGlSDc7/LeBZLbk/2+NJ
         IbOpc7EnjkyKcT0Kc/yaP91RRTsCcPQJFYFZ2rnMzvCoyDtQbrgeICrH3yEFJVGALL8a
         WYN6jwJDdFSKfEX4XyWRp79UuxJ6NHjXO6W7TPcr8DOVIJDSlXyyHdYk/esrFkqpvPiB
         BjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889921; x=1726494721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEAviafQzNR7Z9t5hpM5VZEKV85C26CtMxeL00PENiQ=;
        b=ZJRSt+SXlinEa0u7+Yirk6+vqA2EWuZj3qIBtLKplIYGQb2n/O+SV6Ii9ZBAV6abnd
         dDaW6dW+lHiJA2g47UiAk1WvRw8IziTXdP8DsCJbfBaozC5vG/Ww9v8g+z2ycS3Q5Seq
         f+W2Q0xLHPRNRFRtoYbJ9+ZJxrUYPucZcH5A486FfRH2gJZfRGNhzm4MS2QSIElc8enA
         eRgMNJxEFO9E8jBMRvsimOTLC9OJ57vBRYR3AVZmHD0Qadc2HrX6okFW84sbA9ObtAnA
         0/0e8gASWaElxmLHq3wT37uJ5XAk7WPVkyKTrqW17Khxc618GBdTT8fyI8rLvr3x1pjQ
         eFZw==
X-Forwarded-Encrypted: i=1; AJvYcCXD9Qh7u1XWTZLtiSPxCYBjADufcYh+fsi4Mc3yGUulhEsdYx8KPp5yTNKrXTOq0JynCU2OStzWJSw3DbL1fA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpRPB+d+8RY+OhVLjXnm1N8ya/xVGsBn4yNQBpjfQvzVWsavH8
	CCanqsLFOoMsjHqU18Nm2Q2w2GRjoyQWXPkLt0N2JUJ3OFrjeZITmN9arpR6ccE=
X-Google-Smtp-Source: AGHT+IGUrqfpjeRf1rMAe7mjAkRWErGkoP/w4iRCRemp+gCnfBdE5Yx7pYFApwpFKe1jn6l3HlkbcA==
X-Received: by 2002:a17:907:3d8b:b0:a80:a193:a509 with SMTP id a640c23a62f3a-a8a885bdde7mr356155466b.2.1725889921408;
        Mon, 09 Sep 2024 06:52:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:52:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:27 +0200
Subject: [PATCH 16/17] regulator: hi6421v530: Use container_of and constify
 static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-16-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QfpMH8xpX7M5v1cNMdTuKAFwaOO0ijMMMrIuqJNJ7Fc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1mbrrIu6Do6kppOFM21iGEOSQnx+wr6TRGX
 MTTtX77+QKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79ZgAKCRDBN2bmhouD
 17PsD/49SlTRgOuT9opobBE999Eo0XMLtC18q26ggdv3vW/9xY53TZacc1sfclw2LWcHUPAzpMk
 v2yz16QkZK0z0MiqCpwIM3z7/b4Idk/YJQxNscRM645bKHaNxlYeBVQgXRpX/rgPYKwne7RRCzS
 2G8wCmaSA7KTQ4OK0I/VX1B1w1PVLAdlTp1DajYRjpFMQyCbeGMx1dw2pHFCVEZnGklOtB+JXZw
 F24rxvpdFzaZTvbSrR8OA3Qr0AbdGSNsvBjJxWxMKNmeXehb9q4X7PeP6NMEWyZuZahJhIwjPuK
 4GjDbix7naxDG3LRLFvXQVBTd3tTtlrmarGiqUrWr48TKoOIiXQ9+3DhtiZbU0jen/scVfhLIXN
 JLmEHol/WBUI0ziNAnJcMtWHmUDZeQZgehGHviTxSEQvRoCRJi8cR8jVrPFXBOeWXUp5+cELP7+
 e9OPitc1nA9XIsdv9Is1SNjUSSH8fQGeNLDqzfSNPLkGqGDi8HE/QlkfwsNJ27ITARLbditccpc
 3OaBBhaAb6Ejc/HnYwA1EcFNkR+iwRN8RBLJqsGC7GVr9tfTtG1CZDKj8B9TfcLpEpCBvVTcmUd
 wa85RJKRg3BgCuNk3/bEnS44Ywg8avfJ5Q66Hu84715P6hvPDUVsjB8PJSrlaN477J5Bxa2URNo
 S2rXdeUiFplSo8w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065203_299463_E9DABF97 
X-CRM114-Status: GOOD (  14.85  )
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
'struct hi6421v530_regulator_info' holding 'struct regulator_desc' can
be made const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

[RFT]: Not tested, only built.
---
 drivers/regulator/hi6421v530-regulator.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/hi6421v530-regulator.c b/drivers/regulator/hi6421v530-regulator.c
index a9c6c077f50d..b3ebd1624814 100644
--- a/drivers/regulator/hi6421v530-regulator.c
+++ b/drivers/regulator/hi6421v530-regulator.c
@@ -91,7 +91,7 @@ static const struct regulator_ops hi6421v530_ldo_ops;
 
 /* HI6421V530 regulator information */
 
-static struct hi6421v530_regulator_info hi6421v530_regulator_info[] = {
+static const struct hi6421v530_regulator_info hi6421v530_regulator_info[] = {
 	HI6421V530_LDO(LDO3, ldo_3_voltages, 0x061, 0xf, 0x060, 0x2,
 		   20000, 0x6),
 	HI6421V530_LDO(LDO9, ldo_9_11_voltages, 0x06b, 0x7, 0x06a, 0x2,
@@ -107,10 +107,10 @@ static struct hi6421v530_regulator_info hi6421v530_regulator_info[] = {
 static unsigned int hi6421v530_regulator_ldo_get_mode(
 					struct regulator_dev *rdev)
 {
-	struct hi6421v530_regulator_info *info;
+	const struct hi6421v530_regulator_info *info;
 	unsigned int reg_val;
 
-	info = rdev_get_drvdata(rdev);
+	info = container_of(rdev->desc, struct hi6421v530_regulator_info, rdesc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 
 	if (reg_val & (info->mode_mask))
@@ -122,10 +122,10 @@ static unsigned int hi6421v530_regulator_ldo_get_mode(
 static int hi6421v530_regulator_ldo_set_mode(struct regulator_dev *rdev,
 						unsigned int mode)
 {
-	struct hi6421v530_regulator_info *info;
+	const struct hi6421v530_regulator_info *info;
 	unsigned int new_mode;
 
-	info = rdev_get_drvdata(rdev);
+	info = container_of(rdev->desc, struct hi6421v530_regulator_info, rdesc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		new_mode = 0;
@@ -172,7 +172,6 @@ static int hi6421v530_regulator_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(hi6421v530_regulator_info); i++) {
 		config.dev = pdev->dev.parent;
 		config.regmap = pmic->regmap;
-		config.driver_data = &hi6421v530_regulator_info[i];
 
 		rdev = devm_regulator_register(&pdev->dev,
 				&hi6421v530_regulator_info[i].rdesc,

-- 
2.43.0


