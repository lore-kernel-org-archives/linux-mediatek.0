Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FDBC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 10:57:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F7372084D
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 10:57:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3clOaPlq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jsrHEYsj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F7372084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=08mSUoLMN3lLlJGcoW3D3A5xok0ApjehC6vXRKDX4ys=; b=3clOaPlqVoXA1jZ9sgwpMIQNA
	v6OrCtEZ1uxZfu4mjG0ZS4MwSiTfpWqYDlf3zYHSbLoh5SDNJ+xqoxlKgRxIz0DbObAmIkh8CGSYu
	ZtdflrDZgzUSaOzAxJJGEXCZrtIZK1IJiIVWoypfST5fYE+1AuaxrFj8QVfRWYu3+LU7m9YWv5v8u
	ZSmSiy+DQawEXnxTjyyWp910jBuu2wnsTV0qBnnfHYZxpQ24weBmkzNd4LusXyCjYRfjt5Pz5MyZe
	E1yabw6Zc2zpe1C7i0ebyTcin4mZk+3a3/W+6EuExpsSVugwoxSkkAndkCCz/cYstEk5DCRuCpdvO
	v7bj43wLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo35i-0000LT-5p; Wed, 24 Jun 2020 10:57:18 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo35e-0000Jq-RJ
 for linux-mediatek@lists.infradead.org; Wed, 24 Jun 2020 10:57:16 +0000
Received: by mail-vs1-xe41.google.com with SMTP id r11so1127778vsj.5
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2020 03:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vn4droilz5xGM4KfZXgTLDdDZ7pkVwg0FkXdJSTh6us=;
 b=jsrHEYsjYaln2VseebXDq9KSHpUlVCIp31IbwlZNiLEWvQQUW3jOQYJyYJ7ilWsi8t
 N4yIdR3YaRGUPVNKe7i4mRT46gYHqXTnBpAYFx6g326/StBM1zMIZgqE/Il1qOv3STOn
 fxiahpFUpRclnlN6ofiAe89/gsyxluoR8eawmKIV9o+dvNVy1/F0Jl2dJ7hK2dxOREOc
 YXbt1vQ34xDe+W0KAHfmGph3WghyiCvx0EDecfobr2KxmbamtlyrwfbCgjpWvdza+gsD
 BGzm8TnsM3OhMG8PgIzFCF995Q9nxS7OXOXKBdJQhWQ7HGO4f0RZSlTPw1OZeUPe4Fex
 JV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vn4droilz5xGM4KfZXgTLDdDZ7pkVwg0FkXdJSTh6us=;
 b=PHwsFNNYRbV22KgG003GDPLgFKxoGDoIsmX3zbQ7QDh/yNhCO1ho4nG+qAVClJbetN
 TOc7l5/N2ge2zazo3/8+i/lrFGW2p5IdEfToAVElemIPMew7EfGrhHSd+DaeMyCCun9X
 zejJrtST00MG8/EifvmZ7rDGLPImQZNGe4OPVtqgOEAh1gnvzOSF8qZLmcg2hj0qVz3+
 T5efuSUqZkyUTXoyy6n1gUF7HdOtmL7fSd3RO7b4Dx2hcc4D/IYo0sdUAsWZ/CcgEubp
 +kwgnRk/Nw78aLzV1FikhkhdLtlJdhZGvfhVPlwjWaGQpjOY1vrhuZDksQYWkqQvvnfa
 NN9g==
X-Gm-Message-State: AOAM531SyJ59u6Z+XjwmzwbRJvf6BFL6jKzGpM8jXFPuoOv5ZXVzdUR1
 +R28aQpDJt7+tuK2RVfM07PeoxYc8aJvHqGuxxKRyA==
X-Google-Smtp-Source: ABdhPJwsxJpI/X+t50qo0pfoptqsNIIaJYL0e6gqFMktW+4P7dgIwXfmwMKeXKnC5Tvh/SK00ZCwC18Bi+FEfhZtYJ4=
X-Received: by 2002:a67:e10d:: with SMTP id d13mr23383320vsl.27.1592996231712; 
 Wed, 24 Jun 2020 03:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <cbd70c2f0f5ddae0d8e418fcb1e03101e408f6c2.1585753313.git.amit.kucheria@linaro.org>
 <20200414164357.GA11178@bogus>
In-Reply-To: <20200414164357.GA11178@bogus>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Wed, 24 Jun 2020 16:27:00 +0530
Message-ID: <CAHLCerM7hwKS=jNtMLnoCXr6z9ckOo1879e-MR-BnOC0JO=adA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: thermal: Get rid of thermal.txt and replace
 references
To: Rob Herring <robh@kernel.org>
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
Cc: Mans Rullgard <mans@mansr.com>, Heiko Stuebner <heiko@sntech.de>,
 Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, "maintainer:BROADCOM STB AVS TMON DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 linux-tegra@vger.kernel.org, Marc Gonzalez <marc.w.gonzalez@free.fr>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Talel Shenhar <talel@amazon.com>,
 lakml <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Scott Branden <sbranden@broadcom.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 14, 2020 at 10:14 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed,  1 Apr 2020 20:35:50 +0530, Amit Kucheria wrote:
> > Now that we have yaml bindings for the thermal subsystem, get rid of the
> > old bindings (thermal.txt).
> >
> > Replace all references to thermal.txt in the Documentation with a link
> > to the appropriate YAML bindings using the following search and replace
> > pattern:
> >  - If the reference is specific to the thermal-sensor-cells property,
> >  replace with a pointer to thermal-sensor.yaml
> >  - If the reference is to the cooling-cells property, replace with a
> >  pointer to thermal-cooling-devices.yaml
> >  - If the reference is generic thermal bindings, replace with a
> >  reference to thermal*.yaml.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  .../devicetree/bindings/arm/arm,scmi.txt      |   2 +-
> >  .../devicetree/bindings/arm/arm,scpi.txt      |   2 +-
> >  .../arm/marvell/ap80x-system-controller.txt   |   2 +-
> >  .../arm/marvell/cp110-system-controller.txt   |   2 +-
> >  .../bindings/cpufreq/cpufreq-dt.txt           |   3 +-
> >  .../bindings/cpufreq/cpufreq-mediatek.txt     |   4 +-
> >  .../devicetree/bindings/hwmon/gpio-fan.txt    |   3 +-
> >  .../devicetree/bindings/hwmon/lm90.txt        |   4 +-
> >  .../thermal/allwinner,sun8i-a83t-ths.yaml     |   2 +-
> >  .../bindings/thermal/amazon,al-thermal.txt    |   2 +-
> >  .../bindings/thermal/brcm,avs-ro-thermal.yaml |   2 +-
> >  .../bindings/thermal/brcm,bcm2835-thermal.txt |   2 +-
> >  .../bindings/thermal/hisilicon-thermal.txt    |   2 +-
> >  .../bindings/thermal/max77620_thermal.txt     |   6 +-
> >  .../bindings/thermal/mediatek-thermal.txt     |   2 +-
> >  .../thermal/nvidia,tegra124-soctherm.txt      |  10 +-
> >  .../thermal/nvidia,tegra186-bpmp-thermal.txt  |   2 +-
> >  .../bindings/thermal/qcom-spmi-temp-alarm.txt |   2 +-
> >  .../bindings/thermal/rockchip-thermal.txt     |   2 +-
> >  .../bindings/thermal/tango-thermal.txt        |   2 +-
> >  .../bindings/thermal/thermal-generic-adc.txt  |   2 +-
> >  .../devicetree/bindings/thermal/thermal.txt   | 586 ------------------
> >  .../bindings/thermal/uniphier-thermal.txt     |   2 +-
> >  23 files changed, 33 insertions(+), 615 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/thermal/thermal.txt
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Daniel, Rob,

This seems to have been missed in the 5.8 merge window. I suspect this
should go in through the thermal tree.

Regards,
Amit

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
