Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C18C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 23:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kyP63A6YNg0G1IVMJwtPcv4L1839iXCvJyrsCZGqB8=; b=sOqPUeDV7quC3xXetaZ/hIAW7e
	/i+HZuL/8frAMsVPjRaw2l2AC6ro7GGPuTjuCmTIdFZhahUQAriFL2zjF/n4vW9BDSQk7ybMXsnpO
	Upt8QyBQPsu5TeGhXLUoSzS9ndeWtOo8woloIwvG+hI230L9eugBguWtvbXD9m3u66tY4pigU3TQX
	Yvqv1b4m8AWKDDDh5tgdsV57vQufJvh9JM6zS19qsCcxho/ZD1xxhCpJ3XFEdbtrItS39ZSLH3s70
	gWDSeMrOaT4uvSwbgM9KUE72RjdSiECs3jcsdlONMSOx4jHUz5Y3cKNyWJJVvUbOZMYtmsxLbLRn9
	m8QPBLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUTc-00B1BU-EU; Fri, 15 Jul 2022 23:12:04 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCTj2-00Al31-Pl; Fri, 15 Jul 2022 22:23:58 +0000
Received: by mail-ed1-x529.google.com with SMTP id v12so7970491edc.10;
        Fri, 15 Jul 2022 15:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6kyP63A6YNg0G1IVMJwtPcv4L1839iXCvJyrsCZGqB8=;
        b=fdyqHy/3iTbnC1sPrP7Hp8oJ0uMoLS3JbfC1v/oLCabznBIO10vj41lEA2bg5BqpJB
         cDfboqz03WqiQ0RDQm4kuUmo2Hk7gQAsIokBGDqO4VenXIX2xWIkco0SgjBjWeRTuU8R
         zPoBQ7HC0OXULPuKDVtIrn0bt79thP9sgXVlW9uJ0G84DztcvFac8fO5YUCmlj5FHjMn
         /+xuc/ij7LPTHejul9Duu/S+SobN3FbME5wOzmtFUJvY7/+Pu4yns/zccwsST3ncZWOH
         Sl5SToxw7rvwh7ZzXRjSGM78+aCBXnEljP/tUcYELUJrp/AZzQi97A4CoLzKDls5Sz4J
         z2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6kyP63A6YNg0G1IVMJwtPcv4L1839iXCvJyrsCZGqB8=;
        b=oJBDe1Z9XJ3TLZtnWVP7boW57bep6s164FDUtq2cGqRNKeXGPP8DxHzd1FPZs/XwHL
         Tc9hbPEVv6pOkNcn1ZgMWj5FxTzgNZZH8vBdz/zMdMGC3KQkpx5LtD/65cNHlK4yeMT0
         LZq9bpqcxjvgT6frAvpPmrdHqG1ctTwrpehBFabcSy2DXEqBwg+o9cPfRsMF2uRAOfHC
         CF70Hvrl/udbY2/pL3PtypnsN476UUTRww6z2FYUAG6OIS0P0RGNbsWYPaxobeySvWeS
         hHeTbKCII++e+aw1/aA1EL1QyWCgvTGCVt0PkGbopmi8ki1S7EBD5Y1aXDWh2WoFAL00
         psnA==
X-Gm-Message-State: AJIora92k1LoMQR+7bRS7mt1F4bTwrb6QLyDV3e1D4HqyqoJrN2r4cSm
	wK77EW9SjrmH7ofPOMjTLlI=
X-Google-Smtp-Source: AGRyM1vctgq7Q0+/Kox2lii2lZgmCb+tdIsaduZIvgRIz3b7pMtpATOM2+uPxS3vxya4bN/xLE1EPA==
X-Received: by 2002:a05:6402:d05:b0:435:b2a6:94eb with SMTP id eb5-20020a0564020d0500b00435b2a694ebmr21478601edb.87.1657923832960;
        Fri, 15 Jul 2022 15:23:52 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id ek9-20020a056402370900b0042de3d661d2sm3522220edb.1.2022.07.15.15.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 15:23:52 -0700 (PDT)
Date: Sat, 16 Jul 2022 01:23:48 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <20220715222348.okmeyd55o5u3gkyi@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <20220715172444.yins4kb2b6b35aql@skbuf>
 <YtHcpf4otJQS9hTO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtHcpf4otJQS9hTO@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_152356_894327_230AF9CA 
X-CRM114-Status: GOOD (  53.23  )
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

On Fri, Jul 15, 2022 at 10:31:17PM +0100, Russell King (Oracle) wrote:
> On Fri, Jul 15, 2022 at 08:24:44PM +0300, Vladimir Oltean wrote:
> > On Fri, Jul 15, 2022 at 05:01:37PM +0100, Russell King (Oracle) wrote:
> > > DSA port bindings allow for an optional phy interface mode. When an
> > > interface mode is not specified, DSA uses the NA interface mode type.
> > > 
> > > However, phylink needs to know the parameters of the link, and this
> > > will become especially important when using phylink for ports that
> > > are devoid of all properties except the required "reg" property, so
> > > that phylink can select the maximum supported link settings. Without
> > > knowing the interface mode, phylink can't truely know the maximum
> > > link speed.
> > > 
> > > Update the prototype for the phylink_get_caps method to allow drivers
> > > to report this information back to DSA, and update all DSA
> > > implementations function declarations to cater for this change. No
> > > code is added to the implementations.
> > > 
> > > Reviewed-by: Marek Behún <kabel@kernel.org>
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > (...)
> > > diff --git a/include/net/dsa.h b/include/net/dsa.h
> > > index b902b31bebce..7c6870d2c607 100644
> > > --- a/include/net/dsa.h
> > > +++ b/include/net/dsa.h
> > > @@ -852,7 +852,8 @@ struct dsa_switch_ops {
> > >  	 * PHYLINK integration
> > >  	 */
> > >  	void	(*phylink_get_caps)(struct dsa_switch *ds, int port,
> > > -				    struct phylink_config *config);
> > > +				    struct phylink_config *config,
> > > +				    phy_interface_t *default_interface);
> > 
> > I would prefer having a dedicated void (*port_max_speed_interface),
> > because the post-phylink DSA drivers (which are not few) will generally
> > not need to concern themselves with implementing this, and I don't want
> > driver writers to think they need to populate every parameter they see
> > in phylink_get_caps. So the new function needs to be documented
> > appropriately (specify who needs and who does not need to implement it,
> > on which ports it will be called, etc).
> > 
> > In addition, if we have a dedicated ds->ops->port_max_speed_interface(),
> > we can do a better job of avoiding breakage with this patch set, since
> > if DSA cannot find a valid phylink fwnode, AND there is no
> > port_max_speed_interface() callback for this driver, DSA can still
> > preserve the current logic of not putting the port down, and not
> > registering it with phylink. That can be accompanied by a dev_warn() to
> > state that the CPU/DSA port isn't registered with phylink, please
> > implement port_max_speed_interface() to address that.
> 
> To continue my previous email...
> 
> This is a great illustration why posting RFC series is a waste of time.
> This patch was posted as RFC on:
> 
> 24th June
> 29th June
> 5th July
> 13th July
> 
> Only when it's been posted today has there been a concern raised about
> the approach. So, what's the use of asking for comments if comments only
> come when patches are posted for merging. None what so ever. So, we've
> lost the last three weeks because I decided to "be kind" and post RFC.
> Total waste of effort.

Sorry, but I don't exactly have a reason to respond to this series earlier
than others more directly affected, even less so when it's an RFC.
My feedback is strictly from the point of view of the "other" drivers
who don't care about context-specific interpretations of the CPU port
OF node. For them it doesn't make sense to have "default_interface" an
argument of phylink_get_caps.

Also about the total waste of effort (or at least time), it's not at all
obvious to me that if I had provided more feedback earlier, this series
would have been done with even one day earlier, considering you've stated
at least twice that you're waiting for a reply from Andrew, which didn't come.

> 
> Now, on your point... the series posted on the 24th June was using
> the mv88e6xxx port_max_speed_interface() but discussion off the mailing
> list:
> 
> 20:19 < rmk> kabel: hmm, is mv88e6393x_port_max_speed_mode() correct?
> 20:20 < rmk> it seems to be suggesting to use PHY_INTERFACE_MODE_10GBASER for
>              port 9
> 09:50 < kabel> rmk: yes, 10gbase-r is correct for 6393x. But we need to add
>                exception for 6191x, as is done in chip.c function
>                mv88e6393x_phylink_get_caps()
> 09:51 < kabel> rmk: on 6191x only port 10 supports >1g speeds
> 11:51 < rmk> kabel: moving it into the get_caps function makes it easier to set
>              the default_interfaces for 6193x
> 14:20 < kabel> rmk: yes, get_caps doing it would be better
> 
> The problem is this - we call get_caps(), and we have to read registers
> to work out what the port supports. If we have a separate callback, then
> we need to re-read those registers to get the same information to report
> what the default interface should be.
> 
> Since almost all of the Marvell implementations the values for both the
> list of supported interfaces and the default interface both require
> reading a register and translating it to a phy_interface_t, and then
> setting the support mask, it seems logical to combine these two
> functioalities into one function.

In essence that doesn't mean much; DSA isn't Marvell only, but I'll give
it to you: if only the Marvell driver (and Broadcom later, I expect) is
going to add support for the context-specific interpretation of CPU port
OF nodes, then we may consider tailoring the implementation to their
hardware register layout details. In any case, my concern can be
addressed even if you insist on keeping the default interface as an
argument of phylink_get_caps. There just needs to be a lot more
documentation explaining who needs to populate that argument and why.

Also, perhaps more importantly, a real effort needs to be put to prevent
breakage for drivers that work without a phylink instance registered for
the CPU port, and also don't report the default interface. Practically
that just means not deleting the current logic, but making it one of 3
options.

fwnode is valid from phylink's perspective?
       /                             \
 yes  /                               \ no
     /                                 \
register with phylink         can we determine the link parameters to create
                                  a fixed-link software node?
                                       /                \                     \
                                 yes  /                  \  no                |
                                     /                    \                   | this is missing
                                    /                      \                  |
             create the software node and       don't put the port down,      |
             register with phylink              don't register with phylink   /


