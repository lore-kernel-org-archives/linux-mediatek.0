Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0371BCF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Osd0TWMsYKPBYDrkk4ABhDv0z7XF0nNpSIaigYioVJE=; b=TgYf1JE0/JelREcSxdI2K17xY3
	aXnIRwYGu5m9DCl0+ziUXRe6QVreX3kOF6O2lzZHfGfXR0WF0GQXLOrIaweJ1nT9WWDThKiKoXX4w
	v7T47LzQZx2zmE8SCgO5ceTmSNaswRL+bLJ0XyeGP5HhZkExk4I0XNksPf97YdJyNldwFQII0BnYO
	sjZKQsC2DYmJh8pggPeiCi+oU6m6jSbrBq0sATxUCcv7vC3BF7YR+bQWakgrTIAYC8mKEyW+c3avR
	qNtSoid6E+TzJ2br4f5n98FVcTmR6Ydfm7Pta0KfdM/QW+wDpjyWjB9qkR6l/kbYUQjr9oGNoLQpi
	RtWzTDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st81N-00000002jVX-3iWc;
	Tue, 24 Sep 2024 16:04:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st80E-00000002jMM-0Qtw;
	Tue, 24 Sep 2024 16:03:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45A4E5C5821;
	Tue, 24 Sep 2024 16:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8BFC4CEC4;
	Tue, 24 Sep 2024 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727193780;
	bh=gNBST40WMUJwlZASY6q+rRAwgxHXwJRFWLXq+ARmaaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAqVdc6A0KBeMrsaRZ8EFB352zM4hbWTUfu7glhXJLZNlIOlSI4F1w+ysHKilo3Su
	 bN8S7HbO1pzZL3ScTi4wdq7HmDp4fM2HSUthPyqxrYspktSaYAdACu6Qy3FgP23t6b
	 UvwL81EYw7a/iTTHVq1gOGeUWOagk02BLiDEDVEqQIZOSfDGMjQU3Uan1EdPchwWuC
	 tQRyHHAu8jm7dExE60yfxEORrzap1lUje9jCK9+Z5Nd1wG6lACrn8W39EOI1yAw+af
	 4u7VMvsHxRqUY1KJZ6SJbSNgH6itI1Ohf0UJI8ObRPJvrKy+QJP2LfhLQXhdruwOnp
	 6C4oW7nkxlJlA==
Date: Tue, 24 Sep 2024 17:02:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 2/6] dt-bindings: iommu: mediatek: Fix interrupt count
 constraint for new SoCs
Message-ID: <20240924-haiku-drudge-79e5824d4b6f@spud>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jUN0h7erQf3dJLyh"
Content-Disposition: inline
In-Reply-To: <20240924103156.13119-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_090302_298602_0FFFDBFC 
X-CRM114-Status: GOOD (  18.86  )
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


--jUN0h7erQf3dJLyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 06:31:52PM +0800, Macpaul Lin wrote:
> The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'interrupts' property. The error message was:
>=20
>   infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0],
>                      [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]]
>                      is too long
>=20
> To address this issue, add "minItems: 1" and "maxItems: 5" constraints to
> the 'interrupts' property in the DT binding schema. This change allows for
> flexibility in the number of interrupts for new SoCs
>=20
> Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT s=
chema")
>=20

This space should be removed.

> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml =
b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index ea6b0f5f24de..a00f1f0045b1 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -96,7 +96,8 @@ properties:
>      maxItems: 1
> =20
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5

You need to add an items list here, and probably some per compatible
constraints. What are each of the itnerrupts for?

> =20
>    clocks:
>      items:
> --=20
> 2.45.2
>=20

--jUN0h7erQf3dJLyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvLirAAKCRB4tDGHoIJi
0qsPAP99nNo/hdDREunSkJ59dRVvVSRDmf4UoBpnLL9JFTwMHgD/SjkR4sBd/XO9
MrEk/KC97quNhDCBzV3CTBvOk8laPww=
=PT+k
-----END PGP SIGNATURE-----

--jUN0h7erQf3dJLyh--

