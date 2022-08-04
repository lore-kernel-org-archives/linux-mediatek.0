Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1512C25B06
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 22:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4QJf8ruUt+YX0IWOG7trN4ZQXuWHdSPHvGfzpjTqBk=; b=n5OhFwTytGpkccSPYXTqZQkIQ2
	CL1hKWk0lWM0zoZyv1ThKehFl0pKkl+XXixOo1HVPaqfpMxA7KIg4qfVje3rqkhZuXDunIFk0lxrb
	DJjFQTZb0/jt9of6c0kwJ/FycdQ08nvAACb0SCbTJ1v5mGKeoWIIsLPcwJzgc2elNRxZP2tzYQU8v
	6/c/k0C2Mvp2ihOoKiy2BcH4SE9UzVDTjIILRCqO4qTYGFB8uIiB+Px3K1et8pLKO5h2h8FkWd5Lo
	I60uSay9MnqXW0GIir9ENgTMtaUPyjDR29GcQEuTn7qAwdU9itoTF2jkydkapT1hRxGyV77XtMprC
	b71mbwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJjkv-009nNZ-3r; Thu, 04 Aug 2022 22:55:53 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJjhu-009laB-LP
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 22:52:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id bv3so1356194wrb.5
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 15:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=f4QJf8ruUt+YX0IWOG7trN4ZQXuWHdSPHvGfzpjTqBk=;
        b=rvexQfHPZzZ0D0GkqyhLJgFnmk7R3q2g2qgNiF2HS6jGBCBhwo0ISJafzMy+JGDQAa
         o+DjjRHYAEu/LrFNS2puklAcJ/uJPc7dbbMky+y3poaBslmZ6H5t0DHrtg7CxcozwCoC
         /O0fGXHclLxaJXmJ2Zx+BI9V4aKmkwyAk9MVqk5wqs1Yj+U04G8l/aywlcVAFXQmUNx1
         YASI/NqbzbtmLZADj4Fj+Kx8An+imvG/YdTcvRdJ5u4ZmE2lgcX7fdTKUvjiignMXfXe
         59E1BL3Mp6I0z7rcuQch+JtP/7mSiQsBI20wAU64p5WLwZFWiTzq+PBTipdqZCqIoeft
         YJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=f4QJf8ruUt+YX0IWOG7trN4ZQXuWHdSPHvGfzpjTqBk=;
        b=txC0q4jwEhCuzC7AHsSi3DWvUCWkGjsw5RW4cwZMeAgV0/Muj2K9s8eV9t41CSdz/X
         c0ymcf+ioah66R9cAmW2LMwJ1HCjCmWLScceNvyUrTPlo/WtTJq4rBGVbfHG1EY/sB6b
         MzuuV5YcEyfSfGvzHRyj9UwN0+ZfJWcLb3fbgMw2ffvDLJS0nr+1VBPs3wq73iu8cSlW
         RxQRP6022tiKxvJd8AcLTCmQx0dQ6IVu/Sgv/C0fCoDP6OI76p86gc+95AglxVULCbav
         rXg0ygQlXi55allw9hiFwT1p0lidvuM4N4dqP58NMKACYDk/eEJrGLzoqD8K59KUuruI
         F5tw==
X-Gm-Message-State: ACgBeo2r7LVpLVYskb5KfwN+LscFUyCAW9owd8EwJTsFjhBBZoad6Sei
	77x3oJwYdLBYzrMmHpZ/oBoUGg==
X-Google-Smtp-Source: AA6agR6gXUzDG0SVDH9UUJyKV7MukOfFADrlBb8tsIlCRCKwbxjhGuEBW6mFCtVwwijD4CGvXUsgUg==
X-Received: by 2002:a05:6000:178d:b0:21d:a3cc:54c8 with SMTP id e13-20020a056000178d00b0021da3cc54c8mr2511734wrg.602.1659653563947;
        Thu, 04 Aug 2022 15:52:43 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:31aa:ed2c:3f7:19d])
        by smtp.gmail.com with ESMTPSA id a16-20020a056000051000b0021f87e8945asm2495906wrf.12.2022.08.04.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:52:43 -0700 (PDT)
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
Subject: [PATCH v5 20/33] thermal/drivers/mtk: Switch to new of API
Date: Fri,  5 Aug 2022 00:43:36 +0200
Message-Id: <20220804224349.1926752-21-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804224349.1926752-1-daniel.lezcano@linexp.org>
References: <20220804224349.1926752-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_155246_724495_0E7A28AC 
X-CRM114-Status: GOOD (  14.43  )
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


