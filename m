Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD69FC83F22
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDP9Js2kzVuyXlUZIv8xGDhpQxOjQoCz2hrw5ui3thc=; b=UBIY5BaDsSTBY7Jyzob47GM+HI
	4+IO1TVWfIDHK/WwYHatEl2BQO8FKFLzJcoNrnLPgZGV89TaHOYO0YuBQ5akH0WuPgAkG480mDUMD
	KFibW6AccQAA8xXX6BDS0rjsQpnTVJKpc5azyOG8a2c5cxiIW9t79KfMM8PLyKt0cYgcpyEoMhFoi
	LOehb+Z25wB53kTrXXg1ELbd3qz5D4gEnjf3Mn8FVFqTmSH07siSirTOZ8KwSfbfn1hJvWEfcYxbQ
	LD5AcSbseADIr/Nf8uooY7epZJ8sgFlBFjluwo5v4ZZcbxS8vGw4rakrJ4bWzdS1CLemA1jaR9Q9D
	enUQV1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaBV-00000004Ml2-3S6N;
	Tue, 15 Jul 2025 07:34:41 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaBF-00000004Mf6-2ATJ
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Jul 2025 07:34:27 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-553d771435fso4538277e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Jul 2025 00:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752564864; x=1753169664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDP9Js2kzVuyXlUZIv8xGDhpQxOjQoCz2hrw5ui3thc=;
        b=HC9RbHSIokGAcFwFASiuM6nP+U3GwTBHBHahx2D+P2A5iltmMR4v08QzElQFpoHAVQ
         IEzrNtWhj5TuctvcGWEkNrsZRxBMf6yKyeDnc9tDOQd+yYUPNOLCTfW4knR3aKq8Schv
         kLiMZPbwZh4a8zt7+Dly/XGzqP1FVP5gLHubU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564864; x=1753169664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDP9Js2kzVuyXlUZIv8xGDhpQxOjQoCz2hrw5ui3thc=;
        b=A7tWq2fanN/OqhvX2dyUiWaNnX0Tuy2Svf26lk47bh6pUYPe9uihJ352/Ox++o7xVd
         h+vkpEHXHGFMDJGzoREftDB8FKxmjj/dL5MUzg3T8sY82h3mtxFrvAMEAnWuCMkXz7gy
         IUrx6+0aGBVkEnX8vkFnHs2QYOX6VOBEFSvZXTiZIBuoOdioZGXdsIhFU66PJWa/HvEM
         j6vPdp33taK036Hcyshnr+6ErNAlOA8ej5IHXPtW/54H/lIsksJygQsOGxw50inngjJP
         QGrX3qU4JzqVPDsoYEx5Bj48PtjIyIDD211Niw5r/4OfwxQx9H1qGHCuhCRH9qXeAAPO
         4thg==
X-Forwarded-Encrypted: i=1; AJvYcCUywkpoyf5PWqs9nUCOupCkQfdjPvcG+L6o29DyoakLMfGcqLSrNpzlexZMxtcJQ7gSHfyf3TjjqNCyvvQhPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9omQuuUmhDJrtrCU/uhIg8fkY4vdAbzWyWZUxf4GTPf1HsIay
	Lf0V6LOM0VJP/EFyqh+lSOR/wAWoZPbJYjcV8AYYIPgK2urQp9RJNgYn+lXs+h11QfHXvHcT9Tk
	rvCtooEBHjDEQT8fmEayL+uKTWbB9CVIn+mu/OaqZ
X-Gm-Gg: ASbGncsCaeZVCum3OG8abKLFZ1dWf6witAEHyyF+lb9vLVWU58xiZxQOcfNN7hlDler
	wKJo0qP96n5IMrM0Qn8gqRW3uABmmulU6aSdRiX1IDXoEH/SHuhrr6AQP8ekq7rxsgdt7M6Vz2W
	h5I8ln1KIf9XMxWAdwHgTGiYA1bpNuL3o2RPRZWdFux5xUyx5Y0nb7TVTD0+SR8NjuQWveg4E0q
	M5Yjq/MIZxS666bq0N9XEYzbr24kw3bz8U=
X-Google-Smtp-Source: AGHT+IGyLQwS9wKi4gblzvO5qXko8LClZQ/7pERQ/cNbp9sboWxoQuuZ+SKFuMvHo+wECT4yBGDlAwSuCXvvVMsXsy8=
X-Received: by 2002:a05:6512:1041:b0:553:a456:a0c1 with SMTP id
 2adb3069b0e04-55a058a4cd2mr4180549e87.43.1752564863458; Tue, 15 Jul 2025
 00:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-9-darren.ye@mediatek.com>
 <CAGXv+5EufDuxLMnwMaCqtWFZpVMNMxi-5OwCyO4a+KD2T+2NYA@mail.gmail.com>
In-Reply-To: <CAGXv+5EufDuxLMnwMaCqtWFZpVMNMxi-5OwCyO4a+KD2T+2NYA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 15:34:12 +0800
X-Gm-Features: Ac12FXwLri21evCxtuWTPMRxjTUULLUjQETvR-4GzmqmkL7Am8Zi1o5cvxLE7BY
Message-ID: <CAGXv+5EMjfrdLX49M9514uwzaTzc2G3kpQNw8BdJaZ4AaexBKg@mail.gmail.com>
Subject: Re: [PATCH v6 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_003425_652327_F8DF2833 
X-CRM114-Status: GOOD (  29.74  )
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

On Tue, Jul 15, 2025 at 1:09=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi,
>
> On Tue, Jul 8, 2025 at 7:35=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com>=
 wrote:
> >
> > From: Darren Ye <darren.ye@mediatek.com>
> >
> > Add mt8196 audio AFE.
> >
> > Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/sound/mediatek,mt8196-afe.yaml   | 157 ++++++++++++++++++
> >  1 file changed, 157 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt=
8196-afe.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-af=
e.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> > new file mode 100644
> > index 000000000000..fe147eddf5e7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> > @@ -0,0 +1,157 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/mediatek,mt8196-afe.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek Audio Front End PCM controller for MT8196
> > +
> > +maintainers:
> > +  - Darren Ye <darren.ye@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8196-afe
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +
> > +  mediatek,vlpcksys:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: To set up the apll12 tuner
>
> Looking at the implementation, the configuration is just a fixed value.
> Can this be moved to the VLP clock driver instead?
>
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: mux for audio intbus
> > +      - description: mux for audio engen1
> > +      - description: mux for audio engen2
> > +      - description: mux for audio h
> > +      - description: vlp 26m clock
> > +      - description: audio apll1 clock
> > +      - description: audio apll2 clock
> > +      - description: audio apll1 divide4
> > +      - description: audio apll2 divide4
> > +      - description: audio apll12 divide for i2sin0
> > +      - description: audio apll12 divide for i2sin1
> > +      - description: audio apll12 divide for fmi2s
> > +      - description: audio apll12 divide for tdmout mck
> > +      - description: audio apll12 divide for tdmout bck
> > +      - description: mux for audio apll1
> > +      - description: mux for audio apll2
> > +      - description: mux for i2sin0 mck
> > +      - description: mux for i2sin1 mck
> > +      - description: mux for fmi2s mck
> > +      - description: mux for tdmout mck
> > +      - description: mux for adsp clock
> > +      - description: 26m clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: top_aud_intbus
> > +      - const: top_aud_eng1
> > +      - const: top_aud_eng2
> > +      - const: top_aud_h
> > +      - const: vlp_clk26m
>
> > +      - const: apll1
> > +      - const: apll2
> > +      - const: apll1_d4
> > +      - const: apll2_d4
>
> These are parents of the top_apll[12]. They do not feed into the
> hardware directly, so you should not be including them here.
>
> > +      - const: apll12_div_i2sin0
> > +      - const: apll12_div_i2sin1
> > +      - const: apll12_div_fmi2s
> > +      - const: apll12_div_tdmout_m
> > +      - const: apll12_div_tdmout_b
>
> In the clock bindings sent by Collabora, these dividers are no longer
> separately modeled; they have been combined with their respective
> top_* clocks.
>
> > +      - const: top_apll1
> > +      - const: top_apll2
>
> These two are parents to apll12_div_*, do not feed into the hardware
> directly, so you should not be including them here.

Slight correction: looking at the submitted AFE clk driver, these two
feed into some clock gate in the AFE block, so these two are probably
needed.

ChenYu

> The clock tree for each audio interface clock looks like the following:
>
>     apll1 -> apll1_d4 -> top_apll1 --
>                      /               \
>               clk26m                  --> top_fmi2s -> apll12_div_fmi2s
>                      \               /
>     apll2 -> apll2_d4 -> top_apll2 --
>
> Only the final "apll12_div_fmi2s" should be referenced.
>
> On the implementation side, it should simply be a matter of setting the
> required rate (24.576 MHz or 22.5792 MHz, or some multiple) on this leaf
> clock, and let the clock framework figure out the PLL and dividers to
> use. Same thing for enabling the clock.
>
> > +      - const: top_i2sin0
> > +      - const: top_i2sin1
> > +      - const: top_fmi2s
> > +      - const: top_tdmout
> > +      - const: top_adsp
>
> > +      - const: clk26m
>
> Is this one directly needed? It is similar to vlp_clk26m, and I suspect
> only that one is needed.
>
>
> ChenYu
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - memory-region
> > +  - mediatek,vlpcksys
> > +  - power-domains
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        afe@1a110000 {
> > +            compatible =3D "mediatek,mt8196-afe";
> > +            reg =3D <0 0x1a110000 0 0x9000>;
> > +            interrupts =3D <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            memory-region =3D <&afe_dma_mem_reserved>;
> > +            mediatek,vlpcksys =3D <&vlp_cksys_clk>;
> > +            power-domains =3D <&scpsys 14>; //MT8196_POWER_DOMAIN_AUDI=
O
> > +            clocks =3D <&vlp_cksys_clk 40>, //CLK_VLP_CK_AUD_INTBUS_SE=
L
> > +                     <&vlp_cksys_clk 38>, //CLK_VLP_CK_AUD_ENGEN1_SEL
> > +                     <&vlp_cksys_clk 39>, //CLK_VLP_CK_AUD_ENGEN2_SEL
> > +                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
> > +                     <&vlp_cksys_clk 45>, //CLK_VLP_CK_CLKSQ
> > +                     <&cksys_clk 129>, //CLK_CK_APLL1
> > +                     <&cksys_clk 132>, //CLK_CK_APLL2
> > +                     <&cksys_clk 130>, //CLK_CK_APLL1_D4
> > +                     <&cksys_clk 133>, //CLK_CK_APLL2_D4
> > +                     <&cksys_clk 80>, //CLK_CK_APLL12_CK_DIV_I2SIN0
> > +                     <&cksys_clk 81>, //CLK_CK_APLL12_CK_DIV_I2SIN1
> > +                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
> > +                     <&cksys_clk 93>, //CLK_CK_APLL12_CK_DIV_TDMOUT_M
> > +                     <&cksys_clk 94>, //CLK_CK_APLL12_CK_DIV_TDMOUT_B
> > +                     <&cksys_clk 43>, //CLK_CK_AUD_1_SEL
> > +                     <&cksys_clk 44>, //CLK_CK_AUD_2_SEL
> > +                     <&cksys_clk 66>, //CLK_CK_APLL_I2SIN0_MCK_SEL
> > +                     <&cksys_clk 67>, //CLK_CK_APLL_I2SIN1_MCK_SEL
> > +                     <&cksys_clk 78>, //CLK_CK_APLL_FMI2S_MCK_SEL
> > +                     <&cksys_clk 79>, //CLK_CK_APLL_TDMOUT_MCK_SEL
> > +                     <&cksys_clk 45>, //CLK_CK_ADSP_SEL
> > +                     <&cksys_clk 140>; //CLK_CK_TCK_26M_MX9
> > +            clock-names =3D "top_aud_intbus",
> > +                          "top_aud_eng1",
> > +                          "top_aud_eng2",
> > +                          "top_aud_h",
> > +                          "vlp_clk26m",
> > +                          "apll1",
> > +                          "apll2",
> > +                          "apll1_d4",
> > +                          "apll2_d4",
> > +                          "apll12_div_i2sin0",
> > +                          "apll12_div_i2sin1",
> > +                          "apll12_div_fmi2s",
> > +                          "apll12_div_tdmout_m",
> > +                          "apll12_div_tdmout_b",
> > +                          "top_apll1",
> > +                          "top_apll2",
> > +                          "top_i2sin0",
> > +                          "top_i2sin1",
> > +                          "top_fmi2s",
> > +                          "top_tdmout",
> > +                          "top_adsp",
> > +                          "clk26m";
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.45.2
> >
> >

