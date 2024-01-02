Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE015C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 12:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKt6waYkREQSl8TOEPwS+m4Ybyc4+NtjQUDV5bNbQWs=; b=OG6kYNGXC09WRwXdzbCQVe021K
	pfqHFAJ7lgjl/ZI5mUKZrppFTJ30yS+o9d5ipZq9gg6OY8z0k29JmWnaQnPrMYGUr4hr4MywBG+3L
	p1LYY9tIe7ojtylc4Uvs7qqrXQB1zIN5P/OEKeIEyOSIXupRtD/XxDaYgzPji/hb7wsJZ6/fMMuem
	HxsByEw4KMfZ25j9BxOZMPJf65kWpMdoKCOifiGlja3R1GEFV9PuX991E+xP8r9fs8PtqmWdv4km4
	VEeUDTvPx3WwXhfwZeDXeF2yWSjTj7xDhKZfK2YCd5ujWD6TmhCDCUvxva5vQq3zEX2pVblAx/eID
	Ph5TehhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKe0w-007zhw-1t;
	Tue, 02 Jan 2024 12:36:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKe0s-007zgW-19;
	Tue, 02 Jan 2024 12:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EKt6waYkREQSl8TOEPwS+m4Ybyc4+NtjQUDV5bNbQWs=; b=S0UnOMijCUX3JsRUr+wAE4YgUf
	eE9RQMlrBh1t9kmigzTWvhMhi71gOETUnZhO+58XxWphtoXyw3uthVlbhWzEuqXTEH/jKgMnD9XJl
	lmE+XNhJUHF4E+87DAc3z6ASZSw1QTFP9k1pURiHfE7GXVyX6QCvE5yYzFQFA03Pl1dvr00fH2EKx
	nBHnIgIodzNv0e3nV/Ki3wMSXzEzYEgkbAW2gSB0cLcZblTqgz3Tv1j2/V/gJBR6BYrQEw/n9ow2V
	vaC8ZxRUMlczXMv27GBH+Q9orgljB4nUEdNR/Og6ySj5CmdbIGo1dWgr4RNBOe0t3c2yxxdiiNp1p
	eywa18Ig==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34188)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rKe0f-0006Xv-27;
	Tue, 02 Jan 2024 12:36:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rKe0h-0005IC-OE; Tue, 02 Jan 2024 12:36:43 +0000
Date: Tue, 2 Jan 2024 12:36:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH RFC net-next] net: phylink: add quirk for disabling
 in-band-status for mediatek pcs at 2500base-x
Message-ID: <ZZQDWzYlxAKl0JxI@shell.armlinux.org.uk>
References: <20240102074326.1049179-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102074326.1049179-1-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_043654_391692_94AEC1CE 
X-CRM114-Status: GOOD (  18.85  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 02, 2024 at 08:43:26AM +0100, Eric Woudstra wrote:
> In follow up to: net: pcs: pcs-mtk-lynxi: use 2500Base-X without AN
> 
> MediaTek LynxI PCS, 2500Base-X will only work without inband status due to
> hardware limitation.

Yes, we need better support for 2500base-X connected to a PHY.
Currently, we treat both base-X interface modes as _media_ side modes
by looking at the Autoneg bit. However, given that 2500base-X has been
around for ages in vendor-specific forms, we need to do better. The
introduction of the PHYLINK_PCS_NEG_* enum and phylink_pcs_neg_mode()
is a step towards resolving this (as well as ensuring consistency of
implementation so we _can_ start to address it in phylink rather than
having different PCS drivers doing weird stuff.)

I am _not_ of the opinion that we should be dealing with this based on
compatibles or anything like that.

As 6.6 was declared LTS, I think we can now move phylink_pcs_neg_mode()
into phylink.c, and thus think about what we should do with:

+               /* 1000base-X is designed for use media-side for Fibre
+                * connections, and thus the Autoneg bit needs to be
+                * taken into account. We also do this for 2500base-X
+                * as well, but drivers may not support this, so may
+                * need to override this.
+                */
+               if (!phylink_autoneg_inband(mode))
+                       neg_mode = PHYLINK_PCS_NEG_OUTBAND;
+               else if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+                                          advertising))
+                       neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
+               else
+                       neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
+               break;

Specifically, the linkmode_test_bit() bit. When there is a PHY present,
the link between the PCS and PHY should _not_ depend on Autoneg as that
is indicates what we want for the _media_ side, and in the case of a
PCS-to-PHY link, that is not the media.

The next issue is the one that you refer to, and there's several issues:

1. some implementations of 2500base-X do not support inband
2. some implementations of 2500base-X appear to require inband
   (e.g. mvneta, mvpp2)

I have some thoughts on this, but I don't have the time to express them
in email at the moment (too much to get through post-Christmas post-
Covid.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

