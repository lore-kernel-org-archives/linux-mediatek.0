Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5E4ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44T3QUDlrtSOShQgg80wGa+L2spfOTUwB+D2KVKSm5A=; b=uPoK+sfgzo5qkJsP84GULT3Oef
	1nyDx6w00YjyKYljrwkKnYzcJ5639ZWqefC/V22SUeLGvc6I0qPjbElieP0/eN0W1e7kEa9JXkNsL
	kxLauERt3i5jEACLb1m7/Ajo7rUbsKLKbPhVp5D9WPGuCuRSysVDdR3IcUgCwDOEtnNKXkE2YyW05
	aU/pBO8nkfd4MqURLj3ow9cJq1yAsYkq7WVPI43PuvXezNxtptWUUmTYz6MokcewAoeahoIHgBUj7
	+tanwFOGN2APYmwl94CKeLnyX/5cNO7K53eoa0bM5g13fBq/6QfjESqRD+wnbii9dL0a3TjZ4qO4+
	7H5sCg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snewY-00000002BH6-1Qef;
	Mon, 09 Sep 2024 14:00:38 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneo6-000000028g1-0VUh
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:55 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a8a91c8cdd5so22185866b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889913; x=1726494713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44T3QUDlrtSOShQgg80wGa+L2spfOTUwB+D2KVKSm5A=;
        b=SZ8yi/sgkUYoxLTfg1PFRYSXiUjh7jgIbfx8+KK07WhGVViI1b30iMJuAto+AiB/jR
         VuesFJF4yAF5Lhr02orOAuiXHWqmQpNfLx9bXE6aLqUZ36XOEfqMbUzEyTvVvcundmGN
         XxOc0IIulmo48yVJWlxwwf3QtC7f3lWOepxQnBZ9zEDV/BHHaObohflA6Ftc+81fIi5Q
         QlMEX82PjA1S4q1LLwjExHp9S3MpIUEQ+iQRxd6GbOK+1IF7JXIQA/qm7U+kUvCYJhNh
         QxVsO3CAEH/wnZ1LINSse/uWnbFWwDz/5YMKHehY8AYSlbvyySNaQHR3oBWBwBouAx6H
         myAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889913; x=1726494713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44T3QUDlrtSOShQgg80wGa+L2spfOTUwB+D2KVKSm5A=;
        b=V4BCmudm55yFBCS96a04VEfq2YMXumdezrZAYyBsqy1q5d1NI1W3tymlJOnRobZyQR
         c4tKLHsHrAaYdgr6AOp8tbbaUlrq9qDnvX492nSdJhWXTzZ9yIstMVHK7g7JOUTcnf2R
         FrlrbR7iSnUfQttvmVh4f1vnFq76OZzsfYSss14jLQX6HhDK/2b4roVZnZCr1/mPyfGW
         JtaIC54F/tqlbbfqR10aXDxNfhG2Q4GEQLECHlk7eUPi55/Ppm4nVKkkGG0tMIsVCz94
         f8GtMfpqFUzls11Uw0inBsoYC3dQYxjbzs89Uyk/icUnpJxw3uRT/RJRT9cSKoBk0zir
         Hysw==
X-Forwarded-Encrypted: i=1; AJvYcCWrZQ5pk1lpScUkchmw8P9A4tnc2z9okKjB+ED9hKGhA3IRvSnDZYbuLiJni4U1UzO7jyVnrmdeuVAMg98plQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfeIqukjYQM4IH9+cXqUV7q51rhRdxgc+fxXDBQ8QFTKYBXsaQ
	RgzwS4xpx/QAw3wE3FRQE9yTfAO66CXm6VAkz+xl+TxakkRWRom04tMLgdA638A=
X-Google-Smtp-Source: AGHT+IGk9hZB0pHua/chSXERPAQ5CN/NBt3Z65k1DtKhjg05ctc2/lMYUaXmWILfKfO+QjhqrWN6NA==
X-Received: by 2002:a17:907:7f24:b0:a8d:2624:1a81 with SMTP id a640c23a62f3a-a8d262425b1mr217028666b.12.1725889912561;
        Mon, 09 Sep 2024 06:51:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:21 +0200
Subject: [PATCH 10/17] regulator: max77826: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-10-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=890;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=795en8GaERiwJn6rOfhvPyay4QNcnSep7UjxTkcJ3Mc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1hg8AgiknaqdgK+QeL6eWRxLilY4eGOB9I7
 VzqfGreegyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79YQAKCRDBN2bmhouD
 14XnD/4oSkc1OBYURG8FgVQJOiazLpoxduGRxjx7OGJtTLWiqLTszBmdOLY4L9bw/jZtrnwGiem
 UMtSHu2H3c4kCyG4oYsD+TWiP2xIa+fey3CAghooYlxJ1kgI/mAEL0UlGpA7byTHEjNPhrIyC/T
 lA1XLi2juHLKbC5/oP0WoLbgC70kGC9fqGOjfh3vrrMKhdIKlX5FHAYtDJ1/8RtTx7j023w5lSV
 RAlGBJgndI/7dx61sFHF0DL+TJEala5Jpyger5lPv7njuQc3gPajk248CejWqWC8pH/eiEqgtyO
 URIftNm8SfINoOR0YD3oDdfRmj2/l5vsymPjloXDOFvj2LF/1yPZ6JK3evtL49z6O2z6s8eeJXS
 Zi2tdu0vA32j4A6pDEXTm0i5bD5qIVQldM86sMTaqgCB9RHU+qfQ1AytvB3TQzdMhHxI4tJ8OMw
 bFRL7zbMZNGwyYXJaxjQA3wiOU7pBOR61M3QOwjOJG1Uv2c87S0uepNcJ+okq+CfyXUsSNSNbYQ
 aKgvis/E5bOVarcjmnES6UZqvirYOIHfNUo+HN130bcwEGOY80BZ1rUiYLk4wZSv7JTDDTijoqH
 EU4nwqNhX3QBsv0K0G669sjpLHX0fovxwLYrxg1hgUPGH3TMmU9KNmlTYoK8TXGlk6vMPJ2pz3C
 pGegNyy+hIMcnyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065154_253385_09B71575 
X-CRM114-Status: GOOD (  11.47  )
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
regulator_desc), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/max77826-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max77826-regulator.c b/drivers/regulator/max77826-regulator.c
index 4b656a694108..310bc8ee7af8 100644
--- a/drivers/regulator/max77826-regulator.c
+++ b/drivers/regulator/max77826-regulator.c
@@ -186,7 +186,7 @@ static const struct regulator_ops max77826_buck_ops = {
 	.set_voltage_time_sel	= max77826_set_voltage_time_sel,
 };
 
-static struct regulator_desc max77826_regulators_desc[] = {
+static const struct regulator_desc max77826_regulators_desc[] = {
 	MAX77826_LDO(1, NMOS),
 	MAX77826_LDO(2, NMOS),
 	MAX77826_LDO(3, NMOS),

-- 
2.43.0


