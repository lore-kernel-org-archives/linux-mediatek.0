Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4420EC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIita4Mx/OZl+X+VeaS6ACjFa0zy1JtZ/wxGcvDjX4M=; b=umEZI9auOvkiGyuJL5mVtwMrML
	G4u+aHHQ55ra7R5/c5AXMMp1foVPdCmTcqeTlQVHlZmJFFKZVuMcSjt9uu+tbVnXW+WoXUik9Psir
	ttYDelilqcvgKVNcYT/Ozb0MIaXUL6G8qbZIpfYuOLORzoEqrkmy7hFQZnk00rWpIrxVJ2uIIxDZf
	gu7C/UryDDbyCEadOaJYJkDd0MM0KZhUpY7eLXSl53f8zrhzUgBATXDetSL9uMTo4+2A7USgsMUu8
	oMzLJE8gwD/xavgn3aZEE8UMuqcnMDfvLBFG6rXU5zSigvhT1/Sopkv/zydOuuh9uFNGR0Yw9urPr
	po8F3pVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2A9M-007Lfr-Ox; Fri, 17 Jun 2022 11:28:28 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2A83-007L0t-O7; Fri, 17 Jun 2022 11:27:09 +0000
Received: by mail-io1-xd2d.google.com with SMTP id h8so4212168iof.11;
        Fri, 17 Jun 2022 04:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cIita4Mx/OZl+X+VeaS6ACjFa0zy1JtZ/wxGcvDjX4M=;
        b=cBnghZ9dK8jQypp2zWcU1IJmfJ9ib0azbSO3a6CUrQ6p7k8MqcOEu38UcGE/ELnbTj
         H8ijRkJPVfwZkD66BARfJX9oqGp5ge7C/Qw3DlQbZsvEEWj/J9mBU7bCEKxQwlnlHY9M
         SBloAA7m7tmnhDjWeMSIY/T7PARhocjfJGPxhzOeODLK3cPap+SSyb4kH1Z//ZuD4l8v
         x9YVQQnDeCAKKsgUNQMFXKyMOFvhFCJyKXsnWZg4h4AFQs9m8271FmL3Oc4bhBIDrys2
         AKhbEKwxmxTk/45W3UpXfGJzK42rRBHh7djKKQ7LrLGqFCSjNEcYTb/10k6Q8kliAaAJ
         T0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cIita4Mx/OZl+X+VeaS6ACjFa0zy1JtZ/wxGcvDjX4M=;
        b=OWrd6CuQqKX/FYJG/+VcAaLL7fj1hvCQRkMl+lyCNhUurcG5DY/eyGlyelnDtJg3dg
         xr6aEbG9w+X3kqOG2nxfXbwBsEYmF/6dQkD73mcB1bfPMcAOIHMWneW1CbDfEktcfDRH
         Jy2s8FQ3WsZmv0Mj9ZkjwvndZ5z7lm9apeKorH+wVUj3lsUhTaI9uVX97/HJh3JlMUsa
         dtp3TN/8FgylNpS1OmRWuToo9BnN7puz0JqFmk5zhGIHQdXd/uWjbooozQD5/h30YZ5s
         mPOCZqTDj0S80XhdIiGphtglKBpyROs1WPDTSE1q1CFWyi4og7wPSXWqfqaJbizW/1i7
         0Zng==
X-Gm-Message-State: AJIora8XUpWji0FlC9NTid1pMCDIvHf4qVK2M7ZU10FC44YCHP5AAJ5X
	SZk2VCxoqPGk/zr+bqpWIlNuM0FtfANuQDT/Kmk=
X-Google-Smtp-Source: AGRyM1v+uOPPKXH5BGj0nN0XZL/uXw8K7soKzPUvo/hXYcZRuyA8S1WlggM3NtZdIqlhGxZxIj4Std5tTPlwSTv8/pI=
X-Received: by 2002:a05:6638:d01:b0:331:d29a:8e60 with SMTP id
 q1-20020a0566380d0100b00331d29a8e60mr5201134jaj.254.1655465225916; Fri, 17
 Jun 2022 04:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com> <20220613111146.25221-7-peterwu.pub@gmail.com>
 <28b73da7-d97c-5ea5-0b22-724fa971aeb0@linaro.org>
In-Reply-To: <28b73da7-d97c-5ea5-0b22-724fa971aeb0@linaro.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 19:26:55 +0800
Message-ID: <CABtFH5LTpHyaJvwr6WHWx89gdGmsD-inWJa_LidyJzSL5bxowg@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] dt-bindings: mfd: Add Mediatek MT6370
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com, 
	lee.jones@linaro.org, Daniel Thompson <daniel.thompson@linaro.org>, jingoohan1@gmail.com, 
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com, 
	ChiYuan Huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_042707_842257_896DE4B6 
X-CRM114-Status: GOOD (  19.45  )
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

Hi Krzysztof,

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B46=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=B8=85=E6=99=A85:15=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On 13/06/2022 04:11, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek MT6370 binding documentation.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  .../bindings/mfd/mediatek,mt6370.yaml         | 279 ++++++++++++++++++
> >  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
> >  2 files changed, 297 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt63=
70.yaml
> >  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml=
 b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > new file mode 100644
> > index 000000000000..6c2639e81e50
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > @@ -0,0 +1,279 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT6370 SubPMIC
> > +
> > +maintainers:
> > +  - ChiYuan Huang <cy_huang@richtek.com>
> > +
> > +description: |
> > +  MT6370 is a highly-integrated smart power management IC, which inclu=
des a
> > +  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-=
C &
> > +  Power Delivery (PD) controller, dual flash LED current sources, a RG=
B LED
> > +  driver, a backlight WLED driver, a display bias driver and a general=
 LDO for
> > +  portable devices.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6370
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  wakeup-source: true
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +
> > +  adc:
> > +    type: object
> > +    description: |
> > +      Provides 9 channels for system monitoring, including vbusdiv5, v=
busdiv2,
> > +      vbat, vsys, chg_vddp, ts_bat, ibus, ibat, and temp_jc.
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mt6370-adc
> > +
> > +      "#io-channel-cells":
> > +        const: 1
> > +
> > +    required:
> > +      - compatible
> > +      - '#io-channel-cells'
>
> Decide in your entire patchset whether you use ' or ". Don't mix.

Thanks for your comments.
We apologize for doing these mistakes...
We will use the same symbol in the entire patchset and check again
before the next submission.

>
> Since you did not test your bindings, I am not reviewing it. First, test
> them. No need for me to do the job of a automated tool, right?
>
> Best regards,
> Krzysztof

Best regards,
ChiaEn Wu

