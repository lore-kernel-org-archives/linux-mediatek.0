Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF54ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5ubU/nIvmhUK+978Fu438bn7v+wIGW6OXK49tq6QXU=; b=WPu6Bgh4KcaXP9WHjWxnMgZbeV
	S+F4fXHgJXAO3ucPb+h2OvYmTcZ+NIwH4Oiw74nOESdPzWqFhC5Bjt6UejkFWb/ifRg0WClxohpOw
	Gl0c5DxMOmNsxSx0xisCQXwezySyA5Gv8/RY/6K/pyT0VOEs94pa+Im2VxhXtYZJO1v5Zbj01VHvx
	eRQRebT/jBvam8wMlx5r8HSrrIx5tQoisAYgDMCfn21mqfNmoxuSKlcSHsbe0p46XxmWr9/BjOniD
	+LfYelIQBfhZWOQuAvWuO7t7xnQBl4b7vVTBVcXO0GBWm1E9+/ho9rvx26EzcfwlFHWM3F/W2uOoW
	fmIYGD7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snerJ-000000029fe-2pCp;
	Mon, 09 Sep 2024 13:55:13 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snenx-000000028ZQ-2UJd
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:47 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a8d1a00e0d0so8613366b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889904; x=1726494704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5ubU/nIvmhUK+978Fu438bn7v+wIGW6OXK49tq6QXU=;
        b=zoNaJlO7r8DIUNIs8Vtsq83EHIk1slYL/0zn9CDxyGK2RjyTQ+w6aKWlYt4q4ZX0CK
         5fgmSw0sbqlz5aqCUhPtL/tAYeqM/34nyomhFbEkJZrRGyaY1lLJ6YL1OcWBbRXLr+9+
         REs2UUJ5ClD0ceCCAyqebjlhdilie3xKKZasJ5vwufJbeVKPAOU98ZnWcEkVDAifUt8E
         0Nh003qN0lR4UtNWvLstcuBPKOI28n6anJSP9XkWkAloQYRbgDra+QTYzTxnlQrodUSZ
         0SfHuPFw1x5J3LLPN/KMlxDHa+sWqC2E/0qqlcwu9jVVqKtF/OAFIFWetUqBGn8U4SJB
         5CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889904; x=1726494704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5ubU/nIvmhUK+978Fu438bn7v+wIGW6OXK49tq6QXU=;
        b=HILBQgY97oP8tzQYbZIT3ckqR/BEIljicNGl0bD/VIGypzpwHnkcd9g0HfQjFjcD7v
         g/6L3r0njKIy2sjGi3jE2vVfeZXmZDEyubiWCRy5D1Wr4SvL6LWaaD+i5MvFStsjljfw
         K99rcb9XTR7v/iqGiLGxFT1xi/ckISceOjxCKhu+hClquzxH5ACQVSr7yk/7flhGTg72
         LRG+nNn5BIlj4Gf2O1dDlGJo3JQPSZXInWcyZaUGMqYgCG5sCMrnvrXOyF49tvdP+DvL
         67DZwd3aEtg625n5F172acUGc2iflrLqaDEQaCa7v4oXq+E6zgmy6093aEbhLY1NXmRy
         4A/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVbitsLiqFSlQxrDdaxNIFO3ikrYjV2uo6j1rEVuWX7U+APj9TFB8MKCjMLFlaomOWL1m6lumNJ9AdyYbWfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+S8yd3X2qRdmtPwrUsQaQI3tTv9OOhUEYHtlW/XHQvb7wGySC
	mndhqpPgCLIApwhuBKRym2XB4mT4XABcukqJFo5vNjuiappAEA7MW4hmwbOOrdw=
X-Google-Smtp-Source: AGHT+IEugSgsSV0xgb1AxjeRmN9gIBXYvzLHz3hHfeWqWgETWGq55T1TciET1HOvhecAnGFDnoDFNQ==
X-Received: by 2002:a17:906:c151:b0:a86:a694:aaff with SMTP id a640c23a62f3a-a8a885c3502mr329789266b.1.1725889903950;
        Mon, 09 Sep 2024 06:51:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:15 +0200
Subject: [PATCH 04/17] regulator: da9121: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-4-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3601;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NpUoubZdNxPAP0/VQA+CguJJu4K+4PwUlJgiCI3BfEs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1bGMGjRSX40m+jFUd3qXmQIrwJMipZzv7er
 WSu6zsXuOmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79WwAKCRDBN2bmhouD
 18ryD/wIt2dvPBpg6GfCuXTwI8ZHq/Xhw0UUKgiDvi6l0M1lAqmPdNe0fQPYFdpV7zloCImte9+
 P1Rpg8oK5fB2xYfpH2YGpbqr1Uhp45D3NIXMWFiwAa7P73jVOxmn+pZE6+S75b0NBihnwBDjqv3
 NL+/U8t1DkPGHOMx/S5pQEuto+kc7rPd1Cfw99rlH0l/lzWxFCcWQlABzlx1P4BLiiA0ao2ODqu
 b/ALGdnj/u5blpYURBGbHBgJ/eHqljdezVIzg9T1mrzgl5rOOrQIhrUWD4ipvwr5NEo/W0y4nsN
 luFsScVmEoJCcxj9Zm2tdwmc8QNWI7cZjM7r6NM6X/0vujLWQfb+C8O/RrZXkdMsRey99nU+XTZ
 siCy5IFha4lpKRaEUrjQ36PxSn2j6+NhxLSi98Ap2WmDA/tL4vEu+5aU8/Vik/zUhQVzQ56Y4kG
 JsRIM+M9H+zlrQqGWCgPeN+1Tr6T8r9aAmrQ6sqclP7XEYOZBglrDetgxW/lPldfEDwGHdDizXE
 cs6pOl6y6qIifPvAtZ0g2YecHTpN6UlRVS1nPSXvnVuF0kvICRhgHpvK3wfYnEHvv/fSEzP7qzF
 2B8SBCizdJt1YFjLGsqVYGocM+c7PHZL+/nyoTU3nG99OO4KBmwJqaadqY8XKMT6J6IbL7aaDNx
 6L2A2Di5T3Pdssg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065145_834248_D5397BEE 
X-CRM114-Status: GOOD (  12.56  )
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
da9121_range), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/da9121-regulator.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/da9121-regulator.c b/drivers/regulator/da9121-regulator.c
index 5524bd314f13..ef161eb0ca27 100644
--- a/drivers/regulator/da9121-regulator.c
+++ b/drivers/regulator/da9121-regulator.c
@@ -53,7 +53,7 @@ struct da9121_range {
 	int reg_max;
 };
 
-static struct da9121_range da9121_10A_2phase_current = {
+static const struct da9121_range da9121_10A_2phase_current = {
 	.val_min =  7000000,
 	.val_max = 20000000,
 	.val_stp =  1000000,
@@ -61,7 +61,7 @@ static struct da9121_range da9121_10A_2phase_current = {
 	.reg_max = 14,
 };
 
-static struct da9121_range da9121_6A_2phase_current = {
+static const struct da9121_range da9121_6A_2phase_current = {
 	.val_min =  7000000,
 	.val_max = 12000000,
 	.val_stp =  1000000,
@@ -69,7 +69,7 @@ static struct da9121_range da9121_6A_2phase_current = {
 	.reg_max = 6,
 };
 
-static struct da9121_range da9121_5A_1phase_current = {
+static const struct da9121_range da9121_5A_1phase_current = {
 	.val_min =  3500000,
 	.val_max = 10000000,
 	.val_stp =   500000,
@@ -77,7 +77,7 @@ static struct da9121_range da9121_5A_1phase_current = {
 	.reg_max = 14,
 };
 
-static struct da9121_range da9121_3A_1phase_current = {
+static const struct da9121_range da9121_3A_1phase_current = {
 	.val_min = 3500000,
 	.val_max = 6000000,
 	.val_stp =  500000,
@@ -85,7 +85,7 @@ static struct da9121_range da9121_3A_1phase_current = {
 	.reg_max = 6,
 };
 
-static struct da9121_range da914x_40A_4phase_current = {
+static const struct da9121_range da914x_40A_4phase_current = {
 	.val_min = 26000000,
 	.val_max = 78000000,
 	.val_stp =  4000000,
@@ -93,7 +93,7 @@ static struct da9121_range da914x_40A_4phase_current = {
 	.reg_max = 14,
 };
 
-static struct da9121_range da914x_20A_2phase_current = {
+static const struct da9121_range da914x_20A_2phase_current = {
 	.val_min = 13000000,
 	.val_max = 39000000,
 	.val_stp =  2000000,
@@ -104,7 +104,7 @@ static struct da9121_range da914x_20A_2phase_current = {
 struct da9121_variant_info {
 	int num_bucks;
 	int num_phases;
-	struct da9121_range *current_range;
+	const struct da9121_range *current_range;
 };
 
 static const struct da9121_variant_info variant_parameters[] = {
@@ -188,7 +188,7 @@ static int da9121_get_current_limit(struct regulator_dev *rdev)
 {
 	struct da9121 *chip = rdev_get_drvdata(rdev);
 	int id = rdev_get_id(rdev);
-	struct da9121_range *range =
+	const struct da9121_range *range =
 		variant_parameters[chip->variant_id].current_range;
 	unsigned int val = 0;
 	int ret = 0;
@@ -219,7 +219,7 @@ static int da9121_ceiling_selector(struct regulator_dev *rdev,
 		unsigned int *selector)
 {
 	struct da9121 *chip = rdev_get_drvdata(rdev);
-	struct da9121_range *range =
+	const struct da9121_range *range =
 		variant_parameters[chip->variant_id].current_range;
 	unsigned int level;
 	unsigned int i = 0;
@@ -259,7 +259,7 @@ static int da9121_set_current_limit(struct regulator_dev *rdev,
 {
 	struct da9121 *chip = rdev_get_drvdata(rdev);
 	int id = rdev_get_id(rdev);
-	struct da9121_range *range =
+	const struct da9121_range *range =
 		variant_parameters[chip->variant_id].current_range;
 	unsigned int sel = 0;
 	int ret = 0;

-- 
2.43.0


