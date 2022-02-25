Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D34C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKaHfbVuNSe5zGQG38j99Rb+Zb2vQlaLtoTS3wHrTww=; b=fTkjuvQkOJyBaj
	ryIFNl522tzrg9TCL5oaaUVmYDGfrzROp0pt7QTCP0cjZ7s53dsOj2Z97Akh0RykxgesV5SDarorK
	bXiGUDt62Y7dk852EQcKkoR2Xrx68xCEiiwDVqn+QcBifchr5gwiDDteuManxwtB18cSiICKadJly
	seW6RT9McqTXn+NdzwJFHEtq+kkqLOsUTkYjWfgh4EEhXKi5rBsYgVx1SAdjh+0akQcQkM71EOE3N
	zrBZswrv3EqGVU+vF1MVnTk93463M34jBnn7F33wXj5AkKJUT8IBeQPOu+sjozU9RM1xvhzByfVzX
	c/BX3tX0Zd2mXhL/qUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNda9-005xLu-M5; Fri, 25 Feb 2022 16:36:37 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdZo-005xEx-4E; Fri, 25 Feb 2022 16:36:17 +0000
Received: by mail-oi1-x22f.google.com with SMTP id z7so8000678oid.4;
 Fri, 25 Feb 2022 08:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=niaOyKFRTLM4nq6p91pTJy+BgOVTpwhZEheiPnsTKW0=;
 b=njphU4SgCOeE1f6MWWYJwpInbIET4zmkTohQOWwD4Q9qCNfs4RqdFN5jbmZzafN8Pc
 VNlUi8NwVsvtHA/EBjWVVHawtRv2OZSHx9mO690DMac36GHIwN3fRPu/uTvdQ4zBv4wr
 /1gY0YjmPEDvlZpkurRE0d3cmltJEW2yGJxp9QO853qYRiUL0gO1IdG/8Y6/ev/QIGk7
 +qMHuZNl0I6VClkELq1oGpNlicuIrTcMsvrVlBc1tK06KRlqxhDQkrotroFmZTyyOq12
 zLP8FqeY09VQg58xpGa5DSoaxibdmLLLksHZviHqSNogHNPvvZ1KgGQJZJHTaELY4Dub
 +GSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=niaOyKFRTLM4nq6p91pTJy+BgOVTpwhZEheiPnsTKW0=;
 b=obboVzV3cg0L7M3cZoJkk0EjTgfyJftiQfoQEJ7oXyb4UmpuVufbpHmwKO/0mLhkMn
 w1+Lxcj5gRP/a7QNXxYhMl6ZtOvfDSJLj+/XR8oV0kcRZIuLUEPEbCg109fwbcajtJKx
 Z/CZx5Djk5sEDsBEL1YOrhlHv0W4bfrhs17eHXr0pgCNWQvcCz9WnqT1xqn7p4pWJJAQ
 345qJIj6sWkRIpVaqSI+AJskO2pYQhzWuLs/9dN2JKTo//gb7FnEfsNpDI0+vhvJP5o1
 aGWabiHvmKQDlYYaN46e1nYpMixhNcf+KJpvdhECbojsXhiNcOTUq4ar1Mamdxknaa2q
 xCGA==
X-Gm-Message-State: AOAM532wjIflzeyKp56fYmVfQfMnOY2vAPO7yjbzkZDtzeAihDVJGESQ
 SLwntbmr61mzITuTtIg2Cno=
X-Google-Smtp-Source: ABdhPJwGU24ldVXUVF0yTKU6iyVpDQgNrpuF3eu0sc35FMtjpWmbCQaUXCpa0iDMVke9oEjrTSJaDA==
X-Received: by 2002:a05:6808:d46:b0:2d7:27c0:17d3 with SMTP id
 w6-20020a0568080d4600b002d727c017d3mr81864oik.84.1645806974885; 
 Fri, 25 Feb 2022 08:36:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056830150d00b005af8c9f399esm1275129otp.50.2022.02.25.08.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:36:14 -0800 (PST)
Message-ID: <3501d9dd-b3d4-525b-995c-520b637f712f@roeck-us.net>
Date: Fri, 25 Feb 2022 08:36:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [4/4] watchdog: mediatek: mt8186: add wdt support
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, wim@linux-watchdog.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org, p.zabel@pengutronix.de
Cc: runyang.chen@mediatek.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220216014505.28428-1-rex-bc.chen@mediatek.com>
 <20220216014505.28428-5-rex-bc.chen@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220216014505.28428-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_083616_223038_C41B802A 
X-CRM114-Status: GOOD (  14.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/15/22 17:45, Rex-BC Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Support MT8186 watchdog device.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 4577a76dd464..fe5a2ecba97a 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -11,6 +11,7 @@
>   
>   #include <dt-bindings/reset/mt2712-resets.h>
>   #include <dt-bindings/reset/mt8183-resets.h>
> +#include <dt-bindings/reset/mt8186-resets.h>
>   #include <dt-bindings/reset/mt8192-resets.h>
>   #include <dt-bindings/reset/mt8195-resets.h>
>   #include <linux/delay.h>
> @@ -80,6 +81,10 @@ static const struct mtk_wdt_data mt8183_data = {
>   	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>   };
>   
> +static const struct mtk_wdt_data mt8186_data = {
> +	.toprgu_sw_rst_num = MT8186_TOPRGU_SW_RST_NUM,
> +};
> +
>   static const struct mtk_wdt_data mt8192_data = {
>   	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
>   };
> @@ -419,6 +424,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>   	{ .compatible = "mediatek,mt6589-wdt" },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> +	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
>   	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>   	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
>   	{ /* sentinel */ }


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
