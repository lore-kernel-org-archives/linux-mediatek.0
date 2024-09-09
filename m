Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802A9ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzRjkUKpUqQXpsK4/eDUhuJEBuZIqvcSWctdz6VolTM=; b=sNEGIb7upR84GL8hSHX36F8Ul0
	XsKDqcuJafXlhSRZ7NdQoQ2GxsYhKpa1qQBSUuQAyEX0AIa21mezvTm1iBB0JNeFDnpsxiIEIoc0f
	KsTY6X+yu2L8wXUyxJNdmi/FOMJkNuDf5g8v0IJet9O4K3b/eV47ps+wV5A5qy4XATGWnLjDy31Y/
	xT5s04x7gKXAJwnhxIVMRv6pH0zQf488dTCuuYPJnaeQT0wo1aSgRgMxaxTSTz5ZAIbXrP1ERoEcJ
	DRAEkIXibJ2UrOz7HFMVKxiDOWLKlcn6FW9EGw+t5+slv0gCHncbspB5vgl7rMJ7CfNG8QdI7Rmv3
	g5Q92ZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snetJ-00000002AFH-0ZTP;
	Mon, 09 Sep 2024 13:57:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneo0-000000028bc-2uUy
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:50 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-374b6e433a8so137677f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889907; x=1726494707; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzRjkUKpUqQXpsK4/eDUhuJEBuZIqvcSWctdz6VolTM=;
        b=mm5WAxilpCRX4BRZKantzh+YdXIlFXMgwkWklj7bD60KF8w8qNUiIbKgK53AKovC0G
         xAcA4wc8DY/BxR5Z79YAmiFussd1wvlwZ/AzOA4/URViHMBwnf3pr1QrwMHNqXh6mJvp
         GleCVOhVB0nidQTVcjcgpAGIr1yvdbowgEc6Wu1UOUUn6m8QrkgDQ1NThE/P7ci7bozR
         5izhHNWFz8qbK0KOQ+6IuSKlRcFHqJFpGS5LCBCMSxdJ3cCYD5LSPbeBZqwcmSbZgn4R
         SmonYPqR1cUM0V7TIdeUjyhCiEZstUNTJPT/tv7tI2QCJ5/hxZ2bIiDVca3cW4e0V7NM
         T0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889907; x=1726494707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzRjkUKpUqQXpsK4/eDUhuJEBuZIqvcSWctdz6VolTM=;
        b=ULffnXFoP3XjNVVNXylx0KyEzcQqRT/s/Zi6HbyXuQXN3McNrHtxXX7xy5rMBOFZdL
         d879LVHtJvfIU3GjLmlKFDIbsDIMuMdRBK5EepwuBtnyj4fRWL8uPcIFqMXGDkxtBwux
         H2MYcHFp3X/YcsReiTURiCXkIm7NQX6cRudLzOLXa7bgTHPUKk7roOoQZui1v+ERJ9Er
         zddd44zlqDAy4CPgejRjXfU8xK2Bh6vbGCbjjizav1eB682oeiBmCmhyaeucXowfASVZ
         FX4cC3bIJXAbjDhNgx2Ft85jFh5Q4xOT+BWLWaDFYd+CVyFIXYSgFYn5j5Y9UysjpeRf
         9wJw==
X-Forwarded-Encrypted: i=1; AJvYcCUxdwa2zc5YXzNTrmr0K97MmC+8heEpDzQzW0uK+Yh/CbCN/wm6I8T7Tl4NQJj0Si81fuoQ/cYsmURoxUXgfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNMQeD9/KDgGgMvkkxkL/oPTqLk1nF2xaf38/WXcCPYVHhNppP
	dmBnq+NP6NQEhVZDgorHTTmnpO1G2Ftyrq34N8M/ruB/p0UpcsVL4EKAoMGP0HcsWKjWIYdqBJp
	i
X-Google-Smtp-Source: AGHT+IG784y6TviUcaC0Sy4/IOqmsR+O7VMUlzzzng9cVnZEltHKULUPHrwBEN/dEMaMq7ZQr9+LCw==
X-Received: by 2002:a5d:6484:0:b0:374:cd3e:7d7a with SMTP id ffacd0b85a97d-378895c38c4mr3364134f8f.2.1725889906747;
        Mon, 09 Sep 2024 06:51:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:17 +0200
Subject: [PATCH 06/17] regulator: hi6421: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-6-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=j2zwQ1BCa3xviw33TQ1yU9leknMd45i2193Hd7keRfQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1dar5m8pWkgX0YQ41g0FmZeSQHS5Ldzu5oS
 VY/Jxr8BWyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79XQAKCRDBN2bmhouD
 196TD/9RCl439qn314C+1T07HG8J93zopFOVXqjRy5Chbs5rO9u7m7CWkTeYHrZRX11Lsv/pD8I
 92sYpTkK7vooauJ0uvcp3EMdJb5DiMrjs6ZmG+mXxH6XVliP1laV5MM0KiyDQeQoxAPO9tqmen3
 yL4kC7BbpHsME4uSggz2G7SUJ/oHzaJ70GDRgB/BYnqnNvqJbP0KMsLHyhg3AxgRRw2mNawPdHe
 kwMomDZN92uAzVczA1Ynpj7p74RF9KBVIZvAlIl1efcitCaJUMOj3gEYTwRfA0jWDBKMAiCYdyE
 1JNU01he7Duw2eMYTuSdroWOk81VkunYCpFrGvuSxFvttiFIAuwhPZhVks4dAfOtRlLbqdZ1qsE
 emRlIThRFUeb+glNUU7QLIG6JXpXtd6lGIEGK1SktsF7A3zQgo1M6ukdkioa5k7PxK8kZk+FszD
 /PSqRFLSiLqTZVz66TJNUcNs+hSOo3gzi6GBco5mW02vsquNRXrREUBVUseeCvWtI8v9lPwwIIN
 zbD3lqgTWX025GXQhLUk9I56pMObo+qAux80yYS2enK5o5hc9EJjf7SC8kMWhO6BmmMDYyoViuw
 wMWN4XPk2B1WZtQb3TGYlMlGotK1q6KnFPgSzICh+WNwhXYyOorLxMRRaJl/YA2eTuoxfKpiIt9
 xHhe5ucd9x/ZU6Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065148_844995_7E7A9BCC 
X-CRM114-Status: GOOD (  12.37  )
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
hi6421_regulator_info), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/hi6421-regulator.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/hi6421-regulator.c b/drivers/regulator/hi6421-regulator.c
index 82e9e364d4d4..69d24728d6a4 100644
--- a/drivers/regulator/hi6421-regulator.c
+++ b/drivers/regulator/hi6421-regulator.c
@@ -303,7 +303,7 @@ static const struct regulator_ops hi6421_buck345_ops;
 	}
 
 /* HI6421 regulator information */
-static struct hi6421_regulator_info
+static const struct hi6421_regulator_info
 		hi6421_regulator_info[HI6421_NUM_REGULATORS] = {
 	HI6421_LDO(LDO0, hi6421_vout0, ldo_0_voltages, 0x20, 0x07, 0x20, 0x10,
 		   10000, 0x20, 8000),
@@ -384,7 +384,7 @@ static int hi6421_regulator_enable(struct regulator_dev *rdev)
 
 static unsigned int hi6421_regulator_ldo_get_mode(struct regulator_dev *rdev)
 {
-	struct hi6421_regulator_info *info;
+	const struct hi6421_regulator_info *info;
 	unsigned int reg_val;
 
 	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
@@ -397,7 +397,7 @@ static unsigned int hi6421_regulator_ldo_get_mode(struct regulator_dev *rdev)
 
 static unsigned int hi6421_regulator_buck_get_mode(struct regulator_dev *rdev)
 {
-	struct hi6421_regulator_info *info;
+	const struct hi6421_regulator_info *info;
 	unsigned int reg_val;
 
 	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
@@ -411,7 +411,7 @@ static unsigned int hi6421_regulator_buck_get_mode(struct regulator_dev *rdev)
 static int hi6421_regulator_ldo_set_mode(struct regulator_dev *rdev,
 						unsigned int mode)
 {
-	struct hi6421_regulator_info *info;
+	const struct hi6421_regulator_info *info;
 	unsigned int new_mode;
 
 	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
@@ -436,7 +436,7 @@ static int hi6421_regulator_ldo_set_mode(struct regulator_dev *rdev,
 static int hi6421_regulator_buck_set_mode(struct regulator_dev *rdev,
 						unsigned int mode)
 {
-	struct hi6421_regulator_info *info;
+	const struct hi6421_regulator_info *info;
 	unsigned int new_mode;
 
 	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
@@ -462,7 +462,7 @@ static unsigned int
 hi6421_regulator_ldo_get_optimum_mode(struct regulator_dev *rdev,
 			int input_uV, int output_uV, int load_uA)
 {
-	struct hi6421_regulator_info *info;
+	const struct hi6421_regulator_info *info;
 
 	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
 
@@ -539,7 +539,7 @@ static int hi6421_regulator_probe(struct platform_device *pdev)
 {
 	struct hi6421_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
 	struct hi6421_regulator_pdata *pdata;
-	struct hi6421_regulator_info *info;
+	const struct hi6421_regulator_info *info;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
 	int i;

-- 
2.43.0


