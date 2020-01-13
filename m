Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEA3C33CA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 18:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E29207FF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 18:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DXrMYs62";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lzbZp2lH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E29207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWBvVNUgwyEcJ6qxSLdqn0DyUyRTu5dBL7ZvEDAvwLs=; b=DXrMYs62nBi94K
	cr4QIshdHh8y//KokzneL/HkuLqUOxy0QoJ/aNfiT5YueIo89qBiNqAcxQ/vXqgziOXVoGvivMs76
	4Gsqd6/FsmvZH5jhmtUYAVjhwZgbLAbq9gU9GrOq/O30nrmypFmzQ0bpt+mfSDDKajVqUF4jH5QD/
	t3u8ZI4CP8Y8Al+xGegAbhNJ70L+BwIIMwoDtn6HQxJUuefDDot+1kSy50micjDxVpbohSv2p39ye
	y4Ykq0DIw6jahM0Mr7WJbk7Lb8QQCQENHr6Uo1a2OxF6mlm3IAeBRWCqEafn0GXMOEblTLPvmy0pz
	bjaFfT1hba+kcJzwZABQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir4I8-000125-V6; Mon, 13 Jan 2020 18:18:20 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir4Hz-0000sm-BL
 for linux-mediatek@lists.infradead.org; Mon, 13 Jan 2020 18:18:13 +0000
Received: by mail-pf1-x443.google.com with SMTP id w62so5246649pfw.8
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2020 10:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=J17YeTOEpSo1FzyDOd+9aTAz8l6C4D4MHcZ+fgWk1Mo=;
 b=lzbZp2lH/gU4yPLMC6wYwDVhgGCuadvdlO8VX6DZQrbqAzclxITjWEIKq2Cl0jbIcH
 Pb8rfbp3ZyzD/ei8vViUF082DNsG9iO8XsvKWbhCH0UhNEiqZ0iHet659p8zuGShBJ8J
 oex8GmqQsyyu5bKGxGtL87Enz1KnBZJyEXUdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J17YeTOEpSo1FzyDOd+9aTAz8l6C4D4MHcZ+fgWk1Mo=;
 b=qZXuxTkPCD7w7+aFDCdI09lxKIWm4gSBBHdogOruFiUdc0NUu7KNKE/lmLa3StXAui
 A78m22XGFnhkFqxUBpcV88iDOiVpZ1yhi1H+631R4b8/W3dksBypbtPWuQkXdq/Q2IVf
 s0F6oFwUXCmbDuE0iA/5jGHhEzy7WePml0ZR30d+/3RThfc9eq8yMlt39LWU8ZiSg/es
 FYSLif5wdz4Q2MTLJXfRUyuKno8FevletGA7tYVtUhTQ78uInHGsxb4mRi9R72zgaLKG
 hhYtiUf64fcghqYp9sVRrBLM0qEc0m+/gR9qyR72ddm7RSjiFSwqumwlaHY9okCEMESc
 sy7Q==
X-Gm-Message-State: APjAAAX4nJ4Q0bw2LbyXwH8SiVxbv5tYX+Qo74eUSpUMFoBhN5MWB2BA
 CP0sfMBNdacR1Mm2SBjXesU1cg==
X-Google-Smtp-Source: APXvYqyO2vTrtNquO0tteVK8jK7Phzfpow0bBhbfaw7+obCd30pnX73il3H6mcF4Pibd+xR5fcY2gA==
X-Received: by 2002:a62:c541:: with SMTP id j62mr21026945pfg.237.1578939490112; 
 Mon, 13 Jan 2020 10:18:10 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id z22sm15206346pfr.83.2020.01.13.10.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 10:18:09 -0800 (PST)
Date: Mon, 13 Jan 2020 10:18:07 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add mt8173 elm and hana board
Message-ID: <20200113181807.GH89495@google.com>
References: <20200110073730.213789-1-hsinyi@chromium.org>
 <20200110073730.213789-3-hsinyi@chromium.org>
 <cce7b5a4-7e5e-99c7-c647-fbb2d58ff3e0@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cce7b5a4-7e5e-99c7-c647-fbb2d58ff3e0@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_101811_387565_2E6465D2 
X-CRM114-Status: GOOD (  30.65  )
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
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Jan 13, 2020 at 10:29:51AM +0100, Enric Balletbo i Serra wrote:
> Hi Hsin-Yi,
> 
> Apart from the maintainer comments, a few more comments ...
> 
> cc'ing Matthias and Doug who I know played a bit with the pwm-backlight for the
> uprev of the veyron devices, and you might be interested in his feedback in general.
> 
> On 10/1/20 8:37, Hsin-Yi Wang wrote:
> > Elm is Acer Chromebook R13. Hana is Lenovo Chromebook. Both uses mt8173
> > SoC.
> > 
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > Changes in v2:
> > - remove downstream nodes and unused nodes
> > - use GPIO_ACTIVE_LOW for ps8640 gpios
> > - move trackpad to hana
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile         |    3 +
> >  .../dts/mediatek/mt8173-elm-hana-rev7.dts     |   27 +
> >  .../boot/dts/mediatek/mt8173-elm-hana.dts     |   16 +
> >  .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   60 +
> >  arch/arm64/boot/dts/mediatek/mt8173-elm.dts   |   15 +
> >  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 1040 +++++++++++++++++
> >  6 files changed, 1161 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

<snip>

> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > new file mode 100644
> > index 000000000000..2ac738bebe04
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > @@ -0,0 +1,1040 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright 2016 MediaTek Inc.
> > + */
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include "mt8173.dtsi"
> > +
> > +/ {
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +	};
> 
> I think this should be in mt8173.dtsi?
> 
> > +
> > +	memory@40000000 {
> > +		device_type = "memory";
> > +		reg = <0 0x40000000 0 0x80000000>;
> > +	};
> > +
> > +	backlight_lcd: backlight_lcd {
> 
> nit: Not sure if you need to change or not, but this node is usually called
> backlight: backlight without the _lcd. Note that this imply a userspace change
> but /sys/class/backlight/backlight is more aligned with other boards (I guess)
> when you have only one backlight. See for example:
> 
>  git grep backlight arch/arm64/boot/*
> 
> > +		compatible = "pwm-backlight";
> > +		pwms = <&pwm0 0 1000000>;
> > +		brightness-levels = <
> > +			  0  16  32  48  64  80  96 112
> > +			128 144 160 176 192 208 224 240
> > +			255
> > +		>;
> > +		default-brightness-level = <9>;
> 
> The reason you see the display too dark is because userspace sets and remembers
> the default value you have using the above configuration which is only 16
> levels. So after removing the two above properties you should set a new
> brightness from userspace.
> 
> AFAIK 16 levels is not enough to have fancy backlight effects on Chrome OS
> userspace, at least is not enough for Rockchip devices so I suppose is the same
> for Mediatek.
> 
> You have to options here.
> 
> A) Remove brightness-levels and default-brightness-level. This will end with a
> non-linear brightness curve for the backlight up to 4095 levels.
> 
> # cat max_brightness
> 4095
> 
> B) Use the num-interpolated-steps and default-brightness-level properties. This
> will end with a linear curve brightness. Similar to what is done for veyron
> devices but in this case with more levels because the PWM to control the
> backlight is 16-bits instead of 8-bits for veyron devices.
> 
> *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/rk3288-veyron-edp.dtsi#n42
> 
> My guess is that you're interested on option B here to be coherent with other
> Chromebooks.

You could evaluate either way. One of the reasons to chose the interpolated-steps
for veyron was that some veyron panels require a minimum backlight level to
work properly. This can be easily configured with the linear curve, but
currently not with the non-linear one. Another reason was to keep the backlight
curve of a released device unaltered, though I think that's not strictly
required as long as the behavior with the non-linear curve is close/good enough.

Chrome OS user space supports both types of curves, for a new device I would
probably start with a non-linear curve, and only change that if the resulting
behavior doesn't meet expectations for some reason.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
