Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5321CD5BA2
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OukU97CSMGxT3uwDMoEVzMhIgXm52avuG4qSgwd2MBc=; b=Hd15AhUdzUxE6+w+gaDS5GtR4E
	PeRUxs+FfUE67MyLDK5LfvaBuq7ByCgw99y1T7786FlQu3MW3XRoFS9yzXhxYX+gWuAvYqsHL7hRs
	ouhX+aMghabB2AYjgkzRXIoR++FjRYIm/Nv1x00q+j6MV26fgt+xkfn4pBmUBSbMhckst9FU+abe4
	C2q+xFA2OpA5SDF7sqYIJSiSMUw17B3rLxWeU2LmKkUfNF8gdjbuJKD3v7vEUAUNZfVOe2x7XX78p
	ONymCPHg1As1N+UweGB6sROU3FOufFwetma5dwZ7RVhLfOWG5nv0AhpuCqco0jbGHsUhc+7N0HdAX
	+JYVD4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8pu-00000007mMa-0n9C;
	Thu, 05 Sep 2024 09:31:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8pB-00000007mAM-04z8
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 09:30:46 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso904760e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725528642; x=1726133442; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OukU97CSMGxT3uwDMoEVzMhIgXm52avuG4qSgwd2MBc=;
        b=A4fyiHq3JmuBP1AABFS7FZzUvDktmAyqX6Soxm2FP3rB5tAzc5b6ycg/5sb8g3ksTH
         e49Xf6K2JW+1zRDJFeOpzLDqXT05wFjF1SWbShVy5/iaF6DuElj02PuvmZ0YrTGXazz3
         SWNtai/gC9ua9v+8fnmy0cWZ5IjOqYob9BByR+nTUwDSvdu7LNMzdRQom8WoOJ48RwB3
         cE7MREZXSJ7RugrunGok1Y7ZCvzWBCBJu3kAoUCRhDanQdav/E/wMbgYNK+zN4oqPekb
         M6Zl5zKKLaG6ACGTmxam3ftBWUmF1Y0WO9AzFlugFQQkfRJmT1K6c/K02SP5Xy0m9tDf
         LwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725528642; x=1726133442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OukU97CSMGxT3uwDMoEVzMhIgXm52avuG4qSgwd2MBc=;
        b=jUNN1drfyZ1EBy4puao3oK1tWUK9aSpa5mYv4bfFGdk60SbHHl9WY6XCYEgZSHD4N9
         e061T5WUACjj/WJxOKLgBQbdSYZNlj4K3SYJ9ebT7P8Kyz5/fThovpetYDhhvnuBrWut
         bunWxSv6kRuHYnEMk3lTH5Gi9kiW60iTCPNmhLt8H1TUQIfXlzl+Q8Dr9eXllVkFeKgV
         YQtnR0KOVyzGYLP97c6hpBMciaxcOFL8/LNf+lV6a5KxzkhZ6GjssVqc0GODxE9lmdfS
         iYpe49DtOuQLydK4ujmpgvZJmUsgviEIf2zk/thw1hSo/y+fEdqnAhAE5d+7XDUmNxI8
         O8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw/F0tUp48K5/FwHov1ac9wSQiGvROddws8rtQvaYj3/bg0HahdJwUOXOZDuW4GuaKYgioJBK0mN3gJZkOcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXKa/5pDBbASQP0NyTls5ku0uzdjDWMQ6CUN+1zcpIf5qnVCCh
	9lZNsP8v09OOWyW8TMlY6zsD43Gc1kVtZWbg9mzMBE2oya6PmBCd0uxl30E47Qk=
X-Google-Smtp-Source: AGHT+IGl97KqbLMslldgmJDsArJp07y5GgcTUh6K+r7VA0eX5LCA05Il4GJUPsiAHiDhjNduobGdJg==
X-Received: by 2002:a05:6512:2523:b0:536:548a:ff89 with SMTP id 2adb3069b0e04-536548b0048mr444189e87.39.1725528642343;
        Thu, 05 Sep 2024 02:30:42 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623a9234sm109248866b.156.2024.09.05.02.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:30:41 -0700 (PDT)
Date: Thu, 5 Sep 2024 11:30:40 +0200
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
Message-ID: <xmlta4za6malgthd6cmt5fcipxgyzwmqwxqdg5e4qahcuqzcrt@eidsf6mexrkz>
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-5-98eebfb4da66@kernel.org>
 <yfqmlca6cnhrghpo5s6tml36tngmekcfbyjakxs7or7wtap3ka@7qlrxjowo4ou>
 <d9298199-fe10-4b28-8e28-dc252bd6832c@genexis.eu>
 <t2f5kockuvfi66qqumda6jxf5a4c4zf35ld5ainsnksavkchyj@kdueaqlhjoar>
 <b7e44fb2-6cf6-4530-a271-9e1730d4f431@genexis.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="43j4qp3ucvr7fjgi"
Content-Disposition: inline
In-Reply-To: <b7e44fb2-6cf6-4530-a271-9e1730d4f431@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_023045_092907_A66A2683 
X-CRM114-Status: GOOD (  39.01  )
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


--43j4qp3ucvr7fjgi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Sep 05, 2024 at 01:09:48AM +0200, Benjamin Larsson wrote:
> On 03/09/2024 17:47, Uwe Kleine-K=F6nig wrote:
> > Hello Benjamin,
> >=20
> > On Tue, Sep 03, 2024 at 01:58:30PM +0200, Benjamin Larsson wrote:
> > > On 2024-09-03 12:46, Uwe Kleine-K=F6nig wrote:
> > > > Would you please add a "Limitations" paragraph here covering the
> > > > following questions:
> > > >=20
> > > >    - How does the hardware behave on changes of configuration (does=
 it
> > > >      complete the currently running period? Are there any glitches?)
> > > >    - How does the hardware behave on disabling?
> > > >=20
> > > > Please stick to the format used in several other drivers such that
> > > >=20
> > > > 	sed -rn '/Limitations:/,/\*\/?$/p' drivers/pwm/*.c
> > > >=20
> > > > emits the informations.
> > > The answer to your questions are currently unknown. Is this informati=
on
> > > needed for a merge of the driver ?
> > It would be very welcome and typically isn't that hard to work out if
> > you have an LED connected to the output or a similar means to observe
> > the output. An oscilloscope makes it still easier.
> >=20
> > For example to check if the current period is completed configure the
> > PWM with period =3D 1s and duty_cycle =3D 0 disabling the LED. (I leave=
 it
> > as an exercise for the reader what to do if duty_cycle =3D 0 enables the
> > LED :-) Then do:
> >=20
> > 	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
> > 		.period =3D NSEC_PER_SEC,
> > 		.duty_cycle =3D NSEC_PER_SEC,
> > 		.enabled =3D true,
> > 	});
> > 	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
> > 		.period =3D NSEC_PER_SEC,
> > 		.duty_cycle =3D 0,
> > 		.enabled =3D true,
> > 	});
> >=20
> > Iff that enables the LED for a second, the period is completed. The
> > question about glitches is a bit harder to answer, but with a tool like
> > memtool should be possible to answer. Alternatively add delays and
> > printk output to .apply() in the critical places.
> >=20
> >=20
>=20
> I connected a logic analyzer to a pin and configured the pwm for it.
>=20
> I then configured the pwm with these parameters (setup for 2Hz).
>=20
> echo 1000000000 > /sys/class/pwm/pwmchip0/pwm12/period
> echo 0 > /sys/class/pwm/pwmchip0/pwm12/duty_cycle
>=20
> If I then ran the following (in a script) no pulse was detected:
>=20
> echo 500000000 > /sys/class/pwm/pwmchip0/pwm12/duty_cycle
> echo 0 > /sys/class/pwm/pwmchip0/pwm12/duty_cycle
>=20
> If I added a sleep 1 in between I always got 1 500ms pulse.
>=20
> I then did the same but with direct register access with the same result.
> Setting the duty cycle to 0 disables the pwm function on the pin, it seems
> to take a while before it properly activates but before it disables it the
> cycle completes.
>=20
>=20
> I also tested with enabling the pwn signal and then setting a 0 duty cycl=
e.
> The last observed pulse was always 500ms long.
>=20
>=20
> I am not sure what of your questions this answers and is there some other
> tests I should perform ?

IIUC that means to add:

	On configuration the currently running period is completed.

to the Limitations paragraph.

> For the record while toggling the registers I noticed that it was actually
> possible to generate 1 second long pulses. The documentation is not clear=
 on
> this part.

1 second long pulses with a period size of 1 second, so a constant high
signal?

Another thing that would be interesting is, if it can happen that you
get a mixed signal. That is, if you update from=20

	.period =3D A
	.duty_cycle =3D B

to

	.period =3D C
	.duty_cycle =3D D

that you get one period with length C and duty_cycle B when the period
completes after configuring period but before duty_cycle.

Best regards
UWe

--43j4qp3ucvr7fjgi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbZej4ACgkQj4D7WH0S
/k5xhAf9EPcXdp1Pl5jZjnIObpW0/xdCiScDgmou0lMZIm+blc6lkmB/qhCGIQ9k
BKqpP3E9L9wtcT+9VOg6PRd8cvri2K5d0t70K79H4y9hYDqdsvkJWhS2bXuE0cQ3
KmlqPMMRv89xQgBGJcZeDzVzrGZxNzBeuTpUoS3ij3+tfEcliluQKLWyn9kEfq1O
RzSnevhSNZn76LIkK0jX6bzcwY1a3H9xySGnYf8xmKdFRBNPYZa/ToAfAJA0IdSG
yGo7dr2tidwmdeKyz3c2ZuswaYKhGhgu7j3uukcq9unxhmkzyqiaK2zz0ktiyXa7
huaBYupjFR6t/UhFEv6yRv8hjQwZ2A==
=iEnI
-----END PGP SIGNATURE-----

--43j4qp3ucvr7fjgi--

