Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4911C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 14:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyeoHLNYgE+7jRWrI7Gid0gjC7DyyjDTDuyVioxNv2s=; b=YLftzokaaWj3nCgl1mZWADCp+K
	xQEoPh2dHTm0bDI4lr/QtLs0hOwQ7hSrMC0pyB317e8EVj0Q4IYUmkdGFr2g7Or4rpO2Y4Qb1Qfkf
	3op3hBxjPJWr/+K+NNiX0NxhIxNO6sLBzV3ysnjaHlcTX2eFwfFCFBKDVk/MGXF07jee3R7Cq2bgR
	MUA7flW2PUBxY+v4XSi2pO/pxlQsGsjJVB0DnHBkbHWHmXHytacwkWrjgZHqDyGiiUJutW+YDZ2vZ
	hvNTvEntqNLdizNhN8mNQh/mGPT6oT3vjju6oHZWm3EvQe7QfyCB+Acm0KH7TUM26sJlKjuPTcL92
	Ev3SshmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olAHZ-002qsQ-9L; Wed, 19 Oct 2022 14:42:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9tS-002i7Z-Ru
	for linux-mediatek@lists.infradead.org; Wed, 19 Oct 2022 14:18:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u10so29400020wrq.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Oct 2022 07:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyeoHLNYgE+7jRWrI7Gid0gjC7DyyjDTDuyVioxNv2s=;
        b=fd2H3oNq5MmlrHBIUeEAt5HznMAZ2POQtEIeR09QEcojJHXyuzAyCpqcKtxRmHv939
         e4Z7TpU6LrsAVi7ME645aV5eRSukfeCtUwEzga1p+sF2bPzK9BT0F/bqlpvT7XTnlDMV
         U6IZmMD4pxg5qJh2kGnDnP+Xuh8nhP9JM4u68gkEm0H779qBk+j1YzU3ycjtIOVxWI0h
         /EJhekxrIKT0c9Lm9QokfFAM3McA67e5PccyWNPZoTgFMgJ9NmA1jZ0zHanvRL5oNODZ
         1Btlq0O8pbi8sKHIIhS7KNFnjAl7c3zzDyMjHImKcHVFgfGedsSQahyhJrmsMtCeF0pm
         JDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyeoHLNYgE+7jRWrI7Gid0gjC7DyyjDTDuyVioxNv2s=;
        b=0s2P5eKXOM/a0s15zb1RKHNaeA4hBI5KbySmvSVcr592wRdNEG46NIZcV+slXRdsrE
         IWipoWsoLjs2Dg77WoB3niJR8VyFnm4pgrhLzWvEoW4ZaDhhI4DAPb0i1cawYSsGYNB6
         B9Nj5ZmjUYcB2HnlNlyzP+ya2ThNN9V+yO1DhQvmqS7Rm94PNOWWQhzYSB7RArNDS5Mv
         qBXA0Wz/e6FG+GC1XGAYjZD+vyaaT/Ny7KQvxeuBhvoYiPybmsnGDyWvef9ny1FMCoHM
         86hmtnmZ8AlCvc5iJgHgjgtBdU8Yd1qw1v+mR86xep/XKcpH9hiMXRYwKnjQ37u5fObc
         cN5w==
X-Gm-Message-State: ACrzQf2NT5c+OFEsK9egO8qwRGDHhrYxziIbuxHkFKt52KjcD/jEQr23
	AX951Ae1C0tqTDojD4L+AzeHgJsjjTE+Qg==
X-Google-Smtp-Source: AMsMyM6Y0dtt2fThAblWCgNb77KCrIudxhVEmZ7gKIrjKDhykgfz+sMekViuzb9RepprVLdj7p2OkA==
X-Received: by 2002:a5d:6a48:0:b0:22e:34f0:617f with SMTP id t8-20020a5d6a48000000b0022e34f0617fmr5220654wrw.644.1666189079254;
        Wed, 19 Oct 2022 07:17:59 -0700 (PDT)
Received: from [127.0.1.1] (rtr.23.90.200.126.unyc.it. [23.90.200.126])
        by smtp.googlemail.com with ESMTPSA id n9-20020a05600c3b8900b003b4ff30e566sm2126577wms.3.2022.10.19.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:17:58 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 19 Oct 2022 16:17:55 +0200
Subject: [PATCH v6 2/4] thermal: mediatek: control buffer enablement tweaks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-up-i350-thermal-bringup-v6-2-c87b9f75550b@baylibre.com>
References: <20221018-up-i350-thermal-bringup-v6-0-c87b9f75550b@baylibre.com>
In-Reply-To: <20221018-up-i350-thermal-bringup-v6-0-c87b9f75550b@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Michael Kao <michael.kao@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666189076; l=2549;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=BUYgiWUyEmLmv5YqBlzSOjPnRULIXZAPNGFdkdhmkOQ=;
 b=DuTCH2nYQby2Rp3rUYfbKfiiNFfGGwSHOKQAOBeLAf4oWTYlJ5qTJGiqvCQvObkl5s1dpqQ5GpOv
 3eK/2IoPDmqAKTAP4GM6xGNbfcEtstHqPfVKPpPJpZh3kiuqEiPL
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_071803_004484_70CFEFCC 
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

From: Markus Schneider-Pargmann <msp@baylibre.com>

Add logic in order to be able to turn on the control buffer on MT8365.
This change now allows to have control buffer support for MTK_THERMAL_V1,
and it allows to define the register offset, and mask used to enable it.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mtk_thermal.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

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
b4 0.10.1

