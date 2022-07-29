Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4807C19F2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 10:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=con9k1mkt20dmaXCaXy0mqFxZiutUbWVj0WS6HhIgC4=; b=leFj06Ph/cHfYhOhmWyzbpbwT3
	DDtcWaleHy/VIokkfiKdeq9t8wYRgeC/i8Bf23AcxsoTaqnM6GCBwki+qskh38V2qPZ8p08gwsafU
	Je9rKrQCDPpQwvkRvo+2V+yEFs9H93Um/Zigb01eUfhUZOdUJk0RLLUx25uiUHtabSBfJScrxShT7
	ZgJ4tJ3ucJbvX6ahAi6XqZVDe+Q05zbfXO6T5vbJWy9N8V997u9hGhLHhuOPObevybUCHa84o+Uf3
	ZpSqVKlSGFFWNhxE6sEpPWUmtK2rfV1YUDFIZbKDxLto0Ar3J/nxwBHmjw/WsD5tmH0TiVEHl8qxa
	Iq6P3dVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNVT-004Ad1-9z; Fri, 29 Jul 2022 10:46:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNUH-0049wi-Vf; Fri, 29 Jul 2022 10:44:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B1F976601B67;
	Fri, 29 Jul 2022 11:44:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659091496;
	bh=yVmhhT/qx+tW3CwtsNMyM1l565LqcHdXD5WPr7UhHvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IAY6rFWWe4TWdsu6dYjxm9mvBCzXlLn949L17cmUizMmPbLMDKq7fOdlugwx2wB/y
	 FNWW4BNaZ1TsF32t3jztQX0+00XsR/OIJidBhdy4UCfnesSEcAmEjzWKerWBpvXZBX
	 EfeRj9TNfW4pmDeBZ1MIv//2YQqu/dvlz1kcwg8qUy6aNbxpnvj0W1bJPOiAdCK8jT
	 KBRqaEd3MjStG4xu5EPf252jg6ChlHcdcr3E7vL9Y0ZgfV5TtPWpOmkvnwopFULyGr
	 dXdRWC1aWRQp+8zEvYnsHvHqdGkferWs4G6EzI8dWc74eRnWmSN8W0VgjW9x7ClXmG
	 4ztQmf85X8law==
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
Subject: [PATCH 4/8] arm64: dts: mediatek: mt6795: Replace UART dummy clocks with pericfg
Date: Fri, 29 Jul 2022 12:44:36 +0200
Message-Id: <20220729104441.39177-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_034458_171294_54790209 
X-CRM114-Status: GOOD (  10.27  )
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

The UART nodes had a dummy clock for early bringup, as it is
expected that these are left on by the bootloader: now that
the pericfg clock controller is supported, we can replace
them with the real clocks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 9166d481a366..559fec1ee123 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -312,7 +312,8 @@ uart0: serial@11002000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x400>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&clk26m>;
+			clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 
@@ -321,7 +322,8 @@ uart1: serial@11003000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11003000 0 0x400>;
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&clk26m>;
+			clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 
@@ -330,7 +332,8 @@ uart2: serial@11004000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11004000 0 0x400>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&clk26m>;
+			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 
@@ -339,7 +342,8 @@ uart3: serial@11005000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11005000 0 0x400>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&clk26m>;
+			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 	};
-- 
2.35.1


