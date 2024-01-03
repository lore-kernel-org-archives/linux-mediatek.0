Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A51C4707B
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 11:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qP4o6WoadvxoWxPxLI1uV5qkWBeO6DZ9IGfpq4QrUwM=; b=NQ1pmJX+q7pGCThpGa8F/dHS7T
	RxvdWxxw50sXnApTKY3+21H8XGXeIsl61ITvYuVnW0RzbsNJ5iN1KjB47YIoq8clxn/EzHI3XhSSw
	i5ac3pp//6vM6esz775K1zXvyPCPaJs9ZzKmGY/8eFvIV5SctsSunfCs28LdRP7BAqM2xYlZBrCK+
	ZfdUgCe8cwa6OuLCSOISSCvqusDfwYloHh4myU950qs/DLoyOeZvnFIFhMl2ou7GcZMDqmLh2ih4z
	FP9bJqfdo/qboJvC7Bqwzm+WYtnK0QX72Sl8aNDjr6o2Uc0ej4N0OkbqCXz+Iytfqktn8NoXX4GUq
	RA2h7pPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKzIN-00AV3a-3A;
	Wed, 03 Jan 2024 11:20:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKzIK-00AV2J-1C;
	Wed, 03 Jan 2024 11:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qP4o6WoadvxoWxPxLI1uV5qkWBeO6DZ9IGfpq4QrUwM=; b=1LwAzpg5o164Q7dDM9h0kCLQRX
	ZhFvB8bNZsY3zVtUr7dvjrBjTSqUhd8wZ4s7pqfkeibfWzX3VFLCnCO8Ec4qwC66yYOro862n8TFs
	TDL87PYZmwdXOdrqCcOSkCUVkD4UQf2xQ7/zZDbdOejlH6DwOg52wqHAJc7CPzqYMtbeTKFgQocgu
	8Ocad2nSaAHjGXrShQiez8wRD3wGLAnEIZbayKMcr10ayRC47M29rxd8VJ4Qe+APZmx6jFAtAkFSH
	mXFCi3bwVL1PxZvInDR8mwawQy2e4u+143EjF2aEQef1ElZX4W0d9MZQmzxO77hFOq8IyAh+LDXH3
	YrfzIrEw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46830)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rKzI6-0007NQ-0R;
	Wed, 03 Jan 2024 11:20:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rKzI6-0006Ji-05; Wed, 03 Jan 2024 11:20:06 +0000
Date: Wed, 3 Jan 2024 11:20:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH RFC net-next] net: pcs: pcs-mtk-lynxi fix
 mtk_pcs_lynxi_get_state() for 2500base-x
Message-ID: <ZZVC5ThEmikwiVfM@shell.armlinux.org.uk>
References: <20240102074408.1049203-1-ericwouds@gmail.com>
 <ZZP9GR15ufDbjGAJ@shell.armlinux.org.uk>
 <92190426-3614-4774-9E9F-18F121622788@gmail.com>
 <74223164-ab50-4d6d-a4f4-561b0a70d396@gmail.com>
 <ZZRrk85SCDmo76NJ@pidgin.makrotopia.org>
 <6666EB36-984E-4898-A41A-2D9713DE4DB0@gmail.com>
 <ZZSX_oNUIQr6R9FU@pidgin.makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZSX_oNUIQr6R9FU@pidgin.makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_032020_408842_46BFB141 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 03, 2024 at 12:10:54AM +0100, Daniel Golle wrote:
> On Tue, Jan 02, 2024 at 11:13:58PM +0100, Eric Woudstra wrote:
> > I believe the general idea is that phylink should be aware wether to use inband or outband negotiation in order to setup the hardware correctly. Speaking of a situation where there is a PHY attached.
> 
> Well, SGMII speed/duplex AN is not defined for 2500Base-X by any
> standard and not supported by the hardware (unlike e.g. RealTek
> which came up with their own proprietary extension called HiSGMII).

I give up trying to work out whether people are abusing the SGMII term
or not. SGMII *IS NOT ANY* BASE-X.

SGMII is Cisco SGMII, defined to operate at 10, 100 and 1000M speeds
over a single serdes lane operating at 1.25GBaud.

2500Base-X was many proprietary standards (called by many different
names like HiSGMII, HS-SGMII, 2500base-X etc) that eventually got IEEE
acceptance in one form as 2500base-X.

``PHY_INTERFACE_MODE_2500BASEX``
    This defines a variant of 1000BASE-X which is clocked 2.5 times as fast
    as the 802.3 standard, giving a fixed bit rate of 3.125Gbaud.

Note: not "SGMII upclocked by 2.5 times".

We do have devices that _do_ use 802.3z (NOT SGMII) negotiation over
2500base-X - not for speed or duplex, but for the pause modes, and
we have devices where it is specified that when operating in BASE-X
mode, inband AN *must* be enabled - which means upclocking 1000base-X
to 2500base-X requires inband AN for these devices.

Simply hacking PCS to do whatever they care for 2500BASE-X is not
acceptable. We need a *proper* solution to this, and we need to stop
fart arsing about over this, and we need to stop fart arsing around
calling things stuff that they are not, perpetuating the confusion
in the wider industry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

