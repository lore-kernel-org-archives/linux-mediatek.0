Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC65ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRMJ3ksjINGY0UaLIqoNPySZcUwLDGDbrGm3yr11xVU=; b=zDz/52mvi/f1JKZlHwaA7uQsad
	/ynsfQYZXKbFK5gm2Wp1HJDuZarOMzo8IBjwvMtsNs54bp9SzmjA7uUagngczQehZrxcjblFmG/QG
	9M7xbPCWXwcCPw9upz9+QnaLlrzbWP7Crvhac7aVh2OaGjLe6CSBw1wNV4DE3kLYWaZbnxVA/8K/4
	FJsp2oyBSTPEoxPhEsMQ/5+jYdykMgqhQxHjs/kEpndpXXNzmViRy57Oh+TvD7ptnWJswXG/mPOV3
	Lq/GPlnEGcKFrFiBuiysIeW6WZP9E81DbJUq34un0WkHo8LeEvaWHpSqScZvhqeAcmLy7xtXoknzW
	EeHjruTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkSw-00CARU-KE; Thu, 01 Sep 2022 13:42:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkQR-00C91S-Dj
	for linux-mediatek@lists.infradead.org; Thu, 01 Sep 2022 13:40:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id ay12so9034488wmb.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Sep 2022 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kRMJ3ksjINGY0UaLIqoNPySZcUwLDGDbrGm3yr11xVU=;
        b=tz+pOh49g5LIfkNvQbRDQDWPtLCnf17entoYbKL2+nw505LBggzs4C2YZWAniqFRJ0
         ymUdwd6If+/GI8Kwh3M2omHhrr7q+xKNz63pNZDKSRSC2iNOXXDrEJ5iNbI6oAIVwHRR
         F+wg+ytmLvqw2YfecGX3ZMnp4XJASQocTk898weiGezzx27Iggz+q8ywVjqeCkdOiUDj
         fvx30jQ1ko/3oAD9uo2o84ByRyAzcNVB/xPzKVQqFTvu9mjGWhUMscBCjyARSp+LjGCd
         GEaFjKMsUerfLweAFGJoGOzMQR2d9ezpQsQV19u4uKaH+mUyeZ+cNOC3JEMAGS8WSw3g
         JXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kRMJ3ksjINGY0UaLIqoNPySZcUwLDGDbrGm3yr11xVU=;
        b=YV6qanIYb4wdyNfu6bDnUI0lU51StNd3XwWoLtHw/K7GMwdSfkhbM2fpUbdpguhw/m
         XKuuoIXHeFekonlU4p8nLQ0gz8Z7dncIxYseXuUc5EZ31I67sKt2n59EBylxBWj2AuTj
         zU/upieeST7ivA+H9Hrzn9R4qq65YrfMu140EefR9fi915BFOfjoKm7Y+sS2r3xgTOnt
         z60QMvCXn+Yx8TEkkhE8lKyqTC53lptBeVJw/SKGFdWnUUiVG+jF7qZUokJnNzT9jGQ9
         xDTnA4uFmtaiFvPGq+ZsAZOfpOhfw9iajikB0LbSZHXPM/11zarx+KYwlPfDV2yFRaUi
         TVIg==
X-Gm-Message-State: ACgBeo1dSGzefdLfRs2eER4wOexYQ1/yNQFPb5YzTnO9/UBbEjKoBOnp
	ymNBEOJ/PTbT6pLzQqt8ZOJdqQ==
X-Google-Smtp-Source: AA6agR6GWWF+sfc4LxWEoQJKYgcYGId/NBi31aLSlC09CFU8xSKkyprOMClEdNyaTK8Hd5Ld+3GGnw==
X-Received: by 2002:a05:600c:4e94:b0:3a5:b7e5:9e64 with SMTP id f20-20020a05600c4e9400b003a5b7e59e64mr5287371wmq.26.1662039605545;
        Thu, 01 Sep 2022 06:40:05 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id e3-20020adfe383000000b0021ef34124ebsm15399016wrm.11.2022.09.01.06.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 06:40:05 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: Fabien Parent <fparent@baylibre.com>,
	rafael@kernel.org,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	robh+dt@kernel.org,
	rui.zhang@intel.com,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: [PATCH v3 3/4] thermal: mediatek: add support for MT8365 SoC
Date: Thu,  1 Sep 2022 15:39:49 +0200
Message-Id: <20220901133950.115122-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901133950.115122-1-aouledameur@baylibre.com>
References: <20220901133950.115122-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_064007_553526_46CD2D52 
X-CRM114-Status: GOOD (  15.55  )
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
---
 drivers/thermal/mtk_thermal.c | 68 +++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index b5b4401249e8..088c388da241 100644
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
2.37.3


