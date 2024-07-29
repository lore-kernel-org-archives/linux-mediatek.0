Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF683C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgxKKwKu3yZI7NgGYbuIETIJoth84hX9jYxaZ4vPPgI=; b=wlBdSO1sq+q0l1Q6AN2JI7SC51
	+rKCc8G55mjgcXpaHc4lSVPRaU9dLh21lo+H8NObzrB39gw212aO8LVkROWwSLRvK30G6gGfb0HM1
	gu8tGzZkJjIz+lpJAXvscyBUcqt604OjqNSfpJ8b6ngySMdBemvQgJVJnHXRdXfRFZcvLfRqlQNGE
	h/jC7CzhJKMMkJnPIcRnqs5XUmKbwwjFfzRVxfVadH1xShf8p78oSEI8Cixu0CHrsYEhvMBBjOtCT
	ORXUs3H/yDyPXNBi7uk+OKbqcJUQfXk0lyTYsNoTKd5ozzmVwBexccil+Eo90uBwmMY3199Whz6Bj
	6sA9IObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRtu-0000000BnG9-1fJk;
	Mon, 29 Jul 2024 15:03:02 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRoj-0000000Blpa-1ug8;
	Mon, 29 Jul 2024 14:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722265060;
	bh=XVKgyTWR8+f7LtxjNU/kic+26Xoff6phqUlkCrKMH9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lWIYDCVHmQyK59Nns2eQOkyexXlSc98SxM/QPPBXdjHesZTC82SeuhdziL19hAuLZ
	 5QvSIY5GXX4/1TvqhoIwNjxXPLPMhR0RZLJLCt5Y3nQu/HVxh6YzZtPEUdriU8Epf9
	 /e96UR39cBRBYFkJAEZcXM3eCwwNUVDPRyI4STJHbGaDVZL2Yv1e6prDOhLoWWeTpk
	 oY2PCgBg5WqRzzFr3CobHlyLRP2xV53xm6ETdfu/dhyMYm5L+dVTp4DXkQUzYFGXdG
	 UCF5rgwkkHo8+e0yKUbo2JIWCsx+PyJCwi1nzNux/LvmRGkuoMPZeqj2yP8gKsZHUT
	 BDSdlFWpX78Og==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CC6F03780C11;
	Mon, 29 Jul 2024 14:57:38 +0000 (UTC)
Message-ID: <92b18918-979d-43f6-890d-888caea08561@collabora.com>
Date: Mon, 29 Jul 2024 16:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
To: Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Louis Kuo <louis.kuo@mediatek.com>,
 Phi-Bang Nguyen <pnguyen@baylibre.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-1-c374c9e0c672@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-1-c374c9e0c672@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_075741_676959_99F799BC 
X-CRM114-Status: GOOD (  16.85  )
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

Il 29/07/24 16:48, Julien Stephan ha scritto:
> From: Louis Kuo <louis.kuo@mediatek.com>
> 
> This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>   .../bindings/media/mediatek,mt8365-seninf.yaml     | 259 +++++++++++++++++++++
>   MAINTAINERS                                        |   7 +
>   2 files changed, 266 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> new file mode 100644
> index 000000000000..8bd78ef424ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> @@ -0,0 +1,259 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023 MediaTek, BayLibre
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8365-seninf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Sensor Interface 3.0
> +

..snip..

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi@15040000 {
> +            compatible = "mediatek,mt8365-seninf";
> +            reg = <0 0x15040000 0 0x6000>;
> +            interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
> +            clocks = <&camsys CLK_CAM_SENIF>,
> +                     <&topckgen CLK_TOP_SENIF_SEL>;
> +            clock-names = "camsys", "top_mux";
> +
> +            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> +
> +            phys = <&mipi_csi0 PHY_TYPE_DPHY>, <&mipi_csi1>;
> +            phy-names = "csi0", "csi1";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    seninf_in1: endpoint {
> +                        clock-lanes = <2>;
> +                        data-lanes = <1 3 0 4>;
> +                        remote-endpoint = <&isp1_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                };
> +
> +                port@3 {
> +                    reg = <3>;
> +                };

I don't really get why you got all those empty ports here, as you could simply
avoid adding all of the empty nodes instead.

I don't have strong opinions about that anyway so, regardless of that....

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +
> +                port@4 {
> +                    reg = <4>;
> +                    seninf_camsv1_endpoint: endpoint {
> +                        remote-endpoint = <&camsv1_endpoint>;
> +                    };
> +                };
> +
> +                port@5 {
> +                    reg = <5>;
> +                    seninf_camsv2_endpoint: endpoint {
> +                        remote-endpoint = <&camsv2_endpoint>;
> +                    };
> +                };
> +
> +                port@6 {
> +                    reg = <6>;
> +                };
> +
> +                port@7 {
> +                    reg = <7>;
> +                };
> +
> +                port@8 {
> +                    reg = <8>;
> +                };
> +
> +                port@9 {
> +                    reg = <9>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6c90161c7bf..6bd7df1c3e08 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14158,6 +14158,13 @@ M:	Sean Wang <sean.wang@mediatek.com>
>   S:	Maintained
>   F:	drivers/char/hw_random/mtk-rng.c
>   
> +MEDIATEK ISP3.0 DRIVER
> +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +M:	Julien Stephan <jstephan@baylibre.com>
> +M:	Andy Hsieh <andy.hsieh@mediatek.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> +
>   MEDIATEK SMI DRIVER
>   M:	Yong Wu <yong.wu@mediatek.com>
>   L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> 


