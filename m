Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85567C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 16:53:54 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30AED6191C
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 16:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30AED6191C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bJ47X+yhqa1GD83YHFByOLWlN5sYhvlJpSoHaw+sGrU=; b=NrijxGk6MBYiJW
	0uTzIPFetdQwavyt+fBK0Ge2VnaQ0MHJqq6X/K//JcNelZefWe4uuJxZH9ntlIu2ct8JuMZ0fnxtm
	eG54Kvil7hjuR2G5S7KzpXJEiQGkXHqR6koHFcEn/8rAQjcAe531FDX3rCclUPPWwoMXRHoQJReg6
	w4bLV9qkJobXesIhNRMcXIrPaYSoOGzleEhiHhf5r3Fhtaos2R4oqc2t4dvK1+icM5W7vh/aGduxw
	YLoolOPl/Md9NoPF3De8gS0sAfwpnRKO9QIo4OEpY56gAE3APN4ejmRYTfQ+uzC6LOm3cr+mk45h7
	VWEWnkd+oiGq2CJpFtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lt9MB-000H17-AI; Tue, 15 Jun 2021 13:43:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9FK-000DDm-Pk; Tue, 15 Jun 2021 13:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=BQai6nPOMiPUv4Z4xtBBlvgjSddYYRIO1ZSIjhf4Hns=; b=NfV+P60U0Gpq+Cw09JN1hsxS2L
 gkJUBTFlYGY+mWWW+8Vxkgo5w6ecMSJPQWAGyLdJOhq5U/G8lC1CJWTNSocqTLn8bi/MwS5Fiw9N+
 TVSdi7hEEaAthNX/Xb8P1H0GTIiBNiREOMYyx5vuLMM+zvQuuGAJOglXWxJKAB3is9czbx4F2Txuk
 bueM9iqxdQFn+qoZ9+swTnXFSipY42NXIRjsw3zwfrV38fbzR2XM2LrfwD3ZdUwENdZV0CQmoS13y
 VMZZeK6wSbOm6U4iiGV2BPZ+xuGoefc4EWq/tB1tWb2wdhV0I2AOcUdRSd7wbnwK1hQK3Mj+rjWEN
 8l/7agng==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt7Zu-007omD-41; Tue, 15 Jun 2021 11:50:07 +0000
X-UUID: e294bb90dd584109b18368063d4563fd-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=BQai6nPOMiPUv4Z4xtBBlvgjSddYYRIO1ZSIjhf4Hns=; 
 b=jISEheLo3L/jd5EqTxNRyxbR0yv1EVUZh/yzJZS5J2BQihrZ1PzdrW/Z4Q9dPZgR+9CQ0yS4bzhrpHXngA00JreNEi/+vAO/q+iaHYVKc1rPBvUxUhIAMujmQ7JmrnItAKzeNpsTA77+w2FfOHW841fZN5kvc1EZhRf5UPd/UlY=;
X-UUID: e294bb90dd584109b18368063d4563fd-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1327367590; Tue, 15 Jun 2021 04:49:59 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 04:49:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 19:49:55 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 19:49:55 +0800
Message-ID: <1623756935.15299.3.camel@mbjsdccf07>
Subject: [PATCH v2 1/1] arm64: dts: mediatek: add MT6779 spi master dts node
From: Mason Zhang <mason.zhang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hanks.chen@mediatek.com>, <wsd_upstream@mediatek.com>, Mason Zhang
 <Mason.Zhang@mediatek.com>
Date: Tue, 15 Jun 2021 19:35:35 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_125005_402930_7936F263 
X-CRM114-Status: UNSURE (   9.79  )
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


This patch add spi master dts node fot MT6779 SOC.

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


Hi Matthias:

	I;m sorry to disturb you again,
	I have update commit message for this patch, Is there any other questions about this patch?

Thanks
Mason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
