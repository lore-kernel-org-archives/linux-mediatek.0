Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700CEC433EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 22:00:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC062065E
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 22:00:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N9Y2e3Tc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zxz2qd1Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC062065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2c0H5mcuA1w7oaOHU3ZeMdBhM0s5y1RbOr6+0eKAbGQ=; b=N9Y2e3Tc+qxuFl+ozjeaO5hKa
	SXED15CvihfWW8Lj69QDynydkEAngqiPOBproxx9vqtKs2P9d3HBxzYGRqUN0yeXfw0/EAxhVJ27Z
	bR2uZ+O6Vz7bp1AeTMBGr0cod1m594qoTHF+8o6a4ObmXye4JRAnIcMcW5HtreAyRBKM7wVDMNtYZ
	LEduNwiSNBu88yR7kFS8qjpCZ5cOrjBK7WZ1sOX1Zn6DD/+sBy3y22llsg//wKMnUQ2Tde0r4lMCI
	Ar8MxnYUVa4zjBU5meZuVqvHOB6KrzW46y8p7hpZAzu1ZzseFOWm7BfAhM881dhkNFEnGS2K/ZpSz
	I/6fa4f0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyjGA-0000X9-S1; Thu, 23 Jul 2020 22:00:14 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyjG9-0000Wd-MY; Thu, 23 Jul 2020 22:00:14 +0000
Received: by mail-wm1-x343.google.com with SMTP id 9so6253337wmj.5;
 Thu, 23 Jul 2020 15:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u4N8EQ4xAO0j5YF801GNNXppFCnjV9JwTLYq/iG9D9Q=;
 b=Zxz2qd1Y5ni/7O1JAsWNS7sa8VEt09eyzu/HTRZM+JnycaMWDdMaj0V59s/RL8dopZ
 +b7NvViEV+z7+gqWq8SS+QVWqJOCSsxIFGCQaAJhJ4rcCVhXMawBjP0VIAVatFLhEHvi
 p1PtNbmNk8tHeMt1knN12aiudumMEWQK7Tyiq4aV9AZnBJw6B+JCQNfTWK1jdHgF+duc
 p+xbvimvjNIp9SC5bNm37q6lrgHjYKTK9Ukz57ugCEEd7QknAqLCB9I2URJFjOzEeeGO
 niFbRrrPlE3NDNbobISH8X3dgOUeJnm5qK6odeCtH/HPvGHH9WqhV2FZdz1VGYyhzswl
 YfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u4N8EQ4xAO0j5YF801GNNXppFCnjV9JwTLYq/iG9D9Q=;
 b=H4nhWH/XLnp7kLXZUfAhNWdCepk3qO+sAORuJmJcNxjWphD3k+v7UjrO4AarfIb2Ux
 Zs+DwYSz8qrNCCkB5En1PTaTuAJ3F7WSX813rE3+R1Ipbg09KWnR3wo/BnzNnX46WKxo
 BY3ubLfgAZbEyk4U4KEXUuKiH6NZD9Pa356z0lJRX6fJLfuEbCa2w6zroc5NjjtNEfx0
 fouPikH54CtEQj5Fz7VJu4bAWzapMvff+U/lya2wPF8pDjw0LTkmIU3bRCsm3qD5FLJ2
 jywNFIaVukB5fFFfexQD/Y++4RfoZKUCnKhn1UgASrtUj9K8QNNzL9ji81OsN33vQIV/
 fvFQ==
X-Gm-Message-State: AOAM533ENkOq6BY7YtFlUI6Z5+zIh1O93httW7KyyavO5D/wpzBCoYhp
 1M168K0Emfuo1OqyYEc0sF4=
X-Google-Smtp-Source: ABdhPJwNOvh9946MEw9EMO/orazFx6cCk/g8QgOoofUmSHdVRjPCLotEIurIVpqitAd7n8iySwVIEA==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr6110703wmb.134.1595541612792; 
 Thu, 23 Jul 2020 15:00:12 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id t14sm5171171wrv.14.2020.07.23.15.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 15:00:12 -0700 (PDT)
Subject: Re: [PATCH 3/4] watchdog: mt8192: add wdt support
To: Seiya Wang <seiya.wang@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
 <20200723090731.4482-4-seiya.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <bdd9f543-0fe0-af25-1843-aae95fcd4230@gmail.com>
Date: Fri, 24 Jul 2020 00:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200723090731.4482-4-seiya.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_180013_833471_36284C8B 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 Crystal Guo <crystal.guo@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 23/07/2020 11:07, Seiya Wang wrote:
> From: Crystal Guo <crystal.guo@mediatek.com>
> 
> add driver setting to support mt8192 wdt
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   drivers/watchdog/mtk_wdt.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393f609d..ad23596170af 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -76,6 +76,10 @@ static const struct mtk_wdt_data mt8183_data = {
>   	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>   };
>   
> +static const struct mtk_wdt_data mt8192_data = {
> +	.toprgu_sw_rst_num = 23,

Should be defined in include/dt-bindings/reset-controller/mt8192-resets.h

> +};
> +
>   static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>   			       unsigned long id, bool assert)
>   {
> @@ -322,6 +326,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>   	{ .compatible = "mediatek,mt6589-wdt" },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> +	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
