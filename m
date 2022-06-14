Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9E5CCA47A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 20:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6FcLDbbov7+GCTvPe4LOONQA8az1TZo4pBqzPCQhAw=; b=36qLcj2qDzUiRL
	TJHGPzMAX6g7M4c5ICz1MnLat2vl/GiaK6GoWZtm7sBB2h0BZRKYomteUcWnxoz7sj/rKopprvSmr
	19JBL9H+ZcNPdfv5Klu2EKnHAaSdXi+34zzxP6Lct2T6TJ+fehp9mVNgMxqhJf8w9TN45RX0KBXsn
	WAmGyLSmXPndZOSovQWqw/CW68R6vrrabjeS1sOSetz2iYp0g5oGN7BQf1z0FUV81rQIN4iBhVBbg
	6rp9iZzPVW1exmqLN3KPIrfYss/IZINB4yk7whJjLv9Fy3TeVyfgA9juR290YHZugJVou7wwliKiC
	9XfSpfXIRiqcnIF2C4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1D4i-00B70Z-5Q; Tue, 14 Jun 2022 20:23:44 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1D4f-00B6zf-4j; Tue, 14 Jun 2022 20:23:42 +0000
Received: by mail-io1-f42.google.com with SMTP id y79so10621718iof.2;
        Tue, 14 Jun 2022 13:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yn1X9tsTyWKYB/yNHVHmt00Zq59Qs2y2qulf6vb+2UM=;
        b=iHj/F8jXXac2xubh5fzWOecGh1X8b2hlEtAJUg4pLL8j+x7bpQ2JUJo5wderiuUCYC
         uBelETHamhXdumBhbvD88cXx3FAj2IL7L99wEa1M5FVFR1ivbz10HjMMG+tQ4MmX+5bA
         gSm8SoNfYhzuXDNxS/FQ4LDfL+wN1Y9SELTbFHGMjpiX5r+29uZzPu91OHQTZsb7s5Q8
         HG8ZZX3SjyGK1ogJIn7tY8OWgfEkuDti8V3pegC0wnmsuPauO9pdpxN1b4JOHWLK2tQb
         aUeoN8aFEFRSrki/FHsyIAuJch/9D1pSNGNUDjeK3jjY3CsPezD4rlXGysh70sZ3zNlj
         MmFQ==
X-Gm-Message-State: AOAM5318gDrOdIwKRq+RyPGK966pV4m8xsrZhfYpMalSX5FsR85jljE+
	UMXGCOBD0c2gkzh9LL3s2Q==
X-Google-Smtp-Source: ABdhPJx9rerqWe1Bf7zW/nGD3+1oZxHbZiDkER+sQCEKjG2+KNxYREIe+A+7VgkMnLoB33NTi+7crg==
X-Received: by 2002:a05:6638:2711:b0:332:1030:d6c2 with SMTP id m17-20020a056638271100b003321030d6c2mr3817608jav.263.1655238218973;
        Tue, 14 Jun 2022 13:23:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id r4-20020a92c504000000b002d54d827007sm5835499ilg.17.2022.06.14.13.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 13:23:38 -0700 (PDT)
Received: (nullmailer pid 2415510 invoked by uid 1000);
	Tue, 14 Jun 2022 20:23:36 -0000
Date: Tue, 14 Jun 2022 14:23:36 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie, msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com, wenst@chromium.org, angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v11 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <20220614202336.GA2400714-robh@kernel.org>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
 <20220610105522.13449-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610105522.13449-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_132341_227798_CC7F6720 
X-CRM114-Status: GOOD (  18.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 10, 2022 at 06:55:13PM +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Fix reviewers' comment]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> new file mode 100644
> index 000000000000..10f50a0dcf49
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Port Controller
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the MediaTek display port and
> +  embedded display port controller present on some MediaTek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-dp-tx
> +      - mediatek,mt8195-edp-tx
> +
> +  reg:
> +    maxItems: 1
> +
> +  nvmem-cells:
> +    maxItems: 1
> +    description: efuse data for display port calibration
> +
> +  nvmem-cell-names:
> +    const: dp_calibration_data
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input endpoint of the controller, usually dp_intf
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the controller
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  max-lanes:
> +    maxItems: 1
> +    description: maximum number of lanes supported by the hardware.

We already have a 'data-lanes' property defined in 
'video-interfaces.yaml' that can serve this purpose.

> +
> +  max-linkrate:
> +    maxItems: 1
> +    description: maximum link rate supported by the hardware and unit is MHz.

Then use '-mhz' suffix on the property name. Then you don't need a type 
(or maxItems).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
