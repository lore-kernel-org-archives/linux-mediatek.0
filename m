Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC70C77B76
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSLW7wG17DkyoVe2YpmgndBybW5OdRDYgDlM2biPQIY=; b=gDoLB6ubyUmMRhayDvrv357g/U
	JEZdRNIPiRjjskbozeX+ZDl8b3Mg5QCv50ukivaeFcmGwSUXe/9qbDBtj4l3M4icCkTpe3bAS1rmp
	T0r5RGyo6KfJJ5IWbkfeZ/AsE2OISID6+uOkm3DbFTj/lSnRWCl61EnNn1fXEd1Vzemrcs8siCS0/
	QpJOVZAqIWKR0m+3uGnvMYVK0feeyK6FIbHICul5fkZoYQRNRfQNudMtU7Z9gdzu1awSHEmRoDeLn
	O1n2RXgSJKeAAA0L8wBCDnV3/H7YS04G/DnhU4IbAwv15hX/l6NzUjJnjDtzn6C0mX10UsRPbANND
	gDOc6aeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pquK6-00GBbV-2W;
	Mon, 24 Apr 2023 11:25:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pquK3-00GBZq-0q;
	Mon, 24 Apr 2023 11:25:32 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 04141660324D;
	Mon, 24 Apr 2023 12:25:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682335529;
	bh=D8ECh98ZW5Kp7rjGcRUYfmB3ikfORMr6hVs/EvaqyaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CMSJiDYplbt6V/NtGqCKbsjzj3AIscEoQ3/m3uKqfWxyGQDDQdvwTb4XEcgR91l0a
	 4Ydp7xkJEWC7jO70TBhX7ZDSEzrAC7OMYzoGKUt7N3daMCxUpGtqU4sJdIpjnMxtll
	 dPm8sBASqqjqcjp9H9CWTI+n4CfDA9oI6SjSE6ggA8FUuPNVUPScGRUUBd46+XsWbE
	 EI1Kht2/031xfkxXwnK34CxtbRF9PCkW/uSlP/Qewo604FXRTk0U/xgW5bnMjXBX+V
	 9NCkzTw21tByLmT/oTiZnRmZPOEcHY4bcjjfjAue3qGa4wcRXUlSjo0wFoR0MbibLW
	 pR6XEkQ5oe1eA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 1/4] arm64: dts: mediatek: cherry: Add platform thermal configuration
Date: Mon, 24 Apr 2023 13:25:20 +0200
Message-Id: <20230424112523.1436926-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_042531_513128_FE9195E8 
X-CRM114-Status: GOOD (  10.73  )
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
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 8ac80a136c37..4229f4f7dc2f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -114,6 +114,77 @@ ppvar_sys: regulator-ppvar-sys {
 		regulator-boot-on;
 	};
 
+	/* Murata NCP03WF104F05RL */
+	tboard_thermistor1: thermal-sensor-t1 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&auxadc 0>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <	(-10000) 1553
+						(-5000) 1485
+						0 1406
+						5000 1317
+						10000 1219
+						15000 1115
+						20000 1007
+						25000 900
+						30000 796
+						35000 697
+						40000 605
+						45000 523
+						50000 449
+						55000 384
+						60000 327
+						65000 279
+						70000 237
+						75000 202
+						80000 172
+						85000 147
+						90000 125
+						95000 107
+						100000 92
+						105000 79
+						110000 68
+						115000 59
+						120000 51
+						125000 44>;
+	};
+
+	tboard_thermistor2: thermal-sensor-t2 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&auxadc 1>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <	(-10000) 1553
+						(-5000) 1485
+						0 1406
+						5000 1317
+						10000 1219
+						15000 1115
+						20000 1007
+						25000 900
+						30000 796
+						35000 697
+						40000 605
+						45000 523
+						50000 449
+						55000 384
+						60000 327
+						65000 279
+						70000 237
+						75000 202
+						80000 172
+						85000 147
+						90000 125
+						95000 107
+						100000 92
+						105000 79
+						110000 68
+						115000 59
+						120000 51
+						125000 44>;
+	};
+
 	usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
@@ -260,6 +331,10 @@ &gpu {
 	mali-supply = <&mt6315_7_vbuck1>;
 };
 
+&auxadc {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -1098,6 +1173,36 @@ mt6315_7_vbuck1: vbuck1 {
 	};
 };
 
+&thermal_zones {
+	soc-area-thermal {
+		polling-delay = <1000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&tboard_thermistor1>;
+
+		trips {
+			trip-crit {
+				temperature = <84000>;
+				hysteresis = <1000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic-area-thermal {
+		polling-delay = <1000>;
+		polling-delay-passive = <0>;
+		thermal-sensors = <&tboard_thermistor2>;
+
+		trips {
+			trip-crit {
+				temperature = <84000>;
+				hysteresis = <1000>;
+				type = "critical";
+			};
+		};
+	};
+};
+
 &u3phy0 {
 	status = "okay";
 };
-- 
2.40.0


