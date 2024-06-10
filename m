Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F83C27C5F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BES8ee5sXlc5zmrxJY2BlnRPRIoI2IPGXq+EX3VR1No=; b=2+OxoGUB50uWko54suQF2tg6h0
	fA/0aRY7sMDLQTy3MGH2XA+XPNETYR4BwjX0C1y7HLuD5bd7VcVUUhvjSD1gpxgC0xROtNDkrPEwb
	oXkKVgOWcISJGmHqiLmZSpd4JN6b8SOwNcj7LxK38+yGt39GoXqqsyfcDOwk/lAB0mIqAxN/2Lry2
	W/jyLlePynerKf+7dAPlxdvCJTa0AqimFp1/J/sZPY52FPaq/Kkaz6VEfaUDlpoZm6hLa5ehgsAPv
	TFkgRj8JoZI21FyXgCGz95i8pgfbFIRVAnQjqcv3pFTESBScnqw8CMaU+DNKoCKp3MJToU4YLMIxV
	4/20fRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGiGs-00000005tkQ-3udl;
	Mon, 10 Jun 2024 16:53:26 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGiGm-00000005tgo-34q2
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jun 2024 16:53:25 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-57c7ec8f1fcso1830227a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jun 2024 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718038399; x=1718643199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BES8ee5sXlc5zmrxJY2BlnRPRIoI2IPGXq+EX3VR1No=;
        b=cZx702ZtMdocaD015HWAuXn4nwrRZPgPcQLRkTTAIuhmTYP/3d746UmdPVeJIKdZma
         uYqN7jzGTN0EifeudErSTvheaa4430YWI3dUVi8HCzxWSC1sSM9llnwW7dhTKMGSaW+B
         6cZ9oBkpM06r/D1WUTE8feRxFQGMXvK+BfumAtU8oUm1dt1uXDLUpJjxLRZmW4L3Zr3/
         tkvKiVSMDnV3kyFiX4DjKaW4viHRqCxfFiI0zF/Q9BpTTiAjk2afetRrXjXEoTAgoAsN
         K3HAQFMPqKo8R8YUHim/4TBDlwYUDQbPSe7aZEAwceqeXbG2Rgh88+Fs6AmDZrNd1PbK
         JtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718038399; x=1718643199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BES8ee5sXlc5zmrxJY2BlnRPRIoI2IPGXq+EX3VR1No=;
        b=d6o39Z2u4xJ5fq42vPLApo89nQHXjVDAIrLthhTuj4fBGwEUhDwV234VvwVsnEXhvl
         Fc5i/C5A154zrYWkBwQh1dtXkbwZOgrl7Y2ALHnjvQrtx9g2razV9uDJp49j7AQZeLIg
         DTovS4n13E7qNYhEg6N08LMhBmmX8afX5rQRXZaMkpjflYcKTCH5Im98Hu/zqczC0ldf
         dnQYKHBJz0mH1qmpPQWSD4/Jbk1DqnyG56N0CNDkuIBNHvILaEOJqW94wQ/2l9NXq72u
         Q893T50d+pkb5x07t0ooEtbFqxhAaqBgxHgrm1Dp+fSh5m+8OoY7pZDnGIpVQ4yjXSXb
         0now==
X-Forwarded-Encrypted: i=1; AJvYcCX7jJaEWWqJ0yRVb4Z7OUMuo+8rOpmZtthbYW1/V6/nnsu1AzF8/5QZxH9ZIaigm82TzWV2703+1mGIHWGv7+ADdpoRzU7NusDbqYE4ENJZ58ca
X-Gm-Message-State: AOJu0YzcCKnrW2eyry6tqw87hJQ64l1ZblriM+I66gN8R0v5Tz8JuW8X
	/KYvPa8Y9bs8n+vv13I9+2JcivOZOaPhBrbOIMhfXydozC942C3hiEa4ftFHWgk=
X-Google-Smtp-Source: AGHT+IFEYSFuraPOa+WYVzdaL+ESVBNKCRmo08LglRUMqvJEaK4g/mE7UxIj5Y6FmBNmUXmvs8sJdQ==
X-Received: by 2002:a17:906:e20c:b0:a6f:26a5:9f5f with SMTP id a640c23a62f3a-a6f26a5a0a5mr142869266b.42.1718038398698;
        Mon, 10 Jun 2024 09:53:18 -0700 (PDT)
Received: from localhost (p200300f65f283b00ca876ee5dd3d1e3b.dip0.t-ipconnect.de. [2003:f6:5f28:3b00:ca87:6ee5:dd3d:1e3b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f20563a26sm133567866b.129.2024.06.10.09.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:53:18 -0700 (PDT)
Date: Mon, 10 Jun 2024 18:53:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pwm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] pwm: add missing MODULE_DESCRIPTION() macros
Message-ID: <t4xkx7mmokgj3lqmcl222s223obdahpqp6sqxgwaohisbqlbib@vitt25ggsezf>
References: <20240610-md-drivers-pwm-v2-1-b337cfaa70ea@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lp35xxqvbjr4igp3"
Content-Disposition: inline
In-Reply-To: <20240610-md-drivers-pwm-v2-1-b337cfaa70ea@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_095320_980745_31B2EABD 
X-CRM114-Status: GOOD (  10.99  )
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


--lp35xxqvbjr4igp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jeff,

On Mon, Jun 10, 2024 at 07:51:15AM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx27.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-intel-l=
gm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-mediate=
k.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-pxa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-samsung=
=2Eo
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-spear.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-viscont=
i.o
>=20
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thanks for the respin. Applied for next to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Thanks
Uwe

--lp35xxqvbjr4igp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZnL3kACgkQj4D7WH0S
/k7Y/gf+Oi0+dsAnW1E2XuJ43To/HG6xmMhALT1XJIHtAS1SRiuCRQ/KVw0Y07Ik
Nr5ZJapzijm9o/YiKy3vJyMVEjozrO7E3AummZ24ZMBL7Ggz3EroPRAj8+l2v60k
oz7i+Vs34vCraZGsPucTn52EuCnRMBh53fhz6bsKVKtOzNUD33k6c4V/BN9bIHfd
MJpqwTO3ejnSMAUdC6ZPJc7ZTeddyiPi6u/I1UIm43Gud/1XGcnVXx7PL34kwB2R
ng5cjCPGoiBYXfftDskl72+f2upFM5eJfueti5qqlGaT/C+wUxXQG3w5TGadSPmM
00uycs1SX65h65o8xSssTRGIFQtOuQ==
=OGvB
-----END PGP SIGNATURE-----

--lp35xxqvbjr4igp3--

