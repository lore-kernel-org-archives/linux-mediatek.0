Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B15FC6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 20:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5Btrknv2DSijXGinr7S2coEOTj1hSjKvflFzggiJJQ=; b=TTmOU6L9qLx7nkj9kqc7+Lyqk8
	JWy4SBNjDx/PNCcnF3m8E1DrrTOvlL00e1U2hO5g7sJHezI0ZBveODR7ZI0QHZL+vupI6vStju810
	JTuIM5jDsETcqGXWDmZWEwLgoYuVkmXlKiP8GMidurupwCHiHDL+FyIIvga0uc5y3tMJDSODOk5D8
	8u/Yod3ir3xITEpfEfH9Mo+ynqJwXaRLrXVdu6iWw+fY2ULzwFSzYhcuMY9BednvHK0syBsYfavv8
	mNXhM8qNDbSDWD33tqdw2Fyf/Q2GxbdidKyTe4A9dl4Ml7kZdmQiESvSZsnnz3eKGX6WnybirIZtm
	B8PgGhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbRxJ-003QFe-30; Sun, 12 Mar 2023 20:06:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbRxF-003QEx-H9; Sun, 12 Mar 2023 20:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n5Btrknv2DSijXGinr7S2coEOTj1hSjKvflFzggiJJQ=; b=hjStjPPgBBKEVZz+cuK8T85rq8
	SnRaNJRpF3ISCSv7GkpLK+dDd86+5z4Zvf21rdLPb/yr+4G9ETxbtztShtoxNDPr+zBnvBOpVwaov
	7JfG18X2wQDmJZZ6Xvcfz+bKqs+Uhr5U3xtePPakpjIzO7SwoT3nL4pMQBC2WAnzgGeR1F58ahc98
	pqCwzOEAGY+UMHKLWRFl/Xnbp+JZ+VLwgl4bNflJcL2OByDZ4XbMOlutEX0tsYzHpe4kgO3+65eIi
	OFzvqnQqdH3WhPKOYGaVgrlPBEj9/1wMVHKxHqsbxFGk2goQ6zsSS78fNVB+8Bqr/ExM4y9JiNpPd
	b9rp6GNg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57098)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pbRwz-0001r2-MI; Sun, 12 Mar 2023 20:05:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pbRwr-0006zg-A6; Sun, 12 Mar 2023 20:05:41 +0000
Date: Sun, 12 Mar 2023 20:05:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Alexander Couzens <lynxis@fe80.eu>
Subject: Re: Re: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc:
 fix 1000Base-X and 2500Base-X modes
Message-ID: <ZA4wlQ8P48aDhDly@shell.armlinux.org.uk>
References: <ZAiXvNT8EzHTmFPh@shell.armlinux.org.uk>
 <ZAiciK5fElvLXYQ9@makrotopia.org>
 <ZAijM91F18lWC80+@shell.armlinux.org.uk>
 <ZAik+I1Ei+grJdUQ@makrotopia.org>
 <ZAioqp21521NsttV@shell.armlinux.org.uk>
 <trinity-79e9f0b8-a267-4bf9-a3d4-1ec691eb5238-1678536337569@3c-app-gmx-bs24>
 <ZAzd1A0SAKZK0hF5@shell.armlinux.org.uk>
 <4B891976-C29E-4D98-B604-3AC4507D3661@public-files.de>
 <ZAzk71mTxgV/pRxC@shell.armlinux.org.uk>
 <trinity-8577978d-1c11-4f6d-ae11-aef37e8b78b0-1678624836722@3c-app-gmx-bap51>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <trinity-8577978d-1c11-4f6d-ae11-aef37e8b78b0-1678624836722@3c-app-gmx-bap51>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_130605_866225_945F1F0B 
X-CRM114-Status: GOOD (  21.08  )
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

On Sun, Mar 12, 2023 at 01:40:36PM +0100, Frank Wunderlich wrote:
> > Gesendet: Samstag, 11. März 2023 um 21:30 Uhr
> > Von: "Russell King (Oracle)" <linux@armlinux.org.uk>
> 
> > On Sat, Mar 11, 2023 at 09:21:47PM +0100, Frank Wunderlich wrote:
> > > Am 11. März 2023 21:00:20 MEZ schrieb "Russell King (Oracle)" <linux@armlinux.org.uk>:
> > > >On Sat, Mar 11, 2023 at 01:05:37PM +0100, Frank Wunderlich wrote:
> > > 
> > > >> i got the 2.5G copper sfps, and tried them...they work well with the v12 (including this patch), but not in v13... 
> > > 
> > > >> how can we add a quirk to support this?
> > > >
> > > >Why does it need a quirk?
> > > 
> > > To disable the inband-mode for this 2.5g copper
> > > sfp. But have not found a way to set a flag which i
> > > can grab in phylink.
> > 
> > We could make sfp_parse_support() set Autoneg, Pause, and Asym_Pause
> > in "modes" at the top of that function, and then use the SFP modes
> > quirk to clear the Autoneg bit for this SFP. Would that work for you?
> 
> i already tried this (without moving the autoneg/pause to sfp_parse_support):
> 
> static void sfp_quirk_disable_autoneg(const struct sfp_eeprom_id *id,
> 				unsigned long *modes,
> 				unsigned long *interfaces)
> {
> 	linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, modes);
> }
> 
> quirk was executed, but no change (no link on 2g5 sfp).

It won't have any effect on its own - because sfp_parse_support() does
this:

        if (bus->sfp_quirk && bus->sfp_quirk->modes)
                bus->sfp_quirk->modes(id, modes, interfaces);

        linkmode_or(support, support, modes);

        phylink_set(support, Autoneg);
        phylink_set(support, Pause);
        phylink_set(support, Asym_Pause);

Which means clearing Autoneg in "modes" via the modes SFP quirk will
have *absolutely* *no* *effect* what so ever.

The fact that you replied having *not* followed my suggestion and then
itimiating that it doesn't work is very frustrating.

> i guess you mean moving code handling the dt-property for inband-mode in phylink_parse_mode (phylink.c) to the sfp-function (drivers/net/phy/sfp-bus.c)

No.

[rest of email cut because I can't be bothered to read it after this]

Please try what I suggested. You might find that it works.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

