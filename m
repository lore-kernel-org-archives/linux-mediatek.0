Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2F3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 21:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3eYjxXNa2j4DWkwLnd3jFaOrAHZUuH/ipI3Vo/KffBM=; b=IgELnZN+Ax712f
	qpse0N9io3ShNwY70pcpitaMBlRGLBRcD2H1nPRMrVSxQUP9c5R14oTwJkK+YTDW7LvakNjDMwdbB
	BnOFyVBNukvI5XXcFFZSEP93oaf5K3FBTwWwQcUWGqA14KNfypN3kYhHas+NsdK8hgtVIr4nGqmdX
	YrMPVcv6j+KCcq77XxHWvTzoQYF0dMcM8Ju0J2pHk/0AnzxpP9idhLVp5MKTkyAF1s9xzGVsfPp5N
	0yabkuSagSZd+2bFXcBQGPs7+1lc9LPsBzHh9V2zohfoJEUC7KrrwGd/AAC9cMYt74JY4+HOngG0v
	MU9sGa8Rc5f0bsrGceoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nekPt-002ikI-Hq; Wed, 13 Apr 2022 21:20:45 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nekPq-002ijd-Jp; Wed, 13 Apr 2022 21:20:44 +0000
Received: by mail-oi1-f182.google.com with SMTP id b188so3395451oia.13;
 Wed, 13 Apr 2022 14:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BNnhzbT7x5Fwfm2D+LNQD+lbH1XqfFIidCgzY9zOuGk=;
 b=X+jfzbe0sRAQc8uYJql83u724wXES3oiOq+aPYa7fbbaYuLivY/AKA6kuolZAvf+mf
 75vTyhoNMWvlB4t9naGG6c6b55q12nmmHgBJ/C33ZYik3jP4woyXQ/XgaxID01pP90Sm
 Ks2XkSiS+M6FYus4gr45WPjDbjIt+SsR4Sz2DZORytkqTm7olPAoxoDJ670J68Y/q0Ad
 Y6pEfZubOZrqP+Su/r45cpZj6O9g9I/Z8g9Xd58bs8VhkA1Q/SGxlqXR16n9K5I2YRV7
 Jx9e0KTNBM1eLa2CJF2+nsBKpZ/eLi0KxiesurXGYe7bYfWmXcuCPY4FNkqzfhvMvuFk
 32Aw==
X-Gm-Message-State: AOAM530QYPPSEvP2Z1oitZOWvzYS+3Y13Nm5+kjvnTgsQEZ+mF/SIHa9
 MeOqgyULsjEOBvZp7mGhyg==
X-Google-Smtp-Source: ABdhPJzOAUPoYvywkyjx8QaQOVnaIDTerWLm9Yg9DWHDGQeYUOO9E66kaHrhsX05kwA+rd6RTOa7QQ==
X-Received: by 2002:a05:6808:118f:b0:2d4:13f1:8504 with SMTP id
 j15-20020a056808118f00b002d413f18504mr332417oil.90.1649884840198; 
 Wed, 13 Apr 2022 14:20:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bx16-20020a0568081b1000b002f7966564b4sm59862oib.43.2022.04.13.14.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 14:20:39 -0700 (PDT)
Received: (nullmailer pid 3947483 invoked by uid 1000);
 Wed, 13 Apr 2022 21:20:38 -0000
Date: Wed, 13 Apr 2022 16:20:38 -0500
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rex-bc.chen@mediatek.com, jitao.shi@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4,1/3] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
Message-ID: <Ylc+ph5OFzQ/YR3k@robh.at.kernel.org>
References: <1649495514-25746-1-git-send-email-xinlei.lee@mediatek.com>
 <1649495514-25746-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1649495514-25746-2-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_142042_695343_1D411BA7 
X-CRM114-Status: GOOD (  17.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Apr 09, 2022 at 05:11:52PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dsi.txt         |  62 ---------
>  .../display/mediatek/mediatek,dsi.yaml        | 118 ++++++++++++++++++
>  2 files changed, 118 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml


> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> new file mode 100644
> index 000000000000..431bb981394f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek DSI Controller Device Tree Bindings
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao Shi <jitao.shi@mediatek.com>
> +  - Xinlei Lee <xinlei.lee@mediatek.com>
> +
> +description: |
> +  The MediaTek DSI function block is a sink of the display subsystem and can
> +  drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for dual-
> +  channel output.

allOf:
  - $ref: /schemas/display/dsi-controller.yaml#

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-dsi
> +      - mediatek,mt7623-dsi
> +      - mediatek,mt8167-dsi
> +      - mediatek,mt8173-dsi
> +      - mediatek,mt8183-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Engine Clock
> +      - description: Digital Clock
> +      - description: HS Clock
> +
> +  clock-names:
> +    items:
> +      - const: engine
> +      - const: digital
> +      - const: hs
> +
> +  resets:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Output port node. This port should be connected to the input
> +      port of an attached DSI panel or DSI-to-eDP encoder chip.
> +
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - port
> +
> +additionalProperties: false

with the above,

unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/reset/mt8183-resets.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        dsi0: dsi@14014000 {
> +            compatible = "mediatek,mt8183-dsi";
> +            reg = <0 0x14014000 0 0x1000>;
> +            interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
> +            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +            clocks = <&mmsys CLK_MM_DSI0_MM>,
> +                <&mmsys CLK_MM_DSI0_IF>,
> +                <&mipi_tx0>;
> +            clock-names = "engine", "digital", "hs";
> +            resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
> +            phys = <&mipi_tx0>;
> +            phy-names = "dphy";
> +            port {
> +                dsi0_out: endpoint {
> +                    remote-endpoint = <&panel_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
