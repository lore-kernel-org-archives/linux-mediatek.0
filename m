Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABDFC369C5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6QE2T0ZuBXB4WndsfLOAzxWrh7klQ+oX5dwA6vGb1g=; b=Ym98IRtkmdah3ieo5QP/pQZ22j
	LDZpFSEcYWV0mu9bs9jaHvHo9/cLhxSMal7SscJZNKZSpmMUGkqeRt0wR1QKd9S2Ewvy5cDTpbsxR
	EY4buEYvxSBXdZXg09+Tzo6O8pNExHsYYh6YPmi1W8YBMzzRS3diGzT4TuYGcRgdgZzAdAfjpXptS
	4W/hnXszWPg+TMsUM7skpNuqksdXYqlAZ6Fha5+HzOBTJ0phZNBBhM3mltLzsz+gcnKfzbLELjNwc
	dAP4LPxJYyPwJg5X9AZicp9aPlMU25CW6N/NoLI6s56tcTfYRPf8FbXTAZ5rQRjQ7UzG1N1G/4yFT
	5q9+Qr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502o-000000098hj-0BzP;
	Wed, 16 Apr 2025 10:31:02 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yDx-00000008q71-0OKm
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Apr 2025 08:34:26 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5499659e669so7716321e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Apr 2025 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744792463; x=1745397263; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6QE2T0ZuBXB4WndsfLOAzxWrh7klQ+oX5dwA6vGb1g=;
        b=agibgBgF+7Wd5CY7GBHc1gUEea6klJKZKhs48uUG6mF1yXINiXSF/JxjM8b5qkBwa+
         B6+1880ovsf7FWwTGxOWKUciMkkWYjrwUkal5lrcXExU/hrt8Nsbx8z3kcJoLFIkLuf2
         hySKaOuqdBkxxsS0JxmT5VsCtlsQdnXDSWXa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792463; x=1745397263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6QE2T0ZuBXB4WndsfLOAzxWrh7klQ+oX5dwA6vGb1g=;
        b=bCd+CgWBNRk8BcI/+pM5ISgYkXzhw4DjbGqqAdP9nTX2e2CfVltCkq9Vlss3eadFqI
         QF3/gmsVMTRYJpy5l7t53q1yFgu2s0kYLMJxWlvSPvky6NzEpyVxvX+S+4G6oCsluQJ+
         kCLonxCWbce8VjbgRse/g+WQlXiUqwEpxfjjSzWxwxc7FQlNq6/ihw5FNuSvdXXU+Z8C
         wkRXaxSmWAMAZkqTKkAcQD1Nj4uwTVProArfjbFjEpCQ0OhsV9r6nHxPBVs/c79K5gx0
         Xy2nMMHLz06VswQMczvldhwfv64nKcWJJ/EU1uRESukWfDTR4zxu9q6E9YBXmqBLQaVH
         KfYw==
X-Forwarded-Encrypted: i=1; AJvYcCXsoyf4Y/LoQuS8W10DTp/gUYKwJB3CWnLRFAtC+3TpG5n4B8/8pzfaxKUW8hmHQXyKeQrRjfMj4G/rFpUI5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRhmhlOQnDNaMxK7+NSPLHFlHoLgzJ1xuZ8yq4kTEMDDdgUmb9
	FzL8uPfWkO10k2tHLFqGpoJbRr7Q/nPP8Je8O+7lkLNftSh8Y6OglmgWAnVr6bOeun4OwaYw9cg
	WIi5OlSZIoTAetJ6JVtPooDwEyFda5ynA19o0
X-Gm-Gg: ASbGncuxVog12Ynbk0s+SAc0NVbsa3XiByfkkZ+XDgKYlJkmrJX2PWbE9uh0nfs7wl6
	THS7q43hXyKzeyHJIAvhx5W7ty/xQ4M7qzwu/tstVSbHNQ2732VtgxGNOFTslqZcJs/QvvASR39
	fvyltZl7zC53zuvJJC6gq5eqroOauMcytZMxU7/G26nb6wFhwMAw==
X-Google-Smtp-Source: AGHT+IGywv405x+hdQLo/98ClZzF7JmGK2W6nH8CVYn8/jZboSM3mheObcfLUo7gqxuVyOBok2c1x8Ehz9kkQzuTqRQ=
X-Received: by 2002:a05:6512:1094:b0:54d:6400:4bd0 with SMTP id
 2adb3069b0e04-54d64ae8212mr274900e87.37.1744792462920; Wed, 16 Apr 2025
 01:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120708.26495-1-darren.ye@mediatek.com> <20250407120708.26495-10-darren.ye@mediatek.com>
In-Reply-To: <20250407120708.26495-10-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Apr 2025 16:34:11 +0800
X-Gm-Features: ATxdqUFmHiMrf2rAgHSOIbvBvct2V2zm34cTt1IQ6bUMVwKlX1lwi3om1Cu8IgA
Message-ID: <CAGXv+5F0Ys63hcO8u7p3zSnnOT4gYc2Z0BhQW=dOXAvBc_nmvg@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE document
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_013425_149252_71241021 
X-CRM114-Status: GOOD (  24.66  )
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

On Mon, Apr 7, 2025 at 8:39=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add mt8196 audio AFE document.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8196-afe.yaml   | 233 ++++++++++++++++++
>  1 file changed, 233 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt81=
96-afe.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.=
yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> new file mode 100644
> index 000000000000..44f8847b13a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> @@ -0,0 +1,233 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8196-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Audio Front End PCM controller for MT8196
> +
> +maintainers:
> +  - Darren Ye <darren.ye@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-afe-pcm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +  memory-region:
> +    maxItems: 1
> +    description: |
> +      Shared memory region for AFE memif.  A "shared-dma-pool".
> +      See dtschema reserved-memory/shared-dma-pool.yaml for details.
> +  mediatek,cksys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek clk systemd controller
> +
> +  mediatek,vlpcksys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek vlpcksys controller
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: audio hopping clock gate
> +      - description: audio f26m clock gate
> +      - description: audio apll1 clock gate
> +      - description: audio apll2 clock gate
> +      - description: audio apll1 tuner gate
> +      - description: audio apll2 tuner gate
> +      - description: mux for audio vlp int
> +      - description: mux for audio vlp engen1
> +      - description: mux for audio vlp engen2
> +      - description: mux for audio h
> +      - description: vlp clock 26m
> +      - description: audio mainpll divide 4
> +      - description: mux for audio apll1
> +      - description: audio apll1
> +      - description: mux for audio apll2
> +      - description: audio apll2
> +      - description: audio apll1 divide 4
> +      - description: audio apll2 divide 4
> +      - description: mux for i2sin0 mck
> +      - description: mux for i2sin1 mck
> +      - description: mux for fmi2s mck
> +      - description: mux for tdmout mck
> +      - description: auido apll12 divide for i2sin0
> +      - description: auido apll12 divide for i2sin1
> +      - description: auido apll12 divide for fmi2s
> +      - description: auido apll12 divide for tdmout mck
> +      - description: auido apll12 divide for tdmout bck

There's a bunch of typos for "audio".

> +      - description: audio adsp clk
> +      - description: 26m clock

Can we look into trimming down the list of clocks? Ideally this should
only list the actual clock inputs of the hardware, which are normally
the leaf clocks from the clock controller. You should not have to list
all the intermediate dividers and muxes.

On the Linux implementation side, it should be a matter of calling
clk_set_rate() on the clock input corresponding to the interface in
use. If the clock is not resolving the correct clock rate / parenting,
the clock driver should be fixed.

> +
> +  clock-names:
> +    items:
> +      - const: aud_hopping_clk
> +      - const: aud_f26m_clk
> +      - const: aud_apll1_clk
> +      - const: aud_apll2_clk
> +      - const: aud_apll_tuner1_clk
> +      - const: aud_apll_tuner2_clk
> +      - const: vlp_mux_audio_int
> +      - const: vlp_mux_aud_eng1
> +      - const: vlp_mux_aud_eng2
> +      - const: vlp_mux_audio_h
> +      - const: vlp_clk26m_clk
> +      - const: ck_mainpll_d4_d4
> +      - const: ck_mux_aud_1
> +      - const: ck_apll1_ck
> +      - const: ck_mux_aud_2
> +      - const: ck_apll2_ck
> +      - const: ck_apll1_d4
> +      - const: ck_apll2_d4
> +      - const: ck_i2sin0_m_sel
> +      - const: ck_i2sin1_m_sel
> +      - const: ck_fmi2s_m_sel
> +      - const: ck_tdmout_m_sel
> +      - const: ck_apll12_div_i2sin0
> +      - const: ck_apll12_div_i2sin1
> +      - const: ck_apll12_div_fmi2s
> +      - const: ck_apll12_div_tdmout_m
> +      - const: ck_apll12_div_tdmout_b
> +      - const: ck_adsp_sel
> +      - const: ck_clk26m_clk
> +
> +  mediatek,etdm4-out-ch:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Number of ETDM4 output channels.
> +    minimum: 1
> +    maximum: 8
> +
> +  mediatek,etdm4-in-ch:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Number of ETDM4 input channels.
> +    minimum: 1
> +    maximum: 8
> +
> +  mediatek,etdm4-out-sync:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      ETDM4 output and input enable synchronization.
> +    enum:
> +      - 0 # Enable controlled by itself
> +      - 1 # Enable synchronization with ETDM4 input.
> +
> +  mediatek,etdm4-in-sync:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      ETDM4 input and outpuot enable synchronization.
> +    enum:
> +      - 0 # Enable controlled by itself
> +      - 1 # Enable synchronization with ETDM4 output.
> +
> +
> +
> +  mediatek,etdm4-ip-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: ETDM IP mode.
> +    enum:
> +      - 0 # One ip multi-ch mode
> +      - 1 # Multi-ip 2ch mode
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - mediatek,cksys
> +  - mediatek,vlpcksys
> +  - power-domains
> +  - memory-region
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
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        afe: mt8196-afe-pcm@1a110000 {
> +            compatible =3D "mediatek,mt8196-afe-pcm";
> +            reg =3D <0 0x1a110000 0 0x9000>;
> +            interrupts =3D <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
> +            memory-region =3D <&afe_dma_mem_reserved>;
> +            mediatek,cksys =3D <&cksys_clk>;
> +            mediatek,vlpcksys =3D <&vlp_cksys_clk>;
> +            power-domains =3D <&scpsys 14>; //MT8196_POWER_DOMAIN_AUDIO
> +            mediatek,etdm4-out-ch =3D <2>;
> +            mediatek,etdm4-in-ch =3D <2>;
> +            mediatek,etdm4-out-sync =3D <0>;
> +            mediatek,etdm4-in-sync =3D <1>;
> +            mediatek,etdm4-ip-mode =3D <0>;
> +            clocks =3D <&afe_clk 109>, //CLK_AFE_AUDIO_HOPPING_AFE
> +                     <&afe_clk 111>, //CLK_AFE_AUDIO_F26M_AFE
> +                     <&afe_clk 113>, //CLK_AFE_APLL1_AFE
> +                     <&afe_clk 115>, //CLK_AFE_APLL2_AFE
> +                     <&afe_clk 121>, //CLK_AFE_APLL_TUNER1_AFE
> +                     <&afe_clk 119>, //CLK_AFE_APLL_TUNER2_AFE

<&afe_clk> has the same register range as <&afe>, i.e they are the
same hardware block. Please find a way to internalize them in the
driver implementation and drop them from the bindings / DT.

> +                     <&vlp_cksys_clk 40>, //CLK_VLP_CK_AUD_INTBUS_SEL
> +                     <&vlp_cksys_clk 38>, //CLK_VLP_CK_AUD_ENGEN1_SEL
> +                     <&vlp_cksys_clk 39>, //CLK_VLP_CK_AUD_ENGEN2_SEL
> +                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
> +                     <&vlp_cksys_clk 45>, //CLK_VLP_CK_CLKSQ
> +                     <&cksys_clk 98>, //CLK_CK_MAINPLL_D4_D4

This is not actually used in the implementation.

> +                     <&cksys_clk 43>, //CLK_CK_AUD_1_SEL

Intermediate clock feeding into the I2S / TDM clocks. Does this
really feed into the audio block?

> +                     <&cksys_clk 129>, //CLK_CK_APLL1

PLL source clock.

> +                     <&cksys_clk 44>, //CLK_CK_AUD_2_SEL

Intermediate clock feeding into the I2S / TDM clocks. Does this
really feed into the audio block?

> +                     <&cksys_clk 132>, //CLK_CK_APLL2

PLL source clock.

> +                     <&cksys_clk 130>, //CLK_CK_APLL1_D4

Divider after PLL.

> +                     <&cksys_clk 133>, //CLK_CK_APLL2_D4

Divider after PLL.

> +                     <&cksys_clk 66>, //CLK_CK_APLL_I2SIN0_MCK_SEL
> +                     <&cksys_clk 67>, //CLK_CK_APLL_I2SIN1_MCK_SEL
> +                     <&cksys_clk 78>, //CLK_CK_APLL_FMI2S_MCK_SEL
> +                     <&cksys_clk 79>, //CLK_CK_APLL_TDMOUT_MCK_SEL

These four feed into the next four.

Please take a good look at the hardware and determine which ones are
actually directly used by the hardware.


ChenYu

> +                     <&cksys_clk 80>, //CLK_CK_APLL12_CK_DIV_I2SIN0
> +                     <&cksys_clk 81>, //CLK_CK_APLL12_CK_DIV_I2SIN1
> +                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
> +                     <&cksys_clk 93>, //CLK_CK_APLL12_CK_DIV_TDMOUT_M
> +                     <&cksys_clk 94>, //CLK_CK_APLL12_CK_DIV_TDMOUT_B
> +                     <&cksys_clk 45>, //CLK_CK_ADSP_SEL
> +                     <&cksys_clk 140>; //CLK_CK_TCK_26M_MX9
> +            clock-names =3D "aud_hopping_clk",
> +                          "aud_f26m_clk",
> +                          "aud_apll1_clk",
> +                          "aud_apll2_clk",
> +                          "aud_apll_tuner1_clk",
> +                          "aud_apll_tuner2_clk",
> +                          "vlp_mux_audio_int",
> +                          "vlp_mux_aud_eng1",
> +                          "vlp_mux_aud_eng2",
> +                          "vlp_mux_audio_h",
> +                          "vlp_clk26m_clk",
> +                          "ck_mainpll_d4_d4",
> +                          "ck_mux_aud_1",
> +                          "ck_apll1_ck",
> +                          "ck_mux_aud_2",
> +                          "ck_apll2_ck",
> +                          "ck_apll1_d4",
> +                          "ck_apll2_d4",
> +                          "ck_i2sin0_m_sel",
> +                          "ck_i2sin1_m_sel",
> +                          "ck_fmi2s_m_sel",
> +                          "ck_tdmout_m_sel",
> +                          "ck_apll12_div_i2sin0",
> +                          "ck_apll12_div_i2sin1",
> +                          "ck_apll12_div_fmi2s",
> +                          "ck_apll12_div_tdmout_m",
> +                          "ck_apll12_div_tdmout_b",
> +                          "ck_adsp_sel",
> +                          "ck_clk26m_clk";
> +        };
> +    };
> --
> 2.45.2
>
>

