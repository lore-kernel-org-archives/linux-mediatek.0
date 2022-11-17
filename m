Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB89DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 11:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kZT3E3IOjokVROlOqKVSH5XXamDxu/bVQu/aUA7sPo=; b=sgvK6OtFwakIllt8MOkC2AEQLm
	w9JhgX7nAvKME2zPU7O9b1V6+eRRBlsk7plSzB1MSstaZmqNgii/aWXmBeQWSMBLYGaLV135Ve3YW
	lJWNfFKSWheTebTD/PvfPA8w6jaaxZkaVwpB+kc4OzARqKMrTfJwfwzkXxHbS0AbFMiLxfqmMKV80
	vXcPTYq1vESRnzVEUOfBo3+N07SMqCE+//lHN4oid+jd0/KnI6gtmUpDGmm4wB68U2MQNLPhz07Mr
	4zcAPJHxypGgK/wZjfKLsaxdXc3PbB3r/ggzVC3GtHw13wqyniaCnTnZFPVUd2XFN7LJ7z1T0Kl/g
	33d3mPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovdGT-00DMpf-Ev; Thu, 17 Nov 2022 11:41:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovdGP-00DMlr-S9
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 11:41:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ovdGF-0004db-1A; Thu, 17 Nov 2022 12:40:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ovdG6-004q8e-Fp; Thu, 17 Nov 2022 12:40:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ovdG6-00HGZa-PW; Thu, 17 Nov 2022 12:40:42 +0100
Date: Thu, 17 Nov 2022 12:40:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <fparent@baylibre.com>,
	Zhi Mao <zhi.mao@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: pwm: mediatek: Add compatible for MT7986
Message-ID: <20221117114042.iafjyb6yuxp7tavr@pengutronix.de>
References: <6f28ccf3-ea27-9d5e-bd67-14f7729f713f@linaro.org>
 <e2170b37f28238c59b2f43309822b63a4d0ac9b1.1667243978.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="354maudea2s6zisl"
Content-Disposition: inline
In-Reply-To: <e2170b37f28238c59b2f43309822b63a4d0ac9b1.1667243978.git.daniel@makrotopia.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_034101_959940_4E400E59 
X-CRM114-Status: GOOD (  24.81  )
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


--354maudea2s6zisl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 07:23:28PM +0000, Daniel Golle wrote:
> Add new compatible string for MT7986 PWM and list compatible units for
> existing entries. Also make sure the number of pwm1-X clocks is listed
> for all supported units.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/pwm/pwm-mediatek.txt  | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Doc=
umentation/devicetree/bindings/pwm/pwm-mediatek.txt
> index 554c96b6d0c3e0..952a338e06e7c5 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> @@ -2,14 +2,15 @@ MediaTek PWM controller
> =20
>  Required properties:
>   - compatible: should be "mediatek,<name>-pwm":
> -   - "mediatek,mt2712-pwm": found on mt2712 SoC.
> +   - "mediatek,mt2712-pwm", "mediatek,mt6795-pwm": found on mt2712 SoC.
>     - "mediatek,mt6795-pwm": found on mt6795 SoC.
> -   - "mediatek,mt7622-pwm": found on mt7622 SoC.
> -   - "mediatek,mt7623-pwm": found on mt7623 SoC.
> +   - "mediatek,mt7622-pwm", "mediatek,mt8195-pwm", "mediatek,mt8183-pwm"=
, "mediatek,mt7986-pwm": found on mt7622 SoC.
> +   - "mediatek,mt7623-pwm", "mediatek,mt7628-pwm": found on mt7623 SoC.
>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
> -   - "mediatek,mt8183-pwm": found on mt8183 SoC.
> -   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
> +   - "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8183 SoC.
> +   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm"=
: found on mt8195 SoC.
>     - "mediatek,mt8365-pwm": found on mt8365 SoC.
>     - "mediatek,mt8516-pwm": found on mt8516 SoC.
>   - reg: physical base address and length of the controller's registers.
> @@ -20,11 +21,14 @@ Required properties:
>                  has no clocks
>     - "top": the top clock generator
>     - "main": clock used by the PWM core
> +   - "pwm1"  : the PWM1 clock for mt7629
> +   - "pwm1-2": the two per PWM clocks for mt7986
>     - "pwm1-3": the three per PWM clocks for mt8365
> -   - "pwm1-8": the eight per PWM clocks for mt2712
> +   - "pwm1-4": the four per PWM clocks for mt7628 or mt8183
> +   - "pwm1-5": the five per PWM clocks for mt7623 or mt8516
>     - "pwm1-6": the six per PWM clocks for mt7622
> -   - "pwm1-5": the five per PWM clocks for mt7623
> -   - "pwm1"  : the PWM1 clock for mt7629
> +   - "pwm1-7": the seven per PWM clocks for mt6795
> +   - "pwm1-8": the eight per PWM clocks for mt2712
>   - pinctrl-names: Must contain a "default" entry.
>   - pinctrl-0: One property must exist for each entry in pinctrl-names.
>     See pinctrl/pinctrl-bindings.txt for details of the property values.

I have no concerns. However converting that to yaml would be a nice
thing. Also I didn't notice an effort to adapt the dts files
accordingly. But that might be because I wasn't on Cc: for these (or I
might have missed them despite the Cc: :-)

I'll mark this patch as handled-elsewhere in the PWM patchwork.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--354maudea2s6zisl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN2HbcACgkQwfwUeK3K
7AnwKAf+KLqsYzYCpZ4xcmQE2Sz176na/2EfV4aRcaOI59IzpZ+9qLx6fB/TZJkk
5EZpDBLhvfU7Z2cZSh1NaIofHryDB/4kLHraevxfBE0llrkKYp4tqjiFqc65zixf
vNx92I9KqJlV4yYfZOoMBF2rbdNkQ6GUMGARzzt/1S1Un0qbURY61vgHFXrYcPri
wlMOrg8NHAC+vDrlWm18kf9s/xHtG3q7r9BXRvfOY87sFrg7fabt1ZZZekxcZCs9
fvqxRXzFF08k6ocGxqrMKJzkHquA4YSLLRoiuYhox824yVqiMtMkwaQc2kqQUNjN
ass9UQVGR/pSxuqIRyUzl6Lu6fL+7A==
=RVOc
-----END PGP SIGNATURE-----

--354maudea2s6zisl--

