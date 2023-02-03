Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1E3C05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=106DLk6bZyCq11G/mD3QPJluvr1GcQ3YNch4g3Clnjw=; b=mCZdz2ZBqWgJXaTtOg/x+VYyV1
	AfaA2gWd6f8Q1LTLivSURgxC6V8X3wQyyquZQo3Dl3bn+qrud2FRumbwiWGTWMklGmPi+8hiHCd8g
	JaSNvd7tQUrGXOIkby/hnD2P3ZWJ1q6upwAqGHQ0RlfyXapQl52VTVV5c7VyCSJheoUonE7qb6qAk
	dzaADMRTdhj90x4Zc1quFkjGkN7pzdwQp9qUSobYvm3njJbQag2vfd/cCdeBSqsk1bOvGR325mmU9
	kopV84jhSWQgAH4bJMgX9fRmEF6HGGclX6cmaq9jLP7n3zv1suhK1nRDbKbAaVpcKNaLHXdeSEvAO
	lkhMrUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNvEl-001mPi-Uo; Fri, 03 Feb 2023 12:32:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNvEZ-001mJz-7y; Fri, 03 Feb 2023 12:32:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id bg26so3777321wmb.0;
        Fri, 03 Feb 2023 04:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=106DLk6bZyCq11G/mD3QPJluvr1GcQ3YNch4g3Clnjw=;
        b=i90tmNa9o0n9VBAWdZ1KbtZb/g1IcmIyqM8xmsKtzD1HNRsGD5wIPZ3C3NxX4rViqm
         s3vt84M8aOk6VaiXNn4sWYbXHYrlII7J5notVOtSrk+QeOysJvaRNkOG3ke0yU8rfIJ2
         /iwTE/QnAmGm7/D4Vd7xPR7ZyPI0ewTWrVspcTlLjxoLO67YOzPHOEqRvcwTFiaUCKre
         JeNfBQ5gfXSQa8RsalNNDzS8aTNxAEafzcdopF/yrUqjU/JnnFwL8qcn8u4jmZfmTRVj
         0N6TMQYg0/Q2m039NVzR3rFL6BmLPe9vG0V6XVzJZBZ8jPTl1RdBrQBju8D8OiBqZx4H
         ch8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=106DLk6bZyCq11G/mD3QPJluvr1GcQ3YNch4g3Clnjw=;
        b=ISZ9bhWHdka5yZJxA5IMRiFgf5d/0lFve06/6sH1yB8RBAGCCItBvmYHi0pRWUlis+
         UqPa6D97KiDO2NG01Be8PqqAVvTiKJhNaaYZ95s7AuFI+tetGWK8njiX+X/z0tj91Itk
         aY0p2S1bXzklm/6mobdBrxnZ1j4B6aOFuUsOigd4KoMq/HaVBtNGB9BfFVoDnIB6xdLI
         8zUKHn78cx30895HKrCFnPLmOm94cM5NODNl5eQFxUzAkJAhAZ1hUq9XP/SqM0uavVOq
         ky6Ts7yRonnZICpr81knJPD1sgTeRWbTgD//3F6ZI6wOpvAnDwDr1liXst9RyKVU396D
         Fd6g==
X-Gm-Message-State: AO0yUKVsxdebSq+tDKcNX/yI0IBG/va2Sj6TVA14qzK+sces8n5YUBOP
	+lFVeyufTejGqgQv53VHl4g=
X-Google-Smtp-Source: AK7set9wa2iiUfPOUvXcnBTYs1JEd2ZXgXz3h1qqyDLUfW/ByycRccWOwcbIwsfVZvw8GVK4p2dAPw==
X-Received: by 2002:a05:600c:1d83:b0:3cf:68d3:3047 with SMTP id p3-20020a05600c1d8300b003cf68d33047mr9120804wms.41.1675427519986;
        Fri, 03 Feb 2023 04:31:59 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b003dc433bb5e1sm2879537wmo.9.2023.02.03.04.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 04:31:59 -0800 (PST)
Message-ID: <6f6f1be3-358d-d062-31e1-c307dca56907@gmail.com>
Date: Fri, 3 Feb 2023 13:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20230105170735.1637416-1-msp@baylibre.com>
 <20230105170735.1637416-2-msp@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: power: Add MT8365 power domains
In-Reply-To: <20230105170735.1637416-2-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_043203_400988_DCA2C325 
X-CRM114-Status: GOOD (  20.41  )
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



On 05/01/2023 18:07, Markus Schneider-Pargmann wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add power domains dt-bindings for MT8365.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>      Changes in v4:
>      - Add infracfg_nao as it is used by mt8365
>      
>      Changes in v3:
>      - Renamed mt8365-power.h to mediatek,mt8365-power.h
>      
>      Changes in v2:
>      - Made include/dt-bindings/power/mt8365-power.h dual-license.
> 
>   .../power/mediatek,power-controller.yaml      |  6 ++++++
>   .../dt-bindings/power/mediatek,mt8365-power.h | 19 +++++++++++++++++++
>   2 files changed, 25 insertions(+)
>   create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 605ec7ab5f63..a496c43cfa16 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -30,6 +30,7 @@ properties:
>         - mediatek,mt8186-power-controller
>         - mediatek,mt8192-power-controller
>         - mediatek,mt8195-power-controller
> +      - mediatek,mt8365-power-controller
>   
>     '#power-domain-cells':
>       const: 1
> @@ -86,6 +87,7 @@ $defs:
>                 "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
>                 "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
>                 "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
> +              "include/dt-bindings/power/mediatek,mt8365-power.h" - for MT8365 type power domain.
>           maxItems: 1
>   
>         clocks:
> @@ -113,6 +115,10 @@ $defs:
>           $ref: /schemas/types.yaml#/definitions/phandle
>           description: phandle to the device containing the INFRACFG register range.
>   
> +      mediatek,infracfg-nao:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description: phandle to the device containing the INFRACFG-NAO register range.
> +


Hm, so we have mediatek,mt8365-infracfg defined in mt8365-sys-clock. Also the 
description talks about infracfg_ao. You now introduce INFRACFG-NAO. Is that 
just another system clock block, or is this covered with the 
mediatek,mt8365-infracfg binding?

We would need to clean that up.

Regards,
Matthias

>         mediatek,smi:
>           $ref: /schemas/types.yaml#/definitions/phandle
>           description: phandle to the device containing the SMI register range.
> diff --git a/include/dt-bindings/power/mediatek,mt8365-power.h b/include/dt-bindings/power/mediatek,mt8365-power.h
> new file mode 100644
> index 000000000000..e6cfd0ec7871
> --- /dev/null
> +++ b/include/dt-bindings/power/mediatek,mt8365-power.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MT8365_POWER_H
> +#define _DT_BINDINGS_POWER_MT8365_POWER_H
> +
> +#define MT8365_POWER_DOMAIN_MM		0
> +#define MT8365_POWER_DOMAIN_CONN	1
> +#define MT8365_POWER_DOMAIN_MFG		2
> +#define MT8365_POWER_DOMAIN_AUDIO	3
> +#define MT8365_POWER_DOMAIN_CAM		4
> +#define MT8365_POWER_DOMAIN_DSP		5
> +#define MT8365_POWER_DOMAIN_VDEC	6
> +#define MT8365_POWER_DOMAIN_VENC	7
> +#define MT8365_POWER_DOMAIN_APU		8
> +
> +#endif /* _DT_BINDINGS_POWER_MT8365_POWER_H */

