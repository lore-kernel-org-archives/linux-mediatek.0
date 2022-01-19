Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55396C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 01:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jS1Zx/X2Y30AnzPgbmioafJarkkfkJgXeCHvajbKOXw=; b=OJvSGdFCmrN3jS
	HW8Qj70G/fnmPyvbLrIOdNmlRtB8iNRmEIQQdTMQMBbTHLlP2i04aFWmoE/DVvqnJBOfmAg/cBIE9
	buogn62bQx/J+IH0YII/o4V4A2xSSO/5qhFwMiyKTqJF7FtER9/wb/Bzx9FSsA+UxjIRA3LpSWzfh
	P4Ru9ijr5qXUAZ52j0UX/Z/M5ByEfSsMzs4Ibsyig5v0uPytzXcHRzd1QRuCp3U3/YvexZsda45fd
	joMtF34Ti23bWrVlU3x9AQKNAl2AaX5OUs9brw9kQcMp5i3q7qfNyaaxuhdfH8N3pBfZkig2zTSf2
	9zAwjIwm+E9dtUwcmeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9zp0-003RKB-1C; Wed, 19 Jan 2022 01:31:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9zox-003RJa-84; Wed, 19 Jan 2022 01:31:32 +0000
X-UUID: 16a3a9e4425d4d9780950b5367391f0e-20220118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mcOt78j/AcW45svKSKvy1sGwkn3puB4qqxoww/iGucE=; 
 b=kx/vop208LTITgJ410WGtVdoHLjwgjjKH3b5G6HarW3+hFWMLJK/ayhGKsrBRlvzI4ROmeTuIhGT6R3Bv7+UwjwlMWh22M2obZuByS7bdFrHtaEhVEdZ3E0PLmuS+HRAttPqWjAMDHTOvSLA+QugOqrl6YE2IHH+yE5jN9Ab0yY=;
X-UUID: 16a3a9e4425d4d9780950b5367391f0e-20220118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 973638734; Tue, 18 Jan 2022 18:31:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 17:24:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 19 Jan 2022 09:24:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 09:24:28 +0800
Message-ID: <6d9edd18e64a973265b92d98395f8ce7470e59e6.camel@mediatek.com>
Subject: Re: [PATCH net-next v12 4/7] arm64: dts: mt2712: update ethernet
 device node
From: Biao Huang <biao.huang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, <angelogioacchino.delregno@collabora.com>, "Giuseppe
 Cavallaro" <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <dkirjanov@suse.de>
Date: Wed, 19 Jan 2022 09:24:28 +0800
In-Reply-To: <20220117070706.17853-5-biao.huang@mediatek.com>
References: <20220117070706.17853-1-biao.huang@mediatek.com>
 <20220117070706.17853-5-biao.huang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_173131_321271_13A0A6F4 
X-CRM114-Status: GOOD (  20.47  )
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

Dear Matthias,

	Any comments about this dts patch?
	Thanks in advance.

Regards!
Biao

On Mon, 2022-01-17 at 15:07 +0800, Biao Huang wrote:
> Since there are some changes in ethernet driver:
> update ethernet device node in dts to accommodate to it.
> 
> 1. stmmac_probe_config_dt() in stmmac_platform.c will initialize
> specified
>    parameters according to compatible string "snps,dwmac-4.20a",
> then,
>    dwmac-mediatek.c can skip the initialization if add compatible
> string
>    "snps,dwmac-4.20a" in eth device node.
> 2. commit 882007ed7832 ("net-next: dt-binding: dwmac-mediatek: add
> more
>    description for RMII") added rmii internal support, we should add
>    corresponding clocks/clocks-names in eth device node.
> 3. add "snps,reset-delays-us = <0 10000 10000>;" to ensure reset
> delay
>    can meet PHY requirement.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt2712-evb.dts |  1 +
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 14 +++++++++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> index 7d369fdd3117..11aa135aa0f3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> @@ -110,6 +110,7 @@ &eth {
>  	phy-handle = <&ethernet_phy0>;
>  	mediatek,tx-delay-ps = <1530>;
>  	snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> +	snps,reset-delays-us = <0 10000 10000>;
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&eth_default>;
>  	pinctrl-1 = <&eth_sleep>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> index a9cca9c146fd..9e850e04fffb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> @@ -726,7 +726,7 @@ queue2 {
>  	};
>  
>  	eth: ethernet@1101c000 {
> -		compatible = "mediatek,mt2712-gmac";
> +		compatible = "mediatek,mt2712-gmac", "snps,dwmac-
> 4.20a";
>  		reg = <0 0x1101c000 0 0x1300>;
>  		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-names = "macirq";
> @@ -734,15 +734,19 @@ eth: ethernet@1101c000 {
>  		clock-names = "axi",
>  			      "apb",
>  			      "mac_main",
> -			      "ptp_ref";
> +			      "ptp_ref",
> +			      "rmii_internal";
>  		clocks = <&pericfg CLK_PERI_GMAC>,
>  			 <&pericfg CLK_PERI_GMAC_PCLK>,
>  			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> -			 <&topckgen CLK_TOP_ETHER_50M_SEL>;
> +			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
>  		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> -				  <&topckgen CLK_TOP_ETHER_50M_SEL>;
> +				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +				  <&topckgen
> CLK_TOP_ETHER_50M_RMII_SEL>;
>  		assigned-clock-parents = <&topckgen
> CLK_TOP_ETHERPLL_125M>,
> -					 <&topckgen CLK_TOP_APLL1_D3>;
> +					 <&topckgen CLK_TOP_APLL1_D3>,
> +					 <&topckgen
> CLK_TOP_ETHERPLL_50M>;
>  		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
>  		mediatek,pericfg = <&pericfg>;
>  		snps,axi-config = <&stmmac_axi_setup>;
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
