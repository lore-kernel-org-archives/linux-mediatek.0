Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD4FCE7A9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ktPmLhNhLEfNJrEHYP8HMWO1VFqz+A1N7LM/ojmMkE=; b=1zzsu0ldAmPvwP/oyj9xiSWa67
	jlwn6kPCtcfhYh672GkFr9u1vAVvyKmKFnQQ2uNhI1pRAOBelebeeTu8o1dHfbPenq7N60i3E5Y4g
	z128N2lKOk625Du4vmAhkzn47lCaabISMUsAEchkiof9CrZ6vkHjqJXmdddF17oE3VcBqI3oItdVN
	6EE4BkFsFBnWXI3bfi9+fT3EwZ46mhJ5/MCokg/QDbvXReOecw6coaZv1cdocG1EFD4X5VbQKb3ea
	/EV97r4MAoSIU5YK8IHpeclDf7P0yj9vhjVfDiT5cYi+3civMd0uset0QRpuGQWX0SdJ93ZT4lFHo
	c2gzK3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qko9q-00EcZG-38;
	Mon, 25 Sep 2023 16:10:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qko9m-00EcX0-2S;
	Mon, 25 Sep 2023 16:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 66F88B80D8F;
	Mon, 25 Sep 2023 16:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB61DC433C8;
	Mon, 25 Sep 2023 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695658196;
	bh=gcYDTYUu2Rp4Bf6iNJVLLlvth+kTKaTp+V7uWoNTvk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hu2v/FnFlxjU8frwOTv6HaE3GhqkL+iRiOrNGXeHONKhx+WqEGulB3iqEsO3IGGEy
	 hgAxAAIBiVgi0fbqtFZJzQoffRDSYG8edHwQHI7nB+R1IdsW+9XyPHFjVb4u2EZiLY
	 JBVpmpogNZg4gAdhy3ntRNlS1U9mG7GoKkWczxIV84y7xqI4WCiRcIQHYtqNhgXRBP
	 704vKdl227PqSW7OAhjhl/wWj4vywJ+yrbw/EzARX1CuDXNFdDm7eSGy1cgYCAjguf
	 aJnuvJGV82DqnjfRPknQoBcOHD90E7VyUwr1ytV1fLcLZgm21GlTTlXPGjygHgL2WS
	 llt0nJ8BZyO4Q==
Received: (nullmailer pid 1450584 invoked by uid 1000);
	Mon, 25 Sep 2023 16:09:53 -0000
Date: Mon, 25 Sep 2023 11:09:53 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 09/16] dt-bindings: media: mediatek: mdp3: add
 component STITCH for MT8195
Message-ID: <20230925160953.GA1449445-robh@kernel.org>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-10-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922072116.11009-10-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_090959_083198_DDD4A02B 
X-CRM114-Status: GOOD (  20.54  )
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

On Fri, Sep 22, 2023 at 03:21:09PM +0800, Moudy Ho wrote:
> Add the fundamental hardware configuration of component STITCH,

STITCH? You mean TCC?

> which is controlled by MDP3 on MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-tcc.yaml     | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> new file mode 100644
> index 000000000000..245e2134c74a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 TCC
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to support
> +  HDR gamma curve conversion HDR displays.

Please say what the block does.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-tcc
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +
> +    display@1400b000 {
> +        compatible = "mediatek,mt8195-mdp3-tcc";
> +        reg = <0x1400b000 0x1000>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xb000 0x1000>;
> +        clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
> +    };
> -- 
> 2.18.0
> 

