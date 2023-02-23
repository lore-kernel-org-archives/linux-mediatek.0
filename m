Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D357DC64ED6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcyN8mwkynLnEcZ0mwlJ8EUC8lbw508/JbLNFp7NmP4=; b=tddZUtcLjem9tYph8ZZpbCiKOI
	Q4bITvqTG3blsehbDA6KdzOlkaj32dfqwr6b622ObtL7Kv7i4dQ0isQn3gpuQC1/z3+BkRvQknKfU
	vldNnd3APwdfOjB2WBsU7dvpOLSfXcjYhoUezxPBq7bg8pv9SnEXokuIt9aAJ7wD7Gv0wcX6Ers8x
	TXbEfrFYPDLdv1yZggMDqbaW3whvHW/WquNR5Jz1g6do83AA9Kfsz3voz/CkO0cSM3o/TaXsBHCKG
	gF3uGhInLvlZ9juab/xQOcBQdg1ZRE2oX3oRSjWJnzszR7bGHIoOfucKcxrnexrXCy1NLPqtad3bd
	YjoYX7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVD0X-00Gtwx-1o; Thu, 23 Feb 2023 14:55:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVCzU-00GtTb-8a; Thu, 23 Feb 2023 14:54:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C37E6602216;
	Thu, 23 Feb 2023 14:54:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677164075;
	bh=6pu9qitOcCueSg/XyeyLzoSlFZ5o/IQW+VQsBZPX1lk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=auXFFpiDZrBUMlDFrM3ayviuKcXeH9Y3WZXwAIeHZbbeKfuzs9pa7F1x+JZs9GsIa
	 BYbexjJNUdLaXsyCABnXFPF/r3R4fDv7AeFNfohN9k3XkNf1Om0geQyJlOXWP38tX4
	 1YyyUvaa08utDnHFamt6ki0jy0kMBnEW/TeCScSvd4H0x33aBoH4XYlEtzNgX1a6E9
	 CWHWhaS5F2wr5wn7tmAmW7vniNsK7rHEmL5zH+VaXANNN+mYKGEQp098+DM2t3xKcF
	 Q3nemt77J+0QcSSGvoPcBVUTJTvhIxyMl+yHoG0DGtW5fYsV6ivZTFiSjBxNlb+Q1d
	 Xh4BGHz0ufAtw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 1/4] arm64: dts: mediatek: cherry: Add platform thermal configuration
Date: Thu, 23 Feb 2023 15:54:23 +0100
Message-Id: <20230223145426.193590-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_065436_478942_EEE15EBC 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

This platform has three auxiliary NTC thermistors, connected to the
SoC's ADC pins. Enable the auxadc in order to be able to read the
ADC values, add a generic-adc-thermal LUT for each and finally assign
them to the SoC's thermal zones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 24669093fbed..ae2052a7160d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -104,6 +104,108 @@ ppvar_sys: regulator-ppvar-sys {
 		regulator-boot-on;
 	};
 
+	tboard_thermistor1: thermal-sensor-t1 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&auxadc 0>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <	(-5000) 4241
+						0 4063
+						5000 3856
+						10000 3621
+						15000 3364
+						20000 3091
+						25000 2810
+						30000 2526
+						35000 2247
+						40000 1982
+						45000 1734
+						50000 1507
+						55000 1305
+						60000 1122
+						65000 964
+						70000 827
+						75000 710
+						80000 606
+						85000 519
+						90000 445
+						95000 382
+						100000 330
+						105000 284
+						110000 245
+						115000 213
+						120000 183
+						125000 161>;
+	};
+
+	tboard_thermistor2: thermal-sensor-t2 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&auxadc 0>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <	(-5000) 4241
+						0 4063
+						5000 3856
+						10000 3621
+						15000 3364
+						20000 3091
+						25000 2810
+						30000 2526
+						35000 2247
+						40000 1982
+						45000 1734
+						50000 1507
+						55000 1305
+						60000 1122
+						65000 964
+						70000 827
+						75000 710
+						80000 606
+						85000 519
+						90000 445
+						95000 382
+						100000 330
+						105000 284
+						110000 245
+						115000 213
+						120000 183
+						125000 161>;
+	};
+
+	tboard_thermistor3: thermal-sensor-t3 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&auxadc 0>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <	(-5000) 4241
+						0 4063
+						5000 3856
+						10000 3621
+						15000 3364
+						20000 3091
+						25000 2810
+						30000 2526
+						35000 2247
+						40000 1982
+						45000 1734
+						50000 1507
+						55000 1305
+						60000 1122
+						65000 964
+						70000 827
+						75000 710
+						80000 606
+						85000 519
+						90000 445
+						95000 382
+						100000 330
+						105000 284
+						110000 245
+						115000 213
+						120000 183
+						125000 161>;
+	};
+
 	usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
@@ -243,6 +345,10 @@ &gpu {
 	mali-supply = <&mt6315_7_vbuck1>;
 };
 
+&auxadc {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -1074,6 +1180,24 @@ mt6315_7_vbuck1: vbuck1 {
 	};
 };
 
+&thermal_zones {
+	ap_ntc1 {
+		polling-delay = <1000>;
+		polling-delay-passive = <0>;
+		thermal-sensors = <&tboard_thermistor1>;
+	};
+	ap_ntc2 {
+		polling-delay = <1000>;
+		polling-delay-passive = <0>;
+		thermal-sensors = <&tboard_thermistor2>;
+	};
+	ap_ntc3 {
+		polling-delay = <1000>;
+		polling-delay-passive = <0>;
+		thermal-sensors = <&tboard_thermistor3>;
+	};
+};
+
 &u3phy0 {
 	status = "okay";
 };
-- 
2.39.2


