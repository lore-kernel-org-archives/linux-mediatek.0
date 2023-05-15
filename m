Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F29C7EE22
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 23:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmXYnPSRa86rlv1QxFxPjmsy9HOr11Bs6CnTJMRFWNk=; b=31rsEACOucnXqiX64svpzkjvdG
	vDfwSTFAVATTZcLv1CK43k85u8SVwTnKjuz6ERFJF2A79+6mPkjiofc9Lg1aLCUT+0za3hNLR+8AM
	Yeyzx+vurOM8Fo+2EIKS1Q6MUZqorKBkHjRcECkm3DkBmkZI1POLWBDCDfzo+dqRPuclprHEKSq34
	ZCxDgNnugkR5CmQi4L7yr7z4D417110aKqpESBhnS23Zy6RgNthi41eG1cBpdOS1XkGkXWv75kvWo
	7tpqMqw717LabCVMfCUwrP+3Br4Eyw5nkILowpHF3yiIHPgmkkcQz4az6Vu80iQ2PtoJ41H2W76uz
	ytGafHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyhkg-003nA9-2Z;
	Mon, 15 May 2023 23:37:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyhkc-003n8q-2M;
	Mon, 15 May 2023 23:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mmXYnPSRa86rlv1QxFxPjmsy9HOr11Bs6CnTJMRFWNk=; b=hktow+Y247a/xvs/ail8+nnKgk
	yxpFViJpD7cwUK5lQNz8CgppIrk5XTbSMp2KLGMfWlko8qFm96q+SvLY6MCwAoPzjc/6WjKy6+Pih
	NPahI4/73sh0qtBISFgoMrAGw29tjL/mPX2+MYc4Vlo6HTEKTaexHnWC3W+8Gcz5Wr4S0jPpGQAL+
	J0CNuOOCoiF3lfJ0zUGE4rR6acaW+shAgl6e0f+hXhkKTG57LPwsOt+HeXsUqAT/e6kpL5dsTWmHz
	kC5mIUkGcs0n4SvjVXggGSoiHPiGQyEAJg3E9KkCn8yPiBHseLm+HrYcbcfZHdrkSuslT0UfMZU7C
	c8ucYaUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53826)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pyhk7-0004l1-NG; Tue, 16 May 2023 00:36:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pyhk1-0000Bg-Ks; Tue, 16 May 2023 00:36:33 +0100
Date: Tue, 16 May 2023 00:36:33 +0100
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
Message-ID: <ZGLCAfbUjexCJ2+v@shell.armlinux.org.uk>
References: <ZGIkGmyL8yL1q1zp@shell.armlinux.org.uk>
 <20230515195616.uwg62f7hw47mktfu@skbuf>
 <ZGKn8c2W1SI2CPq4@shell.armlinux.org.uk>
 <20230515220833.up43pd76zne2suy2@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230515220833.up43pd76zne2suy2@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_163710_929688_0070FC73 
X-CRM114-Status: GOOD (  36.54  )
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

On Tue, May 16, 2023 at 01:08:33AM +0300, Vladimir Oltean wrote:
> On Mon, May 15, 2023 at 10:45:21PM +0100, Russell King (Oracle) wrote:
> > Clause 73.1:
> > 
> > So, my reading of these statements is that the _user_ should be
> > able to control via ethtool whether Clause 73 negotiation is
> > performed on a 10GBASE-KR (or any other backplane link that
> > uses clause 73 negotiation.) Having extracted that from 802.3,
> > I now believe it should be treated the same as 1000BASE-X, and
> > the Autoneg bit in ethtool should determine whether Clause 73
> > negotiation is used for 10GBASE-KR (and any other Clause 73
> > using protocol.)
> 
> Having said that copper backplane link modes should be treated "the
> same" as fiber link modes w.r.t. ethtool -s autoneg, it should also be
> said that there are significant differences between clause 37 and 73
> autoneg too.
> 
> Clause 73 negotiates the actual use of 10GBase-KR as a SERDES protocol
> through the copper backplane in favor of other "Base-K*" alternative
> link modes, so it's not quite proper to say that 10GBase-KR is a clause
> 73 using protocol.

I believe it is correct to state it as such, because:

72.1: Table 72–1—Physical Layer clauses associated with the 10GBASE-KR PMD

	73—Auto-Negotiation for Backplane Ethernet              Required

Essentially, 802.3 doesn't permit 10GBASE-KR without hardware support
for Clause 73 AN (but that AN doesn't have to be enabled by management
software.)

> To me, the goals of clause 73 autoneg are much more similar to those of
> the twisted pair autoneg process - clause 28, which similarly selects
> between different media side protocols in the PHY, using a priority
> resolution function. For those, we use phylib and the phy_device
> structure. What are the merits of using phylink_pcs for copper backplanes
> and not phylib?

I agree with you on that, because not only does that fit better with
our ethernet PHY model, but it also means PHY_INTERFACE_MODE_XLGMII
makes sense.

However, by that same token, 1000BASE-X should never have been a
PHY_INTERFACE_MODE_xxx, and this should also have been treated purely
as a PHY.

Taking that still further, this means SGMII, which is 1000BASE-X but
modified for Cisco's purposes, would effectively be a media converting
PHY sat between the MAC/RS and the "real" ethernet PHY. In this case,
PHY_INTERFACE_MODE_SGMII might make sense because the "real" ethernet
PHY needs to know that.

Then there's 1000BASE-X used to connect a "real" ethernet PHY to the
MAC/RS, which means 1000BASE-X can't really be any different from
SGMII.

This all makes the whole thing extremely muddy, but this deviates away
from the original topic, because we're now into a "what should we call
a PCS" vs "what should we call a PHY" discussion. Then we'll get into
a discussion about phylib, difficulties with net_device only being
able to have one phylib device, stacked PHYs, and phylib not being
able to cope with non-MDIO based devices that we find on embedded
platforms (some which don't even offer anything that approximates the
802.3 register set, so could never be a phylib driver.)

It even impacts on the DT description, since what does "managed =
"in-band-status";" mean if we start considering 1000base-X the same
way as 1000base-T and the "PHY" protocol for 1000base-X becomes GMII.
A GMII link has no inband AN, so "managed = "in-band-status";" at
that point makes no sense.

That is definitely a can of worms I do *not* want to open with this
discussion - and much of the above has a long history and considerably
pre-dates phylink.

My original question was more around: how do we decide what we
currently have as a PCS should use inband negotiation.

For SGMII and close relatives, and 1000BASE-X it's been obvious. For
2500BASE-X less so (due to vendors coming up with it before its been
standardised.)

We have implementations using this for other protocols, so it's
a question that needs answering for these other protocols.


However, if we did want to extend this topic, then there are a number
of questions that really need to be asked is about the XPCS driver.
Such as - what does 1000BASE-KX, 10000BASE-KX4, 10000BASE-KR and
2500BASE-X have to do with USXGMII, and why are there no copper
ethtool modes listed when a USXGMII link can definitely support
being connected to a copper PHY? (See xpcs_usxgmii_features[]).

Why does XPCS think that USXGMII uses Clause 73 AN? (see the first
entry in synopsys_xpcs_compat[].)

xpcs_sgmii_features[] only mentions copper linkmodes, but as we know,
it's common for copper PHYs to also support fibre with an auto-
selection mechanism. So, 1000BASE-X is definitely possible if SGMII
is supported, so why isn't it listed.

As previously said, 1000BASE-X can be connected to a PHY that does
1000BASE-T, so why does xpcs_1000basex_features[] not mention
1000baseT_Full... there's probably more here as well.

Interestingly, xpcs_2500basex_features[] _does_ mention both
2500BASE-X and 2500BASE-T, but I think that only does because I
happened to comment on it during a review.

I think xpcs is another can of worms, but is an easier can of worms
to solve than trying to sort out that "what's an ethernet PHY"
question we seem to be heading towards (which I think would be a
mammoth task, even back when phylink didn't exist, to sort out.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

