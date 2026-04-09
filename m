Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFA1F364BA
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2026 20:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhGdKzOEL11uFQSxLNs263vDqYeHMHkZUyHiLvnxt74=; b=OoW4EdcYPN1M91r+Nksjn8B0Bi
	YtSismNd8JgIynSTogywCwKlTAWvMZyBDLhU6ahZ9zNVAqH7KWDH3Z/9+Sy2/7e5hUhKcHjC7P2Xg
	Rp47IGd9SH3orw2yCWDNKjX8DQQm+9OaWiebxSPBkgnhPnjtGAVeBRI4GOcpB8Z2QTgszV56QE+XM
	rf1v4+NsF/xurTOb3CEG0nnHiBiBuYlUIt9Xo8QSU0cOisOWGOAadD/Hp5C9mnJn84vPa8wp5sBnE
	7itZalii0Gm6sbbYOR3DFgOyqPZes/EQ9fK8hJByLmk1+BfR4bUfAbJizOhCLZASmAeHe13VkH/pe
	yGLKjcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwQF-0000000BCRt-2kvL;
	Thu, 09 Apr 2026 20:56:19 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwQD-0000000BCRQ-1tIG;
	Thu, 09 Apr 2026 20:56:18 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wAwPv-000000004sK-1ih8;
	Thu, 09 Apr 2026 20:55:59 +0000
Date: Thu, 9 Apr 2026 21:55:56 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [RFC net PATCH v1] net: pcs: pcs-mtk-lynxi: fix bpi-r3 serdes
 configuration
Message-ID: <adgSXDUn-oL6V_TK@makrotopia.org>
References: <20260409133344.129620-1-linux@fw-web.de>
 <20260409164942.wbmwtkpd5d5zibyy@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260409164942.wbmwtkpd5d5zibyy@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_135617_490547_0CA0F37D 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, "Chester A. Unal" <chester.a.unal@arinc9.com>, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Felix Fietkau <nbd@nbd.name>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 09, 2026 at 07:49:42PM +0300, Vladimir Oltean wrote:
> I notice Arınc, listed by ./scripts/get_maintainer.pl drivers/net/dsa/mt7530.c,
> and Felix, listed by ./scripts/get_maintainer.pl drivers/net/ethernet/mediatek/mtk_eth_soc.c,
> are not on CC. Maybe they have more info.
> 
> Only the switch port has a chance of having a non-zero default polarity
> setting? (coming from the efuse, if I understood this discussion properly)
> https://lore.kernel.org/netdev/C59EED96-3973-4074-A4D8-C264949D447E@linux.dev/
> The GMAC doesn't?

Yes, vendor SDK uses DT mediatek,pnswap{,-rx,-tx} properties only for the
SoC GMACs. For MT7531 there are **no** strap pins deciding the SerDes
polarity, and also no software-way to override the defaults in the vendor
SDK.

However, the MT7531 datasheet quite clearly states:
Register 000050EC QPHY_WRAP_CTRL -- QPHY wrapper control
Reset value: 0x00000501

BIT 1 RX_BIT_POLARITY -- RX bit polarity control
 1'b0: normal
 1'b1: inverted

BIT 0 TX_BIT_POLARITY -- TX bit polarity control (TX default inversed in MT7531)
 1'b0: normal
 1'b1: inverted

Hence the best would be to just assume the documented default in the driver
as well.

A quick register dump using the BPi-R3 confirms that this applies to *both*
SerDes PCS on MT7531A (port 5 and port 6) equally, both read 0x00000501
after reset.

