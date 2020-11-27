Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A44C3E8C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 23:35:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E942B2223D
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 23:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ajEahDM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INXbcUXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E942B2223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bs3O+4o0lTaKLBpwpMMJwUf7xXvrIdRGCAAuHSjz01w=; b=2ajEahDM4/4rleHyj864Yyskn
	ijduQ+KN3faWcy1TID4pRFrQu1aZbTR3StjSE4HJpefuRcqeYDUljvOaqFvkxtI52HV9/AjesLQbh
	s63mTTuVsU4IlhE9117h4epmh1f+iRC4poDjVw1Rl1WyWn314ml5h1C3yKCpag8ZzUdRUVtyP4N65
	jk9WjUekknkwcbRfCWapIdlTNBf0bSDt9K0nrizjw7PBipbZuDAynsPH+5U+H7sMXYeA2k9JN7UYO
	Ul1WjcZPBTUm0qNiFIjfryLwZiXiVaxY+y4zqucLhUBTuZU7VcwS1sZM87MqdZd0z5QOHcg5sk3Iy
	VAsVp2Ddw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kinH8-0005c1-Qn; Fri, 27 Nov 2020 23:35:39 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kinH6-0005aw-DR; Fri, 27 Nov 2020 23:35:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id w24so7849235wmi.0;
 Fri, 27 Nov 2020 15:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jVzhf/5meYw3rpw0SqzqfljLcT87jPxDXOiys7yFh2Q=;
 b=INXbcUXnvCOogsFpX6GkV6j4Qjs9GR5/ZV/ui7/R/F6iLXbJIp7Dn7ZbQWoKlMEz/1
 Ep4ijwz9l19P6hAp3utcfV0CzNStPymUpt5jGCYNWjzjqBU8xw/ce66aSGSe5bzpMLv6
 Z7ZkWjeRMHxcGQPukqzPLZGFSiyl9IvZ2JnrzsYy6vxEl/rQo4GyB7uwwo+H5kZ7p1n1
 4rZnuxJiTvAPyHZcK2eUhpy570UG/7FWd8QRpJEQIwP9gP/3tydCkuIOqDrRHdOwyMws
 Ud+KKLlcqJ++fer4lfbXhUkJEJkQlmNVy1QSS6UI+sHqwSx0QT7Ru/lbNVYkta0RNTPz
 7GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jVzhf/5meYw3rpw0SqzqfljLcT87jPxDXOiys7yFh2Q=;
 b=RQOGWFRelNPP7t2kQSZ3jZGiJjn+sA4GuTFhY9kttjqaxDnTKy82ftg9MK/tB/6SxP
 gDQUkmGYWyh4QLxsOeMLObwd0bQupq8JpiJTsM1QLYv40Q8JlsV+vWriFdXVXvuIQsLY
 vDkmNqlwjr/CL4Mn1YFXjr5s1DEJODsmqLEhE4qn0qXQrFPnc+RCY1uqmtBywXwO9k27
 o9/KJkLDdnl2mB9XvAx+O9SrsGk9C4sBD6FA7HpN08GB10bLzvpZ0S1vDY9gyo+zRsFe
 PfcL/2JfvyPw5tdLlnNG4k9iaAIDiJwEIAGm5ye1pHWuOXHxOm9J5BMKJ6/kxWCL3z1v
 +BTg==
X-Gm-Message-State: AOAM531JBSF0tE4upacyxWTS/txRKT0riBmdA3dFwzOnG8iRAtiWINWH
 OR90W3LvFp5PDlaCBO8GcL7pNkKYAJFpFA==
X-Google-Smtp-Source: ABdhPJxy+yLkwFNUsqIhZwIE0D69kMEePqUJFJh3gTpIXMyOQwY7iAM67O0D7S3/HIQtFqsy2GODFQ==
X-Received: by 2002:a1c:ba56:: with SMTP id k83mr4899024wmf.57.1606520135049; 
 Fri, 27 Nov 2020 15:35:35 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id o5sm15036632wmh.8.2020.11.27.15.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 15:35:34 -0800 (PST)
Subject: Re: [PATCH 2/4] soc: mediatek: mmsys: Use
 devm_platform_ioremap_resource()
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-3-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <188d0079-1fa8-8d43-97f1-33480ffc5c8e@gmail.com>
Date: Sat, 28 Nov 2020 00:35:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201006193320.405529-3-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_183536_548063_CCF03574 
X-CRM114-Status: GOOD (  19.38  )
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
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/10/2020 21:33, Enric Balletbo i Serra wrote:
> For the common platform_get_resource()+devm_platform_ioremap() combination,
> there is a helper, so use it and make the code a bit more compact.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.10-next/soc

Thanks!

> ---
> 
>   drivers/soc/mediatek/mtk-mmsys.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 36ad66bb221b..18f93979e14a 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -306,15 +306,12 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   	struct platform_device *clks;
>   	struct platform_device *drm;
>   	void __iomem *config_regs;
> -	struct resource *mem;
>   	int ret;
>   
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	config_regs = devm_ioremap_resource(dev, mem);
> +	config_regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(config_regs)) {
>   		ret = PTR_ERR(config_regs);
> -		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
> -			ret);
> +		dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
>   		return ret;
>   	}
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
