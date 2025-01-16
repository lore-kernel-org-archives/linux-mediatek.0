Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64941C02180
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 08:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlxhihBzGkG01xdrohL1hg4VaFCb7XcTgs8Zt8fu17I=; b=LIv07NcMajh4nMv+asdAg9XYFD
	tyeiYuqtYNm3AdQImJAs8XfrBAeHRpNaOuBOJisWL/ZQiT471C3p1bdSxLiblrJmCIvsyP58EYmGc
	9dS7YI48RBx7TlkmOk5bXfzbOawnzr/QUmO0Xc8u+kGSmvQccMIJ++jUPGj2ODD9LZHWXA8NO3oIC
	aBxWOndCWr9O0jw1EFeOOA/fHwp1Tc5EicEwsMs1Asuy1Rgqbx5/Ojv8qpV1TSdjsUSinSNGzzz4g
	x0vhVislv6IbAQDRgSvqc7Fwss3k3ETr+uZ5khKQpBTfXxLi9PjdJPwxsPH9AN6r0X3lp9Zu/kK//
	jmdb5rQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLKo-0000000EEZE-26rX;
	Thu, 16 Jan 2025 08:34:38 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLK2-0000000EEMt-21ra
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 08:33:51 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53e3778bffdso788590e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jan 2025 00:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737016428; x=1737621228; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlxhihBzGkG01xdrohL1hg4VaFCb7XcTgs8Zt8fu17I=;
        b=cvE4/L9dOIiNgeZmsvsOZ+9ek0VQMECko2dYbLxFA1ewiNrt2LvEfXHWIGPfE1gGnw
         0ERp4O8lsaRJcSQKq4CpCzkztN0H4S4ovBwz8HUdcLm+Hi819w5mLrbOCqWkcoTqQGB2
         MnfjnnXnOUR6IMeeiuE8J+sF7Cqmj/o8GpFSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737016428; x=1737621228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlxhihBzGkG01xdrohL1hg4VaFCb7XcTgs8Zt8fu17I=;
        b=ZL9GHD3IDZNEPaR8M9XYFV/vEDK20aA8+6owQYX3M5cHCGz16lqK/Fji2IRPfbFB2Y
         zT4NbQVlLM22mBYXYHLlipECgGNxLfbcNin8E1IAnw/jyOM9Z/xyQuw4YwTGs8cf/4qU
         rcbPRSv0n9iv2UTr947+nEiP0QxHldHrLMfWtQ5tzjYssyeGKSjshygUFbz0cnWg8fjq
         T7jUK+6ficUqs0rnEoUXz+IpnuOVSLJxK7HXcTeNxywU85+LOaYHLHlekD5qHmEUHY3Q
         ShXr3SSdnvU3cIjb3ohZMqfOfLbPNIlIvFfP/5GCEdlNNoNvU5JtlwavuXabpCvzeXLK
         sNUg==
X-Forwarded-Encrypted: i=1; AJvYcCVgnPm+CJbcuPcZhnjj04827smidTt2BMcm5x1ycyhreeEfdoba0lnR26DRaIBdiDiXa+LW8YrnxtJ4oc3FEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEsUtqgINeXsW9bxhdyJrHSJrWbqVdg4zITZ4ULCJ3C58xLPB8
	NRVOsgxo9ZG4NYEPEuM1DpnD1S7npRxazSQ4nBZe98Yx1yBDm9cZueMLJTeCtyYZgv5X4ph3/sM
	B+nPB8K12OeLfLtyX3Ei5CvY94rahDCit4dVp
X-Gm-Gg: ASbGncvG3fl8d200cLgxT9og2JADIPw3s1c5ZuTM23o6G/ERXsNbzd4806ZOOk9rZLx
	DZZvomGX3qbhUqouI9VrgiWJOW98EC9eGefAnOP2zW2pJff5GZe+hbkZTqBM5EHrx4w==
X-Google-Smtp-Source: AGHT+IETZECUFjA7jsQRc+8IYIKanM9wCL3x+xtLQoHqNUQLICzdo828cgP3eJuzBUp2T/x5z1I1Fp5/61CVwllU37k=
X-Received: by 2002:a05:6512:3b90:b0:542:218a:343 with SMTP id
 2adb3069b0e04-542845bc8c2mr11154462e87.52.1737016428058; Thu, 16 Jan 2025
 00:33:48 -0800 (PST)
MIME-Version: 1.0
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
 <20250115063555.32492-2-ot_cathy.xu@mediatek.com> <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
 <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
 <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org> <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
In-Reply-To: <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jan 2025 16:33:37 +0800
X-Gm-Features: AbW1kvbMlBprboi-YZwzLIStKykzvyz7QyUqIfdBS-y45OdVzJCt_gg7fuK1j1I
Message-ID: <CAGXv+5FtA7KCPE1FQ1Wp=M_11=20n432zSWTkeBasUa4fdpm8A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for mt8196
To: =?UTF-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
Cc: "krzk@kernel.org" <krzk@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	=?UTF-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "sean.wang@kernel.org" <sean.wang@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_003350_553823_E92F2452 
X-CRM114-Status: GOOD (  50.02  )
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

On Thu, Jan 16, 2025 at 4:19=E2=80=AFPM Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=A9=
=B7) <ot_cathy.xu@mediatek.com> wrote:
>
> On Thu, 2025-01-16 at 08:28 +0100, Krzysztof Kozlowski wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On 16/01/2025 03:20, Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=A9=B7) wrote:
> > > > > +          bias-pull-down:
> > > > > +            oneOf:
> > > > > +              - type: boolean
> > > > > +              - enum: [100, 101, 102, 103]
> > > > > +                description: mt8196 pull down PUPD/R0/R1 type
> > > > > define value.
> > > > > +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> > > > > +                description: mt8196 pull down RSEL type define
> > > > > value.
> > > >
> > > > Not much improved.
> > >
> > >   I have removed the content related to 'resistance value', we use
> > > 'RSEL' instead of 'resistance value'.
> >
> > So the value in Ohms was removed? I assume above do not have known
> > value
> > in Ohms?
>
>   Yes, value in Ohns was removed, no code have knowm value.

That's sad. We went through a lot during the MT8195 cycle to get the
paris driver library to support proper SI unit values [1] to replace
the RSEL values (200 ~ 207). Why can't this be supported anymore?

Also we never got around to getting rid the PUPD/R0/R1 values (100 ~ 103).

> >
> > >
> > > >
> > > >
> > > > > +            description: |
> > > > > +              For pull down type is normal, it doesn't need
> > > > > add
> > > > > RSEL & R1R0.
> > > > > +              For pull down type is PUPD/R0/R1 type, it can
> > > > > add
> > > > > R1R0 define to
> > > > > +              set different resistance. It can support
> > > > > "MTK_PUPD_SET_R1R0_00" &
> > > > > +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10"
> > > > > &
> > > > > +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
> > > > > +              For pull down type is PD/RSEL, it can add RSEL
> > > > > define to set
> > > > > +              different resistance. It can support
> > > > > +              "MTK_PULL_SET_RSEL_000" &
> > > > > "MTK_PULL_SET_RSEL_001" &
> > > > > +              "MTK_PULL_SET_RSEL_010" &
> > > > > "MTK_PULL_SET_RSEL_011" &
> > > > > +              "MTK_PULL_SET_RSEL_100" &
> > > > > "MTK_PULL_SET_RSEL_101" &
> > > > > +              "MTK_PULL_SET_RSEL_110" &
> > > > > "MTK_PULL_SET_RSEL_111"
> > > > > define in
> > > > > +              mt8196.
> > > > > diff --git a/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> > > > > b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> > > > > new file mode 100644
> > > > > index 000000000000..bf0c8374407c
> > > > > --- /dev/null
> > > > > +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> > > > > @@ -0,0 +1,1572 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > > > > +/*
> > > > > + * Copyright (C) 2025 Mediatek Inc.
> > > > > + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> > > > > + */
> > > > > +
> > > > > +#ifndef __MT8196_PINFUNC_H
> > > > > +#define __MT8196_PINFUNC_H
> > > > > +
> > > > > +#include <dt-bindings/pinctrl/mt65xx.h>
> > > > > +
> > > > > +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
> > > > > +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) | 1)
> > > > > +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) | 3)
> > > > > +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0) | 4)
> > > > > +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK (MTK_PIN_NO(0) | 5)
> > > > > +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0) | 6)
> > > >
> > > > I do not see how you resolved my comment from v1. In v2 I
> > > > reminded
> > > > about
> > > > it, so you responded that yopu will change something, but I do
> > > > not
> > > > see
> > > > any changes.
> > > >
> > > > So explain: how did you resolve my comment?
> > > >
> > > > These two examples where you claim you will change something, but
> > > > send
> > > > the same. I skipped the rest of the patch.
> > >
> > >   Thank you for your patient response, here is my explanation for
> > > you
> > > question:
> > >
> > >   In v1, I undertand that you meant I didn't sent a real binding,
> > > and
> >
> >
> > The comment is under specific lines, so I said these defines are not
> > a
> > real binding. You sent them again, but they are still not bindings,
> > because they are not used in the driver. Maybe the usage is
> > convoluted,
> > so which part of implementation are these connecting with DTS? IOW,
> > which part of driver relies on the binding?
>
>   I got you. This binding define many macros, which will be used for
> 'pinmux' setting in the DTS. The usage like this:
>
>   adsp_uart_pins: adsp-uart-pins {
>                 pins-tx-rx {
>                         pinmux =3D <PINMUX_GPIO35__FUNC_O_ADSP_UTXD0>,
>                                  <PINMUX_GPIO36__FUNC_I1_ADSP_URXD0>;
>                 };
>         };

The only binding between the DT and the driver is the structure of
the value, given as "(MTK_PIN_NO(<N>) | <function mux value>)".

The whole list of "PINMUX_GPIOxxx__FUNC_xyz" macros is just a convenience
table for developers, and not used by the driver. The driver simply takes
the values from the two bit fields and uses them directly.

That's why Krzysztof is saying the macros are not used in the driver
and therefore not a binding.

Please move the header file to under "arch/arm64/boot/dts/mediatek",
and split it out as a separate commit with a subject like:

    arm64: dts: mediatek: mt8196: Add pinmux macro header file


ChenYu

> >
> >
> >
> > > the bindings should be separated from driver. In addition, I should
> > > run scripts/checkpatch.pl and scripts/get_maintainers.pl. So in v2,
> > > I
> > > sent a real binding(mediatek,mt8196-pinctrl.yaml), and sent two
> > > separate patches, one for driver and one for bindings, also ran
> > > scripts/get_maintainers.pl get necessary people and sent to them.
> > >
> > >   In v2, I understand that I need refer to git history to modify
> > > the
> > > commit msgs, so I made the changes in v3. Then you asked me about
> > > the
> > > difference between 'RSEL' and 'resistance value'. I replied that
> > > the
> > > 'resistance value' method is no longer use, so in v3, I removed all
> > > content about it(include entire 'rsel-resistance-in-si-unit'
> > > property
> > > and the parts mentioned in bias-pull-up/down).
> >
> > Yes, thank you this I saw, the comments appear under specific places,
> > so
> > only these places are discussed.
>
>   ok, thank you, we can discuss if there are any issues.
>
> >
> >
> >
> > Best regards,
> > Krzysztof

