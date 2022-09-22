Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1736DC6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 10:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qV5leCHbr4JivqIZ66oYInQjuplf0tpW/SlhpQUaiZw=; b=hxbYuv2ukgssUdNLT1LGRmnah0
	GSuoWQ1TvrBXQ57TIqrzRg+00QUMpRWitOOQyM+MwLBP0G1mUz7Q8uReESN4L+EcUADOQmAEx7bxx
	JIT0LUIsZ9zZ4zZzIOsAmlzmwlVMVa8qWL3VkVVrh1U9mrJ1UvsiFWQEtuY+xDOP6Ns02RnF7kdmu
	kW0kXALRjxEOQ/3kVfpma9hH3/ZpZpCqHZY1uJMSkh1ftUHmNQAwQtFsKE4KU4eO+X2LMWTlysiuk
	JE41h8fL/W73wq0AtPFleTuHuhPob1SBWPJ6QsZNsWTZOYB1m23RbnY0zedz+rS2A7VSfMKA5b/WD
	gWpEZIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJ8L-00EnJk-Ap; Thu, 22 Sep 2022 10:08:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obIpb-00EZ4d-Gb; Thu, 22 Sep 2022 09:49:22 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B4E05660221F;
	Thu, 22 Sep 2022 10:49:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663840156;
	bh=aRbfk1mhUI8dAkF85RnEwt7brGuOKIQtd68vjz91JhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=azxjEguhsDUEOz0xDuinewwHFTLJS0stz6G3zouz9QjS7aepKc6POfoeaCHVWlbNr
	 7qKEzBztUrEJ2YLcjUdofbfC+roVyqCAXB3CP824gBTJTWHFYzmEDpJ9s7wrXDzOFk
	 buChQveFUXxD4+DZPAnRrYUJ8HRh4rrqt0upBIv0VXS6Iot6pwETLY7/gJd7pkiPgb
	 jLF5BrczFb453x3QNvKDd+4SblxZn6H7HM4cuS7kMqRhpBRcGx9qRGTMTNzWUMuh6/
	 bHaNT1m48J5rODZxMNcaRF2armeRRiAAxF4QNlNOUfnbl98Z8AgBtvmtA++rVEFzl6
	 lpqd30rbEsYwQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/4] arm64: dts: mediatek: cherry: Add external codecs and speaker amplifier
Date: Thu, 22 Sep 2022 11:49:07 +0200
Message-Id: <20220922094908.41623-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
References: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_024919_959742_D4430D9E 
X-CRM114-Status: GOOD (  12.30  )
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

The entire Cherry family has two digital microphones, for which
we use the generic dmic-codec, linked to the MT6359 PMIC.
Moreover, it uses a Realtek RT1019p amplifier for the speakers
and has either a Realtek RT5682i or RT5682s audio codec on I2C2:
specifically, RT5682i is found on Tomato's rev 1 and rev 2 boards,
while RT5682s is found in rev3 and rev4 boards.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  5 +++
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  5 +++
 .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  5 +++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 37 +++++++++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
index 3348ba69ff6c..3767b49ea896 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
@@ -10,6 +10,11 @@ / {
 	compatible = "google,tomato-rev1", "google,tomato", "mediatek,mt8195";
 };
 
+&audio_codec {
+	compatible = "realtek,rt5682i";
+	realtek,btndet-delay = <16>;
+};
+
 &ts_10 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
index 4669e9d917f8..0ed83a79d680 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
@@ -10,6 +10,11 @@ / {
 	compatible = "google,tomato-rev2", "google,tomato", "mediatek,mt8195";
 };
 
+&audio_codec {
+	compatible = "realtek,rt5682i";
+	realtek,btndet-delay = <16>;
+};
+
 &pio_default {
 	pins-low-power-hdmi-disable {
 		pinmux = <PINMUX_GPIO31__FUNC_GPIO31>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
index 5021edd02f7c..c47b341e98fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
@@ -11,6 +11,11 @@ / {
 		     "google,tomato", "mediatek,mt8195";
 };
 
+&audio_codec {
+	compatible = "realtek,rt5682s";
+	realtek,amic-delay-ms = <250>;
+};
+
 &pio_default {
 	pins-low-power-hdmi-disable {
 		pinmux = <PINMUX_GPIO31__FUNC_GPIO31>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 3bc624e6f499..95e93b791432 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -26,6 +26,12 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	dmic-codec {
+		compatible = "dmic-codec";
+		num-channels = <2>;
+		wakeup-delay-ms = <50>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
@@ -136,6 +142,14 @@ adsp_device_mem: memory@60e80000 {
 			no-map;
 		};
 	};
+
+	spk_amplifier: rt1019p {
+		compatible = "realtek,rt1019p";
+		label = "rt1019p";
+		pinctrl-names = "default";
+		pinctrl-0 = <&rt1019p_pins_default>;
+		sdb-gpios = <&pio 100 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &adsp {
@@ -185,6 +199,17 @@ &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
+
+	audio_codec: codec@1a {
+		/* Realtek RT5682i or RT5682s, sharing the same configuration */
+		reg = <0x1a>;
+		interrupts-extended = <&pio 89 IRQ_TYPE_EDGE_BOTH>;
+		realtek,jd-src = <1>;
+
+		AVDD-supply = <&mt6359_vio18_ldo_reg>;
+		MICVDD-supply = <&pp3300_z2>;
+		VBAT-supply = <&pp3300_z5>;
+	};
 };
 
 &i2c3 {
@@ -289,6 +314,11 @@ &mmc1 {
 	vqmmc-supply = <&mt_pmic_vmc_ldo_reg>;
 };
 
+&mt6359codec {
+	mediatek,dmic-mode = <1>;  /* one-wire */
+	mediatek,mic-type-0 = <2>; /* DMIC */
+};
+
 /* for CPU-L */
 &mt6359_vcore_buck_reg {
 	regulator-always-on;
@@ -723,6 +753,13 @@ pins-low-power-pupd {
 		};
 	};
 
+	rt1019p_pins_default: rt1019p-default-pins {
+		pins-amp-sdb {
+			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>;
+			output-low;
+		};
+	};
+
 	scp_pins: scp-default-pins {
 		pins-vreq {
 			pinmux = <PINMUX_GPIO76__FUNC_SCP_VREQ_VAO>;
-- 
2.37.2


