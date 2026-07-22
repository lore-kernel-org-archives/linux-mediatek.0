Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B45C4453C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 16:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FhwspSsIo41xwcPLmC+dyiiLCiUUuaWQEh6t7ru9uk=; b=P+jtcIvEvwXarsp+sL1Z8JE4oY
	HvG6bM9uteV3kv5Z4D3OXqfBoKsrunsXpSnQEjupR9NSKitk6+MXnXMc/3zhWt92SQdSWiODB+TTP
	qMgSsUQYAMtlKWWxwVLELgkYX1XDyNURz3z2JoTV+TSSjffjT8CtF1Eo0Mb1V+Lc2bY1Y7tKzOIc9
	lblU41IiMiD04B/FHBuxoExItngzvBLCIHPgh171VbwjmvMuSklfJnnkKZX3bY0qzii8pR976dgsB
	pGwBkBB1mXXAnD2fVM37CYGlO38KuKmzAb3MdZd4pXjP+/pu2PU/Lsve38jgQUCbhmJDZENMhWeYJ
	hSMM7ZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wma1O-0000000CNPy-0AQ1;
	Wed, 22 Jul 2026 16:42:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wma1M-0000000CNPX-2c8x;
	Wed, 22 Jul 2026 16:42:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43A0641664;
	Wed, 22 Jul 2026 16:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24611F00A3A;
	Wed, 22 Jul 2026 16:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738532;
	bh=+FhwspSsIo41xwcPLmC+dyiiLCiUUuaWQEh6t7ru9uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=faYKN4WMeaW3u8R+K0FNqrlYG74xfnPBt5Hjvn29tszXyM1h4abxhZYq5klf9EB2C
	 6Y8T/Y0b8rMJ3QdO2FQ4M6qOaQjXgGf59vA10nCHkEPRZ5Z947tPOW8ROluPW4KFLg
	 YhzgBR7t4Nces/bDK+hM1LIWwe7O55QzCtWZE/J0Sx0P0zF6FRJUX6jHbomhit85PC
	 CjtG2Rb3cffCJTt3as2g36MiFn6+DnwtbF3tb7xIQaIczYWJGTSBYmYhXgAW92IhRZ
	 VKE6rG299/L753DHfepHuINHL9SFY+SSmC3GFUPVUvYH3K7LygIXC9H25Svx/5s8Sm
	 52nHtydab+0JQ==
Date: Wed, 22 Jul 2026 11:42:10 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH v2 30/46] dt-bindings: display: mediatek: Introduce
 MT8196 Layer Blender
Message-ID: <20260722164210.GA1075204-robh@kernel.org>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-31-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714114414.184512-31-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 14, 2026 at 01:43:58PM +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Overlay Layer Blender IP found in the
> newer generation SoCs like MT8196, MT8894, MT6991, and their
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-blender.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml
> new file mode 100644
> index 000000000000..402eccb5fd70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-blender.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Overlay Layer Blender
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek Display Overlay Layer Blender hardware is responsible
> +  for performing the alpha blending operation for overlapping layers
> +  from various sources.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-disp-blender
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port

You must have descriptions of what each port is.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port


