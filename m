Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC064ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWUZynZie/tnte+8abYpr8R+Igo3OliRTpchdOYI/bM=; b=L8r6yQES7WNdwuk7iTaJL5V2fn
	QFpSrIxXkY+n4vqw9XMNTreSGxQ8c+RPxU9VcOLfH2V1EZpNLh+Y8cwdzZdRpjzE/nyNGRJP0JWHd
	vYz4e2R/6EkB5YTuAkiJmh1NrkxF86zainQgG4mLdKLaRrWHhXGYaWTN+Qw9EHTQ1K2njNH67RL15
	aajdmep3xYwgFEB5Cw7y3eIOrYREgYD8tOqmdlXxQvu7hnYcbSokPDS851Dcmq0h4DOcahMSvG66s
	H6ZQBzQR1z1ZGAV87SZ8d3P5rNek38cKQaRcQmuIxavJCQtnECUL9XbzPycVyo7viGM68a0igL1Sd
	rMuwCGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneqF-000000029Nu-0kB7;
	Mon, 09 Sep 2024 13:54:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snenu-000000028X8-3tDQ
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a8713b00219so23252166b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889901; x=1726494701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWUZynZie/tnte+8abYpr8R+Igo3OliRTpchdOYI/bM=;
        b=Yn7krBNxDyzu0lSDhsAqAhn5cDdu0EcFgHLCbpWr4nj4QSOO2jl/LOIE24gJkZGgAD
         woJaMxuh8hCvm3hz1MtmC6lkOR3V/BglCDvsd5p6c2+XodB9/BberKc5c/6d7sXvRkNu
         HjNpGre4aMCG+6SDTe+NdDDy7Aan65zgY9Jy8S0k2j8n8c8MdC0/MRMCg2N7114U5Jq7
         TpDxqtfE9MuS0evIPJwk62uhYz4ZSCK6gstym6NJK337NRd2gs+suF+/NK5Z72/Mr095
         tseuctvCrHFT4zsWsPC9p9ewBWyz5Z18tZfV+/f8SZwNV5p8INN62+Sbn+Utu0yHzww4
         uOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889901; x=1726494701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWUZynZie/tnte+8abYpr8R+Igo3OliRTpchdOYI/bM=;
        b=Vk3Qr34x1uNrmdwstrj92ub0nMxlx/dtlG9TeoCPs4Zogq7s4N9NdU1dV06qzsKU3t
         Gmu4Twhhi9zrsGKNK2t9a9IKCb4t3m6+wsIacQ5MMurm1XYARQTOp6O0fuYGKm6b1RZc
         IAy/XhPSxcqX1y1NnAZPVSzk/bbeMVojd+l3vPDeyqc4ubk1QMxdwU3V07+XpvpoxwWD
         YW7txI4aRZ70keb6dHKkjr8Sgr6YP7IeZwgt97ryQX+vd/b/8IWUUhaF0FI8S/iv6IE1
         6VP80gnpkf1+taQGSZyQiFRlgrz3k0Urtz4WOuQpi37tS8B/Be2Ouu5x0icku66jaj6p
         rkYA==
X-Forwarded-Encrypted: i=1; AJvYcCXkZyQOm7oZ9QXThqd53ioZazYzxGBmqFheU3A3losEruuOIRl9IsyYHgro5QbEZlFysj640sAN26JnE9kYnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxernXLbzdyEqyA181hImzeyc3HQSRLDEVU8LqhS4mkktnrmIFx
	f6UPKKLcxYXHQ+DvkqZslKIzY1FdHet7uW1kvMEIZNXd0/H4Jxm6qdIACQdZaAk=
X-Google-Smtp-Source: AGHT+IGolL3X79jf6IP489nGtxAGUdA8yh3dZboS2pdNZz9QxZiprwgkdAl5gVT7/E37l/eQxx6GtA==
X-Received: by 2002:a17:907:da3:b0:a83:70d0:7a1e with SMTP id a640c23a62f3a-a8a888e61a0mr406825166b.9.1725889900964;
        Mon, 09 Sep 2024 06:51:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:13 +0200
Subject: [PATCH 02/17] regulator: da9055: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-2-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5542;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7T+l2SN6pqbE6hOx06iBBg4xZdBmuecLOUZCOIFvMyE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1a58opF52+48fMopZc5Ie9MgwbFtabVspDx
 XEDU3SMO8GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79WgAKCRDBN2bmhouD
 10RTD/0R3aEMOqjsaXdiCVQWplC8EpgbLj8ZanFKI2VfbsehBl68HKT/D98YBx6czQKoVB2yrlW
 PYvASCaQUm5YWQWux7cw+yXpnbq7LVSD6eNjRVw/q6tmWdrstD+Qn7t4HN1ktZzo4oBK7rlvLMc
 x3mtMz9FRaTzTH5Nazadk42WBjKw7mxTr7QMxR442nCi5/HyqlGDYagpIJNG+XYLQbo1iVKmoDG
 6Zu3wrt2pSFqWk18Hy3ShRYELnzjdFhiSB1RnGaByDwQxBdg+u445qBb0su71+1+Bmpl9rk/jkv
 8hTlPMk4mSpkaGLWV2CNJ7MhjGvhJTL7pqhlkp43GHePiUHF+W6FVUjupqQueyG7j9xL7FNAv5I
 ZnioNWLnhS0coGeh1Bgp9zHoRR7yCcHX60En5L5lup9oBDNW6vF6HWQacApjh8sf8cz/QCGzE7x
 9wfWe3KsjQaYpjDKD37c1cjI6nF4TMPL9LyQptdgS0aIV+OxuW29I3DaXtVANuU4FZtuM8iY1V1
 Y8pmzsl+sjIGQoE9cOvo30Y6+9j/nBeVgPRRvzpfxAEnPQPCNBZJb43aa8IRZF95de7aeqSeppV
 rL2WZ13ht2jGqi8aKSJYLtaWv7WdHrP8TDes+0K/pPUhR8b7Rve8G/CRjwFQGxWWB1WKgA8ERYB
 BHYCyhf+ywSoirw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065142_978199_89282634 
X-CRM114-Status: GOOD (  14.89  )
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

Driver does not modify static data with regulators description (struct
da9055_regulator_info), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/da9055-regulator.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/da9055-regulator.c b/drivers/regulator/da9055-regulator.c
index 352547c375bd..a0d3414aa79e 100644
--- a/drivers/regulator/da9055-regulator.c
+++ b/drivers/regulator/da9055-regulator.c
@@ -73,7 +73,7 @@ struct da9055_regulator_info {
 
 struct da9055_regulator {
 	struct da9055 *da9055;
-	struct da9055_regulator_info *info;
+	const struct da9055_regulator_info *info;
 	struct regulator_dev *rdev;
 	enum gpio_select reg_rselect;
 };
@@ -81,7 +81,7 @@ struct da9055_regulator {
 static unsigned int da9055_buck_get_mode(struct regulator_dev *rdev)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	int ret, mode = 0;
 
 	ret = da9055_reg_read(regulator->da9055, info->mode.reg);
@@ -107,7 +107,7 @@ static int da9055_buck_set_mode(struct regulator_dev *rdev,
 					unsigned int mode)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	int val = 0;
 
 	switch (mode) {
@@ -129,7 +129,7 @@ static int da9055_buck_set_mode(struct regulator_dev *rdev,
 static unsigned int da9055_ldo_get_mode(struct regulator_dev *rdev)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	int ret;
 
 	ret = da9055_reg_read(regulator->da9055, info->volt.reg_b);
@@ -145,7 +145,7 @@ static unsigned int da9055_ldo_get_mode(struct regulator_dev *rdev)
 static int da9055_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	struct da9055_volt_reg volt = info->volt;
 	int val = 0;
 
@@ -167,7 +167,7 @@ static int da9055_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
 static int da9055_regulator_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	struct da9055_volt_reg volt = info->volt;
 	int ret, sel;
 
@@ -199,7 +199,7 @@ static int da9055_regulator_set_voltage_sel(struct regulator_dev *rdev,
 					    unsigned int selector)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	int ret;
 
 	/*
@@ -242,7 +242,7 @@ static int da9055_regulator_set_suspend_voltage(struct regulator_dev *rdev,
 						int uV)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	int ret;
 
 	/* Select register set B for suspend voltage ramping. */
@@ -264,7 +264,7 @@ static int da9055_regulator_set_suspend_voltage(struct regulator_dev *rdev,
 static int da9055_suspend_enable(struct regulator_dev *rdev)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 
 	/* Select register set B for voltage ramping. */
 	if (regulator->reg_rselect == NO_GPIO)
@@ -277,7 +277,7 @@ static int da9055_suspend_enable(struct regulator_dev *rdev)
 static int da9055_suspend_disable(struct regulator_dev *rdev)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 
 	/* Diselect register set B. */
 	if (regulator->reg_rselect == NO_GPIO)
@@ -396,7 +396,7 @@ static const struct regulator_ops da9055_ldo_ops = {
 	},\
 }
 
-static struct da9055_regulator_info da9055_regulator_info[] = {
+static const struct da9055_regulator_info da9055_regulator_info[] = {
 	DA9055_BUCK(BUCK1, 25, 725, 2075, 6, 9, 0xc, 2),
 	DA9055_BUCK(BUCK2, 25, 925, 2500, 6, 0, 3, 0),
 	DA9055_LDO(LDO1, 50, 900, 3300, 6, 2),
@@ -417,7 +417,7 @@ static int da9055_gpio_init(struct device *dev,
 			    struct regulator_config *config,
 			    struct da9055_pdata *pdata, int id)
 {
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	struct gpio_desc *ren;
 	struct gpio_desc *ena;
 	struct gpio_desc *rsel;
@@ -491,9 +491,9 @@ static irqreturn_t da9055_ldo5_6_oc_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static inline struct da9055_regulator_info *find_regulator_info(int id)
+static inline const struct da9055_regulator_info *find_regulator_info(int id)
 {
-	struct da9055_regulator_info *info;
+	const struct da9055_regulator_info *info;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(da9055_regulator_info); i++) {

-- 
2.43.0


