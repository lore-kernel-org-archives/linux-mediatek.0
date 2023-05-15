Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0094C77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a+oLK/EjvW2iWa4CvVnKNi6T68qPXF5eHPAeQXKSvQ=; b=45g2ozt3oK7Vbq4dWe5S/yhJZ4
	GqLTKnLOKH5PwDmqGBGf5kaVXKLj8WUwWC8VKQ8JTwI7rfr3nMlfPAEpjtk0ojvyq4EjaO+kSkdG+
	RKFaXI0EECV8g1z1xhVSAL23PUMcMkpU3p08NT+H3rj9RttWFWC3S3FLxtl1UW3PtgZGXfOXOcBsK
	xEv4pPhlXyqkWmTLN2ZOeem52+drTzbbWfP2psqWnZ8JpF1Sdgu31kRyPjXRRPYhIghwLyaXymM7B
	ha8yIvsMi2yGHRzvQ9UdULYJe9t5FMWj8CxJ1nUInCUAWh2jfZ3v/T/R9TUkJ1OhB9zmcU6UjatbZ
	IdjBKHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyaED-002afm-1G;
	Mon, 15 May 2023 15:35:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyaE9-002aeF-3A;
	Mon, 15 May 2023 15:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8a+oLK/EjvW2iWa4CvVnKNi6T68qPXF5eHPAeQXKSvQ=; b=HGU6JtmhWszCAfdURqlW/Ut+66
	84hfuyjtPVc0MwUYbNBETFcAfz5NM3sIeqSEbFmEmGNNvk3dFGzJLjogP8wMWREs0etAtaMdhmewm
	eVB3ZrcO8d3CLxmquVIK+CrS92ER5HYC6ww+g+uoqGRBYqiImluxiC4kzdz5jaQ4iDt1Di0fqZKBe
	ru8cAs/vtn2Mr9fpOiEsLtOvHpTZXDV2GgAXjra2y9NOMRR3vTgDvwzfD8V37n6i5xEat0O+glzPX
	JGSGf6Toh6R6H9RaiXqOH9/EsOCgWMoGpewU/wbqrdHB1aQE0K5gpPeazG68DSGxo3CXk9EPM9nhq
	Le3hPnQw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35164)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pyaDg-0003ww-8S; Mon, 15 May 2023 16:34:40 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pyaDZ-0008Ic-Pp; Mon, 15 May 2023 16:34:33 +0100
Date: Mon, 15 May 2023 16:34:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
	UNGLinuxDriver@microchip.com, Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC] Providing a helper for PCS inband negotiation
Message-ID: <ZGJRCaR2gQqEt2+L@shell.armlinux.org.uk>
References: <ZGIkGmyL8yL1q1zp@shell.armlinux.org.uk>
 <9f7b1d6f-ca62-4c6c-9cd5-37726e7857b7@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f7b1d6f-ca62-4c6c-9cd5-37726e7857b7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_083510_024242_81C104B2 
X-CRM114-Status: GOOD (  19.52  )
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

On Mon, May 15, 2023 at 03:58:09PM +0200, Andrew Lunn wrote:
> > 2. XLGMII.. Looking at the XPCS driver, it's unclear whether Clause 73
> >    AN gets used for this. A quick scan of IEEE 802.3 suggests that
> >    XLGMII doesn't have any support for any inband signalling, and it's
> >    just an intermediary protocol between the MAC (more specifically the
> >    RS, but for the purposes of this I'll just refer to MAC) and the
> >    attached PCS, and any autonegotiation happens after the XLGMII link.
> 
> So isn't XLGMII then a generic PHY thing, not a phylink thing?

Honestly, I'm really not sure. It feels more like an internal-SoC
thing. See my last diagram why I think this.

> Or am i not correctly understanding how
> drivers/phy/marvell/phy-*-comphy.c and
> drivers/phy/microchip/*_serdev.c fit into the overall picture?

In the case of serdes-based protocols with an external PHY, the general
structure we have is:

------------------------------+
  SoC                         |
+-----+   +-----+  +--------+ |          +--------------+
| MAC +---+ PCS +--+ SERDES +------------+ Ethernet PHY +---- Media
+-----+   +-----+  +--------+ |    ^     +--------------+
------------------------------+    |
                                   |
PHY_INTERFACE_MODE_xxx has referred to this bit, and this is the bit
where inband can occur.

In the case of multi-rate implementations, there can be one of many
different PCS that can be placed there, and the SERDES handles
converting the data stream from the PCS into its appropriate
electrical form, essentially covering the PMA and PMD functions.
(That same SERDES block generally can also handle PCIe and SATA.)

In the case of non-serdes based protocols, then it's essentially the
same as the above, but with the PCS and SERDES blocks removed.

For Fibre based connections:

------------------------------+
  SoC                         |
+-----+   +-----+  +--------+ |
| MAC +---+ PCS +--+ SERDES +------------ Media
+-----+   +-----+  +--------+ |    ^
------------------------------+    |
                                   |
PHY_INTERFACE_MODE_xxx has referred to this bit, and 1000BASE-X runs
negotiation on this. 10GBASE-R also used for fibre has no negotiation,
but there's still the 10GBASE-R PCS and the 802.3 PMA/PMD are subsumed
by the SERDES block.

What I think seems to be the case with XPCS is:

------------------------------+
  SoC                         |
+-----+   +-----+  +--------+ |
| MAC +---+ PCS +--+ SERDES +----------- Media
+-----+ ^ +-----+  +--------+ |
--------|---------------------+
        |
PHY_INTERFACE_MODE_xxx seems to be referring to this bit. When clause 73
negotiation is used, that happens where I've stated "media" above, and
that's involved with negotiating backplane protocols e.g. 40GBASE-KR4,
40GBASE-CR4, 25GBASE-KR, 10GBASE-KR, 1000BASE-KX etc on the bit I've
called "Media" above.

However, we can also have this for a fibre link:

------------------------------+
  SoC                         |
+-----+   +-----+  +--------+ |
| MAC +---+ PCS +--+ SERDES +----------- Fibre
+-----+ ^ +-----+  +--------+ |    ^
--------|---------------------+    |
        |                          |
     XLGMII                    40GBASE-R

Given that in this case, we'd want PHY_INTERFACE_MODE_xxx to say
40GBASE-R, using the existing PHY_INTERFACE_MODE_xxx to specify at
where I've pointed XLGMII just makes things confused... but in the
case above with clause 73 negotiation, we wouldn't have a standard
PHY_INTERFACE_MODE_xxx specifier for the external "media" side
because that's dependent on the result of the negotiation.

So... this seems to be a right can of wriggly things.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

