Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB57CD78312
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 12:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZod1ka4k4PMMYK+yDubLbP92ZqquD7GvgNYdPg+tk0=; b=tNZPBOq6uKmeaT
	eyLZUBwKX/7pmrZ8HCjp50L0QwADEZ/s0xu1uiLoe7FtoEubhEdlEvDNz8h0DYU7drWab63kAjC6r
	x7wq13cJFsanVpaZ/tzMlWkVmikeYsGhyXEMhPBIYoxDSDPZG0xEJQ0sofw5tlmlcUWX0UOVbYUnM
	a40pmmL5ZKajnRKehhPAOyS8i3DSYThhs40UWBwcTe4NAbVW3KKoWm3bm35FDlknA2LKME/y255DG
	EK0Fxhd0PVvNS5nv0lUeRRlwT2DyrXMfkLyLzep8mM3LKUwz/3+IE+7y84jnAwhbeTiJDyzhHmqt2
	DQR64Qlo4xLVM8q3arBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Y9-000000064q9-3nW5;
	Mon, 02 Dec 2024 12:29:13 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VF-0000000646N-1KY2;
	Mon, 02 Dec 2024 12:26:14 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id B0CCE4119B;
	Mon,  2 Dec 2024 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZod1ka4k4PMMYK+yDubLbP92ZqquD7GvgNYdPg+tk0=;
	b=Sko1E2wBc7Hnyx8S5jmJPLkOGvZPTJpZTniQ96szAY/taXrSnss3LCOwvxdLJn/BDF/6Uj
	KB8ptKHuJz4ltDDHof0yLUFd79wQaR97z9E9QXB653KSRy6aDRw8kY5tFQVG8UAcFslm/P
	vlQRUtJTGUc666z2G7pIhDUA2zYUpqw=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 211CE3600C0;
	Mon,  2 Dec 2024 12:26:11 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 02/18] arm64: dts: mediatek: mt7988: add mmc support
Date: Mon,  2 Dec 2024 13:25:43 +0100
Message-ID: <20241202122602.30734-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: fe7dd4f1-c909-412b-8423-4600a8939fcd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042613_497032_183C900B 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add devicetree node for MMC controller.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
changes:
v2:
squash "add missing label for apmixedsys"
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 24 ++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 46969577c87a..5e40446cb7b3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -100,7 +100,7 @@ watchdog: watchdog@1001c000 {
 			#reset-cells = <1>;
 		};
 
-		clock-controller@1001e000 {
+		apmixedsys: clock-controller@1001e000 {
 			compatible = "mediatek,mt7988-apmixedsys";
 			reg = <0 0x1001e000 0 0x1000>;
 			#clock-cells = <1>;
@@ -278,6 +278,28 @@ usb@11200000 {
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 		};
 
+		mmc0: mmc@11230000 {
+			compatible = "mediatek,mt7988-mmc";
+			reg = <0 0x11230000 0 0x1000>,
+			      <0 0x11D60000 0 0x1000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_MSDC400>,
+				 <&infracfg CLK_INFRA_MSDC2_HCK>,
+				 <&infracfg CLK_INFRA_66M_MSDC_0_HCK>,
+				 <&infracfg CLK_INFRA_133M_MSDC_0_HCK>;
+			assigned-clocks = <&topckgen CLK_TOP_EMMC_250M_SEL>,
+					  <&topckgen CLK_TOP_EMMC_400M_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_NET1PLL_D5_D2>,
+						 <&apmixedsys CLK_APMIXED_MSDCPLL>;
+			clock-names = "source",
+				      "hclk",
+				      "axi_cg",
+				      "ahb_cg";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
-- 
2.43.0


