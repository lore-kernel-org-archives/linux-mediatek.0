Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557E3ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V74UlEO/iR2Z+cYu5ZNF8RMi5oBAw+IToxt2LjZmjGY=; b=qNRDnIPbloaDOeleAsdIpqgLg3
	8LZukNVQppWehDDC5Zq/Vmizvvng5U2R0knESpuonpopmVnbeVhB8vAHQC/Dj9Gqgb9bsnsaXw3mC
	pgQTHz3S7/yELybp9UU8jPp/9XFU87BwvZbNA0L8jzEcAfxT5sdHcAjiHwspkfK+Svobt+N8i1gTw
	bmTq2YYF70Hj2gS5J7dA6wOoVjEIE6BlqBT8fYBtl9f9RSut10XvLNhZhhT48FHvcJnch3V8abmTT
	xEG4s3zUNndR0aXKr5+hOaR+2QmS6JsYJxB5r+TkUHb1EAzM8mNVDBZCPNPb4yQKnHLxwv3EShN0n
	Wtqzhq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snepu-000000029Fw-2Y1b;
	Mon, 09 Sep 2024 13:53:46 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snent-000000028Wl-36M8
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a8a913874b8so24322566b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889900; x=1726494700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V74UlEO/iR2Z+cYu5ZNF8RMi5oBAw+IToxt2LjZmjGY=;
        b=PkNaXqLkxujlMbLcSnHpkNYsmCualUxbdABMvzuBR65VIQWqRMyjPy8/tiyw70Smzo
         2OxfGAJXegIN77EAvp9uGg8EI8m9pKPkmIqXzcaFhQlU4W9jEKCLUtQk9GNIxjIx7tDZ
         PV3NyP1MTzaxuTyuQuZa93vneL0tI+zfQ+mcMBVti0wjCyhpAJVhe8kj8BkEgAX/5hxv
         dvzMD3Zb+LbbSRDsSjxJohqKZBE558Zk9B+9cVkxb51OTqm4IURNbh/B1Mweas3AkrNp
         VKnKlubcevLZqVmbYQ2eM2CmFBD+F+2TigLfDEUPaDk8Ia5rCQROnuNkm0rYxjPgGhGn
         1fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889900; x=1726494700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V74UlEO/iR2Z+cYu5ZNF8RMi5oBAw+IToxt2LjZmjGY=;
        b=TLZgPD5GKgQZImoDRYiyzA9KT7NxEhpXYPYZJLkQO11qZY1V2ANj13mxwW5VaQtmmZ
         eeRCbD4s311zgLCcWEI3Xy6VggbQ1jE2YTDunI/oLeN74wY21vMqJeSlogrLkQZj523P
         ILRwDX2B2fect5VP7JLbneM9rbDRLYEMyeKRNaUvj+GAivwtW0YRFyfH05v82nDjtXEQ
         C4Ip8eZpITiM4o0oDPc8Z5W1X21BvflX9znBF3/SdD5jUWrE7jG0a8nA+r1uzn8BC2HI
         ry4WF2SSrDfU3v8lphhgonRGMlLNSUYQOR0SAsa4jKiPMiAjtEK7yezV7IMqI+FClZ3v
         EbaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCxZ/WTlqbrpMlTK66kCx5icLpQg8AnWjsofNR+QhmCtmW9qybzfWYhWPo4NJWEwMjKSdh5d4r3+g0mCuJ0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpRtKQh2GbhXkflcU9IX88H+Z5Y8XEmYzb4ge6mNubAEA02Czk
	GkcpI05ewVpzB/DU2zZ4zYXaKcHYnhYZiPFUQE8kq3YLSNHT3L5Z4jsSq+5eSo4=
X-Google-Smtp-Source: AGHT+IEvFrbQZvkEd16b+cebKNNqLJEpYUuxolVRkSwJ8SAfHDa79KyoDYaIwBLAfAfowNG3uPOfjQ==
X-Received: by 2002:a17:906:f5aa:b0:a8d:2624:1a83 with SMTP id a640c23a62f3a-a8d2624256emr211069766b.14.1725889898953;
        Mon, 09 Sep 2024 06:51:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:12 +0200
Subject: [PATCH 01/17] regulator: da9052: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-1-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3897;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8TsG7I4Aag1KJIfppBSqZ8uVGEQPJnXHOI9sdDJkZWs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1ZDiVz4RaFZ9OBGUmyELamJcU43wcaBdMnp
 7IbKy42NI+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79WQAKCRDBN2bmhouD
 1yUaD/4uEeY8qieO9UVWcfXUAM+yl+Ah/eISeRWtTgnULmCJznpSj1re/9hypLugcAre2+xitID
 Tq8ncG/lwdIQRCidg0yWXhmYTBM0IBnVwqPdTTS5aawbalrzDgmhH7kOl7hnmK3NwAjYipICwVc
 Yf1S5t0yj3dvSYPe8m4cScsFw8Yr1F1xjyMhMZefDWSgOwAUSlhI60QMpc33YtRegPIiWFTquuA
 bwzd3/+R94rpat8S/FDs0drkfSVcnGk2Ex9sYsd1gv5/koShUW2LT2su58Pxk74uJdEVNfF63CB
 i1q+bSTWMacll2wHjWYP2BupjluZtzu+6SHjjvn77ba1cexeY+yc3f4P0IGFhcU5IyrxaXGUhrj
 aTOaasOe3DZVrqd1B9iMU4B7FfCjA5QYSKNtTRqFEVhj19/BLtpp8IZj+lLCikhk82YTEynAF71
 9oh66ez1QhjOsm6PiIee6uzFOMVQjdzOAzcMO1riGr2NltOGAgFULtIAVkZ7zP1rOUV5EYq8Qm2
 Vdwqhs8uM8Q81U+AwEozboyxkthdl79nY6dwR2ANzIomtERLiQH3owdNeOjdXK7nlkbajN5TrRf
 Ott2t9N1PMbBZd1t6MISLvamkah9kJWWx7VCEEjtsC7VXLrMdaCBLyi9BlpEOczRz1Hmnqdr+I7
 MqltipNYXK0CDcA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065141_897537_18506541 
X-CRM114-Status: GOOD (  14.52  )
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
da9052_regulator_info), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/da9052-regulator.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/da9052-regulator.c b/drivers/regulator/da9052-regulator.c
index ab6f5d61b173..fbebe538a648 100644
--- a/drivers/regulator/da9052-regulator.c
+++ b/drivers/regulator/da9052-regulator.c
@@ -67,11 +67,11 @@ struct da9052_regulator_info {
 
 struct da9052_regulator {
 	struct da9052 *da9052;
-	struct da9052_regulator_info *info;
+	const struct da9052_regulator_info *info;
 	struct regulator_dev *rdev;
 };
 
-static int verify_range(struct da9052_regulator_info *info,
+static int verify_range(const struct da9052_regulator_info *info,
 			 int min_uV, int max_uV)
 {
 	if (min_uV > info->max_uV || max_uV < info->min_uV)
@@ -151,7 +151,7 @@ static int da9052_list_voltage(struct regulator_dev *rdev,
 				unsigned int selector)
 {
 	struct da9052_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9052_regulator_info *info = regulator->info;
+	const struct da9052_regulator_info *info = regulator->info;
 	int id = rdev_get_id(rdev);
 	int volt_uV;
 
@@ -175,7 +175,7 @@ static int da9052_map_voltage(struct regulator_dev *rdev,
 			      int min_uV, int max_uV)
 {
 	struct da9052_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9052_regulator_info *info = regulator->info;
+	const struct da9052_regulator_info *info = regulator->info;
 	int id = rdev_get_id(rdev);
 	int ret, sel;
 
@@ -206,7 +206,7 @@ static int da9052_regulator_set_voltage_sel(struct regulator_dev *rdev,
 					    unsigned int selector)
 {
 	struct da9052_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9052_regulator_info *info = regulator->info;
+	const struct da9052_regulator_info *info = regulator->info;
 	int id = rdev_get_id(rdev);
 	int ret;
 
@@ -237,7 +237,7 @@ static int da9052_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 						 unsigned int new_sel)
 {
 	struct da9052_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9052_regulator_info *info = regulator->info;
+	const struct da9052_regulator_info *info = regulator->info;
 	int id = rdev_get_id(rdev);
 	int ret = 0;
 
@@ -327,7 +327,7 @@ static const struct regulator_ops da9052_ldo_ops = {
 	.activate_bit = (abits),\
 }
 
-static struct da9052_regulator_info da9052_regulator_info[] = {
+static const struct da9052_regulator_info da9052_regulator_info[] = {
 	DA9052_DCDC(BUCK1, buck1, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBCOREGO),
 	DA9052_DCDC(BUCK2, buck2, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBPROGO),
 	DA9052_DCDC(BUCK3, buck3, 25, 950, 2525, 6, 6, DA9052_SUPPLY_VBMEMGO),
@@ -344,7 +344,7 @@ static struct da9052_regulator_info da9052_regulator_info[] = {
 	DA9052_LDO(LDO10, ldo10, 50, 1200, 3600, 6, 6, 0),
 };
 
-static struct da9052_regulator_info da9053_regulator_info[] = {
+static const struct da9052_regulator_info da9053_regulator_info[] = {
 	DA9052_DCDC(BUCK1, buck1, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBCOREGO),
 	DA9052_DCDC(BUCK2, buck2, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBPROGO),
 	DA9052_DCDC(BUCK3, buck3, 25, 950, 2525, 6, 6, DA9052_SUPPLY_VBMEMGO),
@@ -361,10 +361,10 @@ static struct da9052_regulator_info da9053_regulator_info[] = {
 	DA9052_LDO(LDO10, ldo10, 50, 1200, 3600, 6, 6, 0),
 };
 
-static inline struct da9052_regulator_info *find_regulator_info(u8 chip_id,
-								 int id)
+static inline const struct da9052_regulator_info *find_regulator_info(u8 chip_id,
+								      int id)
 {
-	struct da9052_regulator_info *info;
+	const struct da9052_regulator_info *info;
 	int i;
 
 	switch (chip_id) {

-- 
2.43.0


