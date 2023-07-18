Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D407EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgoXCsaS2C8T63iw0Ey5t0C4UKRq0GEpZhQp7ds0RYw=; b=qX+bqW4o8vPN6QYfZwGVBfEv4B
	NnqQAC29jxaUOsbhR7lxKrlJxuVI85Klk/UrmUtyIb9Et3K7SrUtpYTu4dzHcTfm+txB74hJnP7fp
	0VniJcaK6JJJXFCOVOkVo96KxG/t1KjP2fKMz9DsQwW1JnRDKOg+MM1K6onMpCHt5+D54hmaPUXLR
	7Wzx4LhIVN1z+LVwhS8UgToiH3puVry/sSytQPX/QCkPwDa2if89J+tchRRbvm1jj5FGy4FSLzCO9
	z/aKIEc1vbeUdphePslNv0e8w2o0+1cx0BZTMJ6E5KRGIuGJJVU2H9dOiwW0mv3S+4fkn0OuVOs+8
	Yl+lSEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0VB-005e54-2r;
	Wed, 19 Jul 2023 06:17:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0VA-005e4C-0D;
	Wed, 19 Jul 2023 06:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XgoXCsaS2C8T63iw0Ey5t0C4UKRq0GEpZhQp7ds0RYw=; b=PnyUDLy+qbA9+w5UUzASXNLdSB
	XKXFJ6l0mneJCjupno5KoII8glfNb0MVZ+NOxGZYol0mlQUaLRZGKGhJ9ay2kS9UnXZTQF9nFgk5+
	Twv+SdZWU9s6IQ/LL9gXZ+9IZN+K5jmnIiXLGhJUeZeMbYzA7UHDoGj+M+5JUAqVBoerh78KIrqNz
	f7uAks5Ala/nOx3Mke9BDcXsw4VzTPrz3G6PG2zJ3ci8r5jNQYsmIjKRzskjCkYCREgPzHllO/+QW
	66D07WpwXw4l3I5NpO6MFi4sv++h2VTKSyP5QkuspxkeSbL0GjnhsGGPl9D8tBm6WQAOlp1neB1GD
	xPUSS0zw==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLfQA-00BGbZ-1D;
	Tue, 18 Jul 2023 07:47:00 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-98e011f45ffso662323166b.3;
        Tue, 18 Jul 2023 00:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689666354; x=1692258354;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgoXCsaS2C8T63iw0Ey5t0C4UKRq0GEpZhQp7ds0RYw=;
        b=f39YUFrJDUhhZxuS6hFWWTKiL58Bl+A9uFWkDZJUSd5vLVCe095S4TzcDAKrSeBFhg
         67QDUoh4u3FfH8Aisz++yS92FBJegkaGbodLy0xIbJNAZh1dO1Ak4d1ago2lB3JBkOUt
         i6F68cVuyixXOxR/FSSliCgDyrbvqbfd8C/FSx3z2llLLC9WxUFbgVe35EI0RZfn5kUZ
         xYCGyejBAoRrgmof3FcfOaYjnQmZOhi+nqjjv8ANYiSdstXckwhD19NqVz+3wc/d7Kfk
         StANGJAJz2j00CsgQzq2j0jEHZ7dL9Drs14R6tDmFmGiJSjWgXYGcT5QVX5fMnLAdlO7
         K9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689666354; x=1692258354;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgoXCsaS2C8T63iw0Ey5t0C4UKRq0GEpZhQp7ds0RYw=;
        b=ih6JZ1Z/EcTKMpEn6oZpcKQcmdLRDLdnnsa+Us3AOXFgNdg65RLvOaaHOHY1l5m0Km
         2+PCc9Ytvo1g4sQ7QB4nfzR74VeKV6GkDcumgVaGWQyl/mHKGjWe/swxynWg4AFba9v4
         psAS0CoeJVYKShD24kFV7aO852rmQ+EVQWII3p+N9GEtxuTaD3Ig9GuPgK2jclu8I4pA
         WneqVSTGj2teU/4R+5qACGefuHdM5eFjJVAuwQS7Hnct8odx25uIxQNLBT+X3Z45AkxW
         86Xys49KhH2nf4DCfbIBV7HZn/Gx6iNO7eWif4r2fImMk3odadyTOtbxFF9EqGh7/0QM
         aQ2w==
X-Gm-Message-State: ABy/qLaGag86eyy2BQao/Uyz1RdEi8Rd4jtVSOG6lpD5N/mCyxOFsoMb
	E37liehBxEf2yMRjOFtEwo9dzO1jQ5s=
X-Google-Smtp-Source: APBJJlHNN+UfI4mMJACRlXNcvMgEJJl7q1fQMpJLNe0EjzLet3w62Y8m4100hJ2OaqQIy1TaCe0Uhw==
X-Received: by 2002:a17:907:3a49:b0:988:f1ec:7400 with SMTP id fc9-20020a1709073a4900b00988f1ec7400mr10816811ejc.36.1689666354374;
        Tue, 18 Jul 2023 00:45:54 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906119a00b00991e2b5a27dsm671067eja.37.2023.07.18.00.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:45:54 -0700 (PDT)
Date: Tue, 18 Jul 2023 09:45:51 +0200
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
Message-ID: <ZLZDL27zzDpY4q8E@orome>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
 <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YpHy1Bd1lMbYUgMr"
Content-Disposition: inline
In-Reply-To: <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_084658_594972_88BEC7AC 
X-CRM114-Status: GOOD (  19.80  )
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


--YpHy1Bd1lMbYUgMr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 09:14:12PM +0200, Paul Cercueil wrote:
> Hi Andy,
>=20
> Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9crit=
=C2=A0:
> > Since pm.h provides a helper for system no-IRQ PM callbacks,
> > switch the driver to use it instead of open coded variant.
> >=20
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > =C2=A0drivers/pinctrl/tegra/pinctrl-tegra.c | 5 +----
> > =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > index 4547cf66d03b..734c71ef005b 100644
> > --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > @@ -747,10 +747,7 @@ static int tegra_pinctrl_resume(struct device
> > *dev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > =C2=A0}
> > =C2=A0
> > -const struct dev_pm_ops tegra_pinctrl_pm =3D {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.suspend_noirq =3D &tegra_pi=
nctrl_suspend,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.resume_noirq =3D &tegra_pin=
ctrl_resume
> > -};
> > +DEFINE_NOIRQ_DEV_PM_OPS(tegra_pinctrl_pm, tegra_pinctrl_suspend,
> > tegra_pinctrl_resume);
> > =C2=A0
> > =C2=A0static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx *p=
mx)
> > =C2=A0{
>=20
> Another driver where using EXPORT_GPL_DEV_PM_OPS() would make more
> sense.

We don't currently export these PM ops because none of the Tegra pinctrl
drivers can be built as a module.

Thierry

--YpHy1Bd1lMbYUgMr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS2Qy8ACgkQ3SOs138+
s6E2zA//adgY1czrgMP7ZiR05NoGmst/GDCFMtTNNjoFKJ+5qLILfen7dukvYsaX
thipJMAflV2Dwp6V8qH+E07id61JFjOPdr7/swudmhqZvmXNmCuZpzwHyEDQRnO2
iKg3hMJeAbUBH11v8REz5mKMYLVHrqY3p0CrDENV5fi82reSfhzrl2dPfq4N1kTi
S2oaewVmBniiPcL+3mTwHP95sbvFdku/bazMrqzVXUYdBqqFaoKdTpbGW6znNxCt
UzPqJsINFesWbGNNsEACeurrn5tCCFKxa+mxCFuS4/NkZHflNGS0sofQD8kKIWP+
uuAOIz2OUWmenYbdRe7JauuO7+yotpcyJv7X+HOp1BXwd8hAoD1weqf5RPO71mTc
9PWzSvVMfQMb0s3LFkAEBYebGOpfXS4lwXRDxr1+L/1H0GoHoo1lrubRLsFj8e1G
3GpCXNukxSq5Fqjp+fR31U/r/wF6UhIwUz0466nQGmVYtCbNKDo3jLaHqDpEoRr/
7x/+KOjTuZ0NEFcNIGBPg1aB/YSCLfbh3IWf25KqhzOSUbaRs0TVHC0g3cweZWSi
KzGaKQlaD8MQifTlcdtOUKKvTxZO68BWTqCxElRrDSGUXHIoRVPP9x/+xqLHhlj9
6Zv9zW/zhvy5mWQojaAsrFEbLtMY7QtP/V9rFY9fo3GFMFtEL3k=
=ww71
-----END PGP SIGNATURE-----

--YpHy1Bd1lMbYUgMr--

