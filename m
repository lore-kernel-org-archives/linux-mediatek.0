Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D774C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLHXisZDzhQTu+IhZD1MGX5kdmZBF2E9OyEhDTPZJwU=; b=FR8zKvbWAEZum0yO+/tr3gcQn2
	rF0i+kjyg+OEwe1xhOBizpDBgiCC5if/RJctcxp1E2mVZoZPjMYeE6w9Bys1gteWvqyJhjLBA1O1E
	l1IsdH26/dvsJb/At3ZkZQ7n5Dwbk0j0DYO545cn/GsaQor1dRDVEEBQj8YQ2L1AezS4bwYvA3M0K
	zUOKTcBEcUSYvSSDlQYeg54O7Idkpixi8WdnBboptGlEhH+eh21EzoyaToKEaqx40FiN0/sFgXugB
	7CQuh5F5tHmIaVrpSZWRl//CJG+gNyc1ZRLl6XYIvctwc9ONho8u0tiLioiQq+wyOhRhazETuu0uz
	J82+cW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJcfa-0075GC-40; Thu, 04 Aug 2022 15:21:54 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJcfN-0075Bd-Py
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 15:21:43 +0000
Received: by mail-lf1-x12a.google.com with SMTP id a9so18479587lfm.12
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sLHXisZDzhQTu+IhZD1MGX5kdmZBF2E9OyEhDTPZJwU=;
        b=MkFB+W3R4k/NmdzMtGvO5gm8bWIU/D3gqfEfki8sreQu/60nOhWupmHELrsdxsDNxS
         WT7olF55X3+NnUwsGIK+/5xVeDIXpI3AZYGhlk8YbSW/qAp2+u8cYiH/JwAzsMfslxTQ
         174s3nNsRf4FC6xCh/tS76iCgWBdiMvpYcRKkTLgY8ODyVSxWZA9kr64eG92gFiwPui2
         hicquy9dQ4m1PDAd9L+Mp0rK9f5BbUOYYfEaiM4sX5fd8EgxoG1zIPQMhdT2u3pqsdFI
         OTFWtje7TEcvipt37N3gDIsUQIEOPpT/CX8SEjySZASBM1mU4wCSdFM81FvEkI4yISn+
         LVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sLHXisZDzhQTu+IhZD1MGX5kdmZBF2E9OyEhDTPZJwU=;
        b=XD3itElyS2gHAFjreyr7mnSbBcsO7ASvW2bGsWnMAi7NKbpG7Y/JchLfJ3xP16NMCW
         Aq3mOTCxm2y2ZN7EUpBp9iKtYk7OQfValJSW39YVDR61Vtc+sBAxXarEimUomynAQYpm
         CMkR4ApvPz4gtgOU/wAo8iNOoanGKR70Zzw1EuYR0RMJ4MR6YJNSsaaLgZGM0OK6QhfE
         w7j1AZEvi9NEPnT3o30k8Zus1M1weP+CKFOJ31ezq+Mr5tJCbhr1TNHQIwjlVyoS8YB8
         sBVknr7YainHpdNv5YaKqb2RljugctdVkF89lqECKnRsICdu+wy+Jf0S55nwRmE6bgKe
         eKqw==
X-Gm-Message-State: ACgBeo0kYfle0AtBdeVLf0SSmnHhaLJX8ri54FDEG+6r1P8TikCAnbaH
	dkutkb3NwafPsATPmany+3h0uw==
X-Google-Smtp-Source: AA6agR7eeNfFMJaNN8k/ryXzsufMj3U/fkqVDVZELOmyQq1N/mh7D7XfeQg7tK35//Sy3EhyeaaZLw==
X-Received: by 2002:a05:6512:2623:b0:48a:ac70:311 with SMTP id bt35-20020a056512262300b0048aac700311mr912828lfb.278.1659626498050;
        Thu, 04 Aug 2022 08:21:38 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id v25-20020a2e4819000000b0025df04af0f0sm154942lja.51.2022.08.04.08.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 08:21:37 -0700 (PDT)
Message-ID: <191fc051-f10c-3eb1-2810-ebfce2279bbd@linaro.org>
Date: Thu, 4 Aug 2022 17:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v8.1, 2/7] dt-bindings: thermal: Add binding document for
 LVTS thermal controllers
Content-Language: en-US
To: bchihi@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
 daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220804130912.676043-1-bchihi@baylibre.com>
 <20220804130912.676043-3-bchihi@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804130912.676043-3-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_082141_883281_C1E360C6 
X-CRM114-Status: GOOD (  15.76  )
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

On 04/08/2022 15:09, bchihi@baylibre.com wrote:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

Please rebase your patches on recent Linux kernel (or next).

> ---
>  .../thermal/mediatek,lvts-thermal.yaml        | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> new file mode 100644
> index 000000000000..53c44a73f3a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoC LVTS thermal controller
> +
> +maintainers:
> +  - Yu-Chia Chang <ethan.chang@mediatek.com>
> +  - Ben Tseng <ben.tseng@mediatek.com>
> +

Any reason why not referencing thermal-sensor.yaml?

> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8192-lvts-ap
> +      - mediatek,mt8192-lvts-mcu
> +      - mediatek,mt8195-lvts-ap
> +      - mediatek,mt8195-lvts-mcu
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 2

You need to describe the items (like nvmem-cells).

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: SW reset HW AP/MCU domain to clean temporary data on HW initialization/resume.
> +
> +  nvmem-cells:
> +    items:
> +      - description: LVTS calibration data 1 for thermal sensors
> +      - description: LVTS calibration data 2 for thermal sensors
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: lvts_calib_data1
> +      - const: lvts_calib_data2
> +
> +required:
> +  - compatible
> +  - '#thermal-sensor-cells'
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +  - nvmem-cells
> +  - nvmem-cell-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/thermal/thermal.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/reset/mt8195-resets.h>
> +
> +      lvtsmcu: thermal-sensor@11278000 {

Mixed-up indentation.

Best regards,
Krzysztof

