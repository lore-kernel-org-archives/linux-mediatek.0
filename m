Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1916BC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ew2VrmHzGPvgqw37nixkUQHyViLcTKktlnYft8UoXmk=; b=vAjvCw7Xd+NnZre3393b6weDia
	lz+Bf7hNxS4TUip/ElfOHzju3s52esGmElEBEYzvWc+AxBbUTkZCQxnxxU9/FaGGo0Ng5s6ZBdXVp
	C+XD6BpTGUhIoRvdAZt4GaNF/idh3hP5R/GR2tC+g3RfFZ6wHmCXe+87zqWyJRcOj8Vy+jEgrij1a
	Etm2NEZhglGeggbVLH53PA+xlcyEXSWPqPDoCPWboHSX28Yl1EANB8RdKE4I5K4rmemOpfn3UZCXe
	OphiqH7OZmaUgeddg0iFAa3ufW9LF1unuLQY4Rl3J9yXFv4Hl4Vvzyf4rWqvUaBOSLkPZnFOYL6y8
	NiXF4uhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMnbA-004jrg-0h;
	Mon, 08 Jan 2024 11:15:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMnb6-004jqj-24;
	Mon, 08 Jan 2024 11:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B4064B8095A;
	Mon,  8 Jan 2024 11:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE990C433C7;
	Mon,  8 Jan 2024 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704712510;
	bh=3onyJACON7UN+r62nN4g7w7HHbRgM+h21qgM1D0k0r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrAC5YaC8C/78giFGYGDmAO9hHqI3cDeSUnGDufaz+cC39G+F4UziFgYogb6u2b7m
	 s0/BFGaX7LSMtEXbDTbVufZhX0s+xPtXJB2ylD9Dl5a/sGc4EmcrjerEGAwqbZfH2p
	 k3cb0Z0ZJBWANO3X35IRgq9ozi7qLcGxzPXx2QlQjZqy/6rwnsbk/iqjUFuPvO6GN1
	 0wtZBFUZggsU8UHeHWMqg19y5k8b2j1NqHV8Jstg3VFNmsPg7MJJRaImu/vqxolo2M
	 yOQ3bimzkhEhBk37koV4IwJ7P3++y9xTMUOG8/YNEUGEMX5KjGVSG+cWSXDlbx2zCD
	 2PD+Mjyl74ZAg==
Date: Mon, 8 Jan 2024 11:15:03 +0000
From: Simon Horman <horms@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: support OF-based registration
 of switch MDIO bus
Message-ID: <20240108111503.GI132648@kernel.org>
References: <20240106122142.235389-1-arinc.unal@arinc9.com>
 <20240107195241.GB132648@kernel.org>
 <65274929-fa59-482c-a744-6b9ce162ab46@arinc9.com>
 <20240108110000.aujqhlufehngtkjj@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240108110000.aujqhlufehngtkjj@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_031512_835926_E1531692 
X-CRM114-Status: GOOD (  15.34  )
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

On Mon, Jan 08, 2024 at 01:00:00PM +0200, Vladimir Oltean wrote:
> On Mon, Jan 08, 2024 at 01:22:18PM +0300, Arınç ÜNAL wrote:
> > > > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > > > index 391c4dbdff42..39d7e7ad7154 100644
> > > > --- a/drivers/net/dsa/mt7530.c
> > > > +++ b/drivers/net/dsa/mt7530.c
> > > > @@ -2153,17 +2153,25 @@ mt7530_free_irq(struct mt7530_priv *priv)
> > > >   static int
> > > >   mt7530_setup_mdio(struct mt7530_priv *priv)
> > > >   {
> > > > +	struct device_node *mnp, *np = priv->dev->of_node;
> > > >   	struct dsa_switch *ds = priv->ds;
> > > >   	struct device *dev = priv->dev;
> > > >   	struct mii_bus *bus;
> > > >   	static int idx;
> > > > -	int ret;
> > > > +	int ret = 0;
> > > > +
> > > > +	mnp = of_get_child_by_name(np, "mdio");
> > > > +
> > > > +	if (mnp && !of_device_is_available(mnp))
> > > > +		goto out;
> > > 
> > > nit: I think it would easier on the eyes to simply
> > > 
> > > 		return 0;
> 
> Actually "return 0" leaks "mnp". An of_node_put() is needed.

Yes, sorry for not noticing that.

