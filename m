Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00181C3ABC9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gntzzHgR7hVfcxIHz+wXqJ/img6vkZtc4/PYkuXugA=; b=z3uAWkMeWbdcJu
	9XU+Wsi0ni10SwsdyN3hgJGORAEO0RcNKsQ/DtGe1WcfGQvbfnpNnIAIlo44ONYf4PatqxSxh8Vn7
	kVMQ15qcTH+V3OHbsk8XaPCPVqmEID8LbcVZrDzq+Tdfz1clUglMV24DynJYJ5wi7Z72VKeX4Kr4B
	yFux/S08plmEx4/d7jhrad4SlL35ebSCTS0BESx0Ld1hpCOA93ZmPo+pr6KpBnl3zCir2uO7nC5t9
	bCrXiiW5N1jGI09G+rlDOVDVsu1YC/qBz3h64IaSF1tPocy7ZFvYySI+u1zHtnSnUoHClUMrVbV6s
	8Q6osWHZyKi4J1A/aJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzVm-00000004H7g-46BA;
	Fri, 16 May 2025 18:10:22 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzNh-00000004FKM-1nOd;
	Fri, 16 May 2025 18:02:03 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id BE9F0604DC;
	Fri, 16 May 2025 18:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747418516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gntzzHgR7hVfcxIHz+wXqJ/img6vkZtc4/PYkuXugA=;
	b=Lkt49FfPhgvCYAEys78J9qRvMVLYQjXftRz0aqJwwWeo8TNAF1z3aQBCxVA6c2+SEKjlsV
	Io0jANRbvFGSujBGqBfrJGlpJVIIJw2afi9NHfN2u6q7O3o/ue2dql2Y/UPVRiSgbPB+Uu
	yqEuvpe9lt78btCL14A6dLAbVd5BuqA=
Received: from frank-u24.. (fttx-pool-157.180.226.139.bambit.de [157.180.226.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 748D41226F2;
	Fri, 16 May 2025 18:01:56 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 04/14] arm64: dts: mediatek: mt7988: add spi controllers
Date: Fri, 16 May 2025 20:01:35 +0200
Message-ID: <20250516180147.10416-6-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516180147.10416-1-linux@fw-web.de>
References: <20250516180147.10416-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110201_617906_CA3D5123 
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add SPI controllers for mt7988.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 8f6d1dfae24a..8c31935f4ab0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -311,6 +311,51 @@ i2c2: i2c@11005000 {
 			status = "disabled";
 		};
 
+		spi0: spi@11007000 {
+			compatible = "mediatek,mt7988-spi-quad", "mediatek,spi-ipm";
+			reg = <0 0x11007000 0 0x100>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_MPLL_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_104M_SPI0>,
+				 <&infracfg CLK_INFRA_66M_SPI0_HCK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk",
+				      "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi1: spi@11008000 {
+			compatible = "mediatek,mt7988-spi-single", "mediatek,spi-ipm";
+			reg = <0 0x11008000 0 0x100>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_MPLL_D2>,
+				 <&topckgen CLK_TOP_SPIM_MST_SEL>,
+				 <&infracfg CLK_INFRA_104M_SPI1>,
+				 <&infracfg CLK_INFRA_66M_SPI1_HCK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk",
+				      "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi2: spi@11009000 {
+			compatible = "mediatek,mt7988-spi-quad", "mediatek,spi-ipm";
+			reg = <0 0x11009000 0 0x100>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_MPLL_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_104M_SPI2_BCK>,
+				 <&infracfg CLK_INFRA_66M_SPI2_HCK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk",
+				      "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		lvts: lvts@1100a000 {
 			compatible = "mediatek,mt7988-lvts-ap";
 			#thermal-sensor-cells = <1>;
-- 
2.43.0


