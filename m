Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448B5C369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 19:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGHxp6lqAYRQInWBjVpHf7WApOQAlT577yEtZ4eKCyA=; b=CV0oiDa2VNK8adDTP7vumM7cU+
	vAtJzK4s+yL4Lmj4mgW7dpkY37sGcPIw1XTJ9cNgIq/S0vmvNw4w9ExVzmMR23IqctcHOHY/BgasF
	d351mf/Qd68ouMMKroYeraHXIefJoE8Md3gnw2WioInOGX8Bt6gycn9qvqu6p0PPN1RN5EC9cbpeJ
	HbY7m1PJSn2jyFyW+2ZFnoJPdX/Dap7vNKjssLla86hxM5mT7Pd6LGD7Z6rlODZ0ejpzcCnFUDk2E
	uvwXFaGhaXmhreisyFib+E8+WVV8uqLMP+XXBbm5CED782aMpPvQwpPRcP0a0QcYET4jFIF9FsOOO
	e8ENLtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UTX-00000007O9G-11Zz;
	Mon, 28 Apr 2025 19:49:11 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UQC-00000007NhM-1Udd
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 19:45:45 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso4824507b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869543; x=1746474343; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGHxp6lqAYRQInWBjVpHf7WApOQAlT577yEtZ4eKCyA=;
        b=RtmYMB1CR92aqoxhFYSBuH6HHEPhqh9JVah+KfnlARzY0Rv/2sSDVrXzjyHnV1dI6M
         tXywOjtwW4On7fOM9xOtex0ofN4KSyJPaP8KvBgGL0d1xKJn2+7M5XbrtW9GKxab/wC9
         qJpPU3DFajw3p4yYOXuPJuvemuEVKyPmsHzLdHsf3deKOGP0XtGOiNCjrF03+2Gi5hCY
         IbCrQydPrUJr2NI7otHTSVhByGNMzpj+ZsSDxUquq81Syyi3ThCj3bf80QN4MvyFbrnN
         YwD/xQNoxe4+kaoh9P1tBjSM4OORGKCFIIjDfAiKBdX9fp0V74F8vM4dXTHAuzEMm5zn
         Yflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869543; x=1746474343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGHxp6lqAYRQInWBjVpHf7WApOQAlT577yEtZ4eKCyA=;
        b=gaG393l0qBS+1GN8kwy2C1+Avzn0jIEQxfFKCth/zOZOcZfs0I03b+4g6z8YSL7rWa
         IE0joUqHm4AGVOntvF5MQMmt7cA6Fbrl5w2G3QAWJYPWNMulKaBdCSbhJuJG/yQ0j1Fn
         nXvlaOpQo30sLBgFdfW8+/cNuUdhnlV7aUNj5WUQuQ1orFo9dHa9/JzXVNtbtREKLatQ
         XrYzV/AYoYvL8coxtVGNkhCiE6lJ+u0t8tz9FTbUUXHfuxbYFUzej1G427o/DmJweBoG
         /ndJfjJJj2NPVn99T/s3RcCRu9OUNuPUOYhOZNBSJ+frwbEyxxRgL148ZI0KSXMr0Sye
         G6vg==
X-Forwarded-Encrypted: i=1; AJvYcCXA+gGQI65PYj2exC2+8p29rtVibJAktH3TN4uDoN+/Q7ZMM1vZrQ1nZj96IPTXZim+ju6Nzy4zMYRkVFcpzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YylVNkvcAgs1suOanjzBxYwk7IZ2FpVKMkObZsKZsX2dKt5wjJo
	FtCJfwL6FMRJawO+fnGTpIyOZ9DgAL3qnnHJQUUZMJrIB1oufcxAoe7BNf/iwg==
X-Gm-Gg: ASbGncvFmBQP1Hb31spU1eGfnmc6uk0QGJs41kq5fhgTChsqgIGxsgdx1R3ORSAoCeG
	+AdZS9G/9NUaJ69y02hfBZ5gJztOUqm+WwfgmX7gtf0DdxQDnuyZOMZCh8vJADp8f8gZMT8hq+Z
	tBYYr1iUzr5vNLNvIdo6JJcarYqStHbQr1LuxSsygvqjVqevv0gWYNnvYBMj12FEBeJG4e3GpYX
	V/z6TUuMDGEuv/rCtCm+QPLu+nYtSStbpWcRsDwfRXfUr2ZixULTWwzFMImab5rb6I4YmXpg7Ut
	AWAuZXSEGgwzf/RospB9Yp1/VNHtSSegpYrD1yC03xnOFckwaf7ZmaSt1Qk2LpzNub6Ws6Mom0I
	4OXw2sdFX
X-Google-Smtp-Source: AGHT+IFYlvYhne57m4K5klZLGQL12xu5rF8UHasgAgtYn7L+ZI+rW0iA6PRZDAtjG6kMT4NaEVhDYg==
X-Received: by 2002:a05:6a00:4644:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-73ff7280114mr12876072b3a.6.1745869543146;
        Mon, 28 Apr 2025 12:45:43 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2593f621sm8429207b3a.39.2025.04.28.12.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:45:41 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:45:37 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 7/8] platform/chrome: of_hw_prober: Support trackpad
 probing on Corsola family
Message-ID: <aA_a4Whqm35-pdKk@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8X7Hm8zNZQujXZIe"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-8-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_124544_388688_AED99372 
X-CRM114-Status: GOOD (  18.50  )
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


--8X7Hm8zNZQujXZIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:45PM +0800, Chen-Yu Tsai wrote:
> Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
> families) have second source trackpads that need to be probed.
> The power supply for these are always on and their reset/enable
> lines are not exposed.
>=20
> Add them to the probing list.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Rebased and resolved conflicts with "spherion" trackpad prober
> ---
>  drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/pl=
atform/chrome/chromeos_of_hw_prober.c
> index 019578bc7ad0..10dbaede0541 100644
> --- a/drivers/platform/chrome/chromeos_of_hw_prober.c
> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
> @@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device =
*dev, const void *_data)
>  	}
> =20
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
> +DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
> =20
>  DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
> =20
> @@ -88,6 +89,18 @@ static const struct hw_prober_entry hw_prober_platform=
s[] =3D {
>  		.compatible =3D "google,spherion",
>  		.prober =3D chromeos_i2c_component_prober,
>  		.data =3D &chromeos_i2c_probe_hana_trackpad,
> +	}, {
> +		.compatible =3D "google,squirtle",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,steelix",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,voltorb",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
>  	},
>  };
> =20
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--8X7Hm8zNZQujXZIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/a4QAKCRBzbaomhzOw
wjG2AP4ijnSVnwRAZNpFtMiKPIOjyp13MuNiw9PMzfMbCr+MRwEA9hFqvOc+hmFl
cJV85xxmxWaYDZTsW2Gw5ByJNl+JBAo=
=LvH0
-----END PGP SIGNATURE-----

--8X7Hm8zNZQujXZIe--

