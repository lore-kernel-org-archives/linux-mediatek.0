Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F7CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 13:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=by0ERkaps8lQ29dDrpojcZoFWWZyPIbwRx4Gps7MS3k=; b=c+rz0t1jE77Q0fyYgGkGgfEgjR
	6wE+wpEcS5eN7o9OBcRw00sx0nOzH6roQxN6fU/1zNc46qunrpYuJkPOhR/30WFLI10HM71/L4Ujm
	0NuOOLRA3OA0Onlc3pw/z76bqIJ7U63jZvLie+nIoUzBeXLZ/yZ3fc7Bi6N+nZVPj1d7EG8sLFiO5
	m0+JrkoHVo/N3Iom838vzNxxG1BpJdrQQFD4P0v1oRAbnHz/Magnrz3IPWNq/tmG6pfyZksyZlHfH
	jY0PouEIydbBWE8RKTEwmNsxxbQkzzXX5fOTnyVay2FLXKGBea8cWjKHtLriiTjPOoYys5Q3aXquX
	jL4y8XJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4cc-00EHBV-6m; Wed, 05 Oct 2022 13:39:38 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4bs-00EGN2-Nn; Wed, 05 Oct 2022 13:38:54 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-131ea99262dso17605872fac.9;
        Wed, 05 Oct 2022 06:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=by0ERkaps8lQ29dDrpojcZoFWWZyPIbwRx4Gps7MS3k=;
        b=maZFCi5mZ7CyyD7cVGIf5Xciv1h6T//movVoysPn/JQZp3kp20iJMw5vxvcYoNHTgm
         evnZuJ3I+WbAZCjTozWVdZE+rg6kxaPza8UwPNaGFZeX4VYchLMF7Su3sUXtQNDVKouz
         CrKCNLK/IpfqR2m00PK90524DrRUm68X/vD/e4bq63IY85AZWb9t2TGtCW7GorGzrAwF
         fMB7/gehOpg9EADZsFh0PzIooACUe5bQy9YQq5vfx4LhlXg0NS8T5TMQOq/VpqWBm05z
         bivR+DmG6favWpG4xdG4SFJmfij4KHTR5nHpZOURlA63ln+Uk+9kDk6DvkBK+e2IwNEK
         Vdpw==
X-Gm-Message-State: ACrzQf1U9swwnyHySZzJuPFbT4OHolFviFG3X6JcDWNbkgS8OoesNkCZ
	CrTDsUzQSG8a0GAyfBKe7w==
X-Google-Smtp-Source: AMsMyM4xHEPNqUNnGDrNw5cPpfWdbzhoD7LTo0G+9iEO7jAgDG3oNsnG3K3/tFnv512rIA7OgNN45g==
X-Received: by 2002:a05:6870:160f:b0:131:e2c3:8fe3 with SMTP id b15-20020a056870160f00b00131e2c38fe3mr2598787oae.54.1664977130056;
        Wed, 05 Oct 2022 06:38:50 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:5fee:ea3a:4239:ad4:650a:6e66])
        by smtp.gmail.com with ESMTPSA id d18-20020a4aa592000000b00435a59fba01sm3407370oom.47.2022.10.05.06.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 06:38:49 -0700 (PDT)
Received: (nullmailer pid 3284182 invoked by uid 1000);
	Wed, 05 Oct 2022 13:38:48 -0000
Date: Wed, 5 Oct 2022 08:38:48 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, allen-kh.cheng@mediatek.com, seiya.wang@mediatek.com, tinghan.shen@mediatek.com, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek: Convert mtk-wdt to
 json-schema
Message-ID: <20221005133848.GA3278938-robh@kernel.org>
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
 <20221005113517.70628-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005113517.70628-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_063852_817985_11BE8104 
X-CRM114-Status: GOOD (  17.72  )
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

On Wed, Oct 05, 2022 at 01:35:15PM +0200, AngeloGioacchino Del Regno wrote:
> Convert the MediaTek watchdog bindings to schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 80 +++++++++++++++++++
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
>  2 files changed, 80 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> new file mode 100644
> index 000000000000..f43b5af92d40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoCs Watchdog timer
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description:
> +  The watchdog supports a pre-timeout interrupt that fires
> +  timeout-sec/2 before the expiry.
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2712-wdt
> +              - mediatek,mt6589-wdt
> +              - mediatek,mt7986-wdt
> +              - mediatek,mt8183-wdt
> +              - mediatek,mt8186-wdt
> +              - mediatek,mt8192-wdt
> +              - mediatek,mt8195-wdt

The original binding only had 4 without a fallback. It's fine to add or 
change, but note the changes in the commit msg. Are all of these really 
each unique and not the same?


> +      - items:
> +          - enum:
> +              - mediatek,mt2701-wdt
> +              - mediatek,mt6582-wdt
> +              - mediatek,mt6797-wdt
> +              - mediatek,mt7622-wdt
> +              - mediatek,mt7623-wdt
> +              - mediatek,mt7629-wdt
> +              - mediatek,mt8516-wdt
> +          - const: mediatek,mt6589-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog pre-timeout (bark) interrupt
> +
> +  mediatek,disable-extrst:
> +    description: Disable sending output reset signal
> +    type: boolean
> +
> +  timeout-sec: true

Drop this and use 'unevaluatedProperties'.

> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        watchdog: watchdog@10007000 {
> +            compatible = "mediatek,mt8183-wdt";
> +            reg = <0 0x10007000 0 0x100>;
> +            interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
> +            mediatek,disable-extrst;
> +            timeout-sec = <10>;
> +            #reset-cells = <1>;
> +        };
> +    };

