Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0172C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jr1LFm9oA7+foo+bfSwGKpAHgIHcluy5xuCOann7pyQ=; b=U02DCbVbUKRuYUI47Mun+wr1Ig
	ea09ZAgY46HzJOmCdajNy/WI5REqPZANPlOodzXKgVcojkTbiayGqOIGdy+AxXv3jpexApdQFB8FA
	t0DjLZp/7EW9R2xIN2aqUfMaMoaCkZvK0VjSLx6JL19x+ogVB/OowCf8RaemhvRXCq1XmYBHq7ALa
	+5IavsH+nQd4KjdNASsL0wPteM5h1D1SyOyUmfWT2Fb1hPc7HeO7ULe/tMMMJ2om/0Zq6R8bFFyGf
	3RQKhC/6uMFZ2HV0H8F/OslfrM3btn/g8+unqd13LrL0e7TJCpwVH4OfuJkVYrkHMfDpZmXHhL7YX
	G8VTToWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqad-0083xo-St; Tue, 31 Jan 2023 13:22:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqaS-0083t7-28; Tue, 31 Jan 2023 13:22:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so10583347wms.2;
        Tue, 31 Jan 2023 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jr1LFm9oA7+foo+bfSwGKpAHgIHcluy5xuCOann7pyQ=;
        b=HYCL6Z8jvYMOh3R1SPFZxahL/annJqPo4HTtLg8EFsx6FnL2WqrUtS3PeevzRryilE
         1RSzOuMRt15k8Sb4N1i8RgAti3ochDwPwvWwKRe6pXn7jV4wC092o0tXKUrSgHvcp8Kx
         tUg7A2l1wU1lkVTPnAwihysAPSS4zauzZeSb/KJrNQywkgXDVwNN313OfsqISgns3wMw
         R2HDv9iS2MwOdsLQFqSzz6jG9/Z4kzWhxfVQlP1hr4k60FdjK6zn28XATIc1dXDUP/xX
         q2BrIG96dy2vHNGz05hXCqx348YPB4BQDjHESI8KUMsNLfRqUh+zZQVKlkvw7NIibnBM
         Hnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr1LFm9oA7+foo+bfSwGKpAHgIHcluy5xuCOann7pyQ=;
        b=FjVOQ2OTSJAdhMrCU5Pmdyxrk8CqJV4ZgSgmNlQ42dd5kUXIj3MD69HMCP7WN43Gj+
         uKppZSdFUXzpfvHkHM1hAd7/CbzR8sRXIWY4J91UFfJlI6RSXtp/3GVcoUpzJ4Tew2sF
         GSj4P3d0+KDPDJyiKwRx/UR8i818ByBvzS1GguVozFqQLxxwzd5l4ttqborlmHQCZqUM
         y8+26kagcspeQGnhSdXc2s6YPdWR2Pdrm/WiNAbEEZcm/WTrETDzSJWJZzXU9OSWD1q5
         fu2A6BRZlr872olm/4deZAv3IskQ16gq/2tDvC3swYoGeYWVkJgE7xSqTuy1lb8SH/tM
         ZvoQ==
X-Gm-Message-State: AFqh2koxk49WGjaKkw/qtByxzuOx5E4fvzF12Vpeqnk2vA/okHGtBIfn
	o9vT7txPUHAft9fe0poDBmU=
X-Google-Smtp-Source: AMrXdXuvvddG0FTWrGWrwSEzgoKZht0FgNrkaUZipnCC0rF/Ib9qQ06Mv+6JlCf/IPSVU6/AnWLrzw==
X-Received: by 2002:a05:600c:a4e:b0:3db:14d0:65be with SMTP id c14-20020a05600c0a4e00b003db14d065bemr48477657wmq.34.1675171324336;
        Tue, 31 Jan 2023 05:22:04 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j39-20020a05600c48a700b003db12112fcfsm1716851wmp.4.2023.01.31.05.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:22:03 -0800 (PST)
Message-ID: <3d9ba55f-68fb-3643-9ab5-dacb903a5996@gmail.com>
Date: Tue, 31 Jan 2023 14:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/14] soc: mediatek: mtk-svs: restore default voltages
 when svs_init02() fail
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230111074528.29354-1-roger.lu@mediatek.com>
 <20230111074528.29354-2-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-2-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_052212_155460_69B7A9CB 
X-CRM114-Status: GOOD (  18.12  )
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



On 11/01/2023 08:45, Roger Lu wrote:
> If svs init02 fail, it means we cannot rely on svs bank voltages anymore.
> We need to disable svs function and restore DVFS opp voltages back to the
> default voltages for making sure we have enough DVFS voltages.
> 
> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Fixes: 0bbb09b2af9d ("soc: mediatek: SVS: add mt8192 SVS GPU driver")
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-svs.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 0469c9dfeb04..2df30a6bca28 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1461,6 +1461,7 @@ static int svs_init02(struct svs_platform *svsp)
>   {
>   	struct svs_bank *svsb;
>   	unsigned long flags, time_left;
> +	int ret;
>   	u32 idx;
>   
>   	for (idx = 0; idx < svsp->bank_max; idx++) {
> @@ -1479,7 +1480,8 @@ static int svs_init02(struct svs_platform *svsp)
>   							msecs_to_jiffies(5000));
>   		if (!time_left) {
>   			dev_err(svsb->dev, "init02 completion timeout\n");
> -			return -EBUSY;
> +			ret = -EBUSY;
> +			goto out_of_init02;
>   		}
>   	}
>   
> @@ -1497,12 +1499,30 @@ static int svs_init02(struct svs_platform *svsp)
>   		if (svsb->type == SVSB_HIGH || svsb->type == SVSB_LOW) {
>   			if (svs_sync_bank_volts_from_opp(svsb)) {
>   				dev_err(svsb->dev, "sync volt fail\n");
> -				return -EPERM;
> +				ret = -EPERM;
> +				goto out_of_init02;
>   			}
>   		}
>   	}
>   
>   	return 0;
> +
> +out_of_init02:
> +	for (idx = 0; idx < svsp->bank_max; idx++) {
> +		svsb = &svsp->banks[idx];
> +
> +		spin_lock_irqsave(&svs_lock, flags);
> +		svsp->pbank = svsb;
> +		svs_switch_bank(svsp);
> +		svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
> +		svs_writel_relaxed(svsp, SVSB_INTSTS_VAL_CLEAN, INTSTS);
> +		spin_unlock_irqrestore(&svs_lock, flags);
> +
> +		svsb->phase = SVSB_PHASE_ERROR;
> +		svs_adjust_pm_opp_volts(svsb);
> +	}
> +
> +	return ret;
>   }
>   
>   static void svs_mon_mode(struct svs_platform *svsp)

