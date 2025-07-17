Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFADC83F1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 02:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxHiP6wE+44HTiVLcySgvTPCMzauYzsKV7k/Cx73M/Y=; b=GCHk7654i4yLg8x3P9NsakA8cU
	vPTBR2f2or1BQ3OdkH6SCjC61LCb95LN+T/cnd8HykOYQMQjPYGka1njnzWcX8hCwLXRjcIx/ATMi
	M9zld+6gMlKQUAN4b83ScNlnnrldzl/eKTFsFhjeNJitkbwMm8nHVTZ0g4RIcXZzhzsv2QRT0tq84
	Nv4gYJtOSX0RHskwDF2PC8CtTP6wBVPtERPG6Ap9RKje/tYkIBoiXtLqtTkvsZQBfjs1HO2X8BHSC
	BE9YHq3+e2XgLLCMdEo7pf6erL0qKB3jRXvWqUZD3tbBD9Y9C7LAZsV0PdI/UU1P1jVcAJ91KDKGs
	4SMcFGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEDa-000000093BS-0LmQ;
	Thu, 17 Jul 2025 02:19:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEB9-0000000932k-1wUC
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 02:17:01 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso450958e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Jul 2025 19:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752718616; x=1753323416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxHiP6wE+44HTiVLcySgvTPCMzauYzsKV7k/Cx73M/Y=;
        b=Ie9F11usKpQTdQ7AOC8tMcdpimdiVFyCkRgaL4E3v6Ht6IlZsnl1gPykhWw4zE2qPV
         zppUTPE44/Gz60SrNhBx7Oi4tKlc5/VbBjJCU95HtFxRaSHgXW8DLpKv4DxPRIFj2Vyd
         vERMRoXH2TzBKVnv09TYvdycUk5XNTzX454aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752718616; x=1753323416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxHiP6wE+44HTiVLcySgvTPCMzauYzsKV7k/Cx73M/Y=;
        b=VS3m6ihTKcARca/LIk0Wut2GoTl+vd/Y/VH8onfMe91xQNgx17L2pSm22glD4p0Qvd
         tPgdCrOfozRyqCoW959PMdFmeaLoi4Xdy9gEjDon2W1HxqRwdJjIW1xXXN+BhZBBLxDs
         r1C/KnevDDikvcAaB59bC3bsct2HF0XLP+JrTs3SujO0eKoT++xqbdFB35Mnlb8b887y
         ZPj1up0AANu4D9L81MqtPD55eK3IlWEiRcVEcm5H1wdrcLOIE4pIpiELIN4dK64iw9C7
         6aOUnYe2XzZEV749mwiTAXRHdxiDJBAoElEfubxoV3i8Cuq5pP4Y8Cs76qFdEwugFE1W
         HA6g==
X-Forwarded-Encrypted: i=1; AJvYcCUWfoVeDCXhPpSO55YE9Y6RcgzYjmLsGt6NrsB9sBwhS2pbq4zA0bSY0WgzFPb7iTNBfC8Tw41nRrJTnxkTqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmFYk/WcledJMAcSPrLtHS6QaYthHYqAfnBIN1bmhu2GFKEYlk
	tmY+nhH5lWL8iNK5g22r7SiBxEiCBuZ5jZQQON8OdZc/V7zgS+cHg2NZ0cc6TgjQVspCv9XrwBD
	TPpyDk7A+1ZVZW79XkSzDitGiziaRHnIugn8TMvQG
X-Gm-Gg: ASbGnct4An9TT4SmMDqbNi91npXbTWBLWcRVOl5iX8HjjP1WdtMadde1yB2kZcMfnho
	cuU2lHmxCM30SE3Y34iZnJV1wrl2QMzeRxdulj7verP52dshqy0mxFz6S4CAx1Iov6ivHN5Ji6/
	+WXuPqg34FxzyjE4byGX+Gw6Exxh47D1cnkb9BNQxMPxclWGNCzmkLGxkzD4fFb8af/QDcT3a7p
	3Fimr5PWIf1PN+4zLuTDf/kj+n+rYIqmDqtlQ==
X-Google-Smtp-Source: AGHT+IHX6+PqYe7ISNqeiqU5iv6yi86yo/gru6nPWgWG5xiS6bt/CCj0f39af9hJfhwpJxYP0qrdsmQwdRgw6Yt/kWQ=
X-Received: by 2002:a05:6512:3da1:b0:55a:2735:fe6a with SMTP id
 2adb3069b0e04-55a27360094mr841505e87.0.1752718616192; Wed, 16 Jul 2025
 19:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-9-darren.ye@mediatek.com>
 <CAGXv+5EufDuxLMnwMaCqtWFZpVMNMxi-5OwCyO4a+KD2T+2NYA@mail.gmail.com> <e4e4cf154e9ea1a4f96a50f374e9f88fc27ca670.camel@mediatek.com>
In-Reply-To: <e4e4cf154e9ea1a4f96a50f374e9f88fc27ca670.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Jul 2025 11:16:45 +0900
X-Gm-Features: Ac12FXxJARBruEPXsOMEpzqrHcSUpNdXL9sZPsqgXaiJYCISBkZ3KcHBr2s5MUo
Message-ID: <CAGXv+5HDupifLWN-okQmzbgTV53X9Wwu6r9usFgiJEWc20AK1A@mail.gmail.com>
Subject: Re: [PATCH v6 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE
To: =?UTF-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>, 
	"brgl@bgdev.pl" <brgl@bgdev.pl>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, 
	"robh@kernel.org" <robh@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"perex@perex.cz" <perex@perex.cz>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_191659_546153_4DA06D89 
X-CRM114-Status: GOOD (  43.56  )
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

On Wed, Jul 16, 2025 at 9:41=E2=80=AFPM Darren Ye (=E5=8F=B6=E9=A3=9E) <Dar=
ren.Ye@mediatek.com> wrote:
>
> On Tue, 2025-07-15 at 13:09 +0800, Chen-Yu Tsai wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > Hi,
> >
> > On Tue, Jul 8, 2025 at 7:35=E2=80=AFPM Darren.Ye <darren.ye@mediatek.co=
m>
> > wrote:
> > >
> > > From: Darren Ye <darren.ye@mediatek.com>
> > >
> > > Add mt8196 audio AFE.
> > >
> > > Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > >  .../bindings/sound/mediatek,mt8196-afe.yaml   | 157
> > > ++++++++++++++++++
> > >  1 file changed, 157 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> > > b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> > > new file mode 100644
> > > index 000000000000..fe147eddf5e7
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-
> > > afe.yaml
> > > @@ -0,0 +1,157 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/sound/media=
tek,mt8196-afe.yaml*__;Iw!!CTRNKA9wMg0ARbw!iSiBwCYEjWdWSv25XRbl3ky3Niiw3nDp=
VY-fW1dxyp3eU5YDs0bbZXEgPUQ1_NInbxUIgyz3HJvf-xTH$
> > > +$schema:
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.y=
aml*__;Iw!!CTRNKA9wMg0ARbw!iSiBwCYEjWdWSv25XRbl3ky3Niiw3nDpVY-fW1dxyp3eU5YD=
s0bbZXEgPUQ1_NInbxUIgyz3HHUjHsuW$
> > > +
> > > +title: MediaTek Audio Front End PCM controller for MT8196
> > > +
> > > +maintainers:
> > > +  - Darren Ye <darren.ye@mediatek.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mediatek,mt8196-afe
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  memory-region:
> > > +    maxItems: 1
> > > +
> > > +  mediatek,vlpcksys:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: To set up the apll12 tuner
> >
> > Looking at the implementation, the configuration is just a fixed
> > value.
> > Can this be moved to the VLP clock driver instead?
> >
> I thinks it's not good to put it in the VLP clock kernel driver,
> because this value needs to be adjusted. Usually, it is set in
> coreboot, but it is hard to change later. Audio needs to adjust
> this value, so it's better to put it in the audio driver. What do
> you think?

It looks like just one fixed value, instead of needing to tweak the value
during operation? If that's the case I think it could be moved to the
clock driver.

> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: mux for audio intbus
> > > +      - description: mux for audio engen1
> > > +      - description: mux for audio engen2
> > > +      - description: mux for audio h
> > > +      - description: vlp 26m clock
> > > +      - description: audio apll1 clock
> > > +      - description: audio apll2 clock
> > > +      - description: audio apll1 divide4
> > > +      - description: audio apll2 divide4
> > > +      - description: audio apll12 divide for i2sin0
> > > +      - description: audio apll12 divide for i2sin1
> > > +      - description: audio apll12 divide for fmi2s
> > > +      - description: audio apll12 divide for tdmout mck
> > > +      - description: audio apll12 divide for tdmout bck
> > > +      - description: mux for audio apll1
> > > +      - description: mux for audio apll2
> > > +      - description: mux for i2sin0 mck
> > > +      - description: mux for i2sin1 mck
> > > +      - description: mux for fmi2s mck
> > > +      - description: mux for tdmout mck
> > > +      - description: mux for adsp clock
> > > +      - description: 26m clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: top_aud_intbus
> > > +      - const: top_aud_eng1
> > > +      - const: top_aud_eng2
> > > +      - const: top_aud_h
> > > +      - const: vlp_clk26m
> > > +      - const: apll1
> > > +      - const: apll2
> > > +      - const: apll1_d4
> > > +      - const: apll2_d4
> >
> > These are parents of the top_apll[12]. They do not feed into the
> > hardware directly, so you should not be including them here.
> >
> > > +      - const: apll12_div_i2sin0
> > > +      - const: apll12_div_i2sin1
> > > +      - const: apll12_div_fmi2s
> > > +      - const: apll12_div_tdmout_m
> > > +      - const: apll12_div_tdmout_b
> >
> > In the clock bindings sent by Collabora, these dividers are no longer
> > separately modeled; they have been combined with their respective
> > top_* clocks.
> >
> > > +      - const: top_apll1
> > > +      - const: top_apll2
> >
> > These two are parents to apll12_div_*, do not feed into the hardware
> > directly, so you should not be including them here.
> >
> > The clock tree for each audio interface clock looks like the
> > following:
> >
> >     apll1 -> apll1_d4 -> top_apll1 --
> >                      /               \
> >               clk26m                  --> top_fmi2s ->
> > apll12_div_fmi2s
> >                      \               /
> >     apll2 -> apll2_d4 -> top_apll2 --
> >
> > Only the final "apll12_div_fmi2s" should be referenced.
> >
> > On the implementation side, it should simply be a matter of setting
> > the
> > required rate (24.576 MHz or 22.5792 MHz, or some multiple) on this
> > leaf
> > clock, and let the clock framework figure out the PLL and dividers to
> > use. Same thing for enabling the clock.
>
> I think we have some misunderstandings. I will first draw mtk audio
> clock topology diagram, and then we can disscuss which parts can be
> optimized together.
>
> top_aud_intbus: as read/write reg clock source;
> top_aud_eng1/top_aud_eng2: as i2s bck clock source;
> apll12_div_xxx: as mclk clock source;
> top_audio_h: as afe other ip clock source;

And what about top_i2sin0, top_i2sin1, top_fmi2s, top_tdmout?

>
> vlp_clk26m
>         \
> apll1   --> top_audio_h
> /
> apll2

This shows that vlp_clk26m, apll1, apll2 are parents to top_audio_h.

>                 vlp_clk26m
>                      \
> apll1  --> apll1_d4  --> top_aud_eng1
>        \
> clk26m --> top_apll1
> \
>  --> top_fmi2s --> apll12_div_fmi2s
> /
> clk26m  --> top_apll2
>        /
> apll2  --> apll2_d4  --> top_aud_eng2
>                      /
>        vlp_clk26m

This shows the parents of top_aud_eng1, top_aud_eng2, top_apll1, top_apll2,
and apll12_div_fmi2s.

My point is that all these parents should not be referenced unless they
also directly feed some input to the AFE block.

> vlp_clk26m -> top_aud_intbus
>
>
> >
> > > +      - const: top_i2sin0
> > > +      - const: top_i2sin1
> > > +      - const: top_fmi2s
> > > +      - const: top_tdmout
> > > +      - const: top_adsp
> > > +      - const: clk26m
> >
> > Is this one directly needed? It is similar to vlp_clk26m, and I
> > suspect
> > only that one is needed.
> >
> vlp_clk26m belongs to the VLP clock domain, and clk26 belongs to the
> system clock domain;
>
> top_apll1/top_apll2 can only select system apll1/apll2 or clk26m, they
> cannot use vlp_clk26m;

Yes. What I mean is that clk26m does not directly feed the AFE block.
If it does not directly feed the AFE block, it shouldn't be listed.

So please think about the modules in the AFE, and the clock gates in
the AFE block; think about what "external" clocks feed into them. Those
are the ones you should list.


ChenYu

> BR
> Darren Ye
>
> >
> > ChenYu
> >
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - memory-region
> > > +  - mediatek,vlpcksys
> > > +  - power-domains
> > > +  - clocks
> > > +  - clock-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    soc {
> > > +        #address-cells =3D <2>;
> > > +        #size-cells =3D <2>;
> > > +
> > > +        afe@1a110000 {
> > > +            compatible =3D "mediatek,mt8196-afe";
> > > +            reg =3D <0 0x1a110000 0 0x9000>;
> > > +            interrupts =3D <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +            memory-region =3D <&afe_dma_mem_reserved>;
> > > +            mediatek,vlpcksys =3D <&vlp_cksys_clk>;
> > > +            power-domains =3D <&scpsys 14>;
> > > //MT8196_POWER_DOMAIN_AUDIO
> > > +            clocks =3D <&vlp_cksys_clk 40>,
> > > //CLK_VLP_CK_AUD_INTBUS_SEL
> > > +                     <&vlp_cksys_clk 38>,
> > > //CLK_VLP_CK_AUD_ENGEN1_SEL
> > > +                     <&vlp_cksys_clk 39>,
> > > //CLK_VLP_CK_AUD_ENGEN2_SEL
> > > +                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
> > > +                     <&vlp_cksys_clk 45>, //CLK_VLP_CK_CLKSQ
> > > +                     <&cksys_clk 129>, //CLK_CK_APLL1
> > > +                     <&cksys_clk 132>, //CLK_CK_APLL2
> > > +                     <&cksys_clk 130>, //CLK_CK_APLL1_D4
> > > +                     <&cksys_clk 133>, //CLK_CK_APLL2_D4
> > > +                     <&cksys_clk 80>,
> > > //CLK_CK_APLL12_CK_DIV_I2SIN0
> > > +                     <&cksys_clk 81>,
> > > //CLK_CK_APLL12_CK_DIV_I2SIN1
> > > +                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
> > > +                     <&cksys_clk 93>,
> > > //CLK_CK_APLL12_CK_DIV_TDMOUT_M
> > > +                     <&cksys_clk 94>,
> > > //CLK_CK_APLL12_CK_DIV_TDMOUT_B
> > > +                     <&cksys_clk 43>, //CLK_CK_AUD_1_SEL
> > > +                     <&cksys_clk 44>, //CLK_CK_AUD_2_SEL
> > > +                     <&cksys_clk 66>, //CLK_CK_APLL_I2SIN0_MCK_SEL
> > > +                     <&cksys_clk 67>, //CLK_CK_APLL_I2SIN1_MCK_SEL
> > > +                     <&cksys_clk 78>, //CLK_CK_APLL_FMI2S_MCK_SEL
> > > +                     <&cksys_clk 79>, //CLK_CK_APLL_TDMOUT_MCK_SEL
> > > +                     <&cksys_clk 45>, //CLK_CK_ADSP_SEL
> > > +                     <&cksys_clk 140>; //CLK_CK_TCK_26M_MX9
> > > +            clock-names =3D "top_aud_intbus",
> > > +                          "top_aud_eng1",
> > > +                          "top_aud_eng2",
> > > +                          "top_aud_h",
> > > +                          "vlp_clk26m",
> > > +                          "apll1",
> > > +                          "apll2",
> > > +                          "apll1_d4",
> > > +                          "apll2_d4",
> > > +                          "apll12_div_i2sin0",
> > > +                          "apll12_div_i2sin1",
> > > +                          "apll12_div_fmi2s",
> > > +                          "apll12_div_tdmout_m",
> > > +                          "apll12_div_tdmout_b",
> > > +                          "top_apll1",
> > > +                          "top_apll2",
> > > +                          "top_i2sin0",
> > > +                          "top_i2sin1",
> > > +                          "top_fmi2s",
> > > +                          "top_tdmout",
> > > +                          "top_adsp",
> > > +                          "clk26m";
> > > +        };
> > > +    };
> > > +
> > > +...
> > > --
> > > 2.45.2
> > >
> > >
>
> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
>
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

