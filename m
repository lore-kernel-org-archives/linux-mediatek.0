Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFB4C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 00:07:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A59611CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 00:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A59611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hqFrfY9wx6FJb8aQHCAp6dzQ3qEAO5++0zcXpTo0iS4=; b=bNQ1Si50HTk7ZF6VaJR+FbLmM
	GaJK49Scnt9HikLW7DcNQrZJHCpDhHSzZJW8KjLsBKFFxywM2YFfqyLUZrvDI8ux+VmRmn4dy2dMs
	gvAuJ0JbqXwTeiOfTJIPKHmP8QXhpwGzL+JQDesiQQpLwBGOKhl+ZROo1cDcfk7wwpoThZ3hspJNC
	wwL92Ee8m/sXeJGMLAzJMxM5Oqeuou0/Ry6Xu5rzE7O1hI5RbPSXgd7HbLjGwV3nzRE3spqnAe4Of
	QQG3Pqg58/byGpaYbbkwIXxkhF2OFacvZTTwjHfsOYcGM8MUdbgCV8O/f6fLaXuTRn5wWI+4HfaqM
	TGvlRIl/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lW6ae-007w3H-Nq; Tue, 13 Apr 2021 00:07:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW6ac-007w3A-EX
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 00:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=34ExIe+8R25fJHNiOuUFOiYzyB7blgnO1LGRtGjsmmU=; b=Zn+WyzeZvavLW3bC/d49H+ieCZ
 lFCgZRjgrr1wVxCtdshV1Hxp75BYmoOWnZMcZCdxedm6H30/ZKbu8gQZukWFf4ipYYzy6dxatH4qx
 6yZVHLKk4ZP45lDKpsZ7XaBZsZk1BAFN2PgmIukjXgFA+3l/7jp2PBMqEBisUnbpNlg82SKOGfdtI
 g3YT2JgVJxRcVGhGPW1hFM+Z4OkGDEVZfuoet7H/118q+OFu/4pq5tPvb7DHn/a44lqSbVz1izYyB
 bIB2ntQCi2b5Na1wjGI13thqoV4M064soOD65MZz6FmM0VC2E+PxZq2BXPs17pmMEeW31XlqrnFSz
 Mj+Vzu7w==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW6aZ-006doX-TD
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 00:07:33 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lW6aR-00GNup-Cv; Tue, 13 Apr 2021 02:07:23 +0200
Date: Tue, 13 Apr 2021 02:07:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Greg Ungerer <gerg@kernel.org>
Subject: Re: [RFC v4 net-next 2/4] net: dsa: mt7530: add interrupt support
Message-ID: <YHTgu1+6GZFdFgWJ@lunn.ch>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-3-dqfext@gmail.com>
 <87fszvoqvb.wl-maz@kernel.org>
 <20210412152210.929733-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412152210.929733-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_170731_962868_28EEDE90 
X-CRM114-Status: GOOD (  17.82  )
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

> > > +static void
> > > +mt7530_setup_mdio_irq(struct mt7530_priv *priv)
> > > +{
> > > +	struct dsa_switch *ds = priv->ds;
> > > +	int p;
> > > +
> > > +	for (p = 0; p < MT7530_NUM_PHYS; p++) {
> > > +		if (BIT(p) & ds->phys_mii_mask) {
> > > +			unsigned int irq;
> > > +
> > > +			irq = irq_create_mapping(priv->irq_domain, p);
> > 
> > This seems odd. Why aren't the MDIO IRQs allocated on demand as
> > endpoint attached to this interrupt controller are being probed
> > individually? In general, doing this allocation upfront is an
> > indication that there is some missing information in the DT to perform
> > the discovery.
> 
> This is what Andrew's mv88e6xxx does, actually. In addition, I also check
> the phys_mii_mask to avoid creating mappings for unused ports.

It can be done via DT, using the standard interrupt property, so long
as you use of_mdiobus_register(np).

But when you have an 7 port switch, and a nice simple mapping, port 0
PHY using interrupt 0, you can save a lot of device tree boilerplate
by doing it in code. And when you have 4 of these switches, it gets
very boring adding all the DT to just wire up the interrupts 28
interrupts.

> Andrew, perhaps this can be done in DSA core?

Not easily. It is not always a simple mapping like this. Two of the
switches supported by mv88exxx offset the PHYs by 0x10. You really
need the switch driver involved, with its detailed knowledge of the
hardware.

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
