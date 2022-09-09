Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD37ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIKToDSVoS98U+OfuzA/OpKFRRhoyJfUdRqfuJXGZxo=; b=E03g1TYcvLOTaQZzG0iTh39S5x
	PrfEp78Bt6ouFwaGdUadtsb8Jx2QH426P2Z01BZ18rOxu/yg7HG1WOOp0tzZmsJJ5nqr6vzJD50qq
	KKs3KvUY0hB8k35LI3STX/R01hYy+qNyuR4nuU33Nj3Ny+yLPkxlaJ6I1MbZXDb3dlNS2q8KykNN9
	kWLMX1Uuem2nKbadd/cAMeCXisOBEn3B3l2kH/zCT72O4tiXV6bckooxTyoFN8dzNdwZgowqRLcPL
	wPUnKxLa0vmVYWYSyQ0DeVAA4V82poIjEIrr9YsRsDLhcMo9N8ZYO3bwvqslt6/oJcTOra1hHXQOp
	/h+0tIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYe6-00E3c1-3O; Fri, 09 Sep 2022 07:41:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYYu-00E0D9-Sc
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 07:36:31 +0000
Received: by mail-wr1-x42a.google.com with SMTP id k9so1355529wri.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Sep 2022 00:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TIKToDSVoS98U+OfuzA/OpKFRRhoyJfUdRqfuJXGZxo=;
        b=0OqO+R8YyUauyDxb8d2Y2H8s21Wmrz4gGkIao52O1E4alslAxF6ok1Hgv6nmHBg+CX
         Jmjdtfn2s3m17qqGDWTLsoH5GsYMlzlt4j6NQ8wVSp1H9Tsai8d7ElHiyrSKf9EYX9U9
         vyTCZD4sVgc6d78otHeilCDR95kSUgtLuhYUWlhYlLQwgTThmYdo9ESbReAC3ldycIXl
         7D/oLVplNTq3cmg4fILOq4lmOEHQPMG8TPGWam8lU0GelOeXMhP0uDvhjTHEJwj6hNhX
         xEffPACrjayzZUNXOUK16CR9ttZjmEEJ/sSiNdl4lvyMFHXdDBtMeO4vnu6+XcA5sBAF
         SUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TIKToDSVoS98U+OfuzA/OpKFRRhoyJfUdRqfuJXGZxo=;
        b=ImTLVaUWYIIO/xyhp9J97ClZP3qZ3PfjgWaNeFyip9MVN7WCdQ+vo7vaML7A+GtwbC
         NwU+1zgvl2MNmYvZLLPpdlmmXID+2uPxLEIHddqEE07SvYbLJgtDd0T0z3vOOFiMVQUQ
         0lvGjnUq0AMP0Ks+kJsBsoNO9Bm+hFQ8JJTAeIaSLJWLnOhXkBgQIcka4eeqOV3L/a2A
         JDUqQ+RuzxC6wF6Pfpw6A+TmnQuBEla1F/McRnLBy/AHoXV+Zi0JOKI0VUEs8BTA+kpm
         F/b09gb+DJwGgw7NYild1WTkZn66CV8vJ33+nmOSzxtllB9gUMap1uZew+0SqtH61dhM
         h00g==
X-Gm-Message-State: ACgBeo2ZTkP06r5mnVpfyIKO7iOQwZSstjI6J4HvnGc7VINcnXkblieD
	CF9qh0vQaGOUNFnUnEbHtnskbw==
X-Google-Smtp-Source: AA6agR6m91f7v8OxIb5b1lxvAT+iobxBDxnNlnacdZaFiRiGeYPP0IiD8y4M8bpp9Mjktp8aVUbZog==
X-Received: by 2002:a5d:64c2:0:b0:228:cb3e:1ce with SMTP id f2-20020a5d64c2000000b00228cb3e01cemr7169690wri.392.1662708986541;
        Fri, 09 Sep 2022 00:36:26 -0700 (PDT)
Received: from amjad-ThinkPad-T490.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j5-20020a05600c1c0500b003a682354f63sm5345901wms.11.2022.09.09.00.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 00:36:25 -0700 (PDT)
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
Subject: [PATCH v4 3/4] thermal: mediatek: add support for MT8365 SoC
Date: Fri,  9 Sep 2022 09:36:08 +0200
Message-Id: <20220909073609.32337-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909073609.32337-1-aouledameur@baylibre.com>
References: <20220909073609.32337-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003628_944181_6BEA1162 
X-CRM114-Status: GOOD (  14.61  )
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
2.37.3


