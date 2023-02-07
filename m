Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E2EC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1ykxnCSPogB0kbxJnMoBL8O048yCl07opBue4WpgaQ=; b=boiRHqJDKg/GDkmR4ZvRZmonBW
	dFPbUmDotz+Jg0w+Hkr6SY7tZv+WW3ZN2nGbsAB6x7p79f4A94l4dv8mhyb+Zz75QqEkQnvtEdP2A
	wQ/tiVl5Cga3ewHM86jdP3KbTyI+RfhHetck4/XT+lgJ7QdrhBjkQEdMdU0lH3GHCE3lK8TYybUBj
	Dt5RH4CryQiKE2B6uarFg2DTQ4TmUP/6VtHuvAX62D9oCHZngJ43ltJExdzCBD1kP3g81DUK67mbO
	sm3HSg6bQbuXIR19+b7aoJfzMYh/jFlgmcateqxRjUoBHcnZTq4JqIlhLVbwgvWXDvb/0BU/QhtRy
	JJwS/Z6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPO8P-00CJep-7x; Tue, 07 Feb 2023 13:35:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPO8M-00CJd0-U4
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 13:35:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso13206539wms.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 05:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k1ykxnCSPogB0kbxJnMoBL8O048yCl07opBue4WpgaQ=;
        b=tTuj0/XbFSyS4dn6D7rW1NOCwMHRyzAh+O6FP2x0BBLP/2F0FxstsfvHct8fILSH/K
         0GllB2iScPYt8V7iN34H0RSFKCruoUivMiSVGCtxTkSnKMZpYaIpKftzuLJyH0leBR0+
         qSJCq3ldl5dw6okdCiYezdtVaU1jvRex6x4G6R0UYxPklWw1Pn6TtaMyVhomxJuPkWMC
         FpOPOnGAt3n96q4B+oUkaXxF7ct2JK8etPczii+PuYqtxUsmT2vaQP62U8p/PFz4SLTg
         W11hImxwMZc1PGSjZR6AGekxCjzEeZzJJIP+OHLZ6Sb10ADbKfHuPKUElUaTxONnUgjE
         sEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1ykxnCSPogB0kbxJnMoBL8O048yCl07opBue4WpgaQ=;
        b=pIRpHSGvuPWdHbQYy6+JJOQpSocm3e7wZuamyVKy59Qk7vb2Hx1Ry1hzuRjMXKCfbG
         Z6vsT5q/Nl/zgg9UTUoOTJTVwWWdEsIsSre5VHxlAden4GgiAgAQIBogXDkP1vCQw6+o
         truCMWlvN7D0NdTByrFdHs5VppNkoJ0KuKGzbaSDRvJbn3tRjiA1VAqSYdLy0SLC4iXG
         9DFhA1tgx1YhAFYxFRJaSHo+OMKq8lQ1Y2RVMZUKE7cFmBZYEqjm70KK9i3I6W/I12jh
         i2yRNfl4eHlazatFNpSLjS2XdU9gG4noYQUnwuiGA9I8nzI7NcyiHTZBwwGOpqP6+4Gn
         KTFg==
X-Gm-Message-State: AO0yUKX4+lyUxuxYk3JWzyosFlO2WpQDkLjPAKHA/8a66TJ2wsah8w+z
	fjpOa2rfse6R2eUixCuk29Zw8w==
X-Google-Smtp-Source: AK7set9N2kRdkmfxK++BVbR4XXH+Yw/7DgZyRt1NfDA/eM1SF/QMNr1FLrcIAOqKD1ls1/bhgKNttg==
X-Received: by 2002:a05:600c:3596:b0:3df:d431:cf64 with SMTP id p22-20020a05600c359600b003dfd431cf64mr3061555wmq.39.1675776941479;
        Tue, 07 Feb 2023 05:35:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f1-20020a1cc901000000b003df14531724sm18521999wmb.21.2023.02.07.05.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 05:35:41 -0800 (PST)
Message-ID: <046b3b31-cbf7-674d-f05c-b825d6b46bf6@linaro.org>
Date: Tue, 7 Feb 2023 14:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v13 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230207130958.608305-1-bchihi@baylibre.com>
 <20230207130958.608305-3-bchihi@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207130958.608305-3-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_053543_011217_8D532F7D 
X-CRM114-Status: GOOD (  12.68  )
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

On 07/02/2023 14:09, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS thermal controllers dt-binding definition for mt8192 and mt8195.
> 


> +allOf:
> +  - $ref: thermal-sensor.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8192-lvts-ap
> +              - mediatek,mt8192-lvts-mcu
> +    then:
> +      properties:
> +        nvmem-cells:
> +          maxItems: 1
> +
> +        nvmem-cell-names:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-lvts-ap
> +              - mediatek,mt8195-lvts-mcu
> +    then:
> +      properties:
> +        nvmem-cells:

minItems: 2

> +          maxItems: 2
> +
> +        nvmem-cell-names:

minItems: 2

> +          maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

(...)

> diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> new file mode 100644
> index 000000000000..4f2082065a31
> --- /dev/null
> +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + * Author: Balsam CHIHI <bchihi@baylibre.com>
> + */
> +
> +#ifndef __MEDIATEK_LVTS_DT_H
> +#define __MEDIATEK_LVTS_DT_H
> +
> +#define MT8195_MCU_BIG_CPU0		0
> +#define MT8195_MCU_BIG_CPU1		1
> +#define MT8195_MCU_BIG_CPU2		2
> +#define MT8195_MCU_BIG_CPU3		3
> +#define MT8195_MCU_LITTLE_CPU0	4

These changed for some reason. Why? The indentation is now broken
(although not visible above quote, but visible in diff and code).

Best regards,
Krzysztof


