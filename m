Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B242DCDE020
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kj3gY+E0GvmI9il9mQVeUHLdw9P3P5lNxkLG0QHpis=; b=mYJD7lEaZ1Rr8IYB8NRdDpScQA
	atEF7KczCQjVVZ0Cwq152zQaEZIxFdy7ShlTOkyU5OgHlN3QYMEJiG7XEdj0hVqI++/yYogNWKEUm
	a9NXgSthdr1cMSjJjGsvsh0ZMSF43H5i/+DcQrxy3V9zV/OwdBN2Jp0grX9W/iDN+9N0YMJU83u1Y
	CjfQuG/lMCBOkxiy/S1WLy35+F+KwK22LFbC7gEiXIaGZmOi04215WIaozc5tMfTg3gA3QsdteNF4
	USZhmI8GWS1cP6l7ESSKGtq9CEvAOIGIdhgelsqX/0lNqZW+NVheoG2rVNqgK5uPqm1SaXnZThMJZ
	gBRZMbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1strBZ-00000008rmu-1jvi;
	Thu, 26 Sep 2024 16:17:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1str7x-00000008rKO-03pl;
	Thu, 26 Sep 2024 16:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D42C6A40F52;
	Thu, 26 Sep 2024 16:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66511C4CEC5;
	Thu, 26 Sep 2024 16:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727367239;
	bh=7vn8F+i4bEeKF3b0bUuklVycjsEm0yuEh18P9WeIlLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efMmBCXCAt1k+tJ4J0c/ZlREBJtvswL3y3/vVBLcHSZTL9+uM0q+u9ekHfDC6Ax1N
	 WUqY3S66gL3mnDjul84umvldE8zXjRdmgR3AK5EUlgUT+1058rPS+jDh39+D2im9Tw
	 v5QVVtWC4R+a/zNPyVgmMDo7w9xrJCQvM3QMpJBMRiIBveZAz8RbQL6OOB0gxzRnlC
	 sF6TaBckQw7KgwCKQgQfkUHevZc8SzRyCGntesISjkGJkNeWcS53ExkdamzUj7qfYl
	 u1lDUL4nktfZJ/2IdUT8TYGuD75MYFzwHovmvD6iyYKsP0a+jBNQVrNa1SfSY1kRPb
	 OJVlmVuK3UnAg==
Date: Thu, 26 Sep 2024 17:13:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, wenbin.mei@mediatek.com,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: mmc: mtk-sd: Add support for MT8196
Message-ID: <20240926-footprint-faster-4263120d0b83@spud>
References: <20240926070405.20212-1-andy-ld.lu@mediatek.com>
 <20240926070405.20212-3-andy-ld.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rTdKX9h0An540zaG"
Content-Disposition: inline
In-Reply-To: <20240926070405.20212-3-andy-ld.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_091401_207070_17CCF413 
X-CRM114-Status: GOOD (  21.69  )
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


--rTdKX9h0An540zaG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 03:03:18PM +0800, Andy-ld Lu wrote:
> Extend the devicetree bindings to include the MT8196 mmc controller
> by adding the compatible string 'mediatek,msdc-v2', which could be
> also used for future compatible SoCs that support new tx/rx.
>=20
> Add three properties for MT8196 settings:
> - 'mediatek,prohibit-gate-cg', indicate if the source clock CG could
>   be disabled when CPU access IP registers.
>=20
> - 'mediatek,stop-dly-sel', configure read data clock stops at block gap.
>=20
> - 'mediatek,pop-en-cnt', configure the margins of write and read
>   pointers while begin to pop data transfer.
>=20
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Document=
ation/devicetree/bindings/mmc/mtk-sd.yaml
> index c532ec92d2d9..82d1a9fac67c 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -25,6 +25,7 @@ properties:
>            - mediatek,mt8173-mmc
>            - mediatek,mt8183-mmc
>            - mediatek,mt8516-mmc
> +          - mediatek,msdc-v2
>        - items:
>            - const: mediatek,mt7623-mmc
>            - const: mediatek,mt2701-mmc
> @@ -154,6 +155,30 @@ properties:
>      enum: [32, 64]
>      default: 32
> =20
> +  mediatek,stop-dly-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some SoCs need to set appropriate stop-dly-sel to configure read d=
ata clock
> +      stops at block gap. The valid range is from 0 to 0xf.

If you used a specific compatible for these devices, which you should,
you would not require either this or "pop-en-cnt".

> +    minimum: 0
> +    maximum: 0xf
> +
> +  mediatek,pop-en-cnt:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some SoCs need to set appropriate pop-en-cnt to configure the marg=
ins of write
> +      and read pointers while begin to pop data transfer. The valid rang=
e is from 0
> +      to 0xf.
> +    minimum: 0
> +    maximum: 0xf
> +
> +  mediatek,prohibit-gate-cg:

This is also probably detectable from a specific compatible, if you had
one?
TL;DR specific compatibles please, non of this "msdc-v2" stuff, sorry.

Thanks,
Conor.

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Decide if source clock CG could be disabled when CPU access IP reg=
isters.
> +      If present, source clock CG could not be disabled.
> +      If not present, source clock CG could be disabled.
> +
>    resets:
>      maxItems: 1
> =20
> @@ -191,6 +216,7 @@ allOf:
>              - mediatek,mt8188-mmc
>              - mediatek,mt8195-mmc
>              - mediatek,mt8516-mmc
> +            - mediatek,msdc-v2
>      then:
>        properties:
>          clocks:
> --=20
> 2.46.0
>=20
>=20

--rTdKX9h0An540zaG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWIQwAKCRB4tDGHoIJi
0p62AQC7zWy8sxC+DpKsViZDlAuVYx19RGJZLpxLCCMrqTjtggEA47f0DiCOzh8l
0cDhA/a8DytL3SRUlW08RURFaOLoWAo=
=qF+N
-----END PGP SIGNATURE-----

--rTdKX9h0An540zaG--

