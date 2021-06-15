Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356F4C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 19:26:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1580610EA
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 19:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1580610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JX4k0c478ws2uozOoLRf1LNQ51986iiuT3F4sSpZQ28=; b=ACcYbNAqqPVa6s
	oHrNFwPlZ/52cWV0+kifdSbOsKr/LeDXy69xSd2VuuTImYOzj5Ezp0hhE4L7oQ1NTDtqkmAsXeREU
	A5RMYSAirsPcSLrIkHCuoc7VeBikQRRzsOzNkURfKcVjEhB97qukaij25qODMaVOIjAUULaVwF/wD
	/SDuf0dKwTZBltZ2Q48T4+mdrRU3JvtbcHo6CT0EQMW9nRK9oHbBKmdVh35Lkq2p3WkLtgNtT98SI
	1Yh4T8vtnIzfqHJcugrQQs4Ug03/knBL4AnHwCp5MDY8VAWbPBGqP5y0KorpTKMNYZA4eIHal/tP9
	vLu2FFbc00NXkS2QXupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltEhR-002QSa-02; Tue, 15 Jun 2021 19:26:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Qp-000E8e-2p; Tue, 15 Jun 2021 13:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=vcOTu5+KGfLnMxqxtlJOi6bOOZBO6ZblZKmflxHCESY=; b=mJN1RFq6wXCoivw+RjINxo3FR1
 tL8hiqlaBnnZOd+pGi/hxeglQ8o272zfB3kYRRETN71CoX6sGcn3fMZgJNDqSOdc4p637GYcPU+ba
 1I29aA6qu+fZ2IyqXFg9ogswW++rD//QJTpC9KBjXR4FE9wsrG8KgXrryo61C73oA88ScYVq6qRdY
 NbFfxlwls1uLWwamCotFhUeGxgV94u9q/YZo6U4C4h8EA5dZsI+MKmtJqHDj+tem6Q9FSFW/kVXpA
 2AHKd+xHhtWQgEa62EkT2zDhzdUhqtPVwrgSzrzfi/moBnZGn0JHoH4mEI4gd7e4D3P6G/caL+Xyj
 QKLVqUGA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsyZd-007Fv6-CW; Tue, 15 Jun 2021 02:13:15 +0000
X-UUID: 2f43d81b19e64413953fedf86e4c1150-20210614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=vcOTu5+KGfLnMxqxtlJOi6bOOZBO6ZblZKmflxHCESY=; 
 b=BvGK1MCGX6YQI4UrrI8CrsCGaESRU3WdaGyUVyd+DbfAxcKTleG+K8ZvI4Ro4OVSmu81o4XcuSImRWazev0Uz5OaZ8tydWQZEDC+ARnQPtxLtCuIvExB7sh5M3O7kQiY5xepJgav424SvTMQcnXuJmNXwzZHRQ4P1SAipoQz+k8=;
X-UUID: 2f43d81b19e64413953fedf86e4c1150-20210614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 618172813; Mon, 14 Jun 2021 19:13:04 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 19:03:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:02:48 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 10:02:47 +0800
Message-ID: <1623721709.24597.8.camel@mbjsdccf07>
Subject: [PATCH v3 1/1] arm64: dts: mediatek: add MT6779 spi master dts node
From: Mason Zhang <mason.zhang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <wsd_upstream@mediatek.com>, <hanks.chen@mediatek.com>,
 <mason.zhang@mediatek.com>, Mason Zhang <Mason.Zhang@mediatek.com>
Date: Tue, 15 Jun 2021 09:48:29 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_031313_512572_87F02FF5 
X-CRM114-Status: GOOD (  10.29  )
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


From: Mason Zhang <Mason.Zhang@mediatek.com>

This patch add spi master dts node for MT6779 SOC.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 112 +++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 370f309d32de..c81e76865d1b 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -219,6 +219,118 @@
 			status = "disabled";
 		};
 
+		spi0: spi0@1100a000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x1100a000 0 0x1000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				<&topckgen CLK_TOP_SPI>,
+				<&infracfg_ao CLK_INFRA_SPI0>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi1: spi1@11010000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x11010000 0 0x1000>;
+			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				<&topckgen CLK_TOP_SPI>,
+				<&infracfg_ao CLK_INFRA_SPI1>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi2: spi2@11012000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x11012000 0 0x1000>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				 <&topckgen CLK_TOP_SPI>,
+				<&infracfg_ao CLK_INFRA_SPI2>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi3: spi3@11013000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x11013000 0 0x1000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				 <&topckgen CLK_TOP_SPI>,
+				 <&infracfg_ao CLK_INFRA_SPI3>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi4: spi4@11018000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x11018000 0 0x1000>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				 <&topckgen CLK_TOP_SPI>,
+				 <&infracfg_ao CLK_INFRA_SPI4>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi5: spi5@11019000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x11019000 0 0x1000>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				<&topckgen CLK_TOP_SPI>,
+				<&infracfg_ao CLK_INFRA_SPI5>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi6: spi6@1101d000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x1101d000 0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				 <&topckgen CLK_TOP_SPI>,
+				 <&infracfg_ao CLK_INFRA_SPI6>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi7: spi7@1101e000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x1101e000 0 0x1000>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				 <&topckgen CLK_TOP_SPI>,
+				 <&infracfg_ao CLK_INFRA_SPI7>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
 		audio: clock-controller@11210000 {
 			compatible = "mediatek,mt6779-audio", "syscon";
 			reg = <0 0x11210000 0 0x1000>;

Dear Matthias:
	
	I'm sorry to bother you again, I have update commit message for this
patch, Is there any problem with this patch?

Thanks
Mason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
