Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2559BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 18:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=no0tILRcoqSsSHBWfzhZFHt5QA/P1PoCbVFcn2fNaiY=; b=zyn1IiB+7EU2Dt
	wu6gpT6w/II+J5vIAbc9acR8EyOrsmbaaAAkeaRmYpspP1D7LHv9oEMIEwkTX069PcQJVJcee5yJV
	moFbKcOx+5G+VoX00ThcfVF99nfcMj9VSnPnzvVnP/Bt/DG9059z8ygCG4VC1Orm2TvaJ6Iksv1mz
	KjaeSvQhv3wT8AGaTE4cwAq1G3yfsR2ATULBsLstUxhpe2RblW95fHCfte70lTvwdTibpF9yI3R8F
	KyY+GfLHId0fhMgkXmo1hyc4kbf78AynYyt+gXWyz6/huHj4kiJxH0TBzfWzRmgLSdZ135ULRiZeS
	QWFeUtX+NsIFU0HN8Yxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlwpq-0077S8-T1; Tue, 03 May 2022 18:01:18 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlwpo-0077QE-1P; Tue, 03 May 2022 18:01:17 +0000
Received: by mail-oi1-f172.google.com with SMTP id q8so18542786oif.13;
 Tue, 03 May 2022 11:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wtOAnbA8fkSXPrsuDbMwBLZHEfeDloEVKX5x1RNzDgc=;
 b=K6UgLh+/E57Zoud6pk+sIqp88+1sLRhrx6Xrdp9wfrJAD5cKVZbytDm09czlU3MWy9
 zMaW4hscNoZH+0QIxw+ZSdYHNWNOvqvbKNT3CRuPE/q6lr0jBpR2/xnzoQ0jhmPdLe7n
 oq2C+QcRg93tG49csMNyT/BuZEcEbaezeKTRNVxJXrp3M0tlKCxwgK6UGgzGZoU9IJ7j
 6IgNZBYpx1+SoNSPCPlqIdQ+g9O2S5UwQo+Bu9iEhDubUwWZ0aCeVJiaXFmaGkq4mHaP
 hUIh/lUg0e1jLN8B719UtdjljQ+bcDLc8sQ0jCYOIJB2IvBqfHLKPxbnZuUnLtjoSGOF
 Vi5w==
X-Gm-Message-State: AOAM531010L01ukPecQHAFwWn6GwxJjuyVKKH+HSwe6HbdcysxrM4V8Q
 8j2BBp5gzh28mCINwGgOVg==
X-Google-Smtp-Source: ABdhPJyuMn1wVby2Ptl5y6qzq4nj/qnQt9eEtshKOwKTxA77wwD9xsuYV6p0wZw6QNCUIQz0ccdnLg==
X-Received: by 2002:a05:6808:2119:b0:325:e8f4:9278 with SMTP id
 r25-20020a056808211900b00325e8f49278mr2461181oiw.82.1651600872244; 
 Tue, 03 May 2022 11:01:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x21-20020a05687031d500b000e686d13872sm7114191oac.12.2022.05.03.11.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 11:01:11 -0700 (PDT)
Received: (nullmailer pid 3963995 invoked by uid 1000);
 Tue, 03 May 2022 18:01:10 -0000
Date: Tue, 3 May 2022 13:01:10 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
Message-ID: <YnFt5vL+6uVioqsf@robh.at.kernel.org>
References: <20220428133753.8348-1-rex-bc.chen@mediatek.com>
 <20220428133753.8348-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428133753.8348-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_110116_124408_87AF1719 
X-CRM114-Status: GOOD (  23.14  )
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

On Thu, Apr 28, 2022 at 09:37:50PM +0800, Rex-BC Chen wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dsi.txt         |  62 ---------
>  .../display/mediatek/mediatek,dsi.yaml        | 122 ++++++++++++++++++
>  2 files changed, 122 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> deleted file mode 100644
> index 36b01458f45c..000000000000
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -Mediatek DSI Device
> -===================
> -
> -The Mediatek DSI function block is a sink of the display subsystem and can
> -drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for dual-
> -channel output.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-dsi"
> -- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
> -- reg: Physical base address and length of the controller's registers
> -- interrupts: The interrupt signal from the function block.
> -- clocks: device clocks
> -  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> -- clock-names: must contain "engine", "digital", and "hs"
> -- phys: phandle link to the MIPI D-PHY controller.
> -- phy-names: must contain "dphy"
> -- port: Output port node with endpoint definitions as described in
> -  Documentation/devicetree/bindings/graph.txt. This port should be connected
> -  to the input port of an attached DSI panel or DSI-to-eDP encoder chip.
> -
> -Optional properties:
> -- resets: list of phandle + reset specifier pair, as described in [1].
> -
> -[1] Documentation/devicetree/bindings/reset/reset.txt
> -
> -MIPI TX Configuration Module
> -============================
> -
> -See phy/mediatek,dsi-phy.yaml
> -
> -Example:
> -
> -mipi_tx0: mipi-dphy@10215000 {
> -	compatible = "mediatek,mt8173-mipi-tx";
> -	reg = <0 0x10215000 0 0x1000>;
> -	clocks = <&clk26m>;
> -	clock-output-names = "mipi_tx0_pll";
> -	#clock-cells = <0>;
> -	#phy-cells = <0>;
> -	drive-strength-microamp = <4600>;
> -	nvmem-cells= <&mipi_tx_calibration>;
> -	nvmem-cell-names = "calibration-data";
> -};
> -
> -dsi0: dsi@1401b000 {
> -	compatible = "mediatek,mt8173-dsi";
> -	reg = <0 0x1401b000 0 0x1000>;
> -	interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
> -	clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>,
> -		 <&mipi_tx0>;
> -	clock-names = "engine", "digital", "hs";
> -	resets = <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
> -	phys = <&mipi_tx0>;
> -	phy-names = "dphy";
> -
> -	port {
> -		dsi0_out: endpoint {
> -			remote-endpoint = <&panel_in>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> new file mode 100644
> index 000000000000..2ca9229ef69e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek DSI Controller Device Tree Bindings
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Jitao Shi <jitao.shi@mediatek.com>
> +  - Xinlei Lee <xinlei.lee@mediatek.com>
> +
> +description: |
> +  The MediaTek DSI function block is a sink of the display subsystem and can
> +  drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for dual-
> +  channel output.
> +
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
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

1 blank line

> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2

Did you try adding these? Because they are wrong and will contradict 
dsi-controller.yaml.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
