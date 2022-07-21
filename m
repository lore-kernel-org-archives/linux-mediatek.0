Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52A7CCA479
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1Qgee3WHJs346AtZkew9eL/PDIXTrKbkIrejHsRCbw=; b=ikmu+a5Gp4lC6cyWzfwahMDuF1
	qq5MvmNXjZsQHUR/uS908izdOSSR5RKYrsFxMQ8aAihvhb26ai70i68R4ai8qpPSK8YSGEZEbkNop
	9QDA7nDNkslL6tnFvqv8HxjpMzZQgMaDlEEW/SzggK5krWLpdigc1vaE5bDP1s0xnR8KossoDW9Vj
	tS1430hQ9BnDIAJH2weTREPtvUmLR4eBGPNLPcLjT4WHpug+ohDVbRjSrrgvVfsYEMeblWqNT1JNo
	qRvPq5G6bYyBFeBZVJlQix8lezjJLvtUoJQLiT7pxPcih7TaAjSutkEO1iJnokdAnkWjyDJTXH3W0
	zTWBdTiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWbH-007Hs3-KN; Thu, 21 Jul 2022 13:52:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWRp-007CKh-4X; Thu, 21 Jul 2022 13:42:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C33386601AAD;
	Thu, 21 Jul 2022 14:42:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658410954;
	bh=V/+LAph7U+k+GMlqnvKVF6jJXNo43acPvSyK01bfszA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZKmwj5u6AmDHNat16iPXJq9ybhfIRR4GgMbGrHHSWEBRFvIus/1ycmgKs3lqjV9P4
	 I2sIiZLf01mL1bT0byJ+Qdc3WQ62hHmIY7gnXN8fYYov0fVuWDYNpA0HX5J+za6Qft
	 E3LQGAAOURaF7NxyGjOIckl4sk0FSHChCkMMXyO+68kLz+zSwgDjBj6n3ShMiJQq/R
	 8Qc9Mo0s2ggRsU9wddVRNI8nSEWdhmCvnSCjmB5I+BcpBcrZGXqcdb0X6G4OyXnzW8
	 m8yLsib9m6zVwTvBzLCEZLT1xTP0ay0xNRtouHtY5YMU4YKDAZefdJhws25J1ldihb
	 fxmc4QJffcvnw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/8] arm64: dts: mediatek: cherry: Enable secondary SD/MMC controller
Date: Thu, 21 Jul 2022 15:42:24 +0200
Message-Id: <20220721134228.310178-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721134228.310178-1-angelogioacchino.delregno@collabora.com>
References: <20220721134228.310178-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_064237_424925_CB306BB0 
X-CRM114-Status: GOOD (  10.24  )
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

As of now, all of the boards based on the cherry platform have a
usable secondary SD/MMC controller, usually for SD cards: enable
it to allow both booting from it and generally accessing external
storage.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 2853f7f76c90..8859957c7b27 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -17,6 +17,7 @@ aliases {
 		i2c5 = &i2c5;
 		i2c7 = &i2c7;
 		mmc0 = &mmc0;
+		mmc1 = &mmc1;
 		serial0 = &uart0;
 	};
 
@@ -227,6 +228,24 @@ &mmc0 {
 	vqmmc-supply = <&mt6359_vufs_ldo_reg>;
 };
 
+&mmc1 {
+	status = "okay";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
+	max-frequency = <200000000>;
+	no-mmc;
+	no-sdio;
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_pins_default>;
+	pinctrl-1 = <&mmc1_pins_uhs>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&mt_pmic_vmch_ldo_reg>;
+	vqmmc-supply = <&mt_pmic_vmc_ldo_reg>;
+};
+
 /* for CPU-L */
 &mt6359_vcore_buck_reg {
 	regulator-always-on;
@@ -575,6 +594,49 @@ pins-rst {
 		};
 	};
 
+	mmc1_pins_default: mmc1-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO110__FUNC_MSDC1_CMD>,
+				 <PINMUX_GPIO112__FUNC_MSDC1_DAT0>,
+				 <PINMUX_GPIO113__FUNC_MSDC1_DAT1>,
+				 <PINMUX_GPIO114__FUNC_MSDC1_DAT2>,
+				 <PINMUX_GPIO115__FUNC_MSDC1_DAT3>;
+			input-enable;
+			drive-strength = <8>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO111__FUNC_MSDC1_CLK>;
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-insert {
+			pinmux = <PINMUX_GPIO54__FUNC_GPIO54>;
+			bias-pull-up;
+		};
+	};
+
+	mmc1_pins_uhs: mmc1-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO110__FUNC_MSDC1_CMD>,
+				 <PINMUX_GPIO112__FUNC_MSDC1_DAT0>,
+				 <PINMUX_GPIO113__FUNC_MSDC1_DAT1>,
+				 <PINMUX_GPIO114__FUNC_MSDC1_DAT2>,
+				 <PINMUX_GPIO115__FUNC_MSDC1_DAT3>;
+			input-enable;
+			drive-strength = <8>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO111__FUNC_MSDC1_CLK>;
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+
 	nor_pins_default: nor-default-pins {
 		pins-ck-io {
 			pinmux = <PINMUX_GPIO142__FUNC_SPINOR_IO0>,
-- 
2.35.1


