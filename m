Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B15D30016
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rMlh/epvyCb8VvmRwQZdC+Ykhopsdg2Bp8eF7wxofs=; b=fNkE1fSxtXBQwrCRMmsQtrHubt
	ulMkGoBOsqdxMenSars00t9X9KmUS1AtuBipJc3X9Z9J76+hT8n3BeiRYtYqg69iH0IgMJ9Z33I8I
	m9cuTywjHa3AtEs7u8bzzNckTmTqUX+fNWViiqhgIYjm02/GCcRldamwdfyzV8B8ca15PUUG2Sg6N
	tPFjSh2u6xfsKIgHArDfJFwQa8MeYpVwTRswiVB0UmAd+O/U2QO5Rq0dmz3jTpilYespvpV67kjdk
	JcH+cYP13JWN325xtXG+DU0EgKC2X/gm0eUY2p/jJLfc5CFDIKRoVdbbEfBpm3Aws63T7EWjDUMc0
	7RkbOsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1omS-00000001Anq-2dM1;
	Fri, 18 Oct 2024 15:20:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1okx-00000001ARQ-2EFB;
	Fri, 18 Oct 2024 15:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729264749;
	bh=HQTSQIkZHY/yw7VXJNQxASS7XXYveuwmozW5Ea+i4wo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DMHIKa+xQGALVx1MEA2UV324Y7IFUfsQw/P1lTXPp4bjxlfwp4u9OZ7xN0TRCuPyy
	 Q2g1L+VQRgaY8JgDRtxrLhA0GvbjbWGOgZV/yDFft1fkPPZN4qYDzVU/WHoo0l91L6
	 ysHDoMnTJIphyWPtw7ygVVqLSYEO0l78xa6pr6ND/9Q+ocpFuKR2o5H/xGF16TzBmX
	 ds6GhMN+Ba2rdqB1hcZmY+qN7Phdwc9tBN/fI+KTHbRDK/VlX2NIh6K1+0tpolM0Xa
	 vrq3xwU4L0ABEf2kLgRQZfPHwv6tChgD9D93UccHweBCXKWWjuzHbqCGU+k3vmc+NN
	 nzyF6TDMo9aww==
Received: from [192.168.1.218] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3705817E362C;
	Fri, 18 Oct 2024 17:19:07 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 18 Oct 2024 11:19:02 -0400
Subject: [PATCH v2 1/2] arm64: dts: mediatek: mt8188: Add ethernet node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241018-genio700-eth-v2-1-f3c73b85507b@collabora.com>
References: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
In-Reply-To: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Jianguo Zhang <jianguo.zhang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Hsuan-Yu Lin <shane.lin@canonical.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_081911_738271_5AF7023B 
X-CRM114-Status: UNSURE (   9.15  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Describe the ethernet present on the MT8188.

Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Hsuan-Yu Lin <shane.lin@canonical.com>
[Cleaned up to pass dtbs_check, follow DTS style guidelines, removed
hardcoded mac address and split between mt8188 and genio700 commits,
and addressed further feedback from the mailing list]
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 97 ++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index b493207a1b688dba51bf5e0e469349263f54ca94..d2795bba15ecd4e9359721b1c61cd4ae4a2a0a71 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1647,6 +1647,103 @@ spi5: spi@11019000 {
 			status = "disabled";
 		};
 
+		eth: ethernet@11021000 {
+			compatible = "mediatek,mt8188-gmac", "mediatek,mt8195-gmac",
+				     "snps,dwmac-5.10a";
+			reg = <0 0x11021000 0 0x4000>;
+			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "macirq";
+			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
+				 <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
+				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
+				 <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
+				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>,
+				 <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
+			clock-names = "axi", "apb", "mac_main", "ptp_ref",
+				      "rmii_internal", "mac_cg";
+			assigned-clocks = <&topckgen CLK_TOP_SNPS_ETH_250M>,
+					  <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
+					  <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
+			assigned-clock-parents = <&topckgen CLK_TOP_ETHPLL_D2>,
+						 <&topckgen CLK_TOP_ETHPLL_D8>,
+						 <&topckgen CLK_TOP_ETHPLL_D10>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_ETHER>;
+			mediatek,pericfg = <&infracfg_ao>;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup>;
+			snps,mtl-tx-config = <&mtl_tx_setup>;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			snps,clk-csr = <0>;
+			status = "disabled";
+
+			eth_mdio: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <0 0 0 0 16 8 4>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,wr_osr_lmt = <0x7>;
+			};
+
+			mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <4>;
+				snps,rx-sched-sp;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+			};
+
+			mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <4>;
+				snps,tx-sched-wrr;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,priority = <0x0>;
+					snps,weight = <0x10>;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+					snps,weight = <0x11>;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+					snps,weight = <0x12>;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+					snps,priority = <0x3>;
+					snps,weight = <0x13>;
+				};
+			};
+		};
+
 		xhci1: usb@11200000 {
 			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11200000 0 0x1000>,

-- 
2.47.0


