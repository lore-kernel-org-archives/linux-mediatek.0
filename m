Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49553C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 05:04:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 111F760F12
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 05:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 111F760F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YB99ntELop0YW+N9BGqlBximqwyTFngc9u9eYMwPRyg=; b=ueGRNNuR1pUAva
	5C9dPkM8iLzF/eCfFez1DYa0+/L2z/+8rNmm3MyS/Ewn7ipXH502w4Q0MyF/bAyFu9SfsNkhSlg3h
	qCH8raAgh53CQgdWsbzSElafYNC2cIiCHuMDZPyaW7lFeJX376z2MSIkDXwQaVNP95c1rcZrKAX73
	GQ61807WbxQdQf7AKDB7TmKncZo4oVZzUnaeBirhrTTw7VmIKlh0Kw0DfHWu42h4nLopIqi3LZUJI
	hMjqBFJw/P9uqOQCCoLnLjCbjn0COa6KNuO3fPo6MZ9aBt1if2iNIhP9Iyhw4p4jlCCCG/K3yiTuZ
	YPoVGcvT/L4S5KHP8qdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Kh9-007ErQ-CI; Fri, 30 Jul 2021 05:04:27 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Kh6-007El0-8m; Fri, 30 Jul 2021 05:04:25 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 v8-20020a0568301bc8b02904d5b4e5ca3aso8219824ota.13; 
 Thu, 29 Jul 2021 22:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QTrn0BTsXb5eMFLfisWRaOsNj5krMHUX7c9uHRc9jpw=;
 b=aAxaP/IViquA7ehrAhDav0tANk4uxVifNZ+P8UqFltP6SsIESy5EISKdgqc3k6dv4g
 /pVU3Gn6+z7exw5GBFxglMt7KlC6d6f643qXBC2CYA8/+YyBHMPveSEGDg+9y0qZaDsy
 rkYs0+PxPVW9/6ahlvYFUouz9CvFe6zJI+BuYoEF0nNEj46STvsHCpSCdkA4Wg+kdgvd
 gJLHYMXgULbVTB0LJQupw+jxQkhP+ZebH1iBda0sCkIb3oL4MO1Ef8Ogbt9m+jA3RQo1
 weMbiYxIzqrNE9SYbARDh+lKHTyz7vRt7J+kxrqm05VPKA53cVKiUWTFAn8VKjBMqCJA
 o/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=QTrn0BTsXb5eMFLfisWRaOsNj5krMHUX7c9uHRc9jpw=;
 b=nJpdJJzyRPZZfYQud6Cb4RUHs0EYF4ZywkG87ubzr7Fjj78tY5Qa62XwDXjEYCXTgH
 Iq8brXVs0AF0DOj6fMLVoyqMrXDDxTEW7EXU7qPGeNXjywoqApd5yROvyjO3thEghNCb
 1Io4nzyvCOgDXCJm0P0FAEnDdeMbkU2EZ6mQ7PiqIugMm9thwCl3bQ7KqSRv9PMqnpO+
 MxH9hqBn2v7b7CZvZDdnH1kduAjbqMyaDHI38VTbu5EYA6Pvwsjhe9bO+FXRVXi15JgA
 nqlf7xGyEr8aZrhhrwiomkDLite8c/5IfJCPExH0KS+wVAnWntOp/xD6aO01arjzm2Ry
 H8Jw==
X-Gm-Message-State: AOAM530Uf9SSTBgmzgqpXnT9NE7Us3Eo53lvyljXfYhiVsBbdR9EKaDG
 WBIgAnSQVU3s+4OJ6n4HQHU=
X-Google-Smtp-Source: ABdhPJxtkR1AJp0+RjTnXagyAGwmGRYMZKxnIR6Nd/brnDD+iRSYcNYylRu/2ugWeLTWy9Nnh1lrtQ==
X-Received: by 2002:a05:6830:4b0:: with SMTP id
 l16mr686993otd.97.1627621462965; 
 Thu, 29 Jul 2021 22:04:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w190sm126274oif.17.2021.07.29.22.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 22:04:22 -0700 (PDT)
Date: Thu, 29 Jul 2021 22:04:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel@vger.kernel.org, chunkuang.hu@kernel.org,
 hsinyi@chromium.org, kernel@collabora.com, drinkcat@chromium.org,
 eizan@chromium.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com,
 Crystal Guo <crystal.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 1/7] arm64: dts: mediatek: Move reset controller
 constants into common location
Message-ID: <20210730050421.GA2111504@roeck-us.net>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_220424_376195_43DB12F6 
X-CRM114-Status: GOOD (  16.57  )
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

On Wed, Jul 14, 2021 at 12:11:35PM +0200, Enric Balletbo i Serra wrote:
> The DT binding includes for reset controllers are located in
> include/dt-bindings/reset/. Move the Mediatek reset constants in there.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

For the watchdog part:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes in v2:
> - Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi                    | 2 +-
>  drivers/watchdog/mtk_wdt.c                                  | 6 +++---
>  .../dt-bindings/{reset-controller => reset}/mt2712-resets.h | 0
>  .../dt-bindings/{reset-controller => reset}/mt8183-resets.h | 0
>  .../dt-bindings/{reset-controller => reset}/mt8192-resets.h | 0
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
>  rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (100%)
>  rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 96473d88f391..4ef0b5b23047 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -11,7 +11,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/memory/mt8183-larb-port.h>
>  #include <dt-bindings/power/mt8183-power.h>
> -#include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <dt-bindings/reset/mt8183-resets.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/thermal/thermal.h>
>  #include "mt8183-pinfunc.h"
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 16b6aff324a7..6986bc740465 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,9 +9,9 @@
>   * Based on sunxi_wdt.c
>   */
>  
> -#include <dt-bindings/reset-controller/mt2712-resets.h>
> -#include <dt-bindings/reset-controller/mt8183-resets.h>
> -#include <dt-bindings/reset-controller/mt8192-resets.h>
> +#include <dt-bindings/reset/mt2712-resets.h>
> +#include <dt-bindings/reset/mt8183-resets.h>
> +#include <dt-bindings/reset/mt8192-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset/mt2712-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt2712-resets.h
> rename to include/dt-bindings/reset/mt2712-resets.h
> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset/mt8183-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt8183-resets.h
> rename to include/dt-bindings/reset/mt8183-resets.h
> diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt8192-resets.h
> rename to include/dt-bindings/reset/mt8192-resets.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
