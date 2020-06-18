Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D539C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 19:14:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6EAA208C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 19:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i3Tk5KnD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NOqFUseg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6EAA208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmSuaH83xxCrz0ReQe7c1gAs28YdxSLT8864i60VNgA=; b=i3Tk5KnDpC12vj
	NMX37U2xCrAn0G2eee0ut0YFN1R2rzfncKKedrNKGF6qvLOO0P3J6/sQXms3N011boGnuXuVRsbR3
	13HHMCRnwDgdnmTWJU/1GCoW8aw7islfCUNR0BU9E5cfQGd2h7xFQdTveQSOWvaEcznUcvrWe+G0h
	apHLHxuAFxmlSbpQWGJIcfHRDs7AL6psL9Tl8F8KZdH4kfGihONMt/pMllPGWRQQEhu2AkSZwFvP1
	1BgFyXp8+loQYOsQV+M91lS8gi9c1E6GRUB64i2fN38fyFjFlcekTZZ3ErRtG+DyjYOGHmI6SzVGf
	r441PKnLohzN+xRQmTuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlzyy-0004K5-Cb; Thu, 18 Jun 2020 19:13:52 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlzyl-00049U-KX
 for linux-mediatek@lists.infradead.org; Thu, 18 Jun 2020 19:13:41 +0000
Received: by mail-wr1-x442.google.com with SMTP id a6so5300395wrm.4
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2020 12:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w7ZzXm/x+S62UOvstcWj82fQZcaPM3JUhZPhHBThmZ4=;
 b=NOqFUseguuK/Se1yoTOh2UdWZ9pNBrt038Sywj2oS41eFLmh/U6q43aGTEoQP5jOql
 sC+rNNPymdYDagtcgW8Y/+zDQGn6GPvI4pz7is5d9yhUOPzoyTqL6h6Jd2iwePLK07fO
 vORkEN6nVqoAZC94xtTGOWGd4shaO6h7XUJ/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w7ZzXm/x+S62UOvstcWj82fQZcaPM3JUhZPhHBThmZ4=;
 b=RYwETnRiz0vuxckSY9LPsHW75xS47+UsOiaTiB6JccXuSmgXIUchvJkv8XV+cCiJJV
 e25FI4uTGwp31LK7unyMaADRGmai7ODxAYIaJPd7sq8GES3D8GXRPBD71yUSrBszI4nr
 l1ubzIHrnTyDd/bB5fkp2AQ1k3vDgfY4H1t9GixYAzlCn+wEHSK045xar9Ug93S/W1Cu
 0L02hz+unloaNAgPY25Ul3Xn/zLvn4PzEcEGX8XAVaY5clsdZtrk/we5hKiAm8iGmWGZ
 3P/KDcDEiWlhepR9b/mTuoQ1skLGnv6XkR8ldHQ4ET3PHhsmsfLFSMAuxEkKytuY9kdb
 ENnw==
X-Gm-Message-State: AOAM533ocdTYuGdtwMT2QL4l9xAHJiK95+GQqX3Ce0enMON0Q+nLeeNE
 qvsJYerShN2/7PoF6YNgbYBIMA==
X-Google-Smtp-Source: ABdhPJxtePe8jNlcaDRZzkkWVLDnXp0YbUZHYQvnIoze3BeG8wHZ2ELCeZY2CEokFez7hj9uD7wdOA==
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr2615574wru.399.1592507613955; 
 Thu, 18 Jun 2020 12:13:33 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id s2sm4333182wmh.15.2020.06.18.12.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 12:13:33 -0700 (PDT)
Date: Thu, 18 Jun 2020 19:13:32 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V10 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200618191332.GB73379@chromium.org>
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615122937.18965-2-dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_121339_669723_716914DA 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, louis.kuo@mediatek.com, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dongchun,

On Mon, Jun 15, 2020 at 08:29:36PM +0800, Dongchun Zhu wrote:
> Add DT bindings documentation for Omnivision OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 171 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..f84be1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -0,0 +1,171 @@
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
> +
> +  clock-frequency:
> +    description:
> +      Frequency of the eclk clock in Hertz.
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
> +      PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
> +      or Shutdown mode. As the line is active low, it should be
> +      marked GPIO_ACTIVE_LOW.

This line is not active low. It needs to be high for the powerdown mode
to be active.

> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      RST_PD pin. If specified, it will be asserted during driver probe.
> +      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.

This line is not active high. It needs to be low for the reset to be
active.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
