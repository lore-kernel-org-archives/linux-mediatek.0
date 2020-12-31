Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A181C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 18:12:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F5F223DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 18:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F5F223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oUuZzrl2Le0gUHTW5VNQxLOybwvx5nwtblexPFQ3uHs=; b=Gv5BwbOvJn0Dfrv3+NzLWPZwD
	fLK2gQo4o3QLzB7VIF1F9YvIqLPCB/+TSdB0vfRca2e9vtEoj0HSBEfAw1gX2L90uqzjKD+41hLKu
	bNsB8hJwelLLDC2RFsjcQXyBv8h6DMEsNQIPUYlGCDSieyqWRPo6zvW+57zqfyhTT+mpvOT5rdGwx
	h8C8h+G23WF+Lgpb8BZEGSMDjT0C75N6102ufQIw23OWdH5Ss4Yk0RV+ZIKtZkI3bTHHYRfXL1tJ/
	XS4UicaT5p/d9xni+HlY+mAOtzCIcp9/BHYmMVTAQgqPMP+/eb97J9+MdnTA3UUFSKhub6Md5rI9r
	Fz4dXcWCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv2Qx-0006kN-Ev; Thu, 31 Dec 2020 18:12:23 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kv2Qt-0006jp-Mf; Thu, 31 Dec 2020 18:12:20 +0000
Received: by mail-ot1-f42.google.com with SMTP id r9so18534013otk.11;
 Thu, 31 Dec 2020 10:12:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/baDFZ04WPKFvnGfg9yUbKzRdx2bFG5qizeKUagnLfM=;
 b=r/MnXQEUAhXconRR31Z+/f4wKzRFw31FY7K7xZyL82mUdfUTyGzB6LjRcO3jIDHfFI
 St0w6CepS+KPH1yVlo+3opiE4tQ9qODWYFSvag2LXVwA8GvfRPpn7L0TqiiNinQSHZVy
 t9NlBFYoNf5CtGi80MScUuUxZOR9y8c/+jAWNJitPf/cOvB0vhuvKYugFAa3wpstWCDd
 n8E098xGFQlpByXJpF60y9SbgWj1FIzLBEYjZI00SJpHTERurgHS7p1SGm09cZjlI0yT
 7L836IgRnUNZi26bpY13kLsD/1R9x9FVJo6ZVxprUYnSF0xETgDnT56l9ll+2xZ4lpar
 YK+A==
X-Gm-Message-State: AOAM5302RpE1XAX3D6OPW9E/7PNfYqX2MZ6aB7EaUmaghBmRoi85q1pL
 YUxQQrvCRTnaeIg7Jqq8x9CzsEm1cA==
X-Google-Smtp-Source: ABdhPJyDkXZbrOTrCWfEFNlpNchpSRar2P16KYigEufXLX1WTb+p4jeWGh4MH2z99j4KVmakj2IaGA==
X-Received: by 2002:a05:6830:1c3d:: with SMTP id
 f29mr42876645ote.47.1609438338832; 
 Thu, 31 Dec 2020 10:12:18 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f25sm11147568oou.39.2020.12.31.10.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 10:12:17 -0800 (PST)
Received: (nullmailer pid 2074202 invoked by uid 1000);
 Thu, 31 Dec 2020 18:12:15 -0000
Date: Thu, 31 Dec 2020 11:12:15 -0700
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Subject: Re: [PATCH v10 1/7] [v10,1/7]: dt-bindings: soc: mediatek: add mtk
 svs dt-bindings
Message-ID: <20201231181215.GA1874134@robh.at.kernel.org>
References: <20201227105449.11452-1-roger.lu@mediatek.com>
 <20201227105449.11452-2-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201227105449.11452-2-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_131219_791369_E046BF51 
X-CRM114-Status: GOOD (  20.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Dec 27, 2020 at 06:54:43PM +0800, Roger Lu wrote:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../bindings/soc/mediatek/mtk-svs.yaml        | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> new file mode 100644
> index 000000000000..9c7da0acd82f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mtk-svs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Introduce MTK SVS engine
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Kevin Hilman <khilman@kernel.org>
> +  - Nishanth Menon <nm@ti.com>
> +
> +description: |+
> +  The Smart Voltage Scaling(SVS) engine is a piece of hardware
> +  which has several controllers(banks) for calculating suitable
> +  voltage to different power domains(CPU/GPU/CCI) according to
> +  chip process corner, temperatures and other factors. Then DVFS
> +  driver could apply SVS bank voltage to PMIC/Buck.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183-svs
> +
> +  reg:
> +    description: Address range of the MTK SVS controller.

Drop. That doesn't really add anything.

> +    maxItems: 1
> +
> +  interrupts:
> +    description: IRQ for the MTK SVS controller.

Drop.

> +    maxItems: 1
> +
> +  clocks:
> +    description: Main clock for MTK SVS controller to work.

Drop, but you need:

maxItems: 1

> +
> +  clock-names:
> +    const: main
> +
> +  nvmem-cells:
> +    maxItems: 2
> +    description:
> +      Phandle to the calibration data provided by a nvmem device.

Drop.

> +
> +  nvmem-cell-names:
> +    items:
> +      - const: svs-calibration-data
> +      - const: t-calibration-data
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - nvmem-cells
> +  - nvmem-cell-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    svs: svs@1100b000 {
> +        compatible = "mediatek,mt8183-svs";
> +        reg = <0 0x1100b000 0 0x1000>;
> +        interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&infracfg CLK_INFRA_THERM>;
> +        clock-names = "main";
> +        nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
> +        nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
> +    };
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
