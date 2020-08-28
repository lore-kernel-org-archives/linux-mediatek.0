Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFDAC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 22:05:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42822205CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 22:05:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDJ7Mo7c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42822205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mw4aW6KyQRTZN8U9p5RTp7Rehg6yDpDmAJpDqiisecY=; b=HDJ7Mo7cj7KTi9AION7Ut7SH0
	JXy7Rf94ek2VHc5oSvrfYhmBrCGGVK8XK0oLCfg+tuNdEEgJXu72DOvPGkWdxnEJRpa3YZe1GLdbu
	xinMfwF65DdlXtfXMU5HAU9D3kMHKs6pIYF2G9P1svfG9XazirLAv65v4FAS/8gWQ7kcMACk4vS/P
	4qubglJUovnxz5Y5kdtAGajxaE6/FSy/IE6br77ZR3+WIShzxoQ0GcqcvlqlzLUJXrnQd354oNsFW
	EpQTc3m2FN8RRDL+L6tRrYSHPvvjZKDm38uTa3LYLKX4W3fP0OHBlQTmlwhcZiWDRVkLJuf5Z9Ejs
	ClH110ZXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBmV0-00010x-05; Fri, 28 Aug 2020 22:05:30 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBmUt-0000xv-W0; Fri, 28 Aug 2020 22:05:25 +0000
Received: by mail-il1-f193.google.com with SMTP id q14so1943131ilj.8;
 Fri, 28 Aug 2020 15:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hEjjUFT83iNRg02ncmXB05CfgHtGJIWhaDk9gjoB/yw=;
 b=thSpzInxf1CPte8/jUe/ZaADoq1pWycaRSFqVpov42iOgjxaSXN8XTNrVsjd8jli5i
 KVEc8Tkt0lVuxI9/2uhGDHCZHIL8ZrPhJyyNZE0YpLLa0WSfxl1P3tL6Qvjoh5BrQCl4
 XelAO6Ss9dTGdIKS/RiYLoG10jcMimPnxbD3j2M+Wyb9LTvuh4D3iy/a0c4YyNpFsrc5
 O0pO4lLRXVA0TLZqGVNGdhNTYTdjmphEkrWHfHuaRLU9uKLcy2pTMCr5iexuWoSZICUv
 TtPtrF8WHxgaWvnJQ40t8HKb0lWhr9SsIXiYnGIk2XEC/Ykv7x7ZEiXn0ZisZsiEbpyY
 kUAQ==
X-Gm-Message-State: AOAM531/ObvCyEabwT8CnFBSZI82ttVi1F4i548PN2uk657tVFMRFuAZ
 DeMjEaz/yCZa+NnP1fQTiw==
X-Google-Smtp-Source: ABdhPJxm/ppsdTb0g25vKmMiz/juduCbS2JSibG+yBa7cfosxhP0iu5fPruCrPy6GFCcFSyoZ/Y5fQ==
X-Received: by 2002:a05:6e02:13c6:: with SMTP id
 v6mr804659ilj.87.1598652323060; 
 Fri, 28 Aug 2020 15:05:23 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id q23sm238341ior.47.2020.08.28.15.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 15:05:22 -0700 (PDT)
Received: (nullmailer pid 3486516 invoked by uid 1000);
 Fri, 28 Aug 2020 22:05:20 -0000
Date: Fri, 28 Aug 2020 16:05:20 -0600
From: Rob Herring <robh@kernel.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v4 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
Message-ID: <20200828220520.GA3482472@bogus>
References: <1598610636-4939-1-git-send-email-u0084500@gmail.com>
 <1598610636-4939-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598610636-4939-2-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_180524_097615_0B5A266E 
X-CRM114-Status: GOOD (  18.95  )
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

Use 'interrupts'. The tooling will automatically support 
'interrupts-extended'.

> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: PD_IRQB
> +
> +patternProperties:
> +  "connector":
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

Where's the data connections? The assumption of the binding is the USB 
(2 and 3) connections come from the parent if there's no graph to the 
USB controller(s).

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
