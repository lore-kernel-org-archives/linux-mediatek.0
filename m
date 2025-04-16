Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FABEC369BA
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gIfY2O9SRNMsf8TpU0oXNbXomtsGMw4EUG+PlvfsPM=; b=bM22INrm42c06i6Dq7YnofEtN9
	ipZXfWXKAzeU+oZR9wakiHJfQUahFzQdy33YcnxqS23oycGlAaSmJRs1vYweOaQLj88HWykmrSD2r
	4DLow4uM0j1IqNlXc7bis7HcMi9DQQ8Ro7YluGm0FlBWuGH8ym6+AevDeRtF/ez1pgk1c9gzE54RB
	/DCdECtreMh1FjeNEp8VSdfsajYeO3ruCeOO8uPG8JyYEwP9QdxqDY4Mi4tQ5f2F6JVDvFG3pqT/j
	b1CB9Evpg5PWFSZ4kYIiE33OF1VZv6DXOGPAjr93XEBox4JqXDGqttMtrD60//4FZRkik/wdxzhsn
	r0HocOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u563A-0000000AKp8-0VLy;
	Wed, 16 Apr 2025 16:55:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55KP-0000000AC0x-2a1K
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Apr 2025 16:09:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso75800005e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Apr 2025 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744819771; x=1745424571; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gIfY2O9SRNMsf8TpU0oXNbXomtsGMw4EUG+PlvfsPM=;
        b=uBD6ej2fym4DHnoAmf4Ts1sUn4ZOJxNk3TTCsegicwdsg+Tz7HfCFl9fHGX+eYWz7n
         SAGDR9pghy7XabsnNJqMDueLWmVmsLq/I/wkNZnVWLHitkf6aoagmGhmQDy89iJwHLja
         OxZP2N6Bim/i48MmYBwtlCOZ/PwZOl7IOlo7Rii1BYPPs00O9MCbU9c3DMGwSGLe8lD9
         GKw9CMkOwdgyWDLz7Pp67VcIOiOA7Rt8B2ckMPP4A5Rafx42GwFqUzW2ZCa0ZBMyloQH
         59CwKzg0kGwy9j44jOeqi3jJu1icY095G0oxldfRbWR7nTfuLs28H2VgvrQKvIMGwWHU
         /q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819771; x=1745424571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gIfY2O9SRNMsf8TpU0oXNbXomtsGMw4EUG+PlvfsPM=;
        b=pcLzRq29bF6D77nC4GGyvWG1Zbtsso2Ok5iSKwQmEBEWFQSdh7fxD/fvjbrZPceFW9
         ggjOSIKYXL+PWIpbdPPMISIFNZlUzVJmqwoE0MuxWgKpuRrWUf4m7F7PSevrEVM8fFbI
         GMn3nTvVf2yR+2SEHRU4ScnveWK0tsGNIBGaoOh1Q5yDHCiyMacYovqblOurjNF1M1RE
         lGYn9cY1WVpKIWgYig64ytvLWsMPtP0Ob1Y+AtfL4FztNnKJxNxrNIPZN2pRWVEwEe1T
         G1Y0Hl0y9bzbtsWkMdz6SSut6Wx/lwPWKvO6Ig8C7hayVXwhz+y0qn9iJD9Yxwhp2eg5
         wWbg==
X-Forwarded-Encrypted: i=1; AJvYcCWhYoJSzLWawXPodDlEsCMyq8IJxJ2A/2Tdyw3+2Srn+ZG5j1acb0EamqGT0SdglGmpDe95rtEWideeqVPDlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy24hJn3u1+ZyReor5m8N0pYlRYTHGhMIKKehnVdUpls94REZi1
	L/lJ92Ut98jvCOp3n1M3jt2QyQXtnGHYahOepGpVRSzULPjA9fq08YAB3c+ZccA=
X-Gm-Gg: ASbGncuS1/my/4dP5SrQx27ff7Gf86/qxvw+mWAQ7za/V8rM7n4vp0vCparrchhIBuq
	veIpdrq7ySbVZ/2LGlgSUTmp/whg4oKEIvVoik0QKvrkKhpj3ousaLL8+Bz4TL4swCMAQmLonyR
	Ia/31QGJZVA5l5MEN6wqCHfekfPXJEddxewRLusYzWgVqXaRghTPBkmI/TXfCsvBWfWA/myKs27
	E8ULJjVVAnksFa4lv8AjvodTTicrRL3FYqxskfj5XxG/bxRw28bgPCMED4/K2wBg1N2ugmPKC9y
	gs7De9aUmtkO2oyICbgtEYesEv8BG5oS/be7coXZyW1ajcpOMVtDj15YgI2MReKPHE1CvbodWIF
	3XzmTRVo=
X-Google-Smtp-Source: AGHT+IF3ZHpE7zJB9IQ2y8x59SUdSUcwVopqWk1Zp0WNiDguj5I7CqqTziJa38Gb4iY+V+RufRzqeg==
X-Received: by 2002:a05:600c:3ecb:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-4405d625054mr30574145e9.13.1744819771461;
        Wed, 16 Apr 2025 09:09:31 -0700 (PDT)
Received: from localhost (p200300f65f13aa0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:aa04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4405b4f3df8sm25248205e9.24.2025.04.16.09.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:09:30 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:09:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older
 controllers
Message-ID: <n3pyida4e4qhzzeyp4rpswiwiomgumgqeci7lwuimr6r4m5mxy@5s3w2ab3p75p>
References: <20250415112339.2385454-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ed2ffzrhvzkyt6i3"
Content-Disposition: inline
In-Reply-To: <20250415112339.2385454-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_090933_919246_831E09DC 
X-CRM114-Status: GOOD (  14.01  )
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


--ed2ffzrhvzkyt6i3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older
 controllers
MIME-Version: 1.0

On Tue, Apr 15, 2025 at 07:23:37PM +0800, Chen-Yu Tsai wrote:
> When EINT support for multiple addresses was introduced, the driver
> library for the older generations (pinctrl-mtk-common) was not fixed
> together. This resulted in invalid pointer accesses.
>=20
> Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
> what is now expected by the mtk-eint library.
>=20
> Reported-by: "Uwe Kleine-K=F6nig" <u.kleine-koenig@baylibre.com>
> Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoa=
kqzd4wdi3df6y@w7ycd3k5ezvn/
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

I confirm this fixes the booting issue on the mt8365-evk.

If it's not too late for that:

Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--ed2ffzrhvzkyt6i3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf/1jcACgkQj4D7WH0S
/k5aXAf/UP6i2a3y5UocoQPs0pyP+rVPxb+aRfLPNEEqjbC2EfKVw3TBePDcSXYw
62fTt6kjxzOwm4tDzLbKcDzMIqHEIs2W2mE87RbAtUcp8Kobd1qUPJD++4lcIfjO
isr+ZlQXT3mG0xCiZF5AHmhgzz4c3Ggc8RqeGDYCxzD3hj30XznRrOTTCv2wovzt
Rlnu37XuzkHOGMJly86gPc5LSJHDUMyNs/66hNb5h+1v95Hpe8YZ+ZXreQsE9+8T
9QnXW/NtxHg37nY1XIxdE6pBbUbz1jF8Woe83eBWDIwciCTpAeQ+WOFk1bLKf7Fg
wRAaujOB3aa0qRpq3UL0vErWjNaMzg==
=PJFt
-----END PGP SIGNATURE-----

--ed2ffzrhvzkyt6i3--

