Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F42DC77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tdh7ek24ZSmi+j5bVgdAWjluQjV4G1M6gj6jbA0FQ3I=; b=BeziVJa0N3kBb8rujYR7fU3ehL
	KtVW54NsJdBmJilw0PVFAODr6GPJsGESdLUceYNrkaSwAsnP/wr9RT1KdK+NYp8ahWDQORerML0Ud
	rIfD55S0S5U1SqJowWoF5o3nw+fIeoPYoZFsUQIEIvPlN8pD6+6ZwxBgtISXn5/edc5CY/Ey8QeHu
	bRiBGfWAusLbTGouokrP1cWytIn/4XOiVoF1a3k5FZWBGxzXYzsTWEBv2SWsllg5BZLZ+VRFYIjED
	Hr0shqzJ9ZJuoad4QV56EUJoGQbvKFqLhSANCgG0GrqqxDh/6yIDNieUIOx1OBxjbcwwNvCzN99UV
	b68ijbpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqU-007ZRw-2i;
	Thu, 20 Apr 2023 09:44:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqO-007ZNb-2E;
	Thu, 20 Apr 2023 09:44:50 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A2623660325F;
	Thu, 20 Apr 2023 10:44:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681983885;
	bh=PtQuyZxzHrAdWjzyoJUqzJ9rjp5UV6ThgnDDcqGxVug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b4S+8bt+073+UwfKxzK89eiqxVuRMMQgGnGr70NmyPi3J6VbHYcHCkefFnKxZpFvC
	 z7TgkhKfSDFbAKiVVhbO2pwQIkcW1xOM6Ua2nIGFhl5ogZZSVNgc+/jVtyGpvFOBIZ
	 C3zu0NOH1i1sFOY498TZILfd6Sb4K3/r+4AsmV17NyJFgyh0EnAGUz7c5H54K1++HE
	 WG0865c4HPmP0VaQ/AGs6Vqqnvali8JV6M9XJEfeJ/aQqEqwAfTw2POZZVM/xzIgcb
	 Oa+ZxdbxjKDcigvIW+B66EMwSNfxWEsIxBCKq25LZ9JhR4/1rdZwzaAonUWlT6vvfr
	 DPF84fekwmrgw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/5] arm64: dts: mediatek: cherry: Add platform thermal configuration
Date: Thu, 20 Apr 2023 11:44:29 +0200
Message-Id: <20230420094433.42794-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_024448_879107_BCA5482B 
X-CRM114-Status: GOOD (  11.32  )
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
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 8ac80a136c37..0820e9ba3829 100644
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
+	soc_area_ntc {
+		polling-delay = <1000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&tboard_thermistor1>;
+
+		trips {
+			trip-crit {
+				temperature = <95000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_area_ntc {
+		polling-delay = <1000>;
+		polling-delay-passive = <0>;
+		thermal-sensors = <&tboard_thermistor2>;
+
+		trips {
+			trip-crit {
+				temperature = <95000>;
+				hysteresis = <2000>;
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


