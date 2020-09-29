Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA22DC4727C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 20:06:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32EA32076A
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 20:05:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tEGX2wN+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32EA32076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m/VZGCbuC3bNNpdi78kJ1foBZ3eBA3VFgxKQMFP+nKU=; b=tEGX2wN+rvrKCJacPGn3j7fY2
	qIh4hxlkHnBKjHk8Ji41yNxgbSJexzBTq0zwYFbA/aBQ49zxr28Y4h6IlXIpE6ccJRa2Lad2KEMpd
	0YPV1TmMotrWwnzsrJbVEdWhr6tvUY0mCtxzYjrV0za2dGA3iLOJFNfAnSBiqHHuIuLS66bQwRFOe
	baBdD3il0UV6n/iVbfB6xlAAexAWFz/zEINGVNsptBCfWg/A+MXhwUZgB7mE699IxrRDWXKh3MCSd
	tCjdSVWmpbTAFwj2Uv3cc/eCj+e/fTjcj5ZFki6dmtQOIA4NYg7I58QVcbhXMJZUaHLAcHUy+GqfB
	e4bWRqMog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNLsi-0003iq-55; Tue, 29 Sep 2020 20:05:48 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNLsd-0003i0-2L; Tue, 29 Sep 2020 20:05:44 +0000
Received: by mail-ot1-f66.google.com with SMTP id g96so5689096otb.12;
 Tue, 29 Sep 2020 13:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5O6/yiKa9W0am9X4z8PvdhY0AeOo2G7Nxi3IcgMPrLY=;
 b=IkseehmfstqQYC/qNb7UUmi9gzT/1+8lIkBZhCBVljs9hpi3xgY6xWrZAJi8TAagab
 HCjpFa0vDICe+lHw08ABcAiXem8ugWlHoYMpF33CWB+odmOP4yS3/FG83V7S2/9G9Q7c
 FdU2bxArbbzGv2LEbn+zZ9wRC3c4LaCvVrlJsDIO/GMDzJZm4xdPREhuEJZGG2BQDK+f
 urkEvKu8YNsZU3HNgtAIzFnhKfFUxwoHRuoDLd06NYuCtMCoVQlZ8BRAUg40CmbUKN6u
 omP759OF6Wm6IdBWEiiXxOaENNc25+fVOO5tqMLwFahVVcGjvloXoiNaGCyvz573JCul
 N0BQ==
X-Gm-Message-State: AOAM533BkdoBIUlOeGjHcSkZbpneuz9m3iDDSoXZbsj757V6OiXxPKKU
 huYpYTO7aSq3xBy8FHtWZw==
X-Google-Smtp-Source: ABdhPJztlT0j0a0jN6wipAi/qH4SpcVId83VVM6XK0PrviV73T9QkjU0nkO3vjApRAX8/kAkuw79xQ==
X-Received: by 2002:a05:6830:196:: with SMTP id
 q22mr3762671ota.221.1601409942312; 
 Tue, 29 Sep 2020 13:05:42 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w125sm1222799oia.57.2020.09.29.13.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 13:05:41 -0700 (PDT)
Received: (nullmailer pid 1073610 invoked by uid 1000);
 Tue, 29 Sep 2020 20:05:40 -0000
Date: Tue, 29 Sep 2020 15:05:40 -0500
From: Rob Herring <robh@kernel.org>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: Convert mtk-sd to json-schema
Message-ID: <20200929200540.GA1051185@bogus>
References: <20200928130918.32326-1-wenbin.mei@mediatek.com>
 <20200928130918.32326-2-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928130918.32326-2-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_160543_134120_A9540FBC 
X-CRM114-Status: GOOD (  24.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 28, 2020 at 09:09:15PM +0800, Wenbin Mei wrote:
> Convert the mtk-sd binding to DT schema format using json-schema.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.txt        |  75 --------
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 165 ++++++++++++++++++
>  2 files changed, 165 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.yaml


> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> new file mode 100644
> index 000000000000..2d5ab1411cd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -0,0 +1,165 @@
> +# MTK-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MTK MSDC Storage Host Controller Binding
> +
> +maintainers:
> +  - Ulf Hansson <ulf.hansson@linaro.org>

Usually this is the h/w block owner, not a subsystem maintainer.

> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt8135-mmc
> +      - const: mediatek,mt8173-mmc
> +      - const: mediatek,mt8183-mmc
> +      - const: mediatek,mt8516-mmc
> +      - const: mediatek,mt6779-mmc
> +      - const: mediatek,mt2701-mmc
> +      - const: mediatek,mt2712-mmc
> +      - const: mediatek,mt7622-mmc

All these can be an enum. And sort please.

> +      - items:
> +        - const: mediatek,mt7623-mmc
> +        - const: mediatek,mt2701-mmc
> +      - const: mediatek,mt7620-mmc
> +
> +  reg:
> +    description:
> +      physical base address of the controller and length.

Drop this.

> +    minItems: 1
> +    maxItems: 2

If more than 1, need to say what each entry is:

items:
  - description: ...
  - description: ...

> +
> +  interrupts:
> +    description:
> +      Should contain MSDC interrupt number.

Drop.

> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Should contain phandle for the clock feeding the MMC controller.
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - description: source clock (required).
> +      - description: HCLK which used for host (required).
> +      - description: independent source clock gate (required for MT2712).
> +      - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - const: source
> +      - const: hclk
> +      - const: source_cg
> +      - const: bus_clk
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: state_uhs
> +
> +  pinctrl-0:
> +    description:
> +      should contain default/high speed pin ctrl.
> +    maxItems: 1
> +
> +  pinctrl-1:
> +    description:
> +      should contain uhs mode pin ctrl.
> +    maxItems: 1
> +
> +  vmmc-supply:
> +    description:
> +      power to the Core.
> +
> +  vqmmc-supply:
> +    description:
> +      power to the IO.
> +
> +  assigned-clocks:
> +    description:
> +      PLL of the source clock.

How many (maxItems)?

> +
> +  assigned-clock-parents:
> +    description:
> +      parent of source clock, used for HS400 mode to get 400Mhz source clock.
> +
> +  hs400-ds-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HS400 DS delay setting.
> +
> +  mediatek,hs200-cmd-int-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HS200 command internal delay setting.
> +      This field has total 32 stages.
> +      The value is an integer from 0 to 31.

minimum: 0
maximum: 31

Add any constraints on other properties too.

> +
> +  mediatek,hs400-cmd-int-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HS400 command internal delay setting.
> +      This field has total 32 stages.
> +      The value is an integer from 0 to 31.
> +
> +  mediatek,hs400-cmd-resp-sel-rising:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      HS400 command response sample selection.
> +      If present, HS400 command responses are sampled on rising edges.
> +      If not present, HS400 command responses are sampled on falling edges.
> +
> +  mediatek,latch-ck:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some SoCs do not support enhance_rx, need set correct latch-ck to avoid
> +      data crc error caused by stop clock(fifo full) Valid range = [0:0x7].
> +      if not present, default value is 0.
> +      applied to compatible "mediatek,mt2701-mmc".
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: hrst
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    mmc0: mmc@11230000 {
> +        compatible = "mediatek,mt8173-mmc";
> +        reg = <0x11230000 0x1000>;
> +        interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_LOW>;
> +        vmmc-supply = <&mt6397_vemc_3v3_reg>;
> +        vqmmc-supply = <&mt6397_vio18_reg>;
> +        clocks = <&pericfg CLK_PERI_MSDC30_0>,
> +                 <&topckgen CLK_TOP_MSDC50_0_H_SEL>;
> +        clock-names = "source", "hclk";
> +        pinctrl-names = "default", "state_uhs";
> +        pinctrl-0 = <&mmc0_pins_default>;
> +        pinctrl-1 = <&mmc0_pins_uhs>;
> +        assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
> +        hs400-ds-delay = <0x14015>;
> +        mediatek,hs200-cmd-int-delay = <26>;
> +        mediatek,hs400-cmd-int-delay = <14>;
> +        mediatek,hs400-cmd-resp-sel-rising;
> +    };
> +
> +...
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
