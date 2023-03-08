Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA8CC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 12:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxTVyA0v8n+ugEViShja2/nO02YnajTUleuPEutG1sQ=; b=NWfrumZEJusgUh5+UAxiBoHLL9
	kj1sdvgoleZZWKpHr32gMgQXoujQVUYmSVdDZF2usypQPfGA5o+lB3MOzb2mLfG75Cx/IEpaK/Olt
	ioUKGqeHreVKedvX3hjl7Rtj0iLwJdy6ya5FHL7daYY0uHT1ssxl7CC6tXGuy2dFcKomsWQZjzNNg
	FMd+LAabmgwoMWnfljjhsspCDtvJ0M/5Iz1P2ENrmhvh/3kXCGORLckt6k8WvK9oJTRKOBkaIytIS
	hvrpL+LLzJ30WP9Sgz5GepnBldXBaW0FI4g/Tlv11CWQ/az1QKmxYFD2k6q9pIq9in+Qm2MSjxs7O
	Qfs7B3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZt7F-004uEV-Ny; Wed, 08 Mar 2023 12:41:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZt7C-004uC2-Ka; Wed, 08 Mar 2023 12:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mxTVyA0v8n+ugEViShja2/nO02YnajTUleuPEutG1sQ=; b=T+w7GXVJVVPmscwBKGpRvQR8zj
	YVH7+/jayql7u5RcsbMj6+18P66imDJylWjpgFe7Sx9+qVt0KkNQijLdt/d38RBhhC4CA8BJr3ddq
	tj1GqkTnjmuvuCbxp2M0ocSpuJyd16xGRyY9HhuGZzIHhxq/FG3+iAEauQ40db/8ERt6MNs4sHez9
	y5BmlsgTiRE2JabGiY93BQ6SWDsX/YcYO4/VpG8vMsSTO2sBx+n/5i/7ae2I2z9MF/WeXE1o8bi4w
	lswaeNTgUvO9LsCiaIh0IPhx7fZ8uNAE0UaqCi6qA0TKFdjjMJGjn3ON0FtR/Z9UCUpw5TWq3TXRg
	BZuOvnVQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41488)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pZt74-0002Ux-Qt; Wed, 08 Mar 2023 12:41:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pZt71-0002ae-2L; Wed, 08 Mar 2023 12:41:43 +0000
Date: Wed, 8 Mar 2023 12:41:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc: fix
 1000Base-X and 2500Base-X modes
Message-ID: <ZAiCh8wkdTBT+6Id@shell.armlinux.org.uk>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <fd5c7ea79a7f84caac7d0b64b39fe5c4043edfa8.1678201958.git.daniel@makrotopia.org>
 <ZAhzDDjZ8+gxyo3V@shell.armlinux.org.uk>
 <ZAh7hA4JuJm1b2M6@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAh7hA4JuJm1b2M6@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_044154_695733_76CB4E74 
X-CRM114-Status: GOOD (  30.75  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jianhui Zhao <zhaojh329@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 08, 2023 at 12:11:48PM +0000, Daniel Golle wrote:
> On Wed, Mar 08, 2023 at 11:35:40AM +0000, Russell King (Oracle) wrote:
> > On Tue, Mar 07, 2023 at 03:53:58PM +0000, Daniel Golle wrote:
> > > After conversion to phylink_pcs the 1000Base-X and 2500Base-X modes
> > > would work only after `ethtool -s eth1 autoneg off`.
> > > As ethtool autoneg and the ETHTOOL_LINK_MODE_Autoneg_BIT is supposed
> > > to control auto-negotiation on the external interface it doesn't make
> > > much sense to use it to control on-board SGMII auto-negotiation between
> > > MAC and PHY.
> > > Set correct values to really only enable SGMII auto-negotiation when
> > > actually operating in SGMII mode. For 1000Base-X and 2500Base-X mode,
> > > enable remote-fault detection only if in-band-status is enabled.
> > > This fixes using 1000Base-X and 2500Base-X SFPs on the BananaPi R3
> > > board and also makes it possible to use interface-mode-switching PHYs
> > > operating in either SGMII mode for 10M/100M/1000M or in 2500Base-X for
> > > 2500M mode on other boards.
> > > 
> > > Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > 
> > NAK.
> > 
> > There are PHYs out there which operate in SGMII mode but do not
> > exchange the SGMII 16-bit configuration word. The code implemented
> > here by me was explicitly to allow such a configuration to work,
> > which is defined as:
> > 
> > 	SGMII *without* mode == inband
> > 
> > An example of this is the Broadcom 84881 PHY which can be found on
> > SFP modules.
> 
> I also have multiple such 1000Base-T SFP modules here (finisar, AJYA),
> and this change doesn't touch the codepaths relevant for those. They
> are operating in SGMII mode, they have always been working fine.
> 
> What I'm trying to fix here is 1000Base-X and 2500Base-X mode which
> has been broken by introducing ETHTOOL_LINK_MODE_Autoneg_BIT as the
> deciding factor for in-band AN here.

... which is correct.

> Can you explain why ETHTOOL_LINK_MODE_Autoneg_BIT was used there in
> first place? Is my understanding of this bit controlling autoneg on the
> *external* interface rather than on the *system-side* interface wrong?

Think about what 1000BASE-X is for. It's not really for internal links,
it's intended by IEEE 802.3 to be the 1G *media* side protocol for
1000BASE-SX, 1000BASE-LX, 1000BASE-CX etc links.

Therefore, when being used in that case, one may wish to disable
autoneg over the fibre link. Hence, turning off autoneg via ethtool
*should* turn off autoneg over the fibre link. So, using
ETHTOOL_LINK_MODE_Autoneg_BIT to gate 802.3z autonegotiation the
correct thing to do.

If we have a PHY using 1000BASE-X, then it is at odds with the
primary purpose of this protocol, especially with it comes to AN.
This is why phylink used to refuse to accept PHYs when using 802.3z
mode, but Marek wanted this to work, so relaxed the checks
preventing such a setup working.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

