Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA19FC87FCB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Aug 2025 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VH/RNGwsGxAQ5onQ4CWDXuDU973vpIbBVYO78gN0lAk=; b=B5C7wHaAFcXbcH3xIlT19yqzDA
	tOyp9WEzjkO90E4mrwljJyr5JPzbga+D/nfhQxzhhY+0C0DAKmeba+gUBrVKv7kZALO1eTa46GnZu
	UImkCyEBSWnFPAwFlYFJD90+JMIO6efqKLKCZDI1E/M8QjPb1npvfzo4D5NvoOECkG3iAhuPpKf78
	gSjBe4dMbtg8cmmmKxJAeCJYYr0lNpZ3Y5XUNrtkSHpZWigvwT6JEq8cniHnHzHnJhcmnBcGmt4sN
	mGOriyUbOicI9D0QJ75uxqh1A2wpuxe5ZgxootMTD+q0eS7SLNnl0T8qG02Ild/PsqVVVTgof7ymR
	OCu66g5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfRB-0000000FTsR-1NS9;
	Wed, 06 Aug 2025 14:48:17 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfMo-0000000FTNf-1JnH
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Aug 2025 14:43:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b7848df30cso590071f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Aug 2025 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754491424; x=1755096224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VH/RNGwsGxAQ5onQ4CWDXuDU973vpIbBVYO78gN0lAk=;
        b=KGVAYpPKwSlK0bqKOzi2wa8GNgU/oAbIdL72l+3nMWXWDhBh4bZc+dKreZSx69/vLS
         q6jO1dJSKlnfX+RtQ07lw/TXjYIeXf4Y750h2AHb9QwLMu/2VyzX3N+7u2JseoEIkP3l
         wo1wXQlBQ8AN5HqgX0nvRzpoDKqlZKIKgLW6iaxFBf6iRZuOSSosbgURsGKZWTtADNvC
         MG0UAIrwK7s1F+Kde1lLQP1AFq+wnhldq+o6nZq4jHuAkSSk1z6hWw69GjvNZOeJCmRl
         kMoJe5uMo9c+M0LuWXRQfD3ie4RncuRbWAUmDp9r08s2IgLYQWPkCqBitOhRSPF8/t8y
         27ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491424; x=1755096224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH/RNGwsGxAQ5onQ4CWDXuDU973vpIbBVYO78gN0lAk=;
        b=lYhqjkxOD4VilLhE+3hyZa30+sNiu+qv/WCdoHAak3x9nQDf3CxPGnrgI0LJ4cPjZp
         fvgSf+uhZ+fH8YcqQ92VJjoH535NmzqxZzffv2bFF2tKWh4lxYMmGo1GFcqybVLToX+L
         RmpxF7orTtdxTU8AMA3qSMdMR83INe6yv3EiVWsR3cFMXjtoO80xXqhaN2P8+se/UsfB
         Qu+TvR0x2oZ+YbRtCcP7waV2FAzwvZDOoD74Jm3Y9fmVjXXZPS720vSGpevAGToZXvdc
         8Okg0G1w/VVSOZ4CddnUzTs4Q1E18/k05vmzSJ6xWtHD/pEmbcHCBe2OsvR4CwQhnUb8
         wZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX37Q/PhZp6cFB1E6mOdwyygM+wVyVXhYZNpJe7fDNZnIKnkKQqvp6fq764JHSa46m2L0cZBO2bZ14zpLnoDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ6E86VPKFIr6B00p3orGNE+LGjSdsfAfktJ7RhDGb3DaE9ZxZ
	MsSYznye1057eU2/wkgYZXRUhpDinesnV9h1FqXEUZHrwiVcstthSXeYxILqUhjvkJ0=
X-Gm-Gg: ASbGncsB70v+CQHgCXYdvvPp/FpcV33hD3obCKfncWDHJeFs5NHEgVUIT6mkNUHa7Xr
	xujZ+8yYLhq83nPuQMik/8rsuYaLHABUQcrAy3fZLI28BrnOM3qUaK8WrSRCt+yzXL/IbeWJQCv
	qZSy+x/FjU+rQmzGQFfMnO/FdZFeBLQPMn0fGjeVCJiQ/rdKg2uXVafgqn6eDYhxWQG1Ot32If9
	VLTjV2VWV/lOlBuQRQ68adxlJxYwE6rM0mz8PnY0bg4+JJDyOgPG2FJC0JIuBjvloYGez7NXUUj
	3vHQpUi2wdMi5km8RnrTqv5xvU6WHEKCgNYCfh5TdBrZGGHqaRz00wCllbSyYclo31JX2GsT80s
	olUqiakYrc0BiwOvOMKgf1zB+k+1i8scmPf7KuHvlREFQTV+ynHTN8hEXJPpI20ld
X-Google-Smtp-Source: AGHT+IEjopSKCdy7U8FKkZXAjb3CuQDXRTKLcweLWBxM8N+4unfyWADRxJ/f8jD1TFxZal7semg4Og==
X-Received: by 2002:a05:6000:2c11:b0:3b7:8f3b:1726 with SMTP id ffacd0b85a97d-3b8f430c2f7mr2812824f8f.7.1754491424474;
        Wed, 06 Aug 2025 07:43:44 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3ac093sm24451789f8f.9.2025.08.06.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 07:43:43 -0700 (PDT)
Date: Wed, 6 Aug 2025 16:43:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 0/8] pwm: mediatek: Convert to waveform API
Message-ID: <dwycjujhxtxgjyjpfsgm6xttrgcskdobtc7dw5sts2fuutcwxi@5v7ekobsjojv>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdu3m3k3aua2dak5"
Content-Disposition: inline
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_074346_579838_70C67C79 
X-CRM114-Status: GOOD (  21.72  )
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


--gdu3m3k3aua2dak5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/8] pwm: mediatek: Convert to waveform API
MIME-Version: 1.0

Hello,

On Fri, Jul 25, 2025 at 05:45:04PM +0200, Uwe Kleine-K=F6nig wrote:
> here comes v2 of my effort to convert the pwm-mediatek driver to the new
> waveform API. Changes since (implicit) v1 (available at
> https://lore.kernel.org/linux-pwm/cover.1751994509.git.u.kleine-koenig@ba=
ylibre.com/):
>=20
>  - Rebase on top of the latest fix for period and duty setting
>    (https://lore.kernel.org/linux-pwm/20250724210041.2513590-2-u.kleine-k=
oenig@baylibre.com/)
>=20
>  - Don't report a disabled PWM when the PWM is disabled. Though that
>    seems counter intuitive, this is the only way to allow the consumer
>    to query the minimal period. This wasn't necessary in v1 because back
>    then the driver claimed to provide a non-disabled setting for
>    duty_cycle=3D0 .
>=20
> As before the patches in the middle don't serve a functional purpose
> because the last patch removes the changes again. Still I consider it
> useful because it reduces the last patch to what is needed in such a
> conversion.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=F6nig (8):
>   pwm: mediatek: Simplify representation of channel offsets
>   pwm: mediatek: Introduce and use a few more register defines
>   pwm: mediatek: Rework parameters for clk helper function
>   pwm: mediatek: Initialize clks when the hardware is enabled at probe
>     time
>   pwm: mediatek: Implement .get_state() callback
>   pwm: mediatek: Fix various issues in the .apply() callback
>   pwm: mediatek: Lock and cache clock rate
>   pwm: mediatek: Convert to waveform API

i pushed the first 7 patches to pwm/for-nexxt now. I found a twist in
the conversion to the waveform APIs that I first want to think about a
bit more. The problem is that a setting with a small duty cycle now
reports the PWM as disabled. While this is technically correct,
this isn't helpful to let the consumer find the smallest possible
period.

Will followup when I left the current rabbit hole.

Best regards
Uwe

--gdu3m3k3aua2dak5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiTahsACgkQj4D7WH0S
/k5qWQf9GMIt2sdEo77P7lLjheoo6iqKh+5H9p8KulcNmovIksZ/n06236dor+ch
JNG9DV2LJVxV9XOTHD43lXGOS3BnovK0qAyCnF+iQgLd+6Bbx/WpQfhHn0PieqXy
5jCWDAWc8L8TALhfqb7PssQlScPdTS+PHj0lhDiAMWTuXshENDmO6kKB/dHT5aln
E/trUXgP9EScJZZWpcyYspwFSGcQqaoM5Z9h1IZZOA8J4+F/epjR7AQ9sdaCQz9a
+WJygPOPYCRydbojXrekRPA+6c3MphrSXKKR+HS8cOFbG9SlwMRc9DyXTagZ6ehR
ZkCGiMh3Gfsr5CXjFuiI/Q+lmeKvug==
=aEYh
-----END PGP SIGNATURE-----

--gdu3m3k3aua2dak5--

