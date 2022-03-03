Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D06EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylTLJ4uWWG5weeNASysgZQQ1UXr1YjFBOxrfyAf9y0s=; b=glDCrwwbgbY2ze
	FJ/RVr7mrpMdr6BumjToRbBitmdgi5q285R+BzvKzQt9uZte+hSCr3GXADThKRJjrd8bpwidl7ipw
	6dk0Wv1DIVBYGm+hLsIxjStnY1ZMo3kjbQgOLdokQcGUOJh/uCRIGncOK+b4NWqkYy5PlXaYJS3jb
	RBBmuiMa1uKXXfnidqBgUzmvjcFRkRH2hzuUkAaL7BjRQOFhUkHbcVGvVyGEDjsRRGrZa5+aP3rC/
	44CZ0rE1EhEp4iR/Iz2octmIqt1YjuP8BvyzqvxtKjs0NkrJt7JVkOd8WcJfaiiGAKSwPjYM/VZpc
	hspdUJ4f1D/3GFvcgnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPhf1-005sEP-27; Thu, 03 Mar 2022 09:22:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPhen-005s73-H1; Thu, 03 Mar 2022 09:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wSfdxgMpexvaGq5XM+GJJwov6imXd8ZNqL+4cMK4gH4=; b=WORL/jVuE4m+eQQjEWaLim2oiq
 +SqFjnrVRRX9M+YqfASgcFm0LHV3Y43/z2Wa+rumbYEEHTvNL3GO77wTX+RI5FZmU7LAJ/dzf/LUx
 POiME4aXd/GE+XLqk4r2AmHeYHIzsg90DrtcPiDg6Rmz6cWjq98MrA+pVrH/76ck7RxNAfygy+DEw
 vBiTp6upchf8BQy3dGqeAN55BePtKZWSyo1osrCVokUH3CiFcY0UwbLllrnxo/B7TM8uJ9aBJ+NI2
 IT1HO0dTinm6N4JiqqRvBMu3I5s1b7KaE3raWxrpvXM81Dhh4ywmq5nePGYdd9ABK7MUE1kIrgyZJ
 uyIFcmNQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57604)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nPheX-0003Gm-6m; Thu, 03 Mar 2022 09:21:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nPheU-0000ax-3n; Thu, 03 Mar 2022 09:21:38 +0000
Date: Thu, 3 Mar 2022 09:21:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next v2 0/7] net: dsa: mt7530: updates for
 phylink changes
Message-ID: <YiCIoh0bhWe9xnjm@shell.armlinux.org.uk>
References: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_012158_527086_BDF728AC 
X-CRM114-Status: GOOD (  21.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 23, 2022 at 11:33:56AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This revised series is a partial conversion of the mt7530 DSA driver to
> the modern phylink infrastructure. This driver has some exceptional
> cases which prevent - at the moment - its full conversion (particularly
> with the Autoneg bit) to using phylink_generic_validate().
> 
> Patch 1 fixes the incorrect test highlighted in the first RFC series.
> 
> Patch 2 fixes the incorrect assumption that RGMII is unable to support
> 1000BASE-X.
> 
> Patch 3 populates the supported_interfaces for each port
> 
> Patch 4 removes the interface checks that become unnecessary as a result
> of patch 3.
> 
> Patch 5 removes use of phylink_helper_basex_speed() which is no longer
> required by phylink.
> 
> Patch 6 becomes possible after patch 5, only indicating the ethtool
> modes that can be supported with a particular interface mode - this
> involves removing some modes and adding others as per phylink
> documentation.
> 
> Patch 7 switches the driver to use phylink_get_linkmodes(), which moves
> the driver as close as we can to phylink_generic_validate() due to the
> Autoneg bit issue mentioned above.
> 
> Patch 8 converts the driver to the phylink pcs support, removing a bunch
> of driver private indirected methods. We include TRGMII as a PCS even
> though strictly TRGMII does not have a PCS. This is convenient to allow
> the change in patch 9 to be made.
> 
> Patch 9 moves the special autoneg handling to the PCS validate method,
> which means we can convert the MAC side to the generic validator.
> 
> Patch 10 marks the driver as non-legacy.
> 
> Please review and test, thanks.
> 
>  drivers/net/dsa/mt7530.c | 330 +++++++++++++++++++++--------------------------
>  drivers/net/dsa/mt7530.h |  26 ++--
>  2 files changed, 159 insertions(+), 197 deletions(-)

Ping?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
