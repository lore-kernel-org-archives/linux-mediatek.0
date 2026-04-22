Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3604AF9B5E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2026 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aD5ZKvzwCJWOAYfguqrWQTS2cpGeKYz2zFLAh1cyFuE=; b=uwbGwyXgM2gmSdMCZiW8rFL7rC
	a9xgVNqeCV2fWGv75mmm1oCpBfIFtLL8Z/+AubUArvyF2reME24Ol1b7v3Uhf6duoDrJRV5BmFyjk
	/bS9JQH9WXvlTHA09gqBoHXSk1KR0J6ONpXsacyI2bCMrtjf1bl0tSS7Qg0CibUnDeFCaRlbzmElc
	fOj7/FZgyM1h7izI507jD0+3MbZcLy5yfgQlBeisJmzqF8FfGAnD5FnMXHINm8ATxT/+zRfantnhJ
	W891PjCKx/50L1XHTbLa0xWKcxYIigXbvr7hPcJvMRO90/YvqFeu21CfObCa4f3uw6tVDNhiM4yNJ
	3USZtXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFT76-00000009n2Q-3CZg;
	Wed, 22 Apr 2026 08:39:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFT74-00000009n25-0D3w
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Apr 2026 08:39:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48909558b3aso42974145e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Apr 2026 01:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776847152; x=1777451952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aD5ZKvzwCJWOAYfguqrWQTS2cpGeKYz2zFLAh1cyFuE=;
        b=OeNfdVrSgSCBEpxfgR0a9CjCuISBq9FxfLNcf4oqQ/z75Dw9QrBKvsk4ZR056/e0C8
         iaHGDoucHsHA4KvDGAp5T8yVt6EDzokPfowj24KtaDULngww3nc5RgDJIgYXhIat74bp
         N8CvBqkiB2Fu0L1aTvdO+wWQdcICKPW03OPtm9VtsRgDAStpLTclTwkOm8cQTzrHaprJ
         URIzJiiPFjQF5Gdrvbu0CqYWEAnTjWvNmbPcYPj8QE5vBLp92VYeQ1uHiqKPo69fHMAx
         6IPhX1n82FLxsEget82yPBSiFNWTcy5MntefyjxVXNTsrs8eEUDTgPvGIL2eN+GbKjFJ
         Qg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776847152; x=1777451952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aD5ZKvzwCJWOAYfguqrWQTS2cpGeKYz2zFLAh1cyFuE=;
        b=pQSLgfZ/bju/CW7xC/HhCWwQ4f4Kvd1/uRPzV5xT0sdzEpU7/bZVVWeJrrfDHFIvPh
         nvydt5EutkdhRoWVco/0y8oz0XIPjTvhrBWeFTHAKIf58iIW74FEZTWNUiLAOukqZGwt
         BozkeGmMNM62JSVfMNMr8w0shna7kpV0Qg/u0rAqZOB06C9oYr3Ug5bk7gH6rrgfBDK3
         csWqHfEcvlRbWLm5V2W6Mbn9bD6dHQy7hamqeRoAJleqeioBIwFK4C4aXBEjNjE4ylbv
         +7iOhCVrqBwPAFsKQBKISpGD/jVekSzILw31YvyeTZjpkySxrR7gHCFtDwzWyu3sRMfT
         6gaA==
X-Forwarded-Encrypted: i=1; AFNElJ9/c+khLYrFU6oC7NidXhTUeC1HvMGrU8mSzukmO0P7hwvPHME+8uSVyBndFNRbhEVPTVbSAGKxF8Doyo3v7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy34QBxloW3OBE7UBF5pdYyHvN3zr9NnLYO1YnbIks3gFlFVGSo
	BsMA4dw2kFefv1wPxT1A5a5IOEInrfy/vrX5dKfebJtVgC0wyGxqd2g/u1kpd9kvsMo=
X-Gm-Gg: AeBDievcszXVbtJNvJH2WkgtmRPi6xYJmZAi/MmMYICht+snyAwc+fzXLDOYF7C+74h
	KWeOpVweCWLwEepYuzmx2sAr/6DpDSFGufTTO2BR7WH5dOV+Fsm/qEk4349qn10zjGlRfrnY4q+
	f3qVws6a7WD/5mkQRDdVx5ppGpmQ68c1coIxENRF2m4v3z9XoNKBPpTVzFO+apqbu4MEcoqaY6y
	om3jNbiP82MAHXvF3FakvlOLvG1FRQcaxh0NVoaG5BkoWtiaSXvNDYBT1SgW5JW0sy0JOEPRYfF
	HdsuF1/rmv022M3WK3xHhx/pmOblBDtjnSMY1xFm6/5j0pA6oDTY5jsQV/XW/v6+Ne5llZ+5Nhq
	tZeZCaeYEQVaOS+cB6Nbcql6QgA29xO35LWbWOIm8F+L0PLl3WsGAIdhAuY42R2HdW/PECTDyOn
	ylb2tbqqE1UrjQfdp/+7QlLsv+MmQNHjJDJCtot7bA9QjOanEVZD/ZWLr3/4UBfIoLQ4kV4yYyx
	q7La2CzYv7Pgf0JLXkUbroTHg==
X-Received: by 2002:a05:600c:890c:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488fb7389a6mr245381575e9.4.1776847151437;
        Wed, 22 Apr 2026 01:39:11 -0700 (PDT)
Received: from localhost (p200300f65f114e08a760282010012dc7.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:a760:2820:1001:2dc7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488fc0f8188sm455887645e9.2.2026.04.22.01.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:39:10 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:39:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, 
	linux-mmc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Brian Norris <briannorris@chromium.org>, Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
Message-ID: <aeiHTPOA9jQrNWkX@monoceros>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
 <aeaMkfk_1t98e7SU@monoceros>
 <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
 <aecu1ixyHP2hQvgE@monoceros>
 <aehwG2Egt93-sPVB@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vqsqetyrnjrxwten"
Content-Disposition: inline
In-Reply-To: <aehwG2Egt93-sPVB@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_013914_380435_ACBB6983 
X-CRM114-Status: GOOD (  22.53  )
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


--vqsqetyrnjrxwten
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
MIME-Version: 1.0

On Wed, Apr 22, 2026 at 09:52:11AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 21, 2026 at 10:12:41AM +0200, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> > On Mon, Apr 20, 2026 at 04:46:56PM -0400, Luiz Augusto von Dentz wrote:
> > > On Mon, Apr 20, 2026 at 4:31=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Ca=
pable Hub)
> > > <u.kleine-koenig@baylibre.com> wrote:
> > > > On Fri, Apr 17, 2026 at 03:10:47PM +0200, Uwe Kleine-K=C3=B6nig (Th=
e Capable Hub) wrote:
> > > > > On all current Linux architectures sizeof(long) =3D=3D sizeof(voi=
d *) and
> > > > > this is used a lot through the kernel. For example it enables the=
 usual
> > > > > practice to store pointers in sdio_driver_id's .driver_data membe=
r.
> > > > >
> > > > > This works fine, but involves casting and thus isn't type-safe.
> >=20
> > To be honest, with the involved void* this isn't really type-safe
> > either, but at least the data keeps being a pointer which is really
> > helpful on CHERI. FTR: The alternative would be to use uintptr_t instead
> > of unsigned long, which also has proponents in the CHERI community and
> > which is used in the current vendor patch stack.
>=20
> FWIW, Linus categorically told that it has to be no uintptr_t in the Linu=
x kernel.

Then I'm lucky that this patch set doesn't introduce uintptr_t and so we
can delay the discussion with Linus about that. (And we will have to
hold that discussion at some point, because on CHERI we have
sizeof(unsigned long) =3D 8 < sizeof(void *) =3D 16. I didn't check, but I
think also unsigned long long cannot hold a void*.

Best regards
Uwe

--vqsqetyrnjrxwten
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnoiSsACgkQj4D7WH0S
/k74eggAtKiYZRohFpdNo44fvylrlq/Mfus5ZHYrI8EWLZuC+qMr7/LiHwZ8cxVQ
atxZNwrK0qRyfjUM/lFUKvVOSQwTQzqaMGF0dNjfTVALktKCe6sLNr+gOXDqofhx
UZn90knvTDOO5WfcrIf1K/ojUlgsGJ/4r63JkF3ZXPn8I3zd3NFFjhgn/ZzJkx74
5CJywELP1+kmz3pLRw0rHztfMl3gmPTsxCWqHmxLNsNtSVskl2dRZH9FMfvNKCQo
KwuE7hCxtAWO4py/igcaNXz/fS0nMSCqIo3IbxAzqfJAnHgPpGrvAKSOB4GLVCoc
hmaPoy6M67vqAg5NjGB4uniPlgvymw==
=8Fwl
-----END PGP SIGNATURE-----

--vqsqetyrnjrxwten--

