Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546E5ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1O1uIOK/bGt5Fhn73NS6TTBd8QYB0uOT+v/12vxEjw=; b=3v3ZwYDkHWRWD7lO2xaVhDqv0o
	hiFrtI/wHwgw0pf4IpbM6L4qWQ0fr608k4bjmeJ6QEtdeKRVSTEVMvvytG62ERitwZNNdWYJfddTs
	lWLga920W0KFBUt9ZzKfLPjyXEYu9QGkfnp+UaPofI6pJxHD7ODwaSZ617ZNhZ+u0ldlkrV8XXg8T
	fcL64gzIcIRAVbDoIvdsnDFFXEeu9+hJJyh/e3g4abX0AYURoOdEVSZmv3eXu+cLx5K0Zc860cbJn
	QNL6FoBz++RzaTbh72t9c6zh5VMRQe05ddBmEW4SAoy2BHnr5mHul3JfwXaCknMg6d5+QZGKYjlX3
	kiFxeqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snf3T-00000002Csz-48L3;
	Mon, 09 Sep 2024 14:07:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneoE-000000028mX-3WB0
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:52:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-374c6eb1d44so106942f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889921; x=1726494721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1O1uIOK/bGt5Fhn73NS6TTBd8QYB0uOT+v/12vxEjw=;
        b=QjuWK6EGG+KK02Vjnj7ATDG8JNRSZ+dl4z2dtlAkogn6XTTf2t4yiQHx7uzPFctkrS
         F2rC+CYBlbDCOpn951AXAxDDZBA5pWxKu/HjhhpBJh419dSCc8dnDuRrCC48IKS2QeL+
         q9NY5SIYrpOCuCJv/MOr6mhvABMS30g1sw7S7/Zz1D37udKiSdxw4Qu1AhKnbMqlXaxu
         UwtbANLfonEWcGuEWuHGyLYo1PqOQ03Yt0pRrTk6tYqSosmPtmiMpe+ghlxgBG8vPuY2
         Wv8+j9M8e+D/2vzohws/8BP/nNjgK9HKloy8+fUytBnWfT5tWGIMEFgKcVG4oHRpTHuF
         60iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889921; x=1726494721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1O1uIOK/bGt5Fhn73NS6TTBd8QYB0uOT+v/12vxEjw=;
        b=a42hxcUhQVcy7/94aZaVJyL8jv2l7UFtW3rIumjPP5aZdKcA4omdwGITKIhQPlWPCH
         xQBL24EnOsH9Cj1deQoH+D/35YOPNcURIud90xhQ98gGIDtu02QhDvFdSVBU3n8STOfA
         ly7Jkv8vRo7LEBpWGG1pSIaxiCXdr16eZ5E7t0rCwtt/uYZx7hCpit18aQMN6tYqfBcO
         8tc6LUWUjSxMLb0nPVEddQqYssuSPxKpdeum2Vkp6lelLoIpyOpmjIAhndWHKrfWh09Y
         amijssmbSkAIixJsABez2cYwxM1aAF/kTymx4Mob5HSMM3Q0QtHKM5Tr0XjW3qRFHB6i
         T14w==
X-Forwarded-Encrypted: i=1; AJvYcCVsGYRvekT7tGQi+frcjsbID5ffPVc8JpIrWVERFVTI/2+Yep9Se0eh3KFSf3yCb6SUv2dPk9Hto9l8WwnGdg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmx/jNygJV/3ifRirDiWssVP8hnp8vh1V48emJ58mtVBqNmOsN
	NFxjecujZmzKFkHhTdexd+nR0CIIJySaqJhdgG8MWrJ0j0gIofloeNnAG8PXeImeiofZUJi6Ky0
	+
X-Google-Smtp-Source: AGHT+IHF9qEIEL7aBOQecIEY8snSJmeWruEEkmGazQ3LXdnM7BSgPBuUwn/lQUqBri+myGdOHukvlQ==
X-Received: by 2002:a17:906:f5aa:b0:a8d:2624:1a83 with SMTP id a640c23a62f3a-a8d2624256emr211094566b.14.1725889909620;
        Mon, 09 Sep 2024 06:51:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:19 +0200
Subject: [PATCH 08/17] regulator: tps65023: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-8-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jNymqsckfanJHx8PSWuZFbKm3ihIGGZwBaMEOB5ZiE4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1frgG8hVoi2NhgvfRQHtO4lcCjJkU+gw/QJ
 a+Co9CrL8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79XwAKCRDBN2bmhouD
 16V+D/wIO0j0Z5ZUo4S3NVrBCrwGJwjcNjLMFw1+a6IDku9xFAt7zKjtyZ8CjKRUx5N47SBwAUd
 XRFalrY9n51RWZN+zZdJZGWegfZwJH8ii+Vo1LcgMN7EXNFQ+GAx8rj8BL9UhPMkbPjXKfTBDos
 zt/o/ZfRrRb/1WfdTmgMqM1Hxy+yrzi2QeBtr/zUp7nQVs2qWNdJZJscoexW3/Wgy0jCw3XaRGw
 D0qK1K/ByJAmToUC/X9VNvBvNwnPjjSKvJE+YwhGH3jRqhKdB0h9WnigXlMpZSDZtvam+ADLQnZ
 uyTLjQEt8qy/6r6X+oFC7qFKD4Q2r93Od6yBXge7eqYgLNr+A/0gj6v8FZnt8/mPEiEeOuGqI72
 VGuMSMFXxUPQyWxHvzNm9VCdrJOF5Oh2LdfMOV5+o9B4kynH0b3LCLw3wwt7dpHAaJO/94xJcTs
 5Z1L+GsPo0NqHx6zQ2WxviPQFrrTdXT1OyY+uXDQsQlG0SrV5w0/PFa+tpfXWt0mQ6xNFnq/8WH
 h+5uoRK5ESWAfHL6ZH/vBlKthPGBLgWTLh/eQ5jY2zgS+sKy/FF/0Ow7eNGn8UISr/+MB6BaFu7
 9MmfvCT98N2LNuX/IvslzkUrBlcfQ/ezRhYqU+boAGpkg/I57y1+yfKlgTexnJOsWkyq4R9PTxg
 28X/ar9rqEWZJTg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065202_973413_C3BFE2B6 
X-CRM114-Status: GOOD (  10.68  )
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
tps_driver_data), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/tps65023-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/tps65023-regulator.c b/drivers/regulator/tps65023-regulator.c
index d5757fd9a65b..3334b5b7d907 100644
--- a/drivers/regulator/tps65023-regulator.c
+++ b/drivers/regulator/tps65023-regulator.c
@@ -242,17 +242,17 @@ static const struct regulator_desc tps65023_regulators[] = {
 	TPS65023_REGULATOR_LDO(2, TPS65023_LDO2_VSEL_table, 0x70),
 };
 
-static struct tps_driver_data tps65020_drv_data = {
+static const struct tps_driver_data tps65020_drv_data = {
 	.desc = tps65020_regulators,
 	.core_regulator = TPS65023_DCDC_3,
 };
 
-static struct tps_driver_data tps65021_drv_data = {
+static const struct tps_driver_data tps65021_drv_data = {
 	.desc = tps65021_regulators,
 	.core_regulator = TPS65023_DCDC_3,
 };
 
-static struct tps_driver_data tps65023_drv_data = {
+static const struct tps_driver_data tps65023_drv_data = {
 	.desc = tps65023_regulators,
 	.core_regulator = TPS65023_DCDC_1,
 };

-- 
2.43.0


