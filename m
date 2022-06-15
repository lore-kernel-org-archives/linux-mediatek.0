Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 17:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1PQYZC14YMjHxT30YEBNlrtmJ3QC4MXeKQysGRg+Yw=; b=1GbTFvZ8LXr6ty2nJrRZgn24/u
	qAaR9uXEEo96ik2luZUwuqlqT0JMo1GrdKylY1S/m96l5yCrN8xa8jESB9qe3CdIQ5K+67CXL3SMN
	oSqRKKnE96P3IxE6WmWsH8rCskNQ6cbtok7ul58L8aMrfae+2Fv0CErQ3cMmfzk+w2afYpaxMVpz2
	EMx3ugPCg+jB/oFo6uedtkPKD7ixrRFYlu8wflkYxS7L9giErLnw3xNrYjU9kg+Y87ZUpnJ/Beu9/
	Ir+dgjGlP+1Q4CJYbi+AFwymHOr7JGhmiJNlFh7a6KmYSA26Bg4V0TsfRjVcP2epAaQkzzRCCtnQH
	wQzLEKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1WtC-00Fihw-Sp; Wed, 15 Jun 2022 17:33:10 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Wsq-00FiaX-EV
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 17:32:50 +0000
Received: by mail-pl1-x62a.google.com with SMTP id i15so11010599plr.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W1PQYZC14YMjHxT30YEBNlrtmJ3QC4MXeKQysGRg+Yw=;
        b=LLceS4Bvp4DhcnnLuCIwqgbqNp6J/l72nMXqhgIjd8/hq1DDLIwDn05fkERjkMyyfz
         ZB7DSoL5I8hjYPDY+mdw4AXi0E6y7pp62jvbB/EgWuzpZ86hIbhHRp79/DhlHcEyYKsu
         wpHlwcu8gv9SvSy+A/1bRM4T9CHWtJBuvH4CM9m6g7MhOWK5zN93QKIyMgHeHFGktwGu
         9gLqJYdlY6dUpcrsC41tPFsu1FljJ0SBFOUn5gbdTXEOwHhJTLE/uqDmbWsGBwwvQkDS
         90Au78Z+x+AILhvwS9iOa7uK/JiFTYrFOXBQVyDJwDclT0jsah+pifj6C1UnXtvGlgvv
         ighA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W1PQYZC14YMjHxT30YEBNlrtmJ3QC4MXeKQysGRg+Yw=;
        b=Llw3OE0qEen6rYah6BMFWlh2CABHEEy9MoZ/YFG6u5e6FmwY1g0NP8J1UuF/KV0ODC
         IhmzXqidlLm8WaFtVOUnnLps3kTRdz2tGS/gdn7FLnRfK560L91hfg53NPfnByZt90zB
         8c4f+vXY5w7V9/YV6wzuB+g+Sg9DeLfFL4aaEflYpXHX3OA7s4OdARwg8Fv3RmIo0Mdr
         iQE0GruqKTJ0B29aAJHn/v8wgF3HFlGgOXUYJw0JXV6Kk88tTZYb72OtE/Rh0+TYW2e9
         hlPs0eXUbWfmwX9XUoPbtlRgaK2oTH0+CqizkbGxTKEjEYvFfN5crBeoVho8WWB/7D3G
         sjWw==
X-Gm-Message-State: AJIora+ckemqFgzJ7UpprdQ6VfGrtyd5ImRJ9kZMr4j9hq3V5WLWPFBE
	PBj5vFUkhBw2CLoLt1vWqSvQ6A==
X-Google-Smtp-Source: AGRyM1t5Bb3byzNK2GCgYIJSoyJJv6PdLq49qYzDb+iYtiJqiqZHZMSFKTIH6YqdgfcSUyPXOQ4snQ==
X-Received: by 2002:a17:903:408c:b0:163:e526:4397 with SMTP id z12-20020a170903408c00b00163e5264397mr829378plc.80.1655314364597;
        Wed, 15 Jun 2022 10:32:44 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id cd6-20020a056a00420600b0050dc7628162sm10075365pfb.60.2022.06.15.10.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 10:32:44 -0700 (PDT)
Message-ID: <acac2ec1-759a-dee0-8f08-df83b63b96f5@linaro.org>
Date: Wed, 15 Jun 2022 10:32:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/3] dt-bindings: dsp: mediatek: add mt8186 dsp
 document
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220609083101.24195-1-tinghan.shen@mediatek.com>
 <20220609083101.24195-4-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609083101.24195-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_103248_513369_A5AC395E 
X-CRM114-Status: GOOD (  18.07  )
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

On 09/06/2022 01:31, Tinghan Shen wrote:
> This patch adds mt8186 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers, clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> new file mode 100644
> index 000000000000..33c78f89d296
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/mediatek,mt8186-dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek mt8186 DSP core
> +
> +maintainers:
> +  - Tinghan Shen <tinghan.shen@mediatek.com>
> +
> +description: |
> +  MediaTek mt8186 SoC contains a DSP core used for
> +  advanced pre- and post- audio processing.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8186-dsp
> +
> +  reg:
> +    items:
> +      - description: Address and size of the DSP config registers
> +      - description: Address and size of the DSP SRAM
> +      - description: Address and size of the DSP secure registers
> +      - description: Address and size of the DSP bus registers
> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: sram
> +      - const: sec
> +      - const: bus
> +
> +  clocks:
> +    items:
> +      - description: mux for audio dsp clock
> +      - description: mux for audio dsp local bus
> +
> +  clock-names:
> +    items:
> +      - const: audiodsp
> +      - const: adsp_bus
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    items:
> +      - description: ipc reply between host and audio DSP.
> +      - description: ipc request between host and audio DSP.

"IPC request between" does not specify who sends the request. Host or DSP?

See existing bindings for some better examples, e.g.:
Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
which clearly states who receives from who.

> +
> +  mbox-names:
> +    items:
> +      - const: rep
> +      - const: req

tx/rx




Best regards,
Krzysztof

