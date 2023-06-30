Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA58AEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 14:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5AMZs/zHCV83IWK4W4QITPU73mgpFl6qrkuUYgrguc=; b=sTqTe1whd/iGes/JfF3eyF/P/q
	QaUxF3oVmK8gZ+4fdUZE0sck+dTbGA3sKz4yrg126CoB3zhkRe+lWlyuf3oGL+RjgBXgUbu7Jfs3y
	3/qLZUG67c9NFcCqQhQG2EgpsaxXjtpuRNPuWlw/oRFz2i2lw+EevHNGrkuI2GK50pbkjwpKVI2A/
	1POOUgjEs5AS/HdLnoQ65A7iTgc1s869GDnOsCMay6vDWflQERbmROwabBvFSFqBYNIS4MJ5wphvv
	mo5p01HUmiOK4uPWyB0epfqA9HD83f55CgO96T3Azc9p53jrUlVg4IHk+nCM3xvzas9D34quhs5EM
	iI5bXdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFFBv-003r5R-2R;
	Fri, 30 Jun 2023 14:33:43 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFFBs-003r3x-14;
	Fri, 30 Jun 2023 14:33:41 +0000
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-783549ef058so78580539f.2;
        Fri, 30 Jun 2023 07:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688135618; x=1690727618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5AMZs/zHCV83IWK4W4QITPU73mgpFl6qrkuUYgrguc=;
        b=lZB4zaMYOdz3/b+Y8tRMwLjYKyaVgejum83g3NKzVEQMm9jW5lpsUKIt0lHTlHkyZ2
         VPNbqqD6Vh0ct5BcktRzBYMy6zWcXUAeR1fG77eabXPvZ4/QfUq2lT0AUwz2cs/qyZNJ
         Nzb8xSD5GLi9nFwMaSN04PV51bQko7QSV+IUJkOg48pTIk4hG4QQqW6TYeneyxiLrl9L
         elZ1AMxCK6zcvE1IOcsROl45VBVvF/wc5Wo/NUcc+qljeyfx4TpVHbcPxXoF+nwKl3C8
         cQ4XClaQiHIkbtDnBPf5VwzcKjMmu2Y+CKFazGFTSY32TjRfI2DAXk66CwrvU7shfi4k
         pPXQ==
X-Gm-Message-State: AC+VfDxHOsn6NQXmXf3oROhEmDQYCw2akoukTFcrbqp4mqIIgJ3dxgKm
	WLxycBPFGmDnmbvMa4k2CQ==
X-Google-Smtp-Source: ACHHUZ5gLqxx6Di1Cy2RVzFLNSkHxTHWCY6kl8qNN9ObQlrwhBXxOQWC0wRrGWkgWM7iA7NSJZlV4A==
X-Received: by 2002:a5e:8302:0:b0:774:94e1:3aee with SMTP id x2-20020a5e8302000000b0077494e13aeemr3063334iom.6.1688135617882;
        Fri, 30 Jun 2023 07:33:37 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r5-20020a056638100500b0042319c38763sm4571263jab.15.2023.06.30.07.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 07:33:37 -0700 (PDT)
Received: (nullmailer pid 1431708 invoked by uid 1000);
	Fri, 30 Jun 2023 14:33:35 -0000
Date: Fri, 30 Jun 2023 08:33:35 -0600
From: Rob Herring <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>, Andy Hsieh <andy.hsieh@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, daoyuan huang <daoyuan.huang@mediatek.com>, devicetree@vger.kernel.org, Florian Sylvestre <fsylvestre@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <20230630143335.GA1430949-robh@kernel.org>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-4-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630100321.1951138-4-jstephan@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_073340_373042_906E853E 
X-CRM114-Status: GOOD (  21.60  )
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

On Fri, Jun 30, 2023 at 12:01:52PM +0200, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/media/mediatek,mt8365-camsv.yaml | 113 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> new file mode 100644
> index 000000000000..d81fa5d6db74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023 MediaTek, BayLibre
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek CAMSV 3.0
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Julien Stephan <jstephan@baylibre.com>
> +  - Andy Hsieh <andy.hsieh@mediatek.com>
> +
> +description:
> +  The CAMSV is a set of DMA engines connected to the SENINF CSI-2
> +  receivers. The number of CAMSVs depend on the SoC model.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-camsv
> +
> +  reg:
> +    maxItems: 3
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: cam clock
> +      - description: camtg clock
> +      - description: camsv clock
> +
> +  clock-names:
> +    items:
> +      - const: camsys_cam_cgpdn
> +      - const: camsys_camtg_cgpdn
> +      - const: camsys_camsv
> +
> +  iommus:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false

Drop

> +        description: connection point for camsv0
> +
> +        properties:

Drop

> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - iommus
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camsv1: camsv@15050000 {
> +            compatible = "mediatek,mt8365-camsv";
> +            reg = <0 0x15050000 0 0x0040>,
> +            <0 0x15050208 0 0x0020>,
> +            <0 0x15050400 0 0x0100>;
> +            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> +            clocks = <&camsys CLK_CAM>,
> +            <&camsys CLK_CAMTG>,
> +            <&camsys CLK_CAMSV0>;
> +            clock-names = "camsys_cam_cgpdn", "camsys_camtg_cgpdn",
> +            "camsys_camsv";
> +            iommus = <&iommu M4U_PORT_CAM_IMGO>;
> +            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    camsv1_endpoint: endpoint {
> +                        remote-endpoint = <&seninf_camsv1_endpoint>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9fda342ad331..60b2bceca584 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13355,6 +13355,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:	Julien Stephan <jstephan@baylibre.com>
>  M:	Andy Hsieh <andy.hsieh@mediatek.com>
>  S:	Supported
> +F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>  F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
>  F:	drivers/media/platform/mediatek/isp/isp_30/seninf/*
>  
> -- 
> 2.41.0
> 

