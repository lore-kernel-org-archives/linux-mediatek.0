Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51190C54E71
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 17:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naO8BF7g1cMMU98fqBEpl/Z57ENLBruvG/53N/7HKrM=; b=jzNiXmBupfdc87frid1+182tg3
	KPTcbnkjUfWR/w1MdAwDoVT1r3GQHln5v7n9bJTthCvqnISkfBGcL9SiZxHN/5Nom6sarm0hFqbYh
	fpdMzECJbe8x/RNJfk3MeE9bHS80RFH4q7VnI+PlYX0EadsrPHvxkGed/V9PKc7outRQL5uA8iNKJ
	FiDzO2+Y+EEgwVTYXp+IM53x6Mxi7QYrsphEyUwbK3Q0ABrFSpHmf+NG0STVeahx5/Lp4Dznq/pND
	0V5FD0//71yTkoOzLm+Hk62Bk8gHEASWS/yQavdkMN8Doa6CZg6VxZu7h6OVx+kieHz5pOja5hpRz
	rsapJibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnisQ-00000008C9e-0lGI;
	Fri, 22 Mar 2024 17:40:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnisL-00000008C79-2Fsi;
	Fri, 22 Mar 2024 17:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DFEEECE1177;
	Fri, 22 Mar 2024 17:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E1DC433C7;
	Fri, 22 Mar 2024 17:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711129214;
	bh=tTwBbRt2pqHamlnWharifXWWwuWmdQz8Rk753vrs9Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUV4V9chSdBEhmS3/ab/LOTuC18tZ5+Xt9D4PIFL9rhdteNBuxvFgwNzKnxUCpx39
	 xSNyMVK0iGDIKqvXHfr9GfE6EqcmmKwGa2zd3AQOkAaAiVFr2DIcDnvL/eLoWCW0+g
	 T0htdNedHpFoIJJrZjeG+pIY4NSf6RT4FWmmi4Ncvt0nkLS1j1l+pVWgHYJr+arT9G
	 LO7EgQJiZcHwwYVh4DCjxTcMZ+tqxSVapjXaPc7b5hPiwjEX4VkCK97zQZaYp73t/Z
	 tPiMy5yoJp4rpdLUxmFWfwpualX/lxqznaUpeG7zx71u3mZE32PxtDCWgqQbHBDw36
	 XaNwctZduV9JQ==
Date: Fri, 22 Mar 2024 17:40:08 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, amergnat@baylibre.com,
	moudy.ho@mediatek.com, hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com, u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 3/4] dt-bindings: media: mediatek: mdp3: Add support for
 MT8188 RDMA
Message-ID: <20240322-elderly-ether-170408423883@spud>
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
 <20240322092845.381313-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TYbo2CO3aIfqwZwQ"
Content-Disposition: inline
In-Reply-To: <20240322092845.381313-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_104017_795427_24927CD3 
X-CRM114-Status: GOOD (  13.33  )
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


--TYbo2CO3aIfqwZwQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 10:28:44AM +0100, AngeloGioacchino Del Regno wrote:
> Add a compatible for MediaTek MT8188 RDMA, which supports only a
> subset of the MDP3 components of its similar MT8195 counterpart.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.y=
aml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 59db8306485b..18603f6c5e06 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -23,6 +23,7 @@ properties:
>      oneOf:
>        - enum:
>            - mediatek,mt8183-mdp3-rdma
> +          - mediatek,mt8188-mdp3-rdma
>            - mediatek,mt8195-mdp3-rdma
>            - mediatek,mt8195-vdo1-rdma
>        - items:
> --=20
> 2.44.0
>=20

--TYbo2CO3aIfqwZwQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZf3CeAAKCRB4tDGHoIJi
0l3AAQCL5XSgotDR4l9Rji+b5MSgqPkrXB/7xT15infA4yxeLgD/dJ3reW+ywpxg
TVn9ErbQIAsrdGYLZO/BdFSmBaP5pgE=
=sIb/
-----END PGP SIGNATURE-----

--TYbo2CO3aIfqwZwQ--

