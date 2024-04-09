Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67C5C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/V8Ctn/36MDmxUjqJ+s9GUAb4WE7E2xMqfJ0WjSN2I=; b=4SVic2Ah8p/fHLCdbokJ38BhBT
	VeQgQaek5HpNMc5NjIQ8/sqnduwIPTLmjCdxxx8XvgvNKtKo5oSu/qfw5/UrloeXO2wx3M5OZMmBw
	UKMSLThPGBwb8x9mMlb9gxoz2k1+YJ8r9oWmdFZasbS9ikdVKTPws17Wt4tlBP+gjfTHEQYxYg49P
	faqckfo97+az1LGJBA1DJj5N80XEaWq/qBJEbbN8oOCo5LLFlSNBSVeziiGtxVlskh9v+dGSk62Ab
	OLC/R54+0zt6DemRw1bxVPjakAPPv/9L4fG5bW+mvtJR08NEqiEGedAwiQDTfeHqmHjyXeEKjM6lC
	uCmWGsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9sJ-00000001kxi-498q;
	Tue, 09 Apr 2024 11:42:52 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9ry-00000001kgP-2gMh;
	Tue, 09 Apr 2024 11:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712662949;
	bh=lRpaqbeDxkCxJuVuV7wFw13Xw8Co2VG0r3GNWGlOryA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=5WhdTDlkiKrSe2GfXSJrPNQond3nkwTpxc3x0pRZGKHszjxKRKNaLKFbBqv5BFXwj
	 mxmeb/aHZw+z9+II0rBbBVPf0j8UE0tpWCkAzwm7c7emzG9sxXRVF35QhON3xDcsJX
	 yig/p4HfQWJAnpgOOGwd0WHvuStK01CRWs9WMJLzPHpuBKeOX6zEazbD57ZOtQrZoc
	 0bBdD+82QH5P0aKthO5+wEI5aHOa646K8oItvS37R7sF2Tv68PrjOGJwEdIi78I8tr
	 lsSMWjuKw0THnAX8DH8Kk0NXXPfLmendQOe+Xj+gs4fGQCAcrFY7+NSKm1Dn8cBRg/
	 kerNjyJAT6qIg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8149C378212C;
	Tue,  9 Apr 2024 11:42:28 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8395-nio-12l: Enable PHYs and USB role switch
Date: Tue,  9 Apr 2024 13:42:10 +0200
Message-ID: <20240409114211.310462-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
References: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_044230_940822_252324C0 
X-CRM114-Status: GOOD (  11.77  )
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

Enable the PCIe0 PHY to be able to set calibrations read from eFuses,
improving the stability and performance of the PCIe link.

While at it, also enable the T-PHYs for both PCIe1 and for USB, allowing
the USB ports to finally switch to gadget mode if needed, and configure
the VBUS/ID pins of both USB ports for the same.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index f699633659b6..5cbe969da425 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -685,6 +685,26 @@ pins-bus {
 		};
 	};
 
+	usb3_port0_pins: usb3p0-default-pins {
+		pins-vbus {
+			pinmux = <PINMUX_GPIO63__FUNC_VBUSVALID>;
+			input-enable;
+		};
+	};
+
+	usb2_port0_pins: usb2p0-default-pins {
+		pins-iddig {
+			pinmux = <PINMUX_GPIO130__FUNC_IDDIG_1P>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pins-vbus {
+			pinmux = <PINMUX_GPIO131__FUNC_USB_DRVVBUS_1P>;
+			output-low;
+		};
+	};
+
 	wifi_vreg_pins: wifi-vreg-pins {
 		pins-wifi-pmu-en {
 			pinmux = <PINMUX_GPIO65__FUNC_GPIO65>;
@@ -709,6 +729,10 @@ &pcie1 {
 	status = "okay";
 };
 
+&pciephy {
+	status = "okay";
+};
+
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
@@ -776,6 +800,18 @@ mt6315_7_vbuck1: vbuck1 {
 	};
 };
 
+&u3phy0 {
+	status = "okay";
+};
+
+&u3phy1 {
+	status = "okay";
+};
+
+&u3phy2 {
+	status = "okay";
+};
+
 &uart0 {
 	/* Exposed at 40 pin connector */
 	pinctrl-0 = <&uart0_pins>;
@@ -791,6 +827,8 @@ &uart1 {
 };
 
 &ssusb0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb3_port0_pins>;
 	role-switch-default-mode = "host";
 	usb-role-switch;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
@@ -804,6 +842,8 @@ mtu3_hs0_role_sw: endpoint {
 };
 
 &ssusb2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb2_port0_pins>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
 };
-- 
2.44.0


