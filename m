Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E41C369B2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 22:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJUU5/KwFR6EBw6HmiWZSj5H1CAAPNYinIfo2az6p00=; b=n7HvAFgbkMfkIB30c7eROv9Ivn
	ZU8GQ8sXNXC96b1s1Qx3TFHMIIyG/MVMMryoXuyv9opzFMubxAgegDcQ/m29POz12GbbxybP2F2WR
	4UG1x0p+bS+oR2rKm9i1lkA5D7g7onqESbJpH1AEAdOf89pWX1cgEnkhWNMeerQTKs3WmPWO5aenZ
	uijlu+Xm/6pAM9AnKeXcpwzPBF/cr6MyaU6DyhdeEEBhKWjxGpRQAbfo642BLD9cq7FCN/4gOJKBz
	BnptBqOj21vApPycTNCi2Z4mjCPHYWCDOleuwz79guiQj2g4BDnAyQ2wZv/ypd6SjCKk+/QugSb/3
	KO0+8/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SMi-00000003jw2-39Se;
	Mon, 14 Apr 2025 22:33:20 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SJx-00000003jak-1eXO
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Apr 2025 22:30:31 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so8430614a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Apr 2025 15:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744669827; x=1745274627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJUU5/KwFR6EBw6HmiWZSj5H1CAAPNYinIfo2az6p00=;
        b=R2k04nzOlWB24IwVYuaQ7pY+kkBvGAiXS86f+ugiq30DMON3hglETkx30Bjmg6+hwg
         FeU0UfyRNbjiW7teRFbXUqIU0x4CpgRoVlHDoX/nFDP1tfz3RsK92EVHtUzah65svmDl
         rr6COTsfzEg2Mn51sRgA15IaqqNE+odUzVNW/CqE18qW2q6xoJbZAgmkkhK5eabslluS
         8tJ1eUyMOYqEBUHBY0ig/1FH0GXVfRpG8HhAwxZiaj/plidqG2g1/yMPSv9TCmYRaQG4
         GPXKtanp0Bv5d+OE2vfzbR84pZBwCeG851GW79r37202TlkFybMxDV/h3nb0UculrLJt
         6uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744669827; x=1745274627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJUU5/KwFR6EBw6HmiWZSj5H1CAAPNYinIfo2az6p00=;
        b=YLgdCQ+82B24xYUt0QvorB5Y/i222UNCMzJ1NEy4o6Mo7mfLl9aYGaNIcu0Xm/En7j
         iQcQR2q+CZLcs7JH9dYqPV8g7kAYWyDflME4u5NjcwdrSDBZrp6XcUpacZ9Ox6ZjnDiQ
         TMr900rZHDeO/U1FJQRHXgn5kzv0bLt0pjBeEW+UDVGx8aSCw8n4u0ba9YV9ZrM+ikzX
         YVUFNC6BogBTuINy73KA45wycS/mO2+xCN517Bx+gpoWK1k+oPUf+kOYwzc1as1GixQm
         7f6Fcsj68AProBc1ZKg2A0Srw2HX2ZDK3pPnhdib0UCRNPmsH+ryBcGH6jDNRtOsRhnO
         +u6A==
X-Forwarded-Encrypted: i=1; AJvYcCW+s9wZsKVAvCipMCoi5qvbURzWnUg77xHwdd1Q4qKAmjEN64ZS764GloQ8vuyw43u476PUWsO8zfqsBRU9Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAvNw1wZ2/rovUf0eMqAc7PVlsjxH5wA88/0wFpTTQOZZqXxa2
	9DAdYFmDgEUStW5wFFupC/+k6TzaFbz+j4hJYd+byk+eneDrFp32JQH2BsyVP90=
X-Gm-Gg: ASbGncukJOtBiELnwsxNXWX5xkcO56quhN5GQUER9mc/nG2dZ9nfrXG9CidMiy1LMQP
	d2nNJsoBVUhh9x3dl8mWhfLo2jw/Lil6pkmQHv2vCdKN8C8S8sZ3xUexRRF6byRQfnYivpqC+1V
	Atj6PfwKNDK4aZqshlD8ukLeE0LNnK0zAHKNwYseFQPh6oA2ADtpZEZMhLBmKxw16anftJVPcUm
	9VGuX4RBr5zhFrnMNjQwRBd9CeoN2AImQ3/fEQ+lhWZvEhcOiUtWmjTj1+Shw1voI9at2TJelZL
	07+Zs8faZooYlZXROdS+DGVng5T9D48YJvv7ebMuNkaZhA==
X-Google-Smtp-Source: AGHT+IHZhK+qYZqSi1SpL+1u6PEyVqPY3kj7P/rJwDZYHQs5W9C/B5usPcBT3HSPzMoZrr6flIoa1w==
X-Received: by 2002:a05:6402:3214:b0:5f4:370d:96c4 with SMTP id 4fb4d7f45d1cf-5f4370d9b5amr5203042a12.0.1744669827520;
        Mon, 14 Apr 2025 15:30:27 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f36ee54d84sm5746425a12.8.2025.04.14.15.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 15:30:26 -0700 (PDT)
Date: Tue, 15 Apr 2025 00:30:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding
 cast
Message-ID: <erttkpna2hzg7zuddzlocaou2wqcwmgcxfhldwdt55yleie6dm@nfg374fv66fq>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsmmcnqrrufeyjni"
Content-Disposition: inline
In-Reply-To: <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_153029_809054_D539314F 
X-CRM114-Status: GOOD (  34.35  )
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


--tsmmcnqrrufeyjni
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding
 cast
MIME-Version: 1.0

Hello Alex,

On Fri, Apr 11, 2025 at 02:35:56PM +0200, Alexandre Mergnat wrote:
> The RTC subsystem was experiencing comparison issues between signed and
> unsigned time values. When comparing time64_t variables (signed) with
> potentially unsigned range values, incorrect results could occur leading
> to runtime errors.
>=20
> Adds explicit type casts to time64_t for critical RTC time comparisons
> in both class.c and interface.c files. The changes ensure proper
> handling of negative time values during range validation and offset
> calculations, particularly when dealing with timestamps before 1970.
>=20
> The previous implementation might incorrectly interpret negative values
> as extremely large positive values, causing unexpected behavior in the
> RTC hardware abstraction logic.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/rtc/class.c     | 6 +++---
>  drivers/rtc/interface.c | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index e31fa0ad127e9..1ee3f609f92ea 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -282,7 +282,7 @@ static void rtc_device_get_offset(struct rtc_device *=
rtc)
>  	 * then we can not expand the RTC range by adding or subtracting one
>  	 * offset.
>  	 */
> -	if (rtc->range_min =3D=3D rtc->range_max)
> +	if (rtc->range_min =3D=3D (time64_t)rtc->range_max)
>  		return;

For which values of range_min and range_max does this change result in a
different semantic?

Trying to answer that question myself I wrote two functions:

	#include <stdint.h>

	int compare_unsigned(uint64_t a, int64_t b)
	{
		return a =3D=3D b;
	}

	int compare_signed(uint64_t a, int64_t b)
	{
		return (int64_t)a =3D=3D b;
	}

When I compile this (with gcc -Os) the assembly for both functions is
the same (tested for x86_64 and arm32).

>  	ret =3D device_property_read_u32(rtc->dev.parent, "start-year",
> @@ -299,7 +299,7 @@ static void rtc_device_get_offset(struct rtc_device *=
rtc)
>  	if (!rtc->set_start_time)
>  		return;
> =20
> -	range_secs =3D rtc->range_max - rtc->range_min + 1;
> +	range_secs =3D (time64_t)rtc->range_max - rtc->range_min + 1;

In the case where no overflow (or underflow) happens, the result is the
same, isn't it? If there is an overflow, the unsigned variant is
probably the better choice because overflow for signed variables is
undefined behaviour (UB).

Respective demo program looks as follows:

	#include <stdint.h>

	int test_unsigned(uint64_t a)
	{
		return a + 3 > a;
	}

	int test_signed(int64_t a)
	{
		return a + 3 > a;
	}

Using again `gcc -Os`, the signed variant is compiled to a function that
returns true unconditionally while the unsigned one implements the
expected semantic.

>  	/*
>  	 * If the start_secs is larger than the maximum seconds (rtc->range_max)
> @@ -327,7 +327,7 @@ static void rtc_device_get_offset(struct rtc_device *=
rtc)
>  	 *
>  	 * Otherwise the offset seconds should be 0.
>  	 */
> -	if (rtc->start_secs > rtc->range_max ||

The original comparison uses unsigned semantics. With start_secs signed
and range_max unsigned, this might become true if start_secs is less
than 0.

> +	if (rtc->start_secs > (time64_t)rtc->range_max ||

This new comparison has a similar problem: If range_max is bigger than
INT64_MAX, its value interpreted as signed 64bit integer might be a
negative number and so this comparison might become true unexpectedly.

So even if UB doesn't play a role here (I'm not sure), it's not clear to
me why you consider the issue of the unsigned comparison worse than the
signed one.

If this is indeed beneficial, it needs a better explanation than "When
comparing time64_t variables (signed) with potentially unsigned range
values, incorrect results could occur leading to runtime errors.".

Maybe you have to replace

	rtc->start_secs > rtc->range_max

by:

	rtc->start_secs >=3D 0 && rtc->start_secs > rtc->range_max

instead?

>  	    rtc->start_secs + range_secs - 1 < rtc->range_min)
>  		rtc->offset_secs =3D rtc->start_secs - rtc->range_min;
>  	else if (rtc->start_secs > rtc->range_min)

I didn't check the other hunks.

All in all I would suggest to split this series in two:

 - Adding support for mt6357 in the rtc-mt6359 driver
 - Fixing overflow issues in the rtc core

Given that I don't understand the intend of this patch, I cannot say if
it should be included in the 2nd series, or if this is yet another
standalone topic.

Best regards
Uwe

--tsmmcnqrrufeyjni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf9jH4ACgkQj4D7WH0S
/k51FwgAsL7mzjW04I3FbsimeTdILk9y1+3zCv9FAZYVpWnaNgF1Ug6wloE92sfC
A6VZrP7eNxWVQ9EcrpIqph4n6AnLEukD2eY9MeSndzqnJJQWJuJ06aafMX7DvkJh
lvvXOn6lX1VI0gjX/pYu4ayTiJ2iBLyXJXM5Pk1E2raJJfF1r5cuRJPXPk0HNwgL
pHIOgpIQKEO1OxYFY8Q7W/af63h/ZmqvQadBh4gPEpDGDKvHG5DgA3G2BMAhqiDX
fvNL/hqBmRa8FC7e274ACveXF00oTDU5uGP/ezWx+U5J2K5wIb3kBzd1BDhIaNFS
oOLoIX9qnbCZ1GOtLtXWLAkT7Wjm4A==
=bJIL
-----END PGP SIGNATURE-----

--tsmmcnqrrufeyjni--

