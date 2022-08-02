Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75866C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 07:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oRjg383AuMEECHdqgVtY2EGSfna424Xor82ppk23kw=; b=YR0zKhCyEheEIxYyf0KN+0dIBz
	nqmdr6shV1B82uQKbvzJFr/rqhY2IEeAUknhlIh66oR8pa11iGadGlakNCFMj6FCjPQxgibBmFx02
	sDPWk8hVZbT/PmxZXitu7aCqqHe+dn7RlmQzu86/A/kPVF0U/EfJ+Ls45octx6P4kAlnDSa2HVR5H
	/ea23MVT6PO5wNDDI1ekqMnawHuvz34ue6MbvnriY5oTS64R6qtf7HWw1D7rTPwKA3t3eRK2BLofy
	aJA/81jLSbkQxg5iNUFyy3atcK+z2cbIRf6YZHlVZZ+OS2h/wDz+Siaf6Y1JgpXBQPwifkcQ+9kP6
	yG/2SW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImNv-00BMmc-3L; Tue, 02 Aug 2022 07:32:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImNh-00BMea-Qy
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 07:31:59 +0000
Received: by mail-lf1-x12a.google.com with SMTP id t1so20715419lft.8
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8oRjg383AuMEECHdqgVtY2EGSfna424Xor82ppk23kw=;
        b=Nwl3CjMQ/cyPMnjEXbFk+1RX2MyKMBoF2JTeAM1+rTMu32dDInKuUeLZNt/dOg1vJb
         6rBsFsBmv+05/LXRHaxil7qzyPFPVl1wIa9HGESd7wQnLGwbAh81tO/WRmzgX9OE5/bQ
         QYd9yVO6O47XN0GpwHA5QZUEJzyrFl/0xW08dj7nUqydOc+L+PCsieI7y/DfK3NCRewf
         WWUWsgSCkmBOtkIDILBENuPN3XCLCGJ3Tu5dTocrFNTWp01pCseM4ZUJA5VuZcO1gbaA
         gA39Ca4aUx2SaGeFwrAu3fndwcR3j/amAB+a2D+jHdI7nUmgwAsfRcPZMrtTlAiMpU+T
         Athg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8oRjg383AuMEECHdqgVtY2EGSfna424Xor82ppk23kw=;
        b=5QNXBDWHN+gs3hzwyTpeFtPB83cq2nZugS9s+6E6798Kgi1zWG8Ds4CeIbyMuIx87u
         16imjhGN3xE+ho4vu2uLcD6AwCNng6/ihZL1T91YxbylFRarFpil0yDLw6GWV0/9Mkv3
         ed/hPZQd19Y6xpWcsAly402djfrAv4tZVUC97d94GuRFFH5E5bIRDKkspKXcBUodpNaH
         wZ35meEou+6PpArqh+7hdi2AHaFCz6Mlx2+qiqap/Gu/xTOLAzXzAXuVZFkGtBf07x9X
         Aq33bVeW36jP2OgvxDNs44f9bLL6a/zxV3KBPwBTIuprqqEJmkXAxEBSiIewdyYZsMzL
         cUTQ==
X-Gm-Message-State: AJIora/T1RRPVZruEF3mJLDqqhmMAZM1ENPaaejFvBbv1nkPl2W7rd34
	zcm2/PembKbf+hulvZu72cqLLA==
X-Google-Smtp-Source: AGRyM1u731u5pHQTprUO1sPhY+QeGHFMv+PB/meb2qiTyxSe0gjAw6oYbDsZc5+4xb6uaD11wTTWLQ==
X-Received: by 2002:a05:6512:2303:b0:48a:84ea:b003 with SMTP id o3-20020a056512230300b0048a84eab003mr6533923lfu.681.1659425514926;
        Tue, 02 Aug 2022 00:31:54 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id w14-20020a05651234ce00b0048b13d0b896sm39237lfr.141.2022.08.02.00.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 00:31:54 -0700 (PDT)
Message-ID: <e982588a-12bd-7ce6-91f4-e354ac5bec60@linaro.org>
Date: Tue, 2 Aug 2022 09:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 01/18] dt-bindings: ARM: MediaTek: Add new document
 bindings of MT8188 clock
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
 <20220729082457.22253-2-Garmin.Chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220729082457.22253-2-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_003157_886856_9FD573FA 
X-CRM114-Status: GOOD (  19.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 29/07/2022 10:24, Garmin.Chang wrote:
> Add the new binding documentation for system clock
> and functional clock on MediaTek MT8188.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8188-clock.yaml   | 230 ++++++
>  .../mediatek/mediatek,mt8188-sys-clock.yaml   |  75 ++
>  include/dt-bindings/clock/mt8188-clk.h        | 759 ++++++++++++++++++
>  3 files changed, 1064 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mt8188-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml
> new file mode 100644
> index 000000000000..b03745fe971a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml
> @@ -0,0 +1,230 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8188-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

No need for quotes.

> +
> +title: MediaTek Functional Clock Controller for MT8188
> +
> +maintainers:
> +  - Garmin Chang <garmin.chang@mediatek.com>
> +
> +description: |
> +  The clock architecture in MediaTek like below
> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The devices provide clock gate control in different IP blocks.
> +
> +properties:
> +  compatible:
> +    items:

You have just one item, so no "items".

> +      - enum:
> +          - mediatek,mt8188-imp_iic_wrap_c
> +          - mediatek,mt8188-imp_iic_wrap_en
> +          - mediatek,mt8188-imp_iic_wrap_w
> +          - mediatek,mt8188-mfgcfg
> +          - mediatek,mt8188-vppsys0
> +          - mediatek,mt8188-wpesys
> +          - mediatek,mt8188-wpesys_vpp0
> +          - mediatek,mt8188-vppsys1
> +          - mediatek,mt8188-imgsys
> +          - mediatek,mt8188-imgsys_wpe1
> +          - mediatek,mt8188-imgsys_wpe2
> +          - mediatek,mt8188-imgsys_wpe3
> +          - mediatek,mt8188-imgsys1_dip_top
> +          - mediatek,mt8188-imgsys1_dip_nr
> +          - mediatek,mt8188-ipesys
> +          - mediatek,mt8188-camsys
> +          - mediatek,mt8188-camsys_rawa
> +          - mediatek,mt8188-camsys_yuva
> +          - mediatek,mt8188-camsys_rawb
> +          - mediatek,mt8188-camsys_yuvb
> +          - mediatek,mt8188-ccusys
> +          - mediatek,mt8188-vdecsys_soc
> +          - mediatek,mt8188-vdecsys
> +          - mediatek,mt8188-vencsys
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg

clock-cells should be required as well.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    imp_iic_wrap_c: clock-controller@11283000 {
> +        compatible = "mediatek,mt8188-imp_iic_wrap_c";
> +        reg = <0x11283000 0x1000>;
> +        #clock-cells = <1>;
> +    };


Only one example is enough. All others are exactly the same.

> +
> +  - |
> +    imp_iic_wrap_en: clock-controller@11ec2000 {
> +        compatible = "mediatek,mt8188-imp_iic_wrap_en";
> +        reg = <0x11ec2000 0x1000>;
> +        #clock-cells = <1>;
> +    };


> +
> +  - |
> +    imp_iic_wrap_w: clock-controller@11e02000 {
> +        compatible = "mediatek,mt8188-imp_iic_wrap_w";
> +        reg = <0x11e02000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    mfgcfg: clock-controller@13fbf000 {
> +        compatible = "mediatek,mt8188-mfgcfg";
> +        reg = <0x13fbf000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vppsys0: clock-controller@14000000 {
> +        compatible = "mediatek,mt8188-vppsys0";
> +        reg = <0x14000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    wpesys: clock-controller@14e00000 {
> +        compatible = "mediatek,mt8188-wpesys";
> +        reg = <0x14e00000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    wpesys_vpp0: clock-controller@14e02000 {
> +        compatible = "mediatek,mt8188-wpesys_vpp0";
> +        reg = <0x14e02000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vppsys1: clock-controller@14f00000 {
> +        compatible = "mediatek,mt8188-vppsys1";
> +        reg = <0x14f00000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys: clock-controller@15000000 {
> +        compatible = "mediatek,mt8188-imgsys";
> +        reg = <0x15000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys_wpe1: clock-controller@15220000 {
> +        compatible = "mediatek,mt8188-imgsys_wpe1";
> +        reg = <0x15220000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys_wpe2: clock-controller@15520000 {
> +        compatible = "mediatek,mt8188-imgsys_wpe2";
> +        reg = <0x15520000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys_wpe3: clock-controller@15620000 {
> +        compatible = "mediatek,mt8188-imgsys_wpe3";
> +        reg = <0x15620000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys1_dip_top: clock-controller@15110000 {
> +        compatible = "mediatek,mt8188-imgsys1_dip_top";
> +        reg = <0x15110000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys1_dip_nr: clock-controller@15130000 {
> +        compatible = "mediatek,mt8188-imgsys1_dip_nr";
> +        reg = <0x15130000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    ipesys: clock-controller@15330000 {
> +        compatible = "mediatek,mt8188-ipesys";
> +        reg = <0x15330000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys: clock-controller@16000000 {
> +        compatible = "mediatek,mt8188-camsys";
> +        reg = <0x16000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_rawa: clock-controller@1604f000 {
> +        compatible = "mediatek,mt8188-camsys_rawa";
> +        reg = <0x1604f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_yuva: clock-controller@1606f000 {
> +        compatible = "mediatek,mt8188-camsys_yuva";
> +        reg = <0x1606f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_rawb: clock-controller@1608f000 {
> +        compatible = "mediatek,mt8188-camsys_rawb";
> +        reg = <0x1608f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_yuvb: clock-controller@160af000 {
> +        compatible = "mediatek,mt8188-camsys_yuvb";
> +        reg = <0x160af000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    ccusys: clock-controller@17200000 {
> +        compatible = "mediatek,mt8188-ccusys";
> +        reg = <0x17200000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vdecsys_soc: clock-controller@1800f000 {
> +        compatible = "mediatek,mt8188-vdecsys_soc";
> +        reg = <0x1800f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vdecsys: clock-controller@1802f000 {
> +        compatible = "mediatek,mt8188-vdecsys";
> +        reg = <0x1802f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vencsys: clock-controller@1a000000 {
> +        compatible = "mediatek,mt8188-vencsys";
> +        reg = <0x1a000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml
> new file mode 100644
> index 000000000000..b97cad03241c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8188-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

All previous comments apply here and further as well.

(...)

> diff --git a/include/dt-bindings/clock/mt8188-clk.h b/include/dt-bindings/clock/mt8188-clk.h
> new file mode 100644
> index 000000000000..bd1f21bd6584
> --- /dev/null
> +++ b/include/dt-bindings/clock/mt8188-clk.h

Filename with vendor prefix, so "mediatek,mt8188-clk.h"


Best regards,
Krzysztof

