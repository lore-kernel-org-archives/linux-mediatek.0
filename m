Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988C0C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 21:49:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C2DA2071E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 21:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iwKo9TE/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C2DA2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z7wa/Q3BHaq7Cih2U1NVcWtHGGiIIsplG+mCn8AUY7s=; b=iwKo9TE/YRPb82Y8H7NhOYE27
	c/fKbGSXEPwtUgCxkKi4gkrl0n5cY5GXrRW1eCTKPt6ZS1uK+FiZEid8akdYKX22o5H0Cc7iVaUjh
	tdRmGBSVptzATmjry75lIvcahp9cHKVLDi1NdvzXNUsgSbRG5DI77z8emTH9UXJN/FtCAnycD9IkO
	nEWrAUGe2MaN2J5flPzdgoTLjb+9ltXuhhaHJHQRF2rblR4Boun29CwtLINAfbg7KTMkIUuuYTJvw
	3dK7O/akrvjLYVP+jmdcy722Jjvnb6a587q5m0h0lMUfDrOC0oWj8NQcS6YsXGiRjK0kDDkFKo3AX
	VUMQxyiIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAgoG-0007yD-9h; Tue, 25 Aug 2020 21:48:52 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAgoC-0007uw-M3; Tue, 25 Aug 2020 21:48:49 +0000
Received: by mail-io1-f67.google.com with SMTP id b16so70838ioj.4;
 Tue, 25 Aug 2020 14:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RQP52sLIM0MfnF4NggVw656j4jf7VJADZKCoTHNbNKI=;
 b=CuH4scQAG/39lqYH3ozvysccZY65f+r9Y2QoRQz92HL++l7kckJEsBeuBsAQjodewB
 /ivPuK9uGz/eA478crh9ubJ/3RNEMouF+FAbv08AZWSonp0Ezukf/CnTtwliLJj2IGhu
 PCAg3oxPpUEsD6UlcE+0/urpc2SXaXKjglBAGZ9DrFbBkMZ7g6M18vQbbRSxcRm57dds
 YR4EIgfvdgA1yoLd11+8mmBLUmQ+GZKBmeesEFz7ZkZPDZScSjshhskca3+9IcqN70aY
 4HWl8cIHwrPCWkC5Eb+ITlCTH28ckQURdkfn7o2HEggj7zWMEOGiYZ25hrC0qHrR6yl7
 rZ0Q==
X-Gm-Message-State: AOAM533yoGec3u3OfzVXP960OXJUrzgBMvfkHJUSdXMw6q57EFseaXXe
 WsjzfPkf1UlsSWdEhlK8jQ==
X-Google-Smtp-Source: ABdhPJwIny58KBr2tW0qD6I6vbfQzkQqr7DvAVQaFDJyISwKyKf4dn22aFNXa8TQpK0wTX1V5yeJGQ==
X-Received: by 2002:a6b:5009:: with SMTP id e9mr10947465iob.156.1598392127545; 
 Tue, 25 Aug 2020 14:48:47 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id t187sm23566iof.54.2020.08.25.14.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:48:47 -0700 (PDT)
Received: (nullmailer pid 1396452 invoked by uid 1000);
 Tue, 25 Aug 2020 21:48:42 -0000
Date: Tue, 25 Aug 2020 15:48:42 -0600
From: Rob Herring <robh@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: interrupt-controller: Add MStar
 interrupt controller
Message-ID: <20200825214842.GA1367012@bogus>
References: <20200819034231.20726-1-mark-pk.tsai@mediatek.com>
 <20200819034231.20726-3-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819034231.20726-3-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_174848_765086_FD9A888E 
X-CRM114-Status: GOOD (  25.08  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 maz@kernel.org, yj.chiang@mediatek.com, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 11:42:31AM +0800, Mark-PK Tsai wrote:
> Add binding for MStar interrupt controller.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  .../interrupt-controller/mstar,mst-intc.yaml  | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
> new file mode 100644
> index 000000000000..6e383315e529
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings.

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/mstar,mst-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MStar Interrupt Controller
> +
> +maintainers:
> +  - Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> +
> +description: |+
> +  MStar, SigmaStar and Mediatek DTV SoCs contain multiple legacy
> +  interrupt controllers that routes interrupts to the GIC.
> +
> +  The HW block exposes a number of interrupt controllers, each
> +  can support up to 64 interrupts.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

Drop this. It is applied based on node name matching already.

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mstar,mst-intc
> +      - enum:
> +          - mediatek,mt58xx-intc

Normally, the 1st entry would be enum as that's where you'd add new 
compatibles (as the fallback is constant). But if you don't forsee any 
additions, just make both 'const'

> +
> +  interrupt-controller: true
> +
> +  "#address-cells":
> +    enum: [ 0, 1, 2 ]

This would normally be 0 in an interrupt controller. It's only relevant 
if you have an 'interrupt-map' which this is the parent for.

> +  "#size-cells":
> +    enum: [ 1, 2 ]

And this should be dropped.

> +
> +  "#interrupt-cells":
> +    const: 3
> +    description: |
> +      Use the same format as specified by GIC in arm,gic.yaml.

That's odd. You have the same SPI and PPI stuff?

> +
> +  reg:
> +    description: |
> +      Physical base address of the mstar interrupt controller
> +      registers and length of memory mapped region.

Drop this. That's every 'reg' property.

> +    minItems: 1

maxItems is more logical.

> +
> +  mstar,irqs-map-range:
> +    description: |
> +      The range of parent interrupt controller's interrupt lines
> +      that are hardwired to mstar interrupt controller.

Is this <start size> or <start end>?

Really, this should just use 'interrupts' even though that's a bit 
verbose. Or be implied by the compatible string. What's the maximum 
number of parent interrupts?

In any case, we really need to stop having vendor specific properties 
for this.

> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      minItems: 2
> +      maxItems: 2
> +
> +  mstar,intc-no-eoi:
> +    description: |

Don't need '|' if there's no formatting.

> +      Mark this controller has no End Of Interrupt(EOI) implementation.
> +      This is a empty, boolean property.

You can drop this line. The schema says this.

> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - mstar,irqs-map-range
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mst_intc0: interrupt-controller@1f2032d0 {
> +      compatible = "mstar,mst-intc", "mediatek,mt58xx-intc";
> +      interrupt-controller;
> +      #interrupt-cells = <3>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      interrupt-parent = <&gic>;
> +      reg = <0x1f2032d0 0x30>;
> +      mstar,irqs-map-range = <0 63>;

Is 0 a PPI or SPI? This property is making some assumption and wouldn't 
be able to support both types or another parent interrupt controller.

> +    };
> +...
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
