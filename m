Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFB0C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJv+ImXEWwKxtxcDHhbUjYhxuovb1z++sYpE1nynPoU=; b=18NmkYNMsXucXKZjOVo5pAKbZm
	sd+OYjWdez3I/95kwiZXTh1ew6AYNTVPrkrh8TmcleHgyTqqdrshlkt5Pioyzfmmx8N2YSJYdc14I
	dwz5O/KwOns2oWO/wvRt3RpHIaqA53wMRNTlYkoT5XgJfY1E7FNLa8vlig8cYjDo/ZblKXN6uc39v
	yYkJVeh2kLja6W4dGS/W/uStPGJK/NPMpUdOUT0ByOFsMyv5MYoh2mH6NCigmD8kAjgHB0saHJ4Li
	i5Hdt4tq9EzzRKY3GVjTAt/8uRF0ypEjpEe9TsSExT4Vf03F9TvUTc5lmmW1j9WkZD7hKwbr7UnNk
	hepL17QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWavT-009G4i-Eu; Mon, 27 Feb 2023 10:40:11 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWavP-009G2U-MM; Mon, 27 Feb 2023 10:40:10 +0000
Received: by mail-ed1-x533.google.com with SMTP id ec43so23743021edb.8;
        Mon, 27 Feb 2023 02:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJv+ImXEWwKxtxcDHhbUjYhxuovb1z++sYpE1nynPoU=;
        b=iNnHcSXK8CR2HQiOlSHomQ/H0E0zNsJAgiEGSJg30AGVTMnFeeh2iCfoO1CfTXcLSp
         WdigZ0Tq8Xkm2oSgnEQ6wqoejhByNgRQfFyAyPvga3UQUyQwZErZAozhqLjK1AzE0C0N
         ajeM69Xh0/cQkQFIxfQSw8rzwWWL/xlPXemp5CC54d3hxoVZZZuAx44wx7QKsdMi2jZs
         HmgP60673rXSYowAfuKuYhecLLHUfYTBCNhpkJ9gsr/WQrUvUsxM+/DBWQ9gO7fsy/3Z
         uiF+qTqw9BSaTvHZN+8WzMgIphkVHEL5z5zOYXRyvZwIAcd7YD1O1VPite6LWv1OAx2G
         QmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJv+ImXEWwKxtxcDHhbUjYhxuovb1z++sYpE1nynPoU=;
        b=pH/HCN3AKSmmf1FycaKH1/7lF3gJIwurXKVNfdHcWOoHgWVmU9t2Nc1tY7dDRRGg3q
         ENcHhdcpI9sw8lGcZSsAZhjWw6YFGTgkM1txiIulvhnkbRPlp2q+XEF4jPONn667yND/
         TAOOdj/Lav5XEZSMX+tpfjXkleAWO7gDEPyXzGQ+8xUoEZ5rl82vJiousVhRvsrYmQSE
         tglUnexvcqx2XL0m3DDUT3/oO6Qhq6nRF3aZYLBS9pXhW13zo22Oi342PzicA8x6iSZa
         mKPSw+4ADgC0LWZP+ibRIR5kV60UqUiW/P/NtfT/JM8PxTnCB9crb7ct3vmutGuPBZq/
         9oSg==
X-Gm-Message-State: AO0yUKURgap+sJcbMuFcAFHUX8FsiLdRW+R9yLEBLYU54sTJ+rCWkKVG
	YE79Tl09tYF0QIBEdceCxSw=
X-Google-Smtp-Source: AK7set9+gkZY4Bof7ME6eWpMPhWuZ91zv7l5Xi7oUcFvbkoPTNgEi+7Ntc5u0V4JP7vjd3ysJc4rtA==
X-Received: by 2002:a17:907:5c6:b0:8af:3b78:315d with SMTP id wg6-20020a17090705c600b008af3b78315dmr43733486ejb.23.1677494396642;
        Mon, 27 Feb 2023 02:39:56 -0800 (PST)
Received: from [10.33.2.246] ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id r7-20020a170906350700b008b2e4f88ed7sm3054579eja.111.2023.02.27.02.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 02:39:56 -0800 (PST)
Date: Mon, 27 Feb 2023 13:39:46 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v3 4/4] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Golle <daniel@makrotopia.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Edward-JW Yang
	<edward-jw.yang@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>, Chun-Jie Chen
	<chun-jie.chen@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Yassine Oudjana
	<y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Message-Id: <AYIQQR.5R1644EUJNRV2@gmail.com>
In-Reply-To: <cd634833-b28e-d6d3-692d-5a391b85ad34@collabora.com>
References: <20230225094246.261697-1-y.oudjana@protonmail.com>
	<20230225094246.261697-5-y.oudjana@protonmail.com>
	<cd634833-b28e-d6d3-692d-5a391b85ad34@collabora.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_024007_777174_8D2AE805 
X-CRM114-Status: GOOD (  25.13  )
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


On Mon, Feb 27 2023 at 10:28:06 AM +01:00:00, AngeloGioacchino Del 
Regno <angelogioacchino.delregno@collabora.com> wrote:
> Il 25/02/23 10:42, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>> Add drivers for MT6735 apmixedsys, topckgen, infracfg and pericfg
>> clock and reset controllers. These provide the base clocks and resets
>> on the platform, and should be enough to bring up all essential 
>> blocks
>> including PWRAP, MSDC and peripherals (UART, I2C, SPI).
>> 
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   MAINTAINERS                                  |   4 +
>>   drivers/clk/mediatek/Kconfig                 |   9 +
>>   drivers/clk/mediatek/Makefile                |   1 +
>>   drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 139 ++++++
>>   drivers/clk/mediatek/clk-mt6735-infracfg.c   |  78 ++++
>>   drivers/clk/mediatek/clk-mt6735-pericfg.c    |  91 ++++
>>   drivers/clk/mediatek/clk-mt6735-topckgen.c   | 450 
>> +++++++++++++++++++
>>   7 files changed, 772 insertions(+)
>>   create mode 100644 drivers/clk/mediatek/clk-mt6735-apmixedsys.c
>>   create mode 100644 drivers/clk/mediatek/clk-mt6735-infracfg.c
>>   create mode 100644 drivers/clk/mediatek/clk-mt6735-pericfg.c
>>   create mode 100644 drivers/clk/mediatek/clk-mt6735-topckgen.c
>> 
> 
> ..snip..
> 
>> diff --git a/drivers/clk/mediatek/clk-mt6735-topckgen.c 
>> b/drivers/clk/mediatek/clk-mt6735-topckgen.c
>> new file mode 100644
>> index 000000000000..5fa743e4b0fc
>> --- /dev/null
>> +++ b/drivers/clk/mediatek/clk-mt6735-topckgen.c
>> @@ -0,0 +1,450 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "clk-mtk.h"
>> +#include "clk-mux.h"
>> +
>> +#include <dt-bindings/clock/mediatek,mt6735-topckgen.h>
>> +
> 
> ..snip..
> 
>> +
>> +int clk_mt6735_topckgen_probe(struct platform_device *pdev)
> 
> It gets *even easier* than that!
> 
> Check out this one:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20230222092543.19187-5-angelogioacchino.delregno@collabora.com/
> 
> ...being part of:
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=724004
> 
> So you can use simple_probe for MT6735's topckgen too!

Isn't this basically what I did in v2[1][2]? What changed now?

> 
> In this case, it would be...
> 
> static const struct mtk_clk_desc topck_desc = {
> 	.clks = topckgen_muxes,
> 	.num_clks = ARRAY_SIZE(topckgen_muxes),
> 	.fixed_clks = topckgen_fixed_clks,
> 	.num_fixed_clks = ARRAY_SIZE(topckgen_fixed_clks),
> 	.factor_clks = topckgen_factors,
> 	.num_factor_clks = ARRAY_SIZE(topckgen_factors),
> 	.clk_lock = &mt6735_topckgen_lock,
> };
> 
> static const struct of_device_id of_match_mt6735_topckgen[] = {
> 	{ .compatible = "mediatek,mt6735-topckgen", .data = &topck_desc },
> 	{ /* sentinel */ }
> };
> 
> MODULE_DEVICE_TABLE(of, of_match_mt6735_topckgen)
>     ^^^^^
> You're missing that on multiple clock drivers ;-)
> 
> ...And you're replacing .probe(), .remove() callbacks with
> 
> static struct platform_driver clk_mt6735_topckgen = {
> 	.probe = mtk_clk_simple_probe,
> 	.remove = mtk_clk_simple_remove,
> 
> 	......
> 
> Other than that, good job!
> 
> After performing these changes, please make sure to mention the 
> dependency on
> my last cleanup series on your cover letter for v4, so that 
> maintainers will
> be aware of what to do.
> 
> Your v4 smells like Reviewed-by tags all over. Keep up the great work!
> 
> Cheers,
> Angelo

[1] 
https://lore.kernel.org/linux-mediatek/20220519142211.458336-5-y.oudjana@protonmail.com/
[2] 
https://patchwork.kernel.org/project/linux-clk/patch/20220519134728.456643-7-y.oudjana@protonmail.com/




