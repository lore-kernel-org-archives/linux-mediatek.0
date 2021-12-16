Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC57C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 01:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dlcljrd6I7XKkK8VIljsOMounB98teSuEFxMuNh45Pg=; b=Ak2FxKOmDqLJPz
	+nk/RYJ8f+BbBeiAnkl9Eb2VK0/gIdZKPV4Lsiv2+9v62RiOA4M4bFG6hpuD/Kmp83Ni59TpZimH1
	ILEzvY0ZsgziEdb08yAkyieQSdDEvSwZPDcz90fu5d9oBJ1u2i6l6KqTpLa6jF6UBUtGy9sIDjd2M
	4DupWDBq37eO4YN/q303Tpm8KOjeVAPOFsv4Z79rIxutaSn8mWwbBPYvjgO/QV06FXz7tB0V7WuXX
	GZJ0ny4EXqTFozOE2DKiLeY2NehCr0/CmZ4eTyVN2fqkmxz9n3birhDu6VJ/1btJQ/W2eP2cwuyJT
	5EE/k1/9oNi9ixg+tMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxfZL-003Flx-WB; Thu, 16 Dec 2021 01:28:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxfZH-003Fk5-I6; Thu, 16 Dec 2021 01:28:26 +0000
X-UUID: f46b6a465409421eb7b1031d4578f059-20211215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lPwZ/wiMhF2SlW3zUGCuz9quzus0l5KZmaU6H+G/S3Y=; 
 b=TBs2DTvlLhImgc7m8teAN9YfbsHuZPgnKbbdPUhla142rf0sOnm7ic9YChJu/XOUp5aQW4EduUXlszgipk82dEAH2IKnrbh8keZpZ4v8DftZx8MPzs6DTDI68B8O3+Xr/kLLNyxGYj5YZt22CRu8pd1lxtgNXdFzmxtOwidvKvg=;
X-UUID: f46b6a465409421eb7b1031d4578f059-20211215
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 927628145; Wed, 15 Dec 2021 18:28:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Dec 2021 17:28:14 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Dec 2021 09:28:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Dec 2021 09:28:12 +0800
Message-ID: <c320d912b4569363514390718e2a81f565f9e225.camel@mediatek.com>
Subject: Re: [PATCH net-next v8 3/6] arm64: dts: mt2712: update ethernet
 device node
From: Biao Huang <biao.huang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Date: Thu, 16 Dec 2021 09:28:13 +0800
In-Reply-To: <c9b3d31a-1c18-32ec-8077-603bb93fe8d0@gmail.com>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-4-biao.huang@mediatek.com>
 <c9b3d31a-1c18-32ec-8077-603bb93fe8d0@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_172823_635371_D920C57F 
X-CRM114-Status: GOOD (  25.79  )
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
	Thanks for your comments~
On Wed, 2021-12-15 at 20:22 +0100, Matthias Brugger wrote:
> 
> On 10/12/2021 02:31, Biao Huang wrote:
> > Since there are some changes in ethernet driver,
> > update ethernet device node in dts to accommodate to it.
> > 
> 
> I have a hard time to understand how the first two patches are
> related to this 
> one. Please be more specific in your commit message.
This dts patch is not related to previous two patches in this series.

Actually, this patch should be sent with commit
"71a55a2315b047352b3d65e2d24724207be85ae2", which added extra RMII
support in driver. But unfortunately, we missed it out.

Is there any proper way to relate this patch to commit
"71a55a2315b047352b3d65e2d24724207be85ae2"? (Fixed tag seems not a good
choice, or just add more details in commit message?)
>  
> Also please beware that we should make sure that a newer driver
> version should 
> still work properly with an older device tree, which does not have
> your changes.
> 
> Regards,
> Matthias
> 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt2712-evb.dts |  1 +
> >   arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 14 +++++++++-----
> >   2 files changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > index 7d369fdd3117..11aa135aa0f3 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > @@ -110,6 +110,7 @@ &eth {
> >   	phy-handle = <&ethernet_phy0>;
> >   	mediatek,tx-delay-ps = <1530>;
> >   	snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> > +	snps,reset-delays-us = <0 10000 10000>;
> >   	pinctrl-names = "default", "sleep";
> >   	pinctrl-0 = <&eth_default>;
> >   	pinctrl-1 = <&eth_sleep>;
> > diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > index a9cca9c146fd..9e850e04fffb 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > @@ -726,7 +726,7 @@ queue2 {
> >   	};
> >   
> >   	eth: ethernet@1101c000 {
> > -		compatible = "mediatek,mt2712-gmac";
> > +		compatible = "mediatek,mt2712-gmac", "snps,dwmac-
> > 4.20a";
> >   		reg = <0 0x1101c000 0 0x1300>;
> >   		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> >   		interrupt-names = "macirq";
> > @@ -734,15 +734,19 @@ eth: ethernet@1101c000 {
> >   		clock-names = "axi",
> >   			      "apb",
> >   			      "mac_main",
> > -			      "ptp_ref";
> > +			      "ptp_ref",
> > +			      "rmii_internal";
> >   		clocks = <&pericfg CLK_PERI_GMAC>,
> >   			 <&pericfg CLK_PERI_GMAC_PCLK>,
> >   			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > -			 <&topckgen CLK_TOP_ETHER_50M_SEL>;
> > +			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > +			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> >   		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > -				  <&topckgen CLK_TOP_ETHER_50M_SEL>;
> > +				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > +				  <&topckgen
> > CLK_TOP_ETHER_50M_RMII_SEL>;
> >   		assigned-clock-parents = <&topckgen
> > CLK_TOP_ETHERPLL_125M>,
> > -					 <&topckgen CLK_TOP_APLL1_D3>;
> > +					 <&topckgen CLK_TOP_APLL1_D3>,
> > +					 <&topckgen
> > CLK_TOP_ETHERPLL_50M>;
> >   		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
> >   		mediatek,pericfg = <&pericfg>;
> >   		snps,axi-config = <&stmmac_axi_setup>;
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
