Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC002C43217
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZdnwlB8Qoi3xXzQG1d4deXMNCMueh1y1ttEOgaGR2Y=; b=cpd42bf2jk6Reh
	XHVxd5LuOLQhZ986D4wQ1GL0KWNzSZiFLmIbUrWTPq4xKPbcF0b7VHvpNoL5HJQDEBlg+YnYrB2+N
	68N831IDFQL1ZJC8swksjYFn3EuHSRly40TmhX7uuguc7pz+PmEnWK3RB8Lt5bLvBP5r/8hC2nuNJ
	3DZlXZeyGwhN6lcwB++kiepH59bYbRtm5/8DnRrcD2ODTai/ZZo+fEzC0bIzLKiPcK16iEIp6cTd/
	QvQ43XOYsxIT7wy98P02m+njkfxR2p0iVM0UxlVQPUjAwY1LmyG5CMdpD258EsBdgKIjsUxs9J/4M
	TxIGFhKNhpqmpu11I+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmx77-003B7b-3h; Fri, 06 May 2022 12:31:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmx72-003B5w-VB
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 12:31:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E8C661EDF;
 Fri,  6 May 2022 12:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C7DC385B0;
 Fri,  6 May 2022 12:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651840272;
 bh=e3HwAJgXFgwZGADyox9TBD3Y9WV6JkXcZIW+MQUu/l0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GyKQ+Z/2iNSsacZdxEB+bSaKGYt8+oGUl3W40JLVbXszHsGFZLQJBYtQhjo5fhqMf
 /Axfzylm7GypmnWx2HzPFDYqNak/SN0T2+ATJ6c3zFk0ekHk50FX2XGeSmNGYQZcZw
 XGFbWoede4bNXwfAs+gxwHdzuikaRhd+ThoMjs2uBRofqydmq5R3GYZEfA4+cYb/UK
 1hzGY8RmmmysbS4UcTBbQvzXjDxrQRkOzAtarTFeDM43k3R5uLIWdY8Ph3XLyAh8g+
 3seQ/+btLGMnMu9WOGBopJuoDv0uUL8oAvn3oi62vx2rxASK9vcjCf3N0goEGQlDaT
 odl4NelENn6+Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: [PATCH net-next 01/14] arm64: dts: mediatek: mt7986: introduce
 ethernet nodes
Date: Fri,  6 May 2022 14:30:18 +0200
Message-Id: <1d555fbbac820e9b580da3e8c0db30e7d003c4b6.1651839494.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651839494.git.lorenzo@kernel.org>
References: <cover.1651839494.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_053113_115950_2ABD2561 
X-CRM114-Status: UNSURE (   8.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce ethernet nodes in mt7986 bindings in order to
enable mt7986a/mt7986b ethernet support.

Co-developed-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 95 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 39 ++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 91 +++++++++++++++++++
 3 files changed, 225 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 21e420829572..c5a4e999234c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -25,6 +25,101 @@ memory@40000000 {
 	};
 };
 
+&eth {
+	status = "okay";
+
+	gmac0: mac@0 {
+		compatible = "mediatek,eth-mac";
+		reg = <0>;
+		phy-mode = "2500base-x";
+
+		fixed-link {
+			speed = <2500>;
+			full-duplex;
+			pause;
+		};
+	};
+
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "2500base-x";
+
+		fixed-link {
+			speed = <2500>;
+			full-duplex;
+			pause;
+		};
+	};
+
+	mdio: mdio-bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
+
+&mdio {
+	phy5: phy@5 {
+		compatible = "ethernet-phy-id67c9.de0a";
+		reg = <5>;
+		reset-gpios = <&pio 6 1>;
+		reset-deassert-us = <20000>;
+		phy-mode = "2500base-x";
+	};
+
+	phy6: phy@6 {
+		compatible = "ethernet-phy-id67c9.de0a";
+		reg = <6>;
+		phy-mode = "2500base-x";
+	};
+
+	switch: switch@0 {
+		compatible = "mediatek,mt7531";
+		reg = <31>;
+		reset-gpios = <&pio 5 0>;
+	};
+};
+
+&switch {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			label = "lan0";
+		};
+
+		port@1 {
+			reg = <1>;
+			label = "lan1";
+		};
+
+		port@2 {
+			reg = <2>;
+			label = "lan2";
+		};
+
+		port@3 {
+			reg = <3>;
+			label = "lan3";
+		};
+
+		port@6 {
+			reg = <6>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+			phy-mode = "2500base-x";
+
+			fixed-link {
+				speed = <2500>;
+				full-duplex;
+				pause;
+			};
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 694acf8f5b70..d2636a0ed152 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -222,6 +222,45 @@ ethsys: syscon@15000000 {
 			 #reset-cells = <1>;
 		};
 
+		eth: ethernet@15100000 {
+			compatible = "mediatek,mt7986-eth";
+			reg = <0 0x15100000 0 0x80000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ethsys CLK_ETH_FE_EN>,
+				 <&ethsys CLK_ETH_GP2_EN>,
+				 <&ethsys CLK_ETH_GP1_EN>,
+				 <&ethsys CLK_ETH_WOCPU1_EN>,
+				 <&ethsys CLK_ETH_WOCPU0_EN>,
+				 <&sgmiisys0 CLK_SGMII0_TX250M_EN>,
+				 <&sgmiisys0 CLK_SGMII0_RX250M_EN>,
+				 <&sgmiisys0 CLK_SGMII0_CDR_REF>,
+				 <&sgmiisys0 CLK_SGMII0_CDR_FB>,
+				 <&sgmiisys1 CLK_SGMII1_TX250M_EN>,
+				 <&sgmiisys1 CLK_SGMII1_RX250M_EN>,
+				 <&sgmiisys1 CLK_SGMII1_CDR_REF>,
+				 <&sgmiisys1 CLK_SGMII1_CDR_FB>,
+				 <&topckgen CLK_TOP_NETSYS_SEL>,
+				 <&topckgen CLK_TOP_NETSYS_500M_SEL>;
+			clock-names = "fe", "gp2", "gp1", "wocpu1", "wocpu0",
+				      "sgmii_tx250m", "sgmii_rx250m",
+				      "sgmii_cdr_ref", "sgmii_cdr_fb",
+				      "sgmii2_tx250m", "sgmii2_rx250m",
+				      "sgmii2_cdr_ref", "sgmii2_cdr_fb",
+				      "netsys0", "netsys1";
+			assigned-clocks = <&topckgen CLK_TOP_NETSYS_2X_SEL>,
+					  <&topckgen CLK_TOP_SGM_325M_SEL>;
+			assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>,
+						 <&apmixedsys CLK_APMIXED_SGMPLL>;
+			mediatek,ethsys = <&ethsys>;
+			mediatek,sgmiisys = <&sgmiisys0>, <&sgmiisys1>;
+			#reset-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index d73467ea3641..5ed275dcd3dc 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -28,3 +28,94 @@ memory@40000000 {
 &uart0 {
 	status = "okay";
 };
+
+&eth {
+	status = "okay";
+
+	gmac0: mac@0 {
+		compatible = "mediatek,eth-mac";
+		reg = <0>;
+		phy-mode = "2500base-x";
+
+		fixed-link {
+			speed = <2500>;
+			full-duplex;
+			pause;
+		};
+	};
+
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "2500base-x";
+
+		fixed-link {
+			speed = <2500>;
+			full-duplex;
+			pause;
+		};
+	};
+
+	mdio: mdio-bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy5: phy@5 {
+			compatible = "ethernet-phy-id67c9.de0a";
+			reg = <5>;
+			reset-gpios = <&pio 6 1>;
+			reset-deassert-us = <20000>;
+			phy-mode = "2500base-x";
+		};
+
+		phy6: phy@6 {
+			compatible = "ethernet-phy-id67c9.de0a";
+			reg = <6>;
+			phy-mode = "2500base-x";
+		};
+
+		switch@0 {
+			compatible = "mediatek,mt7531";
+			reg = <31>;
+			reset-gpios = <&pio 5 0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					label = "lan0";
+				};
+
+				port@1 {
+					reg = <1>;
+					label = "lan1";
+				};
+
+				port@2 {
+					reg = <2>;
+					label = "lan2";
+				};
+
+				port@3 {
+					reg = <3>;
+					label = "lan3";
+				};
+
+				port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gmac0>;
+					phy-mode = "2500base-x";
+
+					fixed-link {
+						speed = <2500>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+		};
+	};
+};
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
