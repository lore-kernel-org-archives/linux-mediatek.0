Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765CCC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 10:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAt50/c1XxD+d5an6LMQKbLUUo7P/Ao2RnbkovM7714=; b=Gi/dLdAHPi32oFURz5CoqJ96Va
	EqfmnNhDtSA4KakX0z59g2Pt2/Osb+YumbTVq6k+9ZUeevCssSHEe1gjxc2ys9xlp8sb8MWu/TZnP
	d8T88oLIjuLfCBKQe9b2RNwZDWH7pBwEOTcTU5eEXnZRXy38nyfkcMjXCLPl5lbDds7bgyoz767Vq
	N5l8fFo/dT4s0V42e12UkxX2QUaZDNPpeHbeVbjg4TUkty7MICa6S5DkCniZ5TH4m5J98CE7t3+5h
	fxdrPqGpbtspBBdxJe8k+7Cjg3SSS+aG60FQOBQdnNTYWx20uTCZ3BkKBkLoP0LcU78J58bSO4QU7
	QwHO2wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBCre-008F89-P0; Fri, 30 Dec 2022 10:43:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBCpB-008EPR-Kh
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 10:41:19 +0000
Received: by mail-lf1-x12c.google.com with SMTP id f34so31187583lfv.10
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 02:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAt50/c1XxD+d5an6LMQKbLUUo7P/Ao2RnbkovM7714=;
        b=nocHCo/Y60JUaApj7QepMG0/BYQpgVEBD6JFQe6EwJv1va+ujnkO/ott5KiRJK8wTx
         cEX+4mxaieGqL/opS5CimllxoYV67A0PseukhIpmcozAa/CluPUE/r8wH7ZEln0JnKS/
         8cBBgeYSiza1ZiGU+Qdjaef7neIOkScslIwcWLz7pWe2FYI7B7dlMjeMbGeAfJUAVFMn
         o4mODUay6zb/zWlwgmi6acNiPB+Zz+3wO/hxaIyPFdXhlOV7JA8zvaWnOTENJK9RIDhE
         IXfb9ESaNYl+NlZaZ22hKIdagv3GnxY+mDhkYz9SKMf3h8xcs+ya+jbtqxjBIiXPB2E2
         s43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAt50/c1XxD+d5an6LMQKbLUUo7P/Ao2RnbkovM7714=;
        b=iH6z+SYxciwSG1ze8qyD3kYX3dCMXrDiVcMCPPWn6uS7rnf8sJJCPr0xjq85IbMMn8
         deSXQidWz+RwGJreVmNBt6m/SUCEtbB6+CkDZXf+HQihgl8FZGzuEJHjlzLaZHWhMe7q
         bs0+mtEEEodEkA8rqaRXxwJ7YGZwLB46aaWehKqFroLPdK5nypLh6npy9KcDj0Auk98a
         60p+ecJkKfR4tMkyiiJxXSWvTp6PwMVBekp2Dv5FKQwZpqvwHyTgGERpOflb41CbN9g6
         i9ayzXlHq9BA/dFFhone24JXCcj/+mA7libUroEbNsl9KsdAH/fl5N7O2arCItaDY1nV
         FEJA==
X-Gm-Message-State: AFqh2kpuMmwjAjwU3Ms/lIqZpVA/8c5pot2MrEd1ENNLem5XXwt7eh6S
	qzUt5mifoOURVueRDU69e3Ti7g==
X-Google-Smtp-Source: AMrXdXsSkyaGu9E9QH7yKdMdxqcdZNJgrJO39Y3lFx2Nl+hw+pOn8KhPjTbifaGpSB/RJyJAiyU9Vg==
X-Received: by 2002:ac2:5604:0:b0:4ba:83f3:fb36 with SMTP id v4-20020ac25604000000b004ba83f3fb36mr8239472lfd.9.1672396872059;
        Fri, 30 Dec 2022 02:41:12 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n20-20020a05651203f400b004a44ffb1023sm3436267lfq.57.2022.12.30.02.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Dec 2022 02:41:11 -0800 (PST)
Message-ID: <33196eef-b1d5-8dd2-7c59-16a73327e8c0@linaro.org>
Date: Fri, 30 Dec 2022 11:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/19] dt-bindings: ARM: MediaTek: Add new document
 bindings of MT8188 clock
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
References: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
 <20221230073357.18503-2-Garmin.Chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230073357.18503-2-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_024117_716190_EBD97D7D 
X-CRM114-Status: GOOD (  18.16  )
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

On 30/12/2022 08:33, Garmin.Chang wrote:
> Add the new binding documentation for system clock
> and functional clock on MediaTek MT8188.
> 

Subject: drop second, redundant "document bindings of".

> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8188-clock.yaml   |  71 ++
>  .../mediatek/mediatek,mt8188-sys-clock.yaml   |  55 ++
>  .../dt-bindings/clock/mediatek,mt8188-clk.h   | 733 ++++++++++++++++++
>  3 files changed, 859 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mediatek,mt8188-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml
> new file mode 100644
> index 000000000000..6654cead71f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml

Clock controllers do not go to arm but to clock. It's so suprising
directory that I missed to notice it in v1... Why putting it in some
totally irrelevant directory?


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
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml
> new file mode 100644
> index 000000000000..2b28df1ff895
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml

Wrong directory.

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
> +    syscon@10000000 {

clock-controller

> +        compatible = "mediatek,mt8188-topckgen", "syscon";
> +        reg = <0x10000000 0x1000>;
> +        #clock-cells = <1>;



Best regards,
Krzysztof


