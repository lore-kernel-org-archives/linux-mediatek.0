Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7260BC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 09:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4xleNiJczxKma6PeyNli3zgHA+JqamAHgAi3IbvoWs=; b=fNs8VQO7fSIMFCiND2rdJEMS8P
	PclM/oFv1VuHaxDSeCjxMVZ26hRxPJj4r/DtzbAqUhe9Xrq60WEkl4G4xR3hSRCu8JgLb2IdVe0Ok
	nfGXVen2CteT+igh0rSNjUKqTwRSzp4Rhy9TITt+iJ9eWrQ6bRrctjGpCKp6wybCgssmSWWRsGPjU
	V0ft/Qh7D01gOWUOP0G9/nF8Y/RQH0UnkvOfnR0we34/epWYYmuwMTq6MtoSY2kxgHIjVNR09gSmv
	ds24JYfdKNTgZANSqcG4sIQ/YSAnumdSxR7fP/zAQMuwOGQhFx80KDC6ZoKCBTexWG0ZHxiBgfIsJ
	RDCUn0JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UDp-00AjjF-0x; Wed, 29 Jun 2022 09:42:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UDd-00AjgE-HY; Wed, 29 Jun 2022 09:42:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C32B461E78;
	Wed, 29 Jun 2022 09:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF0FC34114;
	Wed, 29 Jun 2022 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656495764;
	bh=MEl0vg9GTCB5iXg1ZWtAa7qkI3VVbL6aXBPDXXd1xSA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ku4zM1hZMTWeMyJZKMslPkCvvXCEFAJkTIz6pDjPwdMCsf9nY7EJCeDQ8eWaGPcgH
	 xlv56tDnnqoP8pPaF+jxvZMkm3i8pUiPJqRZ2XNngSPxFJfy4ij3SuHEQBbNNgVg+z
	 mBHvvGGEPfiSRrsHisVYsn2X4N1ShnXV6+EXeZyGHgIbhMnasQng4d1zB6BEihr+GD
	 SMlED15lHbCbcIBj89X4NRo/+2FQqxMUjcR0uJjK1S5f4K2pCvQ08v/NRN5SyBjrBf
	 RTB2I4OANA9jO9icOKynxJkJNTsCSvnT+OjErgLuJM/Lp3i8t98lELrQjjY53oO2bv
	 UNwy0NTZ3lDEw==
Date: Wed, 29 Jun 2022 11:42:35 +0200
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
Message-ID: <20220629114235.6110eed0@thinkpad>
In-Reply-To: <YrwcpDbmnYpfJuYM@shell.armlinux.org.uk>
References: <YrWi5oBFn7vR15BH@shell.armlinux.org.uk>
	<YrtvoRhUK+4BneYC@shell.armlinux.org.uk>
	<Yrv8snvIChmoNPwh@lunn.ch>
	<20220629112750.4e0ae994@thinkpad>
	<YrwcpDbmnYpfJuYM@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_024245_695395_759509BE 
X-CRM114-Status: GOOD (  31.60  )
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

On Wed, 29 Jun 2022 10:34:28 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Jun 29, 2022 at 11:27:50AM +0200, Marek Beh=C3=BAn wrote:
> > On Wed, 29 Jun 2022 09:18:10 +0200
> > Andrew Lunn <andrew@lunn.ch> wrote:
> >  =20
> > > > I should point out that if a DSA port can be programmed in software=
 to
> > > > support both SGMII and 1000baseX, this will end up selecting SGMII
> > > > irrespective of what the hardware was wire-strapped to and how it w=
as
> > > > initially configured. Do we believe that would be acceptable?   =20
> > >=20
> > > I'm pretty sure the devel b board has 1000BaseX DSA links between its
> > > two switches. Since both should end up SGMII that should be O.K.
> > >=20
> > > Where we potentially have issues is 1000BaseX to the CPU. This is not
> > > an issue for the Vybrid based boards, since they are fast Ethernet
> > > only, but there are some boards with an IMX6 with 1G ethernet. I guess
> > > they currently use 1000BaseX, and the CPU side of the link probably
> > > has a fixed-link with phy-mode =3D 1000BaseX. So we might have an iss=
ue
> > > there. =20
> >=20
> > If one side of the link (e.g. only the CPU eth interface) has 1000base-x
> > specified in device-tree explicitly, the code should keep it at
> > 1000base-x for the DSA CPU port... =20
>=20
> So does that mean that, if we don't find a phy-mode property in the cpu
> port node, we should chase the ethernet property and check there? This
> seems to be adding functionality that wasn't there before.

It wasn't there before, but it would make sense IMO.

1. if cpu port has explicit phy-mode, use that
2. otherwise look at the mode defined for peer
3. otherwise try to compute the best possible mode for both peers

Marek

