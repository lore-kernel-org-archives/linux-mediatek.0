Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcVCCU0w41KX4GDAOqKUBhMq2A4S7I9KK92Tgk6xErk=; b=QwE9U/HbcBfYTFgFk0V1BLHL6o
	LGYHi3depNdFEn9XSSoXa5vQ90+9rmERwGXW/I6pX9fhbNZE4uhcC8uJO63oGEnoQJMHZ0b5wR6WN
	hQhvakOqnjbssHLNu7vFksIo1Ki094EntGSGX63EqdETwlZFf7POlBTC8h69bMco6WH/lLygehidk
	xZUSjLVJDaVX33rchTn0rmn4CVhJIZS4Xv85m9pU2pwg+nJlOoZY8ab2VHNVLKoeU+tk8spldjrLK
	hjEB7xXrA/1u3kWsJArVQtJNJjaBq4DNQKqaxVdK2sFPIWcW0edk5J8s0bVPLfuhmdVia8+hD3/ff
	B4eIRRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvm2x-008DhW-TV; Mon, 30 May 2022 20:31:27 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvm2m-008Df0-GE
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:31:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvm2b-0001eR-CN; Mon, 30 May 2022 22:31:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvm2a-005W7e-AZ; Mon, 30 May 2022 22:31:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvm2X-00DAOs-V5; Mon, 30 May 2022 22:31:01 +0200
Date: Mon, 30 May 2022 22:31:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabien Parent <fparent@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: add MT8365 SoC binding
Message-ID: <20220530203101.5wq52q5pq523ewuu@pengutronix.de>
References: <20220530202136.906407-1-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220530202136.906407-1-fparent@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_133116_583601_984767C4 
X-CRM114-Status: GOOD (  20.90  )
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
Content-Type: multipart/mixed; boundary="===============2600932971693657458=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2600932971693657458==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ydudqqbygmakmkzx"
Content-Disposition: inline


--ydudqqbygmakmkzx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 10:21:34PM +0200, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Doc=
umentation/devicetree/bindings/pwm/pwm-mediatek.txt
> index 25ed214473d7..ac5c58bbb22d 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> @@ -8,6 +8,7 @@ Required properties:
>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
>     - "mediatek,mt8183-pwm": found on mt8183 SoC.
> +   - "mediatek,mt8365-pwm": found on mt8365 SoC.
>     - "mediatek,mt8516-pwm": found on mt8516 SoC.
>   - reg: physical base address and length of the controller's registers.
>   - #pwm-cells: must be 2. See pwm.yaml in this directory for a descripti=
on of
> @@ -17,6 +18,7 @@ Required properties:
>                  has no clocks
>     - "top": the top clock generator
>     - "main": clock used by the PWM core
> +   - "pwm1-3": the five per PWM clocks for mt8365

I think you either want s/3/5/ or s/five/three/ here?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ydudqqbygmakmkzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKVKYMACgkQwfwUeK3K
7AlmTAf+IC1ZakoG/AbDBiw+ISsvysZi3oDGLTm43optth/vSyX8NRewez5UcedF
lhD+yb619mm33nUfifszc601C2x4L47zLAVRSyVoMn2XiaDporeX17CbcCyq1tDO
yb7dTFuQEdfYr+TbvvVp/5UkCq6cCNS0yojfqxcP+WmXVDD1GsRnzH5BR2dT4Ofy
ynvcYyx8d7wroDefw9IMs01DdPDrXdA7qa6NcSBAzwrAKPRAOVSNvn8ULuE8Op8Y
DyG+WasQYyCDO/k3grKxatZ/ht7OJKObTC+VSbhBucC6yTxYPtZp7tTyLfNR4ReJ
q09ZfRsmPbRLgEVf+5phxmbaevk7uw==
=Gzed
-----END PGP SIGNATURE-----

--ydudqqbygmakmkzx--


--===============2600932971693657458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2600932971693657458==--

