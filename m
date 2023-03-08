Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589CFC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 12:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5VerW9E57a3AkDp3/3ZMYYrKq9pQbYM9N4W7z4rNw0=; b=TRMhQyi4DL/r00/iOvWu0sNRcs
	4ZwOVRno9P/O7vtWCniF/R3XY0F2Zfw3i5/t3HX/tTGyZtKEv2dNFpvOcSybhYWdTYJ3JqANHHE/0
	jdbhG3TwK/bKYcY7p30b48/IY55H91zx4GcVNbSK6xrC/xffYF5TCDgVNcC0wZhX4vK8f3AGFsZx8
	Dndp/2/4d4hI+6DBz6CGeYSq606Yk+Vjj86tLoQ1HnSYBEKrM4e/ytagEaXJbxAwlKAL6NdzqNkbW
	cFQRFoGJB0nrOjsAT62yB+iPnuhQD6Fe4gJ1ghw13JBRodUhGFOjwsWY5fNyv4cOLqxpxtMzq1K5P
	lpT+Ymlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZseI-004mK5-Ax; Wed, 08 Mar 2023 12:12:02 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZseF-004mJ0-V8; Wed, 08 Mar 2023 12:12:01 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pZse8-0002CF-0s;
	Wed, 08 Mar 2023 13:11:52 +0100
Date: Wed, 8 Mar 2023 12:11:48 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc: fix
 1000Base-X and 2500Base-X modes
Message-ID: <ZAh7hA4JuJm1b2M6@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <fd5c7ea79a7f84caac7d0b64b39fe5c4043edfa8.1678201958.git.daniel@makrotopia.org>
 <ZAhzDDjZ8+gxyo3V@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAhzDDjZ8+gxyo3V@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_041200_023181_E4A31028 
X-CRM114-Status: GOOD (  22.50  )
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

On Wed, Mar 08, 2023 at 11:35:40AM +0000, Russell King (Oracle) wrote:
> On Tue, Mar 07, 2023 at 03:53:58PM +0000, Daniel Golle wrote:
> > After conversion to phylink_pcs the 1000Base-X and 2500Base-X modes
> > would work only after `ethtool -s eth1 autoneg off`.
> > As ethtool autoneg and the ETHTOOL_LINK_MODE_Autoneg_BIT is supposed
> > to control auto-negotiation on the external interface it doesn't make
> > much sense to use it to control on-board SGMII auto-negotiation between
> > MAC and PHY.
> > Set correct values to really only enable SGMII auto-negotiation when
> > actually operating in SGMII mode. For 1000Base-X and 2500Base-X mode,
> > enable remote-fault detection only if in-band-status is enabled.
> > This fixes using 1000Base-X and 2500Base-X SFPs on the BananaPi R3
> > board and also makes it possible to use interface-mode-switching PHYs
> > operating in either SGMII mode for 10M/100M/1000M or in 2500Base-X for
> > 2500M mode on other boards.
> > 
> > Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> NAK.
> 
> There are PHYs out there which operate in SGMII mode but do not
> exchange the SGMII 16-bit configuration word. The code implemented
> here by me was explicitly to allow such a configuration to work,
> which is defined as:
> 
> 	SGMII *without* mode == inband
> 
> An example of this is the Broadcom 84881 PHY which can be found on
> SFP modules.

I also have multiple such 1000Base-T SFP modules here (finisar, AJYA),
and this change doesn't touch the codepaths relevant for those. They
are operating in SGMII mode, they have always been working fine.

What I'm trying to fix here is 1000Base-X and 2500Base-X mode which
has been broken by introducing ETHTOOL_LINK_MODE_Autoneg_BIT as the
deciding factor for in-band AN here.

Can you explain why ETHTOOL_LINK_MODE_Autoneg_BIT was used there in
first place? Is my understanding of this bit controlling autoneg on the
*external* interface rather than on the *system-side* interface wrong?

