Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16032C04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0EgRcxHPYVYNFfngVUMS5fl9BPyKfiAOc6TK4fQlus=; b=Lph7Ah5oP4Tsty11Fs5wc/ghft
	/DXaWV9UjgoJ8TrdvBxmGPQbnrbs3yMZ36RnDgCwHE3nMMd8yryr73HGJBWooZYp4mFAQ7I6olJwH
	jCWziY+NW/rrGA8gqXnZd9GqiAoKQdxYk0HtpIktpdEtrcVvJ+fAUxi89+fklQDTl4iT78gtsEMR+
	OX76ok9qLlR2vQCyKf0tO9mtHTGZQZElabgKGZj9mE2AsVxm81FyVt39WcCG/miOkg4u7A3RXpbpC
	IBFSEdNjSPZRKNpttUzmvtQvINTflmldUXNMN4gp2eiT5SiZj54c+RIqAlOgady4bszOAURYshuEP
	trxtQhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4gRG-0000000FRH9-3Ggq;
	Wed, 08 May 2024 12:30:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4gRD-0000000FRGZ-3wPW;
	Wed, 08 May 2024 12:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=G0EgRcxHPYVYNFfngVUMS5fl9BPyKfiAOc6TK4fQlus=; b=YsDzDW2A+bVrOGPszxwm4oD4pi
	CO2xvST/CSj+z8fQ2InMekf0lKYl0rOLSNpPabRc0iChULUg45TXtjH4aLhJ3C5vaTqfcSX7QLZu/
	x0TCY9uWV/xoOOSP0i1ui1oqWWRzq/5YpNWtL3V2Qs0hHij8xb/AoLiJ32yXWcE6Vvf0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s4gRB-00EwrQ-Dp; Wed, 08 May 2024 14:30:21 +0200
Date: Wed, 8 May 2024 14:30:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
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
Subject: Re: [PATCH 3/3] net: phy: mediatek: add support for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <577176af-9f6c-45f9-824f-2b4ca762b2f7@lunn.ch>
References: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
 <20240425023325.15586-4-SkyLake.Huang@mediatek.com>
 <ZiocBmBWiNnbeyGq@shell.armlinux.org.uk>
 <4ccd437ee744382a8483ffe71d06cd495dacec71.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ccd437ee744382a8483ffe71d06cd495dacec71.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_053024_005508_C899A0D4 
X-CRM114-Status: GOOD (  15.12  )
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

> > > +ret = request_firmware(&fw, MT7988_2P5GE_PMB, dev);
> > > +if (ret) {
> > > +dev_err(dev, "failed to load firmware: %s, ret: %d\n",
> > > +MT7988_2P5GE_PMB, ret);
> > > +return ret;
> > > +}
> > 
> > This will block for userspace while holding phydev->lock and the
> > RTNL.
> > That blocks much of the networking APIs, which is not a good idea. If
> > you have a number of these PHYs, then the RTNL will serialise the
> > loading of firmware.
> > 
> I'm not sure I really get this. MT7988's internal 2.5Gphy is built
> inside SoC. We won't have a number of these PHYs.

How long does firmware download take? If you are holding RTNL you are
blocking all other network configuration. How many Ethernets does this
device have? If it is just one, it is not too bad, but if there is a
built in switch, you cannot be configuring that switch at the same
time firmware download is happening...

     Andrew

