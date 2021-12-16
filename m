Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC04CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkiS4Ncv32mu4rjIoFaGJ/8lRKQ0Avf+Yqi9/DeNrL4=; b=OfpXyVa1/Uv1wj
	kRAD2b/rNa3+SFRkXZC1NGlXeLdqvVkbOfW+UDdh32oUVMwgiagUqK9+4OLbOHTtR9FifVdLTkvVq
	6qaXxJp5znbE+Ji+lIlcgRZe1Wq0rt09wCfJG4x7VmWByjIp2NaeUU1GC6cy7JdqpWNbJ9zIU15Jq
	AwTft5NHrK6s5mNydrJV7lvFnE+Woiq67bS9KAUdWSSelekHP4yrlpwYV5MreWfou98R7m61wc7F6
	qnCJCUssy/P5pv5setS87A3Vfolw4qtdVSDNXomf5G/qVJJbhCQAOeBjBnCwhLtTmtx+cX40eou05
	biCEH/8XuOgIvQTARL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxnAr-004VrE-LC; Thu, 16 Dec 2021 09:35:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxn4a-004T1e-Ro; Thu, 16 Dec 2021 09:29:14 +0000
X-UUID: 2f39cea59d034adbb31b0cd912a8bd1a-20211216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bTB+d+6540APzNiuwJ5CwBTovmrwX9Xq5yWvw8PCSXY=; 
 b=cS9T+nR/oUDhKuj17kXm4Ub8rHufXyrLJAUMRPdXVtAHfbvQpQ2l9Ug65u5OXcNOqmdIXyTf6LQLJoJwf7vl00+DMG1IRYXatZ2LBGxtgaId8ESFEMfReOwFeab1MTBa4VPo3mfXlTExHD3Zyhy0Io5sZVkEyg97Jnw4z1t8BKk=;
X-UUID: 2f39cea59d034adbb31b0cd912a8bd1a-20211216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 95658235; Thu, 16 Dec 2021 02:29:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 01:19:09 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Dec 2021 17:19:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Dec 2021 17:19:06 +0800
Message-ID: <a5f6a29fed9c0c886b4a09cfa258e8d87d0340fd.camel@mediatek.com>
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
Date: Thu, 16 Dec 2021 17:19:08 +0800
In-Reply-To: <c3f49e45-ccfe-dc11-52c5-c204d6f7a889@gmail.com>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-4-biao.huang@mediatek.com>
 <c3f49e45-ccfe-dc11-52c5-c204d6f7a889@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_012912_952573_A2E7AA40 
X-CRM114-Status: GOOD (  21.58  )
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

On Wed, 2021-12-15 at 20:20 +0100, Matthias Brugger wrote:
> 
> On 10/12/2021 02:31, Biao Huang wrote:
> > Since there are some changes in ethernet driver,
> > update ethernet device node in dts to accommodate to it.
> > 
> 
> I have a hard time to understand how the changes in 1/6 and 2/6 are
> related to 
> that.
> 
> Please explain better what has changed. Also beware that we shouldn't
> introduce 
> any non-backward compatible DTS changes. That means, the device
> should work with 
> the new driver but an older device tree.
> 
> Regards,
> Matthias
> 

http://lists.infradead.org/pipermail/linux-mediatek/2021-December/032812.html
I've add more details to commit message in v10 send,
please kindly review it.

Regards!
Biao

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
