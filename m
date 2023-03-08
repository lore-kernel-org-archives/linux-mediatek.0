Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBACC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 12:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhNdaWMGnHpsHbouu9TN2KiAtJhNTYuRn4f1bUa2P2Y=; b=i3HvDBG55Lm2Ru3qSUNM1DcKhz
	pkN9iA4fRcDhGc9S4Lx2bP0bpWjrLw5vzz7Q52jWi7Ef51R9cL3GieXJz7lb3QcdJKF3mf5T87jP0
	t/yI5709VgieTpIE0UL45xTcecf668q5FwY8D+FECgPKicHy0ga6VxbLv2bmeQE2Gk37sRQuk/gOX
	upgXCXcamHRxBuIbAykzWYsT0Ez0izksZfK1Svqs6ZlJ0A3hzwrvLKfi16BK3R4lyJ+Qx6rLjQ4K8
	PhBTC1WYViF5u8R+zdphp5h0ZAf7c2D0XVu+UwNFcCu9j5LKpLhtVe8Tr6JSCp4eKm2juKYiymoOm
	3sIuIn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsYC-004ksj-Ui; Wed, 08 Mar 2023 12:05:44 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsY9-004kqe-9U; Wed, 08 Mar 2023 12:05:43 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pZsXr-00028P-0Q;
	Wed, 08 Mar 2023 13:05:23 +0100
Date: Wed, 8 Mar 2023 12:05:19 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org,
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
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Alexander Couzens <lynxis@fe80.eu>
Subject: Re: [PATCH net-next v12 09/18] net: ethernet: mtk_eth_soc: Fix link
 status for none-SGMII modes
Message-ID: <ZAh5/+erE6yYYl7B@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <1590fb0e69f6243ac6a961b16bf7ae7534f46949.1678201958.git.daniel@makrotopia.org>
 <ZAhzt5eIZiJUyVm7@shell.armlinux.org.uk>
 <B69026D7-E770-4168-B1CA-54E34D52C961@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B69026D7-E770-4168-B1CA-54E34D52C961@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_040541_355021_17AEF427 
X-CRM114-Status: GOOD (  21.22  )
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

On Wed, Mar 08, 2023 at 12:44:57PM +0100, Frank Wunderlich wrote:
> Am 8. März 2023 12:38:31 MEZ schrieb "Russell King (Oracle)" <linux@armlinux.org.uk>:
> >On Tue, Mar 07, 2023 at 03:54:11PM +0000, Daniel Golle wrote:
> >> Link partner advertised link modes are not reported by the SerDes
> >> hardware if not operating in SGMII mode. Hence we cannot use
> >> phylink_mii_c22_pcs_decode_state() in this case.
> >> Implement reporting link and an_complete only and use speed according to
> >> the interface mode.
> >> 
> >> Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")
> >> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >
> >This has been proven to work by Frank Wunderlich last October, so by
> >making this change, you will be regressing his setup.
> 
> Hi
> 
> My tests were done with 1 kind of 1g fibre sfp as i only have these atm...have ordered some 2g5 rj54 ones,but don't have them yet. I'm not sure if they are working with/without sgmii (1000base-X) and if they have builtin phy.
> 
> Daniel have a lot more of different SFPs and some (especially 2g5) were not working after our pcs change.

Exactly. 1 GBit/s SFPs with built-in PHY and using SGMII are working
fine before and after conversion to phylink_pcs. 1000Base-X and
2500Base-X PHYs and SFPs were broken after this.

The patch about (and the other one you already NACK'ed) fixes those
codepaths which were simply not used in Frank's setup.

> 
> >What are you testing against? Have you proven independently that the
> >link partner is indeed sending a valid advertisement for the LPA
> >register to be filled in?
> >

I have a ballpark of different SFPs and MediaTek boards with different
PHYs here and tried all of them.

I have no way to tell if the SFPs and PHYs which stopped working after
the phylink_pcs conversion are sending valid advertisement. The only
other boards with SFP slots I got here are RealTek-based switches, and
all I can say is that on an RTL8380 based 1G switch both, the SFP
modules containing a PHY and operating in SGMII mode as well as the
ones without a PHY exposed via i2c-mdio and operating in 1000Base-X
mode are working fine with that switch, with both, stock firmware and
OpenWrt running on it.

However, even should they not send valid advertisement, they are very
common parts and they were working before and not after the change to
phylink_pcs, for the reasons mentioned in the description of this
patch.

