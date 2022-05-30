Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BA6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkbQb/tB2/6w+VPedj/w+RHXIWoqYFxQHEfjmiz2joU=; b=RfvySzh+pEGsw+oJGEHoBkqOXh
	On+COoMgkC1my6RH+iMy1dkdDeXy3SOBz+m416ReTjyhYq8DaAOTPihtLGkSbCZki3tybN5d3OUcd
	tdoXm6Qfisx0xNPvn7wNl/NpKe5Br5be8rO/66idkD8Iq3tmuuKKmtgILLC/wQxohYs76ztpQ6Qrs
	IbBmYshoQtpxzJvous48VEwUTAo0iCh5NMURl8GwVbmKrVavccpraGdqCb5HF0W6NAjrorPpQmN1q
	MorqQ1pXjeZ+0voC1n1S9B5oi3gfpVj/RzYBW4qEs2eS3fNEHHUWZPSJu5HEi0g4seKsy61PSzXel
	v4MpoyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmMX-008HQ1-IN; Mon, 30 May 2022 20:51:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmML-008HJV-2B
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:51:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id x17so7036734wrg.6
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g7RcvSebEf29B8H+bDmdz7sWUT/TFnBJvVooNtKpo/o=;
        b=vPfXLiASC8Br4/YkILcgFJmZQkhobWqlqZyCIKdn3OyqYgTUuDcSuCLShF9U8YZ44Z
         tChPEAH8m1/vmjFG9E4fbaUDZEFFfUJakWc2atEfllCZUDx5WrXA+e9i6kU3VvnE34la
         ocaLns5gZIgEtG1/Kz4kBcL8sFMliRWpe+KzMFHo4hcsk3lzcS1zScuwGFFwM1lfNivL
         XiRlBC5QcStQIZIC1KLNt79k/dXkON6nXF3Ls7MWw+A+Wn5kYRiigcsDMlpWl+xc0k3X
         fAz7ZgwdRcG2BXPz5phITrzaAy+X2SLXe+qfzMeBd+SS7m+1BD8aqZ8kt+EIivZEJtFE
         lmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g7RcvSebEf29B8H+bDmdz7sWUT/TFnBJvVooNtKpo/o=;
        b=OiC1g+LwRbr+U74d4rI5VStAdiYN3cgSfh3YrD61wUh/vIF1NX90LdYJuWu5OoWnoy
         OgPRPpNtD7dnBcfKRz0QblnuwOlo0QUpaYcQyp6c8Kw+Er5PoJphtnpWEYyeIktdO7L7
         TryEAfyn+OZGmbLndQ/b/Cx+3h8hKm7Iag/vhW9pJ78L8v6/yL3etC3Kc0Dm40PDNV08
         M44pdOFh+JoOdqAjDLRwvB7L4DqlM5L2M2Pew3qbPf6zGRwGqG68hgOThlUVd8Fu4uDl
         3sujBZ4aKjH/VmCul4X6qdhE5r2i5IBzRmF/851r8cJ9l4cEP4sWHwzCiMFvl/82OZKB
         Ok2w==
X-Gm-Message-State: AOAM531FJziKGS5O3DPxDPQzN6W6cDdvb3/L5l3tNPmw+ajvIv5FJlU6
	pzWninFjMkb94xEg1khYhZGT8Q==
X-Google-Smtp-Source: ABdhPJxX4QGvgimT506lT7zjJVN3DNTUvm4iSrw4GL/r/4dCBtZy852caJFC7R9WI8Pl82GIlq0aNA==
X-Received: by 2002:adf:fb04:0:b0:20c:ff5a:d305 with SMTP id c4-20020adffb04000000b0020cff5ad305mr45997097wrr.95.1653943887631;
        Mon, 30 May 2022 13:51:27 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d648c000000b0020c5253d90csm10053495wri.88.2022.05.30.13.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:51:26 -0700 (PDT)
Date: Mon, 30 May 2022 22:51:20 +0200
From: Fabien Parent <fparent@baylibre.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: add MT8365 SoC binding
Message-ID: <20220530205120.q3gi2fhua5lbxnmj@helium.lan>
References: <20220530202136.906407-1-fparent@baylibre.com>
 <20220530203101.5wq52q5pq523ewuu@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220530203101.5wq52q5pq523ewuu@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_135129_194707_0740867A 
X-CRM114-Status: GOOD (  22.85  )
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
Content-Type: multipart/mixed; boundary="===============5887843981086830448=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5887843981086830448==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kbnb43vxe2gkvrvk"
Content-Disposition: inline


--kbnb43vxe2gkvrvk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 10:31:01PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, May 30, 2022 at 10:21:34PM +0200, Fabien Parent wrote:
> > Add binding documentation for the MT8365 SoC.
> >=20
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/D=
ocumentation/devicetree/bindings/pwm/pwm-mediatek.txt
> > index 25ed214473d7..ac5c58bbb22d 100644
> > --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> > +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> > @@ -8,6 +8,7 @@ Required properties:
> >     - "mediatek,mt7628-pwm": found on mt7628 SoC.
> >     - "mediatek,mt7629-pwm": found on mt7629 SoC.
> >     - "mediatek,mt8183-pwm": found on mt8183 SoC.
> > +   - "mediatek,mt8365-pwm": found on mt8365 SoC.
> >     - "mediatek,mt8516-pwm": found on mt8516 SoC.
> >   - reg: physical base address and length of the controller's registers.
> >   - #pwm-cells: must be 2. See pwm.yaml in this directory for a descrip=
tion of
> > @@ -17,6 +18,7 @@ Required properties:
> >                  has no clocks
> >     - "top": the top clock generator
> >     - "main": clock used by the PWM core
> > +   - "pwm1-3": the five per PWM clocks for mt8365
>=20
> I think you either want s/3/5/ or s/five/three/ here?!

Thanks. Fixed in v2.

BR,
Fabien

>=20
> Best regards
> Uwe
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |



--kbnb43vxe2gkvrvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQyJHfU3UNW7IG61XVJKc6g3CeAAFAmKVLkcACgkQVJKc6g3C
eAD8MhAAq04bhlW59dA7G2QxeUOL60bMUzB6aHtyUWFSLDgMwO410j+eNRD2IT4w
pcuyVtI/DxqdHKqEGxD0on8zwRF2yEN3jxwdKFxoQ7+CDINxWKqyvk6HAZtNmEw8
eEq5xNXGTowOIwkvVoKETjRbnzEnmB89kLYCg+SqlE+8H2LW8GjhhGtFU2Q/8K7v
hsAzwb7rWNwnYLoVdl1gu1he78z//mq5hyNzWVspVS3ZCeekxmd/0dlG+Gz6sEwv
EVJFljX3PwhZZsWYGZGql/FiSwslrtZIDLTvv5UQK8vID7/NhE8lBRsreSiwVux6
8wqvB34HO3eDnRjflHpgyjnzJGCuQa/DN05paCv14abQAig9eSdhbmLpLnp/6N1j
/AQ2jCu8sNhJUzqetocp87qEmzvlYgKbvSv7NfiCklk1MU5cv/KB1tF+V1MpiSTO
P5t6hZVqMG3511ES0Im1VUCQ2WqsMVPhe2PAHmek0hJoUyPIkFGOz0bg04/hDG1s
H25LL/dHcHk8pU3SaM0QnLmxmLYmzEZ9nX4EK8hK0IyhRir3G6u1ruEkr46/VczL
9SNUPumDv3nQvJ9QcrsNooDdPUo0enRX+IiZe2G7QzZCyPW6LdCQFFgPBYAKSjf/
oUONf/ORm1vqWTP7DxtQRTsKiuyeDat+Yt3DgIE4ArZKbUP5LfI=
=qbYd
-----END PGP SIGNATURE-----

--kbnb43vxe2gkvrvk--


--===============5887843981086830448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5887843981086830448==--

