Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B75C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 20:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsWetHbH5K1dFCHKRoL1WxKEsXHSYMfFh7WIn14b/xs=; b=FInQJrNVr3dExH
	um6MrBBDNPn95t7aez6R79pp6C2qganGSSTA6Zw2OB+aZ+TGR56NPoQTq1i2bC+I+Sse0lGB08Hh+
	/x71KLc8JtvUHAX2qmsjv3KAw5X6D2bWk7BUZ6sJCOZCHVw42Nzy4AKdVWEcdPmgcWP3AOvOP1ifP
	3vMRC96pTrmunrFg1U+jpQ6Yxl/YyQvgHUZMFetolZ7aAM7Y1+TRL46xAAlePcXPlfMSPNM3LavVl
	5EhR2+svWwtTiZ74pINgzLDac56seUdoEgqKA14IrPek0t70KvJfLPsVLkGJo6oG8oK+SCRu/juLE
	GA1j9U/j5VXiTYjU5xRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1D5z-00B7Q6-Vd; Tue, 14 Jun 2022 20:25:04 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1D5w-00B7Ni-Kx; Tue, 14 Jun 2022 20:25:02 +0000
Received: by mail-il1-f173.google.com with SMTP id s1so7457118ilj.0;
        Tue, 14 Jun 2022 13:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Prhy9A37ks1LcK4a+DeU6wJg8EaLF2YElpfIpuhjq5k=;
        b=4Exzh8kHYwBYf3fHK4V5yaP7K+kWEL1XTxTjoxv6jLJFri6+dAdtg0xze5hOMkXOwR
         pof2gAhub7C7eYz5m/LzGFva52QYE36JYSp9Yq0/TtKq0gZ1Qo91mfQQbq9/r5etBTQN
         vwpJlNYh/xIOwfQHDfTEHp7U+O1wMXLmXfHGNO0lWltFdtxcJYrUV9LMiaINk6T9Mfn+
         Bh92t3zPtg2xRKeRoCpH0VangdP7e4HsyM5Z2jqu4VnusCNLbYUGEisXUd/O1JRvxQRH
         XVm7kU/Q/4eENmKXi3KgZv7Q7fCEQhNsmXV10lGTeoAtLZ45z/j2NsqHOAAyd6zYDwia
         avkQ==
X-Gm-Message-State: AJIora9EglWF0QNRAvT09zbNc0Rbvrn5SxPMKq82X64AaXrtBb0ww6jh
	5SOweqvxDT5Ca8jB50a8Cg==
X-Google-Smtp-Source: AGRyM1vF7TJBKpD4DYZTQWlZ5S4iATGPfvcxpkyfqWopgl8NXoI8/XPuak8qVqPSqHwTLaejygTYLA==
X-Received: by 2002:a05:6e02:1b04:b0:2d1:af55:eb92 with SMTP id i4-20020a056e021b0400b002d1af55eb92mr3936723ilv.227.1655238298241;
        Tue, 14 Jun 2022 13:24:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id w20-20020a029694000000b00331d98c9a7fsm5258030jai.40.2022.06.14.13.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 13:24:57 -0700 (PDT)
Received: (nullmailer pid 2419397 invoked by uid 1000);
	Tue, 14 Jun 2022 20:24:55 -0000
Date: Tue, 14 Jun 2022 14:24:55 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie, msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com, wenst@chromium.org, angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v11 01/12] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
Message-ID: <20220614202455.GA2415891-robh@kernel.org>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
 <20220613064841.10481-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613064841.10481-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_132500_727415_296AFD57 
X-CRM114-Status: GOOD (  23.22  )
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

On Mon, Jun 13, 2022 at 02:48:30PM +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> In this patch, we also do these string replacement:
> - s/mediatek/MediaTek/ in title.
> - s/Mediatek/MediaTek/ in description.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index 77ee1b923991..ca1b48e78581 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: mediatek DPI Controller Device Tree Bindings
> +title: MediaTek DPI and DP_INTF Controller
>  
>  maintainers:
>    - CK Hu <ck.hu@mediatek.com>
>    - Jitao shi <jitao.shi@mediatek.com>
>  
>  description: |
> -  The Mediatek DPI function block is a sink of the display subsystem and
> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -  output bus.
> +  The MediaTek DPI and DP_INTF function blocks are a sink of the display
> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> +  parallel output bus.
>  
>  properties:
>    compatible:
> @@ -24,6 +24,7 @@ properties:
>        - mediatek,mt8183-dpi
>        - mediatek,mt8186-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dp_intf
>  
>    reg:
>      maxItems: 1
> @@ -36,12 +37,14 @@ properties:
>        - description: Pixel Clock
>        - description: Engine Clock
>        - description: DPI PLL
> +      - description: Clock gate for PLL
>  
>    clock-names:
>      items:
>        - const: pixel
>        - const: engine
>        - const: pll
> +      - const: pll_gate

You just added a new required clock for everyone.

>  
>    pinctrl-0: true
>    pinctrl-1: true
> @@ -55,7 +58,7 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:
>        Output port node. This port should be connected to the input port of an
> -      attached HDMI or LVDS encoder chip.
> +      attached HDMI, LVDS or DisplayPort encoder chip.
>  
>  required:
>    - compatible
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
