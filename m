Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DCFC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4oEd0hYqEGYfRJx86h5m8oZ8YchiYKWRTfBj3jdetY=; b=puuh0+DEoCE88Td2uUKV6VhXuO
	Ch0WL4aLNISXkPLpJyExUIlDy8lCrgir8wNyxd1V5OydROjLsV5PHHtnhAWV6JW7UPTspgWA5jSh3
	6NOEHhaAAEux1h3BtRdQerITbH4b9DBjCsI54S+O9D/dHyzT7KF80goQhyCn3BHw0+5I0ZBxoDmXs
	aQxn0HPBKitMlVH8ACUQW46N8nzxDATsCSdHJu6yaZVtg09ibnwI4X69ys2Iue3mUM7nR3D1DKshX
	tXZwrn6pu86xqF25BGJwmHKdj4d8aPBroKmSXcYr2EmU8UH1Q55oFl+58HdHi5ErD0oRvmw5PXgJk
	D+isL6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLwl-00000008LJ1-2ZQs;
	Mon, 15 Apr 2024 13:00:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLwc-00000008LGL-3pwz;
	Mon, 15 Apr 2024 13:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 013E860C91;
	Mon, 15 Apr 2024 13:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A79CC113CC;
	Mon, 15 Apr 2024 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713186021;
	bh=k1NHarrRf6+0evlATOpqE9bsBp5lnGFC65EI2aXuFVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYV8yr1BxQ8bEDR53ZXi1krWC2JwmtpDUQAKTgtQNR/woH2FPCaPGiWE4HFUzm6hK
	 VOZQ0pmrS0AYtMm3JUk2TPSGWJGdRqVIaX3SxH6bXN73YqDvmSh7eKn7JJMl5Nh+hQ
	 n9pWGWgvN4laYTYI8T4+zcKXnx95fjv0ddFenNS9q5qPrisMcZO5pMWMLv0xRqK8FU
	 NO9MCoZ/hG3rY+5jNOCOYWNH0ebCgiWDd3A+huW9GXIQDUXoFoqackzBPute7ksLFg
	 r2mIipvDd1VAupk2DicE6mpnxj0kAutIpS8/Zcjb3jZVyBffComsq7/YPkpaCOUEy6
	 lFTF/cd/Mebxg==
Date: Mon, 15 Apr 2024 14:00:16 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	peter.wang@mediatek.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, lgirdwood@gmail.com, broonie@kernel.org,
	matthias.bgg@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 7/8] dt-bindings: ufs: mediatek,ufs: Document
 additional clocks
Message-ID: <20240415-happiness-reenact-6598d7b32435@spud>
References: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
 <20240415110012.148871-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="93PiK0lDfTnn6QRe"
Content-Disposition: inline
In-Reply-To: <20240415110012.148871-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_060023_112703_634399EE 
X-CRM114-Status: GOOD (  16.41  )
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


--93PiK0lDfTnn6QRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 01:00:11PM +0200, AngeloGioacchino Del Regno wrote:
> Add additional clocks, used on all MediaTek SoCs' UFSHCI controllers:
> some of these clocks are optional and used only for scaling purposes
> to save power, or to improve performance in the case of the crypt
> clocks.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/ufs/mediatek,ufs.yaml     | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Do=
cumentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> index 5728e750761f..1df8779ee902 100644
> --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> @@ -23,11 +23,24 @@ properties:
>            - const: mediatek,mt8183-ufshci
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 12
> =20
>    clock-names:
> +    minItems: 1
>      items:
>        - const: ufs
> +      - const: ufs-aes
> +      - const: ufs-tick
> +      - const: unipro-sys
> +      - const: unipro-tick
> +      - const: ufs-sap
> +      - const: ufs-tx-symbol
> +      - const: ufs-rx-symbol
> +      - const: ufs-mem
> +      - const: crypt-mux
> +      - const: crypt-lp
> +      - const: crypt-perf
> =20
>    phys:
>      maxItems: 1
> --=20
> 2.44.0
>=20

--93PiK0lDfTnn6QRe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh0k4AAKCRB4tDGHoIJi
0mEcAQCL6JDQAVAMOHj599dEhcGaBzsjjotAhC16jd/M9usHrgD5AYNnPqgEhjhv
gRib2qn9ljMx3UT9oOUw9481wleicQQ=
=urMw
-----END PGP SIGNATURE-----

--93PiK0lDfTnn6QRe--

