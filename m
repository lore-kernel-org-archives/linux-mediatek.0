Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AE8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 04:41:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16EEB60F8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 04:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16EEB60F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kChClDn70IhXESkjOSK+eP7kYgax8kk4jmfE4GvW5MQ=; b=1jk2VMSVcB7kGi
	z6uSnslv67Nf6QwL1SObc4gumRfkkCNGjh2+WWexst14oYA4kHr9sMF8IntPVmTPs3kAEYLcAnwDT
	VNr8yxh/HRvSNlyjyuQGTUkBKE+rkCtPs+vFa3619fBYjYzpIaz9PL4mUM0kx4B6tnhYwNt/YrY5d
	n3EAJjUyRC4LCDdS/+inC4cTYBnrI8Bo33JbpTJOkFuyAw78x8Vu0lD85GB6Y1jfGhhFDPc2PGOJN
	av8w0W98xzX0YOikTLL0owBAflltRAZVpINfQwBWvCtm4ue9VulgA94RlYvE9WMH7oQbqY5O+lgh6
	Mnfy93T7O1JMxSUSYreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcgwG-0006f5-V6; Tue, 19 Oct 2021 04:41:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcgw2-0006dE-Ja; Tue, 19 Oct 2021 04:41:13 +0000
X-UUID: 1ee1b109da2342de9c6d764295a9daf7-20211018
X-UUID: 1ee1b109da2342de9c6d764295a9daf7-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 155756349; Mon, 18 Oct 2021 21:41:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 21:41:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 19 Oct 2021 12:41:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Oct 2021 12:41:03 +0800
Message-ID: <5d2a803943ace606d356af2ec0a75bd42aaf7fb5.camel@mediatek.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: mediatek: add clock support for mt7986b
From: Miles Chen <miles.chen@mediatek.com>
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-clk@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
Date: Tue, 19 Oct 2021 12:41:03 +0800
In-Reply-To: <20211018114701.13984-6-sam.shih@mediatek.com>
References: <20211018114701.13984-1-sam.shih@mediatek.com>
 <20211018114701.13984-6-sam.shih@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_214110_680806_74F3705B 
X-CRM114-Status: UNSURE (   9.68  )
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

Hi Sam,

@@ -99,6 +101,18 @@ gic: interrupt-controller@c000000 {
>  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		infracfg: infracfg@10001000 {
> +			compatible = "mediatek,mt7986-infracfg",
> "syscon";
> +			reg = <0 0x10001000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		topckgen: topckgen@1001b000 {
> +			compatible = "mediatek,mt7986-topckgen",
> "syscon";
> +			reg = <0 0x1001B000 0 0x1000>;

please use lowercase hex values (e.g, 0x1001b000)

> +			#clock-cells = <1>;
> +		};
> +
>  		watchdog: watchdog@1001c000 {
>  			compatible = "mediatek,mt7986-wdt",
>  				     "mediatek,mt6589-wdt";
> @@ -108,11 +122,31 @@ watchdog: watchdog@1001c000 {
>  			status = "disabled";
>  		};
>  
> +		apmixedsys: apmixedsys@1001e000 {
> +			compatible = "mediatek,mt7986-apmixedsys";
> +			reg = <0 0x1001E000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};

Ditto

> +
> +		sgmiisys0: syscon@10060000 {
> +			compatible = "mediatek,mt7986-sgmiisys_0",
> +				     "syscon";
> +			reg = <0 0x10060000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		sgmiisys1: syscon@10070000 {
> +			compatible = "mediatek,mt7986-sgmiisys_1",
> +				     "syscon";
> +			reg = <0 0x10070000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		trng: trng@1020f000 {
>  			compatible = "mediatek,mt7986-rng",
>  				     "mediatek,mt7623-rng";
>  			reg = <0 0x1020f000 0 0x100>;
> -			clocks = <&system_clk>;
> +			clocks = <&infracfg CLK_INFRA_TRNG_CK>;
>  			clock-names = "rng";
>  			status = "disabled";
>  		};
> @@ -122,7 +156,13 @@ uart0: serial@11002000 {
>  				     "mediatek,mt6577-uart";
>  			reg = <0 0x11002000 0 0x400>;
>  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&system_clk>;
> +			clocks = <&infracfg CLK_INFRA_UART0_SEL>,
> +				 <&infracfg CLK_INFRA_UART0_CK>;
> +			clock-names = "baud", "bus";
> +			assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
> +					  <&infracfg
> CLK_INFRA_UART0_SEL>;
> +			assigned-clock-parents = <&topckgen
> CLK_TOP_XTAL>,
> +						 <&topckgen
> CLK_TOP_UART_SEL>;
>  			status = "disabled";
>  		};
>  
> @@ -131,7 +171,11 @@ uart1: serial@11003000 {
>  				     "mediatek,mt6577-uart";
>  			reg = <0 0x11003000 0 0x400>;
>  			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&system_clk>;
> +			clocks = <&infracfg CLK_INFRA_UART1_SEL>,
> +				 <&infracfg CLK_INFRA_UART1_CK>;
> +			clock-names = "baud", "bus";
> +			assigned-clocks = <&infracfg
> CLK_INFRA_UART1_SEL>;
> +			assigned-clock-parents = <&topckgen
> CLK_TOP_F26M_SEL>;
>  			status = "disabled";
>  		};
>  
> @@ -140,10 +184,24 @@ uart2: serial@11004000 {
>  				     "mediatek,mt6577-uart";
>  			reg = <0 0x11004000 0 0x400>;
>  			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&system_clk>;
> +			clocks = <&infracfg CLK_INFRA_UART2_SEL>,
> +				 <&infracfg CLK_INFRA_UART2_CK>;
> +			clock-names = "baud", "bus";
> +			assigned-clocks = <&infracfg
> CLK_INFRA_UART2_SEL>;
> +			assigned-clock-parents = <&topckgen
> CLK_TOP_F26M_SEL>;
>  			status = "disabled";
>  		};
>  
> +		ethsys: syscon@15000000 {
> +			 #address-cells = <1>;
> +			 #size-cells = <1>;
> +			 compatible = "mediatek,mt7986-ethsys",
> +				      "syscon";
> +			 reg = <0 0x15000000 0 0x1000>;
> +			 #clock-cells = <1>;
> +			 #reset-cells = <1>;
> +		};
> +
>  	};
>  
>  };


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
