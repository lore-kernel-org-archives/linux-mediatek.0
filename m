Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BF1C47423
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 11:04:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC2C20708
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 11:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NYxCNIHE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EC2C20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5/+uV0frz0SXpvftdNtWrP0RVJfnbskwqbf+wO1zm4c=; b=NYxCNIHEgQUp11g6bkc+TMdNx
	HdfhzeNTuXYymn9I7WEJO2PHAS9uiHmC7l5vlFOLQlc8tSJh/ZT5QSvlr6042I9L/k6bUMAPC3RDu
	7EfyksbMj3g5TthRAV98zJblokD9HjA7QJWWkoMc5voyBNnTRsBiOA9T7qsuWcfxPfbzJn0NYZAlA
	0Bm9OsCLfF1jq+/bljVsIQXKRseoGji4jVAcKzF51opBkWd5tFBSoatem3Dzv2XJF4BdR9iAlbuvl
	4nPE2fyktNGECGAQ4rpbesk4vyRZCWXSg3+VVlz2+4aqFZLO6FwvXjDaIDtZU8OB0GTzRdNRcvG1u
	wHzCr09GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOIrX-0008Aj-9e; Fri, 02 Oct 2020 11:04:31 +0000
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOIrV-00089s-9p; Fri, 02 Oct 2020 11:04:30 +0000
Received: by mail-ej1-f66.google.com with SMTP id c22so29038ejx.0;
 Fri, 02 Oct 2020 04:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=56tAhYBdNf3KNX8Oab3+P5svy0t0kpZJMlSJZcWZN34=;
 b=RJzTXW47V6Rlgzgu7QlPImLr4REmyeCuumtOsRg5VrhwDaE+eAsEQFIArNUrdTb5Qb
 4mxyfqp0vX4iGvTlsrTo59PNGUs8NZ8HYpwdxzHl0VqG76AZCp+uiDjFuyrDmiZhC0+t
 nwisO9IqsBXDFhmyIkpEdp/cauLsczN0wtNpmygLDh99Ymk9T5Old2QXal7SvCunPoyc
 oYnB+S0CIv8oEpOhSLFAy1Sz6HAXU+38Bkv97a2T8tawRmSSdAI//fXbj+ytgX8nFqwT
 1xHhbIBcYcdikMyK+4/S4wKCcRtLG7JuesedIMMh734g8pQGJbZMBDPQETn9RKzhmg7l
 blpQ==
X-Gm-Message-State: AOAM5336cuaei7W0ax4irrT4zhTUnpQ5wI/WXzTeRVQW6Kge1zc7a2xF
 ZsQLng8Eq6BcQ2/MgRhyuaQ=
X-Google-Smtp-Source: ABdhPJz8JVKuuqO6jwLTNtxzltCz4QZ0ABVNv87BKmR6ouVGmjyGL9JMc7xLOHcn7riQZyRBrmknaQ==
X-Received: by 2002:a17:906:a4e:: with SMTP id
 x14mr1659945ejf.112.1601636666973; 
 Fri, 02 Oct 2020 04:04:26 -0700 (PDT)
Received: from pi3 ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id g11sm936712edj.85.2020.10.02.04.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 04:04:26 -0700 (PDT)
Date: Fri, 2 Oct 2020 13:04:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 02/24] dt-bindings: memory: mediatek: Convert SMI to
 DT schema
Message-ID: <20201002110423.GB6888@pi3>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_070429_364330_A375632E 
X-CRM114-Status: GOOD (  29.51  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 03:06:25PM +0800, Yong Wu wrote:
> Convert MediaTek SMI to DT schema.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../mediatek,smi-common.txt                   |  49 ---------
>  .../mediatek,smi-common.yaml                  | 100 ++++++++++++++++++
>  .../memory-controllers/mediatek,smi-larb.txt  |  49 ---------
>  .../memory-controllers/mediatek,smi-larb.yaml |  91 ++++++++++++++++
>  4 files changed, 191 insertions(+), 98 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> deleted file mode 100644
> index b64573680b42..000000000000
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -SMI (Smart Multimedia Interface) Common
> -
> -The hardware block diagram please check bindings/iommu/mediatek,iommu.txt
> -
> -Mediatek SMI have two generations of HW architecture, here is the list
> -which generation the SoCs use:
> -generation 1: mt2701 and mt7623.
> -generation 2: mt2712, mt6779, mt8173 and mt8183.
> -
> -There's slight differences between the two SMI, for generation 2, the
> -register which control the iommu port is at each larb's register base. But
> -for generation 1, the register is at smi ao base(smi always on register
> -base). Besides that, the smi async clock should be prepared and enabled for
> -SMI generation 1 to transform the smi clock into emi clock domain, but that is
> -not needed for SMI generation 2.
> -
> -Required properties:
> -- compatible : must be one of :
> -	"mediatek,mt2701-smi-common"
> -	"mediatek,mt2712-smi-common"
> -	"mediatek,mt6779-smi-common"
> -	"mediatek,mt7623-smi-common", "mediatek,mt2701-smi-common"
> -	"mediatek,mt8173-smi-common"
> -	"mediatek,mt8183-smi-common"
> -- reg : the register and size of the SMI block.
> -- power-domains : a phandle to the power domain of this local arbiter.
> -- clocks : Must contain an entry for each entry in clock-names.
> -- clock-names : must contain 3 entries for generation 1 smi HW and 2 entries
> -  for generation 2 smi HW as follows:
> -  - "apb" : Advanced Peripheral Bus clock, It's the clock for setting
> -	    the register.
> -  - "smi" : It's the clock for transfer data and command.
> -	    They may be the same if both source clocks are the same.
> -  - "async" : asynchronous clock, it help transform the smi clock into the emi
> -	      clock domain, this clock is only needed by generation 1 smi HW.
> -  and these 2 option clocks for generation 2 smi HW:
> -  - "gals0": the path0 clock of GALS(Global Async Local Sync).
> -  - "gals1": the path1 clock of GALS(Global Async Local Sync).
> -  Here is the list which has this GALS: mt6779 and mt8183.
> -
> -Example:
> -	smi_common: smi@14022000 {
> -		compatible = "mediatek,mt8173-smi-common";
> -		reg = <0 0x14022000 0 0x1000>;
> -		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> -		clocks = <&mmsys CLK_MM_SMI_COMMON>,
> -			 <&mmsys CLK_MM_SMI_COMMON>;
> -		clock-names = "apb", "smi";
> -	};
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> new file mode 100644
> index 000000000000..76ecc7205438
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

You relicense existing GPLv2 work. Please CC all contributors and
collect their acks/SoB.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SMI (Smart Multimedia Interface) Common
> +
> +maintainers:
> +  - Yong Wu <yong.wu@mediatek.com>
> +
> +description: |+
> +  The hardware block diagram please check bindings/iommu/mediatek,iommu.yaml
> +
> +  MediaTek SMI have two generations of HW architecture, here is the list
> +  which generation the SoCs use:
> +  generation 1: mt2701 and mt7623.
> +  generation 2: mt2712, mt6779, mt8173 and mt8183.
> +
> +  There's slight differences between the two SMI, for generation 2, the
> +  register which control the iommu port is at each larb's register base. But
> +  for generation 1, the register is at smi ao base(smi always on register
> +  base). Besides that, the smi async clock should be prepared and enabled for
> +  SMI generation 1 to transform the smi clock into emi clock domain, but that is
> +  not needed for SMI generation 2.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-smi-common
> +          - mediatek,mt2712-smi-common
> +          - mediatek,mt6779-smi-common
> +          - mediatek,mt8173-smi-common
> +          - mediatek,mt8183-smi-common
> +
> +      - description: for mt7623
> +        items:
> +          - const: mediatek,mt7623-smi-common
> +          - const: mediatek,mt2701-smi-common
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      apb and smi are mandatory. the async is only for generation 1 smi HW.
> +      gals(global async local sync) also is optional, here is the list which
> +      require gals: mt6779 and mt8183.
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - description: apb is Advanced Peripheral Bus clock, It's the clock for
> +          setting the register.
> +      - description: smi is the clock for transfer data and command.
> +      - description: async is asynchronous clock, it help transform the smi clock
> +          into the emi clock domain.
> +      - description: gals0 is the path0 clock of gals.
> +      - description: gals1 is the path1 clock of gals.

You put here five items, but max are four. Does it really work as
intended?

> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: apb
> +          - const: smi
> +      - items:
> +          - const: apb
> +          - const: smi
> +          - const: async
> +      - items:
> +          - const: apb
> +          - const: smi
> +          - const: gals0
> +          - const: gals1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +
> +    smi_common: smi@14022000 {
> +            compatible = "mediatek,mt8173-smi-common";
> +            reg = <0x14022000 0x1000>;
> +            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> +            clocks = <&mmsys CLK_MM_SMI_COMMON>,
> +                     <&mmsys CLK_MM_SMI_COMMON>;
> +            clock-names = "apb", "smi";
> +    };
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> deleted file mode 100644
> index 8f19dfe7d80e..000000000000
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -SMI (Smart Multimedia Interface) Local Arbiter
> -
> -The hardware block diagram please check bindings/iommu/mediatek,iommu.txt
> -
> -Required properties:
> -- compatible : must be one of :
> -		"mediatek,mt2701-smi-larb"
> -		"mediatek,mt2712-smi-larb"
> -		"mediatek,mt6779-smi-larb"
> -		"mediatek,mt7623-smi-larb", "mediatek,mt2701-smi-larb"
> -		"mediatek,mt8173-smi-larb"
> -		"mediatek,mt8183-smi-larb"
> -- reg : the register and size of this local arbiter.
> -- mediatek,smi : a phandle to the smi_common node.
> -- power-domains : a phandle to the power domain of this local arbiter.
> -- clocks : Must contain an entry for each entry in clock-names.
> -- clock-names: must contain 2 entries, as follows:
> -  - "apb" : Advanced Peripheral Bus clock, It's the clock for setting
> -	    the register.
> -  - "smi" : It's the clock for transfer data and command.
> -  and this optional clock name:
> -  - "gals": the clock for GALS(Global Async Local Sync).
> -  Here is the list which has this GALS: mt8183.
> -
> -Required property for mt2701, mt2712, mt6779 and mt7623:
> -- mediatek,larb-id :the hardware id of this larb.
> -
> -Example:
> -	larb1: larb@16010000 {
> -		compatible = "mediatek,mt8173-smi-larb";
> -		reg = <0 0x16010000 0 0x1000>;
> -		mediatek,smi = <&smi_common>;
> -		power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
> -		clocks = <&vdecsys CLK_VDEC_CKEN>,
> -			 <&vdecsys CLK_VDEC_LARB_CKEN>;
> -		clock-names = "apb", "smi";
> -	};
> -
> -Example for mt2701:
> -	larb0: larb@14010000 {
> -		compatible = "mediatek,mt2701-smi-larb";
> -		reg = <0 0x14010000 0 0x1000>;
> -		mediatek,smi = <&smi_common>;
> -		mediatek,larb-id = <0>;
> -		clocks = <&mmsys CLK_MM_SMI_LARB0>,
> -			 <&mmsys CLK_MM_SMI_LARB0>;
> -		clock-names = "apb", "smi";
> -		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
> -	};
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> new file mode 100644
> index 000000000000..50793a0e6759
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

The same - you need to collect licensing change agreements.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SMI (Smart Multimedia Interface) Local Arbiter
> +
> +maintainers:
> +  - Yong Wu <yong.wu@mediatek.com>
> +
> +description: |+
> +  The hardware block diagram please check bindings/iommu/mediatek,iommu.yaml
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-smi-larb
> +          - mediatek,mt2712-smi-larb
> +          - mediatek,mt6779-smi-larb
> +          - mediatek,mt8173-smi-larb
> +          - mediatek,mt8183-smi-larb
> +
> +      - description: for mt7623
> +        items:
> +          - const: mediatek,mt7623-smi-larb
> +          - const: mediatek,mt2701-smi-larb
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      apb and smi are mandatory. gals(global async local sync) is optional,
> +      here is the list which require gals: mt8183.
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +       - description: apb is Advanced Peripheral Bus clock, It's the clock for
> +           setting the register.
> +       - description: smi is the clock for transfer data and command.
> +       - description: the clock for gals.
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +         - const: apb
> +         - const: smi
> +      - items:
> +         - const: apb
> +         - const: smi
> +         - const: gals
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mediatek,smi:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: a phandle to the smi_common node.
> +
> +  mediatek,larb-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description: the hardware id of this larb.
> +      Required property for mt2701, mt2712, mt6779 and mt7623.

You need if-then-required for this. See
Documentation/devicetree/bindings/example-schema.yaml for example.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
