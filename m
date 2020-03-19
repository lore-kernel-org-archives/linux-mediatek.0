Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B767C4332B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 18:34:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40BEF20789
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 18:34:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OOVtKhpR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40BEF20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wHQMLZVLWKkihzQCY1kOh7s2abpewosOjohlJbUTvE=; b=OOVtKhpRtph97N
	/dhcAyh1c1N5ke0A197DArz3GE0H/qcKEvDJWLANcB0qhzoK1NefiCWXhhEHY1PRei4dMkewidKJA
	KtVtWOUSuEVbvwtSn1cKWYjrvjuvcVPxDvB29oDdZ4c6cxlz0Ipc3PnkAs1+3ofGoYtEN05AKC5AI
	Zl9kb0RRiYkmqbGfn1AcF46o7VtrvEtLCBHtqgHPw5+bv2PZa0zlo/sXlilVp21kBErQn9QZ5x528
	fl4ryvjcjRzmaQ4ccvmiEheeEWMWUn94EKzJsbXAcOakXXIkbZzhb2upo0bBWgQqVjfoIfTWo9mSW
	IkoRB9jkJkG469k+TOkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEzzZ-0004a3-TX; Thu, 19 Mar 2020 18:34:05 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEzzX-0004Zc-Fg; Thu, 19 Mar 2020 18:34:05 +0000
Received: by mail-il1-f196.google.com with SMTP id a6so3225664ilc.4;
 Thu, 19 Mar 2020 11:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uPWry8RY6+hi4eAi0Y1bb3DGJuUvwAMEt6jfhx00FwM=;
 b=rs0mflbuBWtgOZGd6XJlnx9kXOf03ZLlQdtcMLYLqPyPaS5YkJs0l0yyYHZEp7J1NH
 O+wKumALX8sOA1yU3OOmd6hKlp1I5pnqW9JVYNBwPrsZlF0twNg2QDxd/mMiy7YlLDPD
 o+o0RtZ7UKeYifFYSvuVfUhscYwVpp159CdXi7IaN/JywzP1uQ1KvyWnfEVZcQNcBJA+
 skbjaf9Ao7jqElNVSqXeke56POfO/RBGB9HqgDuzNcRodo7FzmLk/x0m0c3AZjQBR1Xn
 6KfYowWCXKEEGrDLMDa71fKY3z6cWQ1JvhlvDxBVxUxDUe/vz84/uGKZdGZiJJyU5VLI
 vlnQ==
X-Gm-Message-State: ANhLgQ0N9kuCB4VADr6EA9V7Hq5uQc4zJ3hKd99CPvwqpsp5tsAU8YdP
 eIWa1K0TuFVpwHs0PZHrXQ==
X-Google-Smtp-Source: ADFU+vs1k4gpcdfKiMfAtAb7CaNrV8yNwy8ti//ggPn+OEJyJsCKN0w4f4f/ANYejiLSsUVzM5ackg==
X-Received: by 2002:a92:9149:: with SMTP id t70mr4864882ild.114.1584642842382; 
 Thu, 19 Mar 2020 11:34:02 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id z1sm1124712ilq.83.2020.03.19.11.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 11:34:01 -0700 (PDT)
Received: (nullmailer pid 24310 invoked by uid 1000);
 Thu, 19 Mar 2020 18:33:58 -0000
Date: Thu, 19 Mar 2020 12:33:58 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v13 4/6] dt-bindings: display: mediatek: convert the
 document format from txt to yaml
Message-ID: <20200319183358.GA17237@bogus>
References: <20200311071823.117899-1-jitao.shi@mediatek.com>
 <20200311071823.117899-5-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311071823.117899-5-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_113403_522638_8FFE2229 
X-CRM114-Status: GOOD (  18.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 11, 2020 at 03:18:21PM +0800, Jitao Shi wrote:
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dpi.txt         |  45 --------
>  .../display/mediatek/mediatek,dpi.yaml        | 103 ++++++++++++++++++
>  2 files changed, 103 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> deleted file mode 100644
> index 2dfb50a7321e..000000000000
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Mediatek DPI Device
> -===================
> -
> -The Mediatek DPI function block is a sink of the display subsystem and
> -provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -output bus.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-dpi"
> -  the supported chips are mt2701 , mt8173 and mt8183.
> -- reg: Physical base address and length of the controller's registers
> -- interrupts: The interrupt signal from the function block.
> -- clocks: device clocks
> -  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> -- clock-names: must contain "pixel", "engine", and "pll"
> -- port: Output port node with endpoint definitions as described in
> -  Documentation/devicetree/bindings/graph.txt. This port should be connected
> -  to the input port of an attached HDMI or LVDS encoder chip.
> -
> -Optional properties:
> -- pinctrl-names: Contain "default" and "sleep".
> -  pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
> -- pclk-sample: refer Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -
> -dpi0: dpi@1401d000 {
> -	compatible = "mediatek,mt8173-dpi";
> -	reg = <0 0x1401d000 0 0x1000>;
> -	interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> -	clocks = <&mmsys CLK_MM_DPI_PIXEL>,
> -		 <&mmsys CLK_MM_DPI_ENGINE>,
> -		 <&apmixedsys CLK_APMIXED_TVDPLL>;
> -	clock-names = "pixel", "engine", "pll";
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&dpi_pin_func>;
> -	pinctrl-1 = <&dpi_pin_idle>;
> -
> -	port {
> -		dpi0_out: endpoint {
> -			pclk-sample = <0>;
> -			remote-endpoint = <&hdmi0_in>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> new file mode 100644
> index 000000000000..d65543e3bf8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek DPI Controller Device Tree Bindings
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  The Mediatek DPI function block is a sink of the display subsystem and
> +  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> +  output bus.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-dpi
> +      - mediatek,mt8173-dpi
> +      - mediatek,mt8183-dpi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Pixel Clock
> +      - description: Engine Clock
> +      - description: DPI PLL
> +
> +  clock-names:
> +    items:
> +      - const: pixel
> +      - const: engine
> +      - const: pll
> +
> +  pinctrl-0: true
> +  pinctrl-1: true
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  port@0:
> +    type: object
> +    description:
> +      Output port node with endpoint definitions as described in
> +      Documentation/devicetree/bindings/graph.txt. This port should be connected
> +      to the input port of an attached HDMI or LVDS encoder chip.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          pclk-sample:
> +            items:
> +            - description: refer Documentation/devicetree/bindings/media/video-interfaces.txt.

This is not an array.

Just 'pclk-sample: true' if both values are allowed or 'const: 0|1' if 
only one value is allowed.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - port@0
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    dpi0: dpi@1401d000 {
> +        compatible = "mediatek,mt8173-dpi";
> +        reg = <0 0x1401d000 0 0x1000>;
> +        interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&mmsys CLK_MM_DPI_PIXEL>,
> +             <&mmsys CLK_MM_DPI_ENGINE>,
> +             <&apmixedsys CLK_APMIXED_TVDPLL>;
> +        clock-names = "pixel", "engine", "pll";
> +        pinctrl-names = "default", "sleep";
> +        pinctrl-0 = <&dpi_pin_func>;
> +        pinctrl-1 = <&dpi_pin_idle>;
> +
> +        port@0 {
> +            dpi0_out: endpoint {
> +                pclk-sample = <0>;
> +                remote-endpoint = <&hdmi0_in>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.21.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
