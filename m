Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E9FC001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EL/S9Tllz7yaDtU3nVskj85X6qXO9Rt0ZJ4RQzT3drQ=; b=bK8smUa3brtijiRPXpUfqXOtzc
	rbYZFiH/v8sqEPMQvewR8CRd3X6PMCCRjbEKlUhavbWU4FPH+/V89GVFfXra34UGzRW7cABvWo3eL
	qcPvGtfjY9u6biAg+8CNleHSxlfyIms2sBHOqVFfFubt7SO9xhK2zxgm73HmW8++Vx3BrmyHc/zIM
	COlRs5h+A1DiA0o/6n5g1/AcVqTOLuwqL7dyKHj2Mb0uRCLMVS/9hIu+XkJunNyWqFAL/wnWSfEvZ
	MPsZIAUFrbhswzKaaK0k5jQdE6lAVOP+PwsP898Ws8X3qVLysyYufLUoRtvX4C2LWO5ZI+UDS8t3D
	ijDJ/M2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0pN-005pB8-09;
	Wed, 19 Jul 2023 06:38:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0pL-005p96-0Y;
	Wed, 19 Jul 2023 06:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EL/S9Tllz7yaDtU3nVskj85X6qXO9Rt0ZJ4RQzT3drQ=; b=iDaaXhoG96U1WAqQK6IlvFfrGs
	oWK2cY2ks8leLEcO9j1T8ZZfUoP+gRLgkCMvRYN46NJAAIZOFO8vv7tnos2hmLT4JPk4+E/AO5CWH
	Jw24mqt99ZT6fYT2chZPUsw1JzjIFzsJCa6g+Jc2YjsZ9dhLpEeBxiYohdfNbFvGqsgeYDWxcm9WO
	YNoC0ZPEukNs/mYSQomnpbineK+uXi4508jEh5n0cDWGLpgj087DXpHdoEvF9v+WGGTA2mqXLlH1G
	nbAJeEs/JoPqVudTIo4KHRz6Ybxq27fe+49lUieY1hMY517ItYm15lH1Va2SQtwKXfJQgnuymm2FW
	gcCp2JUA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLmOT-00Bgq0-2M;
	Tue, 18 Jul 2023 15:13:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A3A96162F;
	Tue, 18 Jul 2023 15:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7801AC433CD;
	Tue, 18 Jul 2023 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689693186;
	bh=MQCBoldfsIWuP0gtUrC3ZlbXNQ20ZbKT7ydnIEd0bvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIscyqQ0K0RDQ9Tfe9lkcyc//V3wMggRr29mlP0a7splQzBN8Uwd6lB/h8alUKcuA
	 6lT9Rp1a0sHHcuqCZN3SX+Da3JwDBO1EyZdd5hAoyYyoIkt/7TFakIR04XgiotBgv2
	 d40YmoS4mo9uD11Inf6T8OY/YL3eJVmO0698/bVXcngxFRoc72Z+UPX2pcrVabpQpG
	 6zD3OkKHotRJ9KddBPKEYWPeTFWBgOp7jcBmKLJGz0c2v2PIq6JKdxuC1KTuWgrRxD
	 Aakf/LBn4D2ahWC9kQuAARxtd0prue28hFqk/JrIA+e7f/8QTb1OGCWlxzLl4ncVXi
	 dnvWnJzf2uHjg==
Date: Tue, 18 Jul 2023 16:13:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Jason-ch Chen <jason-ch.chen@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 3/4] dt-bindings: soc: mediatek: pwrap: Modify
 compatible for MT8188
Message-ID: <20230718-sporting-refurbish-85fdfab85d32@spud>
References: <20230718110947.13426-1-jason-ch.chen@mediatek.com>
 <20230718110947.13426-4-jason-ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EXKcfWAFHTVX6jj4"
Content-Disposition: inline
In-Reply-To: <20230718110947.13426-4-jason-ch.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_161344_918291_1860C4F9 
X-CRM114-Status: GOOD (  20.35  )
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


--EXKcfWAFHTVX6jj4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 07:09:46PM +0800, Jason-ch Chen wrote:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
>=20
> The reason for changing the patch was that while MT8188 uses the same
> pwrap as MT8195,

> the original code was only applicable to 'compatible =3D
> "mediatek,mt8188-pwrap"'.

I don't really understand what this means. Did you mean, "the original
binding only allowed..."? If so,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> To resolve the DTBS check warning that
> '['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too
> long', it is necessary to modify the code.
>=20
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwra=
p.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index a06ac2177444..4737e5f45d54 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -41,7 +41,6 @@ properties:
>                - mediatek,mt8173-pwrap
>                - mediatek,mt8183-pwrap
>                - mediatek,mt8186-pwrap
> -              - mediatek,mt8188-pwrap
>                - mediatek,mt8195-pwrap
>                - mediatek,mt8365-pwrap
>                - mediatek,mt8516-pwrap
> @@ -50,6 +49,11 @@ properties:
>                - mediatek,mt8186-pwrap
>                - mediatek,mt8195-pwrap
>            - const: syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-pwrap
> +          - const: mediatek,mt8195-pwrap
> +          - const: syscon
> =20
>    reg:
>      minItems: 1
> --=20
> 2.18.0
>=20

--EXKcfWAFHTVX6jj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLar/QAKCRB4tDGHoIJi
0gzUAQCA+hb03Fyyv+lFYbelmyhip/sbhwTGybZsMTusz4F8PwEAnaGi4QhoI8g3
Wi+ugNFLwULR/RaU57KUagR75DitXgc=
=dcTK
-----END PGP SIGNATURE-----

--EXKcfWAFHTVX6jj4--

