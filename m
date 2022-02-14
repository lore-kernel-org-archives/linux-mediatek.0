Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB373C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eA/OWI+aI/1aRLs1Fbf4Si8vfPxPAuNmRayDA5h7eXY=; b=mzkeetmmnkzDzlWtmaC0KCnr9r
	TItExgNoS60eAZRtOF9qaCpglgKXcqMCZ8wjjVvyR8k+nYSkzVCxFRTg60z82BRlX4OFEj+4MZiWE
	xJncE89tIsYD63GfScGMKl2h3EUdxrRGBmF1rTuxdqVuCtDBu1EpOpFrDuJ0hiD+dB4qwqKwNJdgs
	dvWIZMYuE6ibU2zaTSCvrTgunvKfaXwCWuWJq8mBexCupoFAxtzJLGIzDWw0IPEB6DBXu0E0fKYWJ
	vul2XIKkWwDiOFmJH9KyzjMtN4xskjYGapef20NDvDtzyOj8/foXwPcA+4YKVzBAAxKJAWOgH82ZL
	CoCIJY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJc4b-00Fbxx-U8; Mon, 14 Feb 2022 14:11:25 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJc4M-00FbrP-1r
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 14:11:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJc4H-0000Vq-VR; Mon, 14 Feb 2022 15:11:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJc4H-00GZ4x-4p; Mon, 14 Feb 2022 15:11:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJc4F-0038n2-Ee; Mon, 14 Feb 2022 15:11:03 +0100
Date: Mon, 14 Feb 2022 15:11:03 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [1/1] dt-bindings: pwm:Convert pwm-mtk-disp.txt format file to
 pwm-mtk-disp.yaml format file
Message-ID: <20220214141103.74fdqqfixq3jnoyc@pengutronix.de>
References: <1644847276-27622-1-git-send-email-xinlei.lee@mediatek.com>
 <1644847276-27622-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1644847276-27622-2-git-send-email-xinlei.lee@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_061110_114881_E5C6CA0C 
X-CRM114-Status: GOOD (  18.30  )
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
Content-Type: multipart/mixed; boundary="===============9061060900829827085=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============9061060900829827085==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="at4uj2znseres3nl"
Content-Disposition: inline


--at4uj2znseres3nl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 14, 2022 at 10:01:16PM +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
>=20
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>  .../devicetree/bindings/pwm/pwm-mtk-disp.yaml      | 60 ++++++++++++++++=
++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml b/Do=
cumentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
> new file mode 100644
> index 0000000..2f1183e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/pwm-mtk-disp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek PWM Controller Device Tree Bindings
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> +  - Lee Jones <lee.jones@linaro.org>
> +  - Rob Herring <robh+dt@kernel.org>

I would have expected some mediatek people here instead of the PWM and
dt maintainers.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-disp-pwm
> +      - mediatek,mt6595-disp-pwm
> +      - mediatek,mt8173-disp-pwm
> +      - mediatek,mt8183-disp-pwm
> +      - mediatek,mt8186-disp-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Clock
> +      - description: Mm Clock
> +
> +  clock-names:
> +    items:
> +      - const: main
> +      - const: mm
> +required:
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8186-clk.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    disp_pwm: disp_pwm0@1100e000 {
> +        compatible =3D "mediatek,mt8183-disp-pwm";
> +        reg =3D <0x1100e000 0x1000>;
> +        interrupts =3D <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&topckgen CLK_TOP_DISP_PWM>,
> +                 <&infracfg_ao CLK_INFRA_AO_DISP_PWM>;
> +        clock-names =3D "main", "mm";
> +        status =3D "okay";
> +    };
> \ No newline at end of file

Please add this newline at EOF.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--at4uj2znseres3nl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIKYvQACgkQwfwUeK3K
7AmL6wf/arB/fkjjL+4DNJ9y4wa0AkBwDsowLOO78FRZ0tP4Hx4tq0Gat6GCVTrG
3JPyJxbc+sNvxH41ZkzQGTpaWjMl+TGqXZbyLlX97oqXQoEbT+VkkJntsQBRnZWj
v42uTTI9CyM49zJDtfw/oUVaczEIs6bHQm+jqq5c4mxLMXjbZRZdZsdY9jH+GVfR
lZJ8nPEUowlLTcev0WvcE0oU5g2YlzyXAgOWui7VbTqo+cr1BmPu8WZ847adr6pV
TtD6iS+9d0nqGyxvEZAKeRKRyNfejsbQb6onm08rgucbzl8Cwq2HZEbaHrei9Inb
y+FHrtgw0wHzEZ3dP6qrP7tlOJ3y5Q==
=DN6s
-----END PGP SIGNATURE-----

--at4uj2znseres3nl--


--===============9061060900829827085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9061060900829827085==--

