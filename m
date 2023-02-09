Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB83C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCHbKK7aK3USBAo3gabRZIaR4yTklPH9pwvPUQckT04=; b=ZcsyDEVWUomFhNgG5VysZYbB+9
	EdQJ/I6oG9g7UPs6OtUWnEKMPbh+bYikAfztw5zp9GuHntT5Zltg3wiXs6YQyFRDUVQM+2QK8I2aH
	rc9fc617wxfTdrwFkTPHgM7ybxxSOiAkPfRBs6MK96TnMWRk+83RavNE4FzW6dALSDUY5ku/evsi6
	Ys+lXpI+zxGIWvi7ndurLKtENSM3wJUt8cDEj+c/cww7UObOZBB3ksWHgYngxP9rGFTDu4YUFtaaJ
	o+ppRYmoXXXZCMD9NM1Ez7OFJ0iSSayIW9lVhENvgSXChZuBuwsQPRctMiSjxdlXRLzl7qsymnQMJ
	ERxHWyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBFO-002gHf-Qh; Thu, 09 Feb 2023 18:02:14 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBEf-002frU-DC; Thu, 09 Feb 2023 18:01:31 +0000
Received: by mail-ot1-f42.google.com with SMTP id n25-20020a9d7119000000b0068bd8c1e836so784889otj.3;
        Thu, 09 Feb 2023 10:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCHbKK7aK3USBAo3gabRZIaR4yTklPH9pwvPUQckT04=;
        b=Br+klUgnZpNLjUsh7ZP04OUvhFHdNmGQL9f6qPcut5Sz/Mx2MPw0xXkUlLu8+4azvj
         RhCJfV8xyejeVyGHS6cu5p3P453q47hIreHwhkI4jOxPEX/oGbqnTbfdXMHa1H9T8BXk
         CklWMaHIroLJs3aSo1e6U+83B+0JPPJzGUkshrTDgR9N8/aaUDzsILNLuMzz8vXwYkSm
         YDHK33Rgg9qeXRNj301jAYKhheR8hG2CqGOZ1f4v2qm82sKCuYj3RVa1XIme/qNBbmJL
         TwripLSNnm4VpXP7VSfX98+U/vqTcqMPsWLPaZLcJaxvrXcVAFUwbanPwzHZSS5/w8Eo
         CCIA==
X-Gm-Message-State: AO0yUKX+HCBSwKzl8W0kNweMV1E4JhnnamWRv/XCl4BXf6bNDgzkha1Z
	xvkW7B2/Ekt7S1hFbzZTMA==
X-Google-Smtp-Source: AK7set/5ZR9OKv2z9uS3wgYrDsxQa7igQtzjUW9+VNf+t5Amf315wc8kBiWF6vYIzYzyfvUjblk2kA==
X-Received: by 2002:a9d:6741:0:b0:68b:c04d:79ca with SMTP id w1-20020a9d6741000000b0068bc04d79camr6312281otm.33.1675965686735;
        Thu, 09 Feb 2023 10:01:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r13-20020a05683001cd00b0068be61a7ac6sm970781ota.56.2023.02.09.10.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:01:26 -0800 (PST)
Received: (nullmailer pid 572794 invoked by uid 1000);
	Thu, 09 Feb 2023 18:01:25 -0000
Date: Thu, 9 Feb 2023 12:01:25 -0600
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 03/16] dt-binding: mediatek: add MediaTek mt8195 MDP3
 components
Message-ID: <20230209180125.GA557423-robh@kernel.org>
References: <20230208092209.19472-1-moudy.ho@mediatek.com>
 <20230208092209.19472-4-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208092209.19472-4-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_100129_489256_CB7C6A5F 
X-CRM114-Status: GOOD (  24.32  )
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

On Wed, Feb 08, 2023 at 05:21:56PM +0800, Moudy Ho wrote:
> Adds support for MT8195 MDP3 RDMA, and introduce more MDP3 components
> present in MT8195.

I'm sure I asked this before, but how are these blocks different from 
what we already have in bindings/display/mediatek/. It's all the same 
block names. If they are the same/similar h/w, then it should be 1 
binding even if you have different consumers in the kernel.

If my questions aren't answered in the patches, then I'll just keep 
asking because I won't remember...

> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    |  30 +--
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |   5 +-
>  .../bindings/media/mediatek,mt8195-mdp3.yaml  | 174 ++++++++++++++++++
>  3 files changed, 197 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-mdp3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 46730687c662..abc3284b21d0 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -20,8 +20,9 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - const: mediatek,mt8183-mdp3-rdma
> +    enum:
> +      - mediatek,mt8183-mdp3-rdma
> +      - mediatek,mt8195-mdp3-rdma
>  
>    reg:
>      maxItems: 1
> @@ -46,20 +47,28 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>  
>    power-domains:
> -    maxItems: 1
> +    oneOf:
> +      - items:
> +          - description: for RDMA
> +      - items:
> +          - description: for vppsys 0
> +          - description: for vppsys 1
>  
>    clocks:
> -    items:
> -      - description: RDMA clock
> -      - description: RSZ clock
> +    minItems: 2
> +    maxItems: 19
>  
>    iommus:
> -    maxItems: 1
> +    oneOf:
> +      - items:
> +          - description: RDMA port
> +      - items:
> +          - description: RDMA port
> +          - description: RDMA to WROT DL port
>  
>    mboxes:
> -    items:
> -      - description: used for 1st data pipe from RDMA
> -      - description: used for 2nd data pipe from RDMA
> +    minItems: 1
> +    maxItems: 5
>  
>    '#dma-cells':
>      const: 1
> @@ -72,7 +81,6 @@ required:
>    - power-domains
>    - clocks
>    - iommus
> -  - mboxes
>    - '#dma-cells'
>  
>  additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> index 78f9de6192ef..4bc5ac112d2a 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> @@ -43,12 +43,15 @@ properties:
>  
>    clocks:
>      minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
>  
>  required:
>    - compatible
>    - reg
>    - mediatek,gce-client-reg
> -  - mediatek,gce-events
>    - clocks
>  
>  additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-mdp3.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-mdp3.yaml
> new file mode 100644
> index 000000000000..d2b01456c495
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-mdp3.yaml
> @@ -0,0 +1,174 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8195-mdp3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 display components
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  A group of display pipeline components for image quality adjustment,
> +  color format conversion and data flow control, and the abbreviations
> +  are explained below.
> +  AAL    - Ambient-light Adaptive Luma.
> +  Color  - Enhance or reduce color in Y/S/H channel.
> +  FG     - Fime Grain for AV1 spec.
> +  HDR    - Perform HDR to SDR.
> +  MERGE  - Used to merge two slice-per-line into one side-by-side.
> +  OVL    - Perform alpha blending.
> +  PAD    - Predefined alpha or color value insertion.
> +  SPLIT  - Split a HDMI stream into two ouptut.
> +  STITCH - Combine multiple video frame with overlapping fields of view.
> +  TCC    - HDR gamma curve conversion support.
> +  TDSHP  - Sharpness and contrast improvement.

Each block likely needs its own schema.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-aal
> +      - mediatek,mt8195-mdp3-color
> +      - mediatek,mt8195-mdp3-fg
> +      - mediatek,mt8195-mdp3-hdr
> +      - mediatek,mt8195-mdp3-merge
> +      - mediatek,mt8195-mdp3-ovl
> +      - mediatek,mt8195-mdp3-pad
> +      - mediatek,mt8195-mdp3-split
> +      - mediatek,mt8195-mdp3-stitch
> +      - mediatek,mt8195-mdp3-tcc
> +      - mediatek,mt8195-mdp3-tdshp
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size

Given these match up to reg values, I'm really wondering why we have 
this.

> +    description:
> +      Each GCE subsys id is mapping to a base address of display function blocks
> +      register which is defined in <include/dt-bindings/gce/mt8195-gce.h>.
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 7

You have to define what each clock is which probably depends on each 
block.

Rob

