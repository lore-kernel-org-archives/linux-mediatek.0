Return-Path: <SRS0=LMMB=CJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B091BC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 11:51:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA1C20866
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 11:51:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fiawr6GT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FaiR145S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA1C20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6PS2CMZ9dPgJrvf5Vl37J4SyCCQo/xI2m9rb4V+5SxI=; b=Fiawr6GTC8GOc/8dm+USOumCr
	mc1YIa4EzthR49oVzngm3wgIapgRzpYuyyuHPoFj+IKrQHXUznUg6TBKxJc2xBv7Z2XmP+jXTWuzT
	LD+D8yAHCem9842/f6/Tqzn17JMAA6Sy9ufpmwIgUWaIbvztXvK2bGhlyciqIIkcVXK4wwqS/8Xz7
	sDo1qOcVl+sSYmdVZg1QjaC1OAZSAf0MMQX42SvC9wo+FlEnQuK0npZB1Ziq+mlQnbMv8WpTKTusL
	uuTMX9Y/4Zl1sIJ0LK/U8WFwUnIWsxmkj7EGMTcyv2g6E1Hm4eRraZEQY6q/aZzbPAT95W/wdg1j4
	UVas12L4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCiLD-0001Nw-C9; Mon, 31 Aug 2020 11:51:16 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCiLA-0001N9-Rc
 for linux-mediatek@lists.infradead.org; Mon, 31 Aug 2020 11:51:13 +0000
Received: by mail-ej1-x642.google.com with SMTP id bo3so8046038ejb.11
 for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2020 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=efGDe+zcHIa2VsRuM+m7GHMfouf/LYGtTzaBD57lCYU=;
 b=FaiR145STFKet4ABBn9muz0fH70Iib8OAiaAZFSQWpqeQHq3y/pZH07b/qf/KOfyOJ
 pl/wrRDqemy8wMDarwdpaqk8VWQka1xilVb4+b92LPoLNxq+dZ3ZWxV941MF8RQ+UCRL
 gyMOIAp1gr6MMoN3bCNDLeY1q5brBuXhDv/ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efGDe+zcHIa2VsRuM+m7GHMfouf/LYGtTzaBD57lCYU=;
 b=pLqB2TC/UiSoM6QJoejd/2bTeVhOP+tdGa7OkX+FT2TvGuV4fw5Pa5h9sVUdUMpGP/
 wgYZ+H7OpxbuTTRnvpKG6DQuANqGyj4djv05qbc7lsdpPAKw/rGAwJx2XeUo6o3ANUyQ
 gu/oCuLJ1VvxCc4jQYMxPjLdzPugUft8tdPqyOnQWU/IqU0C3F/x36kMnZF07UmMXrE5
 4GL9ZYFa28k6WZChZsN5utK1dp0F2w94YBSGpfAI3GY4ehmR0xsSCPc5GkyC4PKXdoGG
 FjTXi+FS8637zcF40xL/5rVlA3kXcSLQW7kGJUT/vbwefqgeRY8zqqOGe+wrNrSlIDP4
 ZGvg==
X-Gm-Message-State: AOAM531VDoxVnwXa7a3AEK0ttManMgFVO2udCDXholpONj/psWnw3QeT
 B5l3LU+lwx49aQkA4c+2FavP6JkKfiZvrg==
X-Google-Smtp-Source: ABdhPJyyRNQJVnZkXEy+xaap0WjUrea5LW8bRpnX+SBEGUnpRWVqCXokvKIgOUwrbhyN8z9QYtIIdQ==
X-Received: by 2002:a17:906:15cc:: with SMTP id l12mr813061ejd.7.1598874667753; 
 Mon, 31 Aug 2020 04:51:07 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id w11sm7376725edx.81.2020.08.31.04.51.07
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 04:51:07 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id b79so5023108wmb.4
 for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2020 04:51:07 -0700 (PDT)
X-Received: by 2002:a7b:c925:: with SMTP id h5mr1009961wml.28.1598874287354;
 Mon, 31 Aug 2020 04:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200710101850.4604-1-dongchun.zhu@mediatek.com>
 <20200710101850.4604-2-dongchun.zhu@mediatek.com>
In-Reply-To: <20200710101850.4604-2-dongchun.zhu@mediatek.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 31 Aug 2020 13:44:27 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BB3c9nvruY0jcVbRZtbUyiFj0v8=D6KA7EPtN4rz=+wA@mail.gmail.com>
Message-ID: <CAAFQd5BB3c9nvruY0jcVbRZtbUyiFj0v8=D6KA7EPtN4rz=+wA@mail.gmail.com>
Subject: Re: [PATCH v13 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
To: Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_075112_929301_BD749FA4 
X-CRM114-Status: GOOD (  27.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 matrix.zhu@aliyun.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 1095088256@qq.com,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dongchun,

On Fri, Jul 10, 2020 at 12:19 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Add YAML device tree binding for OV02A10 CMOS image sensor,
> and the relevant MAINTAINERS entries.
>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..3a916cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> +
> +description: |-
> +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> +  image sensor, which is the latest production derived from Omnivision's CMOS
> +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> +  sensor output is available via CSI-2 serial data output.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov02a10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: top mux camtg clock
> +      - description: divider clock
> +
> +  clock-names:
> +    items:
> +      - const: eclk
> +      - const: freq_mux

Why do we have two clocks here? Looking at the example suggests that
they may be the clocks of the SoC that the integration was done with.
However, the binding must only define the aspects of the particular
device, i.e. this sensor.

I suppose we should only have "eclk" here and it should be described
as "external clock for the sensor".

> +
> +  clock-frequency:
> +    description:
> +      Frequency of the eclk clock in Hertz.

nit: maybe Hz?

> +
> +  dovdd-supply:
> +    description:
> +      Definition of the regulator used as Digital I/O voltage supply.
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as Analog voltage supply.
> +
> +  dvdd-supply:
> +    description:
> +      Definition of the regulator used as Digital core voltage supply.
> +
> +  powerdown-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      PD_PAD pin. This pin is used to place the OV02A10 into standby mode
> +      or shutdown mode. As the line needs to be high for the powerdown mode
> +      to be active, it should be marked GPIO_ACTIVE_HIGH.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      RST_PD pin. If specified, it will be asserted during driver probe.
> +      As the line needs to be low for the reset to be active, it should be
> +      marked GPIO_ACTIVE_LOW.
> +    maxItems: 1
> +
> +  rotation:
> +    description:
> +      Definition of the sensor's placement.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum:
> +          - 0    # Sensor Mounted Upright
> +          - 180  # Sensor Mounted Upside Down
> +        default: 0
> +
> +  ovti,mipi-tx-speed:
> +    description:
> +      Indication of MIPI transmission speed select, which is to control D-PHY
> +      timing setting by adjusting MIPI clock voltage to improve the clock
> +      driver capability.

The description says that the value adjusts "MIPI clock voltage".
Should the property be renamed to "ovti,mipi-clock-voltage"?

> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum:
> +          - 0    #  20MHz -  30MHz
> +          - 1    #  30MHz -  50MHz
> +          - 2    #  50MHz -  75MHz
> +          - 3    #  75MHz - 100MHz
> +          - 4    # 100MHz - 130MHz
> +        default: 3
> +

I've discussed this on IRC with Sakari. It sounds like this works as
is for us because the driver currently only supports 1 mode, always
running the link at 390 MHz. This won't scale if one intends to add
more modes, because DT can't be expected to be updated when the driver
changes. The two are expected to be separate and backwards compatible.

I think we could model this in DT as an array of <link speed, clock
voltage> pairs. Similarly to the OPP bindings [1]. An example to have
all link speeds up to 390 MHz use the value 4:

ovti,mipi-clock-voltages = <
              /* KHz         clock voltage unit */
                 390000    4
>;

if one wants to select different voltage for different link, they
could do so as well. With the example below, the driver should
configure "3" for link frequencies <= 150 MHz and "4" for > 150 MHz <=
390 MHz. Link frequencies > 390 MHz should be disallowed.

ovti,mipi-clock-voltages = <
              /* KHz         clock voltage unit */
                 150000    3
                 390000    4
>;

What do you think?

[1] https://elixir.bootlin.com/linux/v5.9-rc3/source/Documentation/devicetree/bindings/opp/opp.txt

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
