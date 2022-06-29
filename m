Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D654C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 10:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQ/AKX93IXg+lImwKRP85P0+7Gao0cAQCKhdMpRVRsk=; b=l5OI909qhAytF6LHcrgc9OCPCJ
	+TjP8ItuTPsJmCEJ91OeUDruB/3Yf99ftHX1yYTz/PK50koW9SFWzhdhq4i2RPz6BJnD5O4e7WFgQ
	+y5DyywXKcOGdIVWdMimfZUjqFWUrI/NyGgiAKyjUUu06aAH7Xzo9Gu4WlzZBd4T3PGm9EUBgjBMv
	iMOK1Bv+TyRM+UUOz9W28LWMCcMKAU1SeLWx3Na/RZU+UBn+XDmj3fU4SCD1bfEMakh2fnmgaMBlE
	fJpI6TY6O1c+makQ8TbsjyaJ+PYM52yVFtxHnuclrjXXdZH6M0IJCnUkk/COtPIp8i5RpKgh0QjXU
	fvWIFrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UfI-00AwUH-6X; Wed, 29 Jun 2022 10:11:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UeY-00Aw92-Bb; Wed, 29 Jun 2022 10:10:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B693161EDB;
	Wed, 29 Jun 2022 10:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEF3C34114;
	Wed, 29 Jun 2022 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656497429;
	bh=gumbGasP0T/XEgPCejFFb3EYwfVesF4bIVPFRQ3YSN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VdOsgqg+RS0Ue5vKZjp9OLNtY8fNDwj8+ERoCCon3jm+WRMH3w4o3HGhst8x8Y+13
	 BoUfpZ3GStSsD3sgeAoc+EhVdYpi6Y5yavqeFNY/JOoptTR3fnKMsbhOdaK6o8Wxkl
	 PIOtTjg2cDd+f2FE0TroCywxwOf4ueVSA+XiXe8ri8+AVF2JochONNwSJpghPYujBk
	 lw2tV8ON9hAhmfvcreLyfwAGZcKE1zSthSaFQC8at2g0mwqD2IDe9zNbVy2+xafeGy
	 OFuCinYQQ6u7FfnCsv78UpaF7bm04xZIW33N0RedubgVMsnPsRxGtn3h4Nue1nkgn0
	 XoGgH85eABDog==
Date: Wed, 29 Jun 2022 12:10:20 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alvin =?UTF-8?B?xaBp?=
 =?UTF-8?B?cHJhZ2E=?= <alsi@bang-olufsen.dk>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, "David S. Miller" <davem@davemloft.net>, DENG
 Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Florian
 Fainelli <f.fainelli@gmail.com>, George McCollister
 <george.mccollister@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Jakub
 Kicinski <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen
 Chao <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next 0/4] net: dsa: always use phylink
Message-ID: <20220629121020.583144a5@thinkpad>
In-Reply-To: <YrweuzL2LYNbfvAY@shell.armlinux.org.uk>
References: <YrWi5oBFn7vR15BH@shell.armlinux.org.uk>
	<YrtvoRhUK+4BneYC@shell.armlinux.org.uk>
	<Yrv8snvIChmoNPwh@lunn.ch>
	<YrweuzL2LYNbfvAY@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_031034_531177_2AEFE151 
X-CRM114-Status: GOOD (  33.35  )
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

On Wed, 29 Jun 2022 10:43:23 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Jun 29, 2022 at 09:18:10AM +0200, Andrew Lunn wrote:
> > > I should point out that if a DSA port can be programmed in software to
> > > support both SGMII and 1000baseX, this will end up selecting SGMII
> > > irrespective of what the hardware was wire-strapped to and how it was
> > > initially configured. Do we believe that would be acceptable?  
> > 
> > I'm pretty sure the devel b board has 1000BaseX DSA links between its
> > two switches. Since both should end up SGMII that should be O.K.  
> 
> Would such a port have a programmable C_Mode, and would it specify that
> it supports both SGMII and 1000BaseX ? Without going through a lot of
> boards and documentation for every switch, I can't say.
> 
> I don't think we can come to any conclusion on what the right way to
> deal with this actually is - we don't have enough information about how
> this is used across all the platforms we have. I think we can only try
> something, get it merged into net-next, and wait to see whether anyone
> complains.
> 
> When we have a CPU or DSA port without a fixed-link, phy or sfp specified,
> I think we should:
> (a) use the phy-mode property if present, otherwise,
> (b,i) have the DSA driver return the interface mode that it wants to use
> for max speed for CPU and DSA ports.
> (b,ii) in the absence of the DSA driver returning a valid interface mode,
> we use the supported_interfaces to find an interface which gives the
> maximum speed (irrespective of duplex?) that falls within the
> mac capabilities.
> 
> If all those fail, then things will break, and we will have to wait for
> people to report that breakage. Does this sound a sane approach, or
> does anyone have any other suggestions how to solve this?

It is a sane approach. But in the future I think we should get rid of
(b,i): I always considered the max_speed_interface() method a temporary
solution, until the drivers report what a specific port support and the
subsystem can then choose whichever mode it wants that is wired and
supported by hardware. Then we could also make it possible to change
the CPU interface mode via ethtool, which would be cool...

Marek

