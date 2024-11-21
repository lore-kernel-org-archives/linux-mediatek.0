Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420BCE64012
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2024 21:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYatkiL+3etFr0iTm+sms8TGlEaUYhG+M/wnkIB/buQ=; b=TXcfbitWeJDThcIBZVNFTiG2te
	iVN3E7OUqkp936iV4JmStZ9y2tzEAXYEmdit1a8JI2nP5UocgrtJYwV5g+QEtHlFL1AsLipSzrOSv
	sMCMKWqqU4ChkybSz/aud7MvruNpcd3Cy82uUlv+ZVSnZOcR8f9tc/z4cwfwRhl0ltxUpLZlW8Qgh
	wmXU9GJ+G5kpMBQOLfBHFzYoIXAr9ilvAX+K80FZ5czlbT5CjvtDJRbLE4cI4kz5EXJKwmwCctQWW
	vrw0BrVjqLwFJHoB96oq/HHN3ypjoK6WbgfFp0PwKAYvR6yuWLEhTIYxcLde5D94T5uKSgRHhq0F8
	wfVJ37qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEEKw-00000000vxA-0xFt;
	Thu, 21 Nov 2024 21:03:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEEJy-00000000vka-3S5O;
	Thu, 21 Nov 2024 21:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E030A40EB7;
	Thu, 21 Nov 2024 21:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3C7C4CECC;
	Thu, 21 Nov 2024 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732222957;
	bh=GM3w9B7r/t0zBm+hXRgtpgZU0x9idteO2H6rmGktuaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1zAqew2MWcEEWPd9iStevglFRhfKSXOylhXAK6bkhjqwDXmpznRQJINCU4m1GPPE
	 PLdZ88moM1eAZ1roOlNBOKJrOzGmZzu0+Avl1rUuIyRh3kyevAGWE9+tYvsUKmQNsB
	 Pyr+/wtS9OBbDl/IRXMRM9/pfebUb0Nd2XDgRuaNvoYpXBGFJvfBMaMhN9tgev7uK9
	 Q0ljzrDg3kH9DIh5r4+Ep7HqFspUHrPHYN6rQq+4wotDF0YSFcIRHMH4h+VtqnkxlZ
	 dp6B1P6Q9NOqlpxIIlYxqOMhE/DA1KTvOJyADV2rRcmqq5P1+R9qTYa9vMuMwTPQ6c
	 96h2d2/jH8Lhw==
Date: Thu, 21 Nov 2024 15:02:35 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/7] dt-bindings: display: mediatek: Add binding for
 HDMIv2 DDC
Message-ID: <20241121210235.GA3798341-robh@kernel.org>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120124512.134278-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_130238_924923_740DD7C4 
X-CRM114-Status: GOOD (  15.53  )
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

On Wed, Nov 20, 2024 at 01:45:06PM +0100, AngeloGioacchino Del Regno wrote:
> Add a binding for the Display Data Channel (DDC) IP in MediaTek
> SoCs with version 2 HDMI TX IP.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> new file mode 100644
> index 000000000000..d85e8ed2ffa7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek HDMI Display Data Channel (DDC) v2
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +  - CK Hu <ck.hu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt8195-hdmi-ddc
> +      - items:
> +          - const: mediatek,mt8188-hdmi-ddc
> +          - const: mediatek,mt8195-hdmi-ddc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdmi {
> +        hdmi_ddc: i2c {
> +            compatible = "mediatek,mt8195-hdmi-ddc";
> +            clocks = <&clk26m>;

Is this really a separate block? Doesn't really look like it. You don't 
even have registers to interact with it.

> +        };
> +    };
> +...
> -- 
> 2.47.0
> 

