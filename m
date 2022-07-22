Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40154C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVg6xk0ns/bX90Xit3i5w/DtXugnCkyCcpIxJMAM3pA=; b=KB6ZbuqRrqUW+o6i2+/J06Qxvx
	i7ufb/7bTy9Yc71VI7QsNOwxDR27lgWC8hsml3Rzl4vMV6pJMVEQbGLaBHzPoIUf5KBjxwr+Nk4H8
	RfkTyCVPU67R7n/vfN3tgpAaw09qoTSe3mcM2s6Oj9/1SogwULRqHiqczNaPS2i4KEZGeJGxQyNrK
	TdOt5k7Lq/RfcgmkN1Gx9M2SY2SGYo0U9ZTI9V0bSIbbBUUUvQfaR2vuaS7GQZmlW9H8gGTWSDWRi
	PJuNZsi287y8AWHwDCPotDQFWjsMhH7aKHvMed1Hkp+Ph/xc2gp9ogEK1ukFklbrkVuO7YABfo1CR
	QkPePxeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEuIK-0072QM-Cn; Fri, 22 Jul 2022 15:10:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEuI8-0072HE-AN; Fri, 22 Jul 2022 15:10:13 +0000
Received: by mail-pf1-x433.google.com with SMTP id 70so4718323pfx.1;
        Fri, 22 Jul 2022 08:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YVg6xk0ns/bX90Xit3i5w/DtXugnCkyCcpIxJMAM3pA=;
        b=LL5FZE977jrCB5ZAgNVPkQDR4/zpHzx8vl/KlVv89Pe1NocPWaX76UmoR1r5p6Ca6P
         op3OoDkvbpyqjPWqKa6LPArhGHmdOGKtxpJbobn57bzFg8wmkOKWvPaP8WfO3UAJjsCS
         1P2L4SlX26Czd/zDZwj81/x3FvJ9fsu3eL0V5pZK3HjIkl6QAEpLht26PZmuWs3BehYL
         aYQH8vR48dD7Lglb3mPRibz9j1sMU3zzo4NybsTQrlZe1r7Yd3bD5NuGFZzx4y+GrDVP
         xZe7jhahb4KAHNC/W4pziGwc4ii18RZHNW6la63aRzQLCrE0GZ+GeckuGcSlR+utztZ2
         4zYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YVg6xk0ns/bX90Xit3i5w/DtXugnCkyCcpIxJMAM3pA=;
        b=2QXCg6+Q8nVZHFtwPol70zd9eFBx/UAyDmBCns8ydxRwqIySu001gASZq1+1wmy8up
         2j/Xn6AjKq/w5BBlkuPBgz4JL7dvXwL8XDoZt5+bynCIsUCOQu3uigJgtZmjWVdAMQ9q
         O+eQtwqyhT1FG3YN6nlm1EfDM3L9IyOaMKOfNH1e+AOYsXVaC9HlSPeBzQYBE5kFZtT5
         U2/eYx3pQ0snqWkJLliLXlYj2VyKoRe79RMNwqTudsnDHCnFHWgs+Y04SGufGGHq+4ns
         OaHOB8T2jFA0ynumIE19zjWISrxNFCIlMP9nzGvimKy1wHDEhNc8vPxqbWvkG+5y04Vx
         8yxw==
X-Gm-Message-State: AJIora/lq6NtGkQ0p6AQ1kcDFhgXJPWslUuzalUSsk7VTlavOrZd5W1M
	KavOrndo6MKQajgfHj/JLXg=
X-Google-Smtp-Source: AGRyM1sXMPWj4vJ6IC9x5Q7CbBRfVblVD/pWaxIOirjZAfLC4CR2biym7nnpldjD3PGRhQgq5y17/A==
X-Received: by 2002:a05:6a00:815:b0:52b:295a:fad with SMTP id m21-20020a056a00081500b0052b295a0fadmr458346pfk.62.1658502610253;
        Fri, 22 Jul 2022 08:10:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w184-20020a6230c1000000b0052b84ca900csm4024677pfw.62.2022.07.22.08.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 08:10:09 -0700 (PDT)
Message-ID: <cdc16106-0687-ae2b-0a42-c1f04cc8032a@roeck-us.net>
Date: Fri, 22 Jul 2022 08:10:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] [3/3] watchdog: mediatek: mt8188: add wdt support
Content-Language: en-US
To: Runyang Chen <Runyang.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220722072316.582-1-Runyang.Chen@mediatek.com>
 <20220722072316.582-4-Runyang.Chen@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220722072316.582-4-Runyang.Chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_081012_406492_F9190C21 
X-CRM114-Status: GOOD (  15.27  )
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

On 7/22/22 00:23, Runyang Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Support MT8188 watchdog device.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index f0d4e3cc7459..ce7dc96bfa4b 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -13,6 +13,7 @@
>   #include <dt-bindings/reset/mt7986-resets.h>
>   #include <dt-bindings/reset/mt8183-resets.h>
>   #include <dt-bindings/reset/mt8186-resets.h>
> +#include <dt-bindings/reset/mt8188-resets.h>
>   #include <dt-bindings/reset/mt8192-resets.h>
>   #include <dt-bindings/reset/mt8195-resets.h>
>   #include <linux/delay.h>
> @@ -90,6 +91,10 @@ static const struct mtk_wdt_data mt8186_data = {
>   	.toprgu_sw_rst_num = MT8186_TOPRGU_SW_RST_NUM,
>   };
>   
> +static const struct mtk_wdt_data mt8188_data = {
> +	.toprgu_sw_rst_num = MT8188_TOPRGU_SW_RST_NUM,
> +};
> +
>   static const struct mtk_wdt_data mt8192_data = {
>   	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
>   };
> @@ -431,6 +436,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>   	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
> +	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
>   	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>   	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
>   	{ /* sentinel */ }


