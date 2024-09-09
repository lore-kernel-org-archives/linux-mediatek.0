Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67840ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Qz5yF8W3jl1pLAFz+0oNTHhctIS0pggkjmDEQxrtgU=; b=DZdaX5DlE9u2MWK875llclpjqi
	pDeTnYIhH56eMnQsHifDypaDHXCTyvRhL84x46HFN3M7PL+GKrUjIVWeAUpRIayf2N/XxNop9nUqR
	pcxtbzduvrp/n+9PPthNByyQ2f5hvHbK/CK7+2spvAcUKKU8rr8DQ7iYMXC8wgpCOKIcld1BxFNTL
	5xmLNJty8dNXLk/4S/jlSz3gRziWdx8v9bbvncsfXXTy6IG98VlegJuUGJ1wBePM7trz58fHU5xZa
	MFtleiUUCoPrUYfEB1NSl/brH9RXWbNHT57B8eAkRR6xvvOxszbQ166RdiKijX2i9hegzYNhVB7Gk
	YOYP6Xmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snf2U-00000002CkF-49tj;
	Mon, 09 Sep 2024 14:06:46 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneoD-000000028lt-3E9q
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:52:03 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a8629ddffbaso51512166b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889920; x=1726494720; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Qz5yF8W3jl1pLAFz+0oNTHhctIS0pggkjmDEQxrtgU=;
        b=e/R5WrPOLFEJHGEn4ttp7JygmxpwBMBL4eE4HZGYOzTTDbx+bbK51VGe7NyfKaagu9
         wovIWw71FjF1yX317GSBZ2ZcZ3x8Nan/okYp/uMepeXSvRM0/TwpLXdD5LArJHAvaUTS
         OVe8k/ScE4KK6TBd8aO0e8t5WSncEkuC0um+ZVcw3RK65MaoQfxLhd/Odsczd0Z1sWaz
         ozJ2hB6WMJdciSgu0c9FvfrAYy8Mg5XbxMg+/IOs0Bbey2RPDKZqninS38tszoTwlb97
         XrTUpWd28L7nECqLwmuX5PXKjjeIzAK1Gg3GN+GGx7UhKVeYf4NMAIIcII/g0TCW1X3O
         Yyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889920; x=1726494720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Qz5yF8W3jl1pLAFz+0oNTHhctIS0pggkjmDEQxrtgU=;
        b=EKw2K0Q63Q7BRnQQJPftfOAebQYXxNuQHT6oMT78gM5f8PPc8589sgbdme7y38KCR1
         t9R2ceML+VPObe35dAdejPK1eK8odEEVwV9yRMiS8WL3chfCFLlQaJ6mF0TKAmyNGPiu
         zzjz4k01RJAjRmplXiADJK0uyGVv75NkJ5I0w4G1o8Nb5Uzbzapg7DjUU8Qy0pjJkPFS
         gwNCIt1PSp27vLzGekccTyI8ASoh29eCJdXvphPL87EmhHw7niHOI/egAp6ivebUlPAB
         ljx/70UsQQNo99YrSr2A7tHGvJ4C1LUgDp/rBYtwzNNFSGMggQ28hAx5ggn6W9HgEJHM
         IJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmXBxq7RPSn9Z83xo//iuQPiPhl/gZjZZk3oOf3ZFl4AU0KV3+j20f7O4oAi1WbNT9c7zKJD2qU+AA9x6DCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3ZXaPb9EZibOgCJRlMlmqT0xrVaNouRSL+//iI/EYXRY8qrgf
	OX178wJa64o3iwqrj7DEDc9zBTrDfCvzYnR/z+0TQmjGIF0KBnkT3i7g2AfsnMg=
X-Google-Smtp-Source: AGHT+IHSuAevAtPCygtpKBvr/DQWy/NsHdMyERpLS/rDXi0gGwd6VC/KF5cHqYfeuGYHkbx6t4QX+w==
X-Received: by 2002:a17:907:3f9b:b0:a8d:2623:dd19 with SMTP id a640c23a62f3a-a8d2623e2b7mr190904166b.14.1725889920059;
        Mon, 09 Sep 2024 06:52:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:26 +0200
Subject: [PATCH 15/17] regulator: hi6421v530: Drop unused 'eco_microamp'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-15-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=30I+hQDkibrC4fpctSIcG7hdlAaMTfnXmLnvdZibnpU=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGbe/WWgVe4Femx5zZkMkuSdYYU3T+Lo1v/39prjIzLzFC2Rk
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJm3v1lAAoJEME3ZuaGi4PXrZ4P/jA0
 sscxqGelVqRBLU11Sgi+WZRl0920k7u9YS+qTqrF3B/ixnO5gkeFkh4TidRddSqKEWj+bKpdvWa
 A985jl1aSp2A42gfSWC7SYcXBpCgXKPR3E5di6RpAUS2Msj8yuwD7dJudEhah6wq+pYlfCNcI3t
 gdcDxs6cY8+kbdmCsRWXDs8X6PqojXuAlNlKPH9FrQolgKicOVgYfXvyQQrBFRcCrrFHgpPyhZT
 QMQ4Y+Vcxj5WAg057JH9m2BMVVmcUppJSaBoc1Yz1EN3ZNTm/OZY9lDFywruf24uW6wlZHz22NX
 RmmZIeW1AUBK7ZpSDY1/R74lzoVOH4CDNVotkjknx06o7Tme2QRHyUQdhghK73hGa4ojfkfM8sT
 QJ5FWuKNPfujqXIuKg8+xL2slkkJ+UJXYHL1SsIbNzNaulZXEXiO+TAJzDcChJskzf4NE/BRG9G
 jRPXYkMladjtkLEgp0jvX8Jg88lqSaM5XodDAyrrr/qjRcWLaFpKb4NIG8dViOlRndyg6o+pT0o
 kZWiKXuuzuoTtzqisFHhoSOsmDWPwmBHu2SSsFqQ0oG8eOsi3v+jwn46ji9DwGcvQu79QkLAOFq
 32/amHyTfCBs9oqbF7lZOKOeBYNkW88NZysVNbLHkW52ifnuyjykX+2B4b/QR4BpGZTi4B2bPRP
 fQWF8
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065201_901917_D8E9DDB7 
X-CRM114-Status: GOOD (  12.52  )
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

The hi6421v530_regulator_info.eco_microamp is assigned once and never
used again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/hi6421v530-regulator.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/hi6421v530-regulator.c b/drivers/regulator/hi6421v530-regulator.c
index 23924ff0c7b2..a9c6c077f50d 100644
--- a/drivers/regulator/hi6421v530-regulator.c
+++ b/drivers/regulator/hi6421v530-regulator.c
@@ -21,12 +21,10 @@
  * struct hi6421v530_regulator_info - hi6421v530 regulator information
  * @desc: regulator description
  * @mode_mask: ECO mode bitmask of LDOs; for BUCKs, this masks sleep
- * @eco_microamp: eco mode load upper limit (in uA), valid for LDOs only
  */
 struct hi6421v530_regulator_info {
 	struct regulator_desc rdesc;
 	u8 mode_mask;
-	u32 eco_microamp;
 };
 
 /* HI6421v530 regulators */
@@ -68,10 +66,9 @@ static const struct regulator_ops hi6421v530_ldo_ops;
  * emask - enable mask
  * odelay - off/on delay time in uS
  * ecomask - eco mode mask
- * ecoamp - eco mode load uppler limit in uA
  */
 #define HI6421V530_LDO(_ID, v_table, vreg, vmask, ereg, emask,		\
-		   odelay, ecomask, ecoamp) {				\
+		   odelay, ecomask) {					\
 	.rdesc = {							\
 		.name		 = #_ID,				\
 		.of_match        = of_match_ptr(#_ID),			\
@@ -90,22 +87,21 @@ static const struct regulator_ops hi6421v530_ldo_ops;
 		.off_on_delay	 = odelay,				\
 	},								\
 	.mode_mask	= ecomask,					\
-	.eco_microamp	= ecoamp,					\
 }
 
 /* HI6421V530 regulator information */
 
 static struct hi6421v530_regulator_info hi6421v530_regulator_info[] = {
 	HI6421V530_LDO(LDO3, ldo_3_voltages, 0x061, 0xf, 0x060, 0x2,
-		   20000, 0x6, 8000),
+		   20000, 0x6),
 	HI6421V530_LDO(LDO9, ldo_9_11_voltages, 0x06b, 0x7, 0x06a, 0x2,
-		   40000, 0x6, 8000),
+		   40000, 0x6),
 	HI6421V530_LDO(LDO11, ldo_9_11_voltages, 0x06f, 0x7, 0x06e, 0x2,
-		   40000, 0x6, 8000),
+		   40000, 0x6),
 	HI6421V530_LDO(LDO15, ldo_15_16_voltages, 0x077, 0x7, 0x076, 0x2,
-		   40000, 0x6, 8000),
+		   40000, 0x6),
 	HI6421V530_LDO(LDO16, ldo_15_16_voltages, 0x079, 0x7, 0x078, 0x2,
-		   40000, 0x6, 8000),
+		   40000, 0x6),
 };
 
 static unsigned int hi6421v530_regulator_ldo_get_mode(

-- 
2.43.0


