Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12200C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWdfXN3BNh6HNT+0goMzdBpTUvzgP37bXlBu5ybAYas=; b=bi6LQ/1rUOj9lp0s0IprNbyjRz
	yiCkPx9f8fZ2L1CWy8+OLMbwh+fEPYWr0D7z8mJq/VP3Sf5NhgHFkZzMj8ib6g+z6V4gvqlglGgOJ
	eCTN2fayONxdxnp8TqN/mg9nRgfYtEnajPmRhSgqVtEfb8TaFCRd35P0w7zTLOJc09a4forL9zEvf
	tt0mttCGGsmb6AvaEwtOW8fMMSb+Xnb/cRne14YStwBqCq+7rGR0tsiqEWsCfotceoSiIMX9NYvuN
	6bzk2LPcP+176YzQc/hhdKtIxbZjRAmI31f2SJShaS78YvrTh1nq/mPBo0xY9v8LcaP5Ebyt5Nfl7
	Sej7IK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Cg-00000004POQ-2Ld7;
	Fri, 10 Jul 2026 08:03:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Ce-00000004PNb-1adw
	for linux-mediatek@bombadil.infradead.org;
	Fri, 10 Jul 2026 08:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DWdfXN3BNh6HNT+0goMzdBpTUvzgP37bXlBu5ybAYas=; b=IoHMJ8M/1I9duG8FfJfP2ZrW+X
	7gOX8X42Ou/6DGpk6fsnzo6mCWCyso3alcwsV2zWUKojO2Rmg/2Map31jOIO7828Gj/UHpz19FXM9
	0uwz/knUdqk3SfWZUFHw5+/5XKQes559jk/4HQi6CVi22DZQ8VzZ7iXrnavXzTRzXGwwivlkJ4Pqs
	oCJQ7YG2G8uUvyayDinJ+NwvALPm5UqVpSC3GRLA4eJodQtjBFMyonHwnWOPQezrB/1PnwpWIjFD1
	xYCEwYq672qzHGZKuOQ+qwJtwIuBiTkq/StzcV2w1oEGAk5FN1Zi8yVC/UQn0laq7yw5O9z0TnjFk
	pPlNgzpw==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wi6CX-00000009ojX-2Clj
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 08:03:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso3201135e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783670591; x=1784275391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWdfXN3BNh6HNT+0goMzdBpTUvzgP37bXlBu5ybAYas=;
        b=omskHjw2wLUUPPAr5VZ54tD9BM2BzNA9kXzBxJ9XXF2GKOO7S3qWwjKiKDHffK3qXx
         zw8I0bwumn/L8+ABBNRPQN92eiu41WvyWvQBg6fubQjc+v7G/iBrW1TvVAjqVf970arZ
         VQ6WagOJNWo1ZSSwjACKZKrPX8s5TG2X2yNTfZ9dsy4Nvio+wqnQviIbql/od6f9bGRc
         /jp9jYuUXWWhFoy8y73lPJUhmTwgGgRoc4lcNyw3lPg0q8o3razm0+sxcbL8/s1vHEL9
         Mqu9j4yXGDl5kOKoETcyPEzQnaM8R4bi0flb/qNEFajHFbhs7E13VfQJzqRNeTLY6u3Q
         xapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670591; x=1784275391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWdfXN3BNh6HNT+0goMzdBpTUvzgP37bXlBu5ybAYas=;
        b=mMnRRI/MHSbydbAdoItz/zQU7Tq2rAOuu83hPVHQdi8W5TLui7Wl0jVMeAO2J+ZuGN
         pwhcavZL8/5EX6MZ1l4EtbjO4Wk5y7gxcFgrkqEXLw6ulKCBlLElsW0CT2yjjfTuxyu4
         32pli9YpjtozlwFx3oAWJaulp+ADa97ZhoTr3Y+0ZdK5Sz6NeG8krra91O7vF7ypIrpF
         a37jK7clOGVFrJbVrAi/K/i+EQGTeNhYwg3fElUGHfAl6XI5lvr5Uv2goaVt24C0DeqX
         8s3Im1/8xeIsGCrhmtioc4yaTwC7V44LzKI9SI4ZNPIF+ksszSdQWjAbMLciIG+nfG8+
         FhaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKSJbTNIRkdRI+05jsOY7whkBG36h/kLM0b9LulLr6jvrh3Mvch1m20DRHEmm9d8z19hpZrsie9Bs5w9RINg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaRyna9XgHDvOtszcZPgMtIg4xglyWxKPwaGqMfhQpLbI22kpt
	09HPDEPakAW/MudHysyyQ5eML8p7Fl4yw4CNKsDrMUBrXxcc3efqXc/1vp+y42hwftg=
X-Gm-Gg: AfdE7cmnLldlkBMLSBatjU+r5Ajhd4tUKZVg2yXNqQORRmZ26zHYkPTK3k9wMUpGs2A
	UJ8QdPynwCx0PUWRiZOBMaj0HGYl0I6XOaq3QbWFK5aFwZebf6E1+nJD1/ZqhZ2Vx/8N3V3iryz
	MzP2EMHeTToB3rs/RIzN6wgFfhmaKdD0SINFXU3QtSMTROl1quvuTPYvK+uKkUNF+p+udd7rnkT
	znBW7oiYpJs7YDSYqLZWu4VSfvJh40r7Dk96RHxWKZZuugmwMsLUcZ8pMPAZ/0UIR1/Zq3eXIyJ
	WNKnOyP0HZsUGhj8OCSuzCnFf3QzdbQ2X6zB3Q+hbEYY1R/NzI2PqyeJMOBZVmx5sdtROb6IQ0q
	wG9Bbl407iJbyFA5YFIAJ/R8Lpo1i2s52QfZb6g3YapeGon4GfqPgq68QyrawJGpK+aDN0IoPf4
	fFo4OqZRUA7Cuzk7RG1BfnN5oLbnTFJ6IrG7WwocOMEAnkMmrTvfisP/yvDIabS8CGDsvzq3aKk
	zFf
X-Received: by 2002:a05:600c:e557:20b0:493:c0ec:9a5f with SMTP id 5b1f17b1804b1-493e68ddd9bmr75755495e9.19.1783670590951;
        Fri, 10 Jul 2026 01:03:10 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d6e4csm55102028f8f.10.2026.07.10.01.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:03:10 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:03:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Michael Walle <mwalle@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Hammer Hsieh <hammerh0314@gmail.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Alexey Charkov <alchark@gmail.com>, Sean Anderson <sean.anderson@linux.dev>, 
	Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 0/5] pwm: Unify arrays of various *_device_id
Message-ID: <alCm-J1wRBnhoH0C@monoceros>
References: <cover.1783263835.git.ukleinek@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iuf5svn2mmf3pdwc"
Content-Disposition: inline
In-Reply-To: <cover.1783263835.git.ukleinek@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090313_830801_2B578E89 
X-CRM114-Status: GOOD (  13.40  )
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


--iuf5svn2mmf3pdwc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/5] pwm: Unify arrays of various *_device_id
MIME-Version: 1.0

Hello,

On Sun, Jul 05, 2026 at 05:14:12PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> this series is part of a preparation for changing .driver_data (and
> similarily named members) of *_device_id to an anonymous union.
> See e.g.
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre=
=2Ecom/
> for the idea behind it. I also grabbed the opportunity to unify the
> coding style for all these arrays while going through these.
>=20
> The patch series is based on pwm/for-next + "pwm: pxa: Depend on OF and
> simplify accordingly" [1].

Applied the series with s/iff/if (and only if)/ in the of_device_id
style patch.

Best regards
Uwe

--iuf5svn2mmf3pdwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQpzoACgkQj4D7WH0S
/k4qdwgAk8w911oLsA5aqycP2AV5trJAC5zx53mJ8LxbKoImqWjYyvmd9Kb5YCt2
LPeZPEPqg6LIhPMbDp91hBWArDL5UUUJ5OfgC8/i0zK1+zWS0B+UPtXUGxzQOkwk
stkrTAN5eVW7rhVy1AtT4N+EJVm4Y8958RVsmNi75/idP+gmhs7RdJg8zMdhrVVy
M7XB5Q1zxVcmhsx5TDStZ8tzeFMsDbMqz0s0xVECWSq50U70IwD0Scn0a1BN68kQ
+fZQMwGT3KhdqqmLJV44puWQoDqj8OwGeAuWJQykzluefOFNtRHtRhurlZQAUOrv
W4X++IXkqXbyyTO72ousttS/RpH5ig==
=4YUW
-----END PGP SIGNATURE-----

--iuf5svn2mmf3pdwc--

