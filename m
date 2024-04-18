Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78325C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWXX2EgR5OMeWYZwjb9fOYF2i4vz4IgxlTSTFyfNR4E=; b=4Tg4zv9nrDLsWXlswJPhBnW9lb
	7s9iIuJqQs8K49yEMw4jmmOs/gaJdImMaMEfwcVMpj5ZPMDXF0d4WFxjDHcqL2fcQYuVxHP4slTCg
	dISQbsQ9ErumYofvxUT9CcAE86dB/pEuBS7VI4JCYqtAzHWL62uIyhIGSvmfzYDbxJpsEqBF4dx7b
	269zJnR/HcjXOl0MZLgDgzs7ep47bhnchBy9/OZbr0bxakMupr/lwGWp6N569y7Ws6JfYcEiuJ8jb
	+BGn+skSBn9FD4RVlVT2SRS2oNigQn6Rxhs9R8tvwmTl5Q7HDba8cn6thCGFkbM3/v46/p0A4aiVE
	JG91YIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxU8q-00000002ueZ-0ILx;
	Thu, 18 Apr 2024 15:57:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxU8m-00000002uaS-1f4O
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 15:57:38 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxU8H-0006Yg-SF; Thu, 18 Apr 2024 17:57:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxU8D-00D07n-UP; Thu, 18 Apr 2024 17:57:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxU8D-003YUR-2e;
	Thu, 18 Apr 2024 17:57:01 +0200
Date: Thu, 18 Apr 2024 17:57:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Fabien Parent <fparent@baylibre.com>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 11/17] dt-bindings: pwm: mediatek,pwm-disp: add
 compatible for mt8365 SoC
Message-ID: <ddqgzbhmkp57wupumrm7ht3bivohukfzebn5vez2ft2ksij4yc@irllweyitwoy>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
 <20231023-display-support-v3-11-53388f3ed34b@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mfe5lzcqzhilqxcv"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v3-11-53388f3ed34b@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_085736_456851_3114D141 
X-CRM114-Status: GOOD (  18.55  )
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


--mfe5lzcqzhilqxcv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Apr 18, 2024 at 04:16:59PM +0200, Alexandre Mergnat wrote:
> Add a compatible string for MediaTek Genio 350 MT8365's display PWM
> block: this is the same as MT8183.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml=
 b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index f8988af05287..180dd8366935 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -31,6 +31,7 @@ properties:
>                - mediatek,mt8188-disp-pwm
>                - mediatek,mt8192-disp-pwm
>                - mediatek,mt8195-disp-pwm
> +              - mediatek,mt8365-disp-pwm
>            - const: mediatek,mt8183-disp-pwm
> =20
>    reg:

As there is still no feedback about how this should be merged, I went on
and applied this patch to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mfe5lzcqzhilqxcv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYhQswACgkQj4D7WH0S
/k7XLwf9E9OpRFmUhJZZk3JE9n1r/ktNvu8zeUbfAQag5XpWlYUY2beEvVqVuxZC
YtZvITxe3UZ0UpMk7znYoeI1PMZlUTyZwOEOvltlWl6macba9jX+VQ+xjK82f63C
A3rcI9ENcwhZWaHCstFPn/bjUp6Axjay+g/s7ROlANv+DzfuuB6qvGB9XWnegBap
dNX5ml9DULwd+nNqH5wWO1BEaVqLtsxd9tV+yitrdLW3AQnpfS95u9XH1MKDq/aS
f+X9nY+zJ3mb4nGhHCvq4Hw3jZkqobclHUVI9D7yD05LBe5HnVJji2dSOGssblDB
SjQo2XmiwuL8WgQ3MXKJZ2QiytiyPA==
=cDLN
-----END PGP SIGNATURE-----

--mfe5lzcqzhilqxcv--

