Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AC4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwCDt65CdQSIwI/2q0XPa4Ezi2nDYm5nKE59G+0tvYo=; b=cMhZaaz/8Ir/RV
	hEMAqTL6C7OSVPN9qOutcYwK6WRENLVvk5J3/qOXm0hBeokVqTS01HWyB5ju8wgaaGEUrFRMzAXvt
	5HqBW2bNaALS6XnS0Qr7NlH5u3F36qKtjoW2P5Ki8pzxuR9dT+nuHy1o83b+ZynP2YhWmDvDCf0Rn
	kd68zYHvFHThLfKOIoEZih3No52sq6O94sndyji9G5UaHFuFsO2NeUI/PlTC5YgXhQ3TX8MNtM49X
	d8Uxq7sjXcPNLAhxJjxDh6oY73+R/tUGfTK94gxQGhA5DxwgyRwbIP7HXZ9tGmhMo1yyE9NoUCou9
	VYiEksseJJ+facN+vj8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfjC-004KHh-PY; Mon, 14 Mar 2022 08:06:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfa4-004GBK-8w; Mon, 14 Mar 2022 07:57:33 +0000
X-UUID: 1d5e2ff657054d2c9b0a98b2a752a003-20220314
X-UUID: 1d5e2ff657054d2c9b0a98b2a752a003-20220314
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1391694252; Mon, 14 Mar 2022 00:57:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 00:57:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Mar 2022 15:57:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Mar 2022 15:57:20 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <dkirjanov@suse.de>
Subject: [PATCH net-next v13 4/7] arm64: dts: mt2712: update ethernet device
 node
Date: Mon, 14 Mar 2022 15:57:10 +0800
Message-ID: <20220314075713.29140-5-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314075713.29140-1-biao.huang@mediatek.com>
References: <20220314075713.29140-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_005728_392149_D236C4BC 
X-CRM114-Status: GOOD (  10.87  )
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

Since there are some changes in ethernet driver:
update ethernet device node in dts to accommodate to it.

1. stmmac_probe_config_dt() in stmmac_platform.c will initialize specified
   parameters according to compatible string "snps,dwmac-4.20a", then,
   dwmac-mediatek.c can skip the initialization if add compatible string
   "snps,dwmac-4.20a" in eth device node.
2. commit 882007ed7832 ("net-next: dt-binding: dwmac-mediatek: add more
   description for RMII") added rmii internal support, we should add
   corresponding clocks/clocks-names in eth device node.
3. add "snps,reset-delays-us = <0 10000 10000>;" to ensure reset delay
   can meet PHY requirement.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts |  1 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 14 +++++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
index 7d369fdd3117..11aa135aa0f3 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
@@ -110,6 +110,7 @@ &eth {
 	phy-handle = <&ethernet_phy0>;
 	mediatek,tx-delay-ps = <1530>;
 	snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
+	snps,reset-delays-us = <0 10000 10000>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default>;
 	pinctrl-1 = <&eth_sleep>;
diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index a9cca9c146fd..9e850e04fffb 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -726,7 +726,7 @@ queue2 {
 	};
 
 	eth: ethernet@1101c000 {
-		compatible = "mediatek,mt2712-gmac";
+		compatible = "mediatek,mt2712-gmac", "snps,dwmac-4.20a";
 		reg = <0 0x1101c000 0 0x1300>;
 		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "macirq";
@@ -734,15 +734,19 @@ eth: ethernet@1101c000 {
 		clock-names = "axi",
 			      "apb",
 			      "mac_main",
-			      "ptp_ref";
+			      "ptp_ref",
+			      "rmii_internal";
 		clocks = <&pericfg CLK_PERI_GMAC>,
 			 <&pericfg CLK_PERI_GMAC_PCLK>,
 			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
-			 <&topckgen CLK_TOP_ETHER_50M_SEL>;
+			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
+			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
 		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
-				  <&topckgen CLK_TOP_ETHER_50M_SEL>;
+				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
+				  <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
 		assigned-clock-parents = <&topckgen CLK_TOP_ETHERPLL_125M>,
-					 <&topckgen CLK_TOP_APLL1_D3>;
+					 <&topckgen CLK_TOP_APLL1_D3>,
+					 <&topckgen CLK_TOP_ETHERPLL_50M>;
 		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
 		mediatek,pericfg = <&pericfg>;
 		snps,axi-config = <&stmmac_axi_setup>;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
