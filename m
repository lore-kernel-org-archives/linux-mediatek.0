Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6EBC38A2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDkPj+xkbQack8XXMNwpFvA9vOfdavpmUuZNeEEHgk4=; b=X9Z0sf2J0fnhxqUDrk6+MkWIJU
	qFD7JLnLUczMcWoGzlFvycFDUJXEEWQWLs9g4Cx7/f2+vOzH9gsD9+gJQlQ/t7CUuid2lbDb88GoF
	bPzPxl9lXtriZ1JHPeZgXWdavtYBMYJc45Kmvy0LYtszKt0yRHVJYQznmYvr30OjKobVDkE5WNfke
	eXSNy7hzsxHdcLrEUOSnbjgGKHzMXX0O4WFRUYjRF7qcNB9eez1VM6BE5aDcc/S9kcd+ax0SpliT5
	ZG271bbZTxb5QyWQXH3iLeMi7urGC7+f6AW/JTzta1L390thAlP8JIFk4Tedqdk0soBViqrWEmwkI
	oeBf36eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzcp-00Cgh0-KP; Thu, 27 Oct 2022 09:56:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzbb-00CgAz-At; Thu, 27 Oct 2022 09:55:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A63F466028D0;
	Thu, 27 Oct 2022 10:55:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666864516;
	bh=fGsfOe2bAmOVkry45CNvtIEGojv6PfIqmE22PGHK688=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rc3JAj1zQyYp1VwfxOFOGFOZ+GDbLEUYNn4qeoyaqE/GMuExuAQmEQy2Q2nI2HLh+
	 SfE2HnuFP9P/ovZLCgIf4ZIATGyPoyN3CQi1kqt4R7TTFjhoUsIZM2R3ct+c4FQ+9j
	 UQmhjB4KneDIQM2RTPNU1MIKkw1mixop8pW2PKjOONRM9e0B8gyW9dzSSoTilZuZp4
	 1Ln648Vvg1ztouXOEzbtwCaE9AP49XJv6lzIgpE7i5KNZukzVaG3UvMFlkXulK1xTn
	 pxUyVnQLfl6s9rqPBI1sii3JWuHFIR3UaQPj8yJ7lZHps1ovuSWTxl8VZjRCJ2+7vx
	 Ex1xdxu9hK3/A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sam.shih@mediatek.com,
	andrew@lunn.ch,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/6] arm64: dts: mediatek: mt6795: Add support for APDMA and wire up UART DMAs
Date: Thu, 27 Oct 2022 11:55:01 +0200
Message-Id: <20221027095504.37432-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
References: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_025519_850764_26DAAB74 
X-CRM114-Status: GOOD (  10.24  )
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
index 60a07410ff63..39677eec388b 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -316,6 +316,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -326,9 +328,37 @@ uart1: serial@11003000 {
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
@@ -336,6 +366,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -346,6 +378,8 @@ uart3: serial@11005000 {
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 6>, <&apdma 7>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 	};
-- 
2.37.2


