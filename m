Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D112CC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8bhw8KWURng5sgFh0E/mD3292ZtU7YxiWBlIMJpOYY=; b=Fd7oFFwJqziiv0/oeGM+KUAlsI
	sRm9muqHLpcfF8pM9ixbgIbV9ghY7hJZ21Gs/0y5o8dPCVL15cP2WAJX0EeyNFwg7HMBQnuQKHtxc
	zp2Rlj8kvwPQSHc3fQmLCEnbebTIFmvlSjQ7kNEzxlp/8oSQv9aDlfD0sCg6ScnjSQ7BP82JTFA98
	x/TTaPZQZmYF5Drhn76QMfrYP4LuGWrsbKdZnbW7jzZbD4ROgsra78ubq/DzIpQf+s/pxC3/SRZK9
	u9zTTyFNP4UlE4ZtFicKV6x2hri2/gfZ9d/6CbavnkM4WXrHw47NAo1l9lbS0AThcEh1G7l933J/X
	tCj/HdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofOKa-006n9z-JP; Mon, 03 Oct 2022 16:30:12 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofOKT-006n7n-UI; Mon, 03 Oct 2022 16:30:11 +0000
Received: by mail-oi1-f178.google.com with SMTP id w13so11816793oiw.8;
        Mon, 03 Oct 2022 09:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Z8bhw8KWURng5sgFh0E/mD3292ZtU7YxiWBlIMJpOYY=;
        b=g+QQhIy+dPFzlGsQT2ycqxYiruywMG2j+H3TOt31iY5k2P5lvuRyAHijy3Wrsz4sdd
         AjY765pXbgm+py1yMeZYxyYDwpoBbaOtjXUTErT9wP9iagkVM3azjXYh6GnYnGUIHKps
         w9CuVpRwo9P5QZlZZ6Vv0BANz4VSRbmlC+EvXgebZIEKoCX9wyk9Pgqdt0aGmdlp/SFK
         +HBVgPw4sTj90z2EW1c14bLvuHX3kL2+gF/I1L09UklEChGW/s1r0baKsT1hTKWNXS5H
         4cEBoWssW9Ll8E7pgGuVZJEaYWhC5BVGYjWbS6QkmWJlBbRcZN9Z5tkaRpJ3XVxlAdxF
         M9QA==
X-Gm-Message-State: ACrzQf33zX657WtoVM1H03g1/q4NnJZoELivugYBvN64OKMi/Ss/w+J6
	EmJ+H5jxVi+/sd7pmUk8wA==
X-Google-Smtp-Source: AMsMyM7kaYivTKyMC0GBQUQuZJsRhUMyCBIBIpe90Y012jEle/2jTj0mEN9L2psWqu+lC5AHZFfeAA==
X-Received: by 2002:a05:6808:179e:b0:350:ae4d:dd3f with SMTP id bg30-20020a056808179e00b00350ae4ddd3fmr4354231oib.0.1664814603763;
        Mon, 03 Oct 2022 09:30:03 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d1-20020a056871040100b0010e73e252b8sm3070361oag.6.2022.10.03.09.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:30:03 -0700 (PDT)
Received: (nullmailer pid 2413088 invoked by uid 1000);
	Mon, 03 Oct 2022 16:30:02 -0000
Date: Mon, 3 Oct 2022 11:30:02 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de, alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Message-ID: <20221003163002.GA2407363-robh@kernel.org>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
 <20220930145701.18790-11-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930145701.18790-11-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_093006_002305_8FCD7C0B 
X-CRM114-Status: GOOD (  20.59  )
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

On Fri, Sep 30, 2022 at 10:56:59PM +0800, Trevor Wu wrote:
> Add mt8188 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8188-afe-pcm.yaml        | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> new file mode 100644
> index 000000000000..50d53c5d59ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8188-afe-pcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek AFE PCM controller for mt8188
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8188-audio

If the block is called 'AFE PCM controller', then perhaps use some of 
that for the name instead of just 'audio'.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: audiosys
> +
> +  memory-region:
> +    maxItems: 1
> +    description: |
> +      Shared memory region for AFE memif.  A "shared-dma-pool".
> +      See ../reserved-memory/reserved-memory.txt for details.

What does that file contain?

No need to provide generic descriptions of common properties, so the 
reference can just be dropped.

> +
> +  mediatek,topckgen:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

Don't need quotes.

> +    description: The phandle of the mediatek topckgen controller
> +
> +  mediatek,infracfg:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of the mediatek infracfg controller
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 26M clock
> +      - description: audio pll1 clock
> +      - description: audio pll2 clock
> +      - description: clock divider for i2si1_mck
> +      - description: clock divider for i2si2_mck
> +      - description: clock divider for i2so1_mck
> +      - description: clock divider for i2so2_mck
> +      - description: clock divider for dptx_mck
> +      - description: a1sys hoping clock
> +      - description: audio intbus clock
> +      - description: audio hires clock
> +      - description: audio local bus clock
> +      - description: mux for dptx_mck
> +      - description: mux for i2so1_mck
> +      - description: mux for i2so2_mck
> +      - description: mux for i2si1_mck
> +      - description: mux for i2si2_mck
> +      - description: audio 26m clock
> +
> +  clock-names:
> +    items:
> +      - const: clk26m
> +      - const: apll1_ck
> +      - const: apll2_ck
> +      - const: apll12_div0
> +      - const: apll12_div1
> +      - const: apll12_div2
> +      - const: apll12_div3
> +      - const: apll12_div9
> +      - const: a1sys_hp_sel
> +      - const: aud_intbus_sel
> +      - const: audio_h_sel
> +      - const: audio_local_bus_sel
> +      - const: dptx_m_sel
> +      - const: i2so1_m_sel
> +      - const: i2so2_m_sel
> +      - const: i2si1_m_sel
> +      - const: i2si2_m_sel
> +      - const: adsp_audio26m
> +
> +  mediatek,etdm-in1-chn-disabled:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 16
> +    description: Specify which input channel should be disabled.

What value disables/enables?

items:
  enum: [ ??? ]

> +
> +  mediatek,etdm-in2-chn-disabled:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 16
> +    description: Specify which input channel should be disabled.
> +
> +patternProperties:
> +  "^mediatek,etdm-in[1-2]-mclk-always-on-rate-hz$":
> +    description: Specify etdm in mclk output rate for always on case.
> +
> +  "^mediatek,etdm-out[1-3]-mclk-always-on-rate-hz$":
> +    description: Specify etdm out mclk output rate for always on case.
> +
> +  "^mediatek,etdm-in[1-2]-multi-pin-mode$":
> +    type: boolean
> +    description: if present, the etdm data mode is I2S.
> +
> +  "^mediatek,etdm-out[1-3]-multi-pin-mode$":
> +    type: boolean
> +    description: if present, the etdm data mode is I2S.
> +
> +  "^mediatek,etdm-in[1-2]-cowork-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      etdm modules can share the same external clock pin. Specify
> +      which etdm clock source is required by this etdm in moudule.
> +    enum:
> +      - 0 # etdm1_in
> +      - 1 # etdm2_in
> +      - 2 # etdm1_out
> +      - 3 # etdm2_out
> +
> +  "^mediatek,etdm-out[1-2]-cowork-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      etdm modules can share the same external clock pin. Specify
> +      which etdm clock source is required by this etdm out moudule.
> +    enum:
> +      - 0 # etdm1_in
> +      - 1 # etdm2_in
> +      - 2 # etdm1_out
> +      - 3 # etdm2_out
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - resets
> +  - reset-names
> +  - mediatek,topckgen
> +  - mediatek,infracfg
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - memory-region
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    afe: afe@10b10000 {
> +        compatible = "mediatek,mt8188-audio";
> +        reg = <0x10b10000 0x10000>;
> +        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
> +        resets = <&watchdog 14>;
> +        reset-names = "audiosys";
> +        mediatek,topckgen = <&topckgen>;
> +        mediatek,infracfg = <&infracfg_ao>;
> +        power-domains = <&spm 7>; //MT8195_POWER_DOMAIN_AUDIO
> +        memory-region = <&snd_dma_mem_reserved>;
> +        clocks = <&clk26m>,
> +                 <&topckgen 72>, //CLK_TOP_APLL1
> +                 <&topckgen 73>, //CLK_TOP_APLL2
> +                 <&topckgen 186>, //CLK_TOP_APLL12_CK_DIV0
> +                 <&topckgen 187>, //CLK_TOP_APLL12_CK_DIV1
> +                 <&topckgen 188>, //CLK_TOP_APLL12_CK_DIV2
> +                 <&topckgen 189>, //CLK_TOP_APLL12_CK_DIV3
> +                 <&topckgen 191>, //CLK_TOP_APLL12_CK_DIV9
> +                 <&topckgen 83>, //CLK_TOP_A1SYS_HP
> +                 <&topckgen 31>, //CLK_TOP_AUD_INTBUS
> +                 <&topckgen 32>, //CLK_TOP_AUDIO_H
> +                 <&topckgen 69>, //CLK_TOP_AUDIO_LOCAL_BUS
> +                 <&topckgen 81>, //CLK_TOP_DPTX
> +                 <&topckgen 77>, //CLK_TOP_I2SO1
> +                 <&topckgen 78>, //CLK_TOP_I2SO2
> +                 <&topckgen 79>, //CLK_TOP_I2SI1
> +                 <&topckgen 80>, //CLK_TOP_I2SI2
> +                 <&adsp_audio26m 0>; //CLK_AUDIODSP_AUDIO26M
> +        clock-names = "clk26m",
> +                      "apll1_ck",
> +                      "apll2_ck",
> +                      "apll12_div0",
> +                      "apll12_div1",
> +                      "apll12_div2",
> +                      "apll12_div3",
> +                      "apll12_div9",
> +                      "a1sys_hp_sel",
> +                      "aud_intbus_sel",
> +                      "audio_h_sel",
> +                      "audio_local_bus_sel",
> +                      "dptx_m_sel",
> +                      "i2so1_m_sel",
> +                      "i2so2_m_sel",
> +                      "i2si1_m_sel",
> +                      "i2si2_m_sel",
> +                      "adsp_audio_26m";
> +    };
> +
> +...
> -- 
> 2.18.0
> 
> 

