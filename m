Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E11C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBLBJzNT1ffw+h2oX4cRo3x2szJ6dNE6YNzksEPgoWg=; b=LoX//d3089RUVcfPinruC44Gv/
	fwj6qxXS6QoxyPti721jB9emI7PaqIB5EXDjVau6rncLk5Dk7Z+EW9VoMsJeYmv4vaxcP9/pPyCgG
	svtK6oSO59PRuq+57XCwZE7DN/mxmbUqwY4wZZNNRPKB0fCZQ/oBff36VHjxpE2x3sUzNfrn1OOwq
	zcgtzkXDjnQhbAJKq4yMUEWbLye4urTgZOOwWRVlBktcN9FI0Ppgn1+ZZM/BAINH8fL+04KPH2HTc
	b7uO0+ac3iOVLg3sNtyAswo0wYdI/HYZev72eAlpXxulhA4qrqngDCgthL8B70dhKM8RiPzTNEFc/
	3KrmrGng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNEZ4-0010wZ-4b; Thu, 24 Feb 2022 13:53:50 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNEYe-0010lf-Qb; Thu, 24 Feb 2022 13:53:26 +0000
Received: by mail-ed1-x52d.google.com with SMTP id s1so2890786edd.13;
 Thu, 24 Feb 2022 05:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nHQBWT7bMR5wypBGm4JCUtTL/BMR7BEQzX7N2vOiRk0=;
 b=MHyCpqm7LhNeCcxt7BnxbZIoCSpP08dDsWnxcgDlnQ8t3BQ/qTq1vIiuiJdh88bHoc
 tPdXdvmcNj0qunMPd6T9f+SuT80LI58qO2hxrTqt0IdSNZ2rxfd2mnA12G8QAdEPtczi
 FGxpnVBiWAGm5XzNJox1k0S8z8qKhPjX1YTGTker3+lamzvsLDqcDWY1cnQjlvY92M5c
 5/6jTWs64KKuTmnELTP2Og1U6gTfxKFwfEGBX7q4P2fAOqsbb2rOKKiQUY1+3IC2kJVc
 Pp7SqJPDlNW1RfJYxxpFK0uMZeAFyIjslsasUsEZF5qIdAlAmCyKqtu1KL1/tffmfwQk
 yELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nHQBWT7bMR5wypBGm4JCUtTL/BMR7BEQzX7N2vOiRk0=;
 b=QPiFbAsnWCutwLJSf+aSLg8iPFvo9m94xOFngG9qtKVcEDiaEYed2c2FDFK9X3QbWZ
 H1UIrpMluiEJ8t/YgQEl7QWYq1LsTbVDMBSn69mtUN4g0voLHVzBAEUkGNs1Ge3td/WH
 L3eW2ay+uo4JNPDCMzqdVwdlDUMFDkPew3IJMDhxg8UOSKBz15SjcWL7353FcVUM4YuJ
 jKjjSzL2htcCBU0eULBVH9vTMQbxQ4O/6W8THrvbEDfBd43Gv5Sxtd3JAFWlb6mKqvad
 zoVpJOGbEsYBVLVaKF5vghvj1OOzxTSADBRhDt9Pv+VnqAVAW1e/2jtDy4SdIJ1h9c3+
 oT5Q==
X-Gm-Message-State: AOAM5308RXO3uQTXppuZhJi/gAqwXO7vy2yNk/dasb8tjvrDq3hd0zOn
 wR0f0e2s6I2/xeJsN5w4jYY=
X-Google-Smtp-Source: ABdhPJxO6b1Qr2Vfnt0T48wlIO/dpQickLsxM8qwxaA/5Ymic1hJ3VfNTRMVwTwNXSfyQsmfdnPDFQ==
X-Received: by 2002:a05:6402:b37:b0:400:500f:f26 with SMTP id
 bo23-20020a0564020b3700b00400500f0f26mr2339621edb.301.1645710803013; 
 Thu, 24 Feb 2022 05:53:23 -0800 (PST)
Received: from orome (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id a10sm814444edf.14.2022.02.24.05.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 05:53:22 -0800 (PST)
Date: Thu, 24 Feb 2022 14:53:20 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/3] pwm: pwm-mediatek: Allocate clk_pwms with
 devm_kmalloc_array
Message-ID: <YheN0IM8IhkMODU4@orome>
References: <20220214140339.112500-1-angelogioacchino.delregno@collabora.com>
 <20220214140339.112500-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220214140339.112500-2-angelogioacchino.delregno@collabora.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_055324_898383_EC270C2C 
X-CRM114-Status: GOOD (  12.12  )
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
Content-Type: multipart/mixed; boundary="===============6807612758794787884=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6807612758794787884==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="abg3CG3+/zIlkHwK"
Content-Disposition: inline


--abg3CG3+/zIlkHwK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 03:03:38PM +0100, AngeloGioacchino Del Regno wrote:
> Switch from devm_kcalloc to devm_kmalloc_array when allocating clk_pwms,
> as this structure is being filled right after allocating it, hence
> there is no need to zero it out beforehand.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/pwm/pwm-mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--abg3CG3+/zIlkHwK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIXjdAACgkQ3SOs138+
s6E1sRAAu21195xMimQ2VWJzDrxG2ALsrIkkP1uWHyhSlzDSXfiCuUVHy7Fc5Gwd
cJTyXtpyIKLbS/5IPW4KbZvT6OSiUS34LD+pmutmhCOGs/xJ1Xp/+MR5cEBjMAWE
yVEovbAfpH36HARFwmypOPzi1jfgoj1TU7HF5ZXCdpRtzCxw1Yfq6d/9Z5p3ojN0
BoahKlQMja9vI8DkCNVWKOnMaKdIMuoEUHJIZTO0PEPyRfMm6FWWwTdEu4iEM4VZ
PJR0LIaYixQzvnr7XYaQfiY5YQWTiYDJpXI9zQEhpc5XA/m/RXdRqfmKFH9WedMy
odT//Yi5Ul+AmqU03cd5pBO6yB6fpAI3dv4X/LXifru394Penpr5rpT6Ds9fpyBX
x+phot/Vrw4Gbfk1OsQi7hDnWe4+rTC6O1dNPcMw+AKLZ2M5jQva3Pg9HBPqFq7u
a0RB+bPGoCmE5uBFpl/ra6D8SXDpioKbcF2WDUjgiUq+n9OZv7KCP3mowu46n1/Y
fCNi+27JRKDoScNTFzTujSFiDYBchRx212tkG2/FYQMFCed6xli6UEnHFGZuXuEY
uObog37ey7eGC2xI0+lU14PIpaUwo9DDpvfzdKFbiZ6N/ikm+TebMaLvphGkQfyH
uUt+cLuHT0OIOvNujBAwQDcd49ux+1qeIgV4O282f1CN4OtZeRY=
=t7QL
-----END PGP SIGNATURE-----

--abg3CG3+/zIlkHwK--


--===============6807612758794787884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6807612758794787884==--

