Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35C1C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUcNwMpkRou4HoWP59j29IOth9JECxsyonqdKzM916o=; b=sO+X9MHxq5rrDLpurmAZTbjSPh
	r+Z18sY52Q15OMXvBqzcnpr4lxQxngahuuqU1EszzM6NlktIIKiQ+uwnJ+LejGe7c/9j25kM5VI2u
	mRFrU4t5Zjqah/P2DeXjnAo9eyJblP7qBgABWNh7UY59hkS82CjQrvin8q+ugwavcgUyw7M84d+wV
	ZlvaUoEdNsWzS7VpMThIPbP3YcQjP5blVZZuzBtLJCEvW3Y1lIwh78k7UYpkmXYlBnUG4BUFS9yPs
	ZX3Fue/fdzYN68D0N8mJIrHeSKfKhWrDxV4ZV4aezDy9TxPiWTkPhxneQxh9Usu0w51v/LXBTXrxX
	qM2x77LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0oY-005obf-0z;
	Wed, 19 Jul 2023 06:37:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0oW-005oZB-0R;
	Wed, 19 Jul 2023 06:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cUcNwMpkRou4HoWP59j29IOth9JECxsyonqdKzM916o=; b=OYgg9LsoOXRB13Boq4vU3FnnE9
	xWFX/huZ6LM1+b5duLbRdu38+vTfXlaMD56DWP96Mwh7f5bRD1Z3IXsRhZlUsz1JYuj436R7vOh4k
	iIOGDYGlFJllihI4DMPrA/UYKjvwm1UxGO7O/DebP9nAw97dWYgbqCDNNswmaI+xQ0yn/OOcycjYG
	Gka4XMSU3X7gagPQuCzcjhkBfWbfEYBnHAXd4aEPk9PJTtAzNR8a2amffbDIR/ATqrT0l2f5PTDtz
	hLV3dz36Y00mOTWN3FQX8Cqdew883a1y94CsCewRtj6LXlGDZVOQNPq+BAGYoVqwC34X/Z6Cazp3v
	JUMdi2DA==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLjIY-00BTtf-1v;
	Tue, 18 Jul 2023 11:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689681308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUcNwMpkRou4HoWP59j29IOth9JECxsyonqdKzM916o=;
	b=3Uf7/QWlCCH5tyFroVybd1Qgx2JU1l06CTuA9m3ghJn+G0lPlIIF/07/Hxm/ZxptzHo46Z
	h2OZUg6m/lQhQJIB6Il4yacDOBHUwVFFbI50WGHrQQU43CQxBY24dhU5MIPMJCetRF/jeH
	v8qQUt4kIp37e6JvSTUVskqe2fHxiMw=
Message-ID: <8f32cb8377808a073b043e0adf3ccf5ae5a84c92.camel@crapouillou.net>
Subject: Re: [PATCH v2 10/10] pinctrl: tegra: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Balsam CHIHI <bchihi@baylibre.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
  linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-pm@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, Sean Wang
 <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
Date: Tue, 18 Jul 2023 13:55:05 +0200
In-Reply-To: <ZLZ6amp5HKUbm5w3@orome>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
	 <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
	 <ZLZDL27zzDpY4q8E@orome>
	 <5e4b5bc23f3edb3ed30cb465420a51ffceceb53d.camel@crapouillou.net>
	 <ZLZ6amp5HKUbm5w3@orome>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_125523_000644_55A03D89 
X-CRM114-Status: GOOD (  28.77  )
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

Le mardi 18 juillet 2023 =C3=A0 13:41 +0200, Thierry Reding a =C3=A9crit=C2=
=A0:
> On Tue, Jul 18, 2023 at 10:42:47AM +0200, Paul Cercueil wrote:
> > Hi Thierry,
> >=20
> > Le mardi 18 juillet 2023 =C3=A0 09:45 +0200, Thierry Reding a =C3=A9cri=
t=C2=A0:
> > > On Mon, Jul 17, 2023 at 09:14:12PM +0200, Paul Cercueil wrote:
> > > > Hi Andy,
> > > >=20
> > > > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a
> > > > =C3=A9crit=C2=A0:
> > > > > Since pm.h provides a helper for system no-IRQ PM callbacks,
> > > > > switch the driver to use it instead of open coded variant.
> > > > >=20
> > > > > Signed-off-by: Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com>
> > > > > ---
> > > > > =C2=A0drivers/pinctrl/tegra/pinctrl-tegra.c | 5 +----
> > > > > =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > > b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > > index 4547cf66d03b..734c71ef005b 100644
> > > > > --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > > +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > > @@ -747,10 +747,7 @@ static int tegra_pinctrl_resume(struct
> > > > > device
> > > > > *dev)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > > > =C2=A0}
> > > > > =C2=A0
> > > > > -const struct dev_pm_ops tegra_pinctrl_pm =3D {
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.suspend_noirq =3D &te=
gra_pinctrl_suspend,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.resume_noirq =3D &teg=
ra_pinctrl_resume
> > > > > -};
> > > > > +DEFINE_NOIRQ_DEV_PM_OPS(tegra_pinctrl_pm,
> > > > > tegra_pinctrl_suspend,
> > > > > tegra_pinctrl_resume);
> > > > > =C2=A0
> > > > > =C2=A0static bool tegra_pinctrl_gpio_node_has_range(struct
> > > > > tegra_pmx
> > > > > *pmx)
> > > > > =C2=A0{
> > > >=20
> > > > Another driver where using EXPORT_GPL_DEV_PM_OPS() would make
> > > > more
> > > > sense.
> > >=20
> > > We don't currently export these PM ops because none of the Tegra
> > > pinctrl
> > > drivers can be built as a module.
> >=20
> > This doesn't change anything. You'd want to use
> > EXPORT_GPL_DEV_PM_OPS
> > (or better, the namespaced version) so that the PM ops can be
> > defined
> > in one file and referenced in another, while still having them
> > garbage-
> > collected when CONFIG_PM is disabled.
>=20
> Looking at the definition of EXPORT_GPL_DEV_PM_OPS(), it will cause
> an
> EXPORT_SYMBOL_GPL() to be added. So there very well is a change. And
> it's a completely bogus change because no module is ever going to use
> that symbol. If we were to ever support building the pinctrl driver
> as
> a module, then this would perhaps make sense, but we don't.

In this particular case the EXPORT_SYMBOL_GPL() isn't really important,
the rest of EXPORT_GPL_DEV_PM_OPS() is.

I don't think having a symbol exported it is a big deal, TBH, if you
use the namespaced version. If you really don't want that, we need a
version of EXPORT_GPL_DEV_PM_OPS() that doesn't export the symbol.

-Paul

