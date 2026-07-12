Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3CAC43458
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2026 22:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zL9CTPzN1W+fRigYMQva5W+av5/6jMQUnYv7czVB80s=; b=HbAHM1LfoeF/f8H9HRp6Yy9eU9
	SOi2/bgTWtFfNAj3y4OiU99o6AW30KQW7V04pxeKOz33D7Wv/FwtUna519diJUivc72SFkzi2rj1d
	FXv0Kib3CNtPiWFDoPnDUfOq+MH/HqkuBnwscgsPOQOF1Qe0C+7Fqe25izFXHkI47KBBSda6+3bQw
	uIJbwiBqdcqEvMh4ec2LtPW+azxlyTK+lcg/gmOKTUCn5fSfGZTClQ3uO4+2oyXCvlvLjmKQ7UAJK
	U0fWuV9Qm6PDnT6LFAQ2m14KlJwF3kMt73qIRi7emWYrYRY4E+OWA+9NO7bomqyCCTMSqHxq8SE0b
	mfWOs8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2Ru-00000007o7C-32gd;
	Sun, 12 Jul 2026 22:14:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2Rr-00000007o5k-1SBK
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Jul 2026 22:14:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-476a130c138so3084494f8f.0
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2026 15:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783894493; x=1784499293; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zL9CTPzN1W+fRigYMQva5W+av5/6jMQUnYv7czVB80s=;
        b=SB0x3YV5ztMz7LxpWYKmTRc3JFiwsbj5U/bk3TE474JrShF++GHS2Ku54WlHX/Mkac
         u5IRvyCR/vHKCS67QyWM2gnzz0N5MFgl7jdywBJIhhWQtZ0bkK/uB0KTDVL/I5YbsnCm
         ArnfTMt5ngszKbVGpob2eouukmVWjRY9YBxl7fnyqqjfsZhBhPbNvpKS24k6PzaQu2jW
         Pcy+kYEPU8KOOK1K7hXKmul6lj2EBSmen26kQugT4TOc9/eeNKXzPXlP8LECiV1cmsN3
         GRSrN8lfHgxpAPnycYbX6waIiaWJBP0SGer4PsRy2PAloZt39enReM6uXdBdl+E5g+P5
         Fqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894493; x=1784499293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zL9CTPzN1W+fRigYMQva5W+av5/6jMQUnYv7czVB80s=;
        b=hAzkrhT/toaHkQhFwgNW7dSPoUHg+VrEGBCXbae/AR9i8/MExdyPhdcrpB9bPlMIZ8
         E84vCB0cMWwzpXy/GWYat1DjbrbaNHaBCvIsoV2AOvTthN1txyZQhvX5yzrQ7cANL3Mf
         au10k15b9FXGcKyvJ2Snu/9r2nsAF1B1Gs5N+jU9JGPpHLTz8cZRzEdbs7RCKFTSZxqv
         6mzuOQYQgh9rCh8SIsOjRMSAnUlWm6+0dCDj+RmPUw/XPwnvZ0b50g73Kqgz+lsVdTcu
         IAUwizcI5IkwUmaZwQDDG0OmXE2jc/SAbDbU0hFNiw87fTCX573bg0GYIpkvIUA9TAJc
         LSGg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9oDwozF+htRjIgr4vrqOcjDyHufrLWzA8eMORCoPfDc+2kfmz3iQxZ7eC4P1mUNgZsh2QGy82swyCOERFfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5j75XmX1SJcoxw1AnKt3it6GE79Ij7RsqiE0rdN+wrEESIloe
	2g7OyeOQ7+i67JcqVwcpp0C1vlloh+oKhNv5PhTGwJgaYA4n2cilvl9cGpbKu8vMycI=
X-Gm-Gg: AfdE7ckgLCfmt8M7F8HjzEnNCShH25C0rprMT1irPz6QboTdF9+8rJZOTMw724BybZn
	sBDCe3uS3uMWJGKq8J3zYgETKo9oqs1sC0koMDTsWENpZwdF23iprdM9Fy06GVhw59LeTrFuXW2
	krdfb8wEfyFRus69bvH7iZ7XoK9+pSliaY41OOJ0+XNKtdH1mk3HqDiAv+6WkYP+dxb4dMWSfbD
	tJqHeXoxj4pM97o3rZvge6R/ALEduaX2n1MaukVs6ktI9UoelDfirZC07N9KASf5j8QGZbnyVbW
	vhvrV0lnmnP6+/BO5XF2Np5sx/J+WzXOCBAyENTp8ZcyKzmXUz7GyqOVXIbtmovdaXcKKYkcW6V
	op885/uMxgeQZiA+U6Ls9QrZKkTTjAcSpzW8Oyhee5Fd+6RC3J3vsS/2DQHbpkK2QO5xcZciuNw
	XH6f30glAnZJ/rHtO3Og==
X-Received: by 2002:a05:6000:310d:b0:478:19e7:22a2 with SMTP id ffacd0b85a97d-47f2dcebce6mr7408847f8f.25.1783894492402;
        Sun, 12 Jul 2026 15:14:52 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039afacsm74519074f8f.19.2026.07.12.15.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:14:51 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:14:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iio: adc: mt6323: remove unused header
Message-ID: <alQRYcO5grXoEk39@monoceros>
References: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o43h3f7zpw65y6ht"
Content-Disposition: inline
In-Reply-To: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_151455_403079_234C79CE 
X-CRM114-Status: GOOD (  11.76  )
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


--o43h3f7zpw65y6ht
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] iio: adc: mt6323: remove unused header
MIME-Version: 1.0

On Sun, Jul 12, 2026 at 09:26:36AM +0300, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
>=20
> Remove unused mod_devicetable.h header.
>=20
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
> A small cleanup for mt6323 auxadc driver.
>=20
> This patch is based on top of iio/togreg branch.

The only device-id struct used in this driver is of_device_id and this
is ensured to be available by (e.g.) <linux/platform_device.h>. So:

Acked-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.co=
m>

Thanks for supporting the effort to get rid of that header,
Uwe

--o43h3f7zpw65y6ht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUEdIACgkQj4D7WH0S
/k6EWwf+JU+Xlhg3mTVFtgHxRhXyUFEZ/eNALPq36VofXr9hBEjKS9koXNFoSJYi
cBT87TumeE/ZTkywvoVgMl30uhh4jJPQphc1gC+HtJQ6maKVM/oYe7LEiYLP6rhj
sVZBLT9HeeQy2+F+bV8hU72ZdZD8Md1tEUX4NgYeDyk6/2RJgfbVvkGjnGbfsgkt
/HseMZuPsts+4wgnmMfEEfZKAP9phGc0QlIMSR7/pnBlykd6Jvu9AheSD6SmVM3I
VBIHs+2/parSkTSXBvZ8E8tbEbh+pmintZ3pydhXzzBLq3VEKgus3uvZf6XFqNU0
PuiejVzWydHXlYkI11do565DXsq55g==
=vgse
-----END PGP SIGNATURE-----

--o43h3f7zpw65y6ht--

