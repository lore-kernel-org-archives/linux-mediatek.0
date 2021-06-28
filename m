Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948B6C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 16:46:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AC6E61988
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 16:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AC6E61988
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQ7bKByaN8smPiurpWoR53HTVCnTrXBRAg+R5xXBuKc=; b=namLSEH895+XU5
	880+XfvIbMeHavS5ivEPLM7Ag+ORoPKa2AIMAMToDF06pjfCgd0YgiAKzCR2hia4WI/pQifO7RJLf
	vGAisCkwJmzWnqENHEDGgXB/eJjwkfIdWi6vQ0sJiTaxAdzgXR4o41LOSn2LZmt+4HU1JM5flJWoN
	w4xMZwwsYctV5jERXuYcn59tEeJrA6nCR2ifqKCUYFsTbirmCLB4cBWN0VWr0KXNqarZBvxUKVbD4
	YJefXXebuNnwnJvC00ZPJLC7ijTm7EkjLFTgl4COZl/cKWTB7Eh7IHGAwAS2FPsx1RPAx5gh3sRjq
	oRrzBjG2CkoDk0VwDW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxuOm-008hFw-P5; Mon, 28 Jun 2021 16:46:16 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxuCT-008dQU-AH; Mon, 28 Jun 2021 16:33:34 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 o13-20020a9d404d0000b0290466630039caso4179862oti.6; 
 Mon, 28 Jun 2021 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UtUgHWKrOAfPi99gDumnR8kkJQNQB4a0Hv1A5Aua2sk=;
 b=AXTGCRSqy7PntAOyr4KiYlK8XRbFGNEtx/8y6SZNAt7pkc345ONCgExYRM6rgy7NC3
 Su3L7D0E/A/zMDcZndlEgTGFMF2qtIbgE4dFtKNovGXAgeUjW3bBdldb7xsXtcgGbPWt
 sSKBf6oGbU0JL7Cq42kX6lCmW/jtkHKOx1lk7GtSuQSSt0aKY9wuyerVxn7iUlNnWm06
 OSomIbRQWB78b4VNdXAYOWinRUYh2nrOzTP80tvcn6PbcDQDvAdlbp7dqgyIUTp43iym
 GWLBQt71xnOkCdCjf3by3m/BFMNhCl5nMJFmJ5Cu/EI2AJAcbLznYHOXj76vUlZ0kADr
 iAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=UtUgHWKrOAfPi99gDumnR8kkJQNQB4a0Hv1A5Aua2sk=;
 b=SKCrGwi7/aL6cPBToF/c4JRhiVemXazKJl4vKH8Ro91VF4/proxTrXCBdPeO4TEYuu
 Q3n5qnLsTk0hsk4GDrv5heH54aH7oVaRWesdO3tRJlONRxlEEI7HL1p5MtT/+wutoU/l
 mYWs5uSA7ouye5q4XE4As23F3AQGWFC1CXgLEjZeXFhY24OXRcET39Ol2fKXM32QKJS6
 W0xcQIbIfDsBO09NRpt3a4KDIx1wC425xQwujh3p+X/KAmhWjvpvHIyLSqQacUDj5pNu
 IxQuvBu2FdWqANctuL9IM7emI/A6Gb97X9Z9B1J5K1lo32uIUdLch/qavoh2cjz5uPPg
 F7+A==
X-Gm-Message-State: AOAM533QNIRkYb4QCzFJTKrpF20+nbfQvonrU6NdLtSWAIY3LY6IrBa4
 W8Sqlb1CF9UtZ8h1wSgtEXU=
X-Google-Smtp-Source: ABdhPJxBa2zVVcTFLRh1nBlV4u/4joB4a7hqMKIshTrYw4hi2/9W+n0K1e3JQo0OAmuNc+k2gHrU3A==
X-Received: by 2002:a05:6830:3190:: with SMTP id
 p16mr420934ots.42.1624898010388; 
 Mon, 28 Jun 2021 09:33:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id a22sm3589372otq.10.2021.06.28.09.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:33:29 -0700 (PDT)
Date: Mon, 28 Jun 2021 09:33:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christine Zhu <Christine.Zhu@mediatek.com>
Cc: wim@linux-watchdog.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 seiya.wang@mediatek.com
Subject: Re: [v5,3/3] watchdog: mediatek: mt8195: add wdt support
Message-ID: <20210628163328.GA445250@roeck-us.net>
References: <20210628113730.26107-1-Christine.Zhu@mediatek.com>
 <20210628113730.26107-4-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628113730.26107-4-Christine.Zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_093333_408525_6AB93A48 
X-CRM114-Status: GOOD (  16.79  )
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

On Mon, Jun 28, 2021 at 07:37:31PM +0800, Christine Zhu wrote:
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
> 
> Support MT8195 watchdog device.
> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mtk_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993bd009..8231cb9cf5f9 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/reset-controller/mt2712-resets.h>
>  #include <dt-bindings/reset-controller/mt8183-resets.h>
>  #include <dt-bindings/reset-controller/mt8192-resets.h>
> +#include <dt-bindings/reset-controller/mt8195-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -81,6 +82,10 @@ static const struct mtk_wdt_data mt8192_data = {
>  	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
>  };
>  
> +static const struct mtk_wdt_data mt8195_data = {
> +	.toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
> +};
> +
>  static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
> @@ -341,6 +346,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt6589-wdt" },
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
> +	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
