Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4106C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=botYHFk9pkVVViz8NkeeS2UKndFI//AAhZq6n6ujwTQ=; b=a+butiUUduiIlB8S1BJEvduW72
	0c0Vd0TQ9lbahwvC2lHrsw0EBYcGmBaMvnQK0N4+wjeum7ylZXauF4NrnPcuTTAEu9sQ2Y3524k4O
	KfgzYYbFeYFkGvF7+rZbY8OMODRLzqY6CU91A6NXt17mzuARRvnmeA0LdqWN4z/ayTWh4MwRt/45U
	OLgS1Pl3lQw5QBgK6QSkrmBMApQYf3HoTw6ttluYUPBcJpcXZhokzADDHnv3f3ffh4/mcAclLp92V
	LXfaPli+ZIcz05AiH5E7SaKpIFBOfHMH1MbzJHQhe0lhfIT3/NSXtbOChs7MNRioi2v+OQ+wfyCwr
	0KCBNlSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LfM-00EuUq-FU; Thu, 23 Jun 2022 12:10:32 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LV6-00EpEH-Er; Thu, 23 Jun 2022 11:59:59 +0000
Received: by mail-qv1-xf35.google.com with SMTP id g18so22021667qvn.2;
        Thu, 23 Jun 2022 04:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=botYHFk9pkVVViz8NkeeS2UKndFI//AAhZq6n6ujwTQ=;
        b=iUN7x5H9h/UPboRJ2yVuFMYrc5GXPnmG6+oxe8JrP6iHpvwclXYw+eATUkdUDrrhmy
         F+swo7MfGnsd0mXYsEuYN400a8XWvq9CAcA2Gz3zIkhvAolLBWoB5cQUNcI7xnbn62lA
         VT2vEOT/FFz+bdTHOwhiDf6haWktICqLrhVqphp8CWiLStZnNbdrwpaTy8GwjhPUj3O3
         uKT7Z4pEIJGbNH5ZAz7htjY8CQHnFb8IT5uM6Zgf4KtUJzk3hMzSHY0bBHOxrETV4Bth
         P3jlnjJJ2Yvaw2GpQGIU9TvAFwoKvdZOz9BICpningWNLRx41Ff0D7QGmusaEdL+efCh
         L5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=botYHFk9pkVVViz8NkeeS2UKndFI//AAhZq6n6ujwTQ=;
        b=P26rdkx4rzahFqKCpQUk6vZk7af4Rt5BhrkIj1+UlSb4WQ2T8p5VnQZDC/hDOEbUIt
         Hl702xecfbrTHpjRKHojkwVWHmwexVGSf+Sis+LrrM9xC7i2NONayMu82qnP8gmONc3X
         GEb1vR4HpCdhcldf/D3eM2IHyAz5jvzlgYjnMg7Mni6oLcAhyzuMawCtccUdUH0SzbXk
         u4s2ASMCiIYzGidrpM44gZHgnvmYdWwITlvxhsgLvDqdRECtmBjZsJ7sKFy6jpw4JysG
         1D7XQXZ/j+86gSsy1bukH2cSBe/jcOgRIXxrRGvUDP4BWZjvn8rcTsK3DMNnjh0lezvz
         TrnA==
X-Gm-Message-State: AJIora+mphpoSWB02jpADIl0ISlqLUawDNqUHDZhndemtvVZzJX+42he
	Czsv2pLQdkBSiG1sFfXges8=
X-Google-Smtp-Source: AGRyM1vN+Queyd3tKVxiIaJHasVG5kCoIJQ5hHezzRWrpbBUyxwbfitmzyNiwtP7ULKQwHBwDkL7Uw==
X-Received: by 2002:a05:6214:62e:b0:470:4608:1801 with SMTP id a14-20020a056214062e00b0047046081801mr15877836qvx.54.1655985593126;
        Thu, 23 Jun 2022 04:59:53 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f19-20020ac859d3000000b002f936bae288sm17305750qtf.87.2022.06.23.04.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 04:59:52 -0700 (PDT)
Message-ID: <d17549d3-a111-53b4-4576-2f5b6581c830@gmail.com>
Date: Thu, 23 Jun 2022 13:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 -next] soc: mediatek: SVS: Use the new PM macros
Content-Language: en-US
To: Jin Xiaoyun <jinxiaoyun2@huawei.com>,
 angelogioacchino.delregno@collabora.com, khilman@baylibre.com,
 zhengbin13@huawei.com, gaochao49@huawei.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220622013410.2786760-1-jinxiaoyun2@huawei.com>
 <20220623030931.2816013-1-jinxiaoyun2@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220623030931.2816013-1-jinxiaoyun2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_045956_566449_0C71BDBC 
X-CRM114-Status: GOOD (  21.05  )
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



On 23/06/2022 05:09, Jin Xiaoyun wrote:
> Use DEFINE_SIMPLE_DEV_PM_OPS() instead of the SIMPLE_DEV_PM_OPS()
> macro, along with using pm_sleep_ptr() as this driver doesn't handle
> runtime PM.
> 
> Fix build error:
> drivers/soc/mediatek/mtk-svs.c:1515:12: error: ‘svs_resume’ defined but not used [-Werror=unused-function]
> drivers/soc/mediatek/mtk-svs.c:1481:12: error: ‘svs_suspend’ defined but not used [-Werror=unused-function]
> 
> Signed-off-by: Jin Xiaoyun <jinxiaoyun2@huawei.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> v1->v2:
> - Remove the #ifdef CONFIG_PM guard around the suspend/resume functions
> - Use DEFINE_SIMPLE_DEV_PM_OPS along with using pm_sleep_ptr()
> ---
>   drivers/soc/mediatek/mtk-svs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 606a00a2e57d..fae7376bd083 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2381,13 +2381,13 @@ static int svs_probe(struct platform_device *pdev)
>   	return ret;
>   }
> 
> -static SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
> 
>   static struct platform_driver svs_driver = {
>   	.probe	= svs_probe,
>   	.driver	= {
>   		.name		= "mtk-svs",
> -		.pm		= &svs_pm_ops,
> +		.pm		= pm_sleep_ptr(&svs_pm_ops),

Why do we need that? From my understanding DEFINE_SIMPLE_DEV_PM_OPS() sets 
runtime_suspend_fn, runtime_resume_fn and idle_fn to NULL.

Regards,
Matthias

>   		.of_match_table	= of_match_ptr(svs_of_match),
>   	},
>   };
> --
> 2.25.1
> 

