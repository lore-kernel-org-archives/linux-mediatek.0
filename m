Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71C3D1AD5D
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4K5n0bY/MNJApsUthAN1NPIj08Soy9GOdy9ssrn3mY=; b=W9C+6KAlQ7IxfQYGY5gFK3fcfE
	D8SEx67mTF3+H/9M/Pq/Koh/7l6WR+0N2p+Ac7yn7zaEdhBYUoRcWe5STOG9hw5BDcrnOa+hfejoS
	71jO2HbvR5DNgFpbAoGp+wXlO53C/h51006d+PS7aHnHawiBdUZiBZIoMy+1LPxcrsQcGpQJo5kZ6
	/LG0nWi7v2ko/7aIungX1AAmjiBELut9mwg0PVDQ1az/vLAbgIBu+udOWXvbXRTRllvLeuVhsW5KU
	TzGBWfkB266apMPyIK5zC/wy8COMswyNiAS/cDO8lLfcy7Su4QRtlUr/rqVs4EvIkWFlA9RCpUbA6
	gvJP1tXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t14TR-0000000C043-1Foc;
	Wed, 16 Oct 2024 13:54:01 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t14Rz-0000000Bznt-0FD3
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 13:52:33 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so4780600a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 06:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729086749; x=1729691549; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4K5n0bY/MNJApsUthAN1NPIj08Soy9GOdy9ssrn3mY=;
        b=RF/A1YPBQi4+ZqQrwnvJY7aHrSaD4VYmMvc6kgQuW0I7R6xkGhiGnsjJh9VBbnHoCW
         EbCnLWnwGBc4Rm5AHATeOtWPt5ybodKWhsa5c0mnWCdHd5Nj/Smcpb4QfsZ5JN0ey1sH
         XeZPop7vCXJ9I5/Y0ISl0w7mgd1nXofxy/P7q6P7q08zeZo5O4OJRN8B/SR5GAakFR+g
         YsLSrTDBf3zf3nc9yI8Ci6pQ4b98J78A/x31tuJC39X8rkQYExwpgKqih9K+O0q1NcAz
         xnu2ydva5F71r7Z8rpz5MpRldEiarQe03UQClvw7iQrloDmGsth+4viUKultsjt/fVZA
         6uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729086749; x=1729691549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4K5n0bY/MNJApsUthAN1NPIj08Soy9GOdy9ssrn3mY=;
        b=iAOJMmcP/K0fnyM/eQSTtWg8KRLhUnqPD4xqpIFrBilQBZqCnf3SfJpcfFO/ismJdf
         U6PkehbcHOnf913+nytjY8vZ48eV2wYvI1E/VW2lkRbH6Eu1AVheVO+4pQkzgpgjK0Gu
         jdXYx4V19sUEewYwXm1xvMK817hq4y5pfyHFoc0yACkuTsuq2h4yg/+B92QJj+j0c2Wu
         2yydza/U83e7WgrPfUIYbFj3HgU36Wsw1re5qXecnFUKi4Pb2E0bTmnASDg3wiJ+yELn
         i/h1ezljQcNXa6CmPB10MG1/UpaZJJomP6WUCfYie3JP2ZuZ/HSChEDW12byb9lliMEq
         PHvw==
X-Forwarded-Encrypted: i=1; AJvYcCU8hWcuNUSNbIWqIt94oZMCyXI+K7bSiDxxf48nB0xBuAzPh5UARmuATaD4aN/6+htR6CjHuJ+JGzCXGMPxvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yym9vLAUz7SYB/tK6K/n4oVXLKfbd25mZ4ZBPzZ6gDmF8KugxWE
	NJBen9QL2HnEQ310gxcaZCJb5w/JYjFG6Bz6emySKJ3pxYQXyElPpZkmar/mSlY=
X-Google-Smtp-Source: AGHT+IGoNQzV+Bg1qNjVUvhK/C+rlK7lfaTe4z86a7lUttjr0E2+hamRKC5LOMtljrg6bMBomFnMuA==
X-Received: by 2002:a05:6402:42c6:b0:5c9:8d36:e2e7 with SMTP id 4fb4d7f45d1cf-5c98d36e3b1mr5159175a12.33.1729086748713;
        Wed, 16 Oct 2024 06:52:28 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:e416:44e3:8348:4e6f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d7b4a63sm1754723a12.79.2024.10.16.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:52:28 -0700 (PDT)
Date: Wed, 16 Oct 2024 15:52:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/2] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
Message-ID: <2ceewj7y4ybqyv4xxnms63zsi3bbw5t6opvjf3z4rorsxlwfq6@jlwzyy4umyif>
References: <20241010132659.81606-1-y.oudjana@protonmail.com>
 <20241010132659.81606-3-y.oudjana@protonmail.com>
 <vn466kmo2uqrf6ap54oat2bipj4lsfri7asnsrptrlthva6j5m@dop6xit2pzjk>
 <ad000fdb-4474-49c4-9357-f23491231b07@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nn67jih5s63rwj76"
Content-Disposition: inline
In-Reply-To: <ad000fdb-4474-49c4-9357-f23491231b07@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_065231_123054_587F85B6 
X-CRM114-Status: GOOD (  14.93  )
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


--nn67jih5s63rwj76
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/2] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
MIME-Version: 1.0

Hello,

On Wed, Oct 16, 2024 at 11:57:12AM +0200, AngeloGioacchino Del Regno wrote:
> Il 16/10/24 11:28, Uwe Kleine-K=F6nig ha scritto:
> > On Thu, Oct 10, 2024 at 04:26:57PM +0300, Yassine Oudjana wrote:
> > > +static struct platform_driver clk_mt6735_apmixedsys =3D {
> > > +	.probe =3D clk_mt6735_apmixed_probe,
> > > +	.remove_new =3D clk_mt6735_apmixed_remove,
> > > +	.driver =3D {
> > > +		.name =3D "clk-mt6735-apmixedsys",
> > > +		.of_match_table =3D of_match_mt6735_apmixedsys,
> > > +	},
> > > +};
> >=20
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers. Please just drop "_new".
>=20
> Oh wow, I didn't notice that during my review. Sorry about that.

No problem, I blame noone. You cannot be aware of every change in the
tree.

Best regards
Uwe

--nn67jih5s63rwj76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcPxQ8ACgkQj4D7WH0S
/k5qMAgAp6xUYRchPuw1po6lUEMN+JvpwOJDGGuzkdLZRYtB3pAzVFj+6l9LFhDG
ABrboGHLYWfrdSXu1A6GG/6JkqhqPARGgDcggUaN7v5V7c9uQi7xh07FnEObuj08
B/UINBv6DDchFLGMFoyla0einCWSwOS9wYejj2w8OtVKl3C934Eyx2FCHmmyS64a
KNzoeRj8YgFzvOtwyrIshytiX6CwCwDOTNqgVi2KWT60znHiFY2AW4ymZ0Lb/Spv
jIgDU4PMBuATWRqfcqveSiYi68xVmC92QY1ygM7dHGzFMHy3DlYTeSqzYA0JdM3g
5Q2yDUlNkA4pfm5E3QiIgZPPfjbC2g==
=a556
-----END PGP SIGNATURE-----

--nn67jih5s63rwj76--

