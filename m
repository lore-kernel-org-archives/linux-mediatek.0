Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6276BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 20:14:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F053E61052
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 20:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F053E61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LZHuVPPhhupihq11Ve9Ly0atdAAYCn1CxeNIsb3BB8=; b=v1ycKUuo1KGJDi
	0Ch+yZVA4q94jpkb+MU0MvLuSCgOp7XR3D4V9BBndQGcdndht6yd2SykRsIen1Cxe+kyQ52j7C5X7
	wvxyAkhHFEFl4GBNZAY3pSR7NfwTkbiGGU6LM1hk1Q69U0e1tl8XwKIn8XGiur/+ZX2Pn3GJLoa71
	mMCjDamTGAa0T4pKxDOEW2C7v+6dkpv7Xhx0so3qYEVZ7KvqDSbmHB6GEO+cOkitWq+tEDYj/lQZp
	vGg3PYzOJXdbew50N8cdoBc6nHZbfRgZB/j5q8/6WYeTAOx3mu9mWbb/hRZhJ/RP1P7FJYZ/Z0QB4
	Z35DFG3J19sjV7Kp3t/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNL0g-001rdE-Ud; Mon, 06 Sep 2021 20:14:30 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNL0T-001rbh-Sy
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 20:14:20 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id f6bc797c-0f4e-11ec-a02a-0050568c148b;
 Mon, 06 Sep 2021 20:13:56 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 69317194D23;
 Mon,  6 Sep 2021 22:13:58 +0200 (CEST)
Date: Mon, 6 Sep 2021 22:14:05 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/6] dt-bindings: mediatek,dpi: Add mt8195 dpintf
Message-ID: <YTZ2jf0xynvvZM2s@ravnborg.org>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-2-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210906193529.718845-2-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_131418_250809_C9DF4327 
X-CRM114-Status: GOOD (  21.08  )
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

Hi Markus,

On Mon, Sep 06, 2021 at 09:35:24PM +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is similar to the actual dpi. They differ in some points
> regarding registers and what needs to be set but the function blocks
> itself are similar in design.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

I fail to see why they share the same dt-schema as the main content in
the schema is the clocks and they differ.

A new mediatek,dpintf schema seems more appropriate.

I recall I though so when reading the RFC variant but failed to comment on it.

	Sam

> ---
>  .../display/mediatek/mediatek,dpi.yaml        | 43 ++++++++++++++++---
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index dd2896a40ff0..1a158b719ce6 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DP_INTF Controller Device Tree Bindings
>  
>  maintainers:
>    - CK Hu <ck.hu@mediatek.com>
> @@ -13,7 +13,8 @@ maintainers:
>  description: |
>    The Mediatek DPI function block is a sink of the display subsystem and
>    provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -  output bus.
> +  output bus. The Mediatek DP_INTF is a similar function block that is
> +  connected to the (embedded) display port function block.
>  
>  properties:
>    compatible:
> @@ -23,6 +24,7 @@ properties:
>        - mediatek,mt8173-dpi
>        - mediatek,mt8183-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dpintf
>  
>    reg:
>      maxItems: 1
> @@ -37,10 +39,11 @@ properties:
>        - description: DPI PLL
>  
>    clock-names:
> -    items:
> -      - const: pixel
> -      - const: engine
> -      - const: pll
> +    description:
> +      For dpi clocks pixel, engine and pll are required. For dpintf pixel,
> +      hf_fmm and hf_fdp are required.
> +    minItems: 3
> +    maxItems: 3
>  
>    pinctrl-0: true
>    pinctrl-1: true
> @@ -64,6 +67,34 @@ required:
>    - clock-names
>    - port
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-dpintf
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: pixel
> +            - const: hf_fmm
> +            - const: hf_fdp
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: pixel
> +            - const: engine
> +            - const: pll
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.33.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
