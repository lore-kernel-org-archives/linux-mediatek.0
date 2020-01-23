Return-Path: <SRS0=Zlmh=3M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2C2C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jan 2020 20:55:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A30121569
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jan 2020 20:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="InocCLgJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+lTZedK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A30121569
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZrAXiyeKrpgxOS1v9bkmsOso4aeJo/74iSKdIaZi7s=; b=InocCLgJhmRL5D
	+HHw8t8o0Hk+0YXkZl1jRCv84QBg6H9BiyMTTT1f5V82hDX46RhJ21VVv+6JYc2lMjUOCLE6OPcrq
	FliTFnTUfgi9w5bxl2MYyg6mz15FMFRaPPkTQEsnMjO0pFkiOKywN9F9GDz0+uA/6cnebJZXXmb8e
	xwRwDy4pwzsnTdIGOgoic6tlQHh8pgsXGPeCuTJjeW4O6JrJiJz/E81gYbfaTe+SLw1193XJvLT5a
	nHCHqj3viBvjpa0kCPmKOBKFQOYJ1+hAK56+T+WoTSwD0Y7BWnuvBKv2zRMO+sK7g9SciWRSgiooN
	pqOSpufolwX2vjlMw5WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iujVU-0005ZL-UO; Thu, 23 Jan 2020 20:55:16 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iujVF-0004F7-2M; Thu, 23 Jan 2020 20:55:02 +0000
Received: by mail-pf1-x443.google.com with SMTP id 62so2092451pfu.11;
 Thu, 23 Jan 2020 12:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VkVxNXoZb5ITMLmFjeLX1O6fjDK5AnFJMJ0BZSxNB5g=;
 b=m+lTZedK9gWF4xwuaTyxbjIg3bAIdwWaB6Ad4V6MfH/Vio65HRNqXkwK0kgc01h0kI
 5kTOxiQ9vPmo/ygxF2dAX9D/uL+c4r7xKDUHv68qzm1sfcDeh8kyhOg3Ukk4LmkYxD1J
 jhvIj68UrMBL5PdrQpg1Ee9cJPRODjOuka+qYPSICNp8lJaI6wlOhtJmKECSi3W7Zwxl
 8ekZzqlJAQnsRemRBYW1i2PAS3flE+CrcoRJ2ZLEAylFOSCFtIhLVSAewJepv1s3wn8Y
 uv8/6fmuYtlTTfHu3MSpoJQWNJarjMQShWNHz2zAieUl75osDU5NX4dV/BCT0O6Iu5Ii
 Prsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=VkVxNXoZb5ITMLmFjeLX1O6fjDK5AnFJMJ0BZSxNB5g=;
 b=kMRfW1T+Mv5swHqFpXogqYHqj6EBZZdWnuttE32klwIfTIboErEaJKS5gxtvEIhJFv
 HgrvTOBosOzoXkMRVwaHdFK5Pj33VxH9lGO3uZNw6b4q5wK/PL1W+vzcLvTuQlYs0Yox
 Z+5XbCsJ3Wufq9BT0cfs2o08Yfn9xfcTK70ArtVAdmQ/piQOn57fHSdgD8ehR2LJHoOH
 KzLnEwyzSmnj/aosPuVE+3YSdpKfVeERo/CKJQHJh1BfUyQJ6ZGJpD+BU2woRAzmpso4
 V2Ba43pn2qVw/pdx3asseUaQLQlSTvJw4jn0nE9QiZk3wsrUqwOMgtyP4KSMTZGlbX/R
 TVqg==
X-Gm-Message-State: APjAAAU72zoumSklT5fmNYwDoQPTnT0JOxkBzg7htJ+IhjZhNYXrDgs/
 M8JbGu5jx5sU5V8a2BGcZVc=
X-Google-Smtp-Source: APXvYqzHIJnoi81iMDc7G9FPl8tVJE3Z0QS08Q2YEjqX/z/j/UPzE2UfRZuf39Ccdq50EzPulbIa6Q==
X-Received: by 2002:aa7:8ecf:: with SMTP id b15mr144675pfr.86.1579812900166;
 Thu, 23 Jan 2020 12:55:00 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e38sm2857390pgm.82.2020.01.23.12.54.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jan 2020 12:54:59 -0800 (PST)
Date: Thu, 23 Jan 2020 12:54:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yong Liang <yong.liang@mediatek.com>
Subject: Re: [PATCH v12 4/4] watchdog: mtk_wdt: mt2712: Add reset controller
Message-ID: <20200123205458.GA13785@roeck-us.net>
References: <20200115085828.27791-1-yong.liang@mediatek.com>
 <20200115085828.27791-5-yong.liang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115085828.27791-5-yong.liang@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_125501_114957_FDAC0887 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: devicetree@vger.kernel.org, freddy.hsin@mediatek.com,
 linux-watchdog@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, yingjoe.chen@mediatek.com, matthias.bgg@gmail.com,
 chang-an.chen@mediatek.com, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 04:58:28PM +0800, Yong Liang wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Add reset controller for 2712.
> Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
> camera, codec and connectivity) software reset functionality.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mtk_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index e88aacb0404d..d6a6393f609d 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,6 +9,7 @@
>   * Based on sunxi_wdt.c
>   */
>  
> +#include <dt-bindings/reset-controller/mt2712-resets.h>
>  #include <dt-bindings/reset-controller/mt8183-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> @@ -67,6 +68,10 @@ struct mtk_wdt_data {
>  	int toprgu_sw_rst_num;
>  };
>  
> +static const struct mtk_wdt_data mt2712_data = {
> +	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> +};
> +
>  static const struct mtk_wdt_data mt8183_data = {
>  	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>  };
> @@ -314,6 +319,7 @@ static int mtk_wdt_resume(struct device *dev)
>  #endif
>  
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
> +	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>  	{ .compatible = "mediatek,mt6589-wdt" },
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ /* sentinel */ }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
