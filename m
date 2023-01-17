Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFD8C63797
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 11:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vF3QjaM7bROJjvJo2a/mn+CmXlw/84X7LZJ02v/ABAU=; b=cG1cMYr8zS+aeec8GNu0dCNIcA
	Qh4vd5cH9tKutoR5KTbC32mLDMjLrp1izsFIJKB2oPQOibbWK8j8EDrgxGZsVKcmAAiSJ/YWzVb4x
	6z1FE6pSM2Wwz0P/X4xYQuCavtBs1uTFO46aDB/hGYJDbb6rz7tK522pnropGNrcafam/v8d8xceI
	+RniByY3O6bFShvMy4QS2Qwz0veOs4rsir3U2pk2pjaA0UURXtixgLRYBHyB0wHIqmeFIezaJgeJL
	/6C6Y4vRNJZjpmAkUNEU4PtiRLPHHmK2r/0gMKM32Qavu2iozXJJn2NtYvyIvtONlM/4EoQWyBUPr
	sSmU3xDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkJa-00E42J-JW; Tue, 17 Jan 2023 11:39:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkJP-00E408-DO
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 11:39:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id e3so21045779wru.13
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jan 2023 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vF3QjaM7bROJjvJo2a/mn+CmXlw/84X7LZJ02v/ABAU=;
        b=zLKBoIKI1X1tbKr4R/cZoQ7RMIGw8APCZhFTXrfz4YG7Gl5o99Y2nFQ6WoJk7DMG/3
         yzzPBZIZ9K9Fuw2Ba+q7I3dUgVF8u14QN683j5+7pd3L1DnI4tNLzyF+Rq/viGT8TwBr
         w8+2O3c+A9vkyf4Xh3VbrlCLVsDkDky8G6e1EtamptWw/sOAL/7jK3cxF20PpZQOrM+i
         I0UibyUBGThQVEWaCHoOGrcuKXPzUSCaRTz1lfZdcWdUjCP43hjGHM01og21Q597wW9h
         CCWv/qzbSM3Y+BflWlJgMyAFDUYzZYscvA9hEDk2hCmVow5TiANBZ28vQn1ozYo+ji8H
         BMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vF3QjaM7bROJjvJo2a/mn+CmXlw/84X7LZJ02v/ABAU=;
        b=6eNycLxiHDi7djWq8RoQz4Tjap1sUrMIked2j0S6x7V4O9ZrnfABVYuCtRi1WwYe4C
         /z5WMG8Q4K+IhTdD9iZ0g28/atraSvE8FuP3jwmdoNU3PgfhIMGZDGqm0dg1eYA0t4tR
         KOmsVtyDj7qYXQenxKA+bq7QdYr6Z+nEqdNgD+5UysZjRhFpvK+eB8rN11lrASIUcAPS
         t2UnExpr8PlndbySWsBY4UqCv2IH0G4uJLisrB3GK1R1WF4AD+eZfTYDDQOCtEfK0S9f
         7zCs0a3s1ZC2syK/M2WqRM5Gcn7XfDIMVLuwFYezK0YcIsMZXZgryNi33fVLdfdJJ87X
         l6TQ==
X-Gm-Message-State: AFqh2kpPUGcp1afHD9bpB8MImwR6YUcSZhRPNsXtoPbpGXg6PL0wfCVO
	7WFaHsgKGZGVspcQXjhl0dGVTw==
X-Google-Smtp-Source: AMrXdXuCkpdLgZ/1mIa89YtmyXjuzTAlZJrLeKfPOg30l2hHTbnVlkY+nMfI32aoJYuG8fprjU9EAg==
X-Received: by 2002:adf:f78d:0:b0:2bd:bed5:9207 with SMTP id q13-20020adff78d000000b002bdbed59207mr2498792wrp.12.1673955567741;
        Tue, 17 Jan 2023 03:39:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u24-20020adfa198000000b002bc84c55758sm24641864wru.63.2023.01.17.03.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:39:26 -0800 (PST)
Message-ID: <9c11bf53-6639-2cbe-0d27-ce1ea154f576@linaro.org>
Date: Tue, 17 Jan 2023 12:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/19] dt-bindings: ARM: MediaTek: Add new MT8188 clock
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
 <20230109124516.31425-2-Garmin.Chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109124516.31425-2-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_033931_494350_DE40888F 
X-CRM114-Status: GOOD (  18.57  )
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

On 09/01/2023 13:44, Garmin.Chang wrote:
> Add the new binding documentation for system clock
> and functional clock on MediaTek MT8188.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  .../bindings/clock/mediatek,mt8188-clock.yaml |  71 ++
>  .../clock/mediatek,mt8188-sys-clock.yaml      |  55 ++
>  .../dt-bindings/clock/mediatek,mt8188-clk.h   | 733 ++++++++++++++++++
>  3 files changed, 859 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mediatek,mt8188-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> new file mode 100644
> index 000000000000..6654cead71f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> @@ -0,0 +1,71 @@
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
> +      - mediatek,mt8188-adsp-audio26m
> +      - mediatek,mt8188-imp-iic-wrap-c
> +      - mediatek,mt8188-imp-iic-wrap-en
> +      - mediatek,mt8188-imp-iic-wrap-w
> +      - mediatek,mt8188-mfgcfg
> +      - mediatek,mt8188-vppsys0
> +      - mediatek,mt8188-wpesys
> +      - mediatek,mt8188-wpesys-vpp0
> +      - mediatek,mt8188-vppsys1
> +      - mediatek,mt8188-imgsys
> +      - mediatek,mt8188-imgsys-wpe1
> +      - mediatek,mt8188-imgsys-wpe2
> +      - mediatek,mt8188-imgsys-wpe3
> +      - mediatek,mt8188-imgsys1-dip-top
> +      - mediatek,mt8188-imgsys1-dip-nr
> +      - mediatek,mt8188-ipesys
> +      - mediatek,mt8188-camsys
> +      - mediatek,mt8188-camsys-rawa
> +      - mediatek,mt8188-camsys-yuva
> +      - mediatek,mt8188-camsys-rawb
> +      - mediatek,mt8188-camsys-yuvb
> +      - mediatek,mt8188-ccusys
> +      - mediatek,mt8188-vdecsys-soc
> +      - mediatek,mt8188-vdecsys
> +      - mediatek,mt8188-vencsys

The list should be ordered by name.

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
> +    clock-controller@11283000 {
> +        compatible = "mediatek,mt8188-imp-iic-wrap-c";
> +        reg = <0x11283000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
> new file mode 100644
> index 000000000000..541e0f7df79f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
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
> +          - mediatek,mt8188-infracfg-ao
> +          - mediatek,mt8188-apmixedsys
> +          - mediatek,mt8188-pericfg-ao

Ditto


Best regards,
Krzysztof


