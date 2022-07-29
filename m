Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB19C19F2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ryf8GmOzcJPsba7BtI8QhGBmpDQz1Iv2QhGZ99yqb4U=; b=1lOL8eAu+SCqPn4Ha18GGgmjU6
	hC9io/M0DHjL4bm3csDcCOUeFOdRww2WwOcIW8GZFwZ3ANWCGJmeWq6nin/rcSHrgIb+5Mzl0SObo
	pkf0npmm7p32CSAvDEQoY35Y7s6Z1yaToqOziKqYvwpX0eQhe64FBt4ZcC0SKPIuhdNxw56JLSuon
	+7/ojJ1l09Vf3qXbsltzbPxK8sbNmZ+oGmxrEZdWZqoTGGicU/+Cew/d36k3vVdO7+szYpSr/VOjT
	Dw4Ig2+9GSYcsUETpGpJCCxN/5N+360Waqys7I3AoncUv6UwVPjxgkZi0YWXfBbIdzyUa3/XOOy0u
	5vzcdTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNWF-004B95-Lm; Fri, 29 Jul 2022 10:46:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNUJ-0049xG-Hb; Fri, 29 Jul 2022 10:45:01 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F038D6601B68;
	Fri, 29 Jul 2022 11:44:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659091498;
	bh=QeRJz0RuJnUHLQciSaPN8Icqa2P19dEJD9UBWVAvvwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J28iktrnjebj17ZFhJh7/p44DmgfY9pGQY8X8C8WU8Eiejc0k0T7c8BedGhoxvRRu
	 8YwSCakgQI+YA1LsmHgzoPV3dX1RbyNJLIFiZOuViSXU2zkmsN9l+2CCLfAW2LNnQB
	 PHPWXC13HqPdCER2bIzNZyoW9rRFt3MbbSvDY6n0/YKVZllb7Lq496FY7Nz3qnc9qQ
	 TwC1N1ezKmYYHllHxx45eD0w8oqAMEx6qX6aokQZdDTMaHuwhemoG4CLpfrToXnP1p
	 p8Z/9p8TrcJ8n/n8AdQSy9HzDSOAf2mdDMU/eskVyP4drSlnCHX4kuCvZVC+a01Rmd
	 M5VM6U/dsZHEA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	fparent@baylibre.com,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	long.cheng@mediatek.com,
	wenbin.mei@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 5/8] arm64: dts: mediatek: mt6795: Add support for APDMA and wire up UART DMAs
Date: Fri, 29 Jul 2022 12:44:37 +0200
Message-Id: <20220729104441.39177-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_034459_787006_66A0B5A8 
X-CRM114-Status: GOOD (  10.16  )
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

This SoC has a DMA controller with tx/rx channels for all of the
UART controller IPs: add the apdma node and wire up the DMAs on
all controllers.
When one of the UART controllers is used as a serial console,
the DMA will be automatically ignored.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 559fec1ee123..687e0ee63503 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -314,6 +314,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -324,9 +326,37 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
+		apdma: dma-controller@11000380 {
+			compatible = "mediatek,mt6795-uart-dma",
+				     "mediatek,mt6577-uart-dma";
+			reg = <0 0x11000380 0 0x60>,
+			      <0 0x11000400 0 0x60>,
+			      <0 0x11000480 0 0x60>,
+			      <0 0x11000500 0 0x60>,
+			      <0 0x11000580 0 0x60>,
+			      <0 0x11000600 0 0x60>,
+			      <0 0x11000680 0 0x60>,
+			      <0 0x11000700 0 0x60>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>;
+			dma-requests = <8>;
+			clocks = <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "apdma";
+			mediatek,dma-33bits;
+			#dma-cells = <1>;
+		};
+
 		uart2: serial@11004000 {
 			compatible = "mediatek,mt6795-uart",
 				     "mediatek,mt6577-uart";
@@ -334,6 +364,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -344,6 +376,8 @@ uart3: serial@11005000 {
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 6>, <&apdma 7>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 	};
-- 
2.35.1


