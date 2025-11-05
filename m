Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC2DCCFA1B
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LeoqZv3J6t2Lu06YdrFLcmlUA455lKj3p+A2h/ypu8=; b=PfxLR/Mh2vBYaTJCsX5x5GiFJT
	c0XXtfD6Q7TsmIVYzLO9l2tgwYZnmIEkVuwoQmVgaUOTuLbleLuWmFzxr8IXcuR4lVScxkNwxJOJ4
	arLlD/JihJ70w8AtqG+NlDelQAmD9eRvnysxvuQgTkrITmUAZDlfRKn6+oLfUtx4wsOrp+6lU/m0I
	AFoY/3+mRPZVyjWrkB1aPP2LkchYiZ6ExCSaXXkYP9MoyhWinMA0n9ufduTt9gxOfaa5Z7ZEcqneh
	O0ujcAlTyM7uqLKAMRxQpZML9inVDQvrpvFzsHSPE10NZVbkZ8vrdEyEEX7d90jfmPjBu/JMouO7L
	EmjFICkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkuL-0000000EUdx-0bjn;
	Wed, 05 Nov 2025 21:19:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGktv-0000000EU0s-1jI7;
	Wed, 05 Nov 2025 21:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762377516;
	bh=qtE8TxX+bp4mVeKXXycM622mPKaw8qoe/nGz0YEjV0g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IaRJcfEJJPmuVxfIA0AMonJG0NAIwG2GFs1HcbU8uvXF99pgELvzC5G7nSSRhwUVJ
	 LuwV5lD0JO+6NbQDCg/6824/ru1L/WtPNmPZ9XIv2dmNWRPrG1D+ir8Y18q8GzoaIE
	 qEW8KlPcmRtH5QYv8gEmfKMpqY/vnwuoHhrQxhH/YBZUJn8Mrio3T/yeFVOaa9Kfp/
	 3bU7QVAyxxZtxGmkVSf/V0rYQ39sDr5ivWxPxN2ygRhLyKoa/vXN3Zh8b/MbgnaR53
	 jdmgxlQ8Y7in86CB/YBRRqqqam07WivxiWw5icWmtAT4asEubhTmOpyhAMNyxRoJ/A
	 g3EvDDnrDetBw==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4164C17E1500;
	Wed,  5 Nov 2025 22:18:36 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id B209C10F352E7; Wed, 05 Nov 2025 22:18:34 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 05 Nov 2025 22:18:02 +0100
Subject: [PATCH v3 07/13] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 PCIe and USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-openwrt-one-network-v3-7-008e2cab38d1@collabora.com>
References: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
In-Reply-To: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_131843_751628_5822FC28 
X-CRM114-Status: GOOD (  11.99  )
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

Enable the PCIe controller and USB3 XHCI host on the OpenWrt One
board. The USB controller is configured for USB 2.0 only mode, as the
shared USB3/PCIe PHY is dedicated to PCIe functionality on this board.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 2e39e72877301..7382599cfea29 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -67,9 +67,40 @@ led-2 {
 			linux,default-trigger = "netdev";
 		};
 	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	status = "okay";
 };
 
 &pio {
+	pcie_pins: pcie-pins {
+		mux {
+			function = "pcie";
+			groups = "pcie_pereset";
+		};
+	};
+
 	pwm_pins: pwm-pins {
 		mux {
 			function = "pwm";
@@ -163,3 +194,15 @@ partition@180000 {
 &uart0 {
 	status = "okay";
 };
+
+&usb_phy {
+	status = "okay";
+};
+
+&xhci {
+	phys = <&u2port0 PHY_TYPE_USB2>;
+	vusb33-supply = <&reg_3p3v>;
+	vbus-supply = <&reg_5v>;
+	mediatek,u3p-dis-msk = <0x01>;
+	status = "okay";
+};

-- 
2.51.0


