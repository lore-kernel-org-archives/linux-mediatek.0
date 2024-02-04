Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F213C48286
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Feb 2024 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WPGYWENLz/sIakGt75SCkmHKLe09AJ2u1vWvmY+Csg=; b=oObciV7rMDjHqSg0B5NF72f7Et
	clPr0ZV3SuWE/08dHN4qmWl8OTJTEz6PxZSFehZcciWaoou30fWB1Yp3Vcny/gwUMbO/iCge6Nz0M
	FNydnXFcA/l4dwWDNizxzA6JBRpgUA7L63kP1/bEMtD7emqx3FBEFbepJDQPx5A3jfREaboZhQjof
	mf5Ktdlx48397RJZkB3OfPpYm9zPnEKJesTijJ7QBQLfIG2z8OwRnQZ+Rn7BCxBBUrNRV88LMuoQQ
	Nu96OUlIxaFJM9H02dfU8onSH5w7C3KBME06UkFoC78Xsbs2e+OYy17DrUl4jJMcbvqDSQVKpWUX7
	8SLXXhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWctj-00000000tvU-24Y2;
	Sun, 04 Feb 2024 13:51:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWctg-00000000tuS-102b;
	Sun, 04 Feb 2024 13:51:01 +0000
Received: from pendragon.ideasonboard.com (unknown [151.216.142.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9F6C720;
	Sun,  4 Feb 2024 14:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707054574;
	bh=4/u6c8A7HPqivSqSRYin51hS3p0zUCCOPF4PXCVBzYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WFXe4dUJuMzaOEeLaWAsJL0smy/yif2Tw2PnsZJwJZ0fYQAKJsFHBBLkxOO8SOxAJ
	 FLUVjjt/qc56Z5GGKRLMPL2MEeq/6pHs41aZU6UJx1idAkEaqURxI8C8Nweik+Ssb4
	 3N2pN5Ch1jqlWKbR+g87QY5aTUTVAvPlY2I3AvMA=
Date: Sun, 4 Feb 2024 15:50:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, sakari.ailus@linux.intel.com,
	shengnan.wang@mediatek.com, yaya.chang@mediatek.com,
	10572168@qq.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
	yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jacopo.mondi@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	heiko@sntech.de, jernej.skrabec@gmail.com, macromorgan@hotmail.com,
	linus.walleij@linaro.org, hdegoede@redhat.com,
	tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net,
	andy.shevchenko@gmail.com, bingbu.cao@intel.com,
	dan.scally@ideasonboard.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/2] media: dt-bindings: i2c: add GalaxyCore GC08A3
 image sensor
Message-ID: <20240204135056.GA6804@pendragon.ideasonboard.com>
References: <20240204061538.2105-1-zhi.mao@mediatek.com>
 <20240204061538.2105-2-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240204061538.2105-2-zhi.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_055100_446028_7892E280 
X-CRM114-Status: GOOD (  17.04  )
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

Hi Zhi,

Thank you for the patch.

On Sun, Feb 04, 2024 at 02:15:37PM +0800, Zhi Mao wrote:
> Add YAML device tree binding for GC08A3 CMOS image sensor,
> and the relevant MAINTAINERS entries.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/media/i2c/galaxycore,gc08a3.yaml | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> new file mode 100644
> index 000000000000..8c09e8c121e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2023 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc08a3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GalaxyCore gc08a3 1/4" 8M Pixel MIPI CSI-2 sensor
> +
> +maintainers:
> +  - Zhi Mao <zhi.mao@mediatek.com>
> +
> +description:
> +  The gc08a3 is a raw image sensor with an MIPI CSI-2 image data
> +  interface and CCI (I2C compatible) control bus. The output format
> +  is raw Bayer.
> +
> +properties:
> +  compatible:
> +    const: galaxycore,gc08a3
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dovdd-supply: true
> +
> +  avdd-supply: true
> +
> +  dvdd-supply: true
> +
> +  reset-gpios:
> +    description: Reference to the GPIO connected to the RESETB pin.
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +    description:
> +      Output port node, single endpoint describing the CSI-2 transmitter.
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +
> +          link-frequencies: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - dovdd-supply
> +  - avdd-supply
> +  - dvdd-supply
> +  - reset-gpios
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sensor@31 {
> +            compatible = "galaxycore,gc08a3";
> +            reg = <0x31>;
> +
> +            clocks = <&gc08a3_clk>;
> +
> +            reset-gpios = <&pio 19 GPIO_ACTIVE_HIGH>;
> +
> +            avdd-supply = <&gc08a3_avdd>;
> +            dovdd-supply = <&gc08a3_dovdd>;
> +            dvdd-supply = <&gc08a3_dvdd>;
> +
> +            port {
> +                sensor_out: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <336000000 207000000>;
> +                    remote-endpoint = <&seninf_csi_port_0_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart

