Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E5BC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnJHspgot/YGJEHgZwKy2SNfsOT4EWKDOwZJC30eU30=; b=CR71VEgTamiHUR0rGroO3cHjlE
	77R4/FpwcCOsR3X74X4fQnELdptYi19+aC/U0jbWFfMFLi1C0UVMtDao0Oc6lo17eW66jfa1PcZ0O
	gAcEbaFKgBQ3S0jAqD1mN2H376ERiBAanFXy0nS7EEjsG67c3iYm0/4VAUZANhZ4tPq4otxTJuY+U
	d9RfuVEA9ujg0em+Yx2LYeTDEWY1/jQOePd53/iKA8J0pyCKrXBZFj+UUSS5YpuH0/SU5rL+urZx0
	lgmPGHzjJy2ugQKH1A94xp6vu+QQfAIQeyWiIr0Fl3rb9e5k5oRPcxZ8kZdARC9fpeuafnHx+aykw
	mH6wVudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J7P-006rIQ-5b; Mon, 04 Jul 2022 10:15:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5F-006pgZ-I0; Mon, 04 Jul 2022 10:13:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7D66F66017F7;
	Mon,  4 Jul 2022 11:13:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656929616;
	bh=Uny8EAV7GcwYYEBS06gASsjFwmXHUY5/gKfjVQ6IThs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AxAXfGrtTmOPgixovjTav8w5OaniqIxuDNFoENTxcmvpnrHRD+OQ/U+t2e4MGs4Kd
	 Sf2odbj9t3iM5uMnwplgihE1rPJGa83IZ67hb/4XZnc8LvtcsGfM4YUP/4+XIjtJHE
	 1fKZU8GwJ8NnD/OlKiU//s61mXz83c5hxPEAar3K7Vb3+zB03/9NQWy0Yt4H23BA2t
	 +MRT8+KwzOcdHAgj7mDmPSptU7Hm7gN11KnSEXIo4x01q7LVbAF4fQM0hFX5CfVcZC
	 3NthdRT8xp8iuAuxF+FZblkJT62QS+hm4TTBh+AX3ftLvwvPId5AzsTcYL+yLpJK4N
	 +yeOGs87DuyBQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v2 08/11] arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers
Date: Mon,  4 Jul 2022 12:13:18 +0200
Message-Id: <20220704101321.44835-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031337_768091_947F0222 
X-CRM114-Status: GOOD (  11.27  )
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

Add USB functionality by enabling the required PHYs and the XHCI
controllers.
This enables all of the supported USB ports on the Cherry boards.

Please note that u3phy1 also enables u3port1, which is configured
to be a PCI-Express PHY for the second PCIe controller that is
found on the MT8195 SoC, which will be enabled in a later commit.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 20a4a3a32ab9..f68d8ff05b4d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -95,6 +95,15 @@ ppvar_sys: regulator-ppvar-sys {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	usb_vbus: regulator-5v0-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &i2c0 {
@@ -563,6 +572,52 @@ &spi0 {
 	mediatek,pad-select = <0>;
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
+&u3phy3 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
+
+&xhci0 {
+	status = "okay";
+
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_vbus>;
+};
+
+&xhci1 {
+	status = "okay";
+
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_vbus>;
+};
+
+&xhci2 {
+	status = "okay";
+
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_vbus>;
+};
+
+&xhci3 {
+	status = "okay";
+
+	/* MT7921's USB Bluetooth has issues with USB2 LPM */
+	usb2-lpm-disable;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_vbus>;
+};
-- 
2.35.1


