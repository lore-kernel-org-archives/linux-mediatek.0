Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0D1C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 18:02:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 534C764F38
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 18:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 534C764F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G1suuK9GRNLmwgR/NbzUBir/L/vRC9bPTPI7Ic14SA4=; b=eXyr3Wx9ouFl2ZHemDCQW49Xl7
	7itJNVwHAhgRwq/tTHF/JwJ3mb2Dp8tDquxtS/C5l94aT2mEEZHB4ZYhhqgnBOkxGWSKzhm0Zykwr
	RCdPgcWMKMmLGVOMKBiM7ySlP0qjn0/fAj+XidOoYN19Re0IZhJh1VLRE0kZqIji1iNthdIZ5Nzey
	tbwTG2d1h7IEOMsUgMJ0rveEEEmLQeeAMbn9vMFvnDi6c9q7piDPhNcKY71p/fkLFjY2iwjPHXN4+
	cA+QE3lMwAcnyU7y9ro39CgQ6V1tWUFWt4GCpWEA85mxX5e4IgtERBvtirAEBINssNHP3dP5fybba
	Z1zuMGlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7ixk-00060T-1o; Thu, 04 Feb 2021 18:02:40 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7ixf-0005xN-Uc
 for linux-mediatek@lists.infradead.org; Thu, 04 Feb 2021 18:02:37 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id R62Q240044C55Sk0662QyJ; Thu, 04 Feb 2021 19:02:34 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l7im7-003Fgj-G8; Thu, 04 Feb 2021 18:50:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l7eCF-006uET-Ge; Thu, 04 Feb 2021 13:57:19 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: pinctrl: Group tuples in pin control properties
Date: Thu,  4 Feb 2021 13:57:18 +0100
Message-Id: <20210204125718.1646082-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_130236_208717_2E1AA968 
X-CRM114-Status: GOOD (  12.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabio Estevam <festevam@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Tomasz Figa <tomasz.figa@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To improve human readability and enable automatic validation, the tuples
in "pinctrl-*" properties should be grouped using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt    |  2 +-
 .../devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt    |  2 +-
 .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt  |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt   |  4 ++--
 .../devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt   |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt     |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-single.txt     | 10 +++++-----
 .../devicetree/bindings/pinctrl/samsung-pinctrl.txt    |  2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
index e295dda4bbbab958..40e0a9a19525b40d 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
@@ -39,7 +39,7 @@ For example:
 		      <0x660009b0 0x40>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&nand_sel &uart3_rx &sdio0_d4>;
+		pinctrl-0 = <&nand_sel>, <&uart3_rx>, <&sdio0_d4>;
 
 		/* Select nand function */
 		nand_sel: nand_sel {
diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
index 603564e5fe6f0e54..dede11e4ef78087f 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
@@ -30,7 +30,7 @@ For example:
 		      <0x1803f408 0x04>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&pwm &gpio_b &nand_sel>;
+		pinctrl-0 = <&pwm>, <&gpio_b>, <&nand_sel>;
 
 		pwm: pwm {
 			function = "pwm";
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
index 8ac1d0851a0f8f0a..bfab5ca49fd1211a 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
@@ -60,7 +60,7 @@ iomuxc-lpsr controller and SDA pad from iomuxc controller as:
 
 i2c1: i2c@30a20000 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c1_1 &pinctrl_i2c1_2>;
+	pinctrl-0 = <&pinctrl_i2c1_1>, <&pinctrl_i2c1_2>;
 };
 
 iomuxc-lpsr@302c0000 {
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 4613bb17ace3f6e1..9dae60acf950641d 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -77,13 +77,13 @@ For example:
 	device {
 		pinctrl-names = "active", "idle";
 		pinctrl-0 = <&state_0_node_a>;
-		pinctrl-1 = <&state_1_node_a &state_1_node_b>;
+		pinctrl-1 = <&state_1_node_a>, <&state_1_node_b>;
 	};
 
 	/* For the same device if using state IDs */
 	device {
 		pinctrl-0 = <&state_0_node_a>;
-		pinctrl-1 = <&state_1_node_a &state_1_node_b>;
+		pinctrl-1 = <&state_1_node_a>, <&state_1_node_b>;
 	};
 
 	/*
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
index 8b94aa8f5971ceb7..6ec3c8d79f496b52 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
@@ -134,7 +134,7 @@ gpio21: gpio@21 {
 	#interrupt-cells = <0x2>;
 	microchip,irq-mirror;
 	pinctrl-names = "default";
-	pinctrl-0 = <&i2cgpio0irq &gpio21pullups>;
+	pinctrl-0 = <&i2cgpio0irq>, <&gpio21pullups>;
 
 	gpio21pullups: pinmux {
 		pins =	"gpio0", "gpio1", "gpio2", "gpio3",
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
index 931a18cd1e238e6c..360e59c9301a93a8 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
@@ -91,7 +91,7 @@ Examples:
 	pinctrl@1c20800 {
 		compatible = "mediatek,mt8135-pinctrl";
 		reg = <0 0x1000B000 0 0x1000>;
-		mediatek,pctl-regmap = <&syscfg_pctl_a &syscfg_pctl_b>;
+		mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
 		pins-are-numbered;
 		gpio-controller;
 		#gpio-cells = <2>;
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
index bb99991193148cb2..bfd222b0549569df 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
@@ -80,7 +80,7 @@ Optional properties:
   property.
 
 		/* pin base, nr pins & gpio function */
-		pinctrl-single,gpio-range = <&range 0 3 0 &range 3 9 1>;
+		pinctrl-single,gpio-range = <&range 0 3 0>, <&range 3 9 1>;
 
 - interrupt-controller : standard interrupt controller binding if using
   interrupts for wake-up events for example. In this case pinctrl-single
@@ -185,10 +185,10 @@ pmx_gpio: pinmux@d401e000 {
 	pinctrl-single,function-mask = <7>;
 
 	/* sparse GPIO range could be supported */
-	pinctrl-single,gpio-range = <&range 0 3 0 &range 3 9 1
-				&range 12 1 0 &range 13 29 1
-				&range 43 1 0 &range 44 49 1
-				&range 94 1 1 &range 96 2 1>;
+	pinctrl-single,gpio-range = <&range 0 3 0>, <&range 3 9 1>,
+				    <&range 12 1 0>, <&range 13 29 1>,
+				    <&range 43 1 0>, <&range 44 49 1>,
+				    <&range 94 1 1>, <&range 96 2 1>;
 
 	range: gpio-range {
 		#pinctrl-single,gpio-range-cells = <3>;
diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index 7734ab6fec449471..38a1416fd2cd8e1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -336,7 +336,7 @@ Example 3: A uart client node that supports 'default' and 'flow-control' states.
 		interrupts = <0 52 0>;
 		pinctrl-names = "default", "flow-control;
 		pinctrl-0 = <&uart0_data>;
-		pinctrl-1 = <&uart0_data &uart0_fctl>;
+		pinctrl-1 = <&uart0_data>, <&uart0_fctl>;
 	};
 
 Example 4: Set up the default pin state for uart controller.
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
