Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F525C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:58:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0879B610CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0879B610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peuAQ3XWvw40XatMSmdXWKh3xMuI452ZC54mfzMH114=; b=hPvyAq06SzRsds
	dlbYuOnszvow5gBVU+8w8Nd0kJEBX0t6V5OiNNZAFS2Wmt4yfpIHkFSy/SPSGOBxfsjJ2zVc1X2J8
	nDiZef53hAJ/Wc1EcxqUlaxlkENi4nkXaqIbJOTEpA+T+TfNI1XY61HF8mH3YuMUpAfYx06f7CT0k
	Vlpg2v8meZGC3wEcgQbZhS1B/i7ankQ4pCz+kh3NtWRLNy/ozEr2GNxkGEOBxvISZX0BGQn9vjCJW
	IJ7+AsTj8y43h9IlTL6qqAGHzyKYSb0bX0xd0yXEte9pklt4hihkoAERrYoQ2xWjQhvnQtsTkpkBT
	kwx2IltjrAFAdTnI4IiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb1FJ-003LEY-Qq; Thu, 14 Oct 2021 13:58:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb1ER-003KuS-Qq
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 13:57:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id t2so19801590wrb.8
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 06:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AD9oqEQRrt+K7PF8CXPWRak3iEsR+fAEIvT2MdmSXYg=;
 b=TfoGK/YO6N+ITiDgcTK73gZE3NycgEqVa42Qf+1UO19RkHZTAwACZo/Cmjcmyp6DC+
 jjOEmmUrU6AS2a+z6PLo+veVAOpA8ug9q/KSPIy+V+It3Ql3VPEcN1CES0d1MSR/alzy
 zTRJ5zDFqAL+v0ysrZxWiCOo7ps5tOpGeX6sWN4lgwSaWd+hoPiVPer5X6BpT8sqS1Y9
 WoZ1Rbs65CYx2T5s5OYWvBlIaVl0r9BIOV8NAdYIlRnCMxOUIbfskfDg4EXOwAYBvCa8
 34G71isUqFGMmYn3xDD+2dw342v5dqFtt+bbhU2WP2g0HPZ8mA8iIqW8OUb3oiKKsiEG
 eLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AD9oqEQRrt+K7PF8CXPWRak3iEsR+fAEIvT2MdmSXYg=;
 b=LQMgwYevRwX0njHbUCBoEISLZZ0dfXxx1ZgSdi32qxq9RJsp8KCNVYhRlUcmovOmG/
 oT1YOAEMT5EsVM8ArnZvnEmdCS+qDnzELWxjwpfnbIMPmV7kBlR5VXfk9D0u6H/f2Adv
 2l/h9KZjI+HVKTkhS+hesWdfcfYTLmoKo8S9+kbuIxO7W3gzntSrj2Evc3bAM2denONw
 8O9qKXU/9CwTXswLYjgC7vUUHVlycdEMQBDHuP1n1Wo+sXaTuvGnUtG1KiSd60e6pu/5
 fY8XpKIefacQSSpxVIVJPSzSDruNIggwgo1M5KgRamXScFhdtjiln39TIcR07+LtBJ6S
 eXLg==
X-Gm-Message-State: AOAM532Dkqo8PFcpv3NtOWfYnYr5IxvVsf1YY9hXdk2X9Ppl0Cba6HF5
 MICwNsPaXle1Fq0BUEPmF1ZyTw==
X-Google-Smtp-Source: ABdhPJxf6LFxs3+QRVjtPhFm8mbj6cscqF3nefyMxTfWqwVufhx+YS+YovqZvQSFJ2KDY/Mwv1LV9g==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr6830961wrs.190.1634219834060; 
 Thu, 14 Oct 2021 06:57:14 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id d1sm2596480wrr.72.2021.10.14.06.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:57:13 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fparent@baylibre.com, khilman@baylibre.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 3/3] thermal: mediatek: add MT8365 thermal driver support
Date: Thu, 14 Oct 2021 15:56:36 +0200
Message-Id: <20211014135636.3644166-4-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014135636.3644166-1-msp@baylibre.com>
References: <20211014135636.3644166-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_065715_901326_4CD90359 
X-CRM114-Status: GOOD (  19.95  )
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
 drivers/thermal/mtk_thermal.c | 91 ++++++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 93ee043d70da..7a75ae8231f2 100644
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
@@ -271,6 +283,9 @@ struct mtk_thermal_data {
 	bool need_switch_bank;
 	struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
 	enum mtk_thermal_version version;
+	u32 apmixed_buffer_ctl_reg;
+	u32 apmixed_buffer_ctl_mask;
+	u32 apmixed_buffer_ctl_set;
 };
 
 struct mtk_thermal {
@@ -386,6 +401,24 @@ static const int mt7622_mux_values[MT7622_NUM_SENSORS] = { 0, };
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
@@ -460,6 +493,40 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
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
+	.apmixed_buffer_ctl_mask = ~(u32)GENMASK(29, 28),
+	.apmixed_buffer_ctl_set = 0,
+};
+
 /*
  * The MT2712 thermal controller has one bank, which can read up to
  * four temperature sensors simultaneously. The MT2712 has a total of 4
@@ -514,6 +581,9 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
 	.adcpnp = mt7622_adcpnp,
 	.sensor_mux_values = mt7622_mux_values,
 	.version = MTK_THERMAL_V2,
+	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
+	.apmixed_buffer_ctl_mask = ~0x37,
+	.apmixed_buffer_ctl_set = 0x1,
 };
 
 /*
@@ -958,19 +1028,27 @@ static const struct of_device_id mtk_thermal_of_match[] = {
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
 
@@ -1070,8 +1148,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
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
