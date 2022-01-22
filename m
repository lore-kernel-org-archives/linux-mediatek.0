Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED67C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 00:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfgBCbNV/8zelw3FHesu6Jpx9BodWPTHcAMt6x/iLEM=; b=RA4x8Njce3NKK4
	71Ukp9zPtBSpJrPhoMOKgwYFCi4BWXXHFfOg+Ns3LmNvuUQzTjihtRHt75zpqVW/62HUoQTdvTYCS
	Ti1RoJj8t05dZXess6s2c+qFMOGEegbORfmhaPEb5aF5UCPPScZsEQKYbaZhUWNIn0JtpanBmPNyp
	Un+LdFS/Tr54VN6i7ob2tBi/6cWl3AsXCc1Tp4q59rjYXHACcIzMSBtSvnOh3f+xI43KX4hYZR1ak
	w1QOT9uP0N+VamAMUCdL8N0sIaQSmicmDsMOKLrhDW8/Ptw7VJwlxQrBE8d1CexMT2u1SQWHnE6VX
	MI5M6hzeauT0MiCDC42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB4iX-00GKSW-WA; Sat, 22 Jan 2022 00:57:22 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB4iL-00GKNk-2o; Sat, 22 Jan 2022 00:57:10 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 b15-20020a4a878f000000b002dccc412166so3809719ooi.11; 
 Fri, 21 Jan 2022 16:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L8s5mBf0UpHtEY/qnha+jJ91j6Jh+IbHCl/z4sZacfE=;
 b=sMD8EdUm351TuMfCh/nZXK735dCbL2fkww8AHfEZLcod7dERgW7ChDjTZWPCLbawBe
 KaLGB63ZIZT2XEGh67r2ubgGQus/nE8vNDMrqKeVGDBX8UEbHtYD4rD4M9lzLzv9Gtky
 gr88rSvZmW1h9j4OCcsLfyt/v5LqKD8VEyUi7VoSFfmNKwkTS4NV0wDEKF73031FnIcV
 KVOL/tt+4sAcefB6l0aioVBYfj+BtCD/iQDFqaWNLyjeqbG1YPEhc1cDZ52+ldfSLZgV
 HJUVnG5bOcvNJzTh/ZvK1Ihrn1uHlRiUdgvEgoYOw5o8gLlgzaDUDhGi2gPtGJWbtzlE
 dTHA==
X-Gm-Message-State: AOAM531vUdGANEjdZ/5EJkuAXPR5N10BJCu38MN7tkmBBn98z/6jcpc3
 w7nkWI5unLR6JmIdcaKECw==
X-Google-Smtp-Source: ABdhPJwoE6llKf4bLoRmQCX2d407a5SUn2SLcLtJmjJSCrEoydcDf0xzWqmXAlbXvD+PJuNn4xBZJA==
X-Received: by 2002:a4a:c57:: with SMTP id n23mr4154768ooe.55.1642813023151;
 Fri, 21 Jan 2022 16:57:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q25sm1916041oiw.27.2022.01.21.16.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 16:57:02 -0800 (PST)
Received: (nullmailer pid 1955852 invoked by uid 1000);
 Sat, 22 Jan 2022 00:57:01 -0000
Date: Fri, 21 Jan 2022 18:57:01 -0600
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V2 2/3] dt-bindings: spi: Convert spi-mt65xx to json-schema
Message-ID: <YetWXSzugRwKb+xA@robh.at.kernel.org>
References: <20220112103609.17421-1-leilk.liu@mediatek.com>
 <20220112103609.17421-3-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220112103609.17421-3-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_165709_160225_6DDB92B0 
X-CRM114-Status: GOOD (  17.89  )
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

On Wed, Jan 12, 2022 at 06:36:08PM +0800, Leilk Liu wrote:
> Convert Mediatek ARM SOC's SPI Master controller binding
> to json-schema format.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  .../bindings/spi/mediatek,spi-mt65xx.yaml     | 99 +++++++++++++++++++
>  .../devicetree/bindings/spi/spi-mt65xx.txt    | 68 -------------
>  2 files changed, 99 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-mt65xx.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> new file mode 100644
> index 000000000000..71f0cf6e5d70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI Bus controller for MediaTek ARM SoCs
> +
> +maintainers:
> +  - Leilk Liu <leilk.liu@mediatek.com>
> +
> +allOf:
> +  - $ref: /spi/spi-controller.yaml#

/schemas/spi/spi-controller.yaml#

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt7629-spi
> +          - const: mediatek,mt7622-spi
> +      - items:
> +          - enum:
> +              - mediatek,mt8516-spi
> +          - const: mediatek,mt2712-spi
> +      - items:
> +          - enum:
> +              - mediatek,mt6779-spi
> +              - mediatek,mt8192-spi
> +              - mediatek,mt8195-spi
> +          - const: mediatek,mt6765-spi

> +      - const: mediatek,mt2701-spi
> +      - const: mediatek,mt2712-spi
> +      - const: mediatek,mt6589-spi
> +      - const: mediatek,mt6765-spi
> +      - const: mediatek,mt6893-spi
> +      - const: mediatek,mt7622-spi
> +      - const: mediatek,mt8135-spi
> +      - const: mediatek,mt8173-spi
> +      - const: mediatek,mt8183-spi

All these can be 1 enum.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock used for the parent clock
> +      - description: clock used for the muxes clock
> +      - description: clock used for the clock gate
> +
> +  clock-names:
> +    items:
> +      - const: parent-clk
> +      - const: sel-clk
> +      - const: spi-clk
> +
> +  mediatek,pad-select:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 4
> +    items:
> +      enum: [0, 1, 2, 3]
> +    description:
> +      specify which pins group(ck/mi/mo/cs) spi controller used.
> +      This is an array.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi@1100a000 {
> +      compatible = "mediatek,mt8173-spi";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      reg = <0x1100a000 0x1000>;
> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>;
> +      clocks = <&topckgen CLK_TOP_SYSPLL3_D2>,
> +               <&topckgen CLK_TOP_SPI_SEL>,
> +               <&pericfg CLK_PERI_SPI0>;
> +      clock-names = "parent-clk", "sel-clk", "spi-clk";
> +      cs-gpios = <&pio 105 GPIO_ACTIVE_LOW>, <&pio 72 GPIO_ACTIVE_LOW>;
> +      mediatek,pad-select = <1>, <0>;
> +    };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
