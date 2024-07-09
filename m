Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F74FC3DA41
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jul 2024 08:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MDMf7DvFYCdwJ6yYWc6ATDV2rtt8qlGbjIkB3P1prUA=; b=Ykh7Z7QZVpnG9i
	TliGGrUa5LCzdQFWgLIAySSnTUKW6ikRgGkYJMRxAeHIHvH65rPwrdHRwg+00WeuomXxNzKwvVvcC
	Z9YjljDT8Kl4yGLzKjqYRVAbSIpF6Cw8XxeNjD3wdpVKWTP2c7bHyzMQ1Sy5wxWGwgaCK6rTNOFXt
	mKu7LrylKaNFN/oKHgXUbyo5qEm9G6SNSTYJzptwZH/F+98DhvjUycQNXhWXub+eGYNK4fQvDz/fg
	KJWbvp4WsTj1yXz3X5dS1XAEwRBzHZVi7KS9o4p1UTowuM1Fs9Og2x62aXxaqQ17VruMlw/XeUYWu
	gcE0YtsMaWPIJSDyfUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR61m-00000006MJ5-0h0N;
	Tue, 09 Jul 2024 08:16:46 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR61V-00000006MGq-3Btp;
	Tue, 09 Jul 2024 08:16:31 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 0C6E55FD4B;
	Tue,  9 Jul 2024 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720512985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MDMf7DvFYCdwJ6yYWc6ATDV2rtt8qlGbjIkB3P1prUA=;
	b=aU7JabxTsf1aK/77OmIldWo1GPgTLA5vNZ2v32VbWnnegBjJxybkGe9FceGO9HlAj28g4w
	Eb7b0Y8qwAYrzEfsX7GRXJyIQ+7C6CBG62hDSFd2fWvGkcl6v+8eJM2OHAoi8dOT3cgKov
	mTn9L82xGi7m+N7npAFIKYaHOnhQNl8=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 082581006CA;
	Tue,  9 Jul 2024 08:16:23 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH v1] arm64: dts: mediatek: mt7988: add labels for different nodes
Date: Tue,  9 Jul 2024 10:16:13 +0200
Message-ID: <20240709081614.19993-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 86a6b8d6-7d26-42ab-aaf3-d045996a5733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_011630_152277_24D6D916 
X-CRM114-Status: UNSURE (   9.22  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Current devicetree-nodes missing a label which allows to add aproperties
or phandles to them, so add them.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Fixes: 660c230bf302 ("arm64: dts: mediatek: mt7988: add I2C controllers")
Fixes: 09ff2216a035 ("arm64: dts: mediatek: mt7988: add PWM controller")
Fixes: 09346afaba0a ("arm64: dts: mediatek: mt7988: add XHCI controllers")
Fixes: b616b403cbff ("arm64: dts: mediatek: mt7988: add clock controllers")
Fixes: 6c1d134a103f ("arm64: dts: mediatek: Add initial MT7988A and BPI-R4")
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 32 +++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index aa728331e876..9ced005b1595 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -14,28 +14,28 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0>;
 			device_type = "cpu";
 			enable-method = "psci";
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "arm,cortex-a73";
 			reg = <0x1>;
 			device_type = "cpu";
 			enable-method = "psci";
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			compatible = "arm,cortex-a73";
 			reg = <0x2>;
 			device_type = "cpu";
 			enable-method = "psci";
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			compatible = "arm,cortex-a73";
 			reg = <0x3>;
 			device_type = "cpu";
@@ -43,7 +43,7 @@ cpu@3 {
 		};
 	};
 
-	oscillator-40m {
+	system_clk: oscillator-40m {
 		compatible = "fixed-clock";
 		clock-frequency = <40000000>;
 		#clock-cells = <0>;
@@ -86,7 +86,7 @@ infracfg: clock-controller@10001000 {
 			#clock-cells = <1>;
 		};
 
-		clock-controller@1001b000 {
+		topckgen: clock-controller@1001b000 {
 			compatible = "mediatek,mt7988-topckgen", "syscon";
 			reg = <0 0x1001b000 0 0x1000>;
 			#clock-cells = <1>;
@@ -99,13 +99,13 @@ watchdog: watchdog@1001c000 {
 			#reset-cells = <1>;
 		};
 
-		clock-controller@1001e000 {
+		apmixedsys: clock-controller@1001e000 {
 			compatible = "mediatek,mt7988-apmixedsys";
 			reg = <0 0x1001e000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
-		pwm@10048000 {
+		pwm: pwm@10048000 {
 			compatible = "mediatek,mt7988-pwm";
 			reg = <0 0x10048000 0 0x1000>;
 			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
@@ -124,7 +124,7 @@ pwm@10048000 {
 			status = "disabled";
 		};
 
-		i2c@11003000 {
+		i2c0: i2c@11003000 {
 			compatible = "mediatek,mt7981-i2c";
 			reg = <0 0x11003000 0 0x1000>,
 			      <0 0x10217080 0 0x80>;
@@ -137,7 +137,7 @@ i2c@11003000 {
 			status = "disabled";
 		};
 
-		i2c@11004000 {
+		i2c1: i2c@11004000 {
 			compatible = "mediatek,mt7981-i2c";
 			reg = <0 0x11004000 0 0x1000>,
 			      <0 0x10217100 0 0x80>;
@@ -150,7 +150,7 @@ i2c@11004000 {
 			status = "disabled";
 		};
 
-		i2c@11005000 {
+		i2c2: i2c@11005000 {
 			compatible = "mediatek,mt7981-i2c";
 			reg = <0 0x11005000 0 0x1000>,
 			      <0 0x10217180 0 0x80>;
@@ -163,7 +163,7 @@ i2c@11005000 {
 			status = "disabled";
 		};
 
-		usb@11190000 {
+		ssusb0: usb@11190000 {
 			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11190000 0 0x2e00>,
 			      <0 0x11193e00 0 0x0100>;
@@ -177,7 +177,7 @@ usb@11190000 {
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 		};
 
-		usb@11200000 {
+		ssusb1: usb@11200000 {
 			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11200000 0 0x2e00>,
 			      <0 0x11203e00 0 0x0100>;
@@ -191,21 +191,21 @@ usb@11200000 {
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 		};
 
-		clock-controller@11f40000 {
+		xfi_pll: clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
 			resets = <&watchdog 16>;
 			#clock-cells = <1>;
 		};
 
-		clock-controller@15000000 {
+		ethsys: clock-controller@15000000 {
 			compatible = "mediatek,mt7988-ethsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
 
-		clock-controller@15031000 {
+		ethwarp: clock-controller@15031000 {
 			compatible = "mediatek,mt7988-ethwarp";
 			reg = <0 0x15031000 0 0x1000>;
 			#clock-cells = <1>;
-- 
2.43.0


