Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F116EC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1i/0wxRYmvrq6IC7mxhkb2dRV6n4m0qx9SiTZ66LUU=; b=peN0Z6Ay18C2Uz6xfgUtlciYwQ
	RlZouRhtXrN4uWCD+d8SR09gtGobzbOqE0MCDb/L2PU7Ae7UjBlLKOBdj+GwxcIRePlvgpXLu+hl3
	u/wITOnt2yAHFGArVA9zH4EoyGyLDguYBkUsynhLSfQ2PMeerL5fhrLBNlEaDB75qoQHAXR+WXKVD
	sUzeP5jE5BvJGOZdRhjf1gubrAVjO0GEXSxiQIGgumvOze3POTIdypTNsL0MLE1przzQ66wn6OVyH
	c3Sa/KojvRlgnYPl9f4w+lAYwk5wPHMU6iacRP2/b3ppR4nafWegzO3rPNjvfpga3b5Ju6wbuGw7K
	NdMmVS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEEIo-009AEk-6p; Wed, 20 Jul 2022 18:20:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEEIN-0099zA-2U
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 18:19:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id u5so4237912wrm.4
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M1i/0wxRYmvrq6IC7mxhkb2dRV6n4m0qx9SiTZ66LUU=;
        b=wvCG72+dVbH7vC+FUiUiUlZLxbALX+w2Lr0IOikvpCsLmFn/hOeBIaU1YlrucX7yL0
         eERwlr2Ukp2ApNoHVB1QEbN8/S97JCgyHnd1G5ui1uHtcXt4utmSF8MqT9F6XOqlkOau
         BVOSKeeOoac70OVEa5AzbQQTN3HkwsEfSn9yUksbY25M800xZcNukN9m6l5Bgg5t3hKI
         gA5GkJVNEw6ZgAi8e7HqFyotAqPQ8nqnjukf+O3sZJH9sY/uP2491T06zRvdODu1SYyW
         BiWDw1S84c++vZO2E/yFCJwhoM5h8V0HJq203Dvbdpvvamr1dtjJGUwDtkjs61gAA9sP
         17/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1i/0wxRYmvrq6IC7mxhkb2dRV6n4m0qx9SiTZ66LUU=;
        b=7slwZ19zVr8B/Nv/MT7WgC2GhsuCJwpH4MSdm+pfuaJ0ZKWrt9NvXc0rC/rLv9Dqdv
         mHug+xJuKPA1HNS0WB/MWR19lx8/WXva3QVYdctrin3ic8KDMyh2sI2a9FB+iiMt0CP8
         XDiBJ+CLLB+sXIXu/N4WN/FF3Tmp1D+IdIIXN+MQMzgwgftn6bOZDfeiGA0M3SaZ/ShV
         EGjINs9rq6ARwjnbZ9izIfn+vhLSBqVmjHrRJTctmeSPf5MAV0fLG7KKFmqlQxcbV00v
         Oy6zYWL97R4PWu7slL6gouWj902lmAVKKNFFolYlVQXd+vY+/xdrVtBN3XXKfudRJNdx
         hc2w==
X-Gm-Message-State: AJIora8hs8sr5HZAsUAI9xmp9l8hfpb7izUlYefFHVGycIyFPLTlWkIJ
	IDMfI0Q+LSK+NC/FoT5Cq8gehwcVog7UqA==
X-Google-Smtp-Source: AGRyM1tJ4ApcHLOkGHWBDanLWrqSKlCjxj6zPXkPYwhUuUsm0V8vXlTq1CWrLAzMq0bV+3Xvi5jBXw==
X-Received: by 2002:a05:6000:1545:b0:21d:8f3e:a0bd with SMTP id 5-20020a056000154500b0021d8f3ea0bdmr32428629wry.697.1658341176950;
        Wed, 20 Jul 2022 11:19:36 -0700 (PDT)
Received: from amjad-ThinkPad-T490.home (2a01cb040613180084408ac44a1fa242.ipv6.abo.wanadoo.fr. [2a01:cb04:613:1800:8440:8ac4:4a1f:a242])
        by smtp.googlemail.com with ESMTPSA id z17-20020a05600c0a1100b003a31d200a7dsm3400093wmp.9.2022.07.20.11.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 11:19:35 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: rafael@kernel.org,
	fparent@baylibre.com,
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
	Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: [PATCH v2 2/4] thermal: mediatek: add support for MT8365 SoC
Date: Wed, 20 Jul 2022 20:18:52 +0200
Message-Id: <20220720181854.547881-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220720181854.547881-1-aouledameur@baylibre.com>
References: <20220720181854.547881-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_111939_148535_1BB3835B 
X-CRM114-Status: GOOD (  14.57  )
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
Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 drivers/thermal/mtk_thermal.c | 68 +++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index ede94eadddda..216eb0d61c5b 100644
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
@@ -386,6 +398,24 @@ static const int mt7622_mux_values[MT7622_NUM_SENSORS] = { 0, };
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
@@ -460,6 +490,40 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
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
@@ -958,6 +1022,10 @@ static const struct of_device_id mtk_thermal_of_match[] = {
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
2.37.1


