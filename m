Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B704C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 21:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFbCEPBOHnSBU2TwscGBeofUwfTOLPPGH/cmxmScFd8=; b=yPEuBhsvN+e+3U25foHQp6YlpA
	n1+DQZALTyxT3wSPvPiH+Wek60lnPhPNzoJS/9HFEEIZfM33DRNzqwripAli0ykIz9KqNUTCVhCA1
	9D1yUJVdNbIdbUFtIMpM754MbYpzOTY/n+6ZLNYoNhW/eWWZNARnDW9gx//2JWSDoPn98/B8MT+Nk
	cwfsAiTtNbSgVqXhjroPlwkH6/mQ6TveGYV8QGcRDpLH602mPF/PW5W20LoDLBmQNo1Ub8M/ikFOd
	iszmtXS0LPYCr8aMrKSnSmF9VdYFzdq53pOmxAArUXxVEAUJF/kYJ/MdMheGTwIhphaiTIzPYzprd
	Pko5XJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEdVJ-00CNf6-6j; Thu, 21 Jul 2022 21:14:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEdV8-00CNdh-CT; Thu, 21 Jul 2022 21:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FFbCEPBOHnSBU2TwscGBeofUwfTOLPPGH/cmxmScFd8=; b=XuLpIw5DPgHkBq8N2bzBQQtZ94
	il+Bs5DSBePM7bbHFhRoBs+RFLuNAHN4ZrEdW2Vp/usythQiNA4gBty4DnEn01vnefznJt/4OiE/p
	YOEdp8BARa46zytpKAm0QVIyBX/VMNmXOQmSbq2XHv9hrxKzqyQBV20Z3mkrNcWv5GhCywLC+GJdk
	9ntvyewVbdOzvedaRez3naMXqQGcRQQdoiTACn8RTOkNbL+NswKmTwStk24jToFIVb3nfXOZunoZx
	TJcXdlMzjejQ6arHSyrjl2EAeuaruW+ie9CBuHgC/Jhb5CwOsVa9/EiLRVjCqIEyd/d0fUuMUoaWe
	PAaaMJng==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33494)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oEdUj-00060R-PX; Thu, 21 Jul 2022 22:14:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oEdUf-0005Aj-0b; Thu, 21 Jul 2022 22:14:01 +0100
Date: Thu, 21 Jul 2022 22:14:00 +0100
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
Message-ID: <YtnBmFm8Jhokgp7Q@shell.armlinux.org.uk>
References: <YtKdcxupT+INVAhR@shell.armlinux.org.uk>
 <20220716123608.chdzbvpinso546oh@skbuf>
 <YtUec3GTWTC59sky@shell.armlinux.org.uk>
 <20220720224447.ygoto4av7odsy2tj@skbuf>
 <20220721134618.axq3hmtckrumpoy6@skbuf>
 <Ytlol8ApI6O2wy99@shell.armlinux.org.uk>
 <20220721151533.3zomvnfogshk5ze3@skbuf>
 <20220721192145.1f327b2a@dellmb>
 <20220721192145.1f327b2a@dellmb>
 <20220721182216.z4vdaj4zfb6w3emo@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220721182216.z4vdaj4zfb6w3emo@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_141430_447392_1EBF9DD0 
X-CRM114-Status: GOOD (  26.72  )
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

On Thu, Jul 21, 2022 at 09:22:16PM +0300, Vladimir Oltean wrote:
> On Thu, Jul 21, 2022 at 07:21:45PM +0200, Marek Behún wrote:
> > And then came 6373X switch, which didn't support clause 37 inband AN in
> > 2500base-x mode (the AN reigster returned 0xffff or something when
> > 2500base-x CMODE was set). Maybe 6373X finally supports clause 73 AN
> > (I don't know, but I don't think so) and that is the reason they now
> > forbid clause 37 AN in HW in 2500base-x.
> > 
> > But the problem is that by this time there is software out there then
> > expects 2500base-x to have clause 37 AN enabled. Indeed a passive SFP
> > cable did not work between MOX' SFP port and CN9130-CRB's SFP port
> > when used with Peridot (6190), if C37 AN was disabled on 6393x and left
> > enabled on Peridot.
> > 
> > I managed to work out how to enable C37 AN on 6393x:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=163000dbc772c1eae9bdfe7c8fe30155db1efd74
> > 
> > So currently we try to enable C37 AN in 2500base-x mode, although
> > the standard says that it shouldn't be there, and it shouldn't be there
> > presumably because they want it to work with C73 AN.
> > 
> > I don't know how to solve this issue. Maybe declare a new PHY interface
> > mode constant, 2500base-x-no-c37-an ?
> 
> So this is essentially what I'm asking, and you didn't necessarily fully
> answer. I take it that there exist Marvell switches which enable in-band
> autoneg for 2500base-x and switches which don't, and managed = "in-band-status"
> has nothing to do with that decision. Right?

I think we're getting a little too het up over this.

We have 1000base-X where, when we're not using in-band-status, we don't
use autoneg (some drivers that weren't caught in review annoyingly do
still use autoneg, but they shouldn't). We ignore the ethtool autoneg
bit.

We also have 1000base-X where we're using in-band-status, and we then
respect the ethtool autoneg bit.

So, wouldn't it be logical if 2500base-X were implemented the same way,
and on setups where 2500base-X does not support clause 37 AN, we
clear the ethtool autoneg bit? If we have 2500base-X being used as the
media link, surely this is the right behaviour?

(This has implications for the rate adaption case, since the 2500base-X
link is not the media, and therefore the state of the autoneg bit
shouldn't apply to the 2500base-X link.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

