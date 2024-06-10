Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA5C27C5F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z97Srw814CSk6XdmVlMPcCGnmoMkpcpqJTTh4MZ38CU=; b=NWkiWfZ+U31/eNpIAR+7crihTN
	OvrpMqc4PSU9ifwwLfVUW/ceNGv7m9xaVN4ZH5vBnr8qjXtYgCMOT+YLqjxWzMNr8JWIgLyUy3qG5
	n091vfSwZN8a3dHxQrclzkpy0oFMVlyy+njICYOWqjdSkYTStjpQmPZMb+SkWYUmh9OjdcwgdPX/K
	w5ek1V8jg/N9K6p+vRbdTF+vsTbH+FcBR5mMesdP6DJm0NpN99FICpDlm2BpwzqLzhJgw9pLPhg17
	tEyRfJaCCZosZQOs48kQsULpcSGo74LxV+WZSgyoDm77LAkYsJzEJCfZr0DVxPOieEBkDHRjbwLpg
	Kn+tlkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGayJ-00000004OdY-07l7;
	Mon, 10 Jun 2024 09:05:47 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGayD-00000004OaC-1M0N
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jun 2024 09:05:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a6e43dad8ecso420791366b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jun 2024 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718010337; x=1718615137; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z97Srw814CSk6XdmVlMPcCGnmoMkpcpqJTTh4MZ38CU=;
        b=tG9QMHPfqxCE+l6tcjdPOZ820HZLOIG1IX5Gj9DfvL4zsSpD3z2nI2jSojiFep+id0
         QhBAIYBbgargm+wfeHwz2h511FvwRMmxxS5VOsh2CwH7V9twU7ZdsCngEuDlb/jvjoYG
         ulB42DUgZVG4K+c7ppbCN2Tl2q7bDLxDwwcYi9YrkRUyxXBLnlV3U5WdofZEH0b8OERz
         2vIqUYJyxdv0JpLL4z4iqA0wwYFwfKwIfesxTGQzVLI1hXdJxgSlcOzt+c4EEGflo/Qa
         HCmtGNnA0MIKee6rmCqc+LVi5iqaYaR6ekEkAPYNjL20p0intJPtebdml1J/BbnjEr8A
         wV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718010337; x=1718615137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z97Srw814CSk6XdmVlMPcCGnmoMkpcpqJTTh4MZ38CU=;
        b=ovgg3PBaahYYhVY9H3ZG8nzP44MGDKLZFPn80F4pamCEItzn8KPbbnRfnqrM06s8Ml
         BsMJ+TR8+xszeGx8FK0oJXxFripjY0ob6/AKJxnKt02IXPCco5eU4oCzpx3sD+kCLjIV
         HK6PIeFOZe/f90qdKPRetCR/cFglJvbt0gZXEgoWIv3hJJFt3wdpzf0m7QpkgDEhzWq7
         SqwHBMpomAjmAtmLT/YSIhzDmIHtqDjLIfDR7CWRFOu9srT1ggXy5zbk7m0J+yTJcvNZ
         f9BKGszkhqR/mayyLFfRin2pZgvy2cAB4+XIT2ARXRFIiYtSk0c84UduQZFgt3UQHXp7
         utKA==
X-Forwarded-Encrypted: i=1; AJvYcCWEkVcjB7egwC9WdFn9xGL1b8b9K8GQpryiaaZFYY8mA3rJKm9f3krPVIu0EFiIZYDQHmMtw2oPlFfhmq8i/wyYhPobheV6xLZiqH196zzHgk5u
X-Gm-Message-State: AOJu0Yw3RQgoNoS4LYT/9nIT6ds/U2ofD3SKRgLBfym0QCU4ZyXX0ctu
	bp/22+rhUAKz/WOWjEFTkvwouXN4lNS0vYEbagbW9tDbipKzpMkGKRTk2r4r6gM=
X-Google-Smtp-Source: AGHT+IFkyhcT1eyJNZMa+v9iD180qe0aqLoDogvtNodRry9SmYe35KOJ15PGipaMtMR7zBJCwHj8dA==
X-Received: by 2002:a17:906:840b:b0:a6f:dec:5a66 with SMTP id a640c23a62f3a-a6f0dec6614mr276844566b.5.1718010337430;
        Mon, 10 Jun 2024 02:05:37 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6ef5285748sm412819866b.146.2024.06.10.02.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:05:36 -0700 (PDT)
Date: Mon, 10 Jun 2024 11:05:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-pwm@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pwm: add missing MODULE_DESCRIPTION() macros
Message-ID: <g5u7xk2l625vu6dxleonlmshnwqoge5fiaigbqlcedayu2rate@o4vgz7g27vlv>
References: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>
 <ca6b4ce2-4ebf-409d-b87d-2024445b9392@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q35kt4hkwtu27u62"
Content-Disposition: inline
In-Reply-To: <ca6b4ce2-4ebf-409d-b87d-2024445b9392@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_020541_906152_E5275793 
X-CRM114-Status: GOOD (  19.02  )
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


--q35kt4hkwtu27u62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jun 10, 2024 at 10:06:49AM +0200, AngeloGioacchino Del Regno wrote:
> Il 07/06/24 18:02, Jeff Johnson ha scritto:
> > [...]
> > diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> > index 19a87873ad60..0b5d68a90e83 100644
> > --- a/drivers/pwm/pwm-mediatek.c
> > +++ b/drivers/pwm/pwm-mediatek.c
> > @@ -395,4 +395,5 @@ static struct platform_driver pwm_mediatek_driver =
=3D {
> >   module_platform_driver(pwm_mediatek_driver);
> >   MODULE_AUTHOR("John Crispin <blogic@openwrt.org>");
> > +MODULE_DESCRIPTION("MediaTek Pulse Width Modulator driver");
>=20
> MediaTek SoCs have got two different PWM IPs, one of which is used exclus=
ively
> for the Display PWM, and it is located in the DDP block.
>=20
> So, there are two PWM IPs in one SoC:
>  - A general purpose PWM IP
>  - A DDP PWM IP
>=20
> This driver is for the general purpose PWM IP.. so, please, can we change=
 this
> to "MediaTek general purpose Pulse Width Modulator driver"?
>=20
> After which,
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Looks like a reasonable request.

@Jeff: Can you please resend with the suggested change, I dropped the
patch from for-next now.

Best regards
Uwe

--q35kt4hkwtu27u62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZmwdsACgkQj4D7WH0S
/k55zQf8CfuApQ1ZBtYAqa1Nbq+ZlBw/O21Uu1RabLwL/pyilctw+8HyD94rpw4l
fa2pQmjJNIpbxVLwqbSz/liyD5+xs3qysDJdfTjG2sc3iWXXtfEo2PSOgxGByXfx
53HHtTMGgwf4SGBDghqpOgBrfuPhjDbUC2xvVIYMwPFPliUjZhdQvNEUqZZiZxo1
Ueou9i3+1M0/jEBd4adgtcR1QlNVQO/4QJ3RJMAFe1tQDVdYrLG3xb0+4uxskJ5b
uuEuYScgNnItS4OISYQoo3R+M9RjhqBhiz+geuCDuHQOTK3GsLd6uJdvojmm1B1n
PTlKBhDnoqJUPIoyjB6XfukvubKsiA==
=P61q
-----END PGP SIGNATURE-----

--q35kt4hkwtu27u62--

