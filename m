Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DE6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 07:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJvYPlDsAxbcNI5nuZWE2nsRQW+17W6hinl7VL5+b6o=; b=JygqyCuRT64p/k
	o0Ts6eiQRmezLzqSR4i/xCpG/kZKnYrD1zQy/XkW+PG9UgFdeMS71O488yvNvOkRTibqWMyavGph+
	6Mvvz64l4Xxx9i9tw5cnDEB4expt6MkB0I7yymptQ+erK53MogVJwDhr8ZWRFfrziXG1n0YV1V8xj
	lmaeHykvOX0dpkRB0MoR5R/94xb9Og4PqdqP8+w9u7ZKVCS7xA03bUdSCH5voyYlU9wd3/9MShWb9
	s6r6ZNliLseHYZxYBuK0VUYKyPpAS/9xMQf7qDCDjFyIdPJstbytL6Cy9O7xP/aOrUe5qC2RCiYmR
	gSxZaeszdaaPtZFnWHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNUvo-003Zlg-6D; Fri, 25 Feb 2022 07:22:24 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNUvl-003Zky-7R
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 07:22:23 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id v186so4205465ybg.1
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Feb 2022 23:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWYmZ6WIjg2jo6WNcY1+u9OGEF/N9ruyttQksT1HyTU=;
 b=WCTVovxV7gpWKeqZa30rH3AdvsFE0pz5JrOLAJ5sS7fIPymCjYDrgxHRTLtu/Arcs5
 qUJIIt9V+gB3/IUuFBHr6JaoPi2RIh8FhBrHiSakff9rMZ/ltsYHZDvZxDqDf8iwNtUJ
 lgdJtK7X3KW2WcjiXwRTTa+LaZuo6H2y7xcPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWYmZ6WIjg2jo6WNcY1+u9OGEF/N9ruyttQksT1HyTU=;
 b=m58zo5HBb3kEBQAiJMccaqutkO1PdHvJ7nABFWHueV8RFn0NqaizKPWi+3Guf2pTGj
 hYiDhnrvwTQ6x/54to3XPgto0u6SBdsmmXrj200HBmuPOTJnan4aagZ+BJhgMoBsH+Ej
 gchxq461IEcWriPIUedvKNw1AV9kvnsMbJ0qQuzRaMtDz0qikk4zMkh+LtFj1LLHaZi5
 X9ogKr2O72r/kPlHfN/Uad94tLBvkUVeFQsxygcEJvQrfELsoNqlzMmRSMB8Z6z/tUug
 /4174H5GTXOmZu0AhPsw187oevil4cI7GX940w1wmDNod9/9X7vG1LKDb1/BUyk+ENXB
 /wiA==
X-Gm-Message-State: AOAM532/ZKbfcgnIJ1yhJryr6wmd3hdFT4v6QhdbIXN2hLPj93dD54l+
 DlxsNmx30WnqnExsaqtCsSm2QuCHVZKk50mwKHxW2w==
X-Google-Smtp-Source: ABdhPJwzOnRfdqM+58QOWSe8nXD7NFaX3j6qD2xFZzi1OJLGUsY+hoQnD+tnv9AuSdv6jmKa5AQYZcGhI9Gx/oxfQFo=
X-Received: by 2002:a25:2393:0:b0:61d:f1c0:a779 with SMTP id
 j141-20020a252393000000b0061df1c0a779mr5620398ybj.461.1645773739760; Thu, 24
 Feb 2022 23:22:19 -0800 (PST)
MIME-Version: 1.0
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-2-git-send-email-xinlei.lee@mediatek.com>
 <CAGXv+5EQ5SzzHm9r0wPuE2+J=V4s8f5AopC0xFK1Eaqx_MzyhQ@mail.gmail.com>
 <918bfe38f716c2e1ca411ae42a5a9ab0bf810692.camel@mediatek.com>
In-Reply-To: <918bfe38f716c2e1ca411ae42a5a9ab0bf810692.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 25 Feb 2022 15:22:08 +0800
Message-ID: <CAGXv+5G3EOdTF_=y9JrR8RU6o5psJrfep=qz0te9ERqJ=zWC1w@mail.gmail.com>
Subject: Re: [v2, 1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek, 
 pwm-disp.yaml format
To: "xinlei.lee" <xinlei.lee@mediatek.com>
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, 
 lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com, 
 jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_232221_296405_F41221C9 
X-CRM114-Status: GOOD (  35.55  )
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

On Fri, Feb 25, 2022 at 3:19 PM xinlei.lee <xinlei.lee@mediatek.com> wrote:
>
> On Fri, 2022-02-25 at 14:24 +0800, Chen-Yu Tsai wrote:
> > On Wed, Feb 16, 2022 at 5:43 PM <xinlei.lee@mediatek.com> wrote:
> > >
> > > From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> > >
> > > Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as
> > > suggested by maintainer
> > >
> > > Signed-off-by: Xinlei Lee <
> > > xinlei.lee@mediatek.corp-partner.google.com>
> > > ---
> > >  .../bindings/pwm/mediatek,pwm-disp.yaml       | 71
> > > +++++++++++++++++++
> > >  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 ------------
> > >  2 files changed, 71 insertions(+), 44 deletions(-)
> > >  create mode 100755
> > > Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-
> > > disp.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > > disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > > disp.yaml
> > > new file mode 100755
> > > index 000000000000..edf2a2e9ea72
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > > @@ -0,0 +1,71 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Mediatek PWM Controller Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Jitao Shi <jitao.shi@mediatek.com>
> > > +  - Xinlei Lee <xinlei.lee@mediatek.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt2701-disp-pwm
> > > +      - mediatek,mt6595-disp-pwm
> > > +      - mediatek,mt8173-disp-pwm
> > > +      - mediatek,mt8183-disp-pwm
> >
> > mt8183 was not in the original text file binding. Please split this
> > out.
> > Also, the combination "mediatek,mt8167-disp-pwm", "mediatek,mt8173-
> > disp-pwm"
> > is missing.
> >
> > ChenYu
> >
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  "#pwm-cells":
> > > +    description:
> > > +      Number of cells in a PWM specifier.
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Main Clock
> > > +      - description: Mm Clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: main
> > > +      - const: mm
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - power-domains
> > > +  - "#pwm-cells"
> > > +  - clocks
> > > +  - clock-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/clock/mt8183-clk.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/power/mt8183-power.h>
> > > +
> > > +    pwm: pwm@1100e000 {
> > > +        compatible = "mediatek,mt8183-disp-pwm";
> > > +        reg = <0x1100e000 0x1000>;
> > > +        interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_LOW>;
> > > +        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > > +        #pwm-cells = <2>;
> > > +        clocks = <&topckgen CLK_TOP_MUX_DISP_PWM>,
> > > +                 <&infracfg CLK_INFRA_DISP_PWM>;
> > > +        clock-names = "main", "mm";
> > > +    };
> > > diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> > > b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> > > deleted file mode 100644
> > > index 902b271891ae..000000000000
> > > --- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> > > +++ /dev/null
> > > @@ -1,44 +0,0 @@
> > > -MediaTek display PWM controller
> > > -
> > > -Required properties:
> > > - - compatible: should be "mediatek,<name>-disp-pwm":
> > > -   - "mediatek,mt2701-disp-pwm": found on mt2701 SoC.
> > > -   - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
> > > -   - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found
> > > on mt8167 SoC.
> > > -   - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
> > > - - reg: physical base address and length of the controller's
> > > registers.
> > > - - #pwm-cells: must be 2. See pwm.yaml in this directory for a
> > > description of
> > > -   the cell format.
> > > - - clocks: phandle and clock specifier of the PWM reference clock.
> > > - - clock-names: must contain the following:
> > > -   - "main": clock used to generate PWM signals.
> > > -   - "mm": sync signals from the modules of mmsys.
> > > - - pinctrl-names: Must contain a "default" entry.
> > > - - pinctrl-0: One property must exist for each entry in pinctrl-
> > > names.
> > > -   See pinctrl/pinctrl-bindings.txt for details of the property
> > > values.
> > > -
> > > -Example:
> > > -       pwm0: pwm@1401e000 {
> > > -               compatible = "mediatek,mt8173-disp-pwm",
> > > -                            "mediatek,mt6595-disp-pwm";
> > > -               reg = <0 0x1401e000 0 0x1000>;
> > > -               #pwm-cells = <2>;
> > > -               clocks = <&mmsys CLK_MM_DISP_PWM026M>,
> > > -                        <&mmsys CLK_MM_DISP_PWM0MM>;
> > > -               clock-names = "main", "mm";
> > > -               pinctrl-names = "default";
> > > -               pinctrl-0 = <&disp_pwm0_pins>;
> > > -       };
> > > -
> > > -       backlight_lcd: backlight_lcd {
> > > -               compatible = "pwm-backlight";
> > > -               pwms = <&pwm0 0 1000000>;
> > > -               brightness-levels = <
> > > -                         0  16  32  48  64  80  96 112
> > > -                       128 144 160 176 192 208 224 240
> > > -                       255
> > > -               >;
> > > -               default-brightness-level = <9>;
> > > -               power-supply = <&mt6397_vio18_reg>;
> > > -               enable-gpios = <&pio 95 GPIO_ACTIVE_HIGH>;
> > > -       };
> > > --
> > > 2.18.0
> > >
> > >
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>
> Hi chenyu:
>
> Thanks for your suggestion!
> If you think there is no 8183 in the original .txt file, I can put it
> in another patch similar to 8192/8186 operation.

Yes, you should add it in another patch, not in the conversion patch.

> In the latest pwm-mtk-disp.c I didn't find 8167 related compatiable, do
> I still need to add it to the new .yaml file?

It was in the original binding, so yes you need to preserve it when you
convert the binding. Otherwise you would have changed things when doing
the conversion.

The driver doesn't have it because it is falling back to the mt8173 one.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
