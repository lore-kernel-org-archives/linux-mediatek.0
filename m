Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35111C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEW2em0QGG/pwW/T/BCJTpg4Nx546YK2h5aRxCQBqUQ=; b=pFv/YlmdVYM7IAJei3Rt+/EsVJ
	aek0M2ZQKrAIjtP51InQ42HOnV94H7ZxcUUHTTxzFND+YJZSumBl7o0oVR64oY1uegeU7Bztk+T+9
	sZObGejlIEktSbiGrRfpRaYaYyJzNBrl0MicKqfEy/Qk7STANRtGejbJ64myOs7mj3liy5SLYTWoz
	lHKbVhFmIc0jKoI97Xkai22G4uXNvY15zkZJVjabpbrlyF2173GcIA91bfrYWIkqUqbjjpacZYsIG
	F9FuWMzTSpWQwE3UU4IrOR0De9i+8iI2Djm3w1DVzREJzxRs9HKr43nMXUU4qFMVOtp0AaEF0lli6
	nZfWgQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNDRc-000jWm-QU; Thu, 24 Feb 2022 12:42:04 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNDRQ-000jUL-GV; Thu, 24 Feb 2022 12:41:53 +0000
Received: by mail-lj1-x231.google.com with SMTP id s25so2654106lji.5;
 Thu, 24 Feb 2022 04:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E5f8dBX9uhibFNXc6Mel3BGvbrzQlLZqBC/+F9B6bsQ=;
 b=CBBYk42iKlTLvyHt5Xq2ne+Y0e3NUaMKxkDJol/Ow7dWi+5ZYXMcvM9MdQK73/NORp
 T+BOY3vS9a2hi11zs635mbkkRppxjdt/dg+Bdg9ArhX4+rU77Jw9pFIV2ibqQ8USy9xS
 qtiT3jgd3eiMwgJX6quH+RmSRvAsKwkwZhs4PIMdZD+YyF1QrR9Ky5rv0NUwHvdIiPue
 ZCKE5eJ2gef7FuFM2Aw9+xympbHTikCZezopD/yoeQXNC/8o+KtjhRY3tHYrMZ9AxR8e
 EdfiaPKqmc2vVfOm0GsHJyw54yC8x1uBleNJRyfRsWIbsQ0UO1+VXpZaul59L01GAWfP
 +45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E5f8dBX9uhibFNXc6Mel3BGvbrzQlLZqBC/+F9B6bsQ=;
 b=ZGrzgx93tSl16k2N42kdESEONnWXmqIHNlyuafpLxHzzL1AHKHfcFgw1zZar1vv4sk
 0nkoa8krbC66YB9BFxcJCdJERNFvJr0uF7KJ0mthhyhWzA53anxliE5IkNt4/RZGrXjn
 zlEq9hgyMNgsblsNkHKh2DmciioJNRD/ro9aHqwzWNDdHGvr6+m/DOwlQ/3ibnbPCaFk
 7jhu6veqsZbyVUcorgbd3hyXQjI665/5OZgW6XGzi3mBufWYiTV6vawFR902+12MxgbK
 Vv0/65A2IXH2HNkPkY0n7XGu3M2cA5UVhehwsoxPbSK55KyTc+lMY+S5tbXp4FMKsEQ1
 3d3g==
X-Gm-Message-State: AOAM533B+mcKOjiD2x6jcmBCR+Qbb47tgyjmlWLf7h815R0Il2X8Cs/r
 ZgD5gqdHKG5IoYPYmABmg1w=
X-Google-Smtp-Source: ABdhPJyCMH/RlCAdlrNo3h6tSANXMSZcYbwRf4yH6eMeEeqgfqSEBkyLJXNTX8aJ9hmjt8Se3GKG3A==
X-Received: by 2002:a2e:8795:0:b0:246:485b:9a2f with SMTP id
 n21-20020a2e8795000000b00246485b9a2fmr1882695lji.283.1645706510643; 
 Thu, 24 Feb 2022 04:41:50 -0800 (PST)
Received: from orome (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id p3sm199599lfr.179.2022.02.24.04.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 04:41:49 -0800 (PST)
Date: Thu, 24 Feb 2022 13:41:46 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: pwm: google,cros-ec: include generic
 pwm schema
Message-ID: <Yhd9CjAbI7MJu56L@orome>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20220214081916.162014-2-krzysztof.kozlowski@canonical.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_044152_575445_651CC8B0 
X-CRM114-Status: GOOD (  12.88  )
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
Content-Type: multipart/mixed; boundary="===============1449120204702647939=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1449120204702647939==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QoKhDQpat5OJfaIh"
Content-Disposition: inline


--QoKhDQpat5OJfaIh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 09:19:13AM +0100, Krzysztof Kozlowski wrote:
> Include generic pwm.yaml schema, which enforces PWM node naming.  Keep
> the old name in bindings as deprecated.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
>  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml          | 5 ++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--QoKhDQpat5OJfaIh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIXfQoACgkQ3SOs138+
s6Hy0hAAjDWtz6200YMgIRd4aeQNFbETpimnMUmcjdEmd6wj3sRaVpeNuUPuL+Fw
gSyLLpv9GSqgrr6JxAAMgULmUciu+l1+mC1DePxqw/xUOvY8pR5fCugKBDFT42ie
7A1D7I+5hGVgNihA/IV9Ia29GcjEA3Hwb1v9JOtuzYZw8ds/G9SDXUyAUCaIlOJk
9Rfk2JKCcq8/eKE/SM5NWUPWncIekGnmovibZ8JlcwyrOkkyRZp5nZ+NgK7u17SJ
Ybo2hJX5g/ZxWxGNu707jCsIoSrfwexKVWBDYVwTFGHKzsT05N75Z28pTbpmsPoj
ZYsck1jN1rYmBVLoW9kYy0+kb7Hx3982BTQv8f0Yt72fy1ijwCLfYaXcekCw3sge
IvBrZIaIzyy+bjKNFJwmdXY03rang2bbeBUmCNtWu+EP+Z3TkIyk3ZoTD6RQs/Pr
9KP7XPRAhqk7Ch0xpLxmFfNarAy14ydyz9vDKxAd4f2Dt9qhTYV0k1OV2CMEARbh
g9hCdAAF0OaOkUEa1G58nkKeS4mcQfLN3mR1OsGijYdkgqXw9WMn1KCmblrHfQAj
12siFOxkWcjU3sQRpnBpiHm7qnxShKST6Rgb6t2IrsMizUaP6es8my0rrFAMy81Y
748NAi0Oyz39/Vft51iRggSYY5G4d1c/NiPzuAro4LSKVgY/q6s=
=jFME
-----END PGP SIGNATURE-----

--QoKhDQpat5OJfaIh--


--===============1449120204702647939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1449120204702647939==--

