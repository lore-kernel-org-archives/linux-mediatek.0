Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EA8C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 May 2022 13:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTMpHQKAgO/Zwg3E91ZFlSXobAgpOHmJfW7NjB9Zksg=; b=rBHksvF9fc54v2
	rulhVdpCn+R2VjIV1JC9CbTsIv8AbFMCB5JqQiTNH3mH/x78WOUApVKzk3claNFnfM2u7lNEBojbW
	ADXZtLgBaDTnvShKSDxhJuMvAe/THVx7KSZGO1zzvSXgwmBuv+T5bjYPEJ9lZkt8IX/qKPi/6t9Pe
	Ui74/PbhU4OOCO8v66IuepvK3exxX+IF3igt5KqzF63mz3XE9L8BG3SvdF1QXr4/S0s++Vk5/jSUT
	5M4Ub+QtazkeRSuF7apzApE2q7Vp8ju7HC6+gf4hSFIxXJ70L8KvFhbeG7TFjO9nd/mXzLM1PDFvP
	p9KUcLK8Ghq2N9zmcXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqDyp-0043XF-Be; Sun, 15 May 2022 13:08:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqDyl-0043V2-Qc
 for linux-mediatek@lists.infradead.org; Sun, 15 May 2022 13:08:14 +0000
X-UUID: faf77b808d654f07a9b1e1fd38fa67e7-20220515
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:29c70fc8-1434-4b0d-973b-0b2be416a9d3, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:46cf5ba7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: faf77b808d654f07a9b1e1fd38fa67e7-20220515
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1714799918; Sun, 15 May 2022 06:08:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 May 2022 06:08:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Sun, 15 May 2022 21:08:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sun, 15 May 2022 21:08:00 +0800
Message-ID: <8366aa6336e268490eba5cf4aa7a8d5049185956.camel@mediatek.com>
Subject: Re: [PATCH net-next 01/14] arm64: dts: mediatek: mt7986: introduce
 ethernet nodes
From: Landen Chao <landen.chao@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew@lunn.ch>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "nbd@nbd.name"
 <nbd@nbd.name>, "john@phrozen.org" <john@phrozen.org>, Sean Wang
 <Sean.Wang@mediatek.com>, Mark-MC Lee
 =?UTF-8?Q?=28=E6=9D=8E=E6=98=8E=E6=98=8C=29?= <Mark-MC.Lee@mediatek.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
 <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, Sam Shih
 =?UTF-8?Q?=28=E5=8F=B2=E7=A2=A9=E4=B8=89=29?= <Sam.Shih@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
 <robh@kernel.org>
Date: Sun, 15 May 2022 21:08:00 +0800
In-Reply-To: <Yn97GqujwYlljkdH@lore-desk>
References: <cover.1651839494.git.lorenzo@kernel.org>
 <1d555fbbac820e9b580da3e8c0db30e7d003c4b6.1651839494.git.lorenzo@kernel.org>
 <YnZ8o46pPdKMCbUF@lunn.ch> <YnlC3jvYarpV6BP1@lore-desk>
 <YnlFBr1wgb/hlduy@lunn.ch> <Yn97GqujwYlljkdH@lore-desk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_060811_917637_67DF4FC6 
X-CRM114-Status: GOOD (  18.50  )
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

On Sat, 2022-05-14 at 17:49 +0800, Lorenzo Bianconi wrote:
> > On Mon, May 09, 2022 at 06:35:42PM +0200, Lorenzo Bianconi wrote:
> > > > > +&eth {
> > > > > +	status = "okay";
> > > > > +
> > > > > +	gmac0: mac@0 {
> > > > > +		compatible = "mediatek,eth-mac";
> > > > > +		reg = <0>;
> > > > > +		phy-mode = "2500base-x";
> > > > > +
> > > > > +		fixed-link {
> > > > > +			speed = <2500>;
> > > > > +			full-duplex;
> > > > > +			pause;
> > > > > +		};
> > > > > +	};
> > > > > +
> > > > > +	gmac1: mac@1 {
> > > > > +		compatible = "mediatek,eth-mac";
> > > > > +		reg = <1>;
> > > > > +		phy-mode = "2500base-x";
> > > > > +
> > > > > +		fixed-link {
> > > > > +			speed = <2500>;
> > > > > +			full-duplex;
> > > > > +			pause;
> > > > > +		};
> > > > > +	};
> > > > 
> > > > Are both connected to the switch? It just seems unusual two
> > > > have two
> > > > fixed-link ports.
> > > 
> > > afaik mac design supports autoneg only in 10M/100M/1G mode and
> > > mt7986 gmac1
> > > is connected to a 2.5Gbps phy on mt7986-ref board.
> > 
> > The MAC does not normally perform autoneg, the PHY
> > does. phylib/phylink then tells the MAC the result of the
> > negotiation. If there is a SERDES/PCS involved, and it is
> > performing
> > the autoneg, phylink should get told about the result of the
> > autoneg
> > and it will tell the MAC the result.
> > 
> > So the gmac1 should just have phy-handle pointing to the PHY, not a
> > fixed link.
> > 
> >       Andrew
> 
> adding Landen to the discussion to provide more hw details.
> @Landen: any inputs on it?

The 2.5Gbps phy on mt7986-ref board enables the HW "rate adaption"
function which phy fixes 2.5Gbps to MAC as well. If the link rate of
Ethernet phy side is less than 2.5G, the 2.5Gbps phy HW will send pause
frame to MAC to adapt the real Tx rate. By the way, the 2.5Gbps phy
advertise all rates to link partner in HW default setting.

Regards,
Landen
> 
> Regards,
> Lorenzo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
