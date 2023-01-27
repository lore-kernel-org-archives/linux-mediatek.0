Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FBDC38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pizfg/aH6e9K5CXGoTWYposMWJMO47zqqi8cq0NPoNU=; b=hDnhzPe15qeNbhvgCMIhjYoxG2
	P2T5Ni69JlQyHwsdZKTzCRm7gUG4szRCqXzeZw9CCr0c1pfGHcgLRU5IFvpw+AVFQlFj/KlE7xXwZ
	I9V+/FfcYwoipG18nLHpM3UtmeDAOgFkVtwgS3LB2wQj6g4jsyeSqSIslsKoADC+eqLA5acYU2vHq
	6RlQNZUBUWg/f59Io8PPoyjoVRIrxN+hdM3ZDikDDUV0SvAu7Drm9t1P5TYGwq3i3gm5TLmBn3C00
	tAedRt5MDDR1AsMMh5pU3c2g+Ky7h49npIxGjyWD2c44qiXtdUpWxzRCx382slk8lBqIJV9XTDHKE
	HzrFcR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQx1-00FVvr-2h; Fri, 27 Jan 2023 15:47:39 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQun-00FUuS-W5
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 15:45:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id m7so5334128wru.8
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 07:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pizfg/aH6e9K5CXGoTWYposMWJMO47zqqi8cq0NPoNU=;
        b=hWjOUen6VB+r+Bf1HFCafrQMXmXl835/ZOBdz6umvqbR2mgz2vUW+KQX09IJ3SXHuK
         1A76JaZo2UnxxNAMibz/Udf2YyQ/sHrcmJnIVTJLHKRGOd2HO1rnEStn5OTWu3m7BAat
         KBvJlh88kgcaYcz41Z0B5ZdJ54uGX/gpZZpkfd+7Df2sSviqRuwpvQ63BEMF2+gO8SjX
         YXg0dXoyWCbmkn/9CWLD1BOBdUQ4OeACCNUl5j5ZUkz6TLPnEgHoSmE2k5z3FtcdD7vX
         peDYH9vTTwsaCSY/l5pDqN18pjrTIXMNDCfLmQjPIje48qWGzMBoA0sOtxKV53J/2lkR
         ckAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pizfg/aH6e9K5CXGoTWYposMWJMO47zqqi8cq0NPoNU=;
        b=mCwbrADBWd5ZjV5eWDfRtaMd44uDz9vB3zScrGeIQkT10b61P7kxvh7TpIU4Zp9N6T
         wseeeO7Z62khfMl8XY3oaCdTbkMFiXH5gYkXSim/NkeUxFiIme1GbfDwPL6Cyppp66d1
         7lvh2TVzEjgI0bv9vX5o1C1h1KM+9x4URw7leelPHDpEMA6y5WBdZQXyLFOjPcwg7Iik
         Q86+XW4JSuucjcKeGE0rTZj5cxqWnNrOJ1peuIw71wdtR6NBDIM4z8JzVUHlThswq3EL
         EucZsSGsyape3QcRbzoDEMZiBSxgtQAxg0YxUx6hxJBFxJ7DWkIQSFoZnkNOciCQn2YC
         24Yw==
X-Gm-Message-State: AFqh2koucH3KPM1J5r5Us1E5RIGV87N1sR+XZN+6WYHG4ZWVCeh1d088
	QK0G14iw59HkrAIeQ/qdcIDC4A==
X-Google-Smtp-Source: AMrXdXsxzSN0WyjWzIdnAj4L8HtS85ARxt8imhE3EgjX9zbIsSGmlZ1+pv0OcjI1zkVtWVDICMmOgw==
X-Received: by 2002:a05:6000:98d:b0:2bd:f172:94fe with SMTP id by13-20020a056000098d00b002bdf17294femr38050435wrb.17.1674834319583;
        Fri, 27 Jan 2023 07:45:19 -0800 (PST)
Received: from [127.0.1.1] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.googlemail.com with ESMTPSA id z12-20020adff74c000000b00291f1a5ced6sm4381153wrp.53.2023.01.27.07.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:45:19 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 27 Jan 2023 16:44:46 +0100
Subject: [PATCH v9 5/5] thermal: mediatek: add delay after thermal banks
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-up-i350-thermal-bringup-v9-5-55a1ae14af74@baylibre.com>
References: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
In-Reply-To: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Michael Kao <michael.kao@mediatek.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674834313; l=1567;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=fzmYYuArpv3TgjQmZi16fKXqYLE8Qo9JdtSrD1YAY5s=;
 b=MFTrCKH6Grd+hiqf7XlaT3d7PqHP384ilZ1t/Y0qFtXPGTpXcf79S/w4BloEnMVX32kgpJ/LQKIK
 q29F4NunDC16TysUENhaOg467p+38Wwi/oLGbSzCHLmF+AGZ0vQC
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_074522_115560_DC33B481 
X-CRM114-Status: GOOD (  11.97  )
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

Thermal sensor reads performed immediately after thermal bank
initialization returns bogus values. This is currently tackled by returning
0 if the temperature is bogus (exceeding 200000).

Instead, add a delay between the bank init and the thermal zone device
register to properly fix this.

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mtk_thermal.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index b8e06f6c7c42..ab7db385afb3 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -730,14 +730,6 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 
 		temp = mt->raw_to_mcelsius(mt, i, raw);
 
-		/*
-		 * The first read of a sensor often contains very high bogus
-		 * temperature value. Filter these out so that the system does
-		 * not immediately shut down.
-		 */
-		if (temp > 200000)
-			temp = 0;
-
 		if (temp > max)
 			max = temp;
 	}
@@ -1160,6 +1152,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mt);
 
+	// Delay for thermal banks to be ready
+	msleep(30);
+
 	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
 					      &mtk_thermal_ops);
 	if (IS_ERR(tzdev)) {

-- 
2.39.1

