Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759DAEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvBHRW1hX7jSHUc5Dd1yf8Vt754q3/Qv7wxhKNRg9lU=; b=lnMtVBcA8OobpYEdeFGUi6LTRJ
	9yToP3oZGiLSeR5Uck9R0VBhryvmF2TuujXZw8Y7z0T7P0ZQ6UCYqwIk41d7C03yasuWAf1fF6YmI
	QFYpYIRv/NGQcRBgBAap954l/XuWp1LmHznCKqcgcpD7EdjY8aha6WFkn1cnGArtTBHuuufI7tUBV
	1k6MuJQAUy/1dJRtgy18xkapPv688EzuALRyOWSdgq8psYF1zHEvkn/a3L0R2tUn7Mi5RRB9ITnVM
	Mans3+85NXOORL8zpnzLfjh7eDVuU1J6OBMVslQGLiGyhjGiQy2ZwB47IBjucuOjOVcru9HWDWJVj
	kIxHnGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Cb-006DfI-11;
	Wed, 19 Jul 2023 08:06:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2CX-006DYa-1E;
	Wed, 19 Jul 2023 08:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lvBHRW1hX7jSHUc5Dd1yf8Vt754q3/Qv7wxhKNRg9lU=; b=FQjvxrkaDUk86PD90QIZUxFGCi
	ljdVYOvzzJcy2T0f7c5ZFX4iaJ0yl/1NBDGOkwbQOKoEKJefqlW+yk72HvTXw57bfgllcB5yC0OJp
	jHn6l6HZfgSx3WhJBPwGQ3dlvgS3xuAM3k3PEx3lLnCfYoLK2N2zXHhbUUshDO/viVs6X6xQVXNAx
	fb05hJRfyI6a0eqeK+penfljuyR6e0VACvjz4l4jMHYxu+lFci3Y1awMDrs2QkdXkEF2/XIcFtOB0
	hz2vak/aMkZqYb/XkqtHQQoF4GyJ1hrq6z0vy2riwm33yyTTPSqTUEzOOMchaIjCesF4Oroyt4Qj4
	bHLUJlSw==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgIu-00BJe1-2U;
	Tue, 18 Jul 2023 08:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689669770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvBHRW1hX7jSHUc5Dd1yf8Vt754q3/Qv7wxhKNRg9lU=;
	b=maEuuMJ23VwXgPP1BYNWDWH9FoDi8ssbRkcHwVHdHZ+2liVDNNtSFXoi/Ucm7tD8fFcWkz
	Y1+1pyzlgXX8KdYt9Wa7GKYCY48VbAbD6BnoH3PHwrKdfGz5uVVGeT1MlJH1yeEkON6JDi
	BIcoju3Ka9xM3kidK/COzZ4sCOkXIp0=
Message-ID: <5e4b5bc23f3edb3ed30cb465420a51ffceceb53d.camel@crapouillou.net>
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
Date: Tue, 18 Jul 2023 10:42:47 +0200
In-Reply-To: <ZLZDL27zzDpY4q8E@orome>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
	 <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
	 <ZLZDL27zzDpY4q8E@orome>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_094333_095623_52D88461 
X-CRM114-Status: GOOD (  19.28  )
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

Hi Thierry,

Le mardi 18 juillet 2023 =C3=A0 09:45 +0200, Thierry Reding a =C3=A9crit=C2=
=A0:
> On Mon, Jul 17, 2023 at 09:14:12PM +0200, Paul Cercueil wrote:
> > Hi Andy,
> >=20
> > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9cr=
it=C2=A0:
> > > Since pm.h provides a helper for system no-IRQ PM callbacks,
> > > switch the driver to use it instead of open coded variant.
> > >=20
> > > Signed-off-by: Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com>
> > > ---
> > > =C2=A0drivers/pinctrl/tegra/pinctrl-tegra.c | 5 +----
> > > =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > index 4547cf66d03b..734c71ef005b 100644
> > > --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > @@ -747,10 +747,7 @@ static int tegra_pinctrl_resume(struct
> > > device
> > > *dev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > =C2=A0}
> > > =C2=A0
> > > -const struct dev_pm_ops tegra_pinctrl_pm =3D {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.suspend_noirq =3D &tegra_=
pinctrl_suspend,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.resume_noirq =3D &tegra_p=
inctrl_resume
> > > -};
> > > +DEFINE_NOIRQ_DEV_PM_OPS(tegra_pinctrl_pm, tegra_pinctrl_suspend,
> > > tegra_pinctrl_resume);
> > > =C2=A0
> > > =C2=A0static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx
> > > *pmx)
> > > =C2=A0{
> >=20
> > Another driver where using EXPORT_GPL_DEV_PM_OPS() would make more
> > sense.
>=20
> We don't currently export these PM ops because none of the Tegra
> pinctrl
> drivers can be built as a module.

This doesn't change anything. You'd want to use EXPORT_GPL_DEV_PM_OPS
(or better, the namespaced version) so that the PM ops can be defined
in one file and referenced in another, while still having them garbage-
collected when CONFIG_PM is disabled.

Cheers,
-Paul

