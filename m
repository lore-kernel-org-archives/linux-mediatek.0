Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E966C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 15:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fvVxbhAYZ7geA2TrniCTojxhYIL1wsypbBZ+bEyH5k=; b=nMDm3vOHlrfMiUp4XgigSps3hm
	edQkaMY4bNq1/xIl5SWjJcVj8ieELUK6/v8XeYxEoXdpZ8EkG5y02hk0NqZWOygSuDmvkUA5LgXVf
	D/jQRbAVjhkPuo47NkVS/qbOPlx7NY1O/sawAXAbmDKi2OLKSOVnJyw59YdWeNraUgaDCCQXHqh1/
	5TD5M9gNUAi/3cZKfDR9lwJ8ZEQgz8DamkCg77+10HK8IZUcQHSYxr0tknH3f0V+Eft5V5rtz95hG
	9jelA8cHs0qKj54iuN4sO2ohrrzCQcLdwC/7M+qp7b8PlQ/cKwPeadu6weRyugKo92iT3t/NH3cpM
	VDnb9hyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaene-004gzj-14; Tue, 20 Sep 2022 15:04:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaemy-004gbd-Rx
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 15:03:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id n12so4731280wrx.9
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=7fvVxbhAYZ7geA2TrniCTojxhYIL1wsypbBZ+bEyH5k=;
        b=0C6Ek8hY6ktdcuRYIZZVPgzk2HmL2zkjdSA4AA4SnCHgsos1Sn9xXF/8jZ7k6Tvoot
         o9JexYUc1qzLVQYT6K138kxNy47Z+AC7K//hkCVHPH6FBw01G20LIxsCOSby5vo1DBaZ
         ySeTUaPwHtslahcJndNwfTTbLz0ydz2dJ/51CgHy9Fo3VMrv8nG+V6+iNYP+L9qgEp8M
         auCWjlSpFa8I3bNJnqXDLf1oB/1nsXX2MdESA0NTlSpYxfPzLaWqph2L6rRuO/r9Cmj8
         UgJphyUJ5SBgvFGKhHpMHRzY5Stw6mUjyl+N/vq8py88DOJsUEEPaHQC9P824iny7fyv
         LNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7fvVxbhAYZ7geA2TrniCTojxhYIL1wsypbBZ+bEyH5k=;
        b=T/xDGFXbXSz64VUHsQx3Tzh8R5sKzR3LsVnVnpz7/L9xWjaUNwfik8DyNk1Ukuv7Wj
         y8Qex+q/h04qcdIr1EVtxcqWh96W5aW42UQArnE6gYIUbgIH3SUxlEjgnLWhBOi2u2LQ
         EU7rdTaOC7spznIisw2IiA+3DGkUkQxtashZangb+4KdR91wJTDmRHtFqdphBP9ONyXh
         ronS8pwdxGhFaNJtaJ7HvFjNPJydTFhLseb9vd/o/oHKciLmrSrwR/ty1UxoAynb0PN/
         i+dyMyPWM6b0OkFMJPhAqNEiAGJxl8mZsuleVLzLo1VR52dJu+MKtfVi6dXpLQICTijh
         RhMQ==
X-Gm-Message-State: ACrzQf17UJOq2jj29DYpC1lzEIbpfUVEcrzlVJMycJFig1QIs4csBtub
	7ETIWay1B8USXDB58UwTYZSfdg==
X-Google-Smtp-Source: AMsMyM6xOPCpx11/H1SUUJlsXshwGblLd61g9dZ9XU0V7KAI69HrOZKOPKCuWrYrWJoQB9oyCwfXfw==
X-Received: by 2002:a05:6000:1ac7:b0:22a:906d:3577 with SMTP id i7-20020a0560001ac700b0022a906d3577mr14951482wry.33.1663686233220;
        Tue, 20 Sep 2022 08:03:53 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id u3-20020a5d4683000000b00225239d9265sm242056wrq.74.2022.09.20.08.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:03:52 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Tue, 20 Sep 2022 17:03:50 +0200
Subject: [PATCH v5 3/4] thermal: mediatek: add support for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220920-i350-thermal-up-v5-3-123bc852d199@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663686228; l=4000;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=eVZqssHa1FkQT25LvRdPA/FO390Vm6rtd7qvKHJXswg=;
 b=oLX5iNEqzkN15jnXT0IP6zYUCEIMuPk4gxtg06iKIX+clW57z6GnnCXS4vUbP+MOU2AS0FlNtCcQ
 LKfAn8DfBQn/zT3fb05jtLtSPnKIifemyG3dmGnwh5cbTcaMTzHO
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_080357_451754_BAC4B823 
X-CRM114-Status: GOOD (  13.24  )
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
b4 0.10.0

