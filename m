Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A994AC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th86onA+v2g7seSKwNaiqJkIXZJBTye47OvI+lvc2mU=; b=MVcGhxLXut1R/MvXGauoGYiQBy
	FUibubvVETpczdoft/Jm9aUbeYPHqlZW/XTf+jzX1d3DXooJ5Pv0D+y6+NRMRRoAqsSfIuYyn+RTM
	sg+tMNCe3ODDn0fwbq47IZYmE9eNddsvNce/f324HoxLeLDJm2+adPxhfFcqnp5uMayZKANbqImfz
	ronlE9dwwbxY/tsvkEerEgn5SpXeTnFQ5j0IvrMGbXuhN4miQu1vthcRI0TKaYjLR04Sw0wS1FpAZ
	YEGx8hlszrKIRgzcdHg910FLTT36PMiItjs45sXp/irO0+MsaQkoNbxaT8n3qLNV70Fm37ie3Hhws
	XK3WgtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCSui-00ASfk-FE; Fri, 15 Jul 2022 21:31:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCSuX-00ASYV-6Q; Fri, 15 Jul 2022 21:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=th86onA+v2g7seSKwNaiqJkIXZJBTye47OvI+lvc2mU=; b=QiuHDj8gvLUaAYVWuCRdkJng82
	yV5Qfgn1oiUkP0TfG7/m6IvkjBO9bJ1V2d1Sk+eYTM70zVUhXcW6OOY+q0s/yIgryKMV+fcnXKgqS
	CKbXdXPeKga6zKDiil62Opc+ICod4RBr4hkQXBOWsYgAn0Mp1QiQ/0ikP/2GgdRlWlKMKhwcw3qj9
	nSflYxlRY9FWgCm4KRM6ytSHb/M1s5zYJrS6bgOvwMz6P3DXe+kPaItHwahbx+895SSG2nlVkAD4h
	+zE+UrLs1d0PEB0u+U1Z3EwHJnFggwY1XPxjokxdjectbeW63iFWY5h/x9fTUub7NXjE5wZFwwFqg
	cpSlRdzA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33366)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oCSuB-0007YD-02; Fri, 15 Jul 2022 22:31:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oCSu5-0007sf-S7; Fri, 15 Jul 2022 22:31:17 +0100
Date: Fri, 15 Jul 2022 22:31:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <YtHcpf4otJQS9hTO@shell.armlinux.org.uk>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <20220715172444.yins4kb2b6b35aql@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220715172444.yins4kb2b6b35aql@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_143145_258808_9E4338F7 
X-CRM114-Status: GOOD (  38.58  )
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

On Fri, Jul 15, 2022 at 08:24:44PM +0300, Vladimir Oltean wrote:
> On Fri, Jul 15, 2022 at 05:01:37PM +0100, Russell King (Oracle) wrote:
> > DSA port bindings allow for an optional phy interface mode. When an
> > interface mode is not specified, DSA uses the NA interface mode type.
> > 
> > However, phylink needs to know the parameters of the link, and this
> > will become especially important when using phylink for ports that
> > are devoid of all properties except the required "reg" property, so
> > that phylink can select the maximum supported link settings. Without
> > knowing the interface mode, phylink can't truely know the maximum
> > link speed.
> > 
> > Update the prototype for the phylink_get_caps method to allow drivers
> > to report this information back to DSA, and update all DSA
> > implementations function declarations to cater for this change. No
> > code is added to the implementations.
> > 
> > Reviewed-by: Marek Behún <kabel@kernel.org>
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> (...)
> > diff --git a/include/net/dsa.h b/include/net/dsa.h
> > index b902b31bebce..7c6870d2c607 100644
> > --- a/include/net/dsa.h
> > +++ b/include/net/dsa.h
> > @@ -852,7 +852,8 @@ struct dsa_switch_ops {
> >  	 * PHYLINK integration
> >  	 */
> >  	void	(*phylink_get_caps)(struct dsa_switch *ds, int port,
> > -				    struct phylink_config *config);
> > +				    struct phylink_config *config,
> > +				    phy_interface_t *default_interface);
> 
> I would prefer having a dedicated void (*port_max_speed_interface),
> because the post-phylink DSA drivers (which are not few) will generally
> not need to concern themselves with implementing this, and I don't want
> driver writers to think they need to populate every parameter they see
> in phylink_get_caps. So the new function needs to be documented
> appropriately (specify who needs and who does not need to implement it,
> on which ports it will be called, etc).
> 
> In addition, if we have a dedicated ds->ops->port_max_speed_interface(),
> we can do a better job of avoiding breakage with this patch set, since
> if DSA cannot find a valid phylink fwnode, AND there is no
> port_max_speed_interface() callback for this driver, DSA can still
> preserve the current logic of not putting the port down, and not
> registering it with phylink. That can be accompanied by a dev_warn() to
> state that the CPU/DSA port isn't registered with phylink, please
> implement port_max_speed_interface() to address that.

To continue my previous email...

This is a great illustration why posting RFC series is a waste of time.
This patch was posted as RFC on:

24th June
29th June
5th July
13th July

Only when it's been posted today has there been a concern raised about
the approach. So, what's the use of asking for comments if comments only
come when patches are posted for merging. None what so ever. So, we've
lost the last three weeks because I decided to "be kind" and post RFC.
Total waste of effort.

Now, on your point... the series posted on the 24th June was using
the mv88e6xxx port_max_speed_interface() but discussion off the mailing
list:

20:19 < rmk> kabel: hmm, is mv88e6393x_port_max_speed_mode() correct?
20:20 < rmk> it seems to be suggesting to use PHY_INTERFACE_MODE_10GBASER for
             port 9
09:50 < kabel> rmk: yes, 10gbase-r is correct for 6393x. But we need to add
               exception for 6191x, as is done in chip.c function
               mv88e6393x_phylink_get_caps()
09:51 < kabel> rmk: on 6191x only port 10 supports >1g speeds
11:51 < rmk> kabel: moving it into the get_caps function makes it easier to set
             the default_interfaces for 6193x
14:20 < kabel> rmk: yes, get_caps doing it would be better

The problem is this - we call get_caps(), and we have to read registers
to work out what the port supports. If we have a separate callback, then
we need to re-read those registers to get the same information to report
what the default interface should be.

Since almost all of the Marvell implementations the values for both the
list of supported interfaces and the default interface both require
reading a register and translating it to a phy_interface_t, and then
setting the support mask, it seems logical to combine these two
functioalities into one function.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

