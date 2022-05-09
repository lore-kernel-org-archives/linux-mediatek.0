Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA97CC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dsCjFPWWVpV6RrAV4n3seWDeBw+onptMS+XtnXyTX0=; b=uzzFLb0xCLKMT0
	Z+fO0n4s503AiBTgl3o6dxccW8AO0tWGmkhaL/S73DDJvlnnN3j7aD8+tOZExnQ0lnn2E34maaZco
	rwZQwr06CudVTvWsTV7NAv3LytU2guDDWphI2oQ+I99mJ4TO3Q5v51P0GIsqGRzX8Xp2QILQXeO4z
	GoRPKuMUEJFNV8iQii4pr6Cegk+PhbpQYJK+IYMN4mCe/1LHy0FtYJkyUgiTy3E+qXJ3i1GIjxYTG
	BT9TVHb33nnCjV9FSyu/xwe5gfvCd2AVkC6u+qYSuim3tHdjlVvGYpgVwX2IPKCcpnnW1WPBQL6G0
	u/pbikl0cqz8njJzX/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no6VM-00FTPX-PP; Mon, 09 May 2022 16:45:04 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no6VK-00FTP6-SY
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 16:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=5crOhz1b2Yt/7xhvVXQallsdzBVJYK1M2zVGJWfie0o=; b=WprEvTGHNXuTJ2lhdPuXfQjQrG
 cbCUQaUc0KpKLXCvCveQNP+OIyUZxj/bNjSKveAEm2tYmhbTrtyA0fhe0huiZZLcXr6D9f8sFYVqJ
 uqjiShDApZzcmjbHGZfGjYGiNq+cWC/jPkigdMYWaXTDXJzQfrY5q9+OIMhYZ9Q40w2I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1no6VC-001yeT-Mx; Mon, 09 May 2022 18:44:54 +0200
Date: Mon, 9 May 2022 18:44:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: Re: [PATCH net-next 01/14] arm64: dts: mediatek: mt7986: introduce
 ethernet nodes
Message-ID: <YnlFBr1wgb/hlduy@lunn.ch>
References: <cover.1651839494.git.lorenzo@kernel.org>
 <1d555fbbac820e9b580da3e8c0db30e7d003c4b6.1651839494.git.lorenzo@kernel.org>
 <YnZ8o46pPdKMCbUF@lunn.ch> <YnlC3jvYarpV6BP1@lore-desk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnlC3jvYarpV6BP1@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_094502_974489_0F3A7919 
X-CRM114-Status: GOOD (  11.31  )
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

On Mon, May 09, 2022 at 06:35:42PM +0200, Lorenzo Bianconi wrote:
> > > +&eth {
> > > +	status = "okay";
> > > +
> > > +	gmac0: mac@0 {
> > > +		compatible = "mediatek,eth-mac";
> > > +		reg = <0>;
> > > +		phy-mode = "2500base-x";
> > > +
> > > +		fixed-link {
> > > +			speed = <2500>;
> > > +			full-duplex;
> > > +			pause;
> > > +		};
> > > +	};
> > > +
> > > +	gmac1: mac@1 {
> > > +		compatible = "mediatek,eth-mac";
> > > +		reg = <1>;
> > > +		phy-mode = "2500base-x";
> > > +
> > > +		fixed-link {
> > > +			speed = <2500>;
> > > +			full-duplex;
> > > +			pause;
> > > +		};
> > > +	};
> > 
> > Are both connected to the switch? It just seems unusual two have two
> > fixed-link ports.
> 
> afaik mac design supports autoneg only in 10M/100M/1G mode and mt7986 gmac1
> is connected to a 2.5Gbps phy on mt7986-ref board.

The MAC does not normally perform autoneg, the PHY
does. phylib/phylink then tells the MAC the result of the
negotiation. If there is a SERDES/PCS involved, and it is performing
the autoneg, phylink should get told about the result of the autoneg
and it will tell the MAC the result.

So the gmac1 should just have phy-handle pointing to the PHY, not a
fixed link.

      Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
