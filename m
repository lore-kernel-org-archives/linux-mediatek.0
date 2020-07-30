Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA78FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 09:04:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A970C2075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 09:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EYPCZaoT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMBhXmWk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A970C2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ho7lfQa1lSCZYKURriEyJBmDElU0etsa3Gzchicr8zQ=; b=EYPCZaoTz/EP1yqti642mrd3s
	pb5iqjekhCKEEXnCpenKBLYk7Y0gCk36I9s5fbhrL+3XCqsXxssg4VP7eYwCdFDVpnM+p/HaTTufg
	wE3CQfiqPUE0wyAlWW7mKkyCcKhjB+30oMFqQFrI2LYH9bXbF4gw46Yw9j9tcePG0cUwsf6K/xU8b
	+qOXyrChueofteXoEtIZdziFdq3qYMT+cYXf0TE1JKJplr0a7yYwif5/1K9X9CuYVpRaGXScjYSrd
	ytXsZEltHsISICw+D2IpowbGxi5XtrJ4lXrcQiqfAtZUyAuKC1xMUHrsA5PKBnPaLt+IXCscgndL5
	yWYn15GjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k14Tl-0001dh-Nq; Thu, 30 Jul 2020 09:03:57 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k14Tg-0001c2-Py; Thu, 30 Jul 2020 09:03:53 +0000
Received: by mail-wr1-x441.google.com with SMTP id a15so24117666wrh.10;
 Thu, 30 Jul 2020 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SeUArJS4+sD39HCLlt6g8IUuT8R2pEK+lwZA6XLSsz4=;
 b=eMBhXmWkxmg8kJQm8Jm9Azy2o1rj87qKzFIlGdv9S9zFeAlc+PZZhZuPt1FnsQFru/
 E2NRbjGpXGR9NcmWb4OLqypJt0ZbroKgEGQw8UF9xj4Of/s3ETwrrmxCy9AOA2dvtqof
 gNzCAtV78LdThaKzcdJrTCokF54I4gNnAdsCE3Q1RR5OZU3GyBaJopRogyMJOQAx2UiD
 ss4m4HR2iasI4N7xAF4x1wdZlk68e5toSHV2R4mCUKfJdqcpzPuqRjDUmBMIslxwrJWu
 aDmkSysxYGlfNR1UTdCEvGfMHzXJHwawlbhLPdyhrqHcVt/+9b+K2uAwzDVtIvpfOz4u
 lMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SeUArJS4+sD39HCLlt6g8IUuT8R2pEK+lwZA6XLSsz4=;
 b=RaBrN+Ul4hSd1H3RosWELiHsg+G39E7pb/2k23wwqc78Dt0wXYdl1+q+0dk/At+l+H
 7IYPAuhzd6AfBS62LoA6Fnb322QmVFrBol7ZC3o4DVo6Wbozqvu6YGDHIMu+3b6/q9cK
 z0+gtnMFZ2JdZmz//OlkQo/F5/SFNau+zuNMSiVQnVBYZdeI+swcOa8tz4BJ72OdEydM
 H4QOBf4Kk2jdK1rN96LPLs9REcF6Rj1B8vCaB4rqsD8equAveWewSfh1ydBcblxjdGHS
 7dNuhgfKu4L5XI2ckslhLwZSmvGdq6zBAnfGArcI/1t72JkjLm/HXiFDtnMEE8kpR3TT
 jhqw==
X-Gm-Message-State: AOAM531jhCYEBSl143qdGDuEEIzKSWbNRMVqtjhxU2I4P7mqnI9Z4MRu
 dnzACsaNFHWmUF1QLtxSXoEOW2CYZQM=
X-Google-Smtp-Source: ABdhPJyNZYwhrS5KA21KNWl/AE51BzMY88ZO62K3HW+2iKld2AGa6p8xpTllJBX2+vh0jRQBiaLgvw==
X-Received: by 2002:adf:8bd3:: with SMTP id w19mr32760613wra.167.1596099831847; 
 Thu, 30 Jul 2020 02:03:51 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
 by smtp.gmail.com with ESMTPSA id
 f12sm8492015wrj.48.2020.07.30.02.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 02:03:50 -0700 (PDT)
Subject: Re: [v2,3/3] watchdog: mt8192: add wdt support
To: Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
 robh+dt@kernel.org
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
 <1596016922-13184-4-git-send-email-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8774e948-502d-8a83-6e7c-5459497c52a4@gmail.com>
Date: Thu, 30 Jul 2020 11:03:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596016922-13184-4-git-send-email-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_050352_900533_5094786F 
X-CRM114-Status: GOOD (  21.82  )
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
 seiya.wang@mediatek.com, erin.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/07/2020 12:02, Crystal Guo wrote:
> add driver setting to support mt8192 wdt

Commit message could be better:

"Add support for watchdog device found in MT8192 SoC." for example.

> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393..aef0c2d 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -11,6 +11,7 @@
>   
>   #include <dt-bindings/reset-controller/mt2712-resets.h>
>   #include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <dt-bindings/reset-controller/mt8192-resets.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
>   #include <linux/init.h>
> @@ -76,6 +77,10 @@ struct mtk_wdt_data {
>   	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>   };
>   
> +static const struct mtk_wdt_data mt8192_data = {
> +	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
> +};
> +
>   static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>   			       unsigned long id, bool assert)
>   {
> @@ -322,6 +327,7 @@ static int mtk_wdt_resume(struct device *dev)
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
