Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5E5C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 20:43:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B77564FC0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 20:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B77564FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o6sLqkJnLSleYQDifqZcTMF4mq14mKwg5EGp1FEYjv8=; b=h6v/3sdvBgl5jl5J/sYIHNnNv
	MIsmwIRzap8dRIpqX+E0GfhfHpGElDRmhT3e/9MTGULrTsB48wW8samDCdA4g+1pe5juOVG50LICd
	A1+Qs/xUaJrCtmmJI0TFmb/n6Vt+1WnhUzOOoDXNgTksiMV6mpmY6vCcTkOCD8kDVtcl/2Kwwpxr/
	YHw6gfg6x56R7kAcUC/geZx5Mnn4ET5+xX0rtFBMyl+DQfIcbgpV/j8BQlWE6SArnDOtTDOMMufQI
	C2lMN1kEvZ/tM5k7bMfnk4fl8+7VB6AMlgSdraC4aeiBPKhHMGkMrwXv+Z/F7UIEmYQYtvQ3idH0m
	iMEQej1Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l87wg-000728-W0; Fri, 05 Feb 2021 20:43:15 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l87wc-00071H-0C; Fri, 05 Feb 2021 20:43:11 +0000
Received: by mail-oi1-f173.google.com with SMTP id j25so8932418oii.0;
 Fri, 05 Feb 2021 12:43:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=afmn48XmJAf5UHtknLL+vZ43WdJumPw28Jtuqw8EJAI=;
 b=KCuNoa49kOWoBbFn1meioM1TNwfnfP0BEVZ8nPK3dRpQQlX4Rnq4YPoRriQPad4ymv
 ga4YTyAoGoBjqdyPgdOI1b/wruE611V6IJQ6EgtStueesLOhXg2zeAPxqR/pFCQrMD3k
 yzUB+Djg7V5rQhFjIuYUgLXmxl/Vo48PqtqfPPy5OrB3osfxHmAYQWioeoEE0p4WBk/I
 O933uy7lXFNM4psLFAqoUgWLqQp6mhPgLHWQvnP0wcR8d8z9+QKHTGCptGEN4ERxqUah
 O0wH+Y9RJ/4grz1uOjezDcLjpNMVgkJSKWM7NPZ/SnMfvqfULAePOm01u/QGg1RrJpvv
 dLqA==
X-Gm-Message-State: AOAM531A4xJ0VI2hSbyJiLbSti+As9B5AlFYfPNFzWMThiiZZsXTltY9
 MByvMuX+sO1QIibWgujo8Q==
X-Google-Smtp-Source: ABdhPJwyCaAFj5u9ICufn3AaMqQoT2FLq45wljxNPZVfVlhr1bm4C38Uek+pFLCPFShGkrSA6BtPaw==
X-Received: by 2002:aca:4e13:: with SMTP id c19mr4336663oib.66.1612557789168; 
 Fri, 05 Feb 2021 12:43:09 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a188sm2013782oif.11.2021.02.05.12.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 12:43:08 -0800 (PST)
Received: (nullmailer pid 3696812 invoked by uid 1000);
 Fri, 05 Feb 2021 20:43:06 -0000
Date: Fri, 5 Feb 2021 14:43:06 -0600
From: Rob Herring <robh@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH V8 01/12] dt-bindings: soc: Add dvfsrc driver bindings
Message-ID: <20210205204306.GA3692875@robh.at.kernel.org>
References: <1611648234-15043-1-git-send-email-henryc.chen@mediatek.com>
 <1611648234-15043-2-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611648234-15043-2-git-send-email-henryc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_154310_116049_FA56DABA 
X-CRM114-Status: GOOD (  21.01  )
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
 James Liao <jamesjj.liao@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 Ryan Case <ryandcase@chromium.org>, Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 26, 2021 at 04:03:43PM +0800, Henry Chen wrote:
> Document the binding for enabling dvfsrc on MediaTek SoC.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   | 67 ++++++++++++++++++++++
>  include/dt-bindings/interconnect/mtk,mt8183-emi.h  | 21 +++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
>  create mode 100644 include/dt-bindings/interconnect/mtk,mt8183-emi.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
> new file mode 100644
> index 0000000..0b746a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/mediatek/dvfsrc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek dynamic voltage and frequency scaling resource collector (DVFSRC)
> +
> +description: |
> +  The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) is a
> +  HW module which is used to collect all the requests from both software and
> +  hardware and turn into the decision of minimum operating voltage and minimum
> +  DRAM frequency to fulfill those requests.
> +
> +maintainers:
> +  - henryc.chen <henryc.chen@mediatek.com>
> +
> +properties:
> +  reg:
> +    description: DVFSRC common register address and length.

maxItems: 1

> +
> +  compatible:
> +    enum:
> +      - mediatek,mt6873-dvfsrc
> +      - mediatek,mt8183-dvfsrc
> +      - mediatek,mt8192-dvfsrc
> +
> +  '#interconnect-cells':
> +    const: 1
> +
> +patternProperties:
> +  dvfsrc-vcore:

Not a pattern. Move to 'properties'.

> +    type: object
> +    description:
> +      The DVFSRC regulator is modelled as a subdevice of the DVFSRC.
> +      Because DVFSRC can request power directly via register read/write, likes
> +      vcore which is a core power of mt8183. As such, the DVFSRC regulator
> +      requires that DVFSRC nodes be present.
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#interconnect-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interconnect/mtk,mt8183-emi.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        dvfsrc@10012000 {
> +            compatible = "mediatek,mt8183-dvfsrc";
> +            reg = <0 0x10012000 0 0x1000>;
> +            #interconnect-cells = <1>;
> +            dvfsrc_vcore: dvfsrc-vcore {
> +                    regulator-name = "dvfsrc-vcore";
> +                    regulator-min-microvolt = <725000>;
> +                    regulator-max-microvolt = <800000>;
> +                    regulator-always-on;
> +            };
> +        };
> +    };
> diff --git a/include/dt-bindings/interconnect/mtk,mt8183-emi.h b/include/dt-bindings/interconnect/mtk,mt8183-emi.h
> new file mode 100644
> index 0000000..dfd143f
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/mtk,mt8183-emi.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef __DT_BINDINGS_INTERCONNECT_MTK_MT8183_EMI_H
> +#define __DT_BINDINGS_INTERCONNECT_MTK_MT8183_EMI_H
> +
> +#define MT8183_SLAVE_DDR_EMI			0
> +#define MT8183_MASTER_MCUSYS			1
> +#define MT8183_MASTER_GPU			2
> +#define MT8183_MASTER_MMSYS			3
> +#define MT8183_MASTER_MM_VPU			4
> +#define MT8183_MASTER_MM_DISP			5
> +#define MT8183_MASTER_MM_VDEC			6
> +#define MT8183_MASTER_MM_VENC			7
> +#define MT8183_MASTER_MM_CAM			8
> +#define MT8183_MASTER_MM_IMG			9
> +#define MT8183_MASTER_MM_MDP			10
> +
> +#endif
> -- 
> 1.9.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
