Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E1FC77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 19:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZGv9cQrrre1lqWgC7IqFyZLxHbrSjanKLwNZbrl950=; b=JSOq47MiYUXPX1hHU+XEa2WzDj
	fWuMZoUyQdaqlebZTS8Y8DQrWozRlTeREnbbtZ1ToEYek2B//85DfWylq4UhGk3g3gDvklRhrvaI4
	VB9f/WVA2L93/92iLQsiGtxSeUn3jkRR1pAJHmi0m3VfumdACTeJgicpmfH7W1qPYbXz9lWqyHn91
	TxWMJSxQV+whh9L1E2w/gxeSVcnzQAAUAMc/1YgN6SFtpPnje4NElVOaX8QMpeodEgHoDVfSIO+pX
	dx5DuuogLgx2hJtWXEp4XJ2MY3Mgosea6zUDbfqSKYgnLDjIJoUznmRcMyklUjjfy+zBiZCAw7gIo
	xz/gfL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppw5u-00BhG1-2x;
	Fri, 21 Apr 2023 19:06:54 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppw5q-00BhDy-1A;
	Fri, 21 Apr 2023 19:06:51 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppw5N-0002na-2t;
	Fri, 21 Apr 2023 21:06:22 +0200
Date: Fri, 21 Apr 2023 20:06:18 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [RFC PATCH net-next 20/22] net: dsa: mt7530: force link-down on
 MACs before reset on MT7530
Message-ID: <ZELeqnUKQApQPxUR@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-21-arinc.unal@arinc9.com>
 <ZELZAd4O9SyHLkwn@makrotopia.org>
 <7982894a-029c-585a-9ab5-3a6295c6abaa@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7982894a-029c-585a-9ab5-3a6295c6abaa@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_120650_394979_7416F924 
X-CRM114-Status: GOOD (  25.76  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Richard van Schagen <vschagen@cs.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 21, 2023 at 09:47:16PM +0300, Arınç ÜNAL wrote:
> On 21.04.2023 21:42, Daniel Golle wrote:
> > On Fri, Apr 21, 2023 at 05:36:46PM +0300, arinc9.unal@gmail.com wrote:
> > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > 
> > > Force link-down on all MACs before internal reset. Let's follow suit commit
> > > 728c2af6ad8c ("net: mt7531: ensure all MACs are powered down before
> > > reset").
> > > 
> > > Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > ---
> > >   drivers/net/dsa/mt7530.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > > index ac1e3c58aaac..8ece3d0d820c 100644
> > > --- a/drivers/net/dsa/mt7530.c
> > > +++ b/drivers/net/dsa/mt7530.c
> > > @@ -2203,6 +2203,10 @@ mt7530_setup(struct dsa_switch *ds)
> > >   		return -EINVAL;
> > >   	}
> > > +	/* Force link-down on all MACs before internal reset */
> > > +	for (i = 0; i < MT7530_NUM_PORTS; i++)
> > > +		mt7530_write(priv, MT7530_PMCR_P(i), PMCR_FORCE_LNK);
> > > +
> > 
> > Moving this part to mt753x_setup just before calling priv->info->sw_setup(ds);
> > is probably better. Though it isn't documented I assume that the requirement
> > to have the ports in force-link-down may also apply to MT7988, and for sure
> > it doesn't do any harm.
> > 
> > Hence I suggest to squash this change:
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index a2cb7e296165e..998c4e8930cd3 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -2203,10 +2203,6 @@ mt7530_setup(struct dsa_switch *ds)
> >   		return -EINVAL;
> >   	}
> > -	/* Force link-down on all MACs before internal reset */
> > -	for (i = 0; i < MT7530_NUM_PORTS; i++)
> > -		mt7530_write(priv, MT7530_PMCR_P(i), PMCR_FORCE_LNK);
> > -
> >   	/* Reset the switch through internal reset */
> >   	mt7530_write(priv, MT7530_SYS_CTRL,
> >   		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
> > @@ -2423,10 +2419,6 @@ mt7531_setup(struct dsa_switch *ds)
> >   		dev_info(priv->dev, "found MT7531BE\n");
> >   	}
> > -	/* all MACs must be forced link-down before sw reset */
> > -	for (i = 0; i < MT7530_NUM_PORTS; i++)
> > -		mt7530_write(priv, MT7530_PMCR_P(i), MT7531_FORCE_LNK);
> > -
> >   	/* Reset the switch through internal reset */
> >   	mt7530_write(priv, MT7530_SYS_CTRL,
> >   		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
> > @@ -2907,6 +2899,10 @@ mt753x_setup(struct dsa_switch *ds)
> >   		priv->pcs[i].port = i;
> >   	}
> > +	/* Force link-down on all MACs before setup */
> > +	for (i = 0; i < MT7530_NUM_PORTS; i++)
> > +		mt7530_write(priv, MT7530_PMCR_P(i), PMCR_FORCE_LNK);
> 
> MT7531 has got a different bit on the register for this, MT7531_FORCE_LNK.
> Are you sure PMCR_FORCE_LNK would work for MT7531 too?

No, I had overlooked that. As the effects of not doing the
force-link-down before the reset are subtle and depend on the
link-partners I may not have cought them in my tests.


> 
> Arınç

