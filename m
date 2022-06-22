Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A456C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiNCujgxYWYbz+UJ9ltziyWRFBz53VugMgkXPVyjSK4=; b=ixQmGa6mtYhqMx+vhfc2XD1Za+
	TQ/yqxiuGlT5is9/UbRdQ1WDbr9QOwE4x64kJZwNU22xvxBRQNEvgH5VHYwnuDQaJjcmuSEOKwtIn
	POvEKOaTWJDAWXbKPaN4HczLa3ojVKzOb7k2iPmPgSFOnC0TKJXXcCSxiVbGi0BKEg39Cnp2xeyq+
	ntx4Elwfam5bfyWjtHDy7NtUcx5OgtRltxkGUnvkbSIFKeL/PgdOx/OoCe4mwikxawjrjRE2sLRWP
	3VZGaIjwnOPDxyN+YcGj2kHfak9jpNMHTVyqhMtkBxZkC7ficwmaFKmeGJtzh0S8/4to3AKCf7fEk
	mSYRb6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40pS-00AjoW-Hc; Wed, 22 Jun 2022 13:55:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40pE-00Ajin-8Z; Wed, 22 Jun 2022 13:55:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id k22so17100384wrd.6;
        Wed, 22 Jun 2022 06:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DiNCujgxYWYbz+UJ9ltziyWRFBz53VugMgkXPVyjSK4=;
        b=hXlFgbhirmJiWHqqoRtimtjAjho/OAKlPLMalXL7BtlrRx8PkIhLF7xBBR5FV7SJmn
         cqV5tB9SoymSQw7M+XYn5GL9fKXQsMfsZTbHWhdwSx4lCrY0F/wlAeqWai/KpXN+45A6
         AokbjafQRmysNsE2/q2eJQwvHEKu1WDbab/J693X1FpSpGHBhCM4PBPmtBVUXdsUISb0
         tJ+XhClEg93gx8J5mN88Y9EAfZCLB6h3vHWMG4EGjmyM7GoO5pZe9X36WkBKAXnPLYYz
         Aorax0XZAoRwQDAmpIMB0Ac8Fc90KQYp9doswcAV66yhQWjtut1Tq/B28pBSk+Riq9xM
         5mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DiNCujgxYWYbz+UJ9ltziyWRFBz53VugMgkXPVyjSK4=;
        b=IJ07jo2gCtY2naUgIICacHhhOqedrEy8WSCTDDMOH2Xg03lTWq93QGhKX7CiR+EpDK
         5Z1izt46ByZW/vMYA8eI2SyIWlOsL1zRf0I4yH0wCLV27bbzVtF/7WjVhwK+6XF04Qm7
         GW+NyjBx4T1J73nijiWcUmpPWJI3AFpppiYD0KYx+XrvK1O5F9GEEhM5TWO6Zi0hF6PV
         6nmh8BV4K8N46dYf8cgnEdeImo29bp5W8Cyw2+jPiElUolE12d4YNhBDxbEB3OBHmijz
         FFt/eJNzdCKGIYAmj0BPs8spd+hNz9PHe+HRYeFbXEYg3XviPJt/Lb34JMocW1RPa9hB
         xuKQ==
X-Gm-Message-State: AJIora/p4djBSC6rRHIVlkot+lRXjkiAIi4jNyijV/2FusB8+nfMVqPi
	+CPAWSmqMhqxOeQLlRkGQB0=
X-Google-Smtp-Source: AGRyM1uSVoTrSb3lxzWtryBVzIlHC0hkxQGNcIYONajc9TiRn89bRMchU8vB48sqgrJYnhsmfPKn5w==
X-Received: by 2002:a5d:5888:0:b0:218:733:4cd9 with SMTP id n8-20020a5d5888000000b0021807334cd9mr3680712wrf.619.1655906116801;
        Wed, 22 Jun 2022 06:55:16 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600c4e0500b0039aef592ca0sm21879131wmq.35.2022.06.22.06.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 06:55:15 -0700 (PDT)
Message-ID: <8f7868b7-ecac-0dcf-7a37-25ab57b51bf7@gmail.com>
Date: Wed, 22 Jun 2022 15:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH -next] soc: mediatek: SVS: Make svs_resume and svs_suspend
 defined when CONFIG_PM_SLEEP is y
Content-Language: en-US
To: Jin Xiaoyun <jinxiaoyun2@huawei.com>,
 angelogioacchino.delregno@collabora.com, khilman@baylibre.com,
 zhengbin13@huawei.com, gaochao49@huawei.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220622013410.2786760-1-jinxiaoyun2@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220622013410.2786760-1-jinxiaoyun2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_065520_338966_FC815272 
X-CRM114-Status: GOOD (  16.24  )
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



On 22/06/2022 03:34, Jin Xiaoyun wrote:
> The svs_resume and svs_suspend is defined through SIMPLE_DEV_PM_OPS. If CONFIG_PM_SLEEP

SIMPLE_DEV_PM_OPS is deprecated. The correct fix is to use 
DEFINE_SIMPLE_DEV_PM_OPS().

Regards,
Matthias

> is not defined, SIMPLE_DEV_PM_OPS is equivalent to an empty function. In this case,
> the defination of svs_resume and svs_suspend is meaningless.
> 
> Fix build error:
> drivers/soc/mediatek/mtk-svs.c:1515:12: error: ‘svs_resume’ defined but not used [-Werror=unused-function]
> drivers/soc/mediatek/mtk-svs.c:1481:12: error: ‘svs_suspend’ defined but not used [-Werror=unused-function]
> 
> Signed-off-by: Jin Xiaoyun <jinxiaoyun2@huawei.com>
> ---
>   drivers/soc/mediatek/mtk-svs.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 606a00a2e57d..8440058784dc 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1478,6 +1478,7 @@ static int svs_start(struct svs_platform *svsp)
>   	return 0;
>   }
> 
> +#ifdef CONFIG_PM_SLEEP
>   static int svs_suspend(struct device *dev)
>   {
>   	struct svs_platform *svsp = dev_get_drvdata(dev);
> @@ -1537,6 +1538,7 @@ static int svs_resume(struct device *dev)
> 
>   	return 0;
>   }
> +#endif
> 
>   static int svs_bank_resource_setup(struct svs_platform *svsp)
>   {
> --
> 2.25.1
> 

