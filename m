Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YES+VxpXyE1vzXzAmn5u3XXXJMXZXwnrVAXwfqdvBug=; b=IHfwhh5ZdNehp5
	ccIv4OgrrJR1r4NA8aOfKF9CSjqdBNxhJ5euxfK+iLAvuVLsChN2c6zhfo2Ox3z95lB59LEhmO1Dj
	0/GoVtJJNWmD1I7CipGqATyIbMZLTBj0TyOO0A7eVb5Hmo7KmPi/J+ZYydSbR3iTDXKmvyX/L0K0l
	csHAzjj0qB7wxGuH4YIIOjtzoSkdIh2gJc7+J15J0nTZPbf9XASRMXzjHwaJzNY+0pdjtcB3BronZ
	hYatu8euh6hbgLv/0gEUIFOKNMeo/2jDVzEyLhwJ/cdxvvnsaJoQ2KCEj52pnEwKq8T3spKRnT/e7
	Fsf6vfGFDfeV0cuG3bzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdGR-008rOT-SV; Mon, 16 May 2022 16:08:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdG5-008rAm-5W
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 16:07:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB7DFB81243;
 Mon, 16 May 2022 16:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11BBC385AA;
 Mon, 16 May 2022 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717262;
 bh=jjinRlKFxifScyEw3OjetYoQ52Kq5EtAMT5xBGYx7aA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EpwkWTUByEhFiRMI9BJxFC8C1LSTZEt75kW4RdxXupXCUZQXPHs1VspfG6Xp+FR+n
 TrjRKGpPPxt3YzZuGaYvgdgB5ldyt3q4bxkzE3krvqQDEudVof11C2r3PytplSOqlo
 PJYb2L3W4oAG81w4BJzxT9ngbRZq6pjRn2iPcXcN/ZoVQhvknMf7PC/yTS77hr+0t9
 PukHu6Fwa/e+QAADrDMP/UPnqAKCeZtLzqN4U11m7D1oSoT1+LpbVeJrfouKaCKYQH
 ocKAeCR9k/e7v6VDXA/3dxQrsAmC2cpImLezD/vQHZ5REdlyUpdAJyl3CMqEEqDr6J
 jf6r9YmrP+dBA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v2 net-next 01/15] arm64: dts: mediatek: mt7986: introduce
 ethernet nodes
Date: Mon, 16 May 2022 18:06:28 +0200
Message-Id: <2d74a009757a558a26f74d7c9c8070af57926be5.1652716741.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090745_538148_78805CC0 
X-CRM114-Status: UNSURE (   9.38  )
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
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 74 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 39 +++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 70 ++++++++++++++++++
 3 files changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 21e420829572..882277a52b69 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -25,6 +25,80 @@ memory@40000000 {
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
+	mdio: mdio-bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
+
+&mdio {
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
+		port@4 {
+			reg = <4>;
+			label = "lan4";
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
index d73467ea3641..0f49d5764ff3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -28,3 +28,73 @@ memory@40000000 {
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
+	mdio: mdio-bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
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
+				port@4 {
+					reg = <4>;
+					label = "lan4";
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
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
