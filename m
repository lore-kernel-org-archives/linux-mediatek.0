Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1286EECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wM4Vw2+6axRvXSbyEhTxGQ1M8jgYDY7F1JmeCqi4DtA=; b=GXJfaJmGMQP36DglebHSxHwIbb
	MCY+CywxwxvmASSSUfZV4/hfDALUZD6Fl/OKy+wzPqwSn0aKejoO6Q2tufBHeU0NTE+/5mS023MwO
	mvAS2ALjQ1qcACGEHP5a9K2je4h1WXdZLh3jKL6RhKVUx5RJqgO/7IZzhXCi5lzLksEVc70w6z989
	3I5ZIJ4nl4g5hieFw+jmwau6xijv+jbF31Ji56+Jbvc/Cvnm8jJV01aWjfefLaCt2cMyG0Ry9lq2s
	znHHE4V0kpc/FipwJ0B6rtSe2LPDIghptVJHUn5RzVnVfNPx+NZFfV/Ap7YijMvC4MPzgpbgCV3gR
	xVcAIE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3Ca-00DfDX-My; Thu, 27 Oct 2022 13:45:44 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo39U-00DdUr-Bd
	for linux-mediatek@lists.infradead.org; Thu, 27 Oct 2022 13:42:34 +0000
Received: by mail-qk1-x72a.google.com with SMTP id f8so885215qkg.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Oct 2022 06:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wM4Vw2+6axRvXSbyEhTxGQ1M8jgYDY7F1JmeCqi4DtA=;
        b=Qfmd16a8rPHB6gP9KngqB+MAJCh40aoEVl+VKG4LpOIsMyTMaJ6kekLbXfGHrYzmHh
         KP7sZEmrYaQ1YbQmwiphZcVbt41l5UarqZdInVDlS68bXkj5d7nhTshuUWSj+G6QG5mG
         KLIqEEExuoPrM6DYxSsdUosuaPcGKko102+WOCVQjFnND6Sdk+Bu1IFmYdCym3i8SBsq
         /UGu0KmViUYC68f1T1aFCvBIIIGsZKsGnny8W8IFbVCC59KDbKps8lzJafe8vieLSsBf
         GcELwM40nNCymCIr9DTqE8+EfP9CJavpm1s5zuq9IHWnL6+dzwXjAoogWOiblGBnUzJY
         bEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wM4Vw2+6axRvXSbyEhTxGQ1M8jgYDY7F1JmeCqi4DtA=;
        b=qXCPbKVSSMySOU+ObvwZPKFswCAJbRJQCZDVhO350MRxGcwRRl3rg5bpLALJlzppmT
         mlGfO9qAFgamqhfFHUrLDIihkkYlqhwWywotGRkycwZsXYy/++zy27w+x6V/tiUTf1LL
         hKbCBTRWj2hUA8J1HxkWv4Nx5+iBq6A7Gsp/jm0duxv730bDM2414PMvyA6TJmda31Lj
         pJqO3WwXjtiwP5Erg7RMDT8WI6Fnu4Vb4/X88j8f/i0VutjB5m0euS0dc5JVUyl0xNmQ
         gMq8ELzV/QtggTVi06Y5Au1wA6dgbw0amfz+rkwzh/YQjmE8vwJBQGFvhOcfY5NA9eaa
         zQuA==
X-Gm-Message-State: ACrzQf0UAU9WxaNj3JLaAFct+VPLRUb5CjCbU/2o7qRSjQr7SAUkGAFj
	CConkz0vTrYXNvycSwW2ekwgYQ==
X-Google-Smtp-Source: AMsMyM44mwyfkNK9FKOzm1Oey82nDiu8X5Aw1J4Tb80n2Y//lc1hB0Auwc45uma1QaXmEIeuuzdP9A==
X-Received: by 2002:a37:98c2:0:b0:6f8:6a62:a195 with SMTP id a185-20020a3798c2000000b006f86a62a195mr8265251qke.245.1666878150053;
        Thu, 27 Oct 2022 06:42:30 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id q11-20020a37f70b000000b006ce0733caebsm995698qkj.14.2022.10.27.06.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:42:29 -0700 (PDT)
Message-ID: <9092152a-35c9-1f80-8674-ea4124a1bb36@linaro.org>
Date: Thu, 27 Oct 2022 09:42:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 01/19] dt-bindings: ARM: MediaTek: Add new document
 bindings of MT8188 clock
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221024094254.29218-1-Garmin.Chang@mediatek.com>
 <20221024094254.29218-2-Garmin.Chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024094254.29218-2-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_064232_422663_F5265F28 
X-CRM114-Status: GOOD (  17.42  )
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

On 24/10/2022 05:42, Garmin.Chang wrote:
> Add the new binding documentation for system clock
> and functional clock on MediaTek MT8188.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8188-clock.yaml   |  70 ++
>  .../mediatek/mediatek,mt8188-sys-clock.yaml   |  55 ++
>  .../dt-bindings/clock/mediatek,mt8188-clk.h   | 733 ++++++++++++++++++
>  3 files changed, 858 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mediatek,mt8188-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml
> new file mode 100644
> index 000000000000..49dc681e6601
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8188-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
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
> +    enum:
> +      - mediatek,mt8188-adsp_audio26m

No underscores in compatibles.

> +      - mediatek,mt8188-imp_iic_wrap_c
> +      - mediatek,mt8188-imp_iic_wrap_en
> +      - mediatek,mt8188-imp_iic_wrap_w
> +      - mediatek,mt8188-mfgcfg
> +      - mediatek,mt8188-vppsys0
> +      - mediatek,mt8188-wpesys
> +      - mediatek,mt8188-wpesys_vpp0
> +      - mediatek,mt8188-vppsys1
> +      - mediatek,mt8188-imgsys
> +      - mediatek,mt8188-imgsys_wpe1
> +      - mediatek,mt8188-imgsys_wpe2
> +      - mediatek,mt8188-imgsys_wpe3
> +      - mediatek,mt8188-imgsys1_dip_top
> +      - mediatek,mt8188-imgsys1_dip_nr
> +      - mediatek,mt8188-ipesys
> +      - mediatek,mt8188-camsys
> +      - mediatek,mt8188-camsys_rawa
> +      - mediatek,mt8188-camsys_yuva
> +      - mediatek,mt8188-camsys_rawb
> +      - mediatek,mt8188-camsys_yuvb
> +      - mediatek,mt8188-ccusys
> +      - mediatek,mt8188-vdecsys_soc
> +      - mediatek,mt8188-vdecsys
> +      - mediatek,mt8188-vencsys

Blank line here

> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    imp_iic_wrap_c: clock-controller@11283000 {

Drop the label, not used,

> +        compatible = "mediatek,mt8188-imp_iic_wrap_c";
> +        reg = <0x11283000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml
> new file mode 100644
> index 000000000000..35962b3746e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8188-sys-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek System Clock Controller for MT8188
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
> +  The apmixedsys provides most of PLLs which generated from SoC 26m.
> +  The topckgen provides dividers and muxes which provide the clock source to other IP blocks.
> +  The infracfg_ao provides clock gate in peripheral and infrastructure IP blocks.
> +  The mcusys provides mux control to select the clock source in AP MCU.
> +  The device nodes also provide the system control capacity for configuration.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8188-topckgen
> +          - mediatek,mt8188-infracfg_ao

Same comment.

> +          - mediatek,mt8188-apmixedsys
> +          - mediatek,mt8188-pericfg_ao
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    topckgen: syscon@10000000 {

Drop label.

> +        compatible = "mediatek,mt8188-topckgen", "syscon";
> +        reg = <0x10000000 0x1000>;
> +        #clock-cells = <1>;
Best regards,
Krzysztof


