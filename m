Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F002ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzBt4DjigXC8g0JvW9vu6ypNBWVdZc7Uwm5ix9PgU48=; b=n4bNXB1GV26yN9WcOqas22SYEp
	LbxUfuVPISxdqOkR33Pa7KrZ6jrwbw3LE+GS9dxXDIJto4D6o/x+vIIrVsOoc5NZnGW/vWWuQViQg
	MAKk8doXneI3rr3pFMEjUdJt0J+/fzQJsyPU5QH5O+WVt9Q7TeoBS1JpXU86mEjUwenp9SHNGqInH
	jbY55ib7fUh2Imq9rvL2ZEYMQWGGoNlS8Os2p1TnhLv4A9So3ASKPzUlUWA/g/YxVt3uR3BKmXSc7
	0O490QrczZApwvZ+HABJH0TWt+9a/U+kJU97eaAcugjXhrs/UGBAi1rECo2MRirqIn8+LEh7sz0tD
	g208RG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on2Gx-002fYZ-6Z; Mon, 24 Oct 2022 18:34:03 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on2Gt-002fY0-79; Mon, 24 Oct 2022 18:34:00 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-13b103a3e5dso12871743fac.2;
        Mon, 24 Oct 2022 11:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzBt4DjigXC8g0JvW9vu6ypNBWVdZc7Uwm5ix9PgU48=;
        b=s03mh0s5RoL7u+HEyk2zUVqOIf8p9/SQyQ+iPQU1nBhXHoR4CF8q1Y7LMNiHtZgBPl
         fU2natrbvaZkPLfN6QVohDBKVCPdQ65uHthpvJVx1DBimBR6dlY3HrPUXcMHisg8nBal
         qM4y40fPaJp2VqQhgaJ8uE0nhHFt0rJPj2ax94M9FeZkG9MQBfnVmgl2Ce5PK3vwekwz
         JfMo2DLAp3GTh+4YBlUt20ODcCvjL5eGuWieuXTcTeyuXeJlISnRWR6QBUJIDfRpFyvh
         BWxm4KMxbukwdffnscFJBFayU4s7H5erIas4+2vPi9u3FxuGIj5thPEx73C4Td8bKe3L
         sqtQ==
X-Gm-Message-State: ACrzQf2wbgUaTfc2rvVCsNd/twq7qWF6QuB0lxbrmZxLxTkHMWr1VmCE
	F7bERk4yQYFX0HZK7GFbEQ==
X-Google-Smtp-Source: AMsMyM63340yiZHw0ES1B2eox2gZas5JR6G5Od4D1kId77fzF0hcyOGQovRxJgZLV1pXg57kCsy0hQ==
X-Received: by 2002:a05:6870:7020:b0:137:360d:1f7 with SMTP id u32-20020a056870702000b00137360d01f7mr21622717oae.255.1666636436938;
        Mon, 24 Oct 2022 11:33:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b24-20020a4ae818000000b004807de5c302sm293117oob.17.2022.10.24.11.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 11:33:56 -0700 (PDT)
Received: (nullmailer pid 2018985 invoked by uid 1000);
	Mon, 24 Oct 2022 18:33:57 -0000
Date: Mon, 24 Oct 2022 13:33:57 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, Project_Global_Chrome_Upstream_Group@mediatek.com, alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Message-ID: <20221024183357.GA2012388-robh@kernel.org>
References: <20221021082719.18325-1-trevor.wu@mediatek.com>
 <20221021082719.18325-11-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021082719.18325-11-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_113359_284752_CE0A7D74 
X-CRM114-Status: GOOD (  19.47  )
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

On Fri, Oct 21, 2022 at 04:27:17PM +0800, Trevor Wu wrote:
> Add mt8188 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8188-afe-pcm.yaml        | 187 ++++++++++++++++++
>  1 file changed, 187 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> new file mode 100644
> index 000000000000..b2c548c31e4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> @@ -0,0 +1,187 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8188-afe-pcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek AFE PCM controller for mt8188
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8188-afe
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
> +  mediatek,topckgen:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek topckgen controller
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
> +      - const: adsp_audio_26m
> +
> +patternProperties:
> +  "^mediatek,etdm-in[1-2]-chn-disabled$":
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 16
> +    description: |

Don't need '|'

> +      Specify which input channel should be disabled, so the data of
> +      specified channel won't be outputted to memory.

I'm not clear on what each of the 16 entries represents. What's index 0, 
1, 2, etc.?

> +    items:
> +      enum: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

maximum: 15


> +
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
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    afe: afe@10b10000 {
> +        compatible = "mediatek,mt8188-afe";
> +        reg = <0x10b10000 0x10000>;
> +        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
> +        resets = <&watchdog 14>;
> +        reset-names = "audiosys";
> +        mediatek,topckgen = <&topckgen>;
> +        power-domains = <&spm 13>; //MT8188_POWER_DOMAIN_AUDIO
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

It's good if the examples include optional properties so we at least 
have some validation the schema matches the DTS.

> +    };
> +
> +...
> -- 
> 2.18.0
> 
> 

