Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE489C19F2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 08:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMC8RCpu0qhTOfuRRHUZUibf6qHpLgAB4jKyjb9VIkg=; b=MucUQ9QG6+bH4RKBGDwb0ZYHbT
	bC/2FP+j8+8tdQKwwiVpPjDulytnyRCa5EwNTcFgXHS5swBYly0lJRCKJ9ZA8rhTeS1G8NXKnF0QI
	x/348Jj1hbh5gxNfzQeD6tqSftwTOfvbz/24t1frrrXMvItmO2i7QHfmD6pM9d656AmJ2olRxFV5U
	tEmMI3/iBguTY6zb5RBHJ3+tQQsiCW2ivgq7O2PwUmaKJHqhHBFJCRu7WTOC1t8IA3FUhQYFQrZru
	8ES+MqcyQKyrTdGsQ05oT/+LtvJYJCds+eP5HkeIWechGIrVIAiVTjYIClR++0DTWISf17fSGu5Lw
	PGzy+cUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3tb-00ASOe-IG; Thu, 11 Aug 2022 08:50:27 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3tJ-00ASGY-Jj
	for linux-mediatek@lists.infradead.org; Thu, 11 Aug 2022 08:50:11 +0000
Received: by mail-lj1-x232.google.com with SMTP id x9so14932523ljj.13
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Aug 2022 01:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=HMC8RCpu0qhTOfuRRHUZUibf6qHpLgAB4jKyjb9VIkg=;
        b=mfykxIe7JfrCg9snqzG3K2cY2K4dsQVw8WHi8LImK05DNOaT6zuMUivNI4hBBZQcVs
         fdv1O+DIhC4BiF2KqOdqtP/dWDDZwutRjIr4j71hCOepHHcin/zK4F7UOWqta8MKpdMS
         sl8LsRNXT1gs+hTrNCD2LItCYkds9Sz/8TBnhu/0+qM2rTKMSGzfnSQs+jwDyR6ZKYIf
         TeRi060SDgkatwv/XBNtpx15Hvalv1ANtx8CHO/E6YjRUPeH6KiIs6t7JEUZTcGhYOD2
         mEiEq2TfUWDxqU4p0sOq8lPxTIKx6oxSniLjjDBMiICLGQHqQNNKfPNlHMJzsIUs1jwd
         jKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=HMC8RCpu0qhTOfuRRHUZUibf6qHpLgAB4jKyjb9VIkg=;
        b=AddA1ftkAnTLSpMbGuHLuQvmWaRKYRuCIwzyNra1JuodXYCHRaEQbru4Hlu+WQe49Z
         mlBKnVX7RH0MWGQZzWadbdMcWZyDeQRxGZFm7bi/4UhGjfWRNSqI6e0P1OJhpmKusrhu
         md6HVJsREGEvIrXAT7EyYEId+bPdbjR/Ny9PTiv6DlGpCza4VA+CzsO5ZvPbBbju1LEG
         jZaltoH4x7IpZSLW6evHgM4+IAtmO77evw14gidILD4u5w8XN5Txy27eAcrqFIrTnuiv
         03+hW/FUWjLTmFSw9pQLHn3LcGq3zAzKj9zzpQaW1ixFxxAjCKUNiszgIplZIenOUciS
         TS2A==
X-Gm-Message-State: ACgBeo1V7AEkUlDS6pym4hXnjjo9FDRJkcp7WQ/XhcaDfFMDK+e7TgCU
	TB0goZNTP4S0s0wuW/C8tvr8vA==
X-Google-Smtp-Source: AA6agR6uV5qtfGosmVQ2T7SUeoZllCoBMyas5F1KLAFuzzX+epIzqCMNkNL1cDyAH4X62I1UeWEbKg==
X-Received: by 2002:a2e:a262:0:b0:25e:4dd6:ad0 with SMTP id k2-20020a2ea262000000b0025e4dd60ad0mr9727498ljm.59.1660207806781;
        Thu, 11 Aug 2022 01:50:06 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id d22-20020a193856000000b0048b0c8fb31asm628821lfj.159.2022.08.11.01.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 01:50:06 -0700 (PDT)
Message-ID: <efe20cbf-485c-548c-933c-ffddb6c81d02@linaro.org>
Date: Thu, 11 Aug 2022 11:50:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: mediatek: add bindings for
 MT8365 SoC
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Fabien Parent
 <parent.f@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>
References: <20220811084433.2598575-1-msp@baylibre.com>
 <20220811084433.2598575-2-msp@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811084433.2598575-2-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_015009_683861_CFD7841C 
X-CRM114-Status: GOOD (  18.83  )
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

On 11/08/2022 11:44, Markus Schneider-Pargmann wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add the clock bindings for the MediaTek MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  .../bindings/clock/mediatek,mt8365-clock.yaml |  42 ++
>  .../clock/mediatek,mt8365-sys-clock.yaml      |  47 +++
>  .../dt-bindings/clock/mediatek,mt8365-clk.h   | 374 ++++++++++++++++++
>  3 files changed, 463 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mediatek,mt8365-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
> new file mode 100644
> index 000000000000..31cd248e772b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/mediatek,mt8365-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

No quotes needed in both lines.

> +
> +title: MediaTek Functional Clock Controller for MT8365
> +
> +maintainers:
> +  - Fabien Parent <fparent@baylibre.com>

Are you sure this is correct and working email? Let's try not to add
non-existing emails to Git maintainers. It's a bit of pain to fix it
later. :/

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8365-apu
> +          - mediatek,mt8365-imgsys
> +          - mediatek,mt8365-mfgcfg
> +          - mediatek,mt8365-vdecsys
> +          - mediatek,mt8365-vencsys
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
> +    apu: clock-controller@19020000 {
> +        compatible = "mediatek,mt8365-apu", "syscon";
> +        reg = <0x19020000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
> new file mode 100644
> index 000000000000..4292a2fd1489
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/mediatek,mt8365-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

No quotes.

> +
> +title: MediaTek System Clock Controller for MT8365
> +
> +maintainers:
> +  - Fabien Parent <fparent@baylibre.com>

Ekh...

> +
> +description:
> +  The apmixedsys module provides most of PLLs which generated from SoC 26m.
> +  The topckgen provides dividers and muxes which provides the clock source to other IP blocks.
> +  The infracfg_ao and pericfg_ao provides clock gate in peripheral and infrastructure IP blocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8365-topckgen
> +          - mediatek,mt8365-infracfg
> +          - mediatek,mt8365-apmixedsys
> +          - mediatek,mt8365-pericfg
> +          - mediatek,mt8365-mcucfg
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
> +    topckgen: clock-controller@10000000 {
> +        compatible = "mediatek,mt8365-topckgen", "syscon";
> +        reg = <0x10000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/mediatek,mt8365-clk.h b/include/dt-bindings/clock/mediatek,mt8365-clk.h
> new file mode 100644
> index 000000000000..aa8a0366caae
> --- /dev/null
> +++ b/include/dt-bindings/clock/mediatek,mt8365-clk.h
> @@ -0,0 +1,374 @@
> +/* SPDX-License-Identifier: GPL-2.0

Can you dual-license it?


> + *
> + * Copyright (c) 2022 MediaTek Inc.





Best regards,
Krzysztof

