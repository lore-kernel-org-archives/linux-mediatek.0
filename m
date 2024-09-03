Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B208ACD3446
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4J1hWIhMeEBX4XcRwGAiYhtZhrFDDZNJhYxSDwEqNxg=; b=vJufKvUX/io42OcZsFQujGFEMc
	6HFBFAwPjw+YHXF8PxS/55S3eARFbdvkMre99BiDnc0Pz2kEokNkzCUDqI7PikXvvTgaLXGvAnpCg
	vt0aupYozL28R1J9RBXxFOjTxDHX7K/WnIh8ezepCs+9lLp1n9CNSlS6u01E/osF4MwwsMxE3M0tF
	ashi2aXPSuEQ6yaU4TuBKj4cffvuzMtVI11VrOKvEqxIKOygvf8DJQpkDwZhjftPZU+404SW48iIT
	s2J4kDslrcV6Z1l+ybbnr/iGHuS88Hs3KeImEfck5iMSG9GBCyN7+Rri1575MKAbz+KPsvkKsgSsd
	SLGF2OMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slVyJ-00000000zyK-1nFZ;
	Tue, 03 Sep 2024 16:01:35 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slVkX-00000000we5-3lPd
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Sep 2024 15:47:25 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so2368265f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Sep 2024 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725378440; x=1725983240; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4J1hWIhMeEBX4XcRwGAiYhtZhrFDDZNJhYxSDwEqNxg=;
        b=kr+2EhTYrBFFlJnJY6VUaizE/FNhPlhkORHBludyKCxGqD3f017Ua4jo2gYosIny4I
         2PVtnl2i0b3z8iShMEKcpgtwePTJ2iOzk6Ayaih/PW80ChFKHzSu8m3O2+SeLfHjHXBQ
         T6tNLiFy/5K3ZK/GPZxZhkSTUaxMknFtmh4HBM2pkBGlwJTShxmpSUdWE31mFsOWORqo
         HtBwT+c8JGIAgYxVhCNqRikinWz11AhhagIvg+Qh43OTS+elXAQCmpfA1vAn+loRAaXU
         zylQ9k9fnt16N8iY0Nnof/MghPDSp+cIyavf4ofCkqwREljKW8KzDrSBR5YOHlAjHyxZ
         gcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378440; x=1725983240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J1hWIhMeEBX4XcRwGAiYhtZhrFDDZNJhYxSDwEqNxg=;
        b=rFmRl6BnesUoRfGaNNI6aUQf4Rn9hnSFaHSDASFOLCJInuKwHQmmQWBSIDgjUqGYP9
         JA6HdNRK6+DfbU7fT8RTLFWd5PSYBCFqTVsqlQmkOEH71EA42QuteK9bD5PU92Hi6Gnp
         eyFZ0CXNkg99q81gwY9pPhCNkwl6ilVljZqvEhDCsCcLAnQomlwaZKw0nkA7+oPfY8Tz
         padTldb3lTza4u5Bx0FDiWGY152YWeSPPLIH7cmnI+SJ1CqAfqIH5XPe3GgqLTnUkVyx
         Op7qjPAoym8YjCkckdbUY+JnTCch+sclbV+Co3vZwOKOMCZ/rwxK+9j2jPMJdgMnpqNX
         rhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcibVGuAgeLy6ipk3Rt9rlmC/7l8eU4A6PyVQlxC66f4cDECmeOjyUgSvvGAqxLhwraps3d+0D54yITqqEOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZNFdGIUru+/90OctZEqPD+ynytaFzcR3hIh/uKD5m3CcTkCxp
	7PIz5x0q4Gw9zGFPYUWhRw2qnZya0HSugFjtA2TwxOFriG6VsOan+tL7LdMMskk=
X-Google-Smtp-Source: AGHT+IGjH/wqwzifWC85mnNCghQMRNaevAc3MRc1SI1ZJsOicR9cri3LYdbd5RxgvIaDuVDdAGoZiw==
X-Received: by 2002:a05:6000:4014:b0:374:d07a:c136 with SMTP id ffacd0b85a97d-374d07ac2f2mr5572813f8f.36.1725378439436;
        Tue, 03 Sep 2024 08:47:19 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb592sm708368466b.13.2024.09.03.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:47:18 -0700 (PDT)
Date: Tue, 3 Sep 2024 17:47:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 5/5] pwm: airoha: Add support for EN7581 SoC
Message-ID: <t2f5kockuvfi66qqumda6jxf5a4c4zf35ld5ainsnksavkchyj@kdueaqlhjoar>
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-5-98eebfb4da66@kernel.org>
 <yfqmlca6cnhrghpo5s6tml36tngmekcfbyjakxs7or7wtap3ka@7qlrxjowo4ou>
 <d9298199-fe10-4b28-8e28-dc252bd6832c@genexis.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ohdzxy7xz4ztpby7"
Content-Disposition: inline
In-Reply-To: <d9298199-fe10-4b28-8e28-dc252bd6832c@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_084721_994549_02E2A5F6 
X-CRM114-Status: GOOD (  32.57  )
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


--ohdzxy7xz4ztpby7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Benjamin,

On Tue, Sep 03, 2024 at 01:58:30PM +0200, Benjamin Larsson wrote:
> On 2024-09-03 12:46, Uwe Kleine-K=F6nig wrote:
> > Would you please add a "Limitations" paragraph here covering the
> > following questions:
> >=20
> >   - How does the hardware behave on changes of configuration (does it
> >     complete the currently running period? Are there any glitches?)
> >   - How does the hardware behave on disabling?
> >=20
> > Please stick to the format used in several other drivers such that
> >=20
> > 	sed -rn '/Limitations:/,/\*\/?$/p' drivers/pwm/*.c
> >=20
> > emits the informations.
>=20
> The answer to your questions are currently unknown. Is this information
> needed for a merge of the driver ?

It would be very welcome and typically isn't that hard to work out if
you have an LED connected to the output or a similar means to observe
the output. An oscilloscope makes it still easier.

For example to check if the current period is completed configure the
PWM with period =3D 1s and duty_cycle =3D 0 disabling the LED. (I leave it
as an exercise for the reader what to do if duty_cycle =3D 0 enables the
LED :-) Then do:

	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
		.period =3D NSEC_PER_SEC,
		.duty_cycle =3D NSEC_PER_SEC,
		.enabled =3D true,
	});
	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
		.period =3D NSEC_PER_SEC,
		.duty_cycle =3D 0,
		.enabled =3D true,
	});

Iff that enables the LED for a second, the period is completed. The
question about glitches is a bit harder to answer, but with a tool like
memtool should be possible to answer. Alternatively add delays and
printk output to .apply() in the critical places.

> > > +#define airoha_pwm_sgpio_clear(pc, offset, mask)				\
> > > +	airoha_pwm_sgpio_rmw((pc), (offset), (mask), 0)
> > > +#define airoha_pwm_flash_set(pc, offset, val)					\
> > > +	airoha_pwm_flash_rmw((pc), (offset), 0, (val))
> > > +#define airoha_pwm_flash_clear(pc, offset, mask)				\
> > > +	airoha_pwm_flash_rmw((pc), (offset), (mask), 0)
> > > +
> > > +static int airoha_pwm_get_waveform(struct airoha_pwm *pc, u64 duty_n=
s,
> > > +				   u64 period_ns)
> > Given that "waveform" will gain some specific semantic soon, but this
> > usage is different, I'd like to see this function renamed.
>=20
> I suggest pwm_generator. Is that acceptable ?

This function determines the register values to write for a given
duty_ns + period_ns combination, right? airoha_pwm_calc_bucket_config()?
=20
> > If you limit the number of requested pwm devices to 8, the code gets a
> > tad simpler (because you can map a fixed bucket to each pwm device and
> > don't need to search during .apply()) and each consumer has maximal
> > freedom to configure its device.
>=20
> The main use for this solution is for led-dimming which uses the same tim=
ing
> among groups of leds. Most (of our) products have more then 8 leds in tot=
al,
> with a limit of only 8 pwm devices it would not be possible to use the
> mainline driver with our hardware. I suggest that the current logic is ke=
pt
> but properly documented in the limitations section.

Fine for me.

Best regards
Uwe

--ohdzxy7xz4ztpby7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbXL4IACgkQj4D7WH0S
/k7Qxgf9HKjh6qEXybuTmQsw9gXqCLG6sQDJ3eltrqYR5ftvRUSX2bTTaElsodvb
9ybgn2+uGwILAgr9v1bJO5q2fdzbz2zkNQFni+drU/p5HdGMKMk+YFDUnNLfIn4n
UzjD9kIPDy3Vzud/yHLRipP6Wx3EsqGhC6pLD6fJkHI9m1OdSYzVXhMUkKDhZuNT
awjxQL2cojXnkT5P1LggRuod+rFEZvlVDtrA76PkQlfUz4Thq+BHQcU1sjc+6Wh+
wgMaaGdl4W50Je77nYiZds7n5+KNgheNggsf3Z+BHUYEnjOAtYihydQw5U0pXeWM
Gccw6+nVraP9M4BPw5I2un855jsxIg==
=tWuu
-----END PGP SIGNATURE-----

--ohdzxy7xz4ztpby7--

