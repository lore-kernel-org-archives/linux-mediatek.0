Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FB6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 08:14:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC4B8603E5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 08:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC4B8603E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCiyjlKbWo9/p5UKZKhrGGKaHT5da2gnC00zSGyZ2eI=; b=0E15CssaWL42Qr
	MgyXvwHV5v8CuWFwILtO/fghOMXUeMxb4pysH06L7xeSRAbhq2UavqOqdQoEUnhlTrSecokD9/Hh2
	GztOdIPF3KPv+KzwBVVbRHJ0pBaCaiM5i/U7PExbMSh+M14djWB00AA98iuoaz7W5CT9PECYC6wKz
	SLqVfOrpmpVLmM5N1V9qMg3skjTZF/3OS39T2aSonpkKLIg3QfxgUH0aT0Y7urwdq39tgiSEBNEK2
	ff/ByeQS15rpce+l2w1e+cxTjHKhAco7wcHz49KE36ywttWYrbaf5nGTB0e+VuKB2WLBiMDhoyARg
	5VIjGwC3NHeRTZb1lOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZPR-00FWZg-8m; Wed, 13 Oct 2021 08:14:45 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maY59-00FDAn-6P
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 06:49:45 +0000
Received: by mail-lf1-x136.google.com with SMTP id c16so7270817lfb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Oct 2021 23:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZFyXssI7TrFyz6t72UIWjHiVPEaGRTFviZ9B7b1svQ=;
 b=iPAivlo5uIKBxRfNUXcOVhQG7osPvDAYsKhzpbHwuoQ9aRqJOVq0CIRSJJLsHiVUUR
 esn/LxUxQJ3bT6IDck5KrRR4XQfGxDdO1QkAnr3Efw+Jbn0XB6gZpc621AyVERubhwWH
 hl+97CPoXQzYj7hxmpDhOVSF3m6+2E3dxeqPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZFyXssI7TrFyz6t72UIWjHiVPEaGRTFviZ9B7b1svQ=;
 b=HHUzzI7V0CWTqFLxGm18fsm35DpiAezAkCvITv7vpmUdbafi0hEqyOo3SoW+9so6mx
 SIU0XETnf8ykDR0UzWoYpDRtsnFrkQYaHidUTveuLY+C98R9pNbeBYmMU+Xq+WkXgERm
 IMhtbDKfW3q+OQRysH1o183EZUH6owjoZ0xCYqWQ9jyaK3MGx9Z8kg9/8CtPsQq3uomg
 88spk0I4MxDrQBoqmAFHg8f5qL/X08DLHMznDxSCfxFGNTI2QgnkgSNLinhh04ZupNCM
 v7rRo3VgpwJPAFkTVc/Rhcp9XryomcWBxJUQCbV3pdL6WQGHRlsXVnjfHVeP1hiEcpjp
 g+wA==
X-Gm-Message-State: AOAM530WaEfkso8RnLhMWVC7RPco6D7cYRtArSScqUb5BfhblrWmALoD
 IKBxwy3nG0JdmHDqp84d9fUaXs8AbYWH45SaRVRyLQ==
X-Google-Smtp-Source: ABdhPJwFRC8f4YHp1POH1B8FM/bW1GCM0+rzp1dcWUlLDn5NbCrjKKqZDtFyz2PzgznWSPlne39IuFhFg8Pa7ILhz9w=
X-Received: by 2002:ac2:5627:: with SMTP id b7mr9696386lff.670.1634107780512; 
 Tue, 12 Oct 2021 23:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
 <20210924080632.28410-3-zhiyong.tao@mediatek.com>
 <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
 <37eac06e20d82c0fe37a5d8e5633cbbc48d4af29.camel@mediatek.com>
In-Reply-To: <37eac06e20d82c0fe37a5d8e5633cbbc48d4af29.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 13 Oct 2021 14:49:29 +0800
Message-ID: <CAGXv+5GoXu-Jg6Lhbfjd2an7nzzn2EHqQ7DN6FCB6EBRocavgQ@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull up/down
 description
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Light Hsieh <light.hsieh@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_234943_289518_83A3AEC6 
X-CRM114-Status: GOOD (  43.00  )
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

On Thu, Sep 30, 2021 at 9:59 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Wed, 2021-09-29 at 16:47 -0500, Rob Herring wrote:
> > On Fri, Sep 24, 2021 at 04:06:29PM +0800, Zhiyong Tao wrote:
> > > For supporting SI units in "bias-pull-down" & "bias-pull-up",
> > > change pull up/down description
> > > and add "mediatek,rsel_resistance_in_si_unit" description.
> > >
> > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > ---
> > >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 86
> > > ++++++++++++++++++-
> > >  1 file changed, 84 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-
> > > mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-
> > > mt8195.yaml
> > > index 2f12ec59eee5..5f642bef72af 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > @@ -49,6 +49,12 @@ properties:
> > >      description: The interrupt outputs to sysirq.
> > >      maxItems: 1
> > >
> > > +  mediatek,rsel_resistance_in_si_unit:
> >
> > s/_/-/
>
> Hi Rob,
>
> what do you mean?

He means: replace the hyphens ("-") with underscores ("_").
(s/X/Y/ is a regular expression.)

> >
> > > +    type: boolean
> > > +    description: |
> > > +      Identifying i2c pins pull up/down type which is RSEL. It can
> > > support
> > > +      RSEL define or si unit value(ohm) to set different
> > > resistance.
> >
> > Aren't the RSEL and ohms disjoint values? 0-207 for RSEL and >1000
> > for
> > ohms. Why is this property even needed.
> >
> No, they aren't.
> As we talked in v11. "mediatek,rsel_resistance_in_si_unit" is only a
> flag.
>
>
>
> Hi ChenYu,
>
> In the next version, we provide a solution which we discussed internal
> to avoid value clashes.
>
> The solution:
> 1. We will keep the define "MTK_PULL_SET_RSEL_000 200". It won't
> change.
>
> 2. We will add a property in pio dtsi node, for example,
> the property name is "rsel_resistance_in_si_unit".
> We will add a flag "rsel_si_unit" in pinctrl device.
> in probe function, we will identify the property name
> "rsel_resistance_in_si_unit" to set the flag "rsel_si_unit" value.
> So it can void value clashes.
>
> 3.We will provide the define "MTK_PULL_SET_RSEL_000 200" and si unit
> two solution. users can support which solution by add property
> "rsel_resistance_in_si_unit" in dts node or not.

Right. I thought that is what is implemented in this version already?

Also I just realized that this binding is limited in scope to just the
MT8195, for which we already know that the RSEL values do not overlap
with MTK_PULL_SET_RSEL_*. I assume that is why Rob thinks the flag
is unnecessary.

> > > +
> > >  #PIN CONFIGURATION NODES
> > >  patternProperties:
> > >    '-pins$':
> > > @@ -85,9 +91,85 @@ patternProperties:
> > >            2/4/6/8/10/12/14/16mA in mt8195.
> > >          enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > >
> > > -      bias-pull-down: true
> > > +      bias-pull-down:
> > > +        description: |
> > > +          For pull down type is normal, it don't need add RSEL &
> > > R1R0 define
> > > +          and resistance value.
> > > +          For pull down type is PUPD/R0/R1 type, it can add R1R0
> > > define to
> > > +          set different resistance. It can support
> > > "MTK_PUPD_SET_R1R0_00" &
> > > +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> > > "MTK_PUPD_SET_R1R0_11"
> > > +          define in mt8195.
> > > +          For pull down type is RSEL, it can add RSEL define &
> > > resistance value(ohm)
> > > +          to set different resistance by identifying property
> > > "mediatek,rsel_resistance_in_si_unit".
> > > +          It can support "MTK_PULL_SET_RSEL_000" &
> > > "MTK_PULL_SET_RSEL_001"
> > > +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> > > "MTK_PULL_SET_RSEL_100"
> > > +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> > > "MTK_PULL_SET_RSEL_111"
> > > +          define in mt8195. It can also support resistance
> > > value(ohm) "75000" & "5000" in mt8195.
> > > +          oneOf:
> >
> > Because of the indentation, this is all just part of 'description'.
>
> Can you help to give some suggestion to fix it?

Unindent it by two spaces, so that it is at the same level with
"description:".

> > > +            - enum: [100, 101, 102, 103]
> > > +            - description: mt8195 pull down PUPD/R0/R1 type define
> > > value.
> >
> > This entry is always true.
>
> why is it always true? we only get define value.
> "100~104" are means that "#define MTK_PUPD_SET_R1R0_10 102" in
> include/dt-bindings/pinctrl/mt65xx.h.

"description" is not a conditional match, so it always evaluates to true.
Based on my limited DT schema and YAML knowledge, I think the underlying
issue is that you have the structure incorrectly defined.

"-" denotes a list item. So in your example, you have "enum" and "description"
as separate associative arrays, each as a list item part of the "oneOf" list.

What you want is actually:

    oneOf:
      - enum: [100, 101, 102, 103]
        description: mt8195 pull down PUPD/R0/R1 type define value.
      - enum: [200, 201, 202, 203, 204, 205, 206, 207]
        description: mt8195 pull down RSEL type define value.

So that "enum" and "description" are part of the same associative array.
Note the lack of a "-" and the extra indentation in front of "description".


Regards
ChenYu


> >
> > > +            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> >
> > Are these supposed to be hex?
> yes, it is patch 1/5 define "#define MTK_PULL_SET_RSEL_000  200".
> >
> > > +            - description: mt8195 pull down RSEL type define
> > > value.
> >
> > And so is this one. That makes 'oneOf' always false.
>
> why is it always false? we only get the si unit value.
>
> >
> > > +            - enum: [75000, 5000]
> > > +            - description: mt8195 pull down RSEL type si unit
> > > value(ohm).
> > > +
> > > +          An example of using RSEL define:
> > > +          pincontroller {
> > > +            i2c0_pin {
> > > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > > +              bias-pull-down = <MTK_PULL_SET_RSEL_001>;
> > > +            };
> > > +          };
> > > +          An example of using si unit resistance value(ohm):
> > > +          &pio {
> > > +            mediatek,rsel_resistance_in_si_unit;
> > > +          }
> > > +          pincontroller {
> > > +            i2c0_pin {
> > > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > > +              bias-pull-down = <75000>;
> > > +            };
> > > +          };
> > >
> > > -      bias-pull-up: true
> > > +      bias-pull-up:
> > > +        description: |
> > > +          For pull up type is normal, it don't need add RSEL &
> > > R1R0 define
> > > +          and resistance value.
> > > +          For pull up type is PUPD/R0/R1 type, it can add R1R0
> > > define to
> > > +          set different resistance. It can support
> > > "MTK_PUPD_SET_R1R0_00" &
> > > +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> > > "MTK_PUPD_SET_R1R0_11"
> > > +          define in mt8195.
> > > +          For pull up type is RSEL, it can add RSEL define &
> > > resistance value(ohm)
> > > +          to set different resistance by identifying property
> > > "mediatek,rsel_resistance_in_si_unit".
> > > +          It can support "MTK_PULL_SET_RSEL_000" &
> > > "MTK_PULL_SET_RSEL_001"
> > > +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> > > "MTK_PULL_SET_RSEL_100"
> > > +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> > > "MTK_PULL_SET_RSEL_111"
> > > +          define in mt8195. It can also support resistance
> > > value(ohm)
> > > +          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" &
> > > "10000" & "75000" in mt8195.
> > > +          oneOf:
> > > +            - enum: [100, 101, 102, 103]
> > > +            - description: mt8195 pull up PUPD/R0/R1 type define
> > > value.
> > > +            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> > > +            - description: mt8195 pull up RSEL type define value.
> > > +            - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000,
> > > 75000]
> > > +            - description: mt8195 pull up RSEL type si unit
> > > value(ohm).
> >
> > Same issues here.
> >
> > > +          An example of using RSEL define:
> > > +          pincontroller {
> > > +            i2c0_pin {
> > > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > > +              bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> > > +            };
> > > +          };
> > > +          An example of using si unit resistance value(ohm):
> > > +          &pio {
> > > +            mediatek,rsel_resistance_in_si_unit;
> > > +          }
> > > +          pincontroller {
> > > +            i2c0_pin {
> > > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > > +              bias-pull-up = <1000>;
> > > +            };
> > > +          };
> > >
> > >        bias-disable: true
> > >
> > > --
> > > 2.25.1
> > >
> > >
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
