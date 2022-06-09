Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A69EC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3KxD9DF210MX4Yr/vvM46jrmb0uSouzAKaygRgrsqE=; b=uCx3TRC2y3MQJy
	Mn1nIHlp2fsAG1WM4ocIs/QBahg6W7cZEofKXMWvrIxON9lZDl+5Kgm93WxDR0mh/2usMcnlP4gEC
	eqjcsuP+M7JkF8aTa7CT5HI5TH+O7AFpm6ldGLO8JeWwgwkwZHQ6jpAdgE2MrAra5KtAve8lygHl8
	uuzXgZmB/F+jEFDerhg5BdMdB+8+dDiJk7QnOKv+Pl9iJ9juX0mbujpYj09poEA1SaDcqL1iih4je
	SwgPFcTZs5xPRHN4laBmQmgkJQ7hPZzshcmXYGIiy7Z8PTOfREcTA4bYSQr2gyF5ye7DOX4QxlUWq
	73/aY0eKCQG0/PyARWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGG3-001GTA-Tz; Thu, 09 Jun 2022 11:23:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGFq-001GLS-U8; Thu, 09 Jun 2022 11:23:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B9E8D66017C9;
	Thu,  9 Jun 2022 12:23:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654773789;
	bh=BzU2sp5uWjhJVZc+Pbqb4F7Rd9WBetm2NBJji/SvJBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bz5vhmF1Y531BltL8wLWNs23X4odbGrcHRtG8SI8DJFGEkmoec7IyE1m6R3bOYM5a
	 sR54DiZ9U+6IvkH3mTKJfO2ql0PJdAV0IV9MPv/wRZ+qB3tSCtiMa7GKip1cK9OXx8
	 9OLmpH/wh3xtvfGksl62D9Vjv0qzK9EM2LhgBcSeIaLZro1l7PhQxJ9VRK+BAmwPTf
	 SFQO+wwYrVHUUyIQ4ITKiTzSqxcEyBttlHfyw4Bif6zaq7NHPqKMVrmdFo5GQmIq0N
	 dlG0B7K6YRHk2Uo38lCxAolvwOBpXsjTCsCGVDXWMGy7QqOz1gTRwUScXGlIWBnSCp
	 acOquf7Xzl9Sw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 01/10] arm64: dts: mediatek: mt6795: Create soc bus node and move mmio devices
Date: Thu,  9 Jun 2022 13:22:54 +0200
Message-Id: <20220609112303.117928-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
References: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_042311_264254_DF43369E 
X-CRM114-Status: UNSURE (   9.27  )
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

MMIO devices should be inside of a soc bus node, as it's done for the
vast majority of ARM64 devicetrees, and for almost all MTK devicetrees.
Create a simple-bus soc node and move all devices with a MMIO address
space in there.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 105 ++++++++++++-----------
 1 file changed, 56 insertions(+), 49 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index c85659d0ff5d..167f90bd991a 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -117,59 +117,66 @@ timer {
 			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	sysirq: intpol-controller@10200620 {
-		compatible = "mediatek,mt6795-sysirq",
-			     "mediatek,mt6577-sysirq";
-		interrupt-controller;
-		#interrupt-cells = <3>;
-		interrupt-parent = <&gic>;
-		reg = <0 0x10200620 0 0x20>;
-	};
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		sysirq: intpol-controller@10200620 {
+			compatible = "mediatek,mt6795-sysirq",
+				     "mediatek,mt6577-sysirq";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			reg = <0 0x10200620 0 0x20>;
+		};
 
-	gic: interrupt-controller@10221000 {
-		compatible = "arm,gic-400";
-		#interrupt-cells = <3>;
-		interrupt-parent = <&gic>;
-		interrupt-controller;
-		reg = <0 0x10221000 0 0x1000>,
-		      <0 0x10222000 0 0x2000>,
-		      <0 0x10224000 0 0x2000>,
-		      <0 0x10226000 0 0x2000>;
-	};
+		gic: interrupt-controller@10221000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			reg = <0 0x10221000 0 0x1000>,
+			      <0 0x10222000 0 0x2000>,
+			      <0 0x10224000 0 0x2000>,
+			      <0 0x10226000 0 0x2000>;
+		};
 
-	uart0: serial@11002000 {
-		compatible = "mediatek,mt6795-uart",
-			     "mediatek,mt6577-uart";
-		reg = <0 0x11002000 0 0x400>;
-		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
-		status = "disabled";
-	};
+		uart0: serial@11002000 {
+			compatible = "mediatek,mt6795-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x400>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
 
-	uart1: serial@11003000 {
-		compatible = "mediatek,mt6795-uart",
-			     "mediatek,mt6577-uart";
-		reg = <0 0x11003000 0 0x400>;
-		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
-		status = "disabled";
-	};
+		uart1: serial@11003000 {
+			compatible = "mediatek,mt6795-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11003000 0 0x400>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
 
-	uart2: serial@11004000 {
-		compatible = "mediatek,mt6795-uart",
-			     "mediatek,mt6577-uart";
-		reg = <0 0x11004000 0 0x400>;
-		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
-		status = "disabled";
-	};
+		uart2: serial@11004000 {
+			compatible = "mediatek,mt6795-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11004000 0 0x400>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
 
-	uart3: serial@11005000 {
-		compatible = "mediatek,mt6795-uart",
-			     "mediatek,mt6577-uart";
-		reg = <0 0x11005000 0 0x400>;
-		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
-		status = "disabled";
+		uart3: serial@11005000 {
+			compatible = "mediatek,mt6795-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11005000 0 0x400>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
