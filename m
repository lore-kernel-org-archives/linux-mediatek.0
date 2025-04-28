Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC628C369DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 19:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaMu0L4wBURz9xq4JXnOvgxpR2Jhc7zGFIG2V5tCWLw=; b=yDHu3UT4bKYBG88gaohlBhZ1g5
	Zy+CrWp8WUf2FgzzfP2MLaILexNAcTV7KphYb0VSqgJY9312KAXF8RJC4PT6mQ3WwX8ZmRqkZExUX
	tgdV4N27TBTXqkwA77tSaUYUekEPo7Q50LWVyM61PZVlnU4jG5do7/16aEZxa0ObWDn1/BU+ZZLcw
	C9HBHo8KxXz2+qRHwen5B+N1WoG5rWM0LJY0AxVsOWdhA+pVyyMrnJeuqipcenaNoLFgFTVx3xpFx
	m5oCOyyI1oXm2TvDmnis9oEFDCCGrlTQnKPGNVWtRj/oiWGV3pqDrgclR4wp+ODmRUurSrCWSCMrY
	5OtBOhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9URa-00000007Ntr-3uQm;
	Mon, 28 Apr 2025 19:47:10 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UPc-00000007NZ6-2LBo
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 19:45:10 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so4536570b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 12:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869507; x=1746474307; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KaMu0L4wBURz9xq4JXnOvgxpR2Jhc7zGFIG2V5tCWLw=;
        b=1BBdBfRlXdUa6YHLXzghhsGqYZ+uFKFFcSmSd7Pa/Wz0Gp7/e3TJubLtsqblmyuk7x
         nSe5sjzT8SNLrRwBMqakuC6LdrXIbLSXTGkCwLB6P261FMpYQD7/tyG6mA7iCbKgj7Qr
         Yz48/Nur92P4htfc//JJpqCvvqAaVTbARbWl+NLbj0M0d2+qJXJKr4Iq4Y6IKWIuMV46
         l0mi9D8OwnvrgUI5OM7CQzJPtcCTLTDP3OkS4/tFilteeHiYjtzNkLoawQkK1elvDANa
         2FIWaVB82ERq8iRDOTRcjY9KRRsdbtPJTSAs3E6Nm9ShH1pM+dh1Twgy0+XfRVt1c8BR
         R4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869507; x=1746474307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaMu0L4wBURz9xq4JXnOvgxpR2Jhc7zGFIG2V5tCWLw=;
        b=bJni38XEi0w+T3k6RGKKu+i7gm7PoHahIqNKZhZXFPrzOydUrh6b1pvlkk0eV084O2
         XN5q1fTu5f1Qqeol7r0o5RFt9jZfn5cI/W5dj7GpaOnwavmK53SckcgAQWaXVWH4rBQd
         Iujg3Zviw1NsiiY4lN6NpEF0wxXGtUo+fAUKxoBnu63YUsf+vg4pQClPw4wvP18XKmux
         9zUgCtr9/kcoBmyO/YhTpkT0+RPmu12bm0WFj4noO2sYUw7ei5aIIoDjNaU+RTsLzg7Z
         sPrA94WUHCl6uzmds2e0XTfSe86rbFPg3cyh6Auqf7gIAHRIPPhaUxTpQCS8wZgcL8PN
         iRzg==
X-Forwarded-Encrypted: i=1; AJvYcCW49XgZYMVzoacqE7W1HCFnDwY5pG8mP2q93Hr1CtGxTQf+IfmSam4J15R1FRDMjq/eWEuWlvdKJ7SpUV4Pbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTOaRxZ/tn9eh5V48Vy/ltqMn6rsMvbRgzxEo6EGBswIU2HvWU
	z9dkkF0bqdWSJSgi4ZHnMnbtkcRz5uJUjhAo7xxYsbl/eSxVHGrS8+BlrvCRPw==
X-Gm-Gg: ASbGncuWKgl75tjJ5UM1ZHKpfsZXkD7W/PnpdjVopNZOq6DnUBOBOvJSmweRFkOGeQl
	WtiHeg4wSSusceYtQfSwHa4PH0zllq7wUkslRK+xvFGruyMRidoeUO6U2LZWtHnbjaehiAOEaI7
	o/uitgK867bnoCjT99uS0BQaghVKL/K1vZUZbPNYwKSjMf2KlLD9xxDT6qXPumvZkO3HWeV6e2e
	LDqTfoFPXpVLmDeyxpsbRADHxTvTVeAOEHQYUigzJ8TRSd5xGlfsbCnJvLjC/ozWWDAzrDUz42L
	g3N326ksp8ofrXlWNvwVP/2JXKrt7IXi4N9TD6jry464Cosbha7NWvxaNXRE9V39Nkb1owOF3Q=
	=
X-Google-Smtp-Source: AGHT+IG6R82DFa9jAy922lzUHN2EAVQRNR18xiowU6WDSy9TAXdGrX8+WhcNG0tMNBGpq3fQ1R7ExQ==
X-Received: by 2002:a05:6a20:43a1:b0:1f5:75a9:526c with SMTP id adf61e73a8af0-2093c7e3860mr1003669637.13.1745869507413;
        Mon, 28 Apr 2025 12:45:07 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9abf2sm8338322b3a.122.2025.04.28.12.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:45:06 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:45:01 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support
 touchscreen probing on Squirtle
Message-ID: <aA_avWpDUMAvbRBu@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-9-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3yxgRYuYXTrM4tBx"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-9-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_124508_620582_DF115AAB 
X-CRM114-Status: GOOD (  17.87  )
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


--3yxgRYuYXTrM4tBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:46PM +0800, Chen-Yu Tsai wrote:
> The MT8186 Squirtle Chromebook is built with one of two possible
> touchscreens. Let the prober probe for them.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/pl=
atform/chrome/chromeos_of_hw_prober.c
> index 10dbaede0541..f3cd612e5584 100644
> --- a/drivers/platform/chrome/chromeos_of_hw_prober.c
> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
> @@ -59,6 +59,7 @@ static int chromeos_i2c_component_prober(struct device =
*dev, const void *_data)
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
> =20
> +DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(touchscreen);
>  DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
> =20
>  static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trac=
kpad =3D {
> @@ -76,6 +77,17 @@ static const struct chromeos_i2c_probe_data chromeos_i=
2c_probe_hana_trackpad =3D {
>  	},
>  };
> =20
> +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_squirtle_=
touchscreen =3D {
> +	.cfg =3D &chromeos_i2c_probe_simple_touchscreen_cfg,
> +	.opts =3D &(const struct i2c_of_probe_simple_opts) {
> +		.res_node_compatible =3D "elan,ekth6a12nay",
> +		.supply_name =3D "vcc33",
> +		.gpio_name =3D "reset",
> +		.post_power_on_delay_ms =3D 10,
> +		.post_gpio_config_delay_ms =3D 300,
> +	},
> +};
> +
>  static const struct hw_prober_entry hw_prober_platforms[] =3D {
>  	{
>  		.compatible =3D "google,hana",
> @@ -93,6 +105,10 @@ static const struct hw_prober_entry hw_prober_platfor=
ms[] =3D {
>  		.compatible =3D "google,squirtle",
>  		.prober =3D chromeos_i2c_component_prober,
>  		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,squirtle",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_squirtle_touchscreen,
>  	}, {
>  		.compatible =3D "google,steelix",
>  		.prober =3D chromeos_i2c_component_prober,
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--3yxgRYuYXTrM4tBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/avQAKCRBzbaomhzOw
wuHsAP9k0n2/zZ8JMwMbW9PvC1L4S+rXwkDzn4vNgVA9gpUADgEAqqQGBGFcOCTo
ivudInVAQKMFJJvenfbspzj/SwoyHA8=
=MQA+
-----END PGP SIGNATURE-----

--3yxgRYuYXTrM4tBx--

