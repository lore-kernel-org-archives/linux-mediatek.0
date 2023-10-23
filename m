Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8ECC25B47
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 17:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irV0VUUwRZrTXggfYga2gNBn6gArQz2SoKZWk9/C7D8=; b=G+7xYBNDZP1BxNJcznQpTg/rCr
	UnhAmp9AHxk54HNNpbumJ3BtzbAgnOGDme+Dni19jwufHc7A6gxWX1KXBYdRojrzTvf9KEQUl+D+h
	JDIDZYaRuvUqg0jqtYuUshn6aTN0MDKDpDCdESXKXTyoFeBdQi83GF4ZSoD1xoYIADsF7WIjGW5c1
	ezrTNkFXiz8tq0sJCnwFXCvHBPdHxwY/K7h97iW2hGAA+kKFShTGN8J9dhJmNs0xonYUQeBeFGPmy
	VLr74gj3oqty6HKCPDZWN9vjOdGFEGS7PRkxpLsFvW7Ume0F5kFNqt4jbgIPGBmmKbGLw7mDLdHI8
	d/3C/YHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyt0-007ykD-0b;
	Mon, 23 Oct 2023 17:38:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quysx-007yiq-1I;
	Mon, 23 Oct 2023 17:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 829DCCE276B;
	Mon, 23 Oct 2023 17:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5BDC433C7;
	Mon, 23 Oct 2023 17:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698082716;
	bh=eZlZ0RSR8neaBBF+HvzJKthBOQ2i00NRtc83TDbgb/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZcoCvRUwfcmv7oI3ZoKRQE+hLDNpdANz8/BDEmtdrSB2ioRBIq6ZoJEeGHZTPrQ6
	 gnxXS1y2gCKIIOUH86xYNxb6Cw1d0qkGZ6JYlMefFOdOgsiepFUfajPb+0UdftD+ao
	 e7EK2ytUx3z+ij79CECne+/7u91MfFH+FZORhv7ytIhrgJPcSFQ8MwD+wAyWV5nbOP
	 FqKH0wpAQmjLNmJr84u1AgLEWBQFaKtk+m+dL+bvfW7mCQjhSpwgNHTXV80gLlneKT
	 1nhCgO0oxC5wcJMmyCa1r/z2anONnpe0U+eedfEA7GRxCX1i7O3rvm7G66ryiZ3gCP
	 B4q/ik75qZn6A==
Date: Mon, 23 Oct 2023 18:38:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Xinlei Lee <xinlei.lee@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 11/18] dt-bindings: pwm: add power-domains property
Message-ID: <20231023-oppose-tamper-36d526ece102@spud>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-11-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cS4xr49HXM/FpVea"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v1-11-5c860ed5c33b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_103839_796837_85E6C611 
X-CRM114-Status: GOOD (  18.21  )
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


--cS4xr49HXM/FpVea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Mon, Oct 23, 2023 at 04:40:11PM +0200, Alexandre Mergnat wrote:
> According to the Mediatek datasheet, the display PWM block has a power
> domain.

Datasheet for which soc? The mt8173? Is it valid for all devices in this
binding?

Cheers,
Conor.

>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml=
 b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 153e146df7d4..efe0cacf55b7 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -53,6 +53,12 @@ properties:
>        - const: main
>        - const: mm
> =20
> +  power-domains:
> +    maxItems: 1
> +    description: A phandle and PM domain specifier as defined by binding=
s of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.
> +
>  required:
>    - compatible
>    - reg
> @@ -67,6 +73,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/mt8173-clk.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> =20
>      pwm0: pwm@1401e000 {
>          compatible =3D "mediatek,mt8173-disp-pwm";
> @@ -75,4 +82,5 @@ examples:
>          clocks =3D <&mmsys CLK_MM_DISP_PWM026M>,
>                   <&mmsys CLK_MM_DISP_PWM0MM>;
>          clock-names =3D "main", "mm";
> +        power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
>      };
>=20
> --=20
> 2.25.1
>=20

--cS4xr49HXM/FpVea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTavlQAKCRB4tDGHoIJi
0v6MAP9Wb3x+52wloDaXjDqYEnoDpprt4+MalmIoclgMkfOMIQEAhpm3TcXRGiJp
BzZXQcz8bAvgaFDyy5KvWovrZlrFSgE=
=4JSZ
-----END PGP SIGNATURE-----

--cS4xr49HXM/FpVea--

