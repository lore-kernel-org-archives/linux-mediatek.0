Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6E9C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3sFXOuMqveoRXd7c7rTvCNrAHt/0EUfBDQLk4NsWDU=; b=ozDWmQI//m3OfKO5cbU3rIeZoM
	BKxNtVyQJgr2yaxwJ8L5/lJDKqAbuAO2pStjjfSQZx9NrhnfQV4qTcBhuxhusuzI9gUsBexjLmcXy
	PPCmCjbf94VynLCJMH1U8qCc6kCEwR2ylLPYsZ8KWjGJ9q2/JXhhNlejCPujP4aVNnUd3xxKZOlIp
	uA4imQTxtE358ANc6K5UnHpkcvnONK0i2UxmnjEm/UNr338qvz//FOV1Eq23D+Au5spfOWCSrLwab
	p670ARTUP0gJN7zXBmix8+O5Km9T+m4xECJkWIaC6I55BNvIwW5Awzrfl7WYcPEvJBPxQAo+UxVul
	AnjaTdgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWW0-0047dp-P3; Mon, 30 Jan 2023 15:56:16 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWUm-0047Xs-Vr; Mon, 30 Jan 2023 15:55:02 +0000
Received: by mail-ej1-x633.google.com with SMTP id hx15so13514241ejc.11;
        Mon, 30 Jan 2023 07:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3sFXOuMqveoRXd7c7rTvCNrAHt/0EUfBDQLk4NsWDU=;
        b=eBDJP3zeF2CAaV0hDs5MvtyoDr/wOEgmEWdDUxKIEuFmRz/dNOcgE6ZHva18qRQVpZ
         C8GCVx3eWCu10vVpwL2r3KutFHUFC55AOTX4PklKY7UxKZd3wRDxT6aKe7cT0XmxgJoX
         Ss4KHwtUNBBjxqJaUukTI4+WgDPL5riWQ4wavqeB+U6gNZjTIrBVCgOzMVi7ht93pmku
         u0V9+44goKViY0qPYTns7eb9Btc/4k7/ED18rCeuJ5PMLq4999ZlHYG8obKkGnqwiXUs
         P027f+Kl+XyyY4LaRmmpbV3BlP13SF9a+hKPYCmBXzknBrW7xZiY0fU7Gk3UqfT8n872
         mzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3sFXOuMqveoRXd7c7rTvCNrAHt/0EUfBDQLk4NsWDU=;
        b=czmFF/FBgIa4PKJLVrmg7/svm0y3aZl2hvHoTP6eUfJYPf0tHw02hrEoxtVQPQrqgm
         Qp4q4H4NECjaw+sCifcTojr+VGWupZiYcA7A0nN+arTCAMjKJGMAzlJU9ka+WLGu+4np
         /0+Ofy/n+gC7vUx/AhjL5WyLj0ieCXaTlUvbw5nrQ469WsvgdYoEXLWMSzQmD+PQazKs
         gjnQAH1rr9S3PwPetEANlkfgNgI+bCLLwFPTA8+OxzhR1Y1T01kLYUdQiuNb9RsvVWON
         57Hj/qXLJLESICunqZm6cRv/vDaAkuCQ51rCf/uy4E86hPHEQE0LfAJzD6aCOEUGhEl3
         ZdUg==
X-Gm-Message-State: AO0yUKVa8x+u9R5tTxG8Kix3LAjk26czKsea++DfbV3SiKZMbDfLOnkF
	nODepKC9Zj/Ie7w28xqXjIE=
X-Google-Smtp-Source: AK7set9zUUm0Jj+SonyVqg9785v4818CFDmFNQJTFN3ESMX3gDZbsqz/JP7M8gVpqikxOdzMlB1WWQ==
X-Received: by 2002:a17:907:1c0e:b0:87a:6a63:9014 with SMTP id nc14-20020a1709071c0e00b0087a6a639014mr16454978ejc.20.1675094098604;
        Mon, 30 Jan 2023 07:54:58 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p14-20020a170906784e00b0084d34eec68esm7055612ejm.213.2023.01.30.07.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:54:57 -0800 (PST)
Date: Mon, 30 Jan 2023 16:54:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	matthias.bgg@gmail.com, john@phrozen.org, sean.wang@mediatek.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt7622: Add missing
 pwm-cells to pwm node
Message-ID: <Y9foUMtlMZfZ18nr@orome>
References: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
 <20221128112028.58021-2-angelogioacchino.delregno@collabora.com>
 <20221202180932.5k3vymrwds5ssivq@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tt+4zDA4srW5HLc6"
Content-Disposition: inline
In-Reply-To: <20221202180932.5k3vymrwds5ssivq@pengutronix.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_075501_066533_E70C400D 
X-CRM114-Status: GOOD (  21.87  )
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


--Tt+4zDA4srW5HLc6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2022 at 07:09:32PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Nov 28, 2022 at 12:20:27PM +0100, AngeloGioacchino Del Regno wrot=
e:
> > Specify #pwm-cells on pwm@11006000 to make it actually usable.
> >=20
> > Fixes: ae457b7679c4 ("arm64: dts: mt7622: add SoC and peripheral relate=
d device nodes")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot=
/dts/mediatek/mt7622.dtsi
> > index 146e18b5b1f4..f321c6d0fd7c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > @@ -435,6 +435,7 @@ uart3: serial@11005000 {
> >  	pwm: pwm@11006000 {
> >  		compatible =3D "mediatek,mt7622-pwm";
> >  		reg =3D <0 0x11006000 0 0x1000>;
> > +		#pwm-cells =3D <2>;
>=20
> 3 should be possible, too. The driver does only support one
> polarity, so it's not really needed, but would be nice for consistency?
>=20
> Thierry, what's your take here?

There's little point in setting this to 3 if the driver doesn't support
it. The core should catch misconfiguration, but that's more of a fail-
safe and if we can just avoid this from the start by not allowing anyone
to specify inversed polarity that seems like a good idea.

Thierry

--Tt+4zDA4srW5HLc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPX6FAACgkQ3SOs138+
s6GHKg//ZEgZo9vAqHU2RnhvwzEqB5Lj0Ga0bH0vzXcHSsZDpr8YSGqWraBHHppV
UJuzylMJGnmJnNkz6YsDWLiZaUgtGcUUxSMHeDC6iYvc+HjlZfvHf4xxEA7IQauE
UwYDyXVHCKxsWtvRR4VO/l93LasCoA1Qt1CP4mfUOZ3gvbiFP6BR1iTKZ8balc6C
izOytiVpiXsIUTiJN4dJvkEcTUgysLuUIRfYtVigBckcf8nmNEvfNHzTUJ2p8QTQ
14PSEIsfJAkcOXIyl2PYajd5L6Nn72rxH8vgoF6aX4PhPSXMknjeIzNtMAebmmd4
2tLGNaB0MliHCRmjDjcd7ELY9dNuzH8drODRsMzoIPG5HLSBftUmVhVC5elZKtjb
xq069ysSwdSKEa2/emVmFWTgt+G7XQ67ZYOhUxPTJXgNq5J3HA7bKffOleXIaUvX
Dqj83mJu6mE+dHsoGYyoIuV+YO74bsaKGqP3CK8xHHZUs2n28h2OIEGxQh2vLkja
CH3d/T0Awdqr7VqUQp5rWGnwylKnx8RkjDC73tyVzTn5ld4NmJMqnfEpatuwvzjG
iSowdQrNiyZIdofe+S8qiNy1vNBPOWio5miVRRfm30678h0hVYMEe+745wSBMkp/
oidl1RGU72RmnK+ySUPPomygTW13jOimthZSfo3DIdpqRdMSJxI=
=g4sq
-----END PGP SIGNATURE-----

--Tt+4zDA4srW5HLc6--

