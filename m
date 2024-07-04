Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45360C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUqzRO/XgSHZ3YuAQEEP3UcyKWRFfelu2oJrA+smGeM=; b=f7HdqbX9Y6LW5A6eqL5Tj2N9H2
	HTI6yVpkraCE5mrcA6EXPTzlMLLDG6o+HKmMzjCASJEF93+RX+wG98l7cInE692tgOCwzvH3wLpNK
	n/rKA7gXgRerj7mtuCq4LmGj/JLIJt3TF0aC4E7dfEHiqq3tavFsIT8VsuOIHOBl1bHWVgtlTyVwh
	ApGiE3laHT9g+YSmOvjmXPFwKn1G0ECesBWsA/z7bUufMsYcfgkOQsr8oYluqJbcS9QfZR8Y3ldwt
	bPEfpfoY0MWN8d2IQ1j1Mj9Sl7yrjUfkJmwgF+HSB6i10OXa8A4kuDGj1rQ9bW0l2Z2e85/iartuT
	d5gNdomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPLh-0000000DqbP-3nqD;
	Thu, 04 Jul 2024 16:30:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPLS-0000000DqWk-2Quh;
	Thu, 04 Jul 2024 16:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E2614CE339B;
	Thu,  4 Jul 2024 16:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414B7C3277B;
	Thu,  4 Jul 2024 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720110604;
	bh=vbQNmbizscGnFEzZbv2lkWkZcCMQUGNDhhXdfLLW1wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2QYsVEEBIqNboJZ8cWxuQHeSufZDoE3qgUj4mYJAzaY5JP+8b1pONc4L3aEfy7yv
	 HfQT5GbbwpVUHr5is+spBhiZSgna8YZ4Nqq1U2XQasfF/rrbiRowUPMdDBULFMi+B8
	 FlLkf7kLNouxuO03et7WlG3sv1Uds77GO0zgPPEJD1+HrjjwbXbYf6dV2wL9/U0m2E
	 Ee2oLEqXzyL//wTfUGgFdj600z1hvZ7Lnkz9LspDVR7+3mRS6oLqspR5cKgzPC17ff
	 73R+8Ai3M7Gk1KIo/FQgA4lR8b16tHVekkMq77b0jY1sZLP6yFbvHFIWQQ8eWxpmYE
	 lkkrzocFezoBw==
Date: Thu, 4 Jul 2024 17:29:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Phi-bang Nguyen <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <20240704-unpopular-afraid-95f2cc570f14@spud>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-2-bfccccc5ec21@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JzWemIVJnvTZ8xJy"
Content-Disposition: inline
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-2-bfccccc5ec21@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_093006_996962_EED4D5CE 
X-CRM114-Status: GOOD (  16.58  )
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


--JzWemIVJnvTZ8xJy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 03:36:41PM +0200, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
>=20
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365
>=20
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Link: https://lore.kernel.org/r/20230807094940.329165-4-jstephan@baylibre=
=2Ecom

Another confusing link tag, why is it here?

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        camsv1: camsv@15050000 {

Didn't Krzysztof already comment about the node name here?
Additionally, the "camsv1" label doest appear to be used, so should be
dropped.

Cheers,
Conor.

> +            compatible =3D "mediatek,mt8365-camsv";
> +            reg =3D <0 0x15050000 0 0x0040>,
> +                  <0 0x15050208 0 0x0020>,
> +                  <0 0x15050400 0 0x0100>;
> +            interrupts =3D <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> +            clocks =3D <&camsys CLK_CAM>,
> +                     <&camsys CLK_CAMTG>,
> +                     <&camsys CLK_CAMSV0>;
> +            clock-names =3D "cam", "camtg", "camsv";
> +            iommus =3D <&iommu M4U_PORT_CAM_IMGO>;
> +            power-domains =3D <&spm MT8365_POWER_DOMAIN_CAM>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                port@0 {
> +                    reg =3D <0>;
> +                    camsv1_endpoint: endpoint {
> +                        remote-endpoint =3D <&seninf_camsv1_endpoint>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6bd7df1c3e08..9ac8c08ba692 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14163,6 +14163,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboar=
d.com>
>  M:	Julien Stephan <jstephan@baylibre.com>
>  M:	Andy Hsieh <andy.hsieh@mediatek.com>
>  S:	Supported
> +F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>  F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> =20
>  MEDIATEK SMI DRIVER
>=20
> --=20
> 2.45.1
>=20

--JzWemIVJnvTZ8xJy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZobOBwAKCRB4tDGHoIJi
0t2ZAQDx9N9SbuBuVIR/jnCjIUwikw5c+HB1mTM3uYazkN8FUQD7BF74NxljtkNc
Q/egdw+G8jqdjnbIs0wvdu2uswqp0Q0=
=8KLb
-----END PGP SIGNATURE-----

--JzWemIVJnvTZ8xJy--

