Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FFEC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Dec 2021 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6lDkuAU64WVSjAgn+qQJlniX88LOowi9X4w2gCsw+g=; b=zFzH+SdMlCWZkj
	qZRTP3u3lskZ+LaT9TTN0rY4uBtlhqKJgTg+4gI+l4ASY47Di1SSxf0gRoDwELQLVAHwt6ji2cy7P
	rAvCPudEz6hjs0c5PO9jvo8uu1dIqkXQMYytM5xhN+hs+i50XDkSexfZDJ2fnVecRt48CqvOi2ljb
	rtRNar2TDa2X2MWQwvv6l3zUpimJQ2QJ1Vw9LcbbyU/O43TLNbUchrCMr3FXUVcszBhtayFFktz8S
	iZAqPcB2+aUDsFACv56RmI+hSG1jgZ6URWOxjqnd3UDf/KxIWzLdXa0xYk7BGy2D1rlMF3wDwPcNc
	hdWK2eff8Zvkzn4gIozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1bXy-00Fu7w-JV; Sun, 26 Dec 2021 21:59:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1bXv-00Ftyg-3y; Sun, 26 Dec 2021 21:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZgoXuaZYiF+8e1hdm/07nW5qxeTxUuvpPxUwfPpfj8g=; b=Em7+b/9yc9xPRzljsvC06Wvd48
 tJqpLeedC6jDkjp843UhO0SoAnkTxZ3d7f/iGQR6cplk54QgZ/K7yp81GF/YQ1VbadZWIfAJ4vLCM
 ST9LULm/kBvEcUucuDzuMOgC39RMwEzrzFEwhKERIH8KJFsr/cx3JThFMqI8HdqpvOFSkdsvUDYlJ
 JVu2yN4EAw0QOl+3fCbwQia4iKAmgwJ0d1I7pLcX6vrFjuSAd9W6P6T90CHoGfXRodo0wK0sso3t7
 2nrExSjG35DhwrELoD2VDZfrMguIIMn3JEySM3YduLNKcPdovL1jQj6ezssVMR+BSdJ+4oy8rje48
 hh2xZyXg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56452)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1n1bVs-0000ex-AQ; Sun, 26 Dec 2021 21:57:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1n1bVp-0007Xm-0U; Sun, 26 Dec 2021 21:57:05 +0000
Date: Sun, 26 Dec 2021 21:57:04 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO
 access
Message-ID: <YcjlMCacTTJ4RsSA@shell.armlinux.org.uk>
References: <YcjepQ2fmkPZ2+pE@makrotopia.org>
 <YcjjzNJ159Bo1xk7@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcjjzNJ159Bo1xk7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_135915_190123_84898287 
X-CRM114-Status: GOOD (  11.99  )
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

On Sun, Dec 26, 2021 at 10:51:08PM +0100, Andrew Lunn wrote:
> > +	if (phy_register & MII_ADDR_C45) {
> > +		u8 dev_num = (phy_register >> 16) & 0x1f;
> > +		u16 reg = (u16)(phy_register & 0xffff);
> 
> Hi Daniel
> 
> You can use the helpers
> 
> mdio_phy_id_is_c45()
> mdio_phy_id_prtad()
> mdio_phy_id_devad()

Before someone makes a mistake with this... no, don't use these. These
are for the userspace MII ioctl API, not for drivers.

The MII ioctl API passes the prtad and devad via the PHY ID field, and
is decoded by the above macros.

The internal API passes the prtad as the PHY ID and merges the devad
into the register address.

The C45 register address can be extracted by masking with
MII_REGADDR_C45_MASK. The C45 devad can be extracted by shifting right
by MII_DEVADDR_C45_SHIFT and masking 5 bits. We don't have helpers for
this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
