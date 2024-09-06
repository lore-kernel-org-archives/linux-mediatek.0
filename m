Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900F7CE7AB8
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 08:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQvbYq6pNLNyrzB6hmoKjly+61yzZeAqFNQbX336muU=; b=RLLzwXGvPCtWIqOmKjxXgVITCI
	4hyWzqHuWo7mP8zu32pr9ydXBNKF99sMWdnEeT9cwTW3/NBAM5RSv7exqpZdK2zWqbAFy3OHBu2VO
	wf6q0dYyjLD02VwtwZ0LsSlYGO6znCIO6ylOonNuVvXN8uxslbFA8ISaEV+93HbnLP5tnT/cvt2up
	hkBpoPphcckUTBQSHkuOz6NpkzvS6YM5LYbnbn41Jt4nDVoJOMFd8QtT4nHvXmNLlXwpWaZ+pXCQh
	iZlB27O5fZK1RnxmlECm+z+Rrzq7aVgtp9arJvX9hYBiqhFfCuIAUGeXnAAWbFwD4LCoDwx4OJ+Bt
	PMLxWvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTvZ-0000000BDXW-4C3J;
	Fri, 06 Sep 2024 08:02:46 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTuY-0000000BDIB-3wgq
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Sep 2024 08:01:45 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a86883231b4so252056666b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Sep 2024 01:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725609701; x=1726214501; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jQvbYq6pNLNyrzB6hmoKjly+61yzZeAqFNQbX336muU=;
        b=BbdJHIS1CRVE+2qqKsthicrIxatHpwbGiIn/R34RQjAmuZ9zPImTsQ9jNgE8wnhHHy
         851JEy/uhEmvD454mUXx6S+1llVXRpArr7SJB6x5UgZwDMe8XvDzsbJU0SmsJRjNj9vH
         2OI0e5R4shnspgmBEMDTHU9UCSOKq7iISI+bv2fM/4Y9FuodRB+pFfS9TrDnZ0kMkFUt
         fVyFHKSkhRRHIcrwdOe6jzabE9H4yoZTXTMTlsbD2FzIA3vgq5JXQqr323YBW5ETcMnW
         26KrxlnxKyTZdErs6dwhoOXeYQl8BxzB/CixYZU47u1De5D8B8v7UDmBw4OSXQaUfFit
         8xWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725609701; x=1726214501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQvbYq6pNLNyrzB6hmoKjly+61yzZeAqFNQbX336muU=;
        b=QsdpjmNMHX9kGMkFinpBviA+UDzto0biGbYSneufcEpb4E738Ln6MWWGf4mcxdctvg
         9ynHHYuXHqe8QntC97FR8NEhfAzzZMXI4HyjXoTBr+dkgAil23+CKfC1jGu+IIJb3OSF
         YPPYD/JVQP6oL1UPH15v7CykVRWwm8hsZdvJUksw2lB2rB+FUk7RQiJFbFKnCxSab6xB
         PyVbVatGJzL5y9uVs6/PlEnkj17x71HebZK+rLx+XXSnHdas7+hhbOBHTXOMad6ljX+0
         ljbH68P2naDkfV/Wtuk4E+VUML5j2Se+BlyTP/puv37DG6YkKwiaS+JEgNc7HgRJ4Z6y
         YE0A==
X-Forwarded-Encrypted: i=1; AJvYcCU8je9HT1J6R8pqKZM4IzDkk1KG7Y0jQM6vcD7/lvb1cgHv/x09V8Sk6MOie6nGJvo/w4TPJRjHDvn9jiwA6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWNH1cRlqMsT6rYT8rJ9vehIxGgYEgc37rwVCm99xs/h5lxdhZ
	m4TwEZO/NeQn/22P9fbBP+EA+Oz1+xFr170YjAYNICdcY5767NJ96lBVFdSpVf0=
X-Google-Smtp-Source: AGHT+IG8E3LOoiGm9tm0UMDa+bzSBffhey9xpittTq7KTbZV46TsbWgu10IWTfbVHXWDDgolB9jGjw==
X-Received: by 2002:a17:906:c156:b0:a80:bf0f:2256 with SMTP id a640c23a62f3a-a8a885c01admr130622566b.8.1725609700793;
        Fri, 06 Sep 2024 01:01:40 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623a6ca1sm243488366b.173.2024.09.06.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 01:01:40 -0700 (PDT)
Date: Fri, 6 Sep 2024 10:01:38 +0200
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
Message-ID: <e53ye6cu5debj2jn5uv4vxdujedwf4gu3ocuk5ccbhzkhosk66@hovtzgbqhesm>
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-5-98eebfb4da66@kernel.org>
 <yfqmlca6cnhrghpo5s6tml36tngmekcfbyjakxs7or7wtap3ka@7qlrxjowo4ou>
 <d9298199-fe10-4b28-8e28-dc252bd6832c@genexis.eu>
 <t2f5kockuvfi66qqumda6jxf5a4c4zf35ld5ainsnksavkchyj@kdueaqlhjoar>
 <b7e44fb2-6cf6-4530-a271-9e1730d4f431@genexis.eu>
 <xmlta4za6malgthd6cmt5fcipxgyzwmqwxqdg5e4qahcuqzcrt@eidsf6mexrkz>
 <a0a14b57-cc4e-43ef-984f-fb405949b41d@genexis.eu>
 <64zfjgmc2dutmsukg2bxhb44k3wu2y7tt3h26hej7d4fx5nc7z@5zvo3hsucipc>
 <2e8806fa-c476-4cfa-bc2e-dc02754830d1@genexis.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="65osrcmfvpzrxq5g"
Content-Disposition: inline
In-Reply-To: <2e8806fa-c476-4cfa-bc2e-dc02754830d1@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_010143_097728_BA922685 
X-CRM114-Status: GOOD (  33.81  )
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


--65osrcmfvpzrxq5g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Benjamin,

On Thu, Sep 05, 2024 at 08:35:17PM +0200, Benjamin Larsson wrote:
> On 05/09/2024 17:39, Uwe Kleine-K=F6nig wrote:
> > On Thu, Sep 05, 2024 at 02:18:41PM +0200, Benjamin Larsson wrote:
> > > On 2024-09-05 11:30, Uwe Kleine-K=F6nig wrote:
> > > > 1 second long pulses with a period size of 1 second, so a constant =
high
> > > > signal?
> > > Hi, I think I was unclear. The SoC documentation is not that detailed=
=2E But I
> > > think I understand how it works now.
> > >=20
> > > One register contains the minimum duration (d_min). And then there is=
 one 8
> > > bit register for the signal low period (lp) and then another 8bit reg=
ister
> > > for the high period (hp). Per my understanding a change of polarity i=
s then
> > > just a swap of lp and hp.
> > that doesn't sound right.
> >=20
> > A "normal" waveform with period =3D 10 ns and duty_cycle =3D 2 ns looks=
 as
> > follows:
> >=20
> >     _         _         _
> >    / \_______/ \_______/ \_______/
> >    ^         ^         ^         ^
> >=20
> > assuming a monospace font that's 1 char per ns, the ^ marking the period
> > start.
> >=20
> > Ignoring scaling, your hardware needs to have hp =3D 2 and lp =3D 8. If=
 you
> > switch that (assuming you mean switching in the same way as I do) to hp
> > =3D 8 and lp =3D 2, you get:
> >=20
> >     _______   _______   _______
> >    /       \_/       \_/       \_/
> >    ^         ^         ^         ^
> >=20
> > which is still a "normal" polarity output as a period starts with the
> > active part.
> >=20
> > I admit that's a bit artificial, because the waveform for
> >=20
> > 	period =3D 10 ns
> > 	duty_cycle =3D 2 ns
> > 	polarity =3D inversed
> >=20
> > looks as follows:
> >=20
> >       _______   _______   _______
> >    \_/       \_/       \_/       \_/
> >    ^         ^         ^         ^
> >=20
> > which isn't any different from the 2nd waveform above if you ignore the
> > period start markers (which are not observable apart from the moments
> > where you reconfigure the output).
> >=20
> > However it matters if you have a chip with >1 output that are not
> > independent.
>=20
>=20
> Ok that was a clear explanation,

\o/

> anyway the pwm hardware is then not capable
> of a polarity change. It is possible to change the polarity via other mea=
ns
> but there is no way for the pwm block (and driver) to handle this.

That's ok. Just do something like

	if (state->polarity !=3D PWM_POLARITY_NORMAL)
		return -EINVAL;

It's quite usual that drivers only support a single polarity.

> > > This means that when requesting a period and duty cycle you need to s=
earch
> > > through the configuration space to find the optimal value.
> > Or restrict yourself consistently to something simpler than a exhaustive
> > search through the complete configuration space.
>=20
> Is there a recommendation on what is more important? Period duration or d=
uty
> cycle percentage?

That really depends on your usage domain. Just pick an algorithm that is
sound, ideally easy to review and serves your purpose. If you pick
something that is too simple for the next consumer, we can add the
needed complexity still later.

So in my book even something like restricting the period to a single
fixed value and just modify the duty cycle is fine. In that case add a
comment that there is room for improvement and I'm happy.

Best regards
Uwe

--65osrcmfvpzrxq5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbatt8ACgkQj4D7WH0S
/k73SQgAsrvkq9kEh8aH3RvAEdsHuYA0ZIv7Ihe7JrjpgcbDe5blnQv651GAUjTa
zgJsSFmOJuktvsRM0j9G1dh544VxasDLkDRcVhb4nQYPrap8QgmKRtUPHY0EN8TG
+wWZmiqWJktR0RN8ph01Z25wSGwFbWIKV36Sl5fWzZl/jrUJXIQPF2RO1LeLuEci
bqMy893GGCkB4j0n8a1lLmRD/T8EakqXFB5Jc8eKhTGId/9BprtcXS+6n2u3cS+M
K6/mYB2/VUmm7JuSH117572R6cbsvlSqJ3Sk2yIPPxIgLvdG7+NVltvktsxjlV4t
OWDu+/QQl5PTldkXvIsm6PZKvXw3cQ==
=5qTG
-----END PGP SIGNATURE-----

--65osrcmfvpzrxq5g--

