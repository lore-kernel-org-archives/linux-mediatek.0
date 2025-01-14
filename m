Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841D7E77188
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZBQIV1rRjI0xYXaCOtBy163ScPwbEBWMDHXyIm/YjI=; b=hmMZittQLul7vuhXoKwnSZeIjc
	Tu2He99SwIb5yrFAaCoQqkPYZiWjMDchsZoXeTryHGEJNZEG5NamyZiCuTqrFOQU0rX0HR09etwas
	z+iojxZZ6kdlSXW9S0/jDL5UL0Eq8C3kstkzD9B5Qsm3NOFToXXPOLMMv0xbc4VB0sGWUvGWnYZBe
	88lvkjS7it4avZdg8kfXRdMNVCjryq96hcj1d9kLrV2joz6DrWEsZiOhXBQa4YZKBdB01L5DtsGeb
	R5Xb39CN7MtTMFRnhLQy2LyTbiueZn2iQ0V7WW8DTSd4CzEpWz9bvSEnxIgE4VujflC7eEd7xOSa6
	sKZbPPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeuL-00000008Drr-195n;
	Tue, 14 Jan 2025 11:16:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXet5-00000008Djt-1TK7;
	Tue, 14 Jan 2025 11:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JZBQIV1rRjI0xYXaCOtBy163ScPwbEBWMDHXyIm/YjI=; b=jM6R8gP4ktl0i842LQaaCmoj98
	6Ff1EZ9aNhz4IzmwA6RXLfKqZ9bwN+vaYZHmD8wxjrWoS/Onmro4a8iii2dLVgVAQ0hDnL69WjM8w
	PVqxKHPtT4k7gxC1dtM/u3ex9NcN7gqXCt4l3NBuHjY/QiueQ9hCNSC94uM89fABajHYWv9EIww54
	LYKaas5cyWh20ZG5V4NYuILSG8oZHLK2LBsWvuVykDq2HRO0zLTMdMu1CewCdOtxJr0LjSFWSqnKw
	1pq63da8L2iVNQgqmwem41MgHO1QPsxWroRJTPSk82toIc2nU2RL+M+JXlnVY1AWJtSM1FAiIPn5Q
	xhSc19VQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55932)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tXesa-0007xA-2e;
	Tue, 14 Jan 2025 11:14:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tXesS-00052V-1M;
	Tue, 14 Jan 2025 11:14:32 +0000
Date: Tue, 14 Jan 2025 11:14:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Alexander Couzens <lynxis@fe80.eu>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Golle <daniel@makrotopia.org>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>, kernel-team@meta.com,
	Lars Povlsen <lars.povlsen@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michal Simek <michal.simek@amd.com>, netdev@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Sean Anderson <sean.anderson@seco.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	UNGLinuxDriver@microchip.com, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next v2 0/5] net: phylink: fix PCS without autoneg
Message-ID: <Z4ZHGCu1G_26hd3n@shell.armlinux.org.uk>
References: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
 <Z4TbDnXtG8f3SRmC@shell.armlinux.org.uk>
 <29240b2d-8a34-47d6-8b99-a371668b0bef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29240b2d-8a34-47d6-8b99-a371668b0bef@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_031511_665035_A6760BBB 
X-CRM114-Status: GOOD (  32.31  )
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

On Tue, Jan 14, 2025 at 11:59:06AM +0100, Eric Woudstra wrote:
> On 1/13/25 10:21 AM, Russell King (Oracle) wrote:
> > Hi,
> > 
> > Eric Woudstra reported that a PCS attached using 2500base-X does not
> > see link when phylink is using in-band mode, but autoneg is disabled,
> > despite there being a valid 2500base-X signal being received. We have
> > these settings:
> > 
> > 	act_link_an_mode = MLO_AN_INBAND
> > 	pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED
> > 
> > Eric diagnosed it to phylink_decode_c37_word() setting state->link
> > false because the full-duplex bit isn't set in the non-existent link
> > partner advertisement word (which doesn't exist because in-band
> > autoneg is disabled!)
> > 
> > The test in phylink_mii_c22_pcs_decode_state() is supposed to catch
> > this state, but since we converted PCS to use neg_mode, testing the
> > Autoneg in the local advertisement is no longer sufficient - we need
> > to be looking at the neg_mode, which currently isn't provided.
> > 
> > We need to provide this via the .pcs_get_state() method, and this
> > will require modifying all PCS implementations to add the extra
> > argument to this method.
> > 
> > Patch 1 uses the PCS neg_mode in phylink_mac_pcs_get_state() to correct
> > the now obsolute usage of the Autoneg bit in the advertisement.
> > 
> > Patch 2 passes neg_mode into the .pcs_get_state() method, and updates
> > all users.
> > 
> > Patch 3 adds neg_mode as an argument to the various clause 22 state
> > decoder functions in phylink, modifying drivers to pass the neg_mode
> > through.
> > 
> > Patch 4 makes use of phylink_mii_c22_pcs_decode_state() rather than
> > using the Autoneg bit in the advertising field.
> > 
> > Patch 5 may be required for Eric's case - it ensures that we report
> > the correct state for interface types that we support only one set
> > of modes for when autoneg is disabled.
> > 
> > Changes in v2:
> > - Add test for NULL pcs in patch 1
> > 
> > I haven't added Eric's t-b because I used a different fix in patch 1.
> 
> So I tested this V2 patch and with the first link up command, I get the
> link up which is functional end to end.
> 
> Tested-by: Eric Woudstra <ericwouds@gmail.com>
> 
> PS, FYI: I do however still have the difference in phylink_mac_config().
> 
> At first the link is up with (before phy attached):
> phylink_mac_config: mode=inband/2500base-x
> 
> When the phy is attached, phylink_mac_config() is not called, but we
> have functional link.
> 
> When I do: ethtool -s eth1 advertise 0x28, then:
> phylink_mac_config: mode=inband/sgmii
> 
> And back again: ethtool -s eth1 advertise 0x800000000028, then:
> phylink_mac_config: mode=phy/2500base-x
> 
> I can share more log entries if needed.

I'm not worried - there's a sixth patch that I need to send once this
set of five are merged that will fix the above weirdness.

Thanks for testing.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

