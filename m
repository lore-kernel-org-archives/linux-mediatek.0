Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDCAC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 18:27:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A2D92313E
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 18:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A2D92313E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=71LyL0w1ylM9xmwBDFCG772Moi2B68obs9lddL1KDWU=; b=wzXxkXcTh76Pq2DLvCXjF4/6R
	6ZgqE2qehS0zQNt4GzuX4HN6Z3gGxWWbqQK8D/rpHwz/waNSYnGjfc1U4MurGGtdHIN6BmDUdx2JS
	++TQbxmw0UYe9RfIcDgsacIH8BY9uCQRdbEOtbeIIs21+ezDqWitkQu2+3Cfspdby2uUrgPIWbLOT
	gZ4jhGaDGzzFU/yoO3JRAlSOJhcpRUPtfaXLQp2pXJGHQa0DLawN1JbVgD/ZFs5TpPUtW8KRTZEDb
	93IEehF78fOBPWnN5UhZuGwWt7Lq2aS3XUMCySkEtPOvKmooMcXPoZGh8z4mWU5YNePKj+GhkjSVR
	F03UEpedA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3Nd4-0003fD-Sp; Sat, 23 Jan 2021 18:27:23 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3Nd2-0003ep-3g; Sat, 23 Jan 2021 18:27:20 +0000
Received: by mail-ot1-x336.google.com with SMTP id f6so8555439ots.9;
 Sat, 23 Jan 2021 10:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fQTzxKDsTEcVh36ya/OWH5txYSAa3c+N4WKrX6+8EIA=;
 b=jCGDtniqnI556Jxy0FI9V3qO61DPYUl9b89tFBQlb6bj1x+YHEaNCWnE6jz0XX5DVz
 aDPU3Mgt1/7N05Zau8jk+rWbvq8Ef7G5m38j3tsmE+s9gtHRR6tNdas8CL7K6E7simhU
 5V3Q485rHLB1jen7ICUxDPEtHrXSYJFuTkRctGOfRFHvzw6TvglSfHl87diRwFqYT79V
 g7sEVUCtPX7ZYj2uuB1OaUt+PQjX/JjBp4HnochoWNQrnMhL8tgzEtt/KTt4ckCr6THk
 yDp2Vbd8OPEzKt5tS+RYZqdQR3zeLP04qHxXTDCqnuPq2KN5aKFdKq7k6r+n94n3TIsU
 rkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=fQTzxKDsTEcVh36ya/OWH5txYSAa3c+N4WKrX6+8EIA=;
 b=W78V9KHNqVS2ojXt0qyoGQPPuL0QgksT0pZ5YF3W0eZY2efHaiI+bkcMnAQ5fg+0nj
 Q0Mw403O71xmR32i466XJXy3Zkz1IRsvFr4YhuJ9tSk6qTUehZbeccpKSyDczp9jhped
 1ntCPmvyGUGZYbgPfsx7TUrxBFPpLfxwkD8Q05x7oUPYQocPLw0UtABMc7aJnEBhPwjp
 OGel7HrHBDtzgEZoZL55UiEYiDBej4kiIbEYkR5v1A+fSeIBBWhoWavkzJoCMyJrYaK6
 3rUkqRYlhykfygYtWq0V8AJFRUtyWnythAI5w69gh/zNdlH8J56rqh/18V66jbhkwOK8
 5Cww==
X-Gm-Message-State: AOAM531VllM0BLLZ86lpu0pgo2g81Q1Yzm36Zn9V/qVqOWZg9B6d8vxt
 m9JevIHAUKBf0LY2n3535tg=
X-Google-Smtp-Source: ABdhPJxvTyMrtbCns4cqlBdF+S6GZjhzgarP3uAp+ibKh+y2LhqheqAIjQlK0A28szn9ImK/Jnoryw==
X-Received: by 2002:a9d:4005:: with SMTP id m5mr7306637ote.120.1611426438268; 
 Sat, 23 Jan 2021 10:27:18 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id n5sm2547514oif.27.2021.01.23.10.27.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 23 Jan 2021 10:27:17 -0800 (PST)
Date: Sat, 23 Jan 2021 10:27:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Crystal Guo <crystal.guo@mediatek.com>
Subject: Re: [v6,4/4] watchdog: mt8192: add wdt support
Message-ID: <20210123182716.GA59961@roeck-us.net>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
 <20201014131936.20584-5-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014131936.20584-5-crystal.guo@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_132720_168034_86DCB8DA 
X-CRM114-Status: GOOD (  19.91  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 09:19:36PM +0800, Crystal Guo wrote:
> Add support for watchdog device found in MT8192 SoC
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

FTR, I now added this series to my watchdog-next tree. Hopefully
Wim will pick it up from there.

Ultimately the bindings should be updated to yaml format, but I don't see
the point of holding up the series for that, and the series has been
collecting dust for long enough.

Guenter

> ---
>  drivers/watchdog/mtk_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393f609d..aef0c2db6a11 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -11,6 +11,7 @@
>  
>  #include <dt-bindings/reset-controller/mt2712-resets.h>
>  #include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <dt-bindings/reset-controller/mt8192-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -76,6 +77,10 @@ static const struct mtk_wdt_data mt8183_data = {
>  	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>  };
>  
> +static const struct mtk_wdt_data mt8192_data = {
> +	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
> +};
> +
>  static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
> @@ -322,6 +327,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>  	{ .compatible = "mediatek,mt6589-wdt" },
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> +	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
