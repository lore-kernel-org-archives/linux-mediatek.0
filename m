Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA22C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JF/V0RrbGEfLo9yMxNodWF6bcb+WTZmGVRP+zBEOwY=; b=c0ii5Aok9VLBq0kDX61R0OBIfS
	MqWXf/Bb+svkrx5uDFx0qyoZxujmEPSJ8Nqh/8r4WxU1p2z8N8RZ5P5QWOF318VaB+TAU0O/KdOJP
	Cjue/ues8HvGZZM/eQ0FTQ0EM92zcw1XDomS0fwZZp5H9Hn/Up9A5XmMLfxF119/QKdntmIEZfC+a
	V0Y674EGr/SKsr4UPqZyvXSXghGbUvlh9bPYJM3g21RXAOuDkItEkSfF7kDZ677d74pKUw0DDJBI9
	PIv+VcwBc/c4eGX62mG0qQuSfnJPJ+qx/0msfq+TXDebLwO4oFCVA9L1oOY1AQZMyacgUYXLsvYYn
	vSHMN+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw4A-0000000CfXQ-2p69;
	Thu, 11 Apr 2024 15:10:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw46-0000000CfTj-1u6W;
	Thu, 11 Apr 2024 15:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B698BCE0C72;
	Thu, 11 Apr 2024 15:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3738EC113CD;
	Thu, 11 Apr 2024 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712848212;
	bh=tH5GwggbPz305Kl6EbUr95HFBDOSgGMYA7QcHk6KzVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCWsz4utmYewzyojhx2V/JATN+mTcnX3uUCcUXBn8RrUxl3EcU+vM1rnGHeehzkDm
	 mEYEYcAKBiLAxdxoGhlEBppFtAMOcQ8ZFAQscjY1Iyq2SnjBAStAvFTu/bXLTPOGyG
	 RfdG2OhyIteF+eIpIrHZ2siXlHpxIXDOIq9mvakK9J+z/Z+eniQ3u/sXW0xNDx2c4x
	 id3FHIisD3k5kTlOIt1haLd1xpdfh5oyE6IkcdFCy/10pXwMSyd64Zcmny3e6gVI8j
	 FgPJBIgNIpYiPYWOtS8WKcMBO0Iln9LzSSqDADXyL3d9s80SKDkbSsV6dE3kGtqmy7
	 wGnwWa6PYObZQ==
Date: Thu, 11 Apr 2024 16:10:06 +0100
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
Subject: Re: [PATCH v2 7/8] dt-bindings: ufs: mediatek,ufs: Document
 additional clocks
Message-ID: <20240411-filth-trekker-8a8c185d589b@spud>
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
 <20240411114300.169055-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="83ERy7+r+DSooO69"
Content-Disposition: inline
In-Reply-To: <20240411114300.169055-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_081014_897916_D7BDA571 
X-CRM114-Status: GOOD (  16.85  )
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


--83ERy7+r+DSooO69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 01:42:59PM +0200, AngeloGioacchino Del Regno wrote:
> Add additional clocks, used on all MediaTek SoCs' UFSHCI controllers:

I appreciate being told they're on all, rather than it being unsaid and
having to ask.

> some of these clocks are optional and used only for scaling purposes
> to save power, or to improve performance in the case of the crypt
> clocks.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Do=
cumentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> index e2c276da3f2c..21b038db100c 100644
> --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> @@ -26,11 +26,23 @@ properties:
>            - const: mediatek,mt8183-ufshci
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1

Could you add an itemised list to the clocks property please?

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

--83ERy7+r+DSooO69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhf9TgAKCRB4tDGHoIJi
0nPsAQDR9MO4nmtSmAMmQ8o43G0oFD2I4Ib5sc7/3XCMceiSbAD/ZQOJyUwxivM/
5IxvlYIjm4x83lwZ0N6c2CYnEQXh0QE=
=NwEY
-----END PGP SIGNATURE-----

--83ERy7+r+DSooO69--

