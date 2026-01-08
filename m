Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D962D1D478
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t5MxAZO6uHQlXqGxbxcJlRM3XpAxH2j68+Yng+n1tE=; b=GBhNSh5RHAL4CPJ6vEExDB1KoD
	+D4Y959dv1+0IDx+xzuGkD7EnW9y8Qm859AM+LhmGMKdN0ZB1IUkf7U9xNnt3BN65kF6re6dRqHck
	z2e9e/nIyuY9ZP5a11ozcKpHDHWBHVR6+FyyE2fhIqfkivUEfvcIu07qQgP8+M/OVa/qMIxPsXel+
	Y2xki7rGf6VDb1O4psvtg8HJhPClBjNBpuaz0ScY0cI6W8T+Ci499UvXEF1gIEl5q9G/EGmqSki4m
	ukBpx0fe3K5mcsdMOFWZi28V4y6oLvZK90aWA+mxHsyLOKonCN6gtgmmcBURFxzyR3+8MfICEbNgJ
	hyY196Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdw33-00000000mh2-1qOB;
	Thu, 08 Jan 2026 19:51:57 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdw30-00000000mgh-04jW
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jan 2026 19:51:55 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4ee1a3ef624so22346051cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jan 2026 11:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767901912; x=1768506712; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3t5MxAZO6uHQlXqGxbxcJlRM3XpAxH2j68+Yng+n1tE=;
        b=p5EY42iT4jg37nhDQp1q4luavLGxee44B7nQvQqqj+5Fi044+OOS55l+m0yptkW/7u
         gJJxrv1AWOchunn/OgPf4caHQ7mxHALRIgChDJSPMvJYltbPFnfvyD0G9O8V/nNsGLQg
         Oz/gQiRuIGaEwi1T3L/+iu9iXkC0WmUo6I0rEaPaJM99F27dd9N7qjYNA4ixk9FDLFtu
         6b+sd7nF+s2c7hudZ91h14Pf8dKUP3bFRU/90Eg7bM8Bt4iBOAHutxj8g07+5O7zi5zk
         YotWkyUhfp01AwrcN2huEHN5j8doXBexSwkdqgZotz9tdh3MboKZlCKaMKjFQXE7N5+v
         GwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767901912; x=1768506712;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3t5MxAZO6uHQlXqGxbxcJlRM3XpAxH2j68+Yng+n1tE=;
        b=ZC4HIi/7QhabmKEHogCFfp/7lT81xegQXa1oProEONyoqgE/ixLswJeBqydTs6MMAq
         VOlxwzgzdtzZB/RAUZtrRr5eeKROMac2SBRdKzxeaFD6VYKMMU89oKoBGQeaBQUtRn1x
         zlJDzh4b/URitpMsebVY9jz2xuEtJQnLgQ74uJmWrlRGeUA5SfLoK70XrlzczSzV5Lu2
         CwVoyJSZtw4T5fVOhPGyhqwJ7RMvbSIyr2lUrdPKeRZ7RjoJhMoGGu7Qrg5sw1PtcbJU
         /TOct3tECCaK54jpsyLYS9EBT/cNAVHUQzpmikuRXDl/FZwrkQmCuV8O3vGTt/hQTavl
         m3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVc4+BlfbKGgwb4nftXwsax4kv0X+1I/SKsWvDP3o98DRPrGiDphNGcVKcAjBZ1ECV69VDhpkogxaXpuWa7LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YydOG30/IJ5ZedHqrr3mRM0+/0FXi8LkL4EUpt9ZDrH9VfJmeRQ
	+Zn21iAt62AxKiYUKiAYbi5rS8zw6e6aRkXx7kG7cJqV2faozDt/Lx7yiYRcUIz2+Jw=
X-Gm-Gg: AY/fxX5thS8OKVctH3HdazcRfxjDxlMHfr7GPbltCtRdUKnHa6CuYaoExA89ILbj4x1
	4l9gNYk44/w1bOp//EoMTwDh9/VMubT58aIC0rgElc4UETB1VFoA+TkaFz0/7etQKJZWfDAQ96H
	5wsT3iJKiByO4fwNKrFDrQ/9zUqN8uAZzL/UsRkUXrhirXvaJ3NH/gm/OWK4BiWDDUp+uyo/B3N
	l6TffifUIadvbuWP7Fj6PGdOQGnpsScTD/fcrm/vTULo12HGZk2S8BSaB6DbgCzeTtbbnocH7o5
	tzQPYOqiWUugQMNnuCjRgVbXV/5sQt5ym/b9yb3cr9hdOlSp9LKxNKUtoxVrURiiHSVe1UJ2fOI
	vJYY9ZHZMJQ1dNnJuT07FHeIMHeLTcRzW9afi8PZiiAuyu2tL+4Na+CrR0XlwmCUl5f+JeVE+SF
	tlVybaUhMk5J8FPrEWkIvRXgjKPheynKU=
X-Google-Smtp-Source: AGHT+IF07vV+0WA/n4b9oP2PTX45WFaUh5y+p0py1YN4/ZlnP6MfTnWeIOiCqeBE4tQFLsfHKxwQ0g==
X-Received: by 2002:a05:622a:11d3:b0:4f1:cd0c:80f6 with SMTP id d75a77b69052e-4ffb4a44431mr96306501cf.49.1767901911767;
        Thu, 08 Jan 2026 11:51:51 -0800 (PST)
Received: from [192.168.42.140] (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e4262sm58884036d6.20.2026.01.08.11.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 11:51:50 -0800 (PST)
Message-ID: <aa5536613a517caf5e954e94435f1a2229bad877.camel@ndufresne.ca>
Subject: Re: [RESEND][PATCH v1] media: mediatek: vcodec: Discard
 pm_runtime_put() return value
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM
 <linux-pm@vger.kernel.org>, 	linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Brian Norris <briannorris@chromium.org>, Tiffany
 Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen	
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Date: Thu, 08 Jan 2026 14:51:47 -0500
In-Reply-To: <3396476.aeNJFYEL58@rafael.j.wysocki>
References: <3396476.aeNJFYEL58@rafael.j.wysocki>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-a3j3e/TWQhiEXlEjiWOs"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_115154_328294_A4C6C7A3 
X-CRM114-Status: GOOD (  19.80  )
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


--=-a3j3e/TWQhiEXlEjiWOs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 08 janvier 2026 =C3=A0 16:23 +0100, Rafael J. Wysocki a =C3=A9crit=
=C2=A0:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>=20
> Printing error messages on pm_runtime_put() returning negative values
> is not particularly useful.
>=20
> Returning an error code from pm_runtime_put() merely means that it has
> not queued up a work item to check whether or not the device can be
> suspended and there are many perfectly valid situations in which that
> can happen, like after writing "on" to the devices' runtime PM "control"
> attribute in sysfs for one example.
>=20
> Accordingly, update mtk_vcodec_enc_pw_off() and mtk_vcodec_dec_pw_off()
> to simply discard the return value of pm_runtime_put().
>=20
> This will facilitate a planned change of the pm_runtime_put() return
> type to void in the future.
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>=20
> This is requisite for converting pm_runtime_put() into a void function.
>=20
> If you decide to pick it up, please let me know.
>=20
> Otherwise, an ACK or equivalent will be appreciated, but also the lack
> of specific criticism will be eventually regarded as consent.
>=20
> Originally posted here:
>=20
> https://lore.kernel.org/linux-pm/3690736.iIbC2pHGDl@rafael.j.wysocki/
>=20
> ---
> =C2=A0drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c =
|=C2=A0=C2=A0=C2=A0 6 +--
> ---
> =C2=A0drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c =
|=C2=A0=C2=A0=C2=A0 6 +--
> ---
> =C2=A02 files changed, 2 insertions(+), 10 deletions(-)
>=20
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
> @@ -67,11 +67,7 @@ static int mtk_vcodec_dec_pw_on(struct m
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
> =C2=A0{
> -	int ret;
> -
> -	ret =3D pm_runtime_put(pm->dev);
> -	if (ret && ret !=3D -EAGAIN)
> -		dev_err(pm->dev, "pm_runtime_put fail %d", ret);
> +	pm_runtime_put(pm->dev);
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
> @@ -71,11 +71,7 @@ int mtk_vcodec_enc_pw_on(struct mtk_vcod
> =C2=A0
> =C2=A0void mtk_vcodec_enc_pw_off(struct mtk_vcodec_pm *pm)
> =C2=A0{
> -	int ret;
> -
> -	ret =3D pm_runtime_put(pm->dev);
> -	if (ret && ret !=3D -EAGAIN)
> -		dev_err(pm->dev, "pm_runtime_put fail %d", ret);
> +	pm_runtime_put(pm->dev);
> =C2=A0}
> =C2=A0
> =C2=A0void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
>=20
>=20
>=20

--=-a3j3e/TWQhiEXlEjiWOs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaWAK0wAKCRDZQZRRKWBy
9JWRAQCunAzY4/PdIocPz0mGcldjnSIJV/RkIqS9BMGGkQGOtwD+P2Z19p1bMZMu
4dMSY/Q84vZtJ9361u3hPjMZ2jdANAo=
=LCTp
-----END PGP SIGNATURE-----

--=-a3j3e/TWQhiEXlEjiWOs--

