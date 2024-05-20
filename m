Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A8AC25B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0jIAAuXSP3n0MB/pRJJ3f6EEsygUxZ+BPC7VxBGXp8=; b=UbJa8bYQvPhREhM4/4KIkrDopn
	O/E6I3CMCfIh4J3kjMaD0KX6HwzSVKyPrcU9KqdqrQArX1aIt26mSCITl+4TYBG6TBu8AauRXo/pz
	YwhmkAA2v/uOJG+dPFNBYKZ+lk3d6ZzYQDCzijLO8nzxtM1wmaIelbAvIs+WeNJ9uROYT4oWB2LQs
	+vjBavX3eru3Uq+Y0SECVSqJ0/ZQ4yCdqxrXOqnYIxitaSmd6P0rFM63CVCmZABkdrbDCUl6zJ0M4
	eeUQzrs/ol8yS8Yi724+fqmSWYOqpH6wVLpHJYhFvMyNt8PxYLNZXQrqcsFAAOjUlbWaAb6qCKGTE
	JJ13YI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92f4-0000000EWom-3gpy;
	Mon, 20 May 2024 13:02:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92f0-0000000EWlT-1XHl;
	Mon, 20 May 2024 13:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=j0jIAAuXSP3n0MB/pRJJ3f6EEsygUxZ+BPC7VxBGXp8=; b=UN2Dj7198lyU3K4EVT86LEI9IQ
	cdtpjZUJU1lns6OAl9EJhTDzjCIZ6Amc/gU+q4KDrYk/EKjrZ5/cOduBfsuv5zno3WL2ocpqj6mjH
	c7IU4uWoyZtQm4NTJxf5g4ntGMbjOrfxZ6ix/ZG8fj1o2PGdp4DGWTOG0LN5/REsWfl8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s92ej-00FhFN-La; Mon, 20 May 2024 15:02:21 +0200
Date: Mon, 20 May 2024 15:02:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v2 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <8a5f14f4-4cd9-48b5-a62c-711800cee942@lunn.ch>
References: <20240517102908.12079-1-SkyLake.Huang@mediatek.com>
 <20240517102908.12079-6-SkyLake.Huang@mediatek.com>
 <cc0f67de-171e-45e1-90d9-b6b40ec71827@lunn.ch>
 <283c893aa17837e7189a852af4f88662cda5536f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <283c893aa17837e7189a852af4f88662cda5536f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_060238_428427_FE190A5F 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > Is there a version available anywhere for the firmware?
> > 
> Currently, I use "$md5sum /lib/firmware/mediatek/mt7988/i2p5ge-phy-
> pmb.bin" command to check version.

An md5sum is not really a version. How do you tell if one md5sum is
newer or older than another?

Is there is an MDIO register you can read to get the version? Or a
version in a header in the firmware file?

> > > +static int mt798x_2p5ge_phy_get_features(struct phy_device
> > *phydev)
> > > +{
> > > +int ret;
> > > +
> > > +ret = genphy_c45_pma_read_abilities(phydev);
> > > +if (ret)
> > > +return ret;
> > > +
> > > +/* We don't support HDX at MAC layer on mt7988.
> > 
> > That is a MAC limitation, so it should be the MAC which disables
> > this,
> > not the Phy.
> > 
> Actually this phy is strictly binded to (XFI)MAC on this platform.
> So I directly disable HDX feature of PHY.

Sorry, i don't follow your answer:

Can the PHY do half duplex?
Can the MAC do half duplex?

The part which cannot do half-duplex should be the part which disables
half-duplex.

You should be able to take any vendors MAC and any vendors PHY and put
them together, if they have the same MII interface. Say this PHY does
support half duplex. And some other vendors MAC supports half
duplex. We want it to work.

	Andrew

