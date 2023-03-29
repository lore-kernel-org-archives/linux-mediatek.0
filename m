Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBCAC761AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 19:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ip60VxQO8vIEjsVQuk6WZlBLCQN328zDAYmxQho2Uk=; b=EXghI8XygvTHT5YKsbWgJNBg8N
	5KRKYYD7YTdIBA8Znt6NpiOnO4TQ5EK6XlWGBGJQKOc6nEf+rYMM5TlHsfKebKeoXDUMkHwpS8ROL
	nzY/Ixcaa99lrgRVblMzV9NzTytQ67iypDVaEmlCLCr6I5mojxKvt9gHTNQ7ufqp/oHh9FMgPV7JC
	/X0k/tqoVjTyh+meWyRNvtIbG4PBMhIl2eod53TI+jw3ojlWbWBT9I3Z3ZT9rLfOspqpBB7t6l5zt
	/yEMu+GrArYDU7cDUdBaKGPwZ96BUuRmDpJxow5aVGV7HGJV1UB9DFWrINn05K4F2MTb8r76mm8/V
	SOiSCAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phbZy-001e1z-1x;
	Wed, 29 Mar 2023 19:35:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phbZw-001e12-14;
	Wed, 29 Mar 2023 19:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9Ip60VxQO8vIEjsVQuk6WZlBLCQN328zDAYmxQho2Uk=; b=oNr9cPXYVHQF9aWQrgtHuUbaL4
	rrNePszDIqfOYFfGJC50qIve5P6TNCg56eDFOWxZFl5EU4a6rvy6hSSeNXqQEUrqJjaeXThOcY7sP
	yHibUzHcsx5RDU3sLn98Kg1qzVw5h5E6OXiPoAvByexD169ZM+yrl2MQni+L90RuZtF4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phbZl-008nTP-Sg; Wed, 29 Mar 2023 21:35:17 +0200
Date: Wed, 29 Mar 2023 21:35:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC PATCH net-next v3 03/15] net: dsa: mt7530: use regmap to
 access switch register space
Message-ID: <e8bb79ab-94d2-4e36-9b75-576a47e6c126@lunn.ch>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <754322262cd754aee5916954b8e651989b229a09.1680105013.git.daniel@makrotopia.org>
 <7eb07ed2-2b1c-44fa-b029-0ecad7872fd2@lunn.ch>
 <ZCSEbUt9kj8Ta6Yc@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCSEbUt9kj8Ta6Yc@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_123528_366469_8E507C1B 
X-CRM114-Status: GOOD (  21.68  )
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

On Wed, Mar 29, 2023 at 07:33:17PM +0100, Daniel Golle wrote:
> On Wed, Mar 29, 2023 at 06:24:21PM +0200, Andrew Lunn wrote:
> > Thanks for splitting this patchset up. This is much easier to review.
> > 
> > > +static u32
> > > +mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
> > > +{
> > > +	int ret;
> > > +	u32 val;
> > > +
> > > +	ret = regmap_read(priv->regmap, reg, &val);
> > > +	if (ret) {
> > > +		dev_err(priv->dev,
> > > +			"failed to read mt7530 register\n");
> > > +		return ret;
> > 
> > This is a u32 function. ret should be negative on error, which is
> > going to be turned positive in order to return a u32. So you probably
> > want to make this an int function.
> 
> This is a pre-existing flaw in the code. As we are accessing 32-bit
> registers there has just never been any meaningful error handling.

O.K. At least i would not return the negative error code. Return 0, or
0xdeadbeef or something. And consider adding a WARN_ON_ONCE() so it is very loud
when it goes wrong.

> I guess the correct solution would be to not use the return value only
> to indicate success or error, and use an additional u32* parameter for
> the read value.

Yes, that is what mv88e6xxx does.

> However, I was hestitating to convert all the calls (they are many) to
> follow that improved paradigm.

Yes, leave that for another time.

     Andrew

