Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727A3C05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 17:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VQvH3jXL5WQ3wS+VrU9C8UJFGOm0GxqfZKz0TYu+ro=; b=1Z/fUArlOckb2E1DHZMY3Kgf7z
	0PUozdWd9rKkwQuaI0E2EliKEbWtasw2TdwzhAhkOpUKq3Trz8OYfrrszT0R8R1tQdHesrA112f7q
	Ivob/kgN6nhhYuhRHzZqIlwKANG88B18HUM+PDL+FtcldBoVMWLjq9zJV+kybc6+26Dzwygym3dSI
	Ym7yqW4Kd7Qn+vSsmQ4rHOra6MJGuKy6wWfk1EU6qcTjItPNOzUEVv9gdlZ6YgCnFlse8aljclXxe
	BjTYrQ9Y8lA6fToz8PT3qS9mZwJWrAH+paHG47dVeb1yrxwuaucY2chUcvGjFH5fLmxLLJvqFpYw6
	lteJmPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc8iT-00B3P0-23;
	Tue, 14 Mar 2023 17:45:41 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc8iP-00B3Mg-3B;
	Tue, 14 Mar 2023 17:45:39 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pc8i8-0005bV-03;
	Tue, 14 Mar 2023 18:45:20 +0100
Date: Tue, 14 Mar 2023 17:45:13 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next v13 11/16] net: dsa: mt7530: use external PCS
 driver
Message-ID: <ZBCyqdfaeF/q8oZr@makrotopia.org>
References: <cover.1678357225.git.daniel@makrotopia.org>
 <2ac2ee40d3b0e705461b50613fda6a7edfdbc4b3.1678357225.git.daniel@makrotopia.org>
 <e99cc7d1-554d-5d4d-e69a-a38ded02bb08@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e99cc7d1-554d-5d4d-e69a-a38ded02bb08@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_104538_048230_F9D1448C 
X-CRM114-Status: GOOD (  15.36  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 14, 2023 at 08:16:35PM +0300, Arınç ÜNAL wrote:
> On 9.03.2023 13:57, Daniel Golle wrote:
> > [...]
> > +static int mt7530_regmap_read(void *context, unsigned int reg, unsigned int *val)
> > +{
> > +	struct mt7530_priv *priv = context;
> > +
> > +	*val = mt7530_read(priv, reg);
> > +	return 0;
> > +};
> > +
> > +static int mt7530_regmap_write(void *context, unsigned int reg, unsigned int val)
> > +{
> > +	struct mt7530_priv *priv = context;
> > +
> > +	mt7530_write(priv, reg, val);
> > +	return 0;
> > +};
> > +
> > +static int mt7530_regmap_update_bits(void *context, unsigned int reg,
> > +				     unsigned int mask, unsigned int val)
> > +{
> > +	struct mt7530_priv *priv = context;
> > +
> > +	mt7530_rmw(priv, reg, mask, val);
> > +	return 0;
> > +};
> > +
> > +static const struct regmap_bus mt7531_regmap_bus = {
> > +	.reg_write = mt7530_regmap_write,
> > +	.reg_read = mt7530_regmap_read,
> > +	.reg_update_bits = mt7530_regmap_update_bits,
> 
> These new functions can be used for both switches, mt7530 and mt7531,
> correct?

In theory, yes, they could be used on all switch ICs supported by the
mt7530.c driver. In practise they are used on MT7531 only because MT7530
and MT7621 don't have any SGMII/SerDes ports, but only MT7531 does.


> If so, I believe they are supposed to be called mt753x since
> 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a new
> hardware").
> 
> mt753x: functions that can be used for mt7530 and mt7531 switches.
> mt7530: functions specific to mt7530 switch.
> mt7531: functions specific to mt7531 switch.

Good catch, so mt7530_* is for sure not accurate. I used that naming
due to existing function names mt7530_read, mt7530_write and mt7530_rmw.

Given the situation I've explained above I think that mt753x_* would
be the best and I will change that for v14.

Thank you for reviewing!


Daniel

