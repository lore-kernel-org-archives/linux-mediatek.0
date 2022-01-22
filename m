Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55924C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 00:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWf+pqALIZgZSYB6A8eLtEjRqyA98LgkwivnCM3ktds=; b=Izi6sFirIqfFnb
	FbYXqv19b8SP3pEYo63ZyxqY09KNuOye4PmYwZeSJoibDBtO0aToB/ek/3uqYtwc7R8xQ3SYXVmKa
	HvmP4+5AWUWgkYvoHZRhUwt8h/8l/9F+vzKQzRzH5u5GObByCB/WQI+8+aFUWs44fR5jhK1F+Kk+9
	/RHVzBLwdnJeGLtD89LrYVA8LzUFNhwoyP8BilhepRJYwc+bzKKT7FzwSn3iU8u430S5kGQVEoVHk
	NMJ65+ypIiHCx6sIwC3hGKD7Jr6B/IOw/Nx9j4jkRZMGsfSaW4cRAB4XAa6l4JvpX0SYq/Z2fYU72
	wfvH9S7bqg8mb5UVnm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB4el-00GK6s-BR; Sat, 22 Jan 2022 00:53:27 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB4eZ-00GK5N-MX; Sat, 22 Jan 2022 00:53:17 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 t4-20020a05683022e400b00591aaf48277so13810530otc.13; 
 Fri, 21 Jan 2022 16:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NwEsLoY/zSy6+8ww4zg4hbAmBeGUwDI4bJpwjmotxhw=;
 b=s1XsTvjLBIJLAa5RrLwT+IOC/USUmFe/ZUQhDCZAs+DMYcSkOhx3Hf/Bph22MqYQYg
 Q+uJHhSocgeHoE7muE+qtea4lNIFZYOxfBWfwPcJINKdLoeJC10TjIHNCwLt7Dv5Kwwm
 34DWr4sCajiO7/iY5xc9UfL00wyVIDbgtCGzxinUf3gccT+GxLuxKWSh8KNWtocUGQPH
 +ayF5OewmkfE9T4kIHgbUqIj/BUPdKSfuAYqmWmIVNntoitl6kjT6KjTrkPHkv6+tSP7
 kNeiKdgiFpwvRpMbsqzxBRNJs+osyrP01Gi51RQ/laH40VPWfxhmHmu9BEMEp4KFb3R+
 rOPw==
X-Gm-Message-State: AOAM531WD3U0qrdRt/Ei5xZf/4hzeRVOAXLIPyRqfGIaWTWsaLC2Iig7
 +mFh1dqwQ2Y8Xi/wkFKb/w==
X-Google-Smtp-Source: ABdhPJxtvDyzMhYHyXQ+iSpTb2lRwqvIuBsflwOHWmHmO5EdG97wJnvBRPsDourd04+3nSBlNcks0Q==
X-Received: by 2002:a9d:7d11:: with SMTP id v17mr4619824otn.34.1642812792929; 
 Fri, 21 Jan 2022 16:53:12 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k17sm1771351otk.80.2022.01.21.16.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 16:53:12 -0800 (PST)
Received: (nullmailer pid 1949948 invoked by uid 1000);
 Sat, 22 Jan 2022 00:53:11 -0000
Date: Fri, 21 Jan 2022 18:53:11 -0600
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V2 1/3] dt-bindings: spi: Convert spi-slave-mt27xx to
 json-schema
Message-ID: <YetVd7IR7FDt+nz3@robh.at.kernel.org>
References: <20220112103609.17421-1-leilk.liu@mediatek.com>
 <20220112103609.17421-2-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220112103609.17421-2-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_165315_766238_8EBE4912 
X-CRM114-Status: GOOD (  17.50  )
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

On Wed, Jan 12, 2022 at 06:36:07PM +0800, Leilk Liu wrote:
> Convert Mediatek ARM SOC's SPI Slave controller binding
> to json-schema format.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  .../spi/mediatek,spi-slave-mt27xx.yaml        | 73 +++++++++++++++++++
>  .../bindings/spi/spi-slave-mt27xx.txt         | 33 ---------
>  2 files changed, 73 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-slave-mt27xx.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
> new file mode 100644
> index 000000000000..3364fff08cca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/mediatek,spi-slave-mt27xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI Slave controller for MediaTek ARM SoCs
> +
> +maintainers:
> +  - Leilk Liu <leilk.liu@mediatek.com>
> +
> +allOf:
> +  - $ref: /spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:

> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2712-spi-slave
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-spi-slave

Just:

       enum:
         - mediatek,mt2712-spi-slave
         - mediatek,mt8195-spi-slave

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock used for the clock gate

Just 'maxItems: 1'

> +
> +  clock-names:
> +    items:
> +      - const: spi
> +
> +  assigned-clocks:
> +    maxItems: 1
> +    description: |
> +      The mux clock for the given platform.
> +
> +  assigned-clock-parents:
> +    maxItems: 1
> +    description: |
> +      The parent of mux clock for the given platform.

You can drop assigned-clocks. They are always allowed on nodes with 
'clocks'.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt2712-clk.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi@10013000 {
> +      compatible = "mediatek,mt2712-spi-slave";
> +      reg = <0x10013000 0x100>;
> +      interrupts = <GIC_SPI 283 IRQ_TYPE_LEVEL_LOW>;
> +      clocks = <&infracfg CLK_INFRA_AO_SPI1>;
> +      clock-names = "spi";
> +      assigned-clocks = <&topckgen CLK_TOP_SPISLV_SEL>;
> +      assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL1_D2>;
> +    };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
