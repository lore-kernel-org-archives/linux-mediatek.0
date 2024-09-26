Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C3ACDE017
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 16:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEKYNd3CXICpyfA4/XIajiE/KS4P9PxhXheCx96+Fjc=; b=0GyqKU75zKX5YgK12BPO2uvFEy
	UiENOp1xcDAmM2rzeLSCRvj8F4ZgcW+aZOxKr+tSeTsBW5q8gTlpXWxI37FBgV5BW9sLYpIY5zwic
	eviHoVtWGME+9te/fU/cfqxEgt+vgsBphqJj/etIRL0oSsqZXR3cc75yB1Lb4cYeWNE+W2d4TGXoG
	R9fqCqfCq05+Z8dg7HyuCPFZKq3Ng/WeL1TJL+LZA+TWf+sPOytjcMQF6J7fWa3wX6wdSB8zCw1qF
	RimF4MrCG8GaQ5bZqUYIpK/6aQ5Z6cmXXPYZvomqKKhWzS4B4944flCvgbEuscdQS1nW03KwzV906
	7bm5xkag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqvU-00000008pIY-1AR3;
	Thu, 26 Sep 2024 16:01:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stquD-00000008p7p-1LFK;
	Thu, 26 Sep 2024 15:59:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3288E5C04AC;
	Thu, 26 Sep 2024 15:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2596DC4CEC5;
	Thu, 26 Sep 2024 15:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727366387;
	bh=5WPiZotTJNjDA/yWMHXdhILtKuuGmQdF3mrjZNA821k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEauHDz/vBRh7M8Li+EvWJ4ck1kr2Is+EqOj9sPiez6/KYucxWXoVT1x40jwiRhef
	 SkdDhc63WWETfh82y06j5gywdfdpE/K9C3RqdiqfFy2XNhHdvLIL5UIK0v31NpxkgD
	 63H9Amiwokhi7Jzk9BjiyrwgFxN+pLHppfNyqQYbo6SxWX4hTF/MppGveN3p6sBhYN
	 SXT87+siB6j3SV8VUh8tI6EHMfqREe4POKBt7P8DiPFH/UQscKZQ1rMtvFClXK0Y5l
	 eDjQLnMqfHLOBN4kwc/I4slu0Mp5Ry9f4NWAtugJWqYY3f9foMZph03OeDmBUGrxxD
	 y7kr8m7kRvbMQ==
Date: Thu, 26 Sep 2024 16:59:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Ben Lok <ben.lok@mediatek.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>,
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
Subject: Re: [PATCH v2 5/5] dt-bindings: display: mediatek: dpi: Add mt8195
 support in power domains
Message-ID: <20240926-visible-harmonica-a7cda103ff70@spud>
References: <20240926111449.9245-1-macpaul.lin@mediatek.com>
 <20240926111449.9245-5-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IMup/vqcFMn6Sn9a"
Content-Disposition: inline
In-Reply-To: <20240926111449.9245-5-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_085949_556183_CB5DB192 
X-CRM114-Status: GOOD (  19.35  )
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


--IMup/vqcFMn6Sn9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 07:14:49PM +0800, Macpaul Lin wrote:
> Add power domain binding to the mediatek DPI controller for MT8185.

This wording is confusing, no binding is being added here, you're just
allowing one property.

> The dpi node in mt8195.dtsi was triggering a dtbs_check error:
>   dp-intf@1c113000: power-domains: False schema does not allow [[44, 18]]

And while it is good to have the warning, it would be better to explain
here that there are actually power domains, since the dts could be wrong
here also.

Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power doma=
ins")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>=20
> Changes for v2:
>  - Because of the corresponding dts fix has been reviewed with a Reviewed=
-by: tag.
>    [1] https://lore.kernel.org/all/20240925080515.16377-1-macpaul.lin@med=
iatek.com/
>    We still need this change to fix the 2 dtbs_check errors.
>    So keeps no change here.
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 3a82aec9021c..07acc8a76bfc 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -89,6 +89,7 @@ allOf:
>                  - mediatek,mt6795-dpi
>                  - mediatek,mt8173-dpi
>                  - mediatek,mt8186-dpi
> +                - mediatek,mt8195-dp-intf
>      then:
>        properties:
>          power-domains: false
> --=20
> 2.45.2
>=20

--IMup/vqcFMn6Sn9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWE6gAKCRB4tDGHoIJi
0o8/AQDZGYmuC7hP+2xaTqwKXghh85TysD+qSjWhvV4FfeR+gQD8DbK1R1oHhLRL
a08ypff9VkE92E4iJH4I3W5M8tHjQQc=
=C4PU
-----END PGP SIGNATURE-----

--IMup/vqcFMn6Sn9a--

