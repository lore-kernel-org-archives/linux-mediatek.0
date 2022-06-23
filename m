Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAA8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Jk9CcDrW8oi+z1hjS66L4zj4lxCXiuIimOokwESwo8=; b=LgldmclizKNDnlPogSeglwbZlN
	5NX+ghWPvfftaQL8m1OmUtHyn5c7L820+S9aYAHdnP/FVEQ9dua582oro1wFf5bLBodWIn9h6UOTf
	59Mu09fOQ8+rGbX94Bfla3Ohc/C3DReVvhX2ETMNZVRcp91r2d8drr6uWj1/32lDcC6BP7ZWUXGQa
	hpk2VvlEEmkX4F+9AO8d1Wl08guoT3XpLfwL0mkNW/ZAERIB0g+nX/hIaSS01B3YcA935AU0NDeaL
	yTzCmm/9oi6CuOwqmh0ArPqTbFh2xNUR70KVB4p+2ip0AVse+kV4REzh8vuuMQa3tpQHCnbkzR+Kj
	a7r4gUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Sjq-00GZnK-Kj; Thu, 23 Jun 2022 19:43:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Sdf-00GWtN-Q6; Thu, 23 Jun 2022 19:37:18 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A9A266017EE;
	Thu, 23 Jun 2022 20:37:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656013034;
	bh=1D15zN5ANHSId/agHI+Tuv7EsBE//FROepf2wo5oErg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EntiTqqjhdS4/y3PrupowVflm5IdwyhE0eXTxh0q3hdMULjnbCdZrI17DqdCIoXim
	 X/nV/sxRoq0ke1KkRYbUqkwy5PKGeUya8qDDtPvIl7ijSB3SSQ9D3/aO6gqg79ThmR
	 dqrskSLZKTMwH4CKYDojDQFy3crrbIJDoN/9s6A0mU9weON0U7pVlka5vnonAxRk/D
	 bw3Qu/+nFHZqQ983dwTUJ39M/uQfKKOKXS/YMaeGyZZ1fTEQNn8B/YPQ+43w74Kz1g
	 l7bo062CZZ9hNzYirzETRvvMocLFKaFTeqmSBNRzGa8QVpNHFy9J3NEJnkwsr2slvN
	 G5aYUky8TJDTw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/4] arm: dts: mediatek: Set fixed-clock for missing XHCI clocks
Date: Thu, 23 Jun 2022 15:37:02 -0400
Message-Id: <20220623193702.817996-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623193702.817996-1-nfraprado@collabora.com>
References: <20220623193702.817996-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_123716_175262_16823FBF 
X-CRM114-Status: GOOD (  11.04  )
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

The XHCI controller hardware always has all clocks wired, however
depending on the SoC, some of them might be fixed (ie not controllable).
These fixed clocks were previously omitted from the devicetree entirely.

In order to better describe the hardware on the devicetree, and to have
a fixed order of clocks for all SoCs, add the missing non-controllable
clocks as phandles to a fixed-clock node.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added this commit

 arch/arm/boot/dts/mt2701.dtsi | 14 ++++++++++----
 arch/arm/boot/dts/mt7623.dtsi | 14 ++++++++++----
 arch/arm/boot/dts/mt7629.dtsi |  6 ++++--
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index b8eba3ba153c..1c1b9b5a1d7a 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -611,8 +611,11 @@ usb0: usb@1a1c0000 {
 		reg-names = "mac", "ippc";
 		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&hifsys CLK_HIFSYS_USB0PHY>,
-			 <&topckgen CLK_TOP_ETHIF_SEL>;
-		clock-names = "sys_ck", "ref_ck";
+			 <&topckgen CLK_TOP_ETHIF_SEL>,
+			 <&clk26m>,
+			 <&clk26m>,
+			 <&clk26m>;
+		clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
 		phys = <&u2port0 PHY_TYPE_USB2>, <&u3port0 PHY_TYPE_USB3>;
 		status = "disabled";
@@ -651,8 +654,11 @@ usb1: usb@1a240000 {
 		reg-names = "mac", "ippc";
 		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&hifsys CLK_HIFSYS_USB1PHY>,
-			 <&topckgen CLK_TOP_ETHIF_SEL>;
-		clock-names = "sys_ck", "ref_ck";
+			 <&topckgen CLK_TOP_ETHIF_SEL>,
+			 <&clk26m>,
+			 <&clk26m>,
+			 <&clk26m>;
+		clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
 		phys = <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_TYPE_USB3>;
 		status = "disabled";
diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 25d31e40a553..b640e6f4ad2e 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -864,8 +864,11 @@ usb1: usb@1a1c0000 {
 		reg-names = "mac", "ippc";
 		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&hifsys CLK_HIFSYS_USB0PHY>,
-			 <&topckgen CLK_TOP_ETHIF_SEL>;
-		clock-names = "sys_ck", "ref_ck";
+			 <&topckgen CLK_TOP_ETHIF_SEL>,
+			 <&clk26m>,
+			 <&clk26m>,
+			 <&clk26m>;
+		clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
 		phys = <&u2port0 PHY_TYPE_USB2>, <&u3port0 PHY_TYPE_USB3>;
 		status = "disabled";
@@ -905,8 +908,11 @@ usb2: usb@1a240000 {
 		reg-names = "mac", "ippc";
 		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&hifsys CLK_HIFSYS_USB1PHY>,
-			 <&topckgen CLK_TOP_ETHIF_SEL>;
-		clock-names = "sys_ck", "ref_ck";
+			 <&topckgen CLK_TOP_ETHIF_SEL>,
+			 <&clk26m>,
+			 <&clk26m>,
+			 <&clk26m>;
+		clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
 		phys = <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_TYPE_USB3>;
 		status = "disabled";
diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
index 46fc236e1b89..810d1c867b43 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -315,8 +315,10 @@ ssusb: usb@1a0c0000 {
 			clocks = <&ssusbsys CLK_SSUSB_SYS_EN>,
 				 <&ssusbsys CLK_SSUSB_REF_EN>,
 				 <&ssusbsys CLK_SSUSB_MCU_EN>,
-				 <&ssusbsys CLK_SSUSB_DMA_EN>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
+				 <&ssusbsys CLK_SSUSB_DMA_EN>,
+				 <&clk20m>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
+				      "xhci_ck";
 			assigned-clocks = <&topckgen CLK_TOP_AXI_SEL>,
 					  <&topckgen CLK_TOP_SATA_SEL>,
 					  <&topckgen CLK_TOP_HIF_SEL>;
-- 
2.36.1


