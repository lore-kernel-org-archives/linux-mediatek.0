Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3345FEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 09:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02bqbuuzDWYtFYfDR9iS1pN+U9IwstF9u0ZrGpEWUJI=; b=tzpqI4Zd3DKfSSWtcaWA21HREW
	e1CG5u/+p2jZnZFoU/EHJF9M+6ubasLJ2tkjM94GSnBnHNRbPFCZtZklUI9yjXyaPdR3IcfKVceba
	WyunDbLabYZtC6XbCW7udW2UFaw17MHTEiiFoIOmpT8vzmfBno8bVL3XlRiOynMXezH+TBR4M9GVn
	/TK914bj957639NNcAoFElQsKAmjOV3wejbDTIJbA3oJKU6mHaNueVYyhDCvXkINflE02KKPtZpny
	JylVEkmzM4mzlsOlp4biNrB5D+8pv+NrrgUdLJDZidFVOoEgIzbZmuVJzrcXMMwFmzzy1brrnyU4s
	aolXhR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPne-00AUwC-04;
	Thu, 20 Jul 2023 09:18:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPnc-00AUva-0C;
	Thu, 20 Jul 2023 09:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=02bqbuuzDWYtFYfDR9iS1pN+U9IwstF9u0ZrGpEWUJI=; b=luQc8BPEkoIphFoqEJ2ouFXCoU
	GKcBShCy8bkXhuCbMAUI7GuimtCpzaJXFtsItIbLp0H/sV5agEh5FPq0RTCtNVSR0IMAt/bdTX3Hv
	PNpcjp0O/Rt6Zbf1AEVWMW9ADQVZRtTT1yJqjzSXQfoiUmn75cW/7K11W9u49EDrn/To33j/XdOcV
	7ebcR/I6vXgmXOu676KLp8kR8/A49E9pXggrCVb9pQA5L05g8kXjmdynbTqScCODu2h85o8j+qXee
	3qam8rLstvO+WdcnU7TPRKjph4a0XYzGJBxgU+5SaA2+ITEM1LCMQeviqOXuQSbpICCMAmo24Nm/v
	I3vqoIig==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPlZ-00FSY6-2g;
	Thu, 20 Jul 2023 09:18:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E3686607083;
	Thu, 20 Jul 2023 10:16:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689844567;
	bh=RS3D7qGMh5ZjtLMh7J5GSgr8hhXOOvN9RiKn2MLxZCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JJPIhuBqC+hCROartfkj7tc548eLIs207EAB6dKzvEUNySYWuBdiSZ68gmqmlBMX5
	 RhO9HB63iA8MShcPKAA1brEW2ECkavTaEbfzTxvwmvkmGDqrrwu79wDzPvkIrwWVcB
	 DfXhGtW3MwQN9sz50J9dQ8lwR6VuIFQ+aeozAAOiIRzAczFXp+a1Txz382YJwrzBCH
	 7yDdz1/uFD0RtzCbvb52XpBIhj8fMRBK/0Ub4VqqPAmt0ahaDpQcO90aQ7K/NeY0w2
	 yUNbkveIdhJU4t25gJkKChDxBxRahvMrQBUfUZ2T62Q1s//iU+NmUOatPafBJVt577
	 zw5gUV7wAobjg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt6795-xperia-m5: Add DSI Display and its vregs
Date: Thu, 20 Jul 2023 11:15:59 +0200
Message-Id: <20230720091559.86406-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
References: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_101810_227636_3EC58465 
X-CRM114-Status: UNSURE (   9.29  )
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

Add support for the DSI display found on the Sony Xperia M5, including
the necessary regulators configuration for it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index ecdf00707a44..7364c7278276 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -66,6 +66,65 @@ bootloader-region@46000000 {
 			no-map;
 		};
 	};
+
+	vreg_disp_avdd: regulator-disp-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_avdd";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 138 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_disp_avee: regulator-disp-avee {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_avee";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 139 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_disp_vddh: regulator-disp-vddh {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_vddh";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&dsi0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel: panel@0 {
+		compatible = "sharp,ls060t1sx01";
+		reg = <0>;
+		avdd-supply = <&vreg_disp_avdd>;
+		avee-supply = <&vreg_disp_avee>;
+		vddi-supply = <&mt6331_vgp3_reg>;
+		vddh-supply = <&vreg_disp_vddh>;
+		reset-gpios = <&pio 106 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight_lcd0>;
+
+		pinctrl-0 = <&disp_rst_pins>;
+		pinctrl-names = "default";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+
+	port {
+		dsi0_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &fhctl {
@@ -180,7 +239,17 @@ &mmc2 {
 	status = "okay";
 };
 
+&mt6331_vgp3_reg {
+	regulator-min-microvolt = <1800000>;
+};
+
 &pio {
+	disp_rst_pins: lcm-pins {
+		pins-rst {
+			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
+		};
+	};
+
 	mmc0_pins_default: emmc-sdr-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
-- 
2.40.1


