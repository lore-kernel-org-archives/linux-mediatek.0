Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E66CC6FA8B
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJREtdwSOo7JFbDECDLz7HOrSPGkQUqcnd5tlra1eZs=; b=FMse4ghfGfuj0Qtu8d9A56jIaz
	aDKO/ysQhV5wHxyd6EdgCKb9LCsw43sOLaYlTqgdXGqG0OyIERzZ8IKN0pGbQnpRaKyjQi4GcjyS1
	Dl0GP28VjGREHvnYaZ/6DSopC85IVNVxvL42y3NRJnVdt07smCSm017um7WNXfqNWwMiiR9OYUAdh
	MgNWgpONJhytx9eRRvS0WZMhNsINOb4K4d791/+vekvQ+zFJLvuX5y5DFEGZPIrtFIlA7tXgTB1Yf
	io9mTSyFyEDVnQ+AzVGpyhxY3VKzHK5IKDBjAi6LLlvIYN/u5WzsjpDyswWCYF5q+5Y9iqfgDlgZm
	6VC5BOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZuaR-00GaMe-Dd; Sun, 18 Sep 2022 13:43:55 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZuYr-00GYxD-R7; Sun, 18 Sep 2022 13:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663508520; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SlEj10dw02E87CgpBgaJ38BdDZT2LRiPJF2c207pHhwuPzqJ7VN45R7ZKIQLvIf9vLUtC23D7aXIswd2j2E9V3ziP6CF00cqKzx40Py8wTIFrRnNXcLZukwH8JKpHzDuF9xQl6QCM3cfknknqjv56gqiv5R793CUTCf3XDcWZPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663508520; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=hJREtdwSOo7JFbDECDLz7HOrSPGkQUqcnd5tlra1eZs=; 
	b=cvm5rDgy0q4QVspbUxx7fEAv8MLXfr8aZdjTL84Tshw/PbzQ4rNWC81mi266BG7/cD/Y25AajpNHfJaA24gABqOVn636K+A9bwjjdtAoLhy46/CvkxmyqcZOumoi1VYtgeGVTZ0RnmMiyRYIUcKiAGU4H8Ak+mdwZ8U5Rgbn4pw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663508520;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=hJREtdwSOo7JFbDECDLz7HOrSPGkQUqcnd5tlra1eZs=;
	b=cirVRCbN+ZuKxyM12I8zCzIiQngTdQZ792WQEYthBriIY7wYfh+boRZrVnk1MFI7
	6JM2lQfjk/MYjaZl7dKf74UFh5fAZuEltCzjuX+iWBPUbVCv9ytdhnFg9MrbDpUMXMb
	kPxhgd9J6hofMTkjb+NWTfD5EIGOeWukgdblJWVs=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663508519057984.4231959177488; Sun, 18 Sep 2022 06:41:59 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v3 net-next 05/10] mips: dts: ralink: mt7621: fix some dtc warnings
Date: Sun, 18 Sep 2022 16:41:13 +0300
Message-Id: <20220918134118.554813-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220918134118.554813-1-arinc.unal@arinc9.com>
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_064217_986679_5441DC68 
X-CRM114-Status: GOOD (  12.31  )
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

Fix the dtc warnings below.

uartlite@c00: $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
	From schema: /home/arinc9/Documents/linux/Documentation/devicetree/bindings/serial/8250.yaml
uartlite@c00: Unevaluated properties are not allowed ('clock-names' was unexpected)
	From schema: /home/arinc9/Documents/linux/Documentation/devicetree/bindings/serial/8250.yaml
sdhci@1e130000: $nodename:0: 'sdhci@1e130000' does not match '^mmc(@.*)?$'
	From schema: /home/arinc9/Documents/linux/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
xhci@1e1c0000: $nodename:0: 'xhci@1e1c0000' does not match '^usb(@.*)?'
	From schema: /home/arinc9/Documents/linux/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
xhci@1e1c0000: compatible: ['mediatek,mt8173-xhci'] is too short
	From schema: /home/arinc9/Documents/linux/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
switch0@0: $nodename:0: 'switch0@0' does not match '^(ethernet-)?switch(@.*)?$'
	From schema: /home/arinc9/Documents/linux/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
port@1: status:0: 'off' is not one of ['okay', 'disabled', 'reserved']
	From schema: /home/arinc9/.local/lib/python3.10/site-packages/dtschema/schemas/dt-core.yaml
port@2: status:0: 'off' is not one of ['okay', 'disabled', 'reserved']
	From schema: /home/arinc9/.local/lib/python3.10/site-packages/dtschema/schemas/dt-core.yaml
port@3: status:0: 'off' is not one of ['okay', 'disabled', 'reserved']
	From schema: /home/arinc9/.local/lib/python3.10/site-packages/dtschema/schemas/dt-core.yaml

- Change "uartlite: uartlite@c00" to "serial0: serial@c00" and remove the
aliases node.
- Remove "clock-names" from the serial0 node. The property doesn't exist on
the 8250.yaml schema.
- Change "sdhci: sdhci@1e130000" to "mmc: mmc@1e130000".
- Change "xhci: xhci@1e1c0000" to "usb: usb@1e1c0000".
- Add "mediatek,mtk-xhci" as the second compatible string on the usb node.
- Change "switch0: switch0@0" to "switch0: switch@0"
- Change "off" to "disabled" for disabled nodes.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts  |  2 +-
 .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts  |  2 +-
 arch/mips/boot/dts/ralink/mt7621.dtsi         | 28 ++++++++-----------
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
index 24eebc5a85b1..6ecb8165efe8 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
@@ -53,7 +53,7 @@ system {
 	};
 };
 
-&sdhci {
+&mmc {
 	status = "okay";
 };
 
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index 34006e667780..2e534ea5bab7 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -37,7 +37,7 @@ key-reset {
 	};
 };
 
-&sdhci {
+&mmc {
 	status = "okay";
 };
 
diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index ee46ace0bcc1..294ee453ec36 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -33,11 +33,6 @@ cpuintc: cpuintc {
 		compatible = "mti,cpu-interrupt-controller";
 	};
 
-	aliases {
-		serial0 = &uartlite;
-	};
-
-
 	mmc_fixed_3v3: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "mmc_power";
@@ -115,12 +110,11 @@ memc: syscon@5000 {
 			reg = <0x5000 0x1000>;
 		};
 
-		uartlite: uartlite@c00 {
+		serial0: serial@c00 {
 			compatible = "ns16550a";
 			reg = <0xc00 0x100>;
 
 			clocks = <&sysc MT7621_CLK_UART1>;
-			clock-names = "uart1";
 
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -236,7 +230,7 @@ pinmux {
 		};
 	};
 
-	sdhci: sdhci@1e130000 {
+	mmc: mmc@1e130000 {
 		status = "disabled";
 
 		compatible = "mediatek,mt7620-mmc";
@@ -262,8 +256,8 @@ sdhci: sdhci@1e130000 {
 		interrupts = <GIC_SHARED 20 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	xhci: xhci@1e1c0000 {
-		compatible = "mediatek,mt8173-xhci";
+	usb: usb@1e1c0000 {
+		compatible = "mediatek,mt8173-xhci", "mediatek,mtk-xhci";
 		reg = <0x1e1c0000 0x1000
 		       0x1e1d0700 0x0100>;
 		reg-names = "mac", "ippc";
@@ -338,7 +332,7 @@ fixed-link {
 		gmac1: mac@1 {
 			compatible = "mediatek,eth-mac";
 			reg = <1>;
-			status = "off";
+			status = "disabled";
 			phy-mode = "rgmii-rxid";
 		};
 
@@ -346,7 +340,7 @@ mdio: mdio-bus {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			switch0: switch0@0 {
+			switch0: switch@0 {
 				compatible = "mediatek,mt7621";
 				reg = <0>;
 				mediatek,mcm;
@@ -362,31 +356,31 @@ ports {
 					#size-cells = <0>;
 
 					port@0 {
-						status = "off";
+						status = "disabled";
 						reg = <0>;
 						label = "lan0";
 					};
 
 					port@1 {
-						status = "off";
+						status = "disabled";
 						reg = <1>;
 						label = "lan1";
 					};
 
 					port@2 {
-						status = "off";
+						status = "disabled";
 						reg = <2>;
 						label = "lan2";
 					};
 
 					port@3 {
-						status = "off";
+						status = "disabled";
 						reg = <3>;
 						label = "lan3";
 					};
 
 					port@4 {
-						status = "off";
+						status = "disabled";
 						reg = <4>;
 						label = "lan4";
 					};
-- 
2.34.1


