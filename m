Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB6BC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 21:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+4pPbHoJuz+mVWdzAPQM0rRrJIgIdixEMQHV/ZC2Bo=; b=diNk9Bau6QZSFmg9wtxv13wLym
	GdcGH2Db7OHr/24gXvM9jvqvB1cStikU3N/SI7UvBAsziuS9vHOpEzJRM3tu5O2e8OkaCcyj6abWt
	CmSURPZ0LkGfYFntbGU+PvvEznjdJUEoIE59bOtTojdrjUuUV+LMUluNieadMF3fdl0tcNvLo8rJT
	oQ688bt9acyYpZ1pfEDg3SFCLSwCTqIoZHwPZHvRZymrhGrugwkJKlb06RDbUjl4W8NldUTDaCGHY
	UCfZqKr5co6FxtPwPjVq9q1kU/PWBlCjkLIXNiNVExUGsyv9MNWvu0VVxniL6xILJf76orNYHDYsR
	/l0kpwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG5d0-002h2D-Iq; Mon, 25 Jul 2022 21:28:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG5c8-002fog-P8
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 21:27:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id z13so17707618wro.13
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 14:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y+4pPbHoJuz+mVWdzAPQM0rRrJIgIdixEMQHV/ZC2Bo=;
        b=ybgq1bQw5JTchd8a23+QTuXwRK92Wz4uj6aBKpdF2CjDPZvoPh1AhpM07Vfmh4dMc9
         +tRqx6rBEv16XPq5nh6iX8HC3JyYRshmsE60ihz2r8O+CqI2ol93GArWwQMNrkBH6W+m
         2ePcLAhTwaIumi7L06v3eb9pOqxjmey+jBW6XddLcAyz3j1KwRL6ZLYq2v8dxPzpTfc7
         2SrtgSPNtG+T7It9Vdb/E/KOZ8crbZVMl4ov7bkEYTqNmaOC1/8h6KRfIwCF46QQfN6j
         hVXA8WON6RQn+Mu82nrUm4XVYx6Xkl52eomujzkl6kaagqE8VBZZaKKKuf065ykyWQEB
         NVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y+4pPbHoJuz+mVWdzAPQM0rRrJIgIdixEMQHV/ZC2Bo=;
        b=Pe0na/ifbGqjibNtaN8jMbvSM+A8o4s+KOqk5MeVs8cesgIv+32zROD+aGcepqpaHb
         w2+MMqEwAvbRdZ9Kz0YB8lKp9ps/vptCGwbzV+7/dr0Puq5XObcxspZRwahNJtBaiply
         0v+FEOWyEisHWHjyIkss9MNnYJUYBZhG6jsia07AfTYa9xC3Q1LL8/Tmymv0fywDVimE
         3UPE5HMiXn0uRHPI4TWyZz/nqoeN7IH+N0RoBnzkxylxI+Ss2dmUQ3wYiFNS7xoWnUYs
         +kMagEPnVULTLDaTBd9JbNptbZXjbUQ9DlzqcV6Ihncu5ZaFWfA2i1ZgjBcsbrnhMX9Q
         16Jg==
X-Gm-Message-State: AJIora9RUkIJXYiJuvp8cC3mCrUefBsPFoUpw5Re43QlpqhNMtHnqz6X
	BCXF7aeWP1Pe+vdeSUxT18oXyA==
X-Google-Smtp-Source: AGRyM1tVVTPgbv6m/PfwEAw+Q3+sp9/OXWPj7BXkkTzeL9SI/ci+YdWF7OjntDndJ+hlHcYZWICbpA==
X-Received: by 2002:a5d:604a:0:b0:21e:6b84:a4d8 with SMTP id j10-20020a5d604a000000b0021e6b84a4d8mr8479548wrt.187.1658784464351;
        Mon, 25 Jul 2022 14:27:44 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:1780:8e54:dd38:6668])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d52d1000000b0021d68a504cbsm12668772wrv.94.2022.07.25.14.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 14:27:44 -0700 (PDT)
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
	Amit Kucheria <amitk@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v2 20/32] thermal/drivers/mtk: Switch to new of API
Date: Mon, 25 Jul 2022 23:26:25 +0200
Message-Id: <20220725212637.2818207-21-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725212637.2818207-1-daniel.lezcano@linexp.org>
References: <20220725212637.2818207-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_142744_835772_8C32CD52 
X-CRM114-Status: GOOD (  15.16  )
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


