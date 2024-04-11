Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7535BC001CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQppr6YkppdhL8RfxjMo+S1VY+4anVavcdS6OArVZ+k=; b=QICxZRe56DSXTchmTmchiKzUPz
	Hucqm0+8JvCvacnuGAZ4t2/lYZg+SAlSyoaW7lPo4+NRXO+ZGalsS9olnGzuI+IWGyphjklVMAZHw
	PU9b657zuA2Wof+ruI/r4yPje/hxd083DElffosxM22peaW0B0n1RAWjvbIMF0ZzdiHfbGV3Xv07R
	OD+rwrux/xJTwSUkNestByLcXUaLqfQOjsJWJiVIuVJc5HLxw5y8GdUs2UABGC3b0OWtYwAYRs06G
	gmUs8GemfyD7Uv6wOsNGWYIZ5SXjksKJyxgxCjYRBK40wlTPlXWekXLcs5LVBu9ay0MBJM2EIfTOA
	ROjwQceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw1n-0000000CeS4-40F1;
	Thu, 11 Apr 2024 15:07:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw1j-0000000CeOn-12rM;
	Thu, 11 Apr 2024 15:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE9A6CE0C72;
	Thu, 11 Apr 2024 15:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28196C113CE;
	Thu, 11 Apr 2024 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712848063;
	bh=VpEv0RUqg4n89BJQGyRGVxP1qQqMYa3vM+hZex0YOeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHECe3j0C4p8Yt0BBy+MOlPPQI7mguC51Jijc2UlAycDcChcV/t9igE5resm1hJXY
	 816kOdVjm6KgP1Qz037HsCGtuoiufPuELVORLVNkTEBFfUZpUpVG6X0dO/mlkNKdWS
	 2VkzumDlVEmCc37le8ZG1yO+mnupDjo64y1l8+3y3/RCuGENK5svNPCRyUx7HHDkHq
	 B6nOJPZdLvPUOKhUihYKReckuI+Z7Ha/Nm9Hxba7j4cnH3sOtHEQfkBqBhpOn64bbm
	 aNnYN89FKxyWIuG/usB1L8Ltqr0neiZ/XCVJBkLiA83ZhWu45xXF5myJnrZywXmKti
	 U1xCeB5lHN58w==
Date: Thu, 11 Apr 2024 16:07:37 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	peter.wang@mediatek.com, chu.stanley@gmail.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, lgirdwood@gmail.com, broonie@kernel.org,
	matthias.bgg@gmail.com, stanley.chu@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/8] dt-bindings: ufs: mediatek,ufs: Document MT8192
 compatible with MT8183
Message-ID: <20240411-owl-euphemism-955ca43b5190@spud>
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
 <20240411114300.169055-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w6qAEWdCVN3uindW"
Content-Disposition: inline
In-Reply-To: <20240411114300.169055-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_080747_688705_3CDD1917 
X-CRM114-Status: GOOD (  17.89  )
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


--w6qAEWdCVN3uindW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 01:42:57PM +0200, AngeloGioacchino Del Regno wrote:
> The MT8192 UFS controller is compatible with the MT8183 one:
> document this by allowing to assign both compatible strings
> "mediatek,mt8192-ufshci", "mediatek,mt8183-ufshci" to the UFSHCI node.
>=20
> In preparation for adding MT8195 to the mix, the MT8192 compatible
> was added as enum instead of const.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/ufs/mediatek,ufs.yaml        | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Do=
cumentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> index 32fd535a514a..adcd13023866 100644
> --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> @@ -14,9 +14,15 @@ allOf:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt8183-ufshci
> -      - mediatek,mt8192-ufshci
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt8183-ufshci
> +              - mediatek,mt8192-ufshci
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-ufshci
> +          - const: mediatek,mt8183-ufshci

It's a bit more distruptive since you'll have to modify a dts, but why
permit both of these ways of describing the mt8192? Could we drop it
=66rom the original enum and no longer allow it in isolation? There
shouldn't be any compatibility concerns with doing so.

--w6qAEWdCVN3uindW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhf8tQAKCRB4tDGHoIJi
0pr4AP9BKNcugGYlb1HWoH8V4MvvkEcaVh8Xm42KMyQkAxz+IgD/SPrydC7EpjyO
fuZgi9n2btcClNJjUcV7Nkr03VPk6Aw=
=PCb6
-----END PGP SIGNATURE-----

--w6qAEWdCVN3uindW--

