Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DCEE6FE52
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 15:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ag/+JKcSGOFO8NbgPEciLNX91GY+GYQTgcQkVkBfdng=; b=2MoqwJsuoaF398FYwTyabevMWI
	aQ/lU9L92YvaKHvJbFtYb/apzRBdnEU9JNTJfPJdlkKNtWywJJ3QHRs3iyprkVSmcCeuumX8v+7by
	y5qyyPlsm1bRFfWtK4GY2y7CQqKTiSxMUd9nR7pf+xYD/MlBbLzj5gHcTNHAI3jN3i7sALgmP2N7w
	hmbC23qpa/bbPYFm6qwzYigfBkDcgmaUiKGgsGk0s8r8Q+NLcoAHCfJZxWCRW7BdBUY5SuSBoXUfJ
	9G8d3bFoetvD5chyyCcm2MQ34+xibX/VmlGusxF8LaP05BqQY4Hx0F0UzGu1kpVkn4hTbYPIuzN4O
	68Z83Crg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiIf-009KVH-15;
	Fri, 22 Sep 2023 15:42:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiIZ-009KTy-2q;
	Fri, 22 Sep 2023 15:42:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1052622A9;
	Fri, 22 Sep 2023 15:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27BCC433C7;
	Fri, 22 Sep 2023 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695397350;
	bh=5BvJFP59LWR6oDRO5gYLA3PtHEwbDC1l69qhCgYKVCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NwsOSugG4TV4Em3gjHEeJTTBmwRPpa/KkLiCEpocihXimquuECxT7ntrra1bg34sv
	 Mn6IpapFxVVsN0FIQ22ZPXKmMRDLNHnSHrnB/7ktVv0g4D34g/2RNsW4vThxRipxSp
	 i7PIBY8Og6q/LRgorpaw+lTPueWenBahnUH44XEhz4d1SVmAPiQcLaCB0LvRrK23DK
	 68wqByJglzf2t++qUiqD9akiPztmS/k0n89j82VOMrSpBiX5e6Wm8r3Kq5cnhg3sVo
	 siLaiwRJxNjwS/yTy16nYT/jzinn4diKN61G9ihnFg69ZQCapWeIQF+8RQM4dIXNST
	 jvXebT3Osxqhg==
Date: Fri, 22 Sep 2023 16:42:24 +0100
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
Subject: Re: [PATCH v6 03/16] dt-bindings: media: mediatek: mdp3: include
 common properties
Message-ID: <20230922-grope-yield-46767aa32a3d@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-4-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t3id+nrX22G9XF03"
Content-Disposition: inline
In-Reply-To: <20230922072116.11009-4-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_084232_915844_A38935FD 
X-CRM114-Status: GOOD (  20.90  )
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


--t3id+nrX22G9XF03
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:21:03PM +0800, Moudy Ho wrote:
> To minimize duplication and standardize the document style,
> include the common properties for MT8183 RDMA.

Duplication that you created in the previous patch? Why not combine
patches 2 & 3?

Cheers,
Conor.

>=20
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 43 ++-----------------
>  1 file changed, 4 insertions(+), 39 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.y=
aml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 3e128733ef53..0539badc9821 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: MediaTek Read Direct Memory Access
> +title: MediaTek MT8183 Read Direct Memory Access
> =20
>  maintainers:
>    - Matthias Brugger <matthias.bgg@gmail.com>
> @@ -18,62 +18,27 @@ description: |
>    Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>    for details.
> =20
> +allOf:
> +  - $ref: mediatek,mdp3-rdma-common.yaml#
> +
>  properties:
>    compatible:
>      items:
>        - const: mediatek,mt8183-mdp3-rdma
> =20
> -  reg:
> -    maxItems: 1
> -
> -  mediatek,gce-client-reg:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    items:
> -      items:
> -        - description: phandle of GCE
> -        - description: GCE subsys id
> -        - description: register offset
> -        - description: register size
> -    description: The register of client driver can be configured by gce =
with
> -      4 arguments defined in this property. Each GCE subsys id is mappin=
g to
> -      a client defined in the header include/dt-bindings/gce/<chip>-gce.=
h.
> -
> -  mediatek,gce-events:
> -    description:
> -      The event id which is mapping to the specific hardware event signal
> -      to gce. The event id is defined in the gce header
> -      include/dt-bindings/gce/<chip>-gce.h of each chips.
> -    $ref: /schemas/types.yaml#/definitions/uint32-array
> -
> -  power-domains:
> -    maxItems: 1
> -
>    clocks:
>      items:
>        - description: RDMA clock
>        - description: RSZ clock
> =20
> -  iommus:
> -    maxItems: 1
> -
>    mboxes:
>      items:
>        - description: used for 1st data pipe from RDMA
>        - description: used for 2nd data pipe from RDMA
> =20
> -  '#dma-cells':
> -    const: 1
> -
>  required:
>    - compatible
> -  - reg
> -  - mediatek,gce-client-reg
> -  - mediatek,gce-events
> -  - power-domains
> -  - clocks
> -  - iommus
>    - mboxes
> -  - '#dma-cells'
> =20
>  additionalProperties: false
> =20
> --=20
> 2.18.0
>=20

--t3id+nrX22G9XF03
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ214AAKCRB4tDGHoIJi
0pjhAQDqYFJMcVq5Ru7Q8gVzeuDVj+gKssFalhT0d+Clke4nqQD/VPXvz8K458L1
KJs20bZWY09DDbrl5qDCY9BMQs7IQQc=
=F41u
-----END PGP SIGNATURE-----

--t3id+nrX22G9XF03--

