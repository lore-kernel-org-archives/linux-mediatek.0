Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD85C6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 23:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0L7vTZLcerwnAyoI0HVYfhsjcRF+aysJp1HB0AOdCV4=; b=RHWgXP5YPhE2+fjF+0c5puXQda
	LIpmQXm7RovY272IM2ztE+kA0+5UFmt3muNmF9KtZBPsQJhPEHD1hAEnYgkVB04CMp9ty6Ttl0HOZ
	Rhh46M/tKKwV4owm5Hof4zraTc2611y0HxiqdvCIoU1DW5J2y8u/p8EmEMn5nT8WBuRxckbenhCgg
	qMgNtVsISiHlUevPE1hYJr6FpCtA0lmJ6uoxQgImypRSPmoQuE/FO+H30lQG2nNe4g14u/rzx06YP
	RiZoQBRyS7LyKeUXNW/bJpC2CN1C1JOTc917DK/NmkXF4EewzmUhAYQrXShvxq8+DMCrwehq74x6r
	jKfEOWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbVaE-003qNL-P0; Sun, 12 Mar 2023 23:58:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbVa3-003qLH-UD; Sun, 12 Mar 2023 23:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0L7vTZLcerwnAyoI0HVYfhsjcRF+aysJp1HB0AOdCV4=; b=RigY3aTC9kT+QiKNzqRX38zVCH
	H9IyfEUEinWJxoVVOnQL7KViGfh7ztg4ru5NXEGuXPJCagcFhLsCPgYkFt0Kq4kJQ3Kjrxr03MMdr
	rJAatoXBJw2VG1GfOT1bgchjypQ3DpfV21hmdBXDLsOb6ziWbAAjef7IoVoF2hHdfhII=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pbVZI-0078fQ-FU; Mon, 13 Mar 2023 00:57:36 +0100
Date: Mon, 13 Mar 2023 00:57:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Michael Walle <michael@walle.cc>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-aspeed@lists.ozlabs.org,
	Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
Message-ID: <04d0bf49-452c-472c-add4-a0d5bd944476@lunn.ch>
References: <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
 <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
 <29ee3cc4-a1d6-4a07-8d90-4b2f26059e7d@lunn.ch>
 <0a1ec04fe494fcd8c68d03e4f544d7162c0e4f39.camel@gmail.com>
 <024b696003d8403d62c45411c813058684e0418c.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <024b696003d8403d62c45411c813058684e0418c.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_165824_015451_669E1E72 
X-CRM114-Status: GOOD (  18.14  )
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

On Sun, Mar 12, 2023 at 04:15:41PM +0100, Klaus Kudielka wrote:
> On Sun, 2023-03-12 at 10:04 +0100, Klaus Kudielka wrote:
> > On Sun, 2023-03-12 at 03:53 +0100, Andrew Lunn wrote:
> > > 
> > > Correct. But their also should not of been any noticeable slow down,
> > > because there should not be any additional scanning when everything is
> > > described in DT. And the move of the MDIO bus registration from probe
> > > to setup should actually make it faster than before.
> > > 
> > 
> > But then, why *do* I see such a big difference on the Omnia?
> > 
> > mdiobus_scan_bus_c45() takes:
> > ~2.7 seconds without phy_mask patch
> > ~0.2 seconds with phy_mask patch
> 
> Following up myself, the answer is in the call path
> mv88e6xxx_mdios_register()
> 	 -> mv88e6xxx_mdio_register()
> 		-> of_mdiobus_register()
> 
> A child node "mdio" would be needed for the scan to be limited by
> the device tree. And this one is *not* in armada-385-turris-omnia.dts.
> 
> My (incorrect) understanding was, the child node "ports" would trigger
> that behaviour.

Yes, of_mdiobus_register() calls mdiobus_register() if there is no
MDIO node in DT. And that will result in a full bus scan, limited by
phy_mask.

And for completeness, there is one additional case. When there is a DT
description, reg = <> is optional for a PHY. Most cases, it is used,
but if you have a board designs which can take different pin
compatible PHYs, the address of the PHY might not be known. After
probing PHYs which are listed in DT with reg properties, it will scan
the bus for additional PHYs and assign them to entries which do not
have reg properties.

	Andrew

