Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDE8CDE01B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 16:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMdQnIYDl8LTNOkGzlcmiTX6zEr8xkw9E2N29ljCJwQ=; b=IOcc2ndnk8Vti0YGO1r4d5Dm1c
	gDEx3I4b6y0WxIKHlrTeZsFlnOT21qkCFBAOxC9Vhsu9DtbxqLJROiwhykA2hU8xqFPZjE+kbpacM
	1XLL+cmKuCzgTI+AcoFibiosoQCCC6f4y0JpTzr2cTqby0U7uXthkQKbNiIQRMUd0qMSiZFThEYtm
	YhfCNWnwU+R7+TEgoOz5GAkwKHSHZlbwazqIeJuIXHgiUMDMWK8Ol+wy1xMhATQewVUyRr3Zx1DdG
	n6o6KM8kJSO85EshxH+O3XhYwtZypO3uDc5GMl/cdVlR3tyUAV9yecqatlCh8jUmyQZW6uiM7Gz+B
	XrqzBx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqyR-00000008pfr-0y50;
	Thu, 26 Sep 2024 16:04:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stqxE-00000008pUj-2VtQ;
	Thu, 26 Sep 2024 16:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F10F0A40ACD;
	Thu, 26 Sep 2024 16:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1329CC4CEC5;
	Thu, 26 Sep 2024 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727366574;
	bh=cFX2iwcGY8smAIVYvPnkwYiVZqSHddjY3KSuwun+Y+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aThwMZ7ntlmNOCFu3DQ+T0K1QIlQab3w4DPhMzpJ1JdhseWgub0g0zEDmBGlErwJF
	 FWlVM8N89QkWz50P6pyfNalJO2ApU+QWedSNWKHfYIK3iGIKtBfz/Xu8SMYc+GWUSj
	 ezHcu3fciWPAamHaBDhctOLJw/ptBPTRu5yRcZ7eO0BeOCgURf9/g/zLYXOWWjWUWr
	 dQ+BN13pq7yRb37TwZgPTZPCyDLZhjKil9GV7rmQr6FYzo+HN5C031Npy3CelQtxJQ
	 EACzmJPZi5U3t06UDrfbWPpjRvC8qFr6kpXq5KvL9CpUyRfWnlqPNfo/T19vXIlDEi
	 HpunNQgRx7pdA==
Date: Thu, 26 Sep 2024 17:02:45 +0100
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
Subject: Re: [PATCH v2 2/5] dt-bindings: iommu: mediatek: Fix interrupt count
 constraint for new SoCs
Message-ID: <20240926-unbounded-gosling-6b4303106f27@spud>
References: <20240926111449.9245-1-macpaul.lin@mediatek.com>
 <20240926111449.9245-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZBg8ybapNV2iZUhq"
Content-Disposition: inline
In-Reply-To: <20240926111449.9245-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_090256_790918_818DABEB 
X-CRM114-Status: GOOD (  21.19  )
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


--ZBg8ybapNV2iZUhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 07:14:46PM +0800, Macpaul Lin wrote:
> The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'interrupts' property. The error message was:
>=20
>   infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0],
>                      [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]]
>                      is too long
>=20
> To address this issue, add "minItems: 1" and "maxItems: 5" constraints to
> the 'interrupts' property in the DT binding schema. This change allows for
> flexibility in the number of interrupts for new SoCs.
> The purpose of these 5 interrupts is also added.
>=20
> Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT s=
chema")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> Changes for v2:
>  - commit message: re-formatting and add a description of adding 5 interr=
upts.
>  - add 'description' and 'maxItems: 5' for 'interrupt' property of
>    'mt8195-iommu-infra'
>  - others keeps 'maxItems: 1'
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml =
b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index ea6b0f5f24de..fdd2996d2a31 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -96,7 +96,8 @@ properties:
>      maxItems: 1
> =20
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5
> =20
>    clocks:
>      items:
> @@ -210,6 +211,28 @@ allOf:
>        required:
>          - mediatek,larbs
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-iommu-infra
> +
> +    then:
> +      properties:
> +        interrupts:
> +          description: |
> +            The IOMMU of MT8195 has 5 banks: 0/1/2/3/4.
> +            Each bank has a set of APB registers corresponding to the
> +            normal world, protected world 1/2/3, and secure world, respe=
ctively.
> +            Therefore, 5 interrupt numbers are needed.

> +          maxItems: 5

You repeat here the constraint from the original definition. Should this
be minitems: 5?

> +
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.45.2
>=20

--ZBg8ybapNV2iZUhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWFpQAKCRB4tDGHoIJi
0ibCAPsHAeniGCRX+/+yKW9HldPNK9p8nlwfyNOBwMEhVkN6jQEAgjDWVAroTKmU
yK1gwHOVL51DUKPX8wUsyKexjwYaGwU=
=HLVk
-----END PGP SIGNATURE-----

--ZBg8ybapNV2iZUhq--

