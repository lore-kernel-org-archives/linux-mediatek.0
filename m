Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E22C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 07:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVS+MTH1XwU1cvawHiiTO1k5At4xPOvBRcWn0E0JKnQ=; b=4Z3qJ24+5M8qRiFOEi2BkJgffs
	4dgYE/yEnYgl8zSYqfJaeCHxdO631ekbVDmTRZvYgd1hEtXX1V42Izdfqb8vOC+EQWc7RUS2yklN8
	uNE8MSepw9jDqxDmgIk3yZJ0fFg7HO3g9RiTSCtKjVy0QNMDTAkNYFwV0m8adcjiMz+X9LZ19VQnR
	rrerHSaKT72S401mQMBr9rOinXneuoXz1IWes+rGPf9WNlHoDeXoRhiiKRncVcxQEW0NQVEesxm0A
	JvUbk1XBhhcLHWfWU6WlzV7+ceHgY3zGvy7MIFIEqaUUiKoZ9HfKZb2/PrG4mLGe+sewWTVGG5lL/
	ADrzmfYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGCR-005B8R-3n; Fri, 15 Jul 2022 07:57:23 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGCO-005B5m-5X
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 07:57:21 +0000
Received: by mail-lj1-x236.google.com with SMTP id w17so4858634ljh.6
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 00:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pVS+MTH1XwU1cvawHiiTO1k5At4xPOvBRcWn0E0JKnQ=;
        b=nPbUHaxTybTz+hSdJPP6CMy/vM/46yKwRrdEcsM8O2DT/PEmEm8ExTH8fb2rzJxdNf
         xjorId7Lq1mqbvJSYX2eyWQlr2irAmSAS6rnsqJDpmwkL+6QGJrJDDAQyzR9Iy8xuw+W
         G2Ytl4E09lz7ry/bTjvMUCO5DGdJuNBD5GGICRvvIb1oJkkbuio9/j0nVaKx0WPjH71e
         +AvFWG+fw+j8KIMVJGW2e2zw/kH23rcpmVVe6i5I+58UpQ0pAGEMQ0Ab8I1eatNJjP6W
         PSc5bjLGmcyTLTiBxDZGy1rct8c9+FJxaOOz8NoDM7ZjauLPS6uNYjJzZUgZotVcLO5+
         wEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pVS+MTH1XwU1cvawHiiTO1k5At4xPOvBRcWn0E0JKnQ=;
        b=KzS/Xba/x1mJdSkP6NHv/phI3O/2K4Bj7xTM1PZszG9Bn6boyC7JAkJZ0ANGWDYDhh
         4dT1xXZKb1bFXiZXC+F8lWJCU9ZxPgFk7myLH5XEmqzkUSOFk/V2rwJ5aZf0RFeNIrRr
         MszDnCymi/s+hjyRAjxPa47zeUQcJzUFOzrEwjMIy5AM6BVXLpDO3lCHIDTSzRqXYWbA
         KqirUM1VUuRHLtc28XI/tf28BuAYoLmf9xYNX6aroWJXdrTbT+gHmD8wMSQbaaqCMLW4
         uYEr4IocvcYRNmV2XZ7J+4bLAYS8414igFjC4lCY+VF8kjAQUuxsdM1J2T1PblWZ01DJ
         Xpdg==
X-Gm-Message-State: AJIora+bRvy/ddBUMoqDHJwpXseTKOgyZES48I46g73a0naUq64xUbB5
	XfP/jsbmZV+VGOW+8vnvNqKU0g==
X-Google-Smtp-Source: AGRyM1ulJRngwtrHtmZz4bY0FMFRN0qrWGaMpBxRh+yPkwrRe6nsqVmc0rblcJXm/KEw4Ov5c3GRWw==
X-Received: by 2002:a2e:9854:0:b0:25d:883d:faf2 with SMTP id e20-20020a2e9854000000b0025d883dfaf2mr6010968ljj.223.1657871838444;
        Fri, 15 Jul 2022 00:57:18 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id b13-20020a056512070d00b0048960b581e3sm778642lfs.8.2022.07.15.00.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 00:57:17 -0700 (PDT)
Message-ID: <46df4ad5-5102-b5fe-95b7-5b157fb28f01@linaro.org>
Date: Fri, 15 Jul 2022 09:57:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/19] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
 <20220714122837.20094-4-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220714122837.20094-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_005720_240452_AF72F254 
X-CRM114-Status: GOOD (  18.36  )
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

On 14/07/2022 14:28, Tinghan Shen wrote:
> The System Control Processor System (SCPSYS) has several power
> management related tasks in the system. Add the bindings for it.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/mfd/mediatek,scpsys.yaml         | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> new file mode 100644
> index 000000000000..a8b9220f2f27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,scpsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek System Control Processor System
> +
> +maintainers:
> +  - MandyJH Liu <mandyjh.liu@mediatek.com>
> +
> +description:
> +  MediaTek System Control Processor System (SCPSYS) has several
> +  power management tasks. The tasks include MTCMOS power
> +  domain control, thermal measurement, DVFS, etc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,scpsys
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-controller:
> +    $ref: /schemas/power/mediatek,power-controller.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    syscon@10006000 {
> +        compatible = "mediatek,scpsys", "syscon", "simple-mfd";

This should be a SoC-specific compatible (and filename).

> +        reg = <0x10006000 0x100>;
> +
> +        spm: power-controller {

I think you created before less-portable, quite constrained bindings for
power controller. You now require that mt8195-power-controller is always
a child of some parent device which will share its regmap/MMIO with it.

And what if in your next block there is no scpsys block and power
controller is the scpsys alone? It's not possible with your bindings.

Wouldn't it be better to assign some address space to the
power-controller (now as an offset from scpsys)?

This is just wondering (Rockchip did the same...) and not a blocker as
power-controller bindings are done.

Best regards,
Krzysztof

