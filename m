Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23441C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 20:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynxFYeVYReMscKRbp1PGFWnDnfPfj0JbfYGgEj9QMa8=; b=EcqTQplmq0Jgri6YIlCvUqQ5r7
	Qlxgi+9CfAIavBejf0KE7AWMs6enm3xWIe1fhdUq74pu7MiiHXms3PvAC9on5tfSuZzvKo1dZmJx4
	x3xqZ8tTFLdbSCEfXsSi1431Z7GNXA6A+8+xQ3S7FgPJxi9Zrxe0oljfbQG0keEcSzYErTCCM/ZJ9
	U/rItjNGsQjZr+Ubv+lnHSvJtxo394miXyuv6FbxosRNf0JoH9XGkwhXYY/+L1L6qfGZ6rWjxLiZZ
	hIsokSsrPQghUP3Ewgg6s1DD86iXzC0y3KxI01klGd4Oz7mcwrPwbGmHvZXC9ETWIj+1jd8FwW5f+
	5W0+gNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDXF2-000ksC-Oi; Mon, 18 Jul 2022 20:21:20 +0000
Received: from mail-il1-f172.google.com ([209.85.166.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDXEz-000kq3-Ue; Mon, 18 Jul 2022 20:21:19 +0000
Received: by mail-il1-f172.google.com with SMTP id r4so2465391ilb.10;
        Mon, 18 Jul 2022 13:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ynxFYeVYReMscKRbp1PGFWnDnfPfj0JbfYGgEj9QMa8=;
        b=CjXHqzFjNVXy9Dg8gx9f+7OdxERnE8UHRG9rnlj9KxWZP4yPExPXwKnRptQ1kimFCd
         f1F3UwsQnd3w3E7yHemTkzAZvJz7lCrrlSVHGK41QMPE0E2FyQiOEWYDskrYUZv3xELb
         o34dV6DeScie1PtRFUVghuDJwBdXrRiC9vSfVNRVDAUiasYEY+dsEawFddUwOBrbSl2y
         xm/K2fuYIVUYWwmLBvzHtY7N3ixk1XgZlFiQBwcy7wNjCpKbUViK1+RWvXOUwMWL831Q
         toQJHpyeCC92SVs+bu7lQDdlgt/MqeqDf+ZUnE7qm56TUq0dThkWiFgQIfKxA0aOBy38
         4CxQ==
X-Gm-Message-State: AJIora/wdfW/ADxa1ld9sCdPfh4yHj87CPLckRVDPY3Kyd3HGJ0AdzLm
	bhVNhPzNxN0JS+VdSa7cgg==
X-Google-Smtp-Source: AGRyM1vaDDDUOeHt3lurvR3J3lSRNZ44pNwdJGSHidBa5vaIG068vrI+0SSo+eDbXIHdcLNloTdksA==
X-Received: by 2002:a05:6e02:1688:b0:2dc:822e:7c63 with SMTP id f8-20020a056e02168800b002dc822e7c63mr14459068ila.205.1658175675865;
        Mon, 18 Jul 2022 13:21:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d190-20020a6bb4c7000000b0066961821575sm6327392iof.34.2022.07.18.13.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 13:21:14 -0700 (PDT)
Received: (nullmailer pid 3481625 invoked by uid 1000);
	Mon, 18 Jul 2022 20:21:09 -0000
Date: Mon, 18 Jul 2022 14:21:09 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie, msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com, wenst@chromium.org, angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, liangxu.xu@mediatek.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v14 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <20220718202109.GA3465206-robh@kernel.org>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712111223.13080-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_132118_014569_CEB4C40A 
X-CRM114-Status: GOOD (  23.15  )
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

On Tue, Jul 12, 2022 at 07:12:14PM +0800, Bo-Chen Chen wrote:
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
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> new file mode 100644
> index 000000000000..e2d6cb314297
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -0,0 +1,115 @@
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
> +  Device tree bindings for the MediaTek display port TX (DP) and
> +  embedded display port TX (eDP) controller present on some MediaTek SoCs.
> +  MediaTek DP and eDP are different hardwares and they have different
> +  base address for registers, so we need two different compatibles to
> +  separate them.

As I said before, 'different base address for registers' is not a reason 
for different compatibles. If it was, then we'd never have a compatible 
string appear more than once in a DT.

Explain WHAT is different within the block. For example[1].

Rob

[1] https://lore.kernel.org/all/20220710084133.30976-10-dmitry.baryshkov@linaro.org/


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
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Output endpoint of the controller
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                description: |
> +                  number of lanes supported by the hardware.
> +                  The possible values:
> +                  0       - For 1 lane enabled in IP.
> +                  0 1     - For 2 lanes enabled in IP.
> +                  0 1 2 3 - For 4 lanes enabled in IP.
> +                minItems: 1
> +                maxItems: 4
> +            required:
> +              - data-lanes
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  max-linkrate-mhz:
> +    enum: [ 1620, 2700, 5400, 8100 ]
> +    description: maximum link rate supported by the hardware.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ports
> +  - max-linkrate-mhz
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +    dp_tx@1c600000 {
> +        compatible = "mediatek,mt8195-dp-tx";
> +        reg = <0x1c600000 0x8000>;
> +        power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
> +        interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
> +        max-linkrate-mhz = <8100>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dptx_in: endpoint {
> +                    remote-endpoint = <&dp_intf0_out>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                dptx_out: endpoint {
> +                    data-lanes = <0 1 2 3>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.18.0
> 
> 

