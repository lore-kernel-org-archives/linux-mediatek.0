Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE45C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 22:06:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 738D520838
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 22:06:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="abXq0iUt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 738D520838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z7PCzSnGlH1lh43iNGXz9nz1dzHFbvrbadHChVUSia4=; b=abXq0iUt03qDryqL3HoHrbsrI
	VgclX3bvVyfv60A/nwX6xCaj16FQdr2Y0zIDMWz3PMR55aAlVtAl/wbhU7/ETxm3+JITI9y55jnJT
	hNfHWmHt5iOSlBqMjM+h7ct18yxG/FaTYc8d4msxXk9WT6f8xDK9XSHjanOUF6Hs5GRTVtpHRGCms
	Sy82Td29AhNaT8zyrDVaMCk40D9bHqWuMhsfz6t5wPAPI8pBT9K5K8FDwaqQYV3ZbFDx/u42HYdEa
	FOYDcw1rI/LFGqHAYq7dOreq+s0PeCM/6Mn7DXcqXBXIx8oRWk7e0ta0VD4JyDAm9dl3VhLvM4MYf
	mqCiHHPcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBmWA-0001Uj-AR; Fri, 28 Aug 2020 22:06:42 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBmW1-0001Q8-W4; Fri, 28 Aug 2020 22:06:35 +0000
Received: by mail-io1-f65.google.com with SMTP id m23so556232iol.8;
 Fri, 28 Aug 2020 15:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=39/6+NdecqvikGjg8YBo+lOCsS3fMVVJzywnwgJFjx0=;
 b=I8M/WHRg3/ok/5k+YznZe0nRvDcYr4HIJSfP56EKDmgpbWvhlq++sH8/5nbgPRS8IY
 AsS2LMYReHcGzObBD1H4v0EsNfWJgtLANWuLcLDc2DAKmFwG14Y2Zh2DdzOEdUyLcNOH
 HRV2VVK7aMBm9R/nkaMolLQh9f4Ajw87i8lb6qNJmfm9PgYlex+JxA7eE1kd5vryH0xS
 rwuOLCP+vKfpASy3g3c9JkuDlyn4OQ88RBDjkOOdH3UrImX/0hltYoBf9kwXNMpcbUXQ
 EHgrw9VIKbu4Vkzwj4IM+aBxfiIZHoCGReSYs+hIuViVjn2FU/NMkCNzYf6wkg5U90CA
 0pAw==
X-Gm-Message-State: AOAM533zvl+o0lO5ZjfnEBmdheudLiavF2aLxPvNS1t0bAchr8H5fqZC
 6a81xRl49TbADMzUSL3nyA==
X-Google-Smtp-Source: ABdhPJwVv8s/hJTLnejTHw2Frk9tNzJBWfrJVda7OMvoSYV6El+lEe6dFH5QofuW1HtBydBRzeP9uw==
X-Received: by 2002:a05:6638:1393:: with SMTP id
 w19mr2971735jad.113.1598652393099; 
 Fri, 28 Aug 2020 15:06:33 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id v11sm342684ili.66.2020.08.28.15.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 15:06:32 -0700 (PDT)
Received: (nullmailer pid 3488084 invoked by uid 1000);
 Fri, 28 Aug 2020 22:06:30 -0000
Date: Fri, 28 Aug 2020 16:06:30 -0600
From: Rob Herring <robh@kernel.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v4 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
Message-ID: <20200828220630.GB3482472@bogus>
References: <1598610636-4939-1-git-send-email-u0084500@gmail.com>
 <1598610636-4939-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598610636-4939-2-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_180634_066361_465EE6E4 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 06:30:36PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add a devicetree binding documentation for the MT6360 Type-C driver.
> 
> usb typec: mt6360: Rename DT binding doument from mt6360 to mt636x
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/usb/mediatek,mt6360-tcpc.yaml         | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> new file mode 100644
> index 00000000..9e8ab0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/mediatek,mt6360-tcpc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek MT6360 Type-C Port Switch and Power Delivery controller DT bindings
> +
> +maintainers:
> +  - ChiYuan Huang <cy_huang@richtek.com>
> +
> +description: |
> +  Mediatek MT6360 is a multi-functional device. It integrates charger, ADC, flash, RGB indicators,
> +  regulators (BUCKs/LDOs), and TypeC Port Switch with Power Delivery controller.
> +  This document only describes MT6360 Type-C Port Switch and Power Delivery controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6360-tcpc
> +
> +  interrupts-extended:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: PD_IRQB
> +
> +patternProperties:
> +  "connector":

Also, this is not a pattern, so should be under 'properties', and it 
doesn't need quotes.

> +    type: object
> +    $ref: ../connector/usb-connector.yaml#
> +    description:
> +      Properties for usb c connector.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - interrupts-extended
> +  - interrupt-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/usb/pd.h>
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mt6360@34 {
> +            compatible = "mediatek,mt6360";
> +            reg = <0x34>;
> +
> +            tcpc {
> +                compatible = "mediatek,mt6360-tcpc";
> +                interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
> +                interrupt-names = "PD_IRQB";
> +
> +                connector {
> +                        compatible = "usb-c-connector";
> +                        label = "USB-C";
> +                        data-role = "dual";
> +                        power-role = "dual";
> +                        try-power-role = "sink";
> +                        source-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
> +                        sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
> +                        op-sink-microwatt = <10000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.7.4
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
