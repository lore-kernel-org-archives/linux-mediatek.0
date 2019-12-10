Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00F9C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 16:44:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B212073D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 16:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qrMlBOXb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="wVpn3HTI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B212073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvYB+iDqA4yENUHoyV//yQ3XH0IWOj37YfiQIkktTgE=; b=qrMlBOXbXI8tOq
	JC9EPkrn7zO0cQcX5mDD+8BwauKhHb9TEs9gNmRvxwECGSlEFRRZ8rCZj/bklL6C2Ukyich1lO25x
	B9B5jz2linmSaf+E+uQtg3QiZOyYs8AYyENadEFbYcq7HUqve+mqPB6tVfaN1ax4tSbru+djJtnSD
	8p1FiEEPecf8W7KrtVZSM2qKVy/YtdwQtO9UqNj0Jy+kLH1BUjFECKR0KU3JGRi08zQmIQUOYGLe9
	ygPGls1f1KW5TLDmhOz+u95X/HXausFqZE3MIKK6qbQ0ajuPxxu6xPZp43rRqAWq+93jrRw1CbSh/
	f1sz3O9WZyrrgK7PjXSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieicw-0005Kz-5r; Tue, 10 Dec 2019 16:44:46 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieicu-0005K7-6i
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 16:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rn2HvqUHje4jyefJaRJuKH2kWexnmyg8GPKQ4GzLFWc=; b=wVpn3HTICHNgC9ULY2Ni+q5WSm
 qKK4GV1kc8Lqc5rDEyR9hpDxFPB4NsGXGITz+Bi0AWbnAqbUqGMrgApLpKR5CtjMDadASUVPown4s
 hJPvnSKRM3gb7aI0BnYJY2YyJEJv6yJHS8AhZYj9RdytbiKywITF0ZDNnq2NT4k+wZ0s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ieico-0005OE-FG; Tue, 10 Dec 2019 17:44:38 +0100
Date: Tue, 10 Dec 2019 17:44:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next 4/6] net: dsa: mt7530: Add the support of MT7531
 switch
Message-ID: <20191210164438.GD27714@lunn.ch>
References: <cover.1575914275.git.landen.chao@mediatek.com>
 <6d608dd024edc90b09ba4fe35417b693847f973c.1575914275.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d608dd024edc90b09ba4fe35417b693847f973c.1575914275.git.landen.chao@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_084444_252358_CF0FC67B 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, frank-w@public-files.de,
 f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +static int
> +mt7531_ind_mmd_phy_read(struct mt7530_priv *priv, int port, int devad,
> +			int regnum)
> +{
> +	struct mii_bus *bus = priv->bus;
> +	struct mt7530_dummy_poll p;
> +	u32 reg, val;
> +	int ret;
> +
> +	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
> +
> +	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> +
> +	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
> +				 !(val & PHY_ACS_ST), 20, 100000);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "poll timeout\n");
> +		goto out;
> +	}
> +
> +	reg = MDIO_CL45_ADDR | MDIO_PHY_ADDR(port) | MDIO_DEV_ADDR(devad) |
> +	      regnum;

It might be better to call this mt7531_ind_c45_phy_read()

> +static int
> +mt7531_ind_phy_read(struct dsa_switch *ds, int port, int regnum)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +	struct mii_bus *bus = priv->bus;
> +	struct mt7530_dummy_poll p;
> +	int ret;
> +	u32 val;
> +
> +	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
> +
> +	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> +
> +	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
> +				 !(val & PHY_ACS_ST), 20, 100000);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "poll timeout\n");
> +		goto out;
> +	}
> +
> +	val = MDIO_CL22_READ | MDIO_PHY_ADDR(port) | MDIO_REG_ADDR(regnum);

This is then mt7531_ind_c22_phy_read().

And then you can add a wrapper around this to provide

mt7531_phy_read() which can do both C22 and C45.

> +	[ID_MT7531] = {
> +		.id = ID_MT7531,
> +		.setup = mt7531_setup,
> +		.phy_read = mt7531_ind_phy_read,

and use it here.

  Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
