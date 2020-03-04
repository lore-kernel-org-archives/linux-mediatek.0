Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98256C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 16:15:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DAB121739
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 16:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iQgKs0OD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DAB121739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4Tiz8egFB1Y+1us3zr98Xcb3Mib45ZQ8SA63IkOM4M=; b=iQgKs0OD2fPEjC
	8fGdMHlE5XCXkjR/x5mh5r4n9cdGedehjFk2AkV/qZJJu3gZQMp7gVW13KpMAX4EVqzxM0KwoJG4w
	SRSH4lrZb88T4Oy6/Xx8XJS1BqJhMiKwXMYT/ZLv+6bxRHD8MhSFOUji6TJ/D5ocKqUo1sBE5hdmj
	gGBwHRdMzXYTIJ8xlFW4wLFQRWCOVFf0Tpr7Dr+rZLNm3waZ4ra1+V0k50VaWvrmT6h+OIVIpBjXT
	dVMCoozPBvxkLwJhFO883JMJ9LxayHz9RjLX/T7wffs5H9uRvV9A+kDz8kW9bFdvEBtl8cMNWUix5
	4s/R3avCk0fB3EtZjwfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9WgW-0004Gs-1y; Wed, 04 Mar 2020 16:15:48 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9WgN-00045Z-Sk; Wed, 04 Mar 2020 16:15:41 +0000
Received: by mail-oi1-f195.google.com with SMTP id v19so2593059oic.12;
 Wed, 04 Mar 2020 08:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G/m9Dnt93HLh8ZZeYopXZOgJzRYkBJrpgZdowTke/ZA=;
 b=ZRDVjLxT+RV8RqQ3mthiTer/93VDkG3RAdyqGMx+Y6efy8C/cEhupwiutANobuQ0mf
 De9YtgthN/Xjpe9QbUH6ehsPmV+SkKkBwKursc8YLo5o3OtILYTg2bh2AUcM5p+MAG53
 yyuyGSj8Uc31zURgQBVwN847hQNJ05NBGAJUQ1b8+X8MHmcJOgJnGKgMnzm9b36YWu/l
 xm3FY9iktUkmqz8MXmmjBvNr19OkYo7CpsVJrTnnpCFwbp2VQl4NCZEKIpNEagbZZIiI
 nuunWw3LGOy0xsR7hpdsGgLXNA8EFIEiAYpcuunlPMDk9dMCbpgjczY8VsRkzikHqml7
 FPZQ==
X-Gm-Message-State: ANhLgQ013WlEkOEatgQMolUnI4EbiSdgPi4JsH5XWyk9J+Ir6R4AqaBy
 Sui3skq7OdQtiRO/mS9nSA==
X-Google-Smtp-Source: ADFU+vvQPKn3HTHYpHagUTruHe80jgRcAKAs1iIPLjepLVEiIsroKoDtfMT7OCsZXUt/LNxDyx47Yw==
X-Received: by 2002:aca:a9d4:: with SMTP id s203mr2347678oie.106.1583338538421; 
 Wed, 04 Mar 2020 08:15:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v65sm965478oib.17.2020.03.04.08.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 08:15:37 -0800 (PST)
Received: (nullmailer pid 26064 invoked by uid 1000);
 Wed, 04 Mar 2020 16:15:36 -0000
Date: Wed, 4 Mar 2020 10:15:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v12 4/6] dt-bindings: display: mediatek: convert the
 document format from txt to yaml
Message-ID: <20200304161536.GA20736@bogus>
References: <20200303052722.94795-1-jitao.shi@mediatek.com>
 <20200303052722.94795-5-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303052722.94795-5-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_081539_943275_82CC8795 
X-CRM114-Status: GOOD (  17.10  )
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

On Tue, Mar 03, 2020 at 01:27:20PM +0800, Jitao Shi wrote:
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dpi.txt         | 45 ---------
>  .../display/mediatek/mediatek,dpi.yaml        | 92 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

You need to run 'make dt_binding_check' on this and fix the errors.

[...]

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> new file mode 100644
> index 000000000000..eb2b0cb5eb5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek,dpi.yaml#
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
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: sleep

Doesn't match what you just added to the binding...

> +
> +  port:
> +    type: object
> +    description:
> +      Output port node with endpoint definitions as described in
> +      Documentation/devicetree/bindings/graph.txt. This port should be connected
> +      to the input port of an attached HDMI or LVDS encoder chip.
> +
> +    properties:
> +      pclk-sample:
> +      description: refer Documentation/devicetree/bindings/media/video-interfaces.txt.

This is wrong in multiple ways. 'description' is missing indentation, so 
you are defining 'description' to be a property.

And 'pclk-sample' is not a property of 'port' node, but 'endpoint'.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dpi0: dpi@1401d000 {
> +        compatible = "mediatek,mt8173-dpi";
> +        reg = <0 0x1401d000 0 0x1000>;
> +        interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&mmsys CLK_MM_DPI_PIXEL>,
> +             <&mmsys CLK_MM_DPI_ENGINE>,
> +             <&apmixedsys CLK_APMIXED_TVDPLL>;

Examples are built now and you need to add includes for these defines.

> +        clock-names = "pixel", "engine", "pll";
> +        pinctrl-names = "default", "sleep";
> +        pinctrl-0 = <&dpi_pin_func>;
> +        pinctrl-1 = <&dpi_pin_idle>;
> +
> +        port {
> +            reg = <0>;

Drop 'reg'.

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
