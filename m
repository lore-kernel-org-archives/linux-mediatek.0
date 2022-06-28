Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B431AC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 20:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJsS1gBe8v1ujCdmpOQQ7l1qkzhu5I3jprSo1MRxR9k=; b=C1VVq3h4Z5QvxoKuiSOGtPD1GL
	BHgOg0GqWgxiRWco9sLmMeYszdZMmVz2E5QRtk431tGNLdS2oxT2na5bYBwoZ7VNAOma4Ntqrtn+0
	iw85T5DVFC9iP7kQAw3+u9XnslDlBVIT+OmltcWnFISAxON49LPVg+w5JHNbTImLYRvZW3sg7v3ht
	41dgOhW04qvYL6aKY2HapxPol4Ul+pSd7WxTBVwovIYM+c8nnxGth9MWUUIrvPPELLMYjr9HEvoLb
	/6/bWROkJEyev7rq7beVX1ca7SW5ijGoHaA3j16DYjcrWlUrJo9ASAByrUo3hA/HawNPmjBvW3HYs
	z+5jk/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6HQR-007we6-GG; Tue, 28 Jun 2022 20:03:07 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6HQE-007waN-J8; Tue, 28 Jun 2022 20:02:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id l2so12416070pjf.1;
        Tue, 28 Jun 2022 13:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aJsS1gBe8v1ujCdmpOQQ7l1qkzhu5I3jprSo1MRxR9k=;
        b=TBY0kbIbvXEBbgjQi9UPiy1yZrUa2/Fy6yAvldZoXJrZhDVJ41RehAJO6EFJdFv1NT
         oInNh174AH1zeK4+UiMltQKh4BBPzvFQe3CYIc2XuLtmHgE97K9Bl1MHPIiekeR1eZik
         Uqim4KijEerHbQwHUmspUmCmaViTUaIChZAa/K4BPH2N8fnoZx/ely8zigFMX6pZd5za
         gQTU4aeXGn/nC6DSuzr6NZV2LyOVW1kpyMx+QfHd/6CAGAr7Mge5TfP91UMfsqNhbLyk
         aX1zCdZv9aKkaA/FMJ8Ec0LiGn7BIX4OPyBPjrC2EVEiWEBN/ztW9AZrqwSQRI38sYcN
         HAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=aJsS1gBe8v1ujCdmpOQQ7l1qkzhu5I3jprSo1MRxR9k=;
        b=Fqbf9cy840ykRvazHgUIu8xGxZjgwHlePaMzyx5Q8sYnJUpIZ7oRm0Bjpv/mfvKPBt
         VMJh5OeaV2gX2A68ngTVfggeUQ+M3/sTZwcoSjkijGylI+5I1l213cAinOcRP0/t4Yc4
         fgoSvrIK+aMOgoqOG0Xalq4KYPsVLQaFxFh/BIQxcEfPxA0O14ckJGr8KhIxHYfNj3H/
         4SNHz4D8rVdL8XoPZLhEIH5yDi2als7+ArEb0ahN4Q1srcdXjB7jYQYecbYvZBboRaU1
         sJQXL08m+kdlZLJUgwdr1FvLiboPru4AlQJPkaMTl6wLGJZZDSjhtzWH+e+LX0Is+ebQ
         Knfg==
X-Gm-Message-State: AJIora91JXCTbMcni7bMyrs2L6NxMj1OOQ8r+nWlu2+JGvBKzEt2a5Ng
	/ATf6JGZaJn56KdHLmovAP0=
X-Google-Smtp-Source: AGRyM1sYbBfSkhO0Q0kkW9p4U6q6kR6AW0c1LgwIdQimk+XCtttT3MMsztp5Q/QhN/MOzwIH3F8o8g==
X-Received: by 2002:a17:902:bb90:b0:16b:8a74:3aad with SMTP id m16-20020a170902bb9000b0016b8a743aadmr5304817pls.47.1656446571817;
        Tue, 28 Jun 2022 13:02:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s1-20020a170903214100b0016a01637620sm9676024ple.76.2022.06.28.13.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:02:50 -0700 (PDT)
Date: Tue, 28 Jun 2022 13:02:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/8] watchdog: mtk_wdt: Remove #ifdef guards for PM
 related functions
Message-ID: <20220628200249.GC3633970@roeck-us.net>
References: <20220628193449.160585-1-paul@crapouillou.net>
 <20220628193449.160585-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628193449.160585-4-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_130254_665560_8697CE8F 
X-CRM114-Status: GOOD (  25.55  )
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

On Tue, Jun 28, 2022 at 08:34:44PM +0100, Paul Cercueil wrote:
> Use the new DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
> handle the .suspend/.resume callbacks.
> 
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use #ifdef guards. Not using #ifdef guards means that the code is
> always compiled independently of any Kconfig option, and thanks to that
> bugs and regressions are easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mtk_wdt.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index f0d4e3cc7459..e97787536792 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -401,7 +401,6 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int mtk_wdt_suspend(struct device *dev)
>  {
>  	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
> @@ -423,7 +422,6 @@ static int mtk_wdt_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
> @@ -437,16 +435,14 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
>  
> -static const struct dev_pm_ops mtk_wdt_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
> -				mtk_wdt_resume)
> -};
> +static DEFINE_SIMPLE_DEV_PM_OPS(mtk_wdt_pm_ops,
> +				mtk_wdt_suspend, mtk_wdt_resume);
>  
>  static struct platform_driver mtk_wdt_driver = {
>  	.probe		= mtk_wdt_probe,
>  	.driver		= {
>  		.name		= DRV_NAME,
> -		.pm		= &mtk_wdt_pm_ops,
> +		.pm		= pm_sleep_ptr(&mtk_wdt_pm_ops),
>  		.of_match_table	= mtk_wdt_dt_ids,
>  	},
>  };
> -- 
> 2.35.1
> 

