Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BA8C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7q5WRUhB8xv0RmSiXrjbZQTqBS/OimwrA3VM7RORVD0=; b=e0uV3RsBO/T5gfHYXRLbgw0KW/
	iLgOple9QCejSTWfL5959bvp4ToX42xqvuV+qSsZozzy2W1shCJFX7W2dyGPFKe/sYWHupqr+Mg++
	NIE3GrM9e4AeA8bAhOHmdPkArfvtmzDPvZT7XRnfz55KA/wR1S2u0QNqB7fayPaX7wcB0UVbcbKw8
	/tF4GoVKJgJbcw/COtLkFALVbPb943DoQSE8ixaowhXow/i007FKn/CS+yPiYTxl6JzKw4Z4+ehcd
	0QmSwFtdWWuIKWBxRSAc2ZNsNwzMdvm1luPIDdIJ2hMZ5T8SUx/JMLuuB9pXeFGUIdYJQzCFOcBFq
	OnL5JXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZs5S-004dOC-Os; Wed, 08 Mar 2023 11:36:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZs5O-004dMF-B3; Wed, 08 Mar 2023 11:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7q5WRUhB8xv0RmSiXrjbZQTqBS/OimwrA3VM7RORVD0=; b=AMlDmF0qS7/JM218n5xSc6B/il
	0fN2kNupiUXxRe+kzYu2XBBq403g9gC55gVLbJ/sN3USW+t3cMnbjVMv1cQxEBMuYjeiAPI8PhDtD
	lIYeO9dz7RVb4vkk7cu5AOr4RrSvza1Tikl2KyxdqvclclEP1pKICKtbtHcivpmP9idHEpaStDG31
	QXFsFdAJfWILtRrn4Z1dr009qSE8DUVGILTTUqq9JKpELdqm/W+u6Z+fwhim3k366hBAwodhKKTRE
	A5A7x75q3eKme2IVkQgndmFwAs/tm4/Ex79eraWChy7xrqv0uZIMR+qrTTdaiMLJVlvVomq8jymKb
	aaWjx07w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34522)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pZs5C-0002MJ-Ax; Wed, 08 Mar 2023 11:35:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pZs57-0002XC-0y; Wed, 08 Mar 2023 11:35:41 +0000
Date: Wed, 8 Mar 2023 11:35:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc: fix
 1000Base-X and 2500Base-X modes
Message-ID: <ZAhzDDjZ8+gxyo3V@shell.armlinux.org.uk>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <fd5c7ea79a7f84caac7d0b64b39fe5c4043edfa8.1678201958.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd5c7ea79a7f84caac7d0b64b39fe5c4043edfa8.1678201958.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_033558_406373_E2923C12 
X-CRM114-Status: GOOD (  16.46  )
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

On Tue, Mar 07, 2023 at 03:53:58PM +0000, Daniel Golle wrote:
> After conversion to phylink_pcs the 1000Base-X and 2500Base-X modes
> would work only after `ethtool -s eth1 autoneg off`.
> As ethtool autoneg and the ETHTOOL_LINK_MODE_Autoneg_BIT is supposed
> to control auto-negotiation on the external interface it doesn't make
> much sense to use it to control on-board SGMII auto-negotiation between
> MAC and PHY.
> Set correct values to really only enable SGMII auto-negotiation when
> actually operating in SGMII mode. For 1000Base-X and 2500Base-X mode,
> enable remote-fault detection only if in-band-status is enabled.
> This fixes using 1000Base-X and 2500Base-X SFPs on the BananaPi R3
> board and also makes it possible to use interface-mode-switching PHYs
> operating in either SGMII mode for 10M/100M/1000M or in 2500Base-X for
> 2500M mode on other boards.
> 
> Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

NAK.

There are PHYs out there which operate in SGMII mode but do not
exchange the SGMII 16-bit configuration word. The code implemented
here by me was explicitly to allow such a configuration to work,
which is defined as:

	SGMII *without* mode == inband

An example of this is the Broadcom 84881 PHY which can be found on
SFP modules.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

