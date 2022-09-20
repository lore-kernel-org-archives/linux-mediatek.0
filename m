Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C776EC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 13:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1DbyJn3NUscYLhtpPQ3RU31E+x0F3RQcYcyQ/D7jVY=; b=JTWp3erl7E1nM6uBpDA7boDmC0
	fVBBimATUCIJ6XcW928pe/1i+Mp2zPOGce2N+dDVDwCrbBX5LHOButZwUZSrUzhvKbZAqKGjDGAyL
	jNY9r4gfAIPVejbzriBp8GYkbdjs2iVTPuFWmIk2wUVlgKjAYYUgfZ2kKApLgk/PljZO7/2mWhPOs
	SEOkP7OHPh6WgvbKbooTGjhl1vDDI6KJ7hQWUHBFb23qsgedzFcLdQGbL9BAwOAyWXKZSZWH/ZfJr
	FMJyETmS37Ui1oMRSK5BPxEHZGOTKIUhiQyz3VXsDQQv7f7USbdxzc29nSk2LcS0ut8Fx0EZFC6vc
	PTu1vEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadF2-0043c1-GV; Tue, 20 Sep 2022 13:24:48 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadEp-0043Vw-18; Tue, 20 Sep 2022 13:24:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id o5so1938302wms.1;
        Tue, 20 Sep 2022 06:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/1DbyJn3NUscYLhtpPQ3RU31E+x0F3RQcYcyQ/D7jVY=;
        b=lymRQT1Fh/haltHq+c4DfrZ2Vjez0vb0cbfqnKp15iD+TC7/Gu5mm0V/j7XRU67PZl
         8aY04+8budmFC08xsGmHaadBhIa05u01BlpBcpuEn8gvLFeNRazGsk3stYwoVQ8lh31E
         5Knf9gBOHPZ887ZhdwW8TJl37WvEbSQetft301NJm1+zWJsmDGBqrt+Hyflf+8XG0IhB
         zcee/Vi+0zqrVDBRXlxa5Tmx6fQVLHqwz3YyXfpsqBaAMkQMjKpGWSKv+99LQ8MhQaIi
         IGWUJbofoFf/O3oLF8enIrd6bAYsCb4x089Z0dea4DH9LCGl2jaUgtZUPxMJMjqi+nf3
         0kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/1DbyJn3NUscYLhtpPQ3RU31E+x0F3RQcYcyQ/D7jVY=;
        b=geKJA3FkLQy5pRUCJdNbmW1ZeOrlwH3/3cbKl7BRNdq5NOGkjiWVHvHWlUbcowWbD0
         f1V07NU9xe2O5Lkks3cdrE/NO/OxVMuCBZWBmoFSI64H09SgtYYqPMz3R5aRIZzm+8LX
         JWIa5H4xfM4B434qXWv5i7H5fdfQoPfc/Rg6n7IBGaD3f3t+pU/VAQrTRL0Db6BkmhDQ
         R+CW2y1ZXlAupg0gdpIwyz43zPsSF4+7jVw0RyQsvi0zVgvHDRcQ3oodOepAfxpI7C3r
         F+nVjGbG9g0iz3wViM9Nr/y29+et/6knC38qmFi6qGUvokScgcRXS+a3yUgDk3NHs47Z
         M8Vg==
X-Gm-Message-State: ACrzQf0l3frGHTVigrxKvP8M4jwc8c1dXKY7UJ8SO5vfCqCrgsF84uqK
	gfoQp4p3wsrHv6vTqYWj/Zo=
X-Google-Smtp-Source: AMsMyM6L1U3dW3UkRoSC4hPVSn/TVSLABF/XFnp9f4QUECMmv6RsWqmnEcetm2stnZCk7Fytb5X+0A==
X-Received: by 2002:a05:600c:3844:b0:3b4:becc:e43 with SMTP id s4-20020a05600c384400b003b4becc0e43mr2466114wmr.33.1663680272675;
        Tue, 20 Sep 2022 06:24:32 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id n33-20020a05600c3ba100b003b3401f1e24sm2891530wms.28.2022.09.20.06.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 06:24:31 -0700 (PDT)
Message-ID: <e3dccc71-42fd-6734-8d57-9a14ef708514@gmail.com>
Date: Tue, 20 Sep 2022 15:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 3/3] watchdog: mediatek: mt8188: add wdt support
Content-Language: en-US
To: Runyang Chen <Runyang.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, nfraprado@collabora.com
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220920105622.25666-1-Runyang.Chen@mediatek.com>
 <20220920105622.25666-4-Runyang.Chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220920105622.25666-4-Runyang.Chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_062435_107778_4D3A73AA 
X-CRM114-Status: GOOD (  16.35  )
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



On 20/09/2022 12:56, Runyang Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Support MT8188 watchdog device.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index e97787536792..b53763ad90cf 100644
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
> @@ -429,6 +434,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>   	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
> +	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
>   	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>   	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
>   	{ /* sentinel */ }

