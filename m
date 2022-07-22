Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F13C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 21:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ul5HRwjM7WDUxRSXRBNR66kxi05F3aeIEeMEbXyF3k=; b=TIUlkvWCw/Jj3pwfH/pAUZve39
	MblN2Sthp/vTH4iMj/BabhCFCoG6ZJ1ytK1qfaYmbTi4P6la3jkm8knTH6Cr1Ee95YjU4lWUUYG+G
	zYOAc+EWXWSsielskJFz/CDrR8+aCiySSfMAaMBabHFiEJYBgtrkzRzKhrv1/aqLStuRZhZY0RKFh
	TbN3IuKuKb+NIy/wW27UZtsMsgbH5SIDYTBHCU1X/mi1k8tHIxr+FT6H0+IFJtUECjGlZ/H3dDtkW
	CPQ77JkDB6FIlw1raT3cXW/oC7HLNh1Eve+b7emz6/CDVf4ND4geAd+ixj6hio+sa4mKTty0pT2CW
	OZyoDd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0bi-00Bhce-Uk; Fri, 22 Jul 2022 21:54:50 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0bD-00BhMi-6p; Fri, 22 Jul 2022 21:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9ul5HRwjM7WDUxRSXRBNR66kxi05F3aeIEeMEbXyF3k=; b=PDN/3e30eHLs8BtaLZ0T8TMOyN
	N2HcfxKuYaTro4pIBdbot118lnyGcp4WCsIp6ajuJ6Re71SWmWgaYRfmrLC82jB15SXOQTPKLLYNs
	XsLQ0dEg5gllyf/TMUKfxhTKKM30CKfds4fGXZzIb8Jw2ZlT9Rxg6YRhqh0h3L/HVMKY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oF0ai-00BBNY-9v; Fri, 22 Jul 2022 23:53:48 +0200
Date: Fri, 22 Jul 2022 23:53:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
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
Message-ID: <YtscbCH923vA6E2T@lunn.ch>
References: <20220721182216.z4vdaj4zfb6w3emo@skbuf>
 <YtnBmFm8Jhokgp7Q@shell.armlinux.org.uk>
 <20220721213645.57ne2jf7f6try4ec@skbuf>
 <YtpfmF37FmfY6BV5@shell.armlinux.org.uk>
 <20220722105238.qhfq5myqa4ixkvy4@skbuf>
 <YtqNkSDLRDtuooy/@shell.armlinux.org.uk>
 <20220722124629.7y3p7nt6jmm5hecq@skbuf>
 <YtqjFKUTsH4CK0L+@shell.armlinux.org.uk>
 <20220722165600.lldukpdflv7cjp4j@skbuf>
 <YtsUhdg3a2rT3NJC@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtsUhdg3a2rT3NJC@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_145419_294891_2F06F9BF 
X-CRM114-Status: GOOD (  16.55  )
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

> I still don't understand your point - because you seem to be conflating
> two different things (at least as I understand it.)
> 
> We have this:
> 
> 		port@N {
> 			reg = <N>;
> 			label = "cpu";
> 			ethernet = <&ethX>;
> 		};
> 
> This specifies that the port operates at whatever interface mode and
> settings gives the maximum speed. There is no mention of a "managed"
> property, and therefore (Andrew, correct me if I'm wrong) in-band
> negotiation is not expected to be used.

I would actually say it is undefined if in-band is expected or
not. Pretty much everything is undefined, expect 'maximum speed'.

If you can choose between SGMII and 1000BaseX, GMII or RGMII, it is
not defined which you should pick. However generally, *MII and a
SERDES are mutually exclusive in hardware, except for the 6352 which
have some ports with both. The switches do have strapping pins which
can configure most ports into specific modes, which is probably want
most boards do, and the "maximum speed" probably does not in fact
adjust the port mode unless really required. It does however configure
the MAC to fixed speed. There is a degree of separation between the
MAC and the internal PHY/PCS. So the MAC could be fixed, and the PCS
is probably using its power up defaults which could be to perform
in-band signalling. And it is very likely the results from that in
band signalling is ignored by the MAC.

So this is all pretty fragile, but that is the way this has all
evolved over time for the mv88e6xxx driver. And so far, boards
continue to work, or at least, we are not going reports they are
broken. That however does not mean it will not all implode sometime in
the future, and we probably should be asking new submissions to always
use a fixed-link and a phy-mode, even if it is not strictly needed.

	Andrew

