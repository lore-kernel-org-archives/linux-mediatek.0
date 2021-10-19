Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498E2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 09:37:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE236137E
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 09:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BE236137E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwJdkj055yCnWvlzhhQkTTT10lwQVML1s97SOcsVK2w=; b=HU8BHRa4ZnSefi
	FYn+QZkDPIvGMCthBgIeWyJTNXcrOfPQH04V1KKEZ8XCsV0UWaHavE3f0HlLYFQs8eG30O+LFxYwu
	zTVR+VPuVa6DtIwoEbj963rgjeZN/pnwjR+QWsWSXjqzKmbbC+naBBpY0SqYkZNF6OmyvT26GWo3P
	pj65vEeDy9oBs05x3ZVlOWB1CszgrGlKFvcNFdjZ87t0vjMlmHJonApTmvUMYGm3JnVbDBHmsR+qr
	RiaKcWbnLY3biTK0kqm0nGWhHUA2zf1C+hA6K/JCrULJ28virekx1yLzNdFwRcA+8QWYzTTM3SJ8/
	HZA+aZDPYQllAVercvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mclYz-000giz-Q9; Tue, 19 Oct 2021 09:37:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mclXs-000gCO-3p
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 09:36:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso2428659wmb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kPR+h/6eM3ZX03Np34xb39M/9vUCOohBgw0tAFYVvnI=;
 b=AlhVW9hgjnNo39uedKxH3u/l7uXlvHUiWRAtDIywHDFbDxoH9XM514c6T010eEV0Gw
 Hx3eh5o1avyNyUnJerOvt/yuNRKPYauKG8VMR1Svm7rPUAIkAa+d71SrM50oUZffW67T
 tNjHhv4o+BYdq9I1Ko2yde5jj7WuONT4DXXpY8Y2FWtlRD+5tzkH42qaYaGyGAtiIcth
 AOO3Bj5S0a40Wa3GuMd/h+GVBjH1/zw15FQIyUj6zUFcWXXw9PJoO/I7XMo7ngcxPG0A
 0qgTUbknsGi3as/uoTS/AJdecefZ82mLCFZ4Fx/Y0BcL2Q0TdY2MkqDdwtliHYfMWYpm
 Z8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kPR+h/6eM3ZX03Np34xb39M/9vUCOohBgw0tAFYVvnI=;
 b=09U6kD88vm21R18m6DG613/Ks0d/qC5dcYs4iRTXAVWONdA8U1lMFs1grwgc+Quipa
 gSZaDPpuvwTlKwX3Wl5pvHYUBVV1k1vhuaaRVrby3ckCqo6eGsIty1rUE0ktonkURM1i
 w1Fg94GtmRo4soPoYuao/80gh3kqQVGiRstlLQTOHFWYkHwwgSglObqyN5+lOOOlghXJ
 LHV6pcAn2463wPcAkAd7/AOTx3pnpN6Yu9WfVWBrQLo1JnG4uHmg57eRcjfw8csNuukB
 zbukwtaoydy5PksADwsgpDx6j3Cnsc8rsKucD9/3/NllPZcEYujb9/+8LWdnOCzUUHrH
 aHdA==
X-Gm-Message-State: AOAM530Ylkrqcbl4eg12OgTEl8XngWr2oeCJE3jHACDqZy24+3zv4Sk/
 TH2b94brq7XH6dSU8+S3Pqqz8Q==
X-Google-Smtp-Source: ABdhPJwifFC0iTsTwueKnvIl8ODRc0aF//CslFuTXsMtJAk4sgpmd+AnEWyhwpfRTCFq/rxKEA2hrw==
X-Received: by 2002:a05:600c:4f53:: with SMTP id
 m19mr4826223wmq.118.1634636190220; 
 Tue, 19 Oct 2021 02:36:30 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id o23sm1765765wms.18.2021.10.19.02.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:36:29 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fparent@baylibre.com, khilman@baylibre.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 4/4] thermal: mediatek: add MT8365 thermal driver support
Date: Tue, 19 Oct 2021 11:34:04 +0200
Message-Id: <20211019093404.1913357-5-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019093404.1913357-1-msp@baylibre.com>
References: <20211019093404.1913357-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_023632_245265_8747CAE1 
X-CRM114-Status: GOOD (  21.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Fabien Parent <fparent@baylibre.com>

mt8365 is similar to the other SoCs supported by the driver. It has only
one bank and 3 sensors that can be multiplexed.

Additionally the buffer has to be enabled and connected to AUXADC
similar to the V2 version but at a different register offset. That's why
I added three new configuration values to define the register, mask and
bits to be set to be able to use it for both V2 and mt8365.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
[Added apmixed control register logic]
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes v1 -> v2:
    - Use of ARRAY_SIZE to avoid NUM macros.
    - Remove (void*) cast.
    - Use macros for mt7622 buffer_ctl operations.

 drivers/thermal/mtk_thermal.c | 90 ++++++++++++++++++++++++++++++++---
 1 file changed, 84 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index af6cd11eb221..fc4ea58d00ec 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -31,6 +31,7 @@
 #define AUXADC_CON2_V		0x010
 #define AUXADC_DATA(channel)	(0x14 + (channel) * 4)
 
+#define APMIXED_SYS_TS_CON0	0x600
 #define APMIXED_SYS_TS_CON1	0x604
 
 /* Thermal Controller Registers */
@@ -212,6 +213,8 @@ enum mtk_thermal_version {
 #define MT7622_NUM_SENSORS_PER_ZONE	1
 #define MT7622_TS1	0
 #define MT7622_NUM_CONTROLLER		1
+#define MT7622_BUFFER_CTL_MASK		~0x37
+#define MT7622_BUFFER_CTL_SET		0x1
 
 /* The maximum number of banks */
 #define MAX_NUM_ZONES		8
@@ -245,6 +248,14 @@ enum mtk_thermal_version {
 /* The calibration coefficient of sensor  */
 #define MT8183_CALIBRATION	153
 
+/* MT8365 */
+#define MT8365_TEMP_AUXADC_CHANNEL 11
+#define MT8365_CALIBRATION 164
+#define MT8365_NUM_BANKS 1
+#define MT8365_TS1 0
+#define MT8365_TS2 1
+#define MT8365_TS3 2
+
 struct mtk_thermal;
 
 struct thermal_bank_cfg {
@@ -271,6 +282,9 @@ struct mtk_thermal_data {
 	bool need_switch_bank;
 	struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
 	enum mtk_thermal_version version;
+	u32 apmixed_buffer_ctl_reg;
+	u32 apmixed_buffer_ctl_mask;
+	u32 apmixed_buffer_ctl_set;
 };
 
 struct mtk_thermal {
@@ -386,6 +400,25 @@ static const int mt7622_mux_values[MT7622_NUM_SENSORS] = { 0, };
 static const int mt7622_vts_index[MT7622_NUM_SENSORS] = { VTS1 };
 static const int mt7622_tc_offset[MT7622_NUM_CONTROLLER] = { 0x0, };
 
+/* MT8365 thermal sensor data */
+static const int mt8365_bank_data[] = {
+	MT8365_TS1, MT8365_TS2, MT8365_TS3
+};
+
+static const int mt8365_msr[ARRAY_SIZE(mt8365_bank_data)] = {
+	TEMP_MSR0, TEMP_MSR1, TEMP_MSR2
+};
+
+static const int mt8365_adcpnp[ARRAY_SIZE(mt8365_bank_data)] = {
+	TEMP_ADCPNP0, TEMP_ADCPNP1, TEMP_ADCPNP2
+};
+
+static const int mt8365_mux_values[ARRAY_SIZE(mt8365_bank_data)] = { 0, 1, 2 };
+static const int mt8365_tc_offset[] = { 0 };
+
+static const int mt8365_vts_index[ARRAY_SIZE(mt8365_bank_data)] = { VTS1, VTS2,
+								    VTS3 };
+
 /*
  * The MT8173 thermal controller has four banks. Each bank can read up to
  * four temperature sensors simultaneously. The MT8173 has a total of 5
@@ -460,6 +493,39 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
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
+	.num_sensors = ARRAY_SIZE(mt8365_bank_data),
+	.vts_index = mt8365_vts_index,
+	.cali_val = MT8365_CALIBRATION,
+	.num_controller = ARRAY_SIZE(mt8365_tc_offset),
+	.controller_offset = mt8365_tc_offset,
+	.need_switch_bank = false,
+	.bank_data = {
+		{
+			.num_sensors = ARRAY_SIZE(mt8365_bank_data),
+			.sensors = mt8365_bank_data
+		},
+	},
+	.msr = mt8365_msr,
+	.adcpnp = mt8365_adcpnp,
+	.sensor_mux_values = mt8365_mux_values,
+	.version = MTK_THERMAL_V1,
+	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON0,
+	.apmixed_buffer_ctl_mask = ~(u32)GENMASK(29, 28),
+};
+
 /*
  * The MT2712 thermal controller has one bank, which can read up to
  * four temperature sensors simultaneously. The MT2712 has a total of 4
@@ -514,6 +580,9 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
 	.adcpnp = mt7622_adcpnp,
 	.sensor_mux_values = mt7622_mux_values,
 	.version = MTK_THERMAL_V2,
+	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
+	.apmixed_buffer_ctl_mask = MT7622_BUFFER_CTL_MASK,
+	.apmixed_buffer_ctl_set = MT7622_BUFFER_CTL_SET,
 };
 
 /*
@@ -958,19 +1027,27 @@ static const struct of_device_id mtk_thermal_of_match[] = {
 	{
 		.compatible = "mediatek,mt8183-thermal",
 		.data = &mt8183_thermal_data,
+	},
+	{
+		.compatible = "mediatek,mt8365-thermal",
+		.data = &mt8365_thermal_data,
 	}, {
 	},
 };
 MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
 
-static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
+static void mtk_thermal_turn_on_buffer(struct mtk_thermal *mt,
+				       void __iomem *apmixed_base)
 {
 	int tmp;
 
-	tmp = readl(apmixed_base + APMIXED_SYS_TS_CON1);
-	tmp &= ~(0x37);
-	tmp |= 0x1;
-	writel(tmp, apmixed_base + APMIXED_SYS_TS_CON1);
+	if (!mt->conf->apmixed_buffer_ctl_reg)
+		return;
+
+	tmp = readl(apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
+	tmp &= mt->conf->apmixed_buffer_ctl_mask;
+	tmp |= mt->conf->apmixed_buffer_ctl_set;
+	writel(tmp, apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
 	udelay(200);
 }
 
@@ -1070,8 +1147,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		goto err_disable_clk_auxadc;
 	}
 
+	mtk_thermal_turn_on_buffer(mt, apmixed_base);
+
 	if (mt->conf->version == MTK_THERMAL_V2) {
-		mtk_thermal_turn_on_buffer(apmixed_base);
 		mtk_thermal_release_periodic_ts(mt, auxadc_base);
 	}
 
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
