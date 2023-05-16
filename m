Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F25C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12oCxnsjDGRIi94hOFSo73JpXQEuM8yD/ulEikbT2L4=; b=sVSC8bUcPdlHKbuNTn/+NNIpbn
	JAYxbb8raxypuGbJNSXjKKwOhWWdqTAgf2ZVG4keiy5+0GC4XJc4Avpa3pFHDacwo+No6LY8TpyMs
	/Ti9kJD5fqHtQVooSXwCpajerY0Fmk3PF3symcSSkZdfCJKXI6xmI6T2Wbwvlnu5SHbYQJ589NJ6K
	/8FElVYWqUOSQhvlAG3PDb2/zDEQyVyUxlqRwV1xzVjQkox4WK6YruKtB2LXnPJh99vIBTw7KWC1S
	iEZAbK8yaNE0U7n7G/ZUDsgIV032cnmIDrENJnOdd0+DPJJYBc9QpCMqW5/NyhGkCVefLdeNQG6oN
	dk9VbHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pytCF-005dph-2W;
	Tue, 16 May 2023 11:50:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pytCB-005doa-2L;
	Tue, 16 May 2023 11:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=12oCxnsjDGRIi94hOFSo73JpXQEuM8yD/ulEikbT2L4=; b=tuwTkh+5w5+Qt2MPL0jAfyNZxg
	DWX0hQcDynjGyxGAzHbREit1U7MiRp8je4AjojwvfK7s9TJZa9Xg2DUAlpGMp7NaXJpSvN/46IQuS
	Yp7YOpdIouupc8LfTIbSxG2pvxGVwVqRZsNKDVsmvS/YQFn8jrDZqvzjc4rPl2sljF4u5sAR9L7jx
	dMQrhzkdiGF8W5w1z3UZ3qsv+YmJKrNr55c7y3DNyCTg9y67ip6RHyxOssInIQ440xlvY5pppOm0X
	qZ8K8RliQdmLz9UKNIahBBG58/PAAZERMFtrsFVksLl/J1feC/Ku/KQGmoumQ7XZngXU485rQ8YRG
	BYtONZZQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56526)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pytBf-0005fL-QL; Tue, 16 May 2023 12:49:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pytBY-0000me-Em; Tue, 16 May 2023 12:49:44 +0100
Date: Tue, 16 May 2023 12:49:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Marcin Wojtas <mw@semihalf.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC] Providing a helper for PCS inband negotiation
Message-ID: <ZGNt2MFeRolKGFck@shell.armlinux.org.uk>
References: <ZGIkGmyL8yL1q1zp@shell.armlinux.org.uk>
 <20230515195616.uwg62f7hw47mktfu@skbuf>
 <ZGKn8c2W1SI2CPq4@shell.armlinux.org.uk>
 <20230515220833.up43pd76zne2suy2@skbuf>
 <ZGLCAfbUjexCJ2+v@shell.armlinux.org.uk>
 <20230516090009.ssq3uedjl53kzsjr@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230516090009.ssq3uedjl53kzsjr@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_045023_910062_A793E036 
X-CRM114-Status: GOOD (  58.08  )
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

On Tue, May 16, 2023 at 12:00:09PM +0300, Vladimir Oltean wrote:
> On Tue, May 16, 2023 at 12:36:33AM +0100, Russell King (Oracle) wrote:
> > > Clause 73 negotiates the actual use of 10GBase-KR as a SERDES protocol
> > > through the copper backplane in favor of other "Base-K*" alternative
> > > link modes, so it's not quite proper to say that 10GBase-KR is a clause
> > > 73 using protocol.
> > 
> > I believe it is correct to state it as such, because:
> > 
> > 72.1: Table 72–1—Physical Layer clauses associated with the 10GBASE-KR PMD
> > 
> > 	73—Auto-Negotiation for Backplane Ethernet              Required
> > 
> > Essentially, 802.3 doesn't permit 10GBASE-KR without hardware support
> > for Clause 73 AN (but that AN doesn't have to be enabled by management
> > software.)
> 
> Just like clause 40 (PCS and PMA for 1000BASE-T) requires clause 28 AN
> to be supported. But, when the autoneg process begins, the use of
> 10GBase-KR as a protocol over the backplane link hasn't even been yet
> established, so I find it unnatural to speak of clause 73 autoneg as
> something that 10GBase-KR has.
> 
> The reason why I'm insisting on this is because to me, to treat clause
> 73 as an in-band autoneg process of 10GBase-KR sounds like a reversal of
> causality. The clause 73 link codeword has a Technology Ability field
> through which 10GBase-KR, 1GBase-KX etc are advertised as supported
> protocols. If C73 is an inband protocol of 10GBase-KR, what should the
> local PCS advertise for its Technology Ability? Only 10GBase-KR, because
> this is what is implied by treating it as an attribute of 10GBase-KR, no?

I'm not going to get hung up on this, because I don't regard the point
as being particularly important to this discussion. You are right that
Clause 73 AN selects whether e.g. 10GBASE-KR gets used, and I don't
disagree with that. We're just entering into what seems like a pointless
debate that eats up email bandwidth.

> But that would be a denatured way of negotiating - advertise a single
> link mode, take it or leave it. And what other inband autoneg protocols
> permit, say, starting from SGMII and ending in 1000Base-X? Clause 73
> can't be directly compared to what we currently mean by managed =
> "in-band-status".
> 
> Not only is C37 autoneg not directly comparable to C73, but they are not
> mutually exclusive, either. I would say they are more or less orthogonal.
> More below.
> 
> I don't believe that toggling clause 73 autoneg based on phylink_pcs_neg_mode()
> makes much sense.

I agree, which means phylink_pcs_neg_mode() needs to document this so
that people don't think it does - and that solves both of the issues
I was bringing up in my original email.

> > However, if we did want to extend this topic, then there are a number
> > of questions that really need to be asked is about the XPCS driver.
> > Such as - what does 1000BASE-KX, 10000BASE-KX4, 10000BASE-KR and
> > 2500BASE-X have to do with USXGMII, and why are there no copper
> > ethtool modes listed when a USXGMII link can definitely support
> > being connected to a copper PHY? (See xpcs_usxgmii_features[]).
> > 
> > Why does XPCS think that USXGMII uses Clause 73 AN? (see the first
> > entry in synopsys_xpcs_compat[].)
> 
> First, in principle USXGMII and clause 73 are not mutually exclusive.
> 
> It is possible to use clause 73 to advertise 10GBase-KR as a link mode,
> and that will give you link training for proper 3-tap electrical
> equalization over the copper backplane.
> 
> Then, once C73 AN/LT ended and 10GBase-KR has been established, is
> possible to configure the 10GBase-R PCS to enable C37 USXGMII to select
> the actual data rate via symbol replication, while the SERDES lane
> remains at 10GBaud. At least, the XPCS seems to permit enabling symbol
> replication in conjunction with 10GBase-KR.

My comments are against the driver as it stands today, not some
theoretical case that the hardware may support.

What I'm getting at is if the interface mode is
PHY_INTERFACE_MODE_USXGMII, then... okay... we _may_ wish to do
clause 73 negotiation advertising 10GBASE-KR and then do clause 73
for the USXGMII control word - but the driver doesn't do this as far
as I can see. If C73 AN is being used, it merely reads the C73
state and returns the resolution from that. Any speed information that
a USXGMII PHY passes back over the C37 inband signalling would be
ignored because there seems to be no provision for the USXGMII
inband signalling.

So I'm confused what the xpcs driver _actually_ does when USXGMII
mode is selected by PHY_INTERFACE_MODE_USXGMII, because looking at
the driver, it doesn't look like it's USXGMII at all.

> Then, there's the entire issue that the code, as it was originally
> introduced, is not the same as it is now. For example, this bit in
> xpcs_do_config():
> 
> 	switch (compat->an_mode) {
> 	case DW_AN_C73:
> 		if (phylink_autoneg_inband(mode)) {
> 			ret = xpcs_config_aneg_c73(xpcs, compat);
> 			if (ret)
> 				return ret;
> 		}
> 		break;
> 
> used to look at state->an_enabled rather than phylink_autoneg_inband().
> Through my idiocy, I inadvertently converted that in commit 11059740e616
> ("net: pcs: xpcs: convert to phylink_pcs_ops").

If we want to change that back to the old behaviour, that needs to
be:
		if (test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, advertising)) {
			...
		}
		break;

but that wouldn't ever have been sufficient, even when the code was
using an_enabled, because both of these reflect the user configuration.
(an_enabled was just a proxy for this Autoneg bit). I'm going to call
both of these an "AN indicator" in the question below.

Isn't it rather perverse that the driver configures AN if this AN
indicator is set, but then does nothing if it isn't?

> > xpcs_sgmii_features[] only mentions copper linkmodes, but as we know,
> > it's common for copper PHYs to also support fibre with an auto-
> > selection mechanism. So, 1000BASE-X is definitely possible if SGMII
> > is supported, so why isn't it listed.
> 
> Most likely explanation is that XPCS has never been paired up until now
> to such a PHY.

So it's probably safe to add ETHTOOL_LINK_MODE_1000baseX_Full_BIT
there - thanks.

> > As previously said, 1000BASE-X can be connected to a PHY that does
> > 1000BASE-T, so why does xpcs_1000basex_features[] not mention
> > 1000baseT_Full... there's probably more here as well.
> > 
> > Interestingly, xpcs_2500basex_features[] _does_ mention both
> > 2500BASE-X and 2500BASE-T, but I think that only does because I
> > happened to comment on it during a review.
> > 
> > I think xpcs is another can of worms, but is an easier can of worms
> > to solve than trying to sort out that "what's an ethernet PHY"
> > question we seem to be heading towards (which I think would be a
> > mammoth task, even back when phylink didn't exist, to sort out.)
> 
> I wasn't necessarily going to go all the way into "what's a PHY?".
> I just want to clarify some terms such that we can agree what is correct
> and what is not. I believe that much of what's currently in XPCS w.r.t.
> C73 is not correct, partly through initial intention and partly through
> blind conversions such as mine.

Right, that's probably why I'm having a hard time interpreting what
this driver is doing when it comes to these modes that makes use
clause 73.

As this is the only phylink-using implementation that involves clause
73 at present, I would like to ensure that there's a clear resolution
of the expected behaviour before we get further implementations, and
preferably document what's expected.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

