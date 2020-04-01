Return-Path: <SRS0=ysX+=5R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35594C43331
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 14:42:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06F5920719
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 14:42:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MiiCqymK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkdPeoGV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06F5920719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHGSBbXDh1YJvAiSQAE+yk9eFFhQ2qLYosUOZLwY/QE=; b=MiiCqymKa2U+JP
	1w2rNG3aPsBXM5paPi9rBfZ7Ize3Ov2O83msUzH27aZ8KXodpSv+TALiGXNbu8I9mUd9CeG8FaczI
	Xt/9MVKi73A2OitiNRR85OjlJfa5ueUXtGJYISk4SQHHnVaQABubq6JpV/tZwkyYd1ANkekezosG/
	VN5a0oTT9pGC0ewaf/dhl8M5IoqujMxQ/p0mCZUvJGHfwk3UlvwYcLAh8MMOHmBBvF4WkoJJZz8zf
	9kW/fdRXztoJiI/pHpZFGwUv0JhI2oMdH8AGGAD0oAc8vnX5+zhw3hux5x6PVFcwGiLplDdRXrY5A
	Ux+KCteFxfwV+1M+Zgzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJeZ4-0002fb-Jx; Wed, 01 Apr 2020 14:41:58 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJeZ1-0002cG-99
 for linux-mediatek@lists.infradead.org; Wed, 01 Apr 2020 14:41:57 +0000
Received: by mail-wr1-x443.google.com with SMTP id a25so389818wrd.0
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Apr 2020 07:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NHroaJiOqiJYowehyR6Z1qR9S4USQGmopS50sQu9ptU=;
 b=nkdPeoGVbvZvfMVhRGmEQQR20HgcDjAdFocg0zTi/j44D0P9Hn3Cu+2NQ4pLIBZn1b
 SFwb0bmBpxQ1TvqKBrJq4AkgyaQW/mJ81/mrVtcFT7SXyF00llA93G6RALFC0KbhsmSA
 WPLBtN6lkZUBPoy9maGkO3TARpOynaXGY5ABIBRuyykKIRM0u9dy0bPnr5TXkg2uud+E
 w35+XtXUrrhJB+PDZ/LWl80RaPms0YI4vyZ29QNsd3MwAeLxNyS+tJjP5C1rnFgJQaSL
 38uWmEiaP53YA7RqlVM/k2D3HE3Oo/fk35WwHiIKiTXUxDrEgmT25S3T3Vi/GWIl/ckO
 4pLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NHroaJiOqiJYowehyR6Z1qR9S4USQGmopS50sQu9ptU=;
 b=fucFEMmDkgT+JM/nYLLuB5HkHon2/aNSFC4fqcPu41p1mBH4IhjIi1+1rq1/Z3ioYf
 gMEMtJpiX8BG5l5ccJXXUFR7ITHmMh4cThDCOvWYD0qf/HFvKgCj4TAxkGaqQOeuwown
 bcG1FSsPDxnBzxV+Zmwkt2JD2+8nPSBBFdcMbM8J7M90gno3oy+s1+1oe2HgLiw4fY8f
 xgWyS4WmfSHy6/b894+j7Lr/Cp+GkV5jwHDyvJVRpjYDB8WK+DyRw2/R9ctlj10CxNQ7
 Jdrz1tklflfwLYRKLGTUxDsZwMlCW//OJGAvYjIb254dyoA+GwRtEfU5PIDRYGy42xfU
 ZvTA==
X-Gm-Message-State: AGi0PuYvXAiQ747egsvMSGHOJTRhJSctZZmjrCtKwCrqgnaap5UuoSf+
 y1UJ7JoLpDUZu/+l4bgZIDraFw==
X-Google-Smtp-Source: APiQypKgZHZPPgcg5xXVhkDNwuR9wP3vjoOtMK2hqbWR4yBWx7R9fOzVWwITRcfKrILSqZxC6Q8mlQ==
X-Received: by 2002:a5d:6645:: with SMTP id f5mr212604wrw.280.1585752112928;
 Wed, 01 Apr 2020 07:41:52 -0700 (PDT)
Received: from [192.168.0.136] ([87.120.218.65])
 by smtp.googlemail.com with ESMTPSA id y189sm2894253wmb.26.2020.04.01.07.41.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Apr 2020 07:41:51 -0700 (PDT)
Subject: Re: [PATCH V4 06/13] soc: mediatek: add MT8183 dvfsrc support
To: Henry Chen <henryc.chen@mediatek.com>
References: <1584092066-24425-1-git-send-email-henryc.chen@mediatek.com>
 <1584092066-24425-7-git-send-email-henryc.chen@mediatek.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <4220e681-80b6-f9af-ddd1-b28aabe513cf@linaro.org>
Date: Wed, 1 Apr 2020 17:41:49 +0300
MIME-Version: 1.0
In-Reply-To: <1584092066-24425-7-git-send-email-henryc.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_074155_843865_E266C136 
X-CRM114-Status: GOOD (  20.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Mike Turquette <mturquette@linaro.org>, srv_heupstream@mediatek.com,
 James Liao <jamesjj.liao@mediatek.com>, Viresh Kumar <vireshk@kernel.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Ryan Case <ryandcase@chromium.org>,
 Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Henry,

On 3/13/20 11:34, Henry Chen wrote:
> Add dvfsrc driver for MT8183
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig      |  15 ++
>  drivers/soc/mediatek/Makefile     |   1 +
>  drivers/soc/mediatek/mtk-dvfsrc.c | 434 ++++++++++++++++++++++++++++++++++++++
>  include/soc/mediatek/mtk_dvfsrc.h |  30 +++
>  4 files changed, 480 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
>  create mode 100644 include/soc/mediatek/mtk_dvfsrc.h
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index f837b3c..44808f4 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -16,6 +16,21 @@ config MTK_CMDQ
>  	  time limitation, such as updating display configuration during the
>  	  vblank.
>  
> +config MTK_DVFSRC
> +	bool "MediaTek DVFSRC Support"
> +	depends on ARCH_MEDIATEK
> +	default ARCH_MEDIATEK
> +	select MTK_INFRACFG
> +	select PM_GENERIC_DOMAINS if PM
> +	depends on MTK_SCPSYS
> +	help
> +	  Say yes here to add support for the MediaTek DVFSRC (dynamic voltage
> +	  and frequency scaling resource collector) found
> +	  on different MediaTek SoCs. The DVFSRC is a proprietary
> +	  hardware which is used to collect all the requests from
> +	  system and turn into the decision of minimum Vcore voltage
> +	  and minimum DRAM frequency to fulfill those requests.
> +
>  config MTK_PMIC_WRAP
>  	tristate "MediaTek PMIC Wrapper Support"
>  	depends on RESET_CONTROLLER
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 2b2c2537..84182f0 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> +obj-$(CONFIG_MTK_DVFSRC) += mtk-dvfsrc.o
>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
> new file mode 100644
> index 0000000..85b3572
> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-dvfsrc.c
> @@ -0,0 +1,434 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2018 MediaTek Inc.
> + */
> +#include <linux/arm-smccc.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <soc/mediatek/mtk_dvfsrc.h>
> +#include <soc/mediatek/mtk_sip.h>
> +#include <dt-bindings/power/mt8183-power.h>

Looks like this depends on a header which is not part of this patch-set.
It would be nice to list any dependencies in the cover letter.

Thanks,
Georgi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
