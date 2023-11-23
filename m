Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E647CC61D97
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 17:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPO56mWehRo3MO9NO3sn7s7gQSe2d8rAnSfxiFZU3bc=; b=UFqD7+7x3KKlY58FZrFuoTS7vI
	uaqUGaTuH/cgdxveTpxC/Nd6G0PRsfr+Ym+iBTpApNhJCLY1GqQaYPjCUzQ8FZZ64ZH+ytFPq4jkD
	TweuN5UWWYYoH9jOzmifkJb1oJCKLxpcHw5ebJjBDAWDBLNJOP23WJfPGFOcpjS2y7tBrBxY2HiC/
	stU0mkg21824CDjPlvzUEK3q38x1f9KKts0gXqG/Dv8jlQF9PtqFqX5wqqys60cNmrm8olMCXk1r6
	4jH1h8E0Ln+RbYvRBww+J+aEtyNUQXASdgYHxg7DbVdQUjiBlN2l1elT0B972rVGNb/sY5aEwqai2
	VC1NITXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DVI-005QFo-2I;
	Thu, 23 Nov 2023 17:28:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DVF-005QEq-2s
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Nov 2023 17:28:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6DV3-0006fo-MD; Thu, 23 Nov 2023 18:28:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6DV1-00B5Zc-Nb; Thu, 23 Nov 2023 18:28:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6DV1-006qI9-E4; Thu, 23 Nov 2023 18:28:23 +0100
Date: Thu, 23 Nov 2023 18:28:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Walle <mwalle@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Xinlei Lee <xinlei.lee@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pwm: remove Xinlei's mail
Message-ID: <20231123172823.4offrr7w4tsrhl4y@pengutronix.de>
References: <20231123134716.2033769-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f2xwjnd6lnhuiwuu"
Content-Disposition: inline
In-Reply-To: <20231123134716.2033769-1-mwalle@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_092837_927628_ED0A8745 
X-CRM114-Status: GOOD (  17.98  )
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


--f2xwjnd6lnhuiwuu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 02:47:16PM +0100, Michael Walle wrote:
> Xinlei Lee's mail is bouncing:
>=20
> <xinlei.lee@mediatek.com>: host mailgw02.mediatek.com[216.200.240.185] sa=
id:
>     550 Relaying mail to xinlei.lee@mediatek.com is not allowed (in reply=
 to
>     RCPT TO command)
>=20
> Remove it.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml=
 b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 153e146df7d4..afcdeed4e88a 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -8,7 +8,6 @@ title: MediaTek DISP_PWM Controller
> =20
>  maintainers:
>    - Jitao Shi <jitao.shi@mediatek.com>
> -  - Xinlei Lee <xinlei.lee@mediatek.com>

Xinlei is also listed as maintainer in
Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml.

Other than that:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

because the address failed for me before, too.

A confirmation by Jitao Shi would be nice ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--f2xwjnd6lnhuiwuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVfi7YACgkQj4D7WH0S
/k5yMwf+IRIOP4q0ZLwdNez1e51AqVrao/6E0dqPhU7Cq9ka5Y8zr4Xx9wW3jz2d
QPab0hcPzDgVd64whCgXEbclBDZOKPaURAWxWxprmyt2g4cAtuT4BfSlJ6bgG0Fd
GJu9xpHiwJDPFaheBWM25hBmwYTie/j+ARN0OY+O9feJDUl3df06YJ1+s1M7euB2
IGpslcBOi1TRE83Ll9y6nyUMTHYEyq5ZnIgm7zT2SoAjvmsI5qcE3SmiNJJsig07
nl5nLTnjWfDYGfqKDixCOOokSSqW50Y42b5uX+iCxEMKmHtjKRhLrYbKkAvJVoYo
/Wl2zfP2UdZo4ZP6rHVTRel63p12lg==
=d7mx
-----END PGP SIGNATURE-----

--f2xwjnd6lnhuiwuu--

