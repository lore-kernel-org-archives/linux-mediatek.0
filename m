Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A82C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 21:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmeJVrEJOjzTJixKXt3JyIusK0h5xUR00VNwUCvfUhM=; b=kohK2pplHOrGNJedmweK7UxCEU
	b1AamgICTFV2F7wqTGBs866sSNfXFWhg1DpXGEphh8J1n/9vP2ViU+EDWy3bj68+U5Oaf0BmlwQtY
	uiAQI9or25HvirMWq+PjTfs1gkOTsvF9bm7GwH2U0heZJla9WNcfrdId6m906rz2hmFS5MPWfuRxF
	YHdQyBT28hXh99LE+jKZLCEGCJbdxv52UzTwoMdWGwHBp3sTJWF1w3QnbnivGtqQ/lq+9H2B5yZn+
	R09qYsrhTuQPCKwIxE4vkvSQV3bsraifYy3/YS7bf8Ix+qXJegnPzuMpmi9rtaWKY8v+gtnauAV58
	Gj24QvkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3kZy-00BN7R-5I; Fri, 09 Dec 2022 21:06:46 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3kZn-00BN0a-OT; Fri, 09 Dec 2022 21:06:37 +0000
Received: by mail-ot1-f47.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so3560111otb.1;
        Fri, 09 Dec 2022 13:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmeJVrEJOjzTJixKXt3JyIusK0h5xUR00VNwUCvfUhM=;
        b=0ldXzp30Uedhtfz10wI4ivMfFsAzIy0bghjxIwtCM0TPqd9Alk6UljS9FP4Crp5hDr
         33nG41I6ZZF0bx5IrrkPTuhjV5821huqYoEpPqIKFgEI7YqapsjerthNtx1Singv6JFl
         mMbD1h+jAjLrPzbbWy9eC2WaB5XOYgKgqEb8DsmJZQhIQ/wErRUyHAruWQ9PB4E6oC1d
         5YO+gxae/LIpSgUX1Tghn7qGnoE70JE1WrPkcbHdF9MlN9KQY/H6jHresd0GttVvvnKn
         BI2uD42W9i2JFbOqcGWw+et9Ly3TYcuSVTCpqlyU/AcC0sYQ346wME53Tk4mXcJZ2GGf
         WdkA==
X-Gm-Message-State: ANoB5pktGDn4+rpQdEnrQ8hvXU+YYs1Co/SBYg5b8B0q3rairBJTu/ry
	bNAEvfAwOqi26BreBOVM6w==
X-Google-Smtp-Source: AA0mqf5Ut9mbB94upyJcs+ECN8fe9gRzFe+x8ECeZ4iIL60Pmjvjjlfpjl6w5CtAWja/OCpHFulnKQ==
X-Received: by 2002:a05:6830:6287:b0:661:e43e:aa28 with SMTP id ce7-20020a056830628700b00661e43eaa28mr4674464otb.10.1670619992715;
        Fri, 09 Dec 2022 13:06:32 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a26-20020a9d725a000000b00661b019accbsm1013724otk.3.2022.12.09.13.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 13:06:32 -0800 (PST)
Received: (nullmailer pid 3847139 invoked by uid 1000);
	Fri, 09 Dec 2022 21:06:31 -0000
Date: Fri, 9 Dec 2022 15:06:31 -0600
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 01/12] dt-binding: mediatek: add bindings for MediaTek
 8195 MDP3 components
Message-ID: <20221209210631.GA3840519-robh@kernel.org>
References: <20221207084412.14075-1-moudy.ho@mediatek.com>
 <20221207084412.14075-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207084412.14075-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_130635_818074_804AA316 
X-CRM114-Status: GOOD (  20.35  )
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

On Wed, Dec 07, 2022 at 04:44:01PM +0800, Moudy Ho wrote:
> This patch adds support for MT8195 MDP3 RDMA, and introduce more
> MDP3 components present in MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-aal.yaml     | 64 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-color.yaml   | 64 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-fg.yaml      | 64 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-hdr.yaml     | 63 +++++++++++++++
>  .../bindings/media/mediatek,mdp3-merge.yaml   | 64 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-ovl.yaml     | 64 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-pad.yaml     | 64 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rdma.yaml    |  5 +-
>  .../bindings/media/mediatek,mdp3-split.yaml   | 76 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-stitch.yaml  | 64 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-tcc.yaml     | 63 +++++++++++++++
>  .../bindings/media/mediatek,mdp3-tdshp.yaml   | 64 ++++++++++++++++
>  12 files changed, 717 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
> new file mode 100644
> index 000000000000..5b59e0802357
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-aal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 AAL Device Tree Bindings

Drop ' Device Tree Bindings' from titles.

> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description: |

Don't need '|'

> +  One of Media Data Path 3 (MDP3) components is responsible for backlight
> +  power saving and sunlight visibility improving.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-aal
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
> +    description: The register of client driver can be configured by gce with
> +      4 arguments defined in this property. Each GCE subsys id is mapping to
> +      a client defined in the header include/dt-bindings/gce/<chip>-gce.h.

How many 4 cell entries? This allows any number. If 1, then you need 
'maxItems: 1' with the outer 'items'.

> +
> +  clocks:
> +    minItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    mdp3-aal0@14005000 {
> +      compatible = "mediatek,mt8195-mdp3-aal";
> +      reg = <0x14005000 0x1000>;
> +      mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x5000 0x1000>;
> +      clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
> +      power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;

Indent by 4 spaces here.

> +    };

Same comments for the rest...


