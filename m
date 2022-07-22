Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F006BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lu4/yNyw3+t/iUskJeu3Cu5z9hKNmHJZ22UIFayMvjU=; b=EEz3PIWMYdTisya32T/lfGAdU7
	ZMH5loDfoV4HMGK9KIWbg3xFGFyO+3kXltVYf+PbryOCOHJi23qSQE0kumW461rKdkf+UIqvIuVwB
	3THidR0uwME3V0bzUAEJYOP2XRRul4gxkhyitq1Ejv/WJZpu68KKe9DKiB5AReFHBnbMOx8ijsV3B
	3tlxX8+D1WUD+KWNdxFXwewm7UMbr0Q8Y3l3lhbVfPwcYlsYoxrpZnKy9vc9mj5/blkQ/7aawqQpW
	TpGE2mkcQI+wSppRUx3SQ9I2r6tYdvTMp6KM1oc5xleNTu930d0ruauTmQUlkHDuDUwt55PcfELMo
	cc6Miw8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEtV5-0060Rk-J0; Fri, 22 Jul 2022 14:19:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEtUr-005zzF-2J; Fri, 22 Jul 2022 14:19:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6B986B82917;
	Fri, 22 Jul 2022 14:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC1BC341C6;
	Fri, 22 Jul 2022 14:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658499554;
	bh=MgM+cMYk0Gwmsorh6Dk3GwZiuKflFl6TUd0K9p3ouY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tk+CA2QiUv36zE/2P71sfKE8mgSSzorJmuK4eGnDVWK+KOUE/+4XO5atBa5trjoOj
	 cX9Y6OP+ZLMBGOweqfMsnYrU9JV525ddvk8aL/pXlv0nM5YLrewVkaD2BejT8RGjAd
	 Sa30cmL5iy3nwEJ6atHxstiOpPcWpluwd49AHp6Jyzbj/594tGCtZOBRhbaLfWTB65
	 Q8Vj2x5i8hhTgVSpnf8+7YxT7rD5Te9OXPAhw9HWkPmbfPSp6kryu2V56YMepFWThm
	 szunL7kxT3osMyMyyyzlUXQz/ihcKjbqH0qQvVuBLAm5sZOnaPUeyRdlVeI+B8PZim
	 fvQtP9ucycmxA==
Date: Fri, 22 Jul 2022 16:19:05 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alvin __ipraga <alsi@bang-olufsen.dk>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Daniel Scally <djrscally@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Jakub Kicinski
 <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao
 <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <20220722161905.5d54685d@dellmb>
In-Reply-To: <YtqkxklImfR9gW1Z@shell.armlinux.org.uk>
References: <20220716123608.chdzbvpinso546oh@skbuf>
	<YtUec3GTWTC59sky@shell.armlinux.org.uk>
	<20220720224447.ygoto4av7odsy2tj@skbuf>
	<20220721134618.axq3hmtckrumpoy6@skbuf>
	<Ytlol8ApI6O2wy99@shell.armlinux.org.uk>
	<20220721151533.3zomvnfogshk5ze3@skbuf>
	<20220721192145.1f327b2a@dellmb>
	<20220721192145.1f327b2a@dellmb>
	<20220721182216.z4vdaj4zfb6w3emo@skbuf>
	<20220722145936.497ac73f@dellmb>
	<YtqkxklImfR9gW1Z@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_071917_431027_1FE81586 
X-CRM114-Status: GOOD (  15.97  )
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

On Fri, 22 Jul 2022 14:23:18 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Fri, Jul 22, 2022 at 02:59:36PM +0200, Marek Beh=C3=BAn wrote:
> >   The 2.5GBASE-X PCS does not support Clause 37 Auto-Negotiation.
> >   Hence, the 1000BASE-X PCS is expected to have its Clause 37
> >   Auto-Negotiation functionality disabled so that the /C/ ordered set
> >   will not be transmitted. If a 2.5GBASE-X PCS receives /C/ ordered
> >   set, then undefined behavior may occur.
> >   ... =20
>=20
> The reason that's probably stated is because there hasn't been any
> standardisation of it, different implementations behave differently,
> so they can't define a standard behaviour without breaking what's
> already out there.

I think they are also considering clause 73 AN, which is supported with
1000base-KX (if I am not mistaken). Maybe the intention was to use
clause 73 with >1G speeds, and so they've forbid clause 37 on
2500base-x.


