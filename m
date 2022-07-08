Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 15:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwAMcwn2Isg9nprnVGjfIxmqURSxb3XCRKyIggaxxl8=; b=20VUPhm1SN2So2z6d35k1CZSu3
	wain6YYzHS8K7O5VByioX8HtdFsL+Zfwv6kYAK3y42qxpCwl1vBkmNlY3wHBTm7Rp1MnQzKBB3tUT
	41Gqp0SFr9V78TVxc92VZqbQ2eZjtrSaTXQvK62cF2+79Jr5SRms+QlWxRBpOvAOaRUkuX9RgXdyJ
	h+ZB0l0I+ARXV3THO4U5zkItVlxBgcjxvkIzvM9P5aogz4OyIDrc91CA+t9xniZVYa4XXcgg7kCRA
	fSKJ1/O+ALWvzzG6SRIAFjFg4vDu8rEdNZlKbjb9Yz6qDDHfdPSQMM+uVAg18hMVMXmWygT/xCVap
	wHOVCWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9q69-004QAy-Vv; Fri, 08 Jul 2022 15:40:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9q5z-004Q97-JX; Fri, 08 Jul 2022 15:40:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BB9460AD8;
	Fri,  8 Jul 2022 15:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77086C341C0;
	Fri,  8 Jul 2022 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657294839;
	bh=6kpdMMwsJsfME+iMyXa81KBrC41VyaHvmfjcm14ZZjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ParmWcwfwfpAs6ehbNmmTmtsnAcqSud+P9ebceiWVf+pEuVJC/dba1ApRob5njLrb
	 KrE/hbRRZ+w1o12IVB2gVKqCth1mmOXXiL4obCpzpwFTYsCHZyN9VeFeFCU4jMV32Y
	 ujP4jKIWeD3qbEGYakpjHDiP/tpec7XrSdRZNvIxuPeAOMFfy7fAWKuG/tvwOu39jI
	 9vOohCwGFopKjpIYrYmaNouS+9v7kN0B6i8+BSVenNQ3sbxwqd9HjG2V7MVSSkTZ8t
	 W2yHTIHxhW+XJn/GVN/OKBNIt3vI7pZ5eNgvHzRsb4GAAtb8jk5AVVhsjfFFuH5Bfn
	 ON0CPSF/K/bWQ==
Date: Fri, 8 Jul 2022 17:40:30 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alvin __ipraga <alsi@bang-olufsen.dk>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, "David S. Miller"
 <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet
 <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, George
 McCollister <george.mccollister@gmail.com>, Hauke Mehrtens
 <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach
 <kurt@linutronix.de>, Landen Chao <Landen.Chao@mediatek.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next 5/5] net: dsa: always use phylink for CPU
 and DSA ports
Message-ID: <20220708174030.700a87f5@thinkpad>
In-Reply-To: <YshMT3KP/B6BiEIg@shell.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
	<E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
	<20220706102621.hfubvn3wa6wlw735@skbuf>
	<YsW3KSeeQBiWQOz/@shell.armlinux.org.uk>
	<Ysaw56lKTtKMh84b@shell.armlinux.org.uk>
	<20220707152727.foxrd4gvqg3zb6il@skbuf>
	<YscAPP7mF3KEE1/p@shell.armlinux.org.uk>
	<20220707163831.cjj54a6ys5bceb22@skbuf>
	<YscUwrPnBZ3dzpQ/@shell.armlinux.org.uk>
	<20220707193753.2j67ni3or3bfkt6k@skbuf>
	<YshMT3KP/B6BiEIg@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_084043_764717_B66EEB32 
X-CRM114-Status: GOOD (  30.53  )
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

On Fri, 8 Jul 2022 16:25:03 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> Hi,
> 
> On Thu, Jul 07, 2022 at 10:37:53PM +0300, Vladimir Oltean wrote:
> > +static int dsa_port_fixup_broken_dt(struct dsa_port *dp)  
> 
> As I mentioned, I doubt that Andrew considers this "broken DT" as he's
> been promoting this as a standard DSA feature.
> 
> > +{
> > +	struct property_entry fixed_link_props[] = {
> > +		PROPERTY_ENTRY_BOOL("full-duplex"),
> > +		PROPERTY_ENTRY_U32("speed", 1000), /* TODO determine actual speed */
> > +		{},
> > +	};
> > +	struct property_entry port_props[3] = {};
> > +	struct fwnode_handle *fixed_link_fwnode;
> > +	struct fwnode_handle *new_port_fwnode;
> > +	struct device_node *dn = dp->dn;
> > +	phy_interface_t mode;
> > +	int err;
> > +
> > +	if (of_parse_phandle(dn, "phy-handle", 0) ||
> > +	    of_phy_is_fixed_link(dn))
> > +		/* Nothing broken, nothing to fix.
> > +		 * TODO: As discussed with Russell, maybe phylink could provide
> > +		 * a more comprehensive helper to determine what constitutes a
> > +		 * valid fwnode binding than this guerilla kludge.
> > +		 */
> > +		return 0;  
> 
> I think this is sufficient. Yes, phylink accepts "phy" and "phy-device"
> because it has to for compatibility with other drivers, but the binding
> document for DSA quite clearly states that "phy-handle" is what DSA
> accepts, so DT in the kernel will be validated against the yaml file
> and enforce correctness here.
> 
> We do need to check for "sfp" being present as well.
> 
> > +
> > +	err = of_get_phy_mode(dn, &mode);
> > +	if (err)
> > +		/* TODO this may be missing too, ask the driver for the
> > +		 * max-speed interface mode for this port
> > +		 */
> > +		mode = PHY_INTERFACE_MODE_NA;  
> 
> I think it would be easier to omit the phy-mode property in the swnode
> if it isn't present in DT, because then we can handle that in
> dsa_port_phylink_create() as I've done in my patch series via the
> ds->ops->phylink_get_caps() method.
> 
> > +
> > +	port_props[0] = PROPERTY_ENTRY_U32("reg", dp->index);  
> 
> You said in one of your other replies that this node we're constructing
> is only for phylink, do we need the "reg" property? phylink doesn't care
> about it.

We don't. Vladimir wrote: "We don't even need the "reg" u32 property, I
just added that for no reason (I wasn't completely sure what the API
offers, then I didn't remove it)."

Marek

