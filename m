Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D21C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 14:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEWwvjO7xGoxwjM+6BZt85KGa3T/LYZTSrJmbqTF3bU=; b=b5n1EHEkaeL6Y5+YJtjcdzkHaB
	6vZ8PuNSA7rWOwz+bOWHjQt2Ne3TLpe1MRYgc8xvuCxu7uNRrraMRqFPevng3VMdsiUg0TIB5eVZ1
	R3qkSd4mx/p/e4oaQElP466658CeIIo29G61YiNvJL2g44Qlmg55BPJ+kLHupNXQOiBTongiCBS/y
	yLV7wdQHF/16/pVzGUjLZxgj9rE8k6y9ZdY810bFSvRWuRIiKzvyGu4BbKCq6bvXzK+H9XoBFNm5T
	I8/XYpARLfOxF9b5S9RDN0Nz0QBXibp1fAu2vu1SSynSqJ4HQnMifurRI3EKgijWeKuhNwZ7TM7Rh
	XzMRT0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olAFn-002qJ3-OK; Wed, 19 Oct 2022 14:41:07 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9tS-002i8O-PV
	for linux-mediatek@lists.infradead.org; Wed, 19 Oct 2022 14:18:04 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bu30so29382268wrb.8
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Oct 2022 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEWwvjO7xGoxwjM+6BZt85KGa3T/LYZTSrJmbqTF3bU=;
        b=JPYoCpWHVySUj2KBown6K+9wN/G5zHqsMmh3qaMhZ1y4i3gXcgSQd6IOETYB1BSu4U
         L+jGjEeZMs+pMlDO8di0jep6M5r1ZuyJhvZbPoNsieK1FlAPY3MzamQuUBLmH6HC9Ll+
         5w+OCskntkIpBjlhRenZHiYh7rNrIAlZrJN5X2ySJ37P/u9EJ7boiN67KkLxpx9zl2+h
         Mas1Ad+/vXdphsyr5zRSmI6QwWAFr9eOOYIE/X0WHCoXpwCI5ajIpg20+rTxs8wM0N6u
         fPQJz4U4JrhVOCrKjk/7ElV+wEIFiBSnnqRbaMEKvzU0Npt4yK+vM/SyaAgZfYIFslEy
         EVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEWwvjO7xGoxwjM+6BZt85KGa3T/LYZTSrJmbqTF3bU=;
        b=UTsH2oLHOFGdo+18PYAtS4bvwFyuXpEfSrU4UBhRPrEjGT67vHpRWeKS2wJMxtat+9
         8lYmYZexgVEWFl0W5mC0y1ay7rE0h2dOXbnACrq0Kvb4oiDgdwSKuq7m+MqQjFaYZ2as
         8JXuu/jrUW8+spzStAIuU89rvTGWrARbE8oBLZCv6k/4gDsMgiNKqfvzgG5UHCgPzckp
         TugHhSHREwjqXZdlKHja05bF/vfPYPDFiCumrHYJBBxk1TW4FZL0mTSUsFHNP0dGHC2o
         wXB8vy8wSJEVIoijygskp7g56WSeQReuwPEtNawbVZLk8cFOQuoMQ8e6KlOtG3qviWr/
         9veA==
X-Gm-Message-State: ACrzQf0uJimCrYVbLBDL+RNeSI359E5ijuDPh8T3t/f83pXM9U8xNdG5
	lquxwJwelvdOrnAG47QTeSfJLw==
X-Google-Smtp-Source: AMsMyM6riiyW54rcTOxFzL5vn9CD+Uv2GI1aqDZEuhNAFoEBtzK8A8ZQ6B4CLhT4+yLRti3tNB/2JQ==
X-Received: by 2002:a05:6000:186e:b0:22e:5dd3:e32a with SMTP id d14-20020a056000186e00b0022e5dd3e32amr5330520wri.167.1666189080144;
        Wed, 19 Oct 2022 07:18:00 -0700 (PDT)
Received: from [127.0.1.1] (rtr.23.90.200.126.unyc.it. [23.90.200.126])
        by smtp.googlemail.com with ESMTPSA id n9-20020a05600c3b8900b003b4ff30e566sm2126577wms.3.2022.10.19.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:17:59 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 19 Oct 2022 16:17:56 +0200
Subject: [PATCH v6 3/4] thermal: mediatek: add support for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-up-i350-thermal-bringup-v6-3-c87b9f75550b@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666189076; l=4121;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=HsISGoJEL6++3d6wc/n5aLyLD13GWmaS4gC5p+H31oE=;
 b=YxmmoJ3iilhYKrbWs3ooRoegnp8DHuD/EV6lt0skoNW4T4dHaUwYO1XYl5pxBoAOU2cY/DlmNHB6
 YGLJl+g9C8coG5IOD5N6duZ6gIRFqJlUi6M+UTLoZanjh1jQOlct
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_071802_897340_E00E30B7 
X-CRM114-Status: GOOD (  14.55  )
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

From: Fabien Parent <fparent@baylibre.com>

MT8365 is similar to the other SoCs supported by the driver. It has only
one bank and 3 actual sensors that can be multiplexed. There is another
one sensor that does not have usable data.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mtk_thermal.c | 68 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index d8ddceb75372..3a5df1440822 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -31,6 +31,7 @@
 #define AUXADC_CON2_V		0x010
 #define AUXADC_DATA(channel)	(0x14 + (channel) * 4)
 
+#define APMIXED_SYS_TS_CON0	0x600
 #define APMIXED_SYS_TS_CON1	0x604
 
 /* Thermal Controller Registers */
@@ -245,6 +246,17 @@ enum mtk_thermal_version {
 /* The calibration coefficient of sensor  */
 #define MT8183_CALIBRATION	153
 
+/* MT8365 */
+#define MT8365_TEMP_AUXADC_CHANNEL 11
+#define MT8365_CALIBRATION 164
+#define MT8365_NUM_CONTROLLER 1
+#define MT8365_NUM_BANKS 1
+#define MT8365_NUM_SENSORS 3
+#define MT8365_NUM_SENSORS_PER_ZONE 3
+#define MT8365_TS1 0
+#define MT8365_TS2 1
+#define MT8365_TS3 2
+
 struct mtk_thermal;
 
 struct thermal_bank_cfg {
@@ -389,6 +401,24 @@ static const int mt7622_mux_values[MT7622_NUM_SENSORS] = { 0, };
 static const int mt7622_vts_index[MT7622_NUM_SENSORS] = { VTS1 };
 static const int mt7622_tc_offset[MT7622_NUM_CONTROLLER] = { 0x0, };
 
+/* MT8365 thermal sensor data */
+static const int mt8365_bank_data[MT8365_NUM_SENSORS] = {
+	MT8365_TS1, MT8365_TS2, MT8365_TS3
+};
+
+static const int mt8365_msr[MT8365_NUM_SENSORS_PER_ZONE] = {
+	TEMP_MSR0, TEMP_MSR1, TEMP_MSR2
+};
+
+static const int mt8365_adcpnp[MT8365_NUM_SENSORS_PER_ZONE] = {
+	TEMP_ADCPNP0, TEMP_ADCPNP1, TEMP_ADCPNP2
+};
+
+static const int mt8365_mux_values[MT8365_NUM_SENSORS] = { 0, 1, 2 };
+static const int mt8365_tc_offset[MT8365_NUM_CONTROLLER] = { 0 };
+
+static const int mt8365_vts_index[MT8365_NUM_SENSORS] = { VTS1, VTS2, VTS3 };
+
 /*
  * The MT8173 thermal controller has four banks. Each bank can read up to
  * four temperature sensors simultaneously. The MT8173 has a total of 5
@@ -463,6 +493,40 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
 	.version = MTK_THERMAL_V1,
 };
 
+/*
+ * The MT8365 thermal controller has one bank, which can read up to
+ * four temperature sensors simultaneously. The MT8365 has a total of 3
+ * temperature sensors.
+ *
+ * The thermal core only gets the maximum temperature of this one bank,
+ * so the bank concept wouldn't be necessary here. However, the SVS (Smart
+ * Voltage Scaling) unit makes its decisions based on the same bank
+ * data.
+ */
+static const struct mtk_thermal_data mt8365_thermal_data = {
+	.auxadc_channel = MT8365_TEMP_AUXADC_CHANNEL,
+	.num_banks = MT8365_NUM_BANKS,
+	.num_sensors = MT8365_NUM_SENSORS,
+	.vts_index = mt8365_vts_index,
+	.cali_val = MT8365_CALIBRATION,
+	.num_controller = MT8365_NUM_CONTROLLER,
+	.controller_offset = mt8365_tc_offset,
+	.need_switch_bank = false,
+	.bank_data = {
+		{
+			.num_sensors = MT8365_NUM_SENSORS,
+			.sensors = mt8365_bank_data
+		},
+	},
+	.msr = mt8365_msr,
+	.adcpnp = mt8365_adcpnp,
+	.sensor_mux_values = mt8365_mux_values,
+	.version = MTK_THERMAL_V1,
+	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON0,
+	.apmixed_buffer_ctl_mask = (u32) ~GENMASK(29, 28),
+	.apmixed_buffer_ctl_set = 0,
+};
+
 /*
  * The MT2712 thermal controller has one bank, which can read up to
  * four temperature sensors simultaneously. The MT2712 has a total of 4
@@ -964,6 +1028,10 @@ static const struct of_device_id mtk_thermal_of_match[] = {
 	{
 		.compatible = "mediatek,mt8183-thermal",
 		.data = (void *)&mt8183_thermal_data,
+	},
+	{
+		.compatible = "mediatek,mt8365-thermal",
+		.data = (void *)&mt8365_thermal_data,
 	}, {
 	},
 };

-- 
b4 0.10.1

