Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAC6C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szcCRmZuy4NhGcWL0raTjECMM05fymp5OkCVHmtTvgM=; b=GMTjtK9/qU6GAJmcN6w7FdN5L/
	laACrd8y0+RSgi/uEWnClLA8w28vjqChr2xgJSuoP0RTXw0FCvNtTI+IUExpL+9CDAJJPMTPk7PA7
	8cxn1kcdI6K6thH/xeN2zk0MW48lxhOn9p0XzW+/FH/58pBC85qgZxpMcKg/ZPF7o5XE9gcRY5Gjp
	5qMMtBENfNeGi+tqsjYQyfawrrCk+aar9XUOCttDgvagjZLxZB7suypN0oOa4T9IAruNw56pRTWY9
	YTOYI2AnHYcm4xp5WcPZWpxZFytJpVSRbIGyamiHQf267htQpJAlgS3B3+92/aXio4GaCJBNeeRWg
	MZLq47/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah3I-005SYY-Vn; Tue, 20 Sep 2022 17:28:57 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah1o-005RcY-TH; Tue, 20 Sep 2022 17:27:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663694823; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SW5HTuyVDhIioe2sze27nXjA7jZZ91BEkE/XFBlFNGKzI8nXVM6Fw9h+1P+6hNF/yhLrXZsCXoZ+Kl601/n5tS13/CUJ2tL01RCxTjTI85mCT7+ve0cua62t7CwnZWMFckoJvfm6MiXODjlTtiKFEBGCcP4rOIC8dYvSvdJnJEM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663694823; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=szcCRmZuy4NhGcWL0raTjECMM05fymp5OkCVHmtTvgM=; 
	b=c4fYq/Lq/SHutCmtI0Cm5MED9oOXHI3GEjQqPqbPWVFOMqxsNjU53hWLqYWmQLeaQaFcwrksfA4kXU7Rn1Mso4DxAeF/GuTwa1QED0uj5cfFm32/rcAfQrCj/OSUwhbUGmodjjBbA6ZzjyN38dSUMihHabxAWdwi/80cbItRKpQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663694823;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=szcCRmZuy4NhGcWL0raTjECMM05fymp5OkCVHmtTvgM=;
	b=a6G0w6Gfr6ar4P1XiZi5BGc9Tp5/2x0E/Ent+76327yAvvQCakVjyxAeSAFx2T0l
	Nr0k+H5p1TyHhIAtd+n6Fmbs7XsZmdZiTSauZ6j4F4QCSXf7NaB9SjRtn5XgwQrsaPz
	PuCpGc/pBHWjR1zEzxvXyu9VOafJ/hD3KO0DvcRM=
Received: from arinc9-Xeront.fusolab.local (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663694823123638.4050321531442; Tue, 20 Sep 2022 10:27:03 -0700 (PDT)
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
Subject: [PATCH v4 net-next 05/10] mips: dts: ralink: mt7621: fix some dtc warnings
Date: Tue, 20 Sep 2022 20:25:51 +0300
Message-Id: <20220920172556.16557-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920172556.16557-1-arinc.unal@arinc9.com>
References: <20220920172556.16557-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_102725_061223_EF1F7BFD 
X-CRM114-Status: GOOD (  12.37  )
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

- Change "memc: syscon@5000" to "memc: memory-controller@5000".
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
 arch/mips/boot/dts/ralink/mt7621.dtsi         | 30 ++++++++-----------
 3 files changed, 14 insertions(+), 20 deletions(-)

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
index ee46ace0bcc1..7cef1273796d 100644
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
@@ -110,17 +105,16 @@ i2c: i2c@900 {
 			pinctrl-0 = <&i2c_pins>;
 		};
 
-		memc: syscon@5000 {
+		memc: memory-controller@5000 {
 			compatible = "mediatek,mt7621-memc", "syscon";
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


