Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0473EC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3r/yZfsG1+DpbR/nJJ84mozXnqngQpyIIxts7XzzVw=; b=ZdOr2ApPAedOB9jEVwRWQovN23
	pojXxRVQVAYLkziEqQsc5VGXitCJbkkA/Vo642jR0fTLa0j0NlQJY4o5RnEFyhYbXGvWTh05Ze2jZ
	RJc4j4ovZ/LCg1YShUF+AIxRjEwjzBBSp2AEmStacF/QioOT17CmMYr85lr3j/IxtdH1HhGz/RuZM
	LUwDQT2r4Z8hZQhSwEgPg6sHe2vSvMO+PMVyRkt/zeQBCLnAqYgsY+Ep8qDUlS6tnvCnYHEE9xOSh
	qp1uHwnTW1GfNn30mRwGbLFhETQZWG7o/36ge0JonX8ssRmL8Viu6WCb9eeGBaJq/NvBIn3GixiXW
	OTsrI06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtUQ-0052b1-8q; Wed, 08 Mar 2023 13:05:54 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtIX-004wNl-7c; Wed, 08 Mar 2023 12:53:38 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pZtIJ-0002Wu-1C;
	Wed, 08 Mar 2023 13:53:23 +0100
Date: Wed, 8 Mar 2023 12:53:13 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc: fix
 1000Base-X and 2500Base-X modes
Message-ID: <ZAiFOTRQI36nGo+w@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <fd5c7ea79a7f84caac7d0b64b39fe5c4043edfa8.1678201958.git.daniel@makrotopia.org>
 <ZAhzDDjZ8+gxyo3V@shell.armlinux.org.uk>
 <ZAh7hA4JuJm1b2M6@makrotopia.org>
 <ZAiCh8wkdTBT+6Id@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAiCh8wkdTBT+6Id@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_045337_297378_34211473 
X-CRM114-Status: GOOD (  38.15  )
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

On Wed, Mar 08, 2023 at 12:41:43PM +0000, Russell King (Oracle) wrote:
> On Wed, Mar 08, 2023 at 12:11:48PM +0000, Daniel Golle wrote:
> > On Wed, Mar 08, 2023 at 11:35:40AM +0000, Russell King (Oracle) wrote:
> > > On Tue, Mar 07, 2023 at 03:53:58PM +0000, Daniel Golle wrote:
> > > > After conversion to phylink_pcs the 1000Base-X and 2500Base-X modes
> > > > would work only after `ethtool -s eth1 autoneg off`.
> > > > As ethtool autoneg and the ETHTOOL_LINK_MODE_Autoneg_BIT is supposed
> > > > to control auto-negotiation on the external interface it doesn't make
> > > > much sense to use it to control on-board SGMII auto-negotiation between
> > > > MAC and PHY.
> > > > Set correct values to really only enable SGMII auto-negotiation when
> > > > actually operating in SGMII mode. For 1000Base-X and 2500Base-X mode,
> > > > enable remote-fault detection only if in-band-status is enabled.
> > > > This fixes using 1000Base-X and 2500Base-X SFPs on the BananaPi R3
> > > > board and also makes it possible to use interface-mode-switching PHYs
> > > > operating in either SGMII mode for 10M/100M/1000M or in 2500Base-X for
> > > > 2500M mode on other boards.
> > > > 
> > > > Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")
> > > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > 
> > > NAK.
> > > 
> > > There are PHYs out there which operate in SGMII mode but do not
> > > exchange the SGMII 16-bit configuration word. The code implemented
> > > here by me was explicitly to allow such a configuration to work,
> > > which is defined as:
> > > 
> > > 	SGMII *without* mode == inband
> > > 
> > > An example of this is the Broadcom 84881 PHY which can be found on
> > > SFP modules.
> > 
> > I also have multiple such 1000Base-T SFP modules here (finisar, AJYA),
> > and this change doesn't touch the codepaths relevant for those. They
> > are operating in SGMII mode, they have always been working fine.
> > 
> > What I'm trying to fix here is 1000Base-X and 2500Base-X mode which
> > has been broken by introducing ETHTOOL_LINK_MODE_Autoneg_BIT as the
> > deciding factor for in-band AN here.
> 
> ... which is correct.
> 
> > Can you explain why ETHTOOL_LINK_MODE_Autoneg_BIT was used there in
> > first place? Is my understanding of this bit controlling autoneg on the
> > *external* interface rather than on the *system-side* interface wrong?
> 
> Think about what 1000BASE-X is for. It's not really for internal links,
> it's intended by IEEE 802.3 to be the 1G *media* side protocol for
> 1000BASE-SX, 1000BASE-LX, 1000BASE-CX etc links.
> 
> Therefore, when being used in that case, one may wish to disable
> autoneg over the fibre link. Hence, turning off autoneg via ethtool
> *should* turn off autoneg over the fibre link. So, using
> ETHTOOL_LINK_MODE_Autoneg_BIT to gate 802.3z autonegotiation the
> correct thing to do.
> 
> If we have a PHY using 1000BASE-X, then it is at odds with the
> primary purpose of this protocol, especially with it comes to AN.
> This is why phylink used to refuse to accept PHYs when using 802.3z
> mode, but Marek wanted this to work, so relaxed the checks
> preventing such a setup working.

Sadly 2500Base-X is very commonly used to connect 2500Base-T-capable
PHYs or SFP modules. I also got an ATS branded 1000M/100M/10M copper
SFP module which uses 1000Base-X as system-side interface, independently
of the speed of the link partner on the TP interface.
All of them do not work with inband-AN enabled and a link only comes
up after `ethtool -s eth1 autoneg off` in the current implementation,
while previously they were working just fine.

I understand that there isn't really a good solution for 1000Base-X as
thanks to you I now understand that SerDes autoneg just transparently
ends up being autoneg on a fiber link.

2500Base-X, however, is hardly used for fiber links, but rather mostly
for 2500Base-T PHYs and SFP module as well as xPON SFPs. Maybe we could
at least have in-band AN disabled by default for those to get them
working without requiring the user to carry out ethtool settings?

