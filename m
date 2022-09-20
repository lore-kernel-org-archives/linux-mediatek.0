Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544E9C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 15:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmGNn02GgjwItsyH3XavnEsHEt3aT4LQ32MW9ssWl/I=; b=nhV5s4YuH1TuWjk70tvx9LEerA
	mRhu4iNNHwfgtxDDxnWIOtHPGxr0k4LyZf/kQzH4gBN0cz6r3H8nmy7OKs00zws0quihERwpClxMm
	ndce2WABCaEVTyaz0QK7UUwzMaWw6efZvdmWjm2Dsrlw22fy781/sjD9Jkk83vwDW4Z7IzZTs+Txv
	CDo4gKkQm4hJLEXkc8wRTfEyvWK9JVZ/v3PlfO9DMv2cYCptRTGpI+Ig11F7jWqJdreXZhXyJpd3t
	7rLGq5FOXLenx74Ls0BtlAhj3jFytJE2vhQg7MhAXf8o0pnQkbZBDljZ1QogonsTJW+tVf88f0VJ6
	vJHNQ5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaenB-004gjc-RF; Tue, 20 Sep 2022 15:04:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaemv-004gaC-MH
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 15:03:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso7063102wma.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 08:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=TmGNn02GgjwItsyH3XavnEsHEt3aT4LQ32MW9ssWl/I=;
        b=2F0yiM/OgzF4Ed7A5+WPvE7Mk1nzN1Iilg59ccLi7J73+lybZivFjlO3Ll5UIxSnxr
         n7RS1IA6Hr050B4gC1QLs6XV3Mz3BA3f8z8nfqiJFw72iDOujNjc20MTUUvyxD++HHJt
         VXKqtKlf/7XaMor2XknMhXTi6u0gMulhVdrofvY6mBCdvs+naTmea49V8tGFDkhQ6apP
         mN2Yrm8kSCTRgCxCM9WRqqLl2PDj2ZfxpP5jJJ+ks4kllQhhpA5p3KDAo1FX6YMmJTqE
         mOnGI5EbKnowqU0NCoM70yjtJKEc/G07WP4YvkhkZaOK7f693MBX/sSYohYU/pPNq3tb
         F8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TmGNn02GgjwItsyH3XavnEsHEt3aT4LQ32MW9ssWl/I=;
        b=FMsquuLwOPSOHnCUDBOvssSWejE3JYmSHtaA0Nsvp02qiHTWAfdUSAOWYuHYhSu9l9
         r8d3jYQkIU9RJrebY7rwzr9g6kpWzwmi/7ov4skO20nCVzWupGfOxlJAqCuUyVUykRuT
         R/QB0s8yBtBIrawjgcHvvATy5CYw5yzesNolNNDDz7FHYyjqRkuIClPR5NNxSpXjUNWt
         Xx6FonQmqko2cDTt5+Dqmgxu4C1ovKLiEepfMxO7ATv+nLUpbOYD5Z0uLyvfhDd6/fgX
         1Evrs+oKCHYxL4JqZD1Utw+VsnSUHNxteyNIemVWbAXZZaK6sryLNv1180VZZtjidR1B
         aKuw==
X-Gm-Message-State: ACrzQf3Q9o4lRp5Ut5ih3+In4Szm6++UhjGNQ945xAbyipCdcO330G/Z
	oGsnYzjiK57auGYKvk04+GVN9Q==
X-Google-Smtp-Source: AMsMyM4xTO6waY4g42gGq+iBbRpilZuIgppAQBmwNVrkXXSLy+/oePmPpSG/eXaojWrHeXW7Hhknqg==
X-Received: by 2002:a05:600c:a09:b0:3a6:8900:c651 with SMTP id z9-20020a05600c0a0900b003a68900c651mr2786317wmp.145.1663686232198;
        Tue, 20 Sep 2022 08:03:52 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id u3-20020a5d4683000000b00225239d9265sm242056wrq.74.2022.09.20.08.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:03:51 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Tue, 20 Sep 2022 17:03:49 +0200
Subject: [PATCH v5 2/4] thermal: mediatek: control buffer enablement tweaks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220920-i350-thermal-up-v5-2-123bc852d199@baylibre.com>
References: <20220920-i350-thermal-up-v5-0-123bc852d199@baylibre.com>
In-Reply-To: <20220920-i350-thermal-up-v5-0-123bc852d199@baylibre.com>
To: Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Kao <michael.kao@mediatek.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663686228; l=2347;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=5q/fW4mpAQQZom7YMno2r4M6vJl67k0unrSVbaUfEJ8=;
 b=XlVTEXZVb137T29c44XMQm5WKed4jWjkqD0vT/9S8XW0ASP1lOEMbQT3VbT6aqgiabILmrb4jfbe
 PuxqMiI2Dm2YL6lh8uL1289P7KUrvFJ/Gw6bDdoCvJikuGYoVNVy
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_080353_772291_6D9CAAF0 
X-CRM114-Status: GOOD (  12.64  )
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

From: Markus Schneider-Pargmann <msp@baylibre.com>

Add logic in order to be able to turn on the control buffer on MT8365.
This change now allows to have control buffer support for MTK_THERMAL_V1,
and it allows to define the register offset, and mask used to enable it.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 8440692e3890..d8ddceb75372 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -271,6 +271,9 @@ struct mtk_thermal_data {
 	bool need_switch_bank;
 	struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
 	enum mtk_thermal_version version;
+	u32 apmixed_buffer_ctl_reg;
+	u32 apmixed_buffer_ctl_mask;
+	u32 apmixed_buffer_ctl_set;
 };
 
 struct mtk_thermal {
@@ -514,6 +517,9 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
 	.adcpnp = mt7622_adcpnp,
 	.sensor_mux_values = mt7622_mux_values,
 	.version = MTK_THERMAL_V2,
+	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
+	.apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
+	.apmixed_buffer_ctl_set = BIT(0),
 };
 
 /*
@@ -963,14 +969,18 @@ static const struct of_device_id mtk_thermal_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
 
-static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
+static void mtk_thermal_turn_on_buffer(struct mtk_thermal *mt,
+				       void __iomem *apmixed_base)
 {
-	int tmp;
+	u32 tmp;
+
+	if (!mt->conf->apmixed_buffer_ctl_reg)
+		return;
 
-	tmp = readl(apmixed_base + APMIXED_SYS_TS_CON1);
-	tmp &= ~(0x37);
-	tmp |= 0x1;
-	writel(tmp, apmixed_base + APMIXED_SYS_TS_CON1);
+	tmp = readl(apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
+	tmp &= mt->conf->apmixed_buffer_ctl_mask;
+	tmp |= mt->conf->apmixed_buffer_ctl_set;
+	writel(tmp, apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
 	udelay(200);
 }
 
@@ -1070,8 +1080,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		goto err_disable_clk_auxadc;
 	}
 
+	mtk_thermal_turn_on_buffer(mt, apmixed_base);
+
 	if (mt->conf->version == MTK_THERMAL_V2) {
-		mtk_thermal_turn_on_buffer(apmixed_base);
 		mtk_thermal_release_periodic_ts(mt, auxadc_base);
 	}
 

-- 
b4 0.10.0

