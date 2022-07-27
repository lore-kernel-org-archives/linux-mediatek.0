Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1286FC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4QJf8ruUt+YX0IWOG7trN4ZQXuWHdSPHvGfzpjTqBk=; b=tFpIyE5sBP84XeieXfvGZ20qjs
	GPNPwBukSNs4vGr9r/ylYQHiOP75PX3PMS2OtXJNDR1gjAijSL2sg4JHmE+b7mCNvh1UTBjmuOod0
	22xQlstoIIbgsnTIXbFf1hKdYMf2ZksFd6S8qyoobFdp/aPl4ReCDpsdTcA9IP4vjdPWnYlp7itU7
	wCcedONM4pftbUmZni9sbk8JcKOGt1KjZut8+rJEIw/19/3+GiaXp3asVvu/3j06sFnGe4JJ7xSBi
	6hC72xEu19M3jusOGrPrTzqPK9K8RMIaVYKlutTlR9d/105ecOrjPBAcdmZEbM0w2kaetcyxGPzHm
	CBuhj23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGoF8-000JUL-Kg; Wed, 27 Jul 2022 21:06:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGoCE-000HLS-Os
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 21:04:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h8so26064349wrw.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 14:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f4QJf8ruUt+YX0IWOG7trN4ZQXuWHdSPHvGfzpjTqBk=;
        b=139xpVPAbf4/6WQEmBothCI7+YWLiMxD7qqrCd14879SEYl9In9xOYAqQy/QRY4JMc
         A7I6mNxWd/1YV/TMoH6KcBJw0Vpnt1faNDgLl30hkJvKCn/wKeqRly2ZYlxEOSv+e6nA
         SxTl6jOPVh6gglT2H5OjVlVkvv6Nj63MXLXIogPLt1S+BwZUv+HQMK4/6Vux+8+gPiLU
         ik+4fis2qt94kCpQbz7nP6W736pm1lopr6/RClgEDQLC4b8owDW11BTXDfBdyCsGKppB
         f5M/Z/rDCQbVPHYFjn6P9r4Hqftz2pEE9+I7sX0NI8MHZmPnILhFUSPpmDonqh7Z73E7
         lpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f4QJf8ruUt+YX0IWOG7trN4ZQXuWHdSPHvGfzpjTqBk=;
        b=HW0ReFDcMnKBjXx9jivx6w+tZnnXSIsT6lsMIR9Fh3W9Ej6tDik8+KbzU+oPoDBuhR
         v9Bu5k1jyZI9z9XZGZC+HJNIuSWS+ouj3Yf6zTonyszZbUmb//VWikRsam5mJW5YepZt
         J3Eoig/WWgyYzse5wSGQv9c9pzQN2bPfib40x8YNVLkAMiHa/DmEWp8+ZcgZJQz0Qs9R
         OXfAQbXXUnMrWnhIiNdDZng/+FNZK1xBbnH4qi4lxIgi9vaE66LWwG+4x7Yhq64z+NDi
         2PvRjAdFlrZwKLelLbTBpoXSY+/xJlMSmd/S/FZF8tBrfguqxPKbGP33hCerkjJWwbFy
         Lpiw==
X-Gm-Message-State: AJIora+jUvz81SHt2ILu9y3w5diqsV7wOUsSffX0IlVfAp+EOguIbO4C
	f/ALFfdanHHsiR6nA8TCQhTAdw==
X-Google-Smtp-Source: AGRyM1uKDZW3ud2tPr2zObS8Pq1dlFDn2x8npRuWqIBVJ6Ty2tIw4bgvpOrIrm1bV2Lq2c5Wny1rjw==
X-Received: by 2002:adf:e7c9:0:b0:21d:8716:e08d with SMTP id e9-20020adfe7c9000000b0021d8716e08dmr15451054wrn.328.1658955838331;
        Wed, 27 Jul 2022 14:03:58 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:65a8:ebd8:4098:d9d0])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003a38606385esm37908wmq.3.2022.07.27.14.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 14:03:58 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Cc: rui.zhang@intel.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	abailon@baylibre.com,
	lukasz.luba@arm.com,
	broonie@kernel.org,
	damien.lemoal@opensource.wdc.com,
	heiko@sntech.de,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	talel@amazon.com,
	thierry.reding@gmail.com,
	digetx@gmail.com,
	jonathanh@nvidia.com,
	anarsoul@gmail.com,
	tiny.windzz@gmail.com,
	baolin.wang7@gmail.com,
	f.fainelli@gmail.com,
	bjorn.andersson@linaro.org,
	mcoquelin.stm32@gmail.com,
	glaroque@baylibre.com,
	miquel.raynal@bootlin.com,
	shawnguo@kernel.org,
	niklas.soderlund@ragnatech.se,
	matthias.bgg@gmail.com,
	j-keerthy@ti.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v3 20/32] thermal/drivers/mtk: Switch to new of API
Date: Wed, 27 Jul 2022 23:02:41 +0200
Message-Id: <20220727210253.3794069-21-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
References: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_140358_837935_814B21F8 
X-CRM114-Status: GOOD (  14.94  )
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

The thermal OF code has a new API allowing to migrate the OF
initialization to a simpler approach. The ops are no longer device
tree specific and are the generic ones provided by the core code.

Convert the ops to the thermal_zone_device_ops format and use the new
API to register the thermal zone with these generic ops.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mtk_thermal.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index ede94eadddda..8440692e3890 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -679,9 +679,9 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 	return max;
 }
 
-static int mtk_read_temp(void *data, int *temperature)
+static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
 {
-	struct mtk_thermal *mt = data;
+	struct mtk_thermal *mt = tz->devdata;
 	int i;
 	int tempmax = INT_MIN;
 
@@ -700,7 +700,7 @@ static int mtk_read_temp(void *data, int *temperature)
 	return 0;
 }
 
-static const struct thermal_zone_of_device_ops mtk_thermal_ops = {
+static const struct thermal_zone_device_ops mtk_thermal_ops = {
 	.get_temp = mtk_read_temp,
 };
 
@@ -1082,8 +1082,8 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mt);
 
-	tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
-						     &mtk_thermal_ops);
+	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
+					      &mtk_thermal_ops);
 	if (IS_ERR(tzdev)) {
 		ret = PTR_ERR(tzdev);
 		goto err_disable_clk_peri_therm;
-- 
2.25.1


