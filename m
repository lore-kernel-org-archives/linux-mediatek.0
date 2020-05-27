Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCD4C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 15:28:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A186F208DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 15:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Me2f/Xld";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="meKNxFtF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A186F208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u43p1pBvjnxPYm2GgtpE99Zm3Vi0Hs7VunhLIgIQ2Vw=; b=Me2f/XldCMDTn4
	bqhrkrZB9AMrd2DHGt+x/6Uq1kXt2lO/BKrp5gHuiXtwmOAUFAkt7ghZsdDNpaqVS3lw4XDksxfb7
	VIgl2Y/jLdOnbudBHcV2zKOViLhIT+g0///telp1sNoUMG4PxUhG9n5jCikCcCmVeRR2A/fNCX0DX
	OvV8fMtDngYzAxYKYBReLRDCX78rwi0YLudPSSOng28civIjhhZKw0P70l0yqBITcdQOkCKdqftaY
	QKCxuuU9+Z47pdC0T4egMzpDQqIWMuH4QaABIt4V5a9q+VouDWXeqRPXz/ZuhHJg8+QChBrLLFEFD
	1Potjwecchh0HwSQoGmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdxy7-0008AI-Gr; Wed, 27 May 2020 15:27:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdxxw-00081o-2A; Wed, 27 May 2020 15:27:38 +0000
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CB3720C09;
 Wed, 27 May 2020 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590593255;
 bh=xAFJoL70d9ptR2NlMMkE9/iL0C+dD4a1o8Ji7U0Hb74=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=meKNxFtFPc8ejIUrmHPjvQMpux3lpz4nVSfwAHxcfmqFZ3ffOKRtZjEPFrDdeI51n
 0cpc8RWD9qbwCysQC9ittfZSPQk7aOa49Y69A+/XEqOTxoaUO0uG5DBBrkFbDGaxIM
 MKc9Hgg4/rrqQm3VTvEar4SzP9NNHGMqntCLgOSw=
Received: by mail-ot1-f42.google.com with SMTP id h7so19471598otr.3;
 Wed, 27 May 2020 08:27:35 -0700 (PDT)
X-Gm-Message-State: AOAM533wxk1NqXqH2tCxfHQkEwD+AjTJCnGUuA41aoqdhQXOfjoYNV4u
 SN4QqTzLBEAZ+nvgApxO0TtvnMkTIOSGuSAh1w==
X-Google-Smtp-Source: ABdhPJwAUmHkMY1nUf8HbXBqDXmvGKeOnwn9QC9NkyEmRMRdlXEbaZqugbcVRvRSQNkjP5kSY2sfkSI9xI4FKt86cmQ=
X-Received: by 2002:a05:6830:3104:: with SMTP id
 b4mr5098223ots.192.1590593254440; 
 Wed, 27 May 2020 08:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com>
 <20200526182847.GA92449@bogus>
 <1590569355.8804.448.camel@mhfsdcap03>
In-Reply-To: <1590569355.8804.448.camel@mhfsdcap03>
From: Rob Herring <robh@kernel.org>
Date: Wed, 27 May 2020 09:27:22 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
Message-ID: <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
Subject: Re: [V9,
 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_082736_144641_16240FA9 
X-CRM114-Status: GOOD (  26.54  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Louis Kuo <louis.kuo@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 27, 2020 at 2:51 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Rob,
>
> Thanks for the review. Please see my replies below.
>
> On Tue, 2020-05-26 at 12:28 -0600, Rob Herring wrote:
> > On Sat, May 23, 2020 at 04:41:02PM +0800, Dongchun Zhu wrote:
> > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   7 +
> > >  2 files changed, 179 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > new file mode 100644
> > > index 0000000..56f31b5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > @@ -0,0 +1,172 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +# Copyright (c) 2020 MediaTek Inc.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > +
> > > +description: |-
> > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > +  sensor output is available via CSI-2 serial data output.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ovti,ov02a10
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: top mux camtg clock
> > > +      - description: divider clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: eclk
> > > +      - const: freq_mux
> > > +
> > > +  clock-frequency:
> > > +    description:
> > > +      Frequency of the eclk clock in Hertz.
> > > +
>
> Rob, shall we use 'maxItems: 1' to constrain property: clock-frequency?

No, because it is a scalar, not an array.

> Or could we adopt 'clock-frequency: true' directly here?

As-is is fine.

> > > +  dovdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as Digital I/O voltage supply.
> > > +
>
> Shall we add 'maxItems: 1' here?

No, supplies are always singular.


>
> > > +  avdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as Analog voltage supply.
> > > +
>
> Ditto.
>
> > > +  dvdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as Digital core voltage supply.
> > > +
>
> Ditto.
>
> > > +  powerdown-gpios:
> > > +    description:
> > > +      Must be the device tree identifier of the GPIO connected to the
> > > +      PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
> > > +      or Shutdown mode. As the line is active low, it should be
> > > +      marked GPIO_ACTIVE_LOW.
> >
> > Need to define how many GPIOs ('maxItems: 1')
> >
>
> It would be fixed like this in next release.
> powerdown-gpios:
>   maxItems: 1
>   description:
>     Must be the device tree identifier of the GPIO connected to the
>     PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
>     or Shutdown mode. As the line is active low, it should be
>     marked GPIO_ACTIVE_LOW.
>
> > > +
> > > +  reset-gpios:
> > > +    description:
> > > +      Must be the device tree identifier of the GPIO connected to the
> > > +      RST_PD pin. If specified, it will be asserted during driver probe.
> > > +      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.
> >
> > Here too.
> >
>
> Similar as 'powerdown-gpios'.
> Fixed in next release.
>
> > > +
> > > +  rotation:
> > > +    description:
> > > +      Definition of the sensor's placement.
> > > +    allOf:
> > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > +      - enum:
> > > +          - 0    # Sensor Mounted Upright
> > > +          - 180  # Sensor Mounted Upside Down
> > > +        default: 0
> > > +
> > > +  ovti,mipi-tx-speed:
> > > +    description:
> > > +      Indication of MIPI transmission speed select, which is to control D-PHY
> > > +      timing setting by adjusting MIPI clock voltage to improve the clock
> > > +      driver capability.
> > > +    allOf:
> > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > +      - enum:
> > > +          - 0    #  20MHz -  30MHz
> > > +          - 1    #  30MHz -  50MHz
> > > +          - 2    #  50MHz -  75MHz
> > > +          - 3    #  75MHz - 100MHz
> > > +          - 4    # 100MHz - 130MHz
> > > +        default: 3
> > > +
> > > +  # See ../video-interfaces.txt for details
> > > +  port:
> > > +    type: object
> > > +    additionalProperties: false
> >
> > Should have a description of what data the port has.
> >
>
> It would be updated as below in next release.
> port:
>   type: object
>   additionalProperties: false
>   description:
>     Input port node, single endpoint describing the CSI-2 transmitter.

Output?

>
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +        additionalProperties: false
> > > +
> > > +        properties:
>
> Actually I wonder whether we need to declare 'clock-lanes' here?

Yes, if you are using it.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
