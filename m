Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35565E68974
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 10:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2/PPaAetYxmKzv3sgVnjzcQ59oLRc0dcwRBbTXacjU=; b=fnur4jeZ7lvGK8JTMASvaTYhv1
	+aIIlgWr2Wsnz33bOdhQRMiqFWKIUZRykkIVJG8/cODjCX13jaFBoJJAbd2MNe0NIBINLNOWVEz+M
	M2n+hNfWNKLPTxD1SkwfMFTnlFPK+U6dyUurOXAv9alI2KydLlCLdPVL5HCaELSpQEpadBrfet/3A
	qEO+n6h/f4Hoc5wY4nv+kDCWs6IfH4O/vbyroRkiv4zdD0Hm8Qhmy9kVoV0YlauciTm8rtGr11swe
	yQtF97N6zwlHI52RsJyPSyWErg+P/lm7DTf4hoj6Uc1m8CFcALNJentK/3sPeDV+aH+XSZKY20E2S
	pvQgIPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Snh-00000003JXv-41Rg;
	Thu, 31 Oct 2024 10:53:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Snf-00000003JXD-1FkS
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Oct 2024 10:53:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so6357245e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Oct 2024 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730371989; x=1730976789; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L2/PPaAetYxmKzv3sgVnjzcQ59oLRc0dcwRBbTXacjU=;
        b=qixzCubEMkycuvLArSqC2CeuBDPZoj/GqHvO7o9zEXuhr83ZwAXE8/vhIw5k5cl7dF
         U5i4sfvIbt7vXfKZnoidEg1c0yooDFEuCY8kp5wymtqayH1KYxHQ0Q2pTwIislT/6TXq
         N1ugbgP4qJpBWO/VQrXvyA8sh5bVua4j55EX/QCaROYW6ab6+Vy67hXgBzDIboafBD9u
         aqyYJC82OT0XuJgsFi+7oalE4HYSpXFGJSBGANdhrOc8r6arjxwLk7cT9todju5QPWxB
         QmLU+M0TP53cc3UKdJaVKoFGopoZ6dgxUrD11vI2GEoE1UsYW2+frFkia2VOGnNI8L2I
         ckgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730371989; x=1730976789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2/PPaAetYxmKzv3sgVnjzcQ59oLRc0dcwRBbTXacjU=;
        b=Axcx7hok62xvLCiqzoLjpJw/UEUFeGgPvURMTT2Hhu3W5lLnGMxz9ds8CxsBLraf+T
         RH8bWfQgB1/kOsXThQFYFzvDlVlEOcChdWtM49wt3ONoy0p0R7EfcHRym7Jl8/fYtFvE
         kr6HKPfx8ITINju9nP1bbo5B+xnAmifr7LzNt6EROb9VdWX6Pd3JKfCEewllriqStXPH
         RnwQYA0zLw4LY5w9rvSl45ArdwrQDevlqMSo6QLsAxizsxl/FiX2qCU/3N+NX6q1WYLi
         iaOPSEQgyWytHvgAF6DEHUxORIni+4C6rZlx2qAx5UjvD9qgIq0Om9iG12M8WVLeYKRA
         MqBg==
X-Forwarded-Encrypted: i=1; AJvYcCXTBTUUwQJ5QXFd8TGpkhQ2BOTBYYU1QBkLHdI/a26mnZgtjs6PRjLLYCcBKb9ETavsM+fS8BQPf0CnYNCnPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnCdHPswUDx5RX9AfL00RLu6ZD3SmH1vUk48xb6pTTc8c7PQzp
	KwRAYsuS29dD05l7Tex99KL5KeYUg+z8oFKJfhsNyBTNg2CyrVTN9hNlbKlpfpc=
X-Google-Smtp-Source: AGHT+IEj2PmCrm+rjaPGqCqvTA61rjlM2smHZN2BDqZGjYKUG6p+9lHCct26bf+Hc89r3OBtcRNNrg==
X-Received: by 2002:a05:6000:ccd:b0:37d:2edd:b731 with SMTP id ffacd0b85a97d-380611639f9mr12661409f8f.30.1730371989006;
        Thu, 31 Oct 2024 03:53:09 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7c1esm1764015f8f.12.2024.10.31.03.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 03:53:08 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:53:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v9 6/6] pwm: airoha: Add support for EN7581 SoC
Message-ID: <ljpgey6oqeisnhnf3zojnmczxvpduabj6cgf3utef3oic2k27e@r5sbpdxwzghs>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-6-afb0cbcab0ec@kernel.org>
 <bf5lpb3dwfywzgnbcel6de57ick7hfzxfaovyqrt7juif6tgp7@sdmugrua6t3c>
 <184f8707-0b4b-474a-b2d4-b54a3438f4a3@genexis.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wg4oaapc6iokbp6v"
Content-Disposition: inline
In-Reply-To: <184f8707-0b4b-474a-b2d4-b54a3438f4a3@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_035311_343812_041BAFC1 
X-CRM114-Status: GOOD (  12.69  )
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


--wg4oaapc6iokbp6v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 6/6] pwm: airoha: Add support for EN7581 SoC
MIME-Version: 1.0

Hello Benjamin,

On Wed, Oct 30, 2024 at 11:14:41AM +0100, Benjamin Larsson wrote:
> On 2024-10-30 08:32, Uwe Kleine-K=F6nig wrote:
> > > +	/* Configure frequency divisor */
> > > +	mask =3D WAVE_GEN_CYCLE_MASK(index % 4);
> > > +	val =3D (period << __ffs(mask)) & mask;
> > FIELD_PREP please.
>=20
> Per my understanding FIELD_PREP only work on compile time constants.

Then please create an alternative macro with the same semantic that also
works when the mask isn't known at compile time instead of open coding
the same concept several times.

Best regards
Uwe

--wg4oaapc6iokbp6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcjYZAACgkQj4D7WH0S
/k5i+Qf/QUXWMBOT0BMZ7vYNOddtUYFZcRph+Cgv/55I6yp0wo0c8gGiYBTgjdls
BZkBjvIPurO3QEZd8dGjcYFSDkJFCfuikUofKD7RQ4wWxRsfmY88TBsztrkfqbg2
aIjBeZlp3n3SyIQ4lsQV9HdMzUGvITEGLBN3k8cbmaZyfZU08CN9n6hmZN1EwduZ
+yQtVPlDRq2k7jUiTTLbRcSqb6ngR8FajPEP+s+vYXawI8a43BIBVHZzt80AXfkG
NZTgD+fW8qmB4uUevfuVq8+yw5cTAGrTxkjh/fMNsIArbA5bNdVBUKLhTrUvMHTI
NK5mFlK9MFcl5mK6ETI1KgnKNHa75Q==
=lv66
-----END PGP SIGNATURE-----

--wg4oaapc6iokbp6v--

