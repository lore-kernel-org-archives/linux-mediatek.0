Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673CEC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 16:59:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E5620759
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 16:59:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IYtwDDGx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S35BdFWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32E5620759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oNPeiaicDq79pdF9Bw8CcrLzptuYA7j5622gXPdWKJg=; b=IYtwDDGxR2XKWfPTqMGofSdcN
	GAF4UxZ8cbXdKg2jVBBXSKAPhS96OPTUaorZLiPkuvNs7HJZvhn3K1jTeXbn6pJDI0KQmLQK/vcPs
	R24kC2wiuPV6FgYT7jDUzJf4KsLuueJZllY8vw2QKjRvD2HQpjHmJVefrutqcY4f49jqHwbHXmhYP
	A8bLYqpdGtbk+AyDwTP4LMTWvLy9CA8D0U0VphIe6WaTelh1TJGsH8Tez+T8nGU9GyVVbm66S2SqX
	8yLhVYvjcIF8TbL0EPWlVKfghPh2rP97HN+JdidL+/KbyYFC68ReQQ3yh5m1s11Ox4PzM9c+lVMa3
	UceTT8Xwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqJbp-0005SP-Mg; Tue, 30 Jun 2020 16:59:49 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqJbf-0005QJ-Gk
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 16:59:45 +0000
Received: by mail-wr1-x442.google.com with SMTP id s10so20876537wrw.12
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2020 09:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S5SIOLALGIZncts/DJyWGyyazBiYaPzK0cWTq20Jh4Y=;
 b=S35BdFWKkHxN1uhqpE7F6FyY6pN9PUZKZxXk+5SIcIr1h8vxrp4yNRRMHc+JwQc2Eu
 oWLIpkiX6tmQau9iPGep6rp9hf3nUOB53Ar3ePAkXzrfb76u9qqUaxFpaPysEy5dHNhj
 dqOH2suunGgPG21pkM5bXkp4GxzMYarwVuLQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S5SIOLALGIZncts/DJyWGyyazBiYaPzK0cWTq20Jh4Y=;
 b=n8jgDbo5rVQoc5qU2F5Cq+0dzCPLP8tFoQ0beaifa7MVEHoeG83A81Ay30VKWDW+dX
 8cGSnHRJYmqVkyCeFzbXZF46QUo76SjlAjAMoID4XuafDU6IbuJVdmb8p15ItWwErzs7
 AlbQZ0anFlRkmffPwj9cRHBQPyVnnVnFHlB480gmKJqYP+n4nyDm9mb3qwX5OSaNVCD0
 Lo2jK5kLOUuuz5CCEP0rwYTqArB+1CTH+7qin4o8m5bCnKDSpAoTDPQ2TDyR2cBG4d2V
 vrfnGHiR5cAvees/lJFm5+AvbJ9r6V8Eq9rLAS2UipoKzw3aLEAG5F5cfj7jYwEnX+lF
 A+Ww==
X-Gm-Message-State: AOAM5333MDuRngvHyaSbO6xl+4BiiB7PVhB6QB7o+FV4Govm/rpmERD2
 bs2TZy9xkYRguW/M1gtkVTb7og==
X-Google-Smtp-Source: ABdhPJwpJTVS7qPaQ6MQ1iEj2CZyIM1zNdxdfp4VfBreddvVoj+gOxcVmDCKJ/pcI3OpI8vIr5V84Q==
X-Received: by 2002:adf:9404:: with SMTP id 4mr21952876wrq.367.1593536378447; 
 Tue, 30 Jun 2020 09:59:38 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id x7sm4316857wrr.72.2020.06.30.09.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 09:59:37 -0700 (PDT)
Date: Tue, 30 Jun 2020 16:59:36 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V11 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200630165936.GC1212092@chromium.org>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630024942.20891-2-dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_125939_631444_98AAD1A6 
X-CRM114-Status: GOOD (  18.14  )
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

On Tue, Jun 30, 2020 at 10:49:41AM +0800, Dongchun Zhu wrote:
> Add DT bindings documentation for OmniVision OV02A10 image sensor.
> 
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

I like the way the description explains this. :)

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
