Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731AEC19F2A
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jul 2022 21:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEZJegvkXmNvO4clUx6dPeVmv4JNyxctAwR1j8c43QA=; b=E5ex7LFWqmvG8YxDcVJ066s092
	kxY2G42ZBDFBzrXniyfO5oizAofo3ldzGiy5UDICozNuesgbwXgSLdld7lxByU45djUSImWV9/5U9
	NIy0Hgmw4pfqOvXJz32hG2TK0aRTyvvjpZpFOCcd6RtVHiEUp3Lg91NtAEagK4h64VGIl19ssVdd+
	/HBQ5HIj7cglKzP23cJ5x8tVRgpsMYGs/jHSL7KQlIn13KB0wUdZRw4XGfBzUbZDtRkHpKOHWNalY
	0h1Jd0gq+jR3ZeBqUYVXptREs5Q4rrBUmjG6gDVXnZQREwx0eGFVyI+OFJsh55YS5Xw4hTaLnMGa7
	eKqcGvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHuE2-004kQ7-7Y; Sat, 30 Jul 2022 21:42:22 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHuDn-004kG6-IA; Sat, 30 Jul 2022 21:42:09 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 166D61C0001; Sat, 30 Jul 2022 23:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1659217326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EEZJegvkXmNvO4clUx6dPeVmv4JNyxctAwR1j8c43QA=;
	b=JhTPNqhtgDpVDKFDtpjcA2Twtqu8DqbYMC54pUN6e1L3IsfbH8feFNeEY97iNaPgKG6DLa
	vZeaX5O2xZH1+9NqAOsNvVmmP6yoPqh0RU7vxbUzYkWl2IDU28vPW0pLUx15CtXpPSL9jf
	NXoRhATfSpZHeWB0nmkCup62xs+PetM=
Date: Sat, 30 Jul 2022 23:42:05 +0200
From: Pavel Machek <pavel@ucw.cz>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	andy.shevchenko@gmail.com, chiaen_wu@richtek.com,
	alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Message-ID: <20220730214205.GK23307@duo.ucw.cz>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-13-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EMQjp+MvU6EBGjHc"
Content-Disposition: inline
In-Reply-To: <20220722102407.2205-13-peterwu.pub@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_144207_787651_E6589A67 
X-CRM114-Status: GOOD (  12.50  )
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


--EMQjp+MvU6EBGjHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Alice Chen <alice_chen@richtek.com>
>=20
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>=20
> The Flash LED in MT6370 has 2 channels and support torch/strobe mode.
> Add the support of MT6370 FLASH LED.
>=20
> Signed-off-by: Alice Chen <alice_chen@richtek.com>

> +config LEDS_MT6370_FLASHLIGHT
> +	tristate "Flash LED Support for MediaTek MT6370 PMIC"
> +	depends on LEDS_CLASS

I'd name it just LEDS_MT6370_FLASH.

> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Richtek Technology Corp.
> + *
> + * Author: Alice Chen <alice_chen@richtek.com

Add ">" at end of line.

The series is quite big, would it be possible to submit LED changes
in separate series?

Thanks,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--EMQjp+MvU6EBGjHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYuWlrQAKCRAw5/Bqldv6
8s+wAJ4tcHfH66JAvG66D+7AtIPL7xaD/ACeLylCABT4fJdlPhsq4ijIBLwsq3M=
=kLCB
-----END PGP SIGNATURE-----

--EMQjp+MvU6EBGjHc--

