Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDAAC0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6bMFs3dhJn8nNDuRaeyVuYgLqQef3PoJkMgo84MWzg=; b=W+gWsdZLoPT9LRZYN7HWDOnQTx
	secpLmPO5nLOTkjbAn4RkyPmufeDMlR5rmKvxKMRTTSECvcNJqaOh4ZCs+Ws8ZTXI5snUxjIi+1Fu
	dF92DhhOkwRunxCcaZmDc9C3UMgcjqkCEKL/QxYgZaTuBT1pU8Ps2eDXGZoWWyqXks4VVH34w+2OU
	BumEk8aVVX3fOxloy5XWfk2irUnBEW+tVBZHLFVpcxNelXNRcQ2YoKPpzwThQ7d0807a7D960XB0v
	Q7N78hQjBlbt55B0GoaQ6vdKOvU5ymTCcAwKuF+WpaMkavZnpoItlS6iqff1Krtj1U99xyFJmK/i8
	OBTX4Elw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2CW-006DYo-2V;
	Wed, 19 Jul 2023 08:06:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2CV-006DXh-0h;
	Wed, 19 Jul 2023 08:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s6bMFs3dhJn8nNDuRaeyVuYgLqQef3PoJkMgo84MWzg=; b=K2hwUfw524lOId2R9x/z9/2gGW
	9DOCeYBxxTmXQ+wGiakCCi6egUdyJXTuSrN6H8XiU+5aExWKONzw64lOgxagCzO2z4KD1fQvt3Xr1
	YdwjvJ20xHIgRrma3at3za7LbnE1fUh5KJUrNV0Rlb3hFB5ZyuC4g5+EdtTXiniX7RF01Q2xeAb8H
	1S1arfd5WFCq9qfmBoW4x9jOr+9cJD+bxVjrDQzstWRqw61WyLgPZNvICSB1kBCA7GqLdzK/muh6H
	pgdKFmY+y1O/kNoa6m2Z6lBLc2npYP9OOeVBHFeKhz7xVFiTyl2gHiEobhJ6H3Z5P/eD3TkhuriIB
	JBjIq9uQ==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkdu-00BZYY-1Y;
	Tue, 18 Jul 2023 13:21:32 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9936b3d0286so806837966b.0;
        Tue, 18 Jul 2023 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689686426; x=1692278426;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6bMFs3dhJn8nNDuRaeyVuYgLqQef3PoJkMgo84MWzg=;
        b=VeIyGT+CNlTrpnm5CuMZu8qUpTBS1Y22zH+Q9/OyXCw3g9jVbAxgOxy77L3s+ewAeY
         WmrZ73UK5s+gVYPYrGDRUgpW+mm6BDfB/xCNvfZ9QNgi8nEWCjQeDolc/5UE3hTFr9Ec
         OJnutotesC6zxC4/6T9nrieBezPZp0zL24PuodGIxWzggke7CcD4tXIYdCwSJwVNooRV
         f34cZoa00JbECIiLlGgzjBWeWvSG1LDhewHA1//rXBp7BWk+Jb7hD+B0en2jp9qabIkh
         m/ZOtljpfMCr1SOFb/L0qOU+PLiFvcNNGW/Z2osFM4OT2EPISTtf2Y3En5sI/q4/xFHh
         +p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689686426; x=1692278426;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6bMFs3dhJn8nNDuRaeyVuYgLqQef3PoJkMgo84MWzg=;
        b=JSQbEBQWQwuiwYPGU0ei0sd1EE5o9rxaobJyFreUH2XQwfzmLrnxtXVDcs4JdF1t3L
         1js7kP4C76wwX2EAfHF4I0+WxMW326+eJDk1cR0E5BScZjfxiryx+bzlwpCKa60TZ3gp
         tsH5jogkxFP3SxRRg6ktly2FF95+XGCPN4xeUfg6nGdUiCmCg770gXAyX+nYu0RlBH1o
         grOepBP4xVcWmfMtCdXMZkUvjUyA7Hr+4HTW0fC1E24cF55t0mTS4kDuN1Otr+2SkfbY
         f6wb4Q+bZMaC0sKJpqiB9TzvXPyvcQg8JERDDKaWHyFaT3wsPEuywaKgCaqtcraKrP66
         53GA==
X-Gm-Message-State: ABy/qLbB5Pn3A9tNcyhat+Dk6pN+Bl/QA30KFQOQcDfOuctysIgEf5m8
	aUEF2JUDxAtnocFkvjsImZ4=
X-Google-Smtp-Source: APBJJlFdWnkfLFRDytz3siL9gZwOqzq3nojzvKygMkdop/GIQIx+J12ZgrKGLYzkRmLKHsW6XjOrBA==
X-Received: by 2002:a17:906:109b:b0:988:6526:beaa with SMTP id u27-20020a170906109b00b009886526beaamr15645302eju.40.1689686425590;
        Tue, 18 Jul 2023 06:20:25 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m23-20020aa7c2d7000000b0051def9be785sm1214188edp.85.2023.07.18.06.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 06:20:25 -0700 (PDT)
Date: Tue, 18 Jul 2023 15:20:23 +0200
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
Message-ID: <ZLaRlyzkqRLSqjQc@orome>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
 <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
 <ZLZDL27zzDpY4q8E@orome>
 <5e4b5bc23f3edb3ed30cb465420a51ffceceb53d.camel@crapouillou.net>
 <ZLZ6amp5HKUbm5w3@orome>
 <8f32cb8377808a073b043e0adf3ccf5ae5a84c92.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aHHyfbgV8z9OlP4F"
Content-Disposition: inline
In-Reply-To: <8f32cb8377808a073b043e0adf3ccf5ae5a84c92.camel@crapouillou.net>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_142131_203011_04388D61 
X-CRM114-Status: GOOD (  39.05  )
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


--aHHyfbgV8z9OlP4F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 01:55:05PM +0200, Paul Cercueil wrote:
> Le mardi 18 juillet 2023 =C3=A0 13:41 +0200, Thierry Reding a =C3=A9crit=
=C2=A0:
> > On Tue, Jul 18, 2023 at 10:42:47AM +0200, Paul Cercueil wrote:
> > > Hi Thierry,
> > >=20
> > > Le mardi 18 juillet 2023 =C3=A0 09:45 +0200, Thierry Reding a =C3=A9c=
rit=C2=A0:
> > > > On Mon, Jul 17, 2023 at 09:14:12PM +0200, Paul Cercueil wrote:
> > > > > Hi Andy,
> > > > >=20
> > > > > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a
> > > > > =C3=A9crit=C2=A0:
> > > > > > Since pm.h provides a helper for system no-IRQ PM callbacks,
> > > > > > switch the driver to use it instead of open coded variant.
> > > > > >=20
> > > > > > Signed-off-by: Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com>
> > > > > > ---
> > > > > > =C2=A0drivers/pinctrl/tegra/pinctrl-tegra.c | 5 +----
> > > > > > =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > > > b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > > > index 4547cf66d03b..734c71ef005b 100644
> > > > > > --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > > > +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > > > @@ -747,10 +747,7 @@ static int tegra_pinctrl_resume(struct
> > > > > > device
> > > > > > *dev)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > > > > =C2=A0}
> > > > > > =C2=A0
> > > > > > -const struct dev_pm_ops tegra_pinctrl_pm =3D {
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.suspend_noirq =3D &=
tegra_pinctrl_suspend,
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.resume_noirq =3D &t=
egra_pinctrl_resume
> > > > > > -};
> > > > > > +DEFINE_NOIRQ_DEV_PM_OPS(tegra_pinctrl_pm,
> > > > > > tegra_pinctrl_suspend,
> > > > > > tegra_pinctrl_resume);
> > > > > > =C2=A0
> > > > > > =C2=A0static bool tegra_pinctrl_gpio_node_has_range(struct
> > > > > > tegra_pmx
> > > > > > *pmx)
> > > > > > =C2=A0{
> > > > >=20
> > > > > Another driver where using EXPORT_GPL_DEV_PM_OPS() would make
> > > > > more
> > > > > sense.
> > > >=20
> > > > We don't currently export these PM ops because none of the Tegra
> > > > pinctrl
> > > > drivers can be built as a module.
> > >=20
> > > This doesn't change anything. You'd want to use
> > > EXPORT_GPL_DEV_PM_OPS
> > > (or better, the namespaced version) so that the PM ops can be
> > > defined
> > > in one file and referenced in another, while still having them
> > > garbage-
> > > collected when CONFIG_PM is disabled.
> >=20
> > Looking at the definition of EXPORT_GPL_DEV_PM_OPS(), it will cause
> > an
> > EXPORT_SYMBOL_GPL() to be added. So there very well is a change. And
> > it's a completely bogus change because no module is ever going to use
> > that symbol. If we were to ever support building the pinctrl driver
> > as
> > a module, then this would perhaps make sense, but we don't.
>=20
> In this particular case the EXPORT_SYMBOL_GPL() isn't really important,
> the rest of EXPORT_GPL_DEV_PM_OPS() is.
>=20
> I don't think having a symbol exported it is a big deal, TBH, if you
> use the namespaced version. If you really don't want that, we need a
> version of EXPORT_GPL_DEV_PM_OPS() that doesn't export the symbol.

I do think it's a big deal to export a symbol if there's no reason to do
so.

And please, can we stop adding these macros for every possible scenario?
Maybe I'm just getting old, but I find it increasingly difficult to
understand what all of these are supposed to be. I get that people want
to get rid of boilerplate, but I think we need to more carefully balance
boilerplate vs. simplicity.

I'm seeing the same thing with stuff like those mass conversions to
atrocities like devm_platform_ioremap_resource() and
devm_platform_get_and_ioremap_resource(). There's so much churn involved
in getting those merged for usually saving a single line of code. And
it's not even mass conversions, but people tend to send these as one
patch per driver, which doesn't exactly help (except perhaps for patch
statistics).

Thierry

--aHHyfbgV8z9OlP4F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS2kZQACgkQ3SOs138+
s6HgBhAAhwAuon633pi8BN94xr1dLYcAne5Jv2QcWubv151gBKj5trk8auLuyQWD
WQdoJQaGLTpDrNMimkynGjao7RiohRGBdQ1ZkEwP1wr8GtZOv3o6FS+WJ7ZI2rbt
FlzEB+YQb07OV9nHuz7mijpAsqJ3AafUGeorGVof2v/8E/1x1O7alAz1jlgcW7Pv
Imqk9ZyufK/JUkaQEBMPKdPPdi65gHBhl/Zk1Cf4IXgy+W7kClmSQn8lZxwubUHT
EMMnLIZVBtcC49ovLz6EFRnSd9GjScemPO8n4JfyBr1y9Np65ykjTdd4LyVb+mKu
IzrExYTE0sxA2DWWUIaDAHbOgbnEs5P0R8SAZVo9rT85pypwM+fMBpZd0tyin3bB
wzQ0haUdoNeCMH7BOgiRFqSlNNS2hVzOYRs6G7heyPqzfLpxrgU6pJfUpzhlgMlF
C3a2VaiGoytFcSWUGbsmESvasICDB0zouJAiFiQamTNVf87hJQRzDgaE4Q6/MRdr
Nj9KpT1meTP8tgjxZIFVX7jmqMM9WoIotZYuHA91fOokFjNRvVPauurSplm9eHDO
kMTRHmyEGOi7J3aDkD0fGCBXIR+GBWd0CQOAnzemWo35fbXnyjuZFxcdJwfLni8c
TUkJEBMdHRY8gWSAnrQJUtGu7/7iUJKnnCvSU4N1YWEzVPJljsE=
=31l4
-----END PGP SIGNATURE-----

--aHHyfbgV8z9OlP4F--

