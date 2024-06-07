Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E03BC27C53
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jun 2024 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSjugDn364e1bR2NBfOIb6HAziv7A8jZrYbuA88Eh+4=; b=r1ko8CfBaF6DesyTHgd7+zR8Bf
	AIlW/pfjBapNlbzZiBA5+WgQV3ZpXL9TkprtgjbPjYoyCY0htKa4KyedvkApSxG7BVcVTHk+h9aTD
	p54z2xND7zOhEX5p931m8a3aSdJvvgGxxQFFcbc2fGrcQN4EUhPg9N7e0VY8xH4XbEQnRo5KXne9G
	3JWclV7CJDKBCbonKAIBHdMWzr8QcUXpPUk8QeQ6OZ7Riil2trb6NzO3jKWlEqCG+9iaZo8lNcqM5
	FUseKIkv4kU8Tl8CYg6acv7QJuMVLdTXYNmP48Wh58TqJhvJmxImgotEkNesdGRjANZHTZ3uZtWwz
	Jzn4+ZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFcYU-0000000Exga-0GPD;
	Fri, 07 Jun 2024 16:35:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFcYQ-0000000ExeD-0FEU
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jun 2024 16:35:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4216b80e36bso7105725e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jun 2024 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717778096; x=1718382896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSjugDn364e1bR2NBfOIb6HAziv7A8jZrYbuA88Eh+4=;
        b=RAWMLCt8xlciqXD9aaDi3P8wdH5P9CooAvtIg0m/8pBd1ZRQXZgKDDPjhKG9LA9HJH
         MtnBlT/2tTA4FzYzuWo0DPmaqrp5LRhFql22uImVxf7UB6ML1HdujqZ/kl0XeoHFlthI
         mmgnF6BtK8/9zgMZPMsY6LBF5yfxEmTiRwC+Er1f5i2WtRX6Jn7iwGEJnGiy8CzkUdOX
         NfDtHVzOJB+yycT2sRz7PrMMkhMG/RhgGzQm+RDwNSR+zBPA6Y7QeT7F8k/BHRo9TFMC
         yQ7a4ltiIa6UNJek27dXu4ojNJbjxAXSDiZGpHlOrXnOQwNNdZ5VhDaorb3pP0v1Jx6K
         BMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717778096; x=1718382896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSjugDn364e1bR2NBfOIb6HAziv7A8jZrYbuA88Eh+4=;
        b=Wugxc7phAewga79AUwkMsDathBYJfL51My4ZzhNgW7D/bTQrDcI9aR+yxG58ZNq73Z
         hnCWKD8cHZolrQawu2F/fbk2DB4AP2ApIfTGFXRm4n5xZsy05UKjzfi446iJSY5aD9fm
         XnKglZxAtAptrV+v+BbGe+ucHD7mktS0l0RxAAD3XB7fAPJcETIIh3fiE4kw4dSyQmwt
         z/sZXSoE6UWhcagysyIZcby6OahZNlVKfWTUHzYiNiIvvwKl+dmA0TXge7Hq87g69ORV
         osXSXd/ldqyl2kRrjTPRDABKG5nBUIrYAcWfj8w7sNBAgnue9ZiVxg/r+pGSG+rnPORM
         TEpw==
X-Forwarded-Encrypted: i=1; AJvYcCWJiyjnLimVnvZ7lAhsWDEthXa+vscX2oGYugimA/gQv66ko3jPh8hg3a7NiWsTJpM8PcDsxDoJfBda3KiKnMSm8SW9DurmS7LA34fvLnsW0SXM
X-Gm-Message-State: AOJu0YzqIcOTl5iDl9j3HulUQO53NCI3Dwq2k6mg13r3sBx1xSfrW620
	j3U4LLXSFO7Jf2z6gZuJGUNKgET/DqJlpqax7vs52NMgwD3q0XchCysZoDzr3nk=
X-Google-Smtp-Source: AGHT+IGpGEuV4DVZ1kdf6ue+dBm6Ke4RvEdYp3g9xEjXsaFgOxYEd6wAXfkcbKsCsHOsq8Dy8bGbhw==
X-Received: by 2002:a05:600c:3c83:b0:41c:13f6:206d with SMTP id 5b1f17b1804b1-42164a2e9d4mr30060715e9.25.1717778096151;
        Fri, 07 Jun 2024 09:34:56 -0700 (PDT)
Received: from localhost (p200300f65f283b0017c92b05fa289d44.dip0.t-ipconnect.de. [2003:f6:5f28:3b00:17c9:2b05:fa28:9d44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e719sm58262335e9.3.2024.06.07.09.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 09:34:55 -0700 (PDT)
From: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@baylibre.com>
X-Google-Original-From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Fri, 7 Jun 2024 18:34:54 +0200
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pwm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pwm: add missing MODULE_DESCRIPTION() macros
Message-ID: <vunkvcpe7omv5tbsyw237hhauzyrhf6nujwvyv6vq5zd33udee@5b36qxbz5mjx>
References: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uegcep6av77uozx5"
Content-Disposition: inline
In-Reply-To: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_093502_265839_0B51465D 
X-CRM114-Status: GOOD (  11.77  )
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


--uegcep6av77uozx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 07, 2024 at 09:02:33AM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx27.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-intel-l=
gm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-mediate=
k.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-pxa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-samsung=
=2Eo
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-spear.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-viscont=
i.o
>=20
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>=20
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> This addresses all of the issues in driver/pwm
>=20
> Let me know if you want any of the individual module changes
> segregated into separate patches.

Looks good to me, I applied it to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Thanks
Uwe

--uegcep6av77uozx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZjNqkACgkQj4D7WH0S
/k4LyAf+MocX0RpPC44cCBO/dFFZlEnU4+NMAXx+vRXpg0ASWbWuBgbMvXujfpeo
YRQZYgDgLp/7/FndOQIPT59C9fFbWz0UdLPSiT/MkN+cbRAoiaMXD5JqiTrORPFq
RFbNwOtXzQoRAEceczkKFb65oV7rwmyNyIBN9Vv3Ce/o+avvmlqdAziFU/smNwKz
en3MhIonz85eSOessjikio9bmBGGFzT8US8WiD8Ya8zcQUZ/i9aXH/verkoyfsb/
9hIlW/QY+mBn61RQeVHuF6O5W5Trnq4/sPf2TtnicRafEYBtwNFJRZmDviEqVp3g
UVN+CF/yOMS6eo/89WixvZXyYMNuEQ==
=bpJ1
-----END PGP SIGNATURE-----

--uegcep6av77uozx5--

