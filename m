Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E7DC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTk5Foy8E+tCUQ0cWMimlnYtkL0vkhWmk8TsDTWMeC8=; b=e/+XyCDfpQfGvPV+kNZqVrgfrd
	J4NGU/4J0pEgirpk6T5M5djDBsfz/t8Tl7Xn0cAGCaINE2Svwb/OAZtEtXMsdJOUs4mBa5bCuwRLl
	hDp+vF1c+RPnsriS4hXSTeIua7GSueVwccNbldWfXWdRsZ1LsHfrDU6xeef+mRajQQ3Jp6fIlQbXJ
	5Sm7ojXms9+Zni1TWc0d8/E/qU1jSetg7Ao3qTLmWMbOkbhwVZsyEfy57TVzs8oUOmUv4vhCi/gFc
	OuHHz5XsyAh9po6JKi/HnUQqudTMUAIc2QxKbr+dFYDCVW8+ZDxiJLbmrwOlom+4uciYTjoGD+KjD
	uJxr7jSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCgCz-00FnpW-LB; Sat, 16 Jul 2022 11:43:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCgCo-00FnjM-8L; Sat, 16 Jul 2022 11:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RTk5Foy8E+tCUQ0cWMimlnYtkL0vkhWmk8TsDTWMeC8=; b=f/HbHajnnuuu5cMQOqk/oi8eX1
	qOVhHe1j5q3+4DIK+C32nmKNzJbXWnmJ2QRxiTOe+mPow+JmqB0y3cLGz6n1wsXuy9buwHrETAK5R
	nqdkBpuyVvu0iJloWMog764keS/pCHZ3xuhSgBQ8GQIszYv3k67qzHpe+shiFODA+tNvNuwQr6PXY
	HW23PPy5oe3yuxgxZ4sVA/U316zP5ED0MJ/SxmLfd63/ml7IU47PfgS7Gah70UR499TgSJ3kbtXNK
	3EyeqKWWp5NbWT6VWsTFezgae/puY8kEoEM/lFjIgOsI1+Z3P2QNtN4wpjA/L5Y+YwO5ELHQBexPT
	4V+BBDYQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33378)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oCgCN-0008GS-Ig; Sat, 16 Jul 2022 12:43:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oCgCK-0008Tf-Qp; Sat, 16 Jul 2022 12:43:00 +0100
Date: Sat, 16 Jul 2022 12:43:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
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
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 0/6] net: dsa: always use phylink
Message-ID: <YtKkRLD74tqoeBuR@shell.armlinux.org.uk>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <20220715171719.niqcrklpk4ittfvl@skbuf>
 <YtHVLGR0RQ6dWuBS@shell.armlinux.org.uk>
 <20220715160359.2e9dabfe@kernel.org>
 <20220716111551.64rjruz4q4g5uzee@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220716111551.64rjruz4q4g5uzee@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_044330_319744_A1C07352 
X-CRM114-Status: GOOD (  31.27  )
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

On Sat, Jul 16, 2022 at 02:15:51PM +0300, Vladimir Oltean wrote:
> On Fri, Jul 15, 2022 at 04:03:59PM -0700, Jakub Kicinski wrote:
> > On Fri, 15 Jul 2022 21:59:24 +0100 Russell King (Oracle) wrote:
> > > The only thing that delayed them was your eventual comments about
> > > re-working how it was being done. Yet again, posting the RFC series
> > > created very little in the way of feedback. I'm getting to the point
> > > of thinking its a waste of time posting RFC patches - it's counter
> > > productive. RFC means "request for comments" but it seems that many
> > > interpret it as "I can ignore it".
> > 
> > I'm afraid you are correct. Dave used to occasionally apply RFC patches
> > which kept reviewers on their toes a little bit (it kept me for sure).
> > These days patchwork automatically marks patches as RFC based on
> > the subject, tossing them out of "Action required" queue. So they are
> > extremely easy to ignore.
> > 
> > Perhaps an alternative way of posting would be to write "RFC only,
> > please don't apply" at the end of the cover letter. Maybe folks will 
> > at least get thru reading the cover letter then :S
> 
> Again, expressing complaints to me for responding late is misdirected
> frustration. The fact that I chose to leave my comments only when
> Russell gave up on waiting for feedback from Andrew doesn't mean I
> ignored his RFC patches, it just means I didn't want to add noise and
> ask for minor changes when it wasn't clear that this is the overall
> final direction that the series would follow. I still have preferences
> about the way in which this patch set gets accepted, and now seems like
> the proper moment to express them.

In the first RFC series I sent on the 24 June, I explicitly asked the
following questions:

Obvious questions:
1. Should phylink_get_caps() be augmented in this way, or should it be
   a separate method?

2. DSA has traditionally used "interface mode for the maximum supported
   speed on this port" where the interface mode is programmable (via
   its internal port_max_speed_mode() method) but this is only present
   for a few of the sub-drivers. Is reporting the current interface
   mode correct where this method is not implemented?

Obvious questions:
1. Should we be allowing half-duplex for this?
2. If we do allow half-duplex, should we prefer fastest speed over
   duplex setting, or should we prefer fastest full-duplex speed
   over any half-duplex?
3. How do we sanely switch DSA from its current behaviour to always
   using phylink for these ports without breakage - this is the
   difficult one, because it's not obvious which drivers have been
   coded to either work around this quirk of the DSA implementation.
   For example, if we start forcing the link down before calling
   dsa_port_phylink_create(), and we then fail to set max-fixed-link,
   then the CPU/DSA port is going to fail, and we're going to have
   lots of regressions.

I even stated: "Please look at the patches and make suggestions on how
we can proceed to clean up this quirk of DSA." and made no mention of
wanting something explicitly from Andrew.

Yet, none of those questions were answered.

So no, Jakub's comments are *not* misdirected at all. Go back and read
my June 24th RFC series yourself:

https://lore.kernel.org/all/YrWi5oBFn7vR15BH@shell.armlinux.org.uk/

I've *tried* my best to be kind and collaborative, but I've been
ignored. Now I'm hacked off. This could have been avoided by responding
to my explicit questions sooner, rather than at the -rc6/-rc7 stage of
the show.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

