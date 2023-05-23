Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBF2C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 01:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2ebCMeC0Gg/ghiaUxjGr45XpfzvcXPIaHpwpcgIJfo=; b=eiBkOEJOLc3NG3
	m2rqZvGWkzepTQCBDwkT0NkAvuc/pJSMG3evVLdp3K40mcIN0OOJMmDLb7iExkGsBExDz0A4rCNa0
	m2Z4fXOWF2TAvh+SL9tH7eWnNlx689/rMEfBWQV6KiXmnKlzDIfsNZnXBEKag5Sk3Xs1E9GdTQUAp
	Q9Zn2cac9TZIGiHvm7QptTtz0ub5SVjA+8z22hihK5RnKg6d0ZOylXvq4+XjgZm+UHKkAEs0AaO/g
	KrWARJxZMt5tuBEN+QevgraU51yQQfd5AVInORqOcDHdbrmme+w5+Vhu9t9Dv69oorilIuM57BUnc
	0kShWEPZyJ7bVFKSO2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1HEg-008cvo-2f;
	Tue, 23 May 2023 01:54:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1HEV-008crH-0j;
	Tue, 23 May 2023 01:54:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 145CF61756;
	Tue, 23 May 2023 01:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C548C433D2;
	Tue, 23 May 2023 01:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684806877;
	bh=o2ebCMeC0Gg/ghiaUxjGr45XpfzvcXPIaHpwpcgIJfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lPbDVLevbzTScK5ZPAqhHvPw/7A0H3fmSJL/niJYQgy+Fb63BDQbBtpHumQDTeWvi
	 cqoAbvXaGVSR20Kk8iAYHYT1Vt3bIEMHSWTZaX46VDezfz6X/8KjObGuU1xwC0xazD
	 uDSkNsyl5Xf3qyBzbjPOeObg7tmsHUezd4DVXBgkZFkOYiaQY6Zo+WPBUSAhPRKk+d
	 JK+Yl07hQA3Bwh3BkG5stLSKENFGK1i32uokDksxExsex1/4yascF0E2GiJXD0v3jC
	 gNERi78lPoKqCp331mZkHW6Y8vraLfj6VW9Gct69VvfvodyB6U61elq8jyQu4nXJ1Z
	 NbUZpSEZMFe/g==
Date: Mon, 22 May 2023 18:54:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 00/30] net: dsa: mt7530: improve, trap BPDU &
 LLDP, and prefer CPU port
Message-ID: <20230522185435.3b2a8d07@kernel.org>
In-Reply-To: <ZGuwy/0FGh0c4wXk@shell.armlinux.org.uk>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
	<20230522140917.er7f5ws24b2eeyvs@soft-dev3-1>
	<ZGuwy/0FGh0c4wXk@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_185439_362627_F79DBDCD 
X-CRM114-Status: GOOD (  27.37  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Horatiu Vultur <horatiu.vultur@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Richard van Schagen <richard@routerhints.com>, arinc9.unal@gmail.com, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Richard van Schagen <vschagen@cs.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 22 May 2023 19:13:31 +0100 Russell King (Oracle) wrote:
> > I have noticed that in many patches of the series you have:
> > Tested-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >=20
> > Where you also have:
> > Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >=20
> > I think you can drop Tested-by as the SoB will imply that. I think you
> > got a similar comment some time ago to a different patch series. =20
>=20
> Signed-off-by in no way implies a tested-by. Signed-off-by has a very
> distinct definition that is in submitting-patches.rst.
>=20
> Clearly, if one is working on infrastructure where there are numerous
> drivers involved, one probably doesn't have all the hardware, and one
> may have to send patches that have only been build tested, but never
> tested against real hardware.
>=20
> While we may attempt to elicit testing, most of the time this seems
> to be a waste of time and effort - or at least that's my experience.
> Even if you Cc people who have recently been active with hardware,
> that is no guarantee that there will be any reaction.
>=20
> That has got to the point now where I just don't bother trying to
> elicit help from others to test driver changes. If people want to
> test, they need to do so when they see a patch on the mailing list,
> preferably before it gets applied. If not, and if it breaks something,
> then we'll have to generate a patch to fix the breakage.
>=20
> So no, please stop thinking that SoB implies that the patch has been
> tested.

Dunno, I had the same reaction as Horatiu. Adding "Compile tested only"
in the commit messages of patches which author wasn't able to test seems
more natural than assuming that nothing is tested by default.

It's not a hard requirement, e.g. seems fairly common sense that cross-
-driver work comes with limited testing coverage. But for someone
working on a single driver, assuming not tested by default, again,=20
to me - feels odd.

