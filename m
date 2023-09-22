Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11D8E6FE58
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 15:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDHzzFKyleer3IZ6q+0dhFBNCt1xPmZoqO4xXvugm5I=; b=TdkZvjeBpGqHeg7368diD57Skw
	Hde7tTcieG9Mzx/Wb9w8ei3uFGvc8rVbeI2XXP3Y2QddsFglbW2d+mBjjwtRvn5IcD6/6BRv3eRWj
	Q48xrm8RY5VLaeclMo/CpCEhYV89Tw44xpRkQvSWj+ntNf7qytZzgLD3T2LqvNkx5Ny6uYBRsDvOI
	JFvUTjgakDFYyLCpor1raLh3CbvPsqariGLraEMclpKp2NYhEYZo8GzBLAQuBP4METuUVNNuzKiYg
	lN26BQVyM+KywL/4WFhSLpFBjDqWKbMkU7wjnbOQHzHg1AepEDizRxUjRbIARN2iLuPPeRwIoLJdm
	vUbYQRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiJS-009Kf1-2T;
	Fri, 22 Sep 2023 15:43:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiJP-009KdP-00;
	Fri, 22 Sep 2023 15:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6813FB823B8;
	Fri, 22 Sep 2023 15:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D32C433CA;
	Fri, 22 Sep 2023 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695397400;
	bh=2D8Z7v2qzLl47ly62ZoxkjJCQb0vImD7WRAPF4T+c1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJJda26xUSaI7AbpBmjodCtUgBE+/4MgwsXQGUfMN2zwte4LsM3H3WOt0ofldycqn
	 22w2jIpnSjNrhdajZ/k0aaWR2KJJN5z6KUgIk7Gvk/sBk7IFa9gBlzBa8QB1jEO6+R
	 okohs077D4CbpubChXzv3XARmcP0H64paQszEWXI1q0ZjTDi2n93rRp41vkJyE4o9c
	 xJdAlhHzcFKWk+ypfN41s3bix/bqpED58IRSQOWdTvLr1ApfN/VMyiw3RcnQ7TE+sL
	 BhkoScCWTBCPa7MNyR/oIOWWlt39hUjG5s8oX8P5kgZZ1VbjleQm/WhdmXsg8vlEZN
	 Que3U44C/ryaA==
Date: Fri, 22 Sep 2023 16:43:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/16] dt-bindings: media: mediatek: mdp3: rename to
 MT8183 RDMA
Message-ID: <20230922-dividing-trousers-58395562a80e@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-5-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Y4vtjwYzjnHR6mE"
Content-Disposition: inline
In-Reply-To: <20230922072116.11009-5-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_084323_332454_95F04AA4 
X-CRM114-Status: GOOD (  17.08  )
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


--4Y4vtjwYzjnHR6mE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:21:04PM +0800, Moudy Ho wrote:
> The file was renamed to support future scalability in response to
> the changes in general properties separation.
>=20
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Same with this, not all too sure why this is a commit of its own.

> ---
>  .../{mediatek,mdp3-rdma.yaml =3D> mediatek,mdp3-rdma-8183.yaml}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/media/{mediatek,mdp3-rdma.yaml =
=3D> mediatek,mdp3-rdma-8183.yaml} (96%)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.y=
aml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8183.yaml
> similarity index 96%
> rename from Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.ya=
ml
> rename to Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8183=
=2Eyaml
> index 0539badc9821..74a1eebf668d 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8183.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma-8183.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: MediaTek MT8183 Read Direct Memory Access
> --=20
> 2.18.0
>=20

--4Y4vtjwYzjnHR6mE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ22EgAKCRB4tDGHoIJi
0hezAP9q+TcUrIoWLs39/7VTOK8gnCa34WnmBN2JLB3/wXifJwD9FRCsU+pP21m0
v50WOhjJOqVPaEeX/UEApSfWeT7RSAY=
=LIPX
-----END PGP SIGNATURE-----

--4Y4vtjwYzjnHR6mE--

