Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE68FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYJIUDUt2i3lSUH3tS/tZioYqiC3fwwfiTPBirPrFF8=; b=IP00Hyqqfsfio7RtdLRtWuPAWG
	MXsdo2XABEW4DbMuW5vy0IOaHyI2250jEkJRgSx7NlQvE6VGAlYtMZTZURH7yY1mdHn6Z8uxtZwsk
	vVCEjkTZ5eWhYWK+QTvLNlaG6D/+DTV9wOgJlT0BPKgYKOVEAi44onwqax65PDxCgLybdIor6YDap
	djqntvYBqHwQokhKG39oP3Q0ZKERglO+3UxzVZ9F+aWPcpdL+nGyNg6TJS4usdFlB/UZQWfMPqIEg
	btuIizn2BtqWKHFUX5MG2Iy4vk3YBlnVHtaL2lB1d+aodv86OWk5J54rEWM8mEpmIiOJKF4ttFYzt
	BN1XkzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6aHT-00CuMx-Tz; Wed, 29 Jun 2022 16:11:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a7B-00CogX-P5; Wed, 29 Jun 2022 16:00:31 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 692CD660198D;
	Wed, 29 Jun 2022 17:00:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518428;
	bh=etvqQ1Sf4L9KOJ6PfLg/qIPZJ2SbAA+l1UyPzPWGVwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vp86zMw2GSlDu1PAFaueC5lnum0u0hTa4z3UyfBNZDukkMJJnem88oC876mYn+2TP
	 ob9W5WbSl0j237TWLhuN2RXo7IDzA5pQhTGJLWba2FrqQqekpRsV7RPlgF3wGF+PPS
	 V14L4WzyEPibYHKM5/ShK6sp2PwEW8EB0x+cz2idB0kC0/wdSRSn1skW6RlvpbsO5i
	 N3G09TpbZ1h0EjWdrOvpQ9rvmZaoeQEK9AbR6zh9UIoueBG/rjFggRLSk16tIx5q1V
	 mfttr/sLp8bVGga4vW5c3mAiQxYso0bWbL0+tk95f2shNXYgXJIE97CDTwjbgCQOt5
	 hwmcC3ZuCoBMg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 17/19] arm64: dts: mediatek: asurada: Enable MMC
Date: Wed, 29 Jun 2022 11:59:54 -0400
Message-Id: <20220629155956.1138955-18-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090030_159126_917BC324 
X-CRM114-Status: GOOD (  12.16  )
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

Enable both MMC controllers present on Asurada. MMC0 is for
non-removable internal memory, while MMC1 is an SD card slot. MMC1 isn't
used on all machines, but in those cases the CD interrupt is never
triggered and thus it is basically as if it was disabled.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Changes in v4:
- Added this patch

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 149 ++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d56c73e37633..7b89f6e552c5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -170,6 +170,46 @@ &i2c7 {
 	pinctrl-0 = <&i2c7_pins>;
 };
 
+&mmc0 {
+	status = "okay";
+
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_default_pins>;
+	pinctrl-1 = <&mmc0_uhs_pins>;
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	vmmc-supply = <&mt6359_vemc_1_ldo_reg>;
+	vqmmc-supply = <&mt6359_vufs_ldo_reg>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	supports-cqe;
+	cap-mmc-hw-reset;
+	mmc-hs400-enhanced-strobe;
+	hs400-ds-delay = <0x12814>;
+	no-sdio;
+	no-sd;
+	non-removable;
+};
+
+&mmc1 {
+	status = "okay";
+
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_default_pins>;
+	pinctrl-1 = <&mmc1_uhs_pins>;
+	bus-width = <4>;
+	max-frequency = <200000000>;
+	cd-gpios = <&pio 17 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&mt6360_ldo5_reg>;
+	vqmmc-supply = <&mt6360_ldo3_reg>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	no-sdio;
+	no-mmc;
+};
+
 /* for CORE */
 &mt6359_vgpu11_buck_reg {
 	regulator-always-on;
@@ -503,6 +543,115 @@ pins-bus {
 		};
 	};
 
+	mmc0_default_pins: mmc0-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO184__FUNC_MSDC0_DAT0>,
+				 <PINMUX_GPIO188__FUNC_MSDC0_DAT1>,
+				 <PINMUX_GPIO185__FUNC_MSDC0_DAT2>,
+				 <PINMUX_GPIO193__FUNC_MSDC0_DAT3>,
+				 <PINMUX_GPIO186__FUNC_MSDC0_DAT4>,
+				 <PINMUX_GPIO189__FUNC_MSDC0_DAT5>,
+				 <PINMUX_GPIO187__FUNC_MSDC0_DAT6>,
+				 <PINMUX_GPIO190__FUNC_MSDC0_DAT7>,
+				 <PINMUX_GPIO183__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strength = <8>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO192__FUNC_MSDC0_CLK>;
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-rst {
+			pinmux = <PINMUX_GPIO194__FUNC_MSDC0_RSTB>;
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
+		};
+	};
+
+	mmc0_uhs_pins: mmc0-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO184__FUNC_MSDC0_DAT0>,
+				 <PINMUX_GPIO188__FUNC_MSDC0_DAT1>,
+				 <PINMUX_GPIO185__FUNC_MSDC0_DAT2>,
+				 <PINMUX_GPIO193__FUNC_MSDC0_DAT3>,
+				 <PINMUX_GPIO186__FUNC_MSDC0_DAT4>,
+				 <PINMUX_GPIO189__FUNC_MSDC0_DAT5>,
+				 <PINMUX_GPIO187__FUNC_MSDC0_DAT6>,
+				 <PINMUX_GPIO190__FUNC_MSDC0_DAT7>,
+				 <PINMUX_GPIO183__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strength = <10>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO192__FUNC_MSDC0_CLK>;
+			drive-strength = <10>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-rst {
+			pinmux = <PINMUX_GPIO194__FUNC_MSDC0_RSTB>;
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-ds {
+			pinmux = <PINMUX_GPIO191__FUNC_MSDC0_DSL>;
+			drive-strength = <10>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+
+	mmc1_default_pins: mmc1-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO54__FUNC_MSDC1_DAT0>,
+				 <PINMUX_GPIO56__FUNC_MSDC1_DAT1>,
+				 <PINMUX_GPIO55__FUNC_MSDC1_DAT2>,
+				 <PINMUX_GPIO53__FUNC_MSDC1_DAT3>,
+				 <PINMUX_GPIO52__FUNC_MSDC1_CMD>;
+			input-enable;
+			drive-strength = <8>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO51__FUNC_MSDC1_CLK>;
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-insert {
+			pinmux = <PINMUX_GPIO17__FUNC_GPIO17>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	mmc1_uhs_pins: mmc1-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO54__FUNC_MSDC1_DAT0>,
+				 <PINMUX_GPIO56__FUNC_MSDC1_DAT1>,
+				 <PINMUX_GPIO55__FUNC_MSDC1_DAT2>,
+				 <PINMUX_GPIO53__FUNC_MSDC1_DAT3>,
+				 <PINMUX_GPIO52__FUNC_MSDC1_CMD>;
+			input-enable;
+			drive-strength = <8>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO51__FUNC_MSDC1_CLK>;
+			input-enable;
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+
 	pcie_pins: pcie-default-pins {
 		pins-pcie-wake {
 			pinmux = <PINMUX_GPIO63__FUNC_PCIE_WAKE_N>;
-- 
2.36.1


