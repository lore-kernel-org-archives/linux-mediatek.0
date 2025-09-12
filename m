Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDA4CAC593
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 06:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL3G9l8dJKFk0Pfh+l6RJLP+nvdD0vyJNVma1p5ZTp4=; b=vq8HyjVw3e626MTRwSfJndztAz
	X9OVSFoIde+QTUqLrhgQsCaTNSvK/OA7OrgvIBhddDeLo8qtZUIz4crKcHDIVbw06uDSNK6QKSzDM
	X4iy1N1po///2gxtPZ7oQklHol7Vs3KhvMRjQWytP4TrxCzRwX/YXey2rBTgr1MVzdH0JXYWbCrBV
	Dli0Im6AAz+/dP92AFUZPI/CMKC/EBr+d7YGdHBr6EDP9vEZRxrkRuIeuIQJMLzCugUGFKC4XjG1n
	sU4V3iLcVqEweJ0G1pXDjyYUDrcma1J7qFc828Ly5xP0pR3oH5SZ9MIF16ib7hxz7K6xJlv+Bp/Mm
	IA+hE2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwvl-00000007IlJ-27Q3;
	Fri, 12 Sep 2025 06:06:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwvj-00000007Iks-3xPi;
	Fri, 12 Sep 2025 06:06:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9573601AE;
	Fri, 12 Sep 2025 06:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2BBC4CEF4;
	Fri, 12 Sep 2025 06:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757657202;
	bh=nF4lItlwYcOfTnssRbtSp09OmwNC56e9ezNLiwIkcKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJFK7rGzhfob+IekXtskHBj9H3/tlwfA5r6OsrA5/XqgADcxCkFG+wxRo3MQJ6Hj+
	 e/nziZ9YO9zrEXEVmQwbi4lLgZH+TF9EK7O+x4jucMkwIMQWkaCZ8HpJy4f2jGu+dx
	 GS7rYRGpg1nUATgMZlpUSlxYRolA2Gy41lBuh64hjod/AW9zpbR5J+RHwbCpLg3UOi
	 6osILbswgGibrPTlCzKfqtVQlaQkt2/YHx8TWlkhdpizWmi89w9OMb3VSD4DxrVVZK
	 ptWCx0Yw3lHjI8ztpwlRCRfDvNiunmUZCKtdQrmz0KV+KNxpim8XEq3dgfzQ8jSwrM
	 1klI6eVNRA0gA==
Date: Fri, 12 Sep 2025 08:06:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, heiko@sntech.de, 
	houlong.wei@mediatek.com, jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, 
	kuba@kernel.org, lgirdwood@gmail.com, linus.walleij@linaro.org, 
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, maarten.lankhorst@linux.intel.com, 
	marcel@holtmann.org, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
Message-ID: <20250912-alluring-turaco-of-conversion-dca193@kuoka>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-2-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-2-ariel.dalessandro@collabora.com>
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

On Thu, Sep 11, 2025 at 12:09:50PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
> Path to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
>  .../bindings/media/mediatek-mdp.txt           |  95 ----------
>  2 files changed, 169 insertions(+), 95 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> new file mode 100644
> index 0000000000000..8ca33a733c478
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8173 Media Data Path
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +description:
> +  Media Data Path is used for scaling and color space conversion.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8173-mdp-rdma
> +          - mediatek,mt8173-mdp-rsz
> +          - mediatek,mt8173-mdp-wdma
> +          - mediatek,mt8173-mdp-wrot

Why there is no mediatek,mt8173-mdp here? What does this compatible
represent?

> +      - items:
> +          - const: mediatek,mt8173-mdp-rdma

Still suspicious. Device cannot be simulatanously: compatible and not
compatible. This is not a well known cat that has superposition of two
states, whenenver you look the other way.

Maybe the old binding was incorrect, maybe the in-tree DTS is incorrect.
Whichever the reason, this must be investigated and documented, because
by standard rules this is wrong. Each wrong code needs very clear
explanations (and "someone did it" is not a good enough explanation).

> +          - const: mediatek,mt8173-mdp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  mediatek,vpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to Mediatek Video Processor Unit for HW Codec encode/decode and
> +      image processing.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp-rdma
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +            - description: Mutex clock
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8173-mdp-rdma
> +              - mediatek,mt8173-mdp-wdma
> +              - mediatek,mt8173-mdp-wrot
> +    then:
> +      required:
> +        - iommus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp
> +    then:
> +      required:
> +        - mediatek,vpu
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        mdp_rdma0: rdma@14001000 {
> +            compatible = "mediatek,mt8173-mdp-rdma",
> +                         "mediatek,mt8173-mdp";
> +            reg = <0 0x14001000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +                     <&mmsys CLK_MM_MUTEX_32K>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> +            mediatek,vpu = <&vpu>;
> +        };
> +
> +        mdp_rdma1: rdma@14002000 {
> +            compatible = "mediatek,mt8173-mdp-rdma";
> +            reg = <0 0x14002000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RDMA1>,
> +                     <&mmsys CLK_MM_MUTEX_32K>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_RDMA1>;
> +        };

My previous comment applies.

Keep one or two examples.

Best regards,
Krzysztof


