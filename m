Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F6CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 00:43:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A70960F0F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 00:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A70960F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ensAOqfqxqhBz1qWifBdB7RQdKLA1EoRlGVNrlOsas=; b=eR0wP3mBP8elv2
	+t8fJa8vkCrly/WSsgvuXyxSjvJJwsyOJoe2PwkG1uB2z2bQGNjQGww7D8uzwPvuD0QImcnZc3GB8
	2+vP1dIs17v8idMRUbHvJerGTlb55rdCsW16NbcB353DzAEqVcFquvsQVYdkZyM0j/Id5h+9YSG54
	uDI08HUb22icXaquZS2GJxoJrvz9Nkcmf7+ehgVVdgrXMdQZPNpxLZ5DkTL3CdjI2LKFMWdC1MoMf
	hmLPpAsYKOgG8vsdxLCZ+oIXI2S1E3xPvtvp4qZxOCGrXp5VXCwrt5khOoegi/51O37hwFTejL4Ke
	UWOiwd+nKpbF/4ziv0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma5t5-00B5Pw-R9; Tue, 12 Oct 2021 00:43:23 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma5t2-00B5P0-1z; Tue, 12 Oct 2021 00:43:21 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 d21-20020a9d4f15000000b0054e677e0ac5so9865768otl.11; 
 Mon, 11 Oct 2021 17:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C0veIXD12tRwkmARbIUPpytHwuGDS9GaI5ZCAL0YxtM=;
 b=TwG02KGygVHaFvPLyv0CSivWpiUHOyybw+DTS6i5iShlSDHJzjxyHfoc9SJUIhtq+g
 Fswhlqxp/IB+MuAfcZGth3gC4KMNcrJWr54FS6txrmmvrAuqERfL50jeI8pyc+kVzbxr
 FukRq+ic2DHHCNLSa9qABxMTQrN6pZrrPDr3AluTmXYSuGT6nLY3lYTbS6YzlovFtwWp
 Vq3tgp5b5gjUjI8xk9iPocbZYSIurDzuOzTUOg/kEMJOqKxeFtJBivXdu3yZ5Tb5dc8K
 1+6bIi4aozwRLaZlnGOuvhWu81xPZ8+g5yhW1aPkCL+4msRKtFhmomrP8MLsl9hifcdJ
 7qSg==
X-Gm-Message-State: AOAM533wedO3BOmmEFDasTLUl5AIzLLp6bKQRznp0Ft+CGPNf2Nu2NYC
 W85ry00voyzVVqICvqq4lQ==
X-Google-Smtp-Source: ABdhPJy8M+f4nFxCTH13TvMUHFxJ1m8soMYBOgZhxmB4w7ZoRNTKIjUDBsh0NAvX07BegYnRBAkEOw==
X-Received: by 2002:a05:6830:44a9:: with SMTP id
 r41mr678852otv.230.1633999398628; 
 Mon, 11 Oct 2021 17:43:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p15sm1877611otq.59.2021.10.11.17.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 17:43:17 -0700 (PDT)
Received: (nullmailer pid 1474130 invoked by uid 1000);
 Tue, 12 Oct 2021 00:43:16 -0000
Date: Mon, 11 Oct 2021 19:43:16 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Message-ID: <YWTaJOXGgF2bHznv@robh.at.kernel.org>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-3-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211011094624.3416029-3-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_174320_129732_1841C261 
X-CRM114-Status: GOOD (  18.62  )
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

On Mon, Oct 11, 2021 at 11:46:19AM +0200, Markus Schneider-Pargmann wrote:
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> new file mode 100644
> index 000000000000..f7a35962c23b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Display Port Controller
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the Mediatek (embedded) Display Port controller
> +  present on some Mediatek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-edp_tx
> +      - mediatek,mt8195-dp_tx

Are these blocks different?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: faxi clock
> +
> +  clock-names:
> +    items:
> +      - const: faxi
> +
> +  power-domains:
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
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +    dp_tx: edp_tx@1c500000 {
> +        compatible = "mediatek,mt8195-edp_tx";
> +        reg = <0 0x1c500000 0 0x8000>;
> +        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
> +        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&edp_pin>;
> +        status = "okay";

Don't show status in examples.

> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                edp_in: endpoint {
> +                    remote-endpoint = <&dp_intf0_out>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                edp_out: endpoint {
> +                	remote-endpoint = <&panel_in>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.33.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
