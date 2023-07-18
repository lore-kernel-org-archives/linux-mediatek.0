Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB4EC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUEJZ2jnO99PUeS7JxBs0K24keSEFO0PJQdiqMWdwp8=; b=0aFnsy9qd3QbhEemin71y9AY4g
	r8WUkE+kGsOm98J19lg0hkEMEmGUg3ICaZIEIsu9lLdJKzw2ZFKfGaqWuOBQIIt19b0+psKS81BJP
	xVi4hEUPJaLROqwwltRFGI1yAIJwC9kghjyu5R9SrpD/PCkXhIoyjwfWKbSZ1grKadd13N0CT57LO
	2quvrEwP2nJUokD9miWf0hg3vNcwDie3Q/qY6IBtCyvBSjISyuNhGpho92BnHUlzA0evpL9T/hlPn
	u2wo3LulkKnYhN8/8ct8nV6nxcb511MQUvBoP5HazhM8C+vrdybEO/+qA786d7QOTnNY/NRMX42n5
	zDffdOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzJ5-0057Ey-0m;
	Wed, 19 Jul 2023 05:00:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzIv-00579k-0v;
	Wed, 19 Jul 2023 05:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CUEJZ2jnO99PUeS7JxBs0K24keSEFO0PJQdiqMWdwp8=; b=BP/ytKtXlJuvYGw4oR4vkcCOVx
	4uxueBFv8fdzYKm7a9l4yG4qeA3XIB4BJKbNf6WW9xrirv3E2CDP9hLl48HG9tqhxBUCkEGkbNSjt
	QOes9JrikQzJ7YC/wtkHV+nb03kbardrRtRhcNfPTQ7B1JYiJ9ws4s92+QBMJDaGBSePPghUVApVX
	icPFIHE0hmBEn4Yn9KrY7hX6RK9rdUCLwO49BF4vEdGA+u1pmSDam7Zg1s/6jQz99HAt2QeJC/JuG
	oQPH1RxGqYzysrVt6QNbvA7ZZnIIhh+C3eQ5CpvQV0SFSJ0HQl04p8GYpUvfM1WZBuLvkVA4Mdaxs
	hhmm7Skw==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLj6J-00BTP0-1D;
	Tue, 18 Jul 2023 11:42:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51e57874bfdso7984166a12.0;
        Tue, 18 Jul 2023 04:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689680493; x=1692272493;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUEJZ2jnO99PUeS7JxBs0K24keSEFO0PJQdiqMWdwp8=;
        b=VAGPw4lI/UWtguFE5auxk6/N3bRlE0BGGpjfGEueMrR8A8Lk4nDBbRJO1VOi9axlYW
         luXRULT+HgEWGzBIwfrbzNf4a+2e/D2yWMUp/LgyDr33Q7EZ5r6H4EN+Dn7WQIQNEG9V
         YzTZ2J/IJ9iumAT6z3fWSF51WAuwstix2rz3kVvAMGvh6wXY0ztBEd6V3LZISyfPzceT
         akJqUAB7aVSeZHFAVL1dDc047YBOlQHESqNnA8dEEaVnP2XnrGO01ejUV5ESDARd8zmG
         eht00EsGL1es7DMDlKkLL6EUZKYqe2mZPTqWlD2XfwwYP0o+7xrT1ju4Vn4gXEmHw/jS
         v6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689680493; x=1692272493;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUEJZ2jnO99PUeS7JxBs0K24keSEFO0PJQdiqMWdwp8=;
        b=WbvLM48lptgy87mM14joMXcVbzddWioB7XcX+BAGc0MKbZeG2HKiVscqW52J3fL8Ws
         DaesHeOB5igp3er815z8AaQG1RgC9HcZM/ajWHn71u4nSeqjUCPoufzDES8uTDSaaTys
         rrvTZeB/OO3AqhcyKRLc0pPhuM/m0cms9eqRCDKzBosJ4KpxqDaEMzT7HHNmqicI+pJ4
         Z8weEW5EVlBQj4gy65c9EDo4y6ttE6MTTZQWXfxQfjUe6+e7iatl5BVhsPyWvVk9cIn7
         rJTduWTa9Yh/GdHhGYfItAOFfYas21AshWpEjg4lZVTskDLnVwtsH724r/IROcj0lrEX
         mXRw==
X-Gm-Message-State: ABy/qLbOuJTlISnBL2bqjMHA8+3P98Nqe41/iGDY62VIr4X2KHcM308p
	t/2kjpw+b2RRjvrFk+Ku2z4=
X-Google-Smtp-Source: APBJJlHObGKiuPqLOj8t4fatzc4FfNv5s5It0UjWbyLNieALj1jP3ypjcJeB75XYTDs5dKOHj12dJw==
X-Received: by 2002:a05:6402:1856:b0:51d:9110:4b11 with SMTP id v22-20020a056402185600b0051d91104b11mr13215284edy.12.1689680493119;
        Tue, 18 Jul 2023 04:41:33 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w5-20020aa7dcc5000000b005217a24addbsm1107974edu.20.2023.07.18.04.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 04:41:32 -0700 (PDT)
Date: Tue, 18 Jul 2023 13:41:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 10/10] pinctrl: tegra: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <ZLZ6amp5HKUbm5w3@orome>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
 <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
 <ZLZDL27zzDpY4q8E@orome>
 <5e4b5bc23f3edb3ed30cb465420a51ffceceb53d.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jp/MchPym/cMz+Qh"
Content-Disposition: inline
In-Reply-To: <5e4b5bc23f3edb3ed30cb465420a51ffceceb53d.camel@crapouillou.net>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_124243_595351_EF6A0C19 
X-CRM114-Status: GOOD (  27.25  )
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


--Jp/MchPym/cMz+Qh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 10:42:47AM +0200, Paul Cercueil wrote:
> Hi Thierry,
>=20
> Le mardi 18 juillet 2023 =C3=A0 09:45 +0200, Thierry Reding a =C3=A9crit=
=C2=A0:
> > On Mon, Jul 17, 2023 at 09:14:12PM +0200, Paul Cercueil wrote:
> > > Hi Andy,
> > >=20
> > > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9=
crit=C2=A0:
> > > > Since pm.h provides a helper for system no-IRQ PM callbacks,
> > > > switch the driver to use it instead of open coded variant.
> > > >=20
> > > > Signed-off-by: Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com>
> > > > ---
> > > > =C2=A0drivers/pinctrl/tegra/pinctrl-tegra.c | 5 +----
> > > > =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > index 4547cf66d03b..734c71ef005b 100644
> > > > --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > @@ -747,10 +747,7 @@ static int tegra_pinctrl_resume(struct
> > > > device
> > > > *dev)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > > =C2=A0}
> > > > =C2=A0
> > > > -const struct dev_pm_ops tegra_pinctrl_pm =3D {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.suspend_noirq =3D &tegr=
a_pinctrl_suspend,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.resume_noirq =3D &tegra=
_pinctrl_resume
> > > > -};
> > > > +DEFINE_NOIRQ_DEV_PM_OPS(tegra_pinctrl_pm, tegra_pinctrl_suspend,
> > > > tegra_pinctrl_resume);
> > > > =C2=A0
> > > > =C2=A0static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx
> > > > *pmx)
> > > > =C2=A0{
> > >=20
> > > Another driver where using EXPORT_GPL_DEV_PM_OPS() would make more
> > > sense.
> >=20
> > We don't currently export these PM ops because none of the Tegra
> > pinctrl
> > drivers can be built as a module.
>=20
> This doesn't change anything. You'd want to use EXPORT_GPL_DEV_PM_OPS
> (or better, the namespaced version) so that the PM ops can be defined
> in one file and referenced in another, while still having them garbage-
> collected when CONFIG_PM is disabled.

Looking at the definition of EXPORT_GPL_DEV_PM_OPS(), it will cause an
EXPORT_SYMBOL_GPL() to be added. So there very well is a change. And
it's a completely bogus change because no module is ever going to use
that symbol. If we were to ever support building the pinctrl driver as
a module, then this would perhaps make sense, but we don't.

Thierry

--Jp/MchPym/cMz+Qh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS2emoACgkQ3SOs138+
s6G2GQ/+LZ0mO7AXXnFYUmyFkwZZsRzeaYA9YsgzEvgcS7Jffuq2kY3X7XzRakJw
tA7ONWE7TdtsS2a0vrIWn6EnREV/cW9LH7LyCLfBrkI0VBK2NUML6v9ZtRYz+1/k
5PJv8z3y9sB5lvQ56g1/9SiUseqJ+6uxrGDoWHDpMlwyxe2AW29M2xFfiYXSAe/i
tYzjEZEq2Xa2hsJP9WUiFqWhu7LGg9G6LK1O9ZJ0LgbMfgqconOgN0lQb+MMxOwj
opr9YZaz/MQPc3jNnljqsh4HSw9dk7p4K0Z6XEjRy/AYF9vVEa9f2avcB92azr+V
xgD/YCRJJsnB8PUXtRRBIllIhrcUrpPYoLfEwOz6wzNpQhV8SQP4IrviU/SrNOSK
bBRq3ym+Ib0s1DQKipgVyfr9CEoSNB+k3ztYxr+kfw5AI2T2ai/aMCQ7A7UGUN4O
fTdO+w2DLmqrCDBK4ffBki7WAPlwghbC8/YpsUkFxksBMuslo3si5/kUeyg7q69P
SQ8cz7RefitY5aod67stvmdb/YXtk9EbOsLHvQntaBiJOBxLWK8W40xAK6Kt7Wvk
3rpz+zuRSIkZqcLF16p5LdeDQkJM6lRSjTUqkQT4qzrx+wcnYJqLL4z8kYuaxdDX
CR+nV22Lk+YYApuQDe+Xl7n/NEVhuOLFHyrm36Gos+GEYNxM8Bs=
=45Cn
-----END PGP SIGNATURE-----

--Jp/MchPym/cMz+Qh--

