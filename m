Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E3DC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLPlQqZjJSQKPGHb0YS9zkev/y0pH7c+d/jPKAb2GH0=; b=VRIb0X3IOYy+73Mfpogd1payQJ
	FXs4BmCTAe25Co9ghdpsVGc+BPN+Hh/R49h2mJvV+aBBpetgIdocXcs507tCBtxb406zlOK6ljPob
	OlUYcxsiZprqLxbYV6pNFroYBxtAZQ7sOlk9ua6ReQ8/i1YXtSEgPGM+dkpB/KrD5p5jYs6z1uUSs
	p72v2hQh2r+Mdol5tLnb1UyId+jRvqRSmjdRBhl8qFqLa8xD0IHmjiHYX0XVf+kHaWeaY5sTJbW2X
	EiQd3Y3V1WxGGabYpww/BgNHuhdFQbcqEWNndkYmxHQux7mtsplDZFpN1HTR2vrXnq0VpytS1NLf3
	GsKF4Ohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oErjy-004CfF-D4; Fri, 22 Jul 2022 12:26:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oErjn-004CWs-2k; Fri, 22 Jul 2022 12:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hLPlQqZjJSQKPGHb0YS9zkev/y0pH7c+d/jPKAb2GH0=; b=aHV48YqFzODg6AW7BnYTXUngA6
	A4CzQCHZUa7PCBWJAqn9/qZUswCxg2NFTSLVNlXveu4BFhM//PHYgDOTau48FkF94U+UizuPqg+d+
	ZYpgi8JvJviYRgIi/T91QWcebGk1s+3sUZHl+1fH3pC5sL5tUofEEGoxOv5qWOhFEdYsI6KfXUpx9
	PLzHbeG7KHDdk4EX8plu4ObvMZN4jCDCGGXIAkbQMi/rHr2Ea61TJ/0Rc/ircWq+4YABQ0TbGWC/y
	BcBqjncPFpH/1JCu1gJOEPuRRZaPxxyTF6MCtc2OHK6ZkhYLfla21orKl7O/l6K76pUcGCWBQ9/mV
	6o2RYmXw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oErji-005r5N-Te; Fri, 22 Jul 2022 12:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hLPlQqZjJSQKPGHb0YS9zkev/y0pH7c+d/jPKAb2GH0=; b=Eipa470pMb32q7EeATriUghX+/
	KITuXZ9S4vCLTY46DmqjDyGpM7vOaTX373ELSkiENYVCUbx37ijqPkd2wE1e8eoZ/NXZn+FVtqsz4
	5A2IXJfCRbSu4HpYZz1TJWAO/I1puYiooK+eEk4qyILtT2gAbRvdqAuK7BuODcMliMa/h6kELMlhy
	wIVeKCswUAQFHcWin+dBmP6pOsTdfWz2RcKi3eUrlLuied06chsOSAqrvqr18tEZk2V7nQqkCA3Ei
	o6d+sBhp7fmyprsdGAzuuaiZSBcNf0kpciA3v0JXXoXb2tvk2/APeeqctcks5LlC1MElSVoNmw11j
	u8LOPsqw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33510)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oErYE-0006sX-48; Fri, 22 Jul 2022 13:14:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oErY1-0005of-0U; Fri, 22 Jul 2022 13:14:25 +0100
Date: Fri, 22 Jul 2022 13:14:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <YtqUoOiiAez2Kmd5@shell.armlinux.org.uk>
References: <Ytlol8ApI6O2wy99@shell.armlinux.org.uk>
 <20220721151533.3zomvnfogshk5ze3@skbuf>
 <20220721192145.1f327b2a@dellmb>
 <20220721192145.1f327b2a@dellmb>
 <20220721182216.z4vdaj4zfb6w3emo@skbuf>
 <YtnBmFm8Jhokgp7Q@shell.armlinux.org.uk>
 <20220721213645.57ne2jf7f6try4ec@skbuf>
 <YtpfmF37FmfY6BV5@shell.armlinux.org.uk>
 <20220722105238.qhfq5myqa4ixkvy4@skbuf>
 <YtqNkSDLRDtuooy/@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtqNkSDLRDtuooy/@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_132631_137525_26D50FD7 
X-CRM114-Status: GOOD (  15.03  )
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

On Fri, Jul 22, 2022 at 12:44:17PM +0100, Russell King (Oracle) wrote:
> Given that this managed property was introduced for mvneta, mvneta's
> implementation of it is the best reference we have to work out what
> the intentions of it were beyond the commit text.
> 
> With in-band mode enabled, mvneta makes use of a fixed-link PHY, and
> updates the fixed-link PHY with the status from its GMAC block (which
> is the combined PCS+MAC).
> 
> So, when in-band mode is specified, the results from SGMII or 1000base-X
> negotiation are read from the MAC side of the link, pushed into the
> fixed-PHY, which then are reflected back into the driver via the usual
> phylib adjust_link().

... and I should have said that this is exactly why in-band mode is
treated as a fixed-link, even though it's nothing of the sort. It makes
use of the infrastructure that was present at the time (fixed-phy) to
implement this feature of reading the link status from the PCS/MAC end
of the link.

It may not have been the best design, but it's an evolved design based
on the code that was available and what people thought at the time (and
pre-dates my involvement with mvneta in mainline.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

