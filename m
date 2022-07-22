Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F56C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJ2grQYsWQt1a5bY+VLFiiM5x7sLXx/qzIGFC+yB3nE=; b=uWmPnIbOJhSwGvdGBVpzFk8mFr
	rt0zlUQkBL9zocKSE/Mq9EfrYD9kqV35YHLzmHrCK34IpxCMgAuBsq0zX4vpWy46Sb4WU57g+Cq7q
	GJ6H5743/Kz6xX7vBINcGd+qrO9Hr6DbxcR7HsffY/P8NR7nmOD+e8/NaED/y5+S0IwFGVNxvivSu
	JXQ/M+IbLdXHEVKhvz4feCtrKT+0JpizD3UAVhcLLSvQVu5+ve3HQUWU1NpOssTx2dvUMhsMFQfVG
	RNifbxRzbrA/lR+ky+q3S/mcFORPIA2QrVVOiBlZAy2D5fH6RFzhOo5b2eYA5BkGl2u0aujd5jDQP
	VrneoMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEs3e-004UC1-0J; Fri, 22 Jul 2022 12:47:06 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEs3A-004Tp2-8i; Fri, 22 Jul 2022 12:46:38 +0000
Received: by mail-ej1-x62a.google.com with SMTP id tk8so8382441ejc.7;
        Fri, 22 Jul 2022 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gJ2grQYsWQt1a5bY+VLFiiM5x7sLXx/qzIGFC+yB3nE=;
        b=OV/P1ZrkxvNmkeZu7pusmJO0k5DX7dAgihyV5eQaYeWX80clLefyxxlMhmf4+/m8zm
         xliG45OCR1JEJ6PO6EtiMqM+diyvf7QRP23l/Z+sF4JzUrOFrD5vezsDmmyV6cSMvxQN
         7l0/n/jNOAP0bpW9f1EPFHDEp1XugRz/T9awEnaXvF1xOyH1jg46VtrQenlq9OSpqu2T
         zlh4QnVY7bCx52luippeJjFrSFQvROX6+X+x02rV4Xrp+SnZHKhuPQQ8qpq0e66yQRob
         AEzrfqi2TPp3kapm8uidu6wT7ibA/rzmhG2kDRqgVoIgXkvi/RxDdPPk10u07VlDo42p
         K4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gJ2grQYsWQt1a5bY+VLFiiM5x7sLXx/qzIGFC+yB3nE=;
        b=iUkH9sOtrxOsVOJu+Jg7ZI+NQxbRMjQ/7vPTuih2aKlE8Oxubf3SKaI07gio5hMejv
         AS6m2LGfpNpx1V3AlkmLJNq6bGXyhL7AjYBH9tAtIzaQdoVQph2DRzzQvb5WMg9X81PF
         bo8qRHrOgwlt00dBbt/huyClqty4BG/U4gKq+0WYVCCYGuozEZ4jb8zD8vrrT9yhG4yF
         BiYFAhAkXdWJz1m5+QhF4RzW/1JmHOzaZNqNlvH75dSwgwTGcXSe62BIpTIY8YMbwAm8
         c46qiXBhjZauHMjFaYmyWF12+2xWTOOebUOvVsgmp6YoMHbhouOLb9dUsOMq7ZaHs845
         xHxA==
X-Gm-Message-State: AJIora+VoGFe8f+l2CCKd+fUtVCRLYh+FV2UY0wH224DKfOsiJ8LPSN6
	WIyEMzPQMuQMB8OvbHMO3FU=
X-Google-Smtp-Source: AGRyM1siYe7MyRSzlK7vjqVb1whZwTXl1qfni7bYMTYsG9T7YucIMfvlew+YWUwqhvPnGQ3c6V5dNw==
X-Received: by 2002:a17:907:271a:b0:72b:4ef4:2d8e with SMTP id w26-20020a170907271a00b0072b4ef42d8emr364503ejk.634.1658493993871;
        Fri, 22 Jul 2022 05:46:33 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id v17-20020a056402175100b0043bb69e1dcfsm2500710edx.85.2022.07.22.05.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 05:46:33 -0700 (PDT)
Date: Fri, 22 Jul 2022 15:46:29 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
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
Message-ID: <20220722124629.7y3p7nt6jmm5hecq@skbuf>
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
X-CRM114-CacheID: sfid-20220722_054636_405330_7D63D3C1 
X-CRM114-Status: GOOD (  72.84  )
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
> On Fri, Jul 22, 2022 at 01:52:38PM +0300, Vladimir Oltean wrote:
> > On Fri, Jul 22, 2022 at 09:28:08AM +0100, Russell King (Oracle) wrote:
> > > On Fri, Jul 22, 2022 at 12:36:45AM +0300, Vladimir Oltean wrote:
> > > > On Thu, Jul 21, 2022 at 10:14:00PM +0100, Russell King (Oracle) wrote:
> > > > > > > So currently we try to enable C37 AN in 2500base-x mode, although
> > > > > > > the standard says that it shouldn't be there, and it shouldn't be there
> > > > > > > presumably because they want it to work with C73 AN.
> > > > > > > 
> > > > > > > I don't know how to solve this issue. Maybe declare a new PHY interface
> > > > > > > mode constant, 2500base-x-no-c37-an ?
> > > > > > 
> > > > > > So this is essentially what I'm asking, and you didn't necessarily fully
> > > > > > answer. I take it that there exist Marvell switches which enable in-band
> > > > > > autoneg for 2500base-x and switches which don't, and managed = "in-band-status"
> > > > > > has nothing to do with that decision. Right?
> > > > > 
> > > > > I think we're getting a little too het up over this.
> > > > 
> > > > No, I think it's relevant to this patch set.
> > > > 
> > > > > We have 1000base-X where, when we're not using in-band-status, we don't
> > > > > use autoneg (some drivers that weren't caught in review annoyingly do
> > > > > still use autoneg, but they shouldn't). We ignore the ethtool autoneg
> > > > > bit.
> > > > > 
> > > > > We also have 1000base-X where we're using in-band-status, and we then
> > > > > respect the ethtool autoneg bit.
> > > > > 
> > > > > So, wouldn't it be logical if 2500base-X were implemented the same way,
> > > > > and on setups where 2500base-X does not support clause 37 AN, we
> > > > > clear the ethtool autoneg bit? If we have 2500base-X being used as the
> > > > > media link, surely this is the right behaviour?
> > > > 
> > > > The ethtool autoneg bit is only relevant when the PCS is the last thing
> > > > before the medium. But if the SERDES protocol connects the MAC to the PHY,
> > > > or the MAC to another MAC (such as the case here, CPU or DSA ports),
> > > > there won't be any ethtool bit to take into consideration, and that's
> > > > where my question is. Is there any expected correlation between enabling
> > > > in-band autoneg and the presence or absence of managed = "in-band-status"?
> > > 
> > > This topic is something I was looking at back in November 2021, trying
> > > to work out what the most sensible way of indicating to a PCS whether
> > > it should enable in-band or not:
> > > 
> > > http://git.armlinux.org.uk/cgit/linux-arm.git/commit/?h=net-queue&id=e4ea7d035e7e04e87dfd86702f59952e0cecc18d
> > > http://git.armlinux.org.uk/cgit/linux-arm.git/commit/?h=net-queue&id=e454bf101fa457dd5c2cea0b1aaab7ba33048089
> > > http://git.armlinux.org.uk/cgit/linux-arm.git/commit/?h=net-queue&id=e2c57490f205ae7c0e11fcf756675937f933be5e
> > > 
> > > The intention there was to move the decision about whether a PCS should
> > > enable autoneg out of the PCS and into phylink, but doing that one comes
> > > immediately on the problem of (e.g.) Marvell NETA/PP2 vs Lynx having
> > > different interpretations for 2500base-X. There are also a number of
> > > drivers that do not follow MLO_AN_INBAND-means-use-inband or not for
> > > things such as SGMII or 1000base-X.
> > > 
> > > This means we have no standard interpretation amongst phylink users
> > > about when in-band signalling should be enabled or disabled, which
> > > means moving that decision into phylink today isn't possible.
> > > 
> > > The only thing we could do is provide the PCS with an additional bit
> > > of information so it can make the decision - something like a boolean
> > > "pcs_connects_to_medium" flag, and keep the decision making in the
> > > PCS-specific code - sadly keeping the variability between different
> > > PCS implementations.
> > 
> > The way I understand what you're saying is that there is no guarantee
> > that the DSA master and CPU port will agree whether to use in-band
> > autoneg or not here (and implicitly, there is no guarantee that this
> > link will work):
> > 
> > 	&eth0 {
> > 		phy-mode = "2500base-x";
> > 		managed = "in-band-status";
> > 	};
> > 
> > 	&switch_cpu_port {
> > 		ethernet = <&eth0>;
> > 		phy-mode = "25000base-x";
> 
> I'll assume that 25000 is a typo.

typo.

> > 		managed = "in-band-status";
> > 	};
> 
> Today, there is no guarantee - because it depends on how people have
> chosen to implement 2500base-X, and whether the hardware requires the
> use of in-band AN or prohibits it. This is what happens when stuff
> isn't standardised - one ends up with differing implementations doing
> different things, and this has happened not _only_ at hardware level
> but also software level as well.
> 
> You have to also throw into this that various implementations also have
> an "AN bypass" flag, which means if they see what looks like a valid
> SERDES data stream, but do not see the AN data, after a certain timeout
> they allow the link to come up - and again, whether that is enabled or
> not is pot luck today.

Interesting. After the timeout expires, does the lane ever transition
back into the encoding required for AN mode, in case there appears at a
later time someone willing to negotiate?

> > similarly, there is a good chance that the DT description below might
> > result in a functional link:
> > 
> > 	&eth0 {
> > 		phy-mode = "2500base-x";
> > 		managed = "in-band-status";
> > 	};
> > 
> > 	&switch_cpu_port {
> > 		ethernet = <&eth0>;
> > 		phy-mode = "25000base-x";
> > 
> > 		fixed-link {
> > 			speed = <2500>;
> > 			full-duplex;
> > 		};
> > 	};
> > 
> > There is no expectation from either DT description to use in-band
> > autoneg or not.
> > 
> > The fact that of_phy_is_fixed_link() was made by Stas Sergeev to say
> > that a 'managed' link with the value != 'auto' is fixed prompted me to
> > study exactly what those changes were about.
> 
> From what I can see, there is no formal definition of "in-band-status"
> beyond what it says on the tin. The description in the DT binding
> specification, which is really where this should be formally documented,
> is totally lacking.
> 
> >     This patch introduces the new string property 'managed' that allows
> >     the user to set the management type explicitly.
> >     The supported values are:
> >     "auto" - default. Uses either MDIO or nothing, depending on the presence
> >     of the fixed-link node
> >     "in-band-status" - use in-band status
> 
> This, and how this is implemented by mvneta, is the best we have to go
> on for the meaning of this.
> 
> > This is why I am asking whether there is any formal definition of what
> > managed = "in-band-status" means. You've said it means about retrieving
> > link status from the PCS. What are you basing upon when you are saying that?
> 
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
> 
> Have a read through mvneta's code at this commit:
> 
> git show 2eecb2e04abb62ef8ea7b43e1a46bdb5b99d1bf8:drivers/net/ethernet/marvell/mvneta.c
> 
> specifically, mvneta_fixed_link_update() and mvneta_adjust_link().
> Note that when operating in in-band mode, there is actually no need
> for the configuration of MVNETA_GMAC_AUTONEG_CONFIG to be touched
> in any way since the values read from the MVNETA_GMAC_STATUS register
> indicate what parameters the MAC is actually using. (The speed,
> duplex, and pause bits in AUTONEG_CONFIG are ignored anyway if AN
> is enabled.)

I view this as just an implementation detail and not as something that
influences what managed = "in-band-status" is supposed to mean.

> I know this is rather wooly, but not everything is defined in black and
> white, and we need to do the best we can with the information that is
> available.

So mvneta at the stage of the commit you've mentioned calls
mvneta_set_autoneg() with the value of pp->use_inband_status. There is
then the exception to be made for the PCS being what's exposed to the
medium, and in that case, ethtool may also override the pp->use_inband_status
variable (which in turn affects the autoneg).

So if we take mvneta at this commit as the reference, what we learn is
that using in-band status essentially depends on using in-band autoneg
in the first place.

What is hard for me to comprehend is how we ever came to conclude that
for SERDES protocols where clause 37 is possible (2500base-x should be
part of this group), managed = "in-band-status" does not imply in-band
autoneg, considering the mvneta precedent.
And why would we essentially redefine its meaning by stating that no,
it is only about the status, not about the autoneg, even though the
status comes from the autoneg for these protocols.

There is a separate discussion to be had about SERDES protocols without
clause 37 AN (10GBase-R), I don't want to go there just yet, I want to
concentrate on what's similar to what mvneta originally supported.

