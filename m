Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35B6C43219
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyeoHLNYgE+7jRWrI7Gid0gjC7DyyjDTDuyVioxNv2s=; b=1AeUZZbCSMR2CUpLzPgG77fOjz
	AD01ixyCW1KJizeiSBk+V7QaZl/oDIxJe/cL8/bV+nFZpBKjEjZfvchUZNcrriLEYhazIx2areTmZ
	v29pKhnXo5w3EYcR7c7WZ4+e6BWpS24OMJzbSpWmgiiNgAwwhTpoyxou3iw/ot2zEmv2wtsdnBxQK
	xWXd5whVPx+3jHkri0aGUldu8eCVjDuPB8RLeGK7Vr8qkw3kORf2K3Wa0VBKa8wE2KOrRqE0z6ZMk
	icBjvxrZhNDWENO8Fl26DYZMOjPEE5Frk6FgvDdhqyaBSglPnbmvRk1WNuIDEgK1E2g/NtQVymrNA
	+rRw7OFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzBC-003XPd-1Z; Fri, 18 Nov 2022 11:05:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzAv-003XHP-Fn
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 11:04:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 84-20020a1c0257000000b003cfe48519a6so1012869wmc.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 03:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyeoHLNYgE+7jRWrI7Gid0gjC7DyyjDTDuyVioxNv2s=;
        b=lnmpQeD29OtlmiLODfaUO4X03Cz3jnXA45M4S1331TbJxmDH6x8HQJ/zAySAh5xYdm
         a+4U2+ntc1abC9aVdCB4cRyd0Exx6+MHxKaWhH7l6YSRsX/hyJzaupSesQAwt69vVrA2
         FlG+KFrvSWulI/s0kzqZwiurXraKgGbvgYsHK/8mf7Cu2PYSuzt2VJwaErMeIRuop2KE
         6OnR3jy6i/ijsR+EGZlV7wjMfbrvic9WlCt3iPBtd8iGKEIQINaztz7QmYXydkRmxyVW
         rvbbLgJtz3FblUDr2iV0bjq31MEDLLUGzqW9f0iAtvhatcAjwPQpiYq6cq5Vm8chAlYx
         WxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyeoHLNYgE+7jRWrI7Gid0gjC7DyyjDTDuyVioxNv2s=;
        b=KuXP7wtWYHob0/W2EdfSNlN49atRO3mqJlmZO1Mi1+uDcvXzZLRtO2Mgy2sw19CfqX
         d3SvyxDx+CTkPrAZ6yMBee2L5KYSqoHCPTFDqCF5iKwIN6BGhql0dnoXawEa2O1UZgCG
         rDACTHj6iVkLghiempzN62ub6CB7m1TjX22JVfYKXSgbIIA+qpO+r61M/8jBdKc0qbqq
         5WnTkDX/9sLe8TREUvLcUHfXr+ET9XkEdd8W8m8TogNQS6MgEHwPbpmK42agQ//jOsKv
         p+z3mDJONaX0zExmUJ7GMv+IpzzLr/CLcWe6PY0YTh8moh9dviaAQwW8jLHjmjod6/OJ
         uZJw==
X-Gm-Message-State: ANoB5pmUx0HmCFKLV/hk/mqGvDgnGhV0ndeIzvK0TQYo0NTouYm500+8
	YQ9vUkPQoOkQTJb35VZTb0ELJQ==
X-Google-Smtp-Source: AA0mqf5Z2s7uT/ojkbi4kQH8ZukBjcYstw7H33D/YaQ6a6I60O8J6S4JZCXIyK7cgUZqBWAF7EE9/w==
X-Received: by 2002:a05:600c:3b84:b0:3cf:b73f:c062 with SMTP id n4-20020a05600c3b8400b003cfb73fc062mr8004968wms.204.1668769484910;
        Fri, 18 Nov 2022 03:04:44 -0800 (PST)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id i14-20020adff30e000000b002368a6deaf8sm3316948wro.57.2022.11.18.03.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:04:44 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 18 Nov 2022 12:04:28 +0100
Subject: [PATCH v7 2/4] thermal: mediatek: control buffer enablement tweaks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-up-i350-thermal-bringup-v7-2-ebf08ff2eddb@baylibre.com>
References: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
In-Reply-To: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Michael Kao <michael.kao@mediatek.com>, linux-kernel@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1668769481; l=2549;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=BUYgiWUyEmLmv5YqBlzSOjPnRULIXZAPNGFdkdhmkOQ=;
 b=Hv/1oPehOoXJm/XPVk7GdRrpDq0r896Pz2DLWRzc0Hg/KUFU6HAQy0YmZUyUyIRjhZhl4uRFoH0m
 e7doajURDSExpVZ7R7vTDgdxAvRfsQ+qgSKZRaBIbMZjJeA6LcBF
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_030449_549011_1D82207F 
X-CRM114-Status: GOOD (  13.63  )
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

