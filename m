Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF36C6FA81
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcnFNEwnQklAIRavdmW2J2oLN5KoVqZ3grcNDFSqIGQ=; b=OQJONJxHKnPPDcEspjP/6wTfdF
	F9rsNgYWYBIUwiI93df08OCbAyAo7rGceWpLxVZKQSYIRc+8jFjJqyWB9k02MJoksrI6/YBTsbZD7
	+lrP3hyFz5bTWNqx3zOqyS/NphjY7JDQ/rbH1JnMlr5BVbgTQ2tVWn3RyVtscgnSOmoR7u+Bv3kco
	11FInZjHgcl8naTmsgEyVPa8v0WCoGLCaRMaKtlPnYkLbyGdQbZDonJVvhQAkb0I0DI8SQE+MS6eX
	CeFONQ7qgLbQN+1OuefM9LxhnZ/BGig/kb+ANmPRVf5yb4YWiXSFsJUYy41zh0go1cnzOrnucssx+
	Nm/oQn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1nP-001gMY-MS; Fri, 02 Sep 2022 08:12:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1mh-001fv6-KJ; Fri, 02 Sep 2022 08:12:17 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 633DC6601F04;
	Fri,  2 Sep 2022 09:12:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662106330;
	bh=BkTFjpWjreFqLLPuKAzGds7DfL2VWnDjKww2UUpwn54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KrYXImlpaSZAzED2tjaZ0MVPtKPXX40wO4wbGid3lXN571KxIpHLE/G2kpMRKuYKd
	 CUlPoAgjwE5NhSsg9PVPSgPTIpysSuHW4IyZMFla7BBRwsArDd8Fr52E2dUAo7VNJI
	 2Z2CJg/ssxczHjvxAaCIXLCrVlQ9MNN640+pGAvytUoYMyk+WmsEeyXlkamtZ4DmCx
	 SSdc1VB2cw2N+5G6nn1jlavjA3uQZz1JJYW18GpoxCTUmuXPujpptZWoKf8g5H6vwB
	 0pvMgdCyFWX85jgXgAVE3rrVSwc7pWerDgRjFn22yXzAzkObGA7kbYa5zg9m2ps+AM
	 VOYeyp6N2y/SA==
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
Subject: [PATCH v3 2/7] arm64: dts: mediatek: cherry: Wire up the ChromeOS Embedded Controller
Date: Fri,  2 Sep 2022 10:11:51 +0200
Message-Id: <20220902081156.38526-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
References: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_011215_880706_9099D7E0 
X-CRM114-Status: UNSURE (   9.43  )
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

Wire up the ChromeOS Embedded Controller on SPI0 and its communication
channel via SCP RPMSG along with all of the offered functionality,
including Keyboard, Smart Battery Metrics (SBS), keyboard backlight,
I2C tunnel, regulators and Type-C connector management.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index e83d58d99757..73f531f84fa2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -426,6 +426,14 @@ &pio {
 		"AP_SPI_FLASH_MOSI",
 		"AP_SPI_FLASH_MISO";
 
+	cros_ec_int: cros-ec-irq-default-pins {
+		pins-ec-ap-int-odl {
+			pinmux = <PINMUX_GPIO4__FUNC_GPIO4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			input-enable;
+		};
+	};
+
 	i2c0_pins: i2c0-default-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
@@ -670,6 +678,11 @@ &scp {
 	memory-region = <&scp_mem>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
+
+	cros-ec-rpmsg {
+		compatible = "google,cros-ec-rpmsg";
+		mediatek,rpmsg-name = "cros-ec-rpmsg";
+	};
 };
 
 &spi0 {
@@ -678,6 +691,67 @@ &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>;
 	mediatek,pad-select = <0>;
+
+	cros_ec: ec@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		compatible = "google,cros-ec-spi";
+		reg = <0>;
+		interrupts-extended = <&pio 4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cros_ec_int>;
+		spi-max-frequency = <3000000>;
+
+		keyboard-backlight {
+			compatible = "google,cros-kbd-led-backlight";
+		};
+
+		i2c_tunnel: i2c-tunnel {
+			compatible = "google,cros-ec-i2c-tunnel";
+			google,remote-bus = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mt_pmic_vmc_ldo_reg: regulator@0 {
+			compatible = "google,cros-ec-regulator";
+			reg = <0>;
+			regulator-name = "mt_pmic_vmc_ldo";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <3600000>;
+		};
+
+		mt_pmic_vmch_ldo_reg: regulator@1 {
+			compatible = "google,cros-ec-regulator";
+			reg = <1>;
+			regulator-name = "mt_pmic_vmch_ldo";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3600000>;
+		};
+
+		typec {
+			compatible = "google,cros-ec-typec";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb_c0: connector@0 {
+				compatible = "usb-c-connector";
+				reg = <0>;
+				power-role = "dual";
+				data-role = "host";
+				try-power-role = "source";
+			};
+
+			usb_c1: connector@1 {
+				compatible = "usb-c-connector";
+				reg = <1>;
+				power-role = "dual";
+				data-role = "host";
+				try-power-role = "source";
+			};
+		};
+	};
 };
 
 &u3phy0 {
@@ -729,3 +803,6 @@ &xhci3 {
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
 };
+
+#include <arm/cros-ec-keyboard.dtsi>
+#include <arm/cros-ec-sbs.dtsi>
-- 
2.37.2


