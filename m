Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF258C25B50
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 20:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQqyEY4OZlOoxvPwc5KGMQiYCSGmPkLpP4A57mM096Y=; b=HkbiBq0rXFTGlK
	1qs7GZh1dCBN1rD3wjwqdJ8eM1M12GYMy/gAqUAOlrp22H+OO/5KQlNg1ZFvXjLq2Njn+2OYnif9S
	KdAv06MVJ6ThP4obCW3urm9n5sbsyAC50GOC8tQgkAbDw1ZBKDU48nDBXxv9uA22BoV8ZEQkE0AXR
	4L/lxc0toQ2wvEWYWW1rmhHArN8I8uSmSjDEdTEJdcJ2jEEn4WgMZh6n8moOyjPJCRq5PZ77TiGMp
	ZvktDqgLblPny0UDE8ydOoBgviEPv6O/+BThah37j7gkPA/VFvInOWrStra3tSkjMWB2/o78BxpBI
	UzI1/haboD4syEGK9qOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOZ-00CLHl-Gq; Fri, 20 Jan 2023 20:53:55 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOV-00CLGI-LI; Fri, 20 Jan 2023 20:53:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674248027; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BlfhdIEVfBMi6VSHi7jQb9C25jZqfFBp2X2z4s/uec9glKLrFAxnwHvVgH9qAcZtqqaUrxE+AJAXvdDOBe/Ecng0ciYO7fB+ApDwmq9OPHyzpGTPgP+NyDy0W/ZAJX6FTztpjVd8HkypyZZJeOcIWYyunIWktJDZq6CnuwgdxJ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674248027; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ZQqyEY4OZlOoxvPwc5KGMQiYCSGmPkLpP4A57mM096Y=; 
	b=Pkc7ZadrPQezN1krK66aHKoWfF2ACN8DRXgfOnjZCV3gjvDIdj55AInK9FEh8AkckV/HU6yDyfZTMBwsXPcO3Vt1unH6/FzfdktIuDDYqpL5chSnHcHGJvAKJclrU1vYyIwd20aCNqv1TSHLBuhk+GO4i2jrT4iI5IAyknln7ZA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674248027;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=ZQqyEY4OZlOoxvPwc5KGMQiYCSGmPkLpP4A57mM096Y=;
	b=bF0YBcsuUdwuhiQeTh6qXDJTRqWuPEmtfJ3YkFs7pQrk5yFrEdSPQJqdh3ZpxDhK
	U1JDn/9q62cmHf+VQ1mVW1ggOPZRqlgfpHhUf9jpiDdkFwbp8gunvH4YeyW4OrMnQP5
	YcS4mKHS0AMCcM2bi3CCIBycuq5trjUr6Ab3RhVI=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1674248025497958.0689686974733; Fri, 20 Jan 2023 12:53:45 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/5] arm: dts: mt7623: add mt7530 switch to mt7623a.dtsi
Date: Fri, 20 Jan 2023 23:53:15 +0300
Message-Id: <20230120205318.519493-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120205318.519493-1-arinc.unal@arinc9.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_125352_033777_B5DFA83B 
X-CRM114-Status: GOOD (  10.07  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT7530 switch is included as a part of the multi-chip module on the
MT7623AI SoC. Add it to mt7623a.dtsi and adjust DTs that call mt7623a.dtsi.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

I don’t know if there’s a pin wired for interrupt. The switch is going to
work with polling for the time being. Folks from MediaTek, feel free to
fill me in on this.

Arınç

---
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts | 84 +++++++-------------------
 arch/arm/boot/dts/mt7623a-rfb-nand.dts | 84 +++++++-------------------
 arch/arm/boot/dts/mt7623a.dtsi         | 73 ++++++++++++++++++++++
 3 files changed, 115 insertions(+), 126 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
index 8297123f9d09..5654284bab01 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
@@ -112,73 +112,31 @@ &crypto {
 	status = "okay";
 };
 
-&eth {
-	status = "okay";
+&switch0 {
+	ports {
+		port@0 {
+			status = "okay";
+			label = "lan0";
+		};
 
-	gmac0: mac@0 {
-		status = "okay";
+		port@1 {
+			status = "okay";
+			label = "lan1";
+		};
 
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
+		port@2 {
+			status = "okay";
+			label = "lan2";
+		};
+
+		port@3 {
+			status = "okay";
+			label = "lan3";
 		};
-	};
 
-	mdio-bus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		switch@0 {
-			compatible = "mediatek,mt7530";
-			reg = <0>;
-			mediatek,mcm;
-			resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
-			reset-names = "mcm";
-			core-supply = <&mt6323_vpa_reg>;
-			io-supply = <&mt6323_vemc3v3_reg>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					label = "lan0";
-				};
-
-				port@1 {
-					reg = <1>;
-					label = "lan1";
-				};
-
-				port@2 {
-					reg = <2>;
-					label = "lan2";
-				};
-
-				port@3 {
-					reg = <3>;
-					label = "lan3";
-				};
-
-				port@4 {
-					reg = <4>;
-					label = "wan";
-				};
-
-				port@6 {
-					reg = <6>;
-					label = "cpu";
-					ethernet = <&gmac0>;
-					phy-mode = "trgmii";
-
-					fixed-link {
-						speed = <1000>;
-						full-duplex;
-					};
-				};
-			};
+		port@4 {
+			status = "okay";
+			label = "wan";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/mt7623a-rfb-nand.dts b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
index 9ee859b8eea7..afd177b3b516 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-nand.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
@@ -116,73 +116,31 @@ &crypto {
 	status = "okay";
 };
 
-&eth {
-	status = "okay";
+&switch0 {
+	ports {
+		port@0 {
+			status = "okay";
+			label = "lan0";
+		};
 
-	gmac0: mac@0 {
-		status = "okay";
+		port@1 {
+			status = "okay";
+			label = "lan1";
+		};
 
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
+		port@2 {
+			status = "okay";
+			label = "lan2";
 		};
-	};
 
-	mdio-bus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		switch@0 {
-			compatible = "mediatek,mt7530";
-			reg = <0>;
-			mediatek,mcm;
-			resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
-			reset-names = "mcm";
-			core-supply = <&mt6323_vpa_reg>;
-			io-supply = <&mt6323_vemc3v3_reg>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					label = "lan0";
-				};
-
-				port@1 {
-					reg = <1>;
-					label = "lan1";
-				};
-
-				port@2 {
-					reg = <2>;
-					label = "lan2";
-				};
-
-				port@3 {
-					reg = <3>;
-					label = "lan3";
-				};
-
-				port@4 {
-					reg = <4>;
-					label = "wan";
-				};
-
-				port@6 {
-					reg = <6>;
-					label = "cpu";
-					ethernet = <&gmac0>;
-					phy-mode = "trgmii";
-
-					fixed-link {
-						speed = <1000>;
-						full-duplex;
-					};
-				};
-			};
+		port@3 {
+			status = "okay";
+			label = "lan3";
+		};
+
+		port@4 {
+			status = "okay";
+			label = "wan";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index d304b62d24b5..5207e0183f3a 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -18,7 +18,80 @@ &crypto {
 };
 
 &eth {
+	status = "okay";
 	power-domains = <&scpsys MT7623A_POWER_DOMAIN_ETH>;
+
+	gmac0: mac@0 {
+		status = "okay";
+
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+			pause;
+		};
+	};
+
+	mdio: mdio-bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		switch0: switch@0 {
+			compatible = "mediatek,mt7530";
+			reg = <0>;
+			mediatek,mcm;
+			resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
+			reset-names = "mcm";
+			core-supply = <&mt6323_vpa_reg>;
+			io-supply = <&mt6323_vemc3v3_reg>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					status = "disabled";
+					reg = <0>;
+					label = "swp0";
+				};
+
+				port@1 {
+					status = "disabled";
+					reg = <1>;
+					label = "swp1";
+				};
+
+				port@2 {
+					status = "disabled";
+					reg = <2>;
+					label = "swp2";
+				};
+
+				port@3 {
+					status = "disabled";
+					reg = <3>;
+					label = "swp3";
+				};
+
+				port@4 {
+					status = "disabled";
+					reg = <4>;
+					label = "swp4";
+				};
+
+				port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gmac0>;
+					phy-mode = "trgmii";
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+					};
+				};
+			};
+		};
+	};
 };
 
 &nandc {
-- 
2.37.2


