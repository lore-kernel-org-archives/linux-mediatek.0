Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92210C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Dec 2021 22:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/jGxkSXupd5a9MU0rk9WgWhzIFhPyHUobODE5/3Cuk=; b=ghfPksOcoBDX73
	SVfmI6PEywPL4x4GU0G2sX4mZpsMnuMJI9EMIVZLHDh3/SE/Q10dQYWcOcJ+DZGqMrEVmdIFrOHdc
	XiVS32dbJGj1ydLdM4dgI+HqYDFt1bUKUGkDZqn0UiYCwWddPSF5//jOnZ0fSSemYbPA3BbySYKcm
	E2yvc2cHHbA6cXrG3+AI+vuvAPqOOvr+cjbhcfA5AElqPeGqdeaJ3nMp23bTAcftH68ADXQNXlEa0
	+0h5JZJvPvOMZW9yBBJXcwRfNT7Ydpv8iavlkLHoZIJaZB/EPCQR1BTTXgVpl4NppF8n8rkbzHbCX
	y//o6a1S257wWyokHi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1byP-00FvEU-BZ; Sun, 26 Dec 2021 22:26:37 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1byM-00FvE6-U7; Sun, 26 Dec 2021 22:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Ruwqd3R8hjH2U0DTpsHDY4KKMtPY7Qqnmy4Da5pTtCA=; b=LUf7Pp9I+k2KsTDL8n7IJ+fDPH
 jzWhSPbnowCaw8bdW1LR6Cpku/pkvhLFOsig4PPIKwWhKu5zxSz7BCklQ9Q51LClqsc2yRzm4lw2U
 IBAfGVtJbf2ls4QINwv3rYxYyYOcrKgiSyTfyit88ONnUxFTvVd0oeEwKoLYvhYCXjFA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n1byI-00HX2c-UI; Sun, 26 Dec 2021 23:26:30 +0100
Date: Sun, 26 Dec 2021 23:26:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO
 access
Message-ID: <YcjsFnbg87o45ltd@lunn.ch>
References: <YcjepQ2fmkPZ2+pE@makrotopia.org> <YcjjzNJ159Bo1xk7@lunn.ch>
 <YcjlMCacTTJ4RsSA@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcjlMCacTTJ4RsSA@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_142635_018404_071F03F2 
X-CRM114-Status: GOOD (  14.39  )
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

On Sun, Dec 26, 2021 at 09:57:04PM +0000, Russell King (Oracle) wrote:
> On Sun, Dec 26, 2021 at 10:51:08PM +0100, Andrew Lunn wrote:
> > > +	if (phy_register & MII_ADDR_C45) {
> > > +		u8 dev_num = (phy_register >> 16) & 0x1f;
> > > +		u16 reg = (u16)(phy_register & 0xffff);
> > 
> > Hi Daniel
> > 
> > You can use the helpers
> > 
> > mdio_phy_id_is_c45()
> > mdio_phy_id_prtad()
> > mdio_phy_id_devad()
> 
> Before someone makes a mistake with this... no, don't use these. These
> are for the userspace MII ioctl API, not for drivers.

Ah, Sorry.

Thanks Russell, i got this wrong. I though there was some helpers for
this, and happened to land on bnxt_hwrm_port_phy_read(), without
checking what it was actually used for.

> The C45 register address can be extracted by masking with
> MII_REGADDR_C45_MASK. The C45 devad can be extracted by shifting right
> by MII_DEVADDR_C45_SHIFT and masking 5 bits. We don't have helpers for
> this.

Maybe we should have helpers.

      Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
