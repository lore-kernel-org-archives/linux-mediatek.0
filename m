Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D959ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 01:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TqaiC6+5PjODgdBwHtICicD+dd5+ergNAw4nNe6Mow=; b=YJg5hChNlbAq/XDGOiMZYdMurF
	n8KtJJmPvGupaS4k276/SNlT7jBAgoxEvKfPYIKGTz1NwWaD82WLL1pEvEVaDT7gXYWnDir6dQ7LX
	bhewJG7p2e2yKFQV0UVP2UuBn8xGJ/sJssu+kZC4QBcYBKPF7JES6vXSGm+/02JZIeBmuwWJ9XYXF
	mFawvDxF1LqQ68H2bGmRZaSNocifoWajj2aGynDd281FSNsgqlm9tyTX6WYc/mDxtN6sjIxAOHJxG
	RyohS+eQPU9oPJz8q6flEhSlwPA901ssIEN8HlT6vlvb2zaZOzihvgK1yWn0/GmcM8e8OLnU0Jx9F
	23PpnONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obBEZ-00D5i5-JS; Thu, 22 Sep 2022 01:42:35 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obBEW-00D5hZ-Qq
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 01:42:34 +0000
Received: by mail-pg1-x531.google.com with SMTP id r23so7700953pgr.6
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 18:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5TqaiC6+5PjODgdBwHtICicD+dd5+ergNAw4nNe6Mow=;
        b=LPkR45NRdlBatKPakcpv4dsSnn64O6AKZ3CP7Canb3ZMh3urZEDP/6aeCNoCvXpoyi
         jsM1q+l0sqSkjbaIvfobbDrYH9ZFXHbnI2CuEgoepy1bAgxhnOLhMaZoDWxhoLXPuafz
         1ScU0/jLIo8fvSdIWIOT+vvI50v7wnaoo3tQy8Wa37TXDAijYdr+Ue+WV/ROuE6pcfIj
         M/AW8NJ3DeX6/CLBY1Fpat6Lw4d7aORGUSoVl0jLcpsFSRKFKyPu+Vzm3kSFvVJTjG/N
         JJ3lRSUBm292kaNKQ1GqBvR1pk4NqX/V8JU+s7C5HZcWwJKNxadhENqnquglJXV9+7wT
         WGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5TqaiC6+5PjODgdBwHtICicD+dd5+ergNAw4nNe6Mow=;
        b=7wBckyD934JWNDxn7UEZrSMYpdUunCxPoYCttF/+spe7F6sgMLQh7pKtu6WUyyZwNY
         jckHVqXhWOFqjWLK9FWJ/+QOgHfvaYqp+OCFLV+/QMwMG7COVGKP/Mu9Mh7LXHeYVoid
         N9WgkhMPeqm0d+MKtz8ZbJJZuRMkWYMhEYLG3HRQjZaQc7EXV8EjYCm0u9nDTnv0wVSt
         7t/bN4RXJ/DE3Ema+5XsDR0DDKpWVSqHyxVWT65DlN7jaIv+w9yvjLLysy9scyrNkS6P
         zEHiXqHEvtXJ2QthTDkX72s3rMInje61p9kT442EVBVkRGNBxFI4DBP8E6DYw4j4cgJh
         BRiQ==
X-Gm-Message-State: ACrzQf1N6vxdbHua14irilOBCp+/ZOQ2erAUQbCMs3/if3gqJyMuzGBP
	1lc8lkMgckc5aY165tHpem8kv5oVGSk=
X-Google-Smtp-Source: AMsMyM5F5q5V9Vn2GrnYbp7RXDz0oPM/LZ6ziKRO7Ee/lo2266CZVvwlbC0rUEtesrh+yp0ooOJ/7Q==
X-Received: by 2002:a63:4805:0:b0:43b:e1c9:32af with SMTP id v5-20020a634805000000b0043be1c932afmr970363pga.574.1663810951181;
        Wed, 21 Sep 2022 18:42:31 -0700 (PDT)
Received: from ?IPV6:2001:b400:e404:66d5:cf4:e9a8:56c5:fa2d? (2001-b400-e404-66d5-0cf4-e9a8-56c5-fa2d.emome-ip6.hinet.net. [2001:b400:e404:66d5:cf4:e9a8:56c5:fa2d])
        by smtp.gmail.com with ESMTPSA id w62-20020a623041000000b0053e156e9475sm2871524pfw.182.2022.09.21.18.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 18:42:30 -0700 (PDT)
Message-ID: <88bd277a-bda4-29ad-4157-09883303b470@gmail.com>
Date: Thu, 22 Sep 2022 09:42:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH -next] power: supply: mt6370: Fix return value check in
 mt6370_chg_probe()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: sre@kernel.org, chiaen_wu@richtek.com
References: <20220921152915.1506767-1-yangyingliang@huawei.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
In-Reply-To: <20220921152915.1506767-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_184232_914880_072A4D0F 
X-CRM114-Status: GOOD (  15.21  )
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

On 9/21/2022 11:29 PM, Yang Yingliang wrote:
> If create_singlethread_workqueue() fails, it returns a null pointer,
> replace IS_ERR() check with NULL pointer check.
> 
> Fixes: 233cb8a47d65 ("power: supply: mt6370: Add MediaTek MT6370 charger driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/power/supply/mt6370-charger.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
> index 716cba259a7a..f27dae5043f5 100644
> --- a/drivers/power/supply/mt6370-charger.c
> +++ b/drivers/power/supply/mt6370-charger.c
> @@ -911,8 +911,8 @@ static int mt6370_chg_probe(struct platform_device *pdev)
>   	priv->attach = MT6370_ATTACH_STAT_DETACH;
>   
>   	priv->wq = create_singlethread_workqueue(dev_name(priv->dev));
> -	if (IS_ERR(priv->wq))
> -		return dev_err_probe(dev, PTR_ERR(priv->wq),
> +	if (!priv->wq)
> +		return dev_err_probe(dev, -ENOMEM,
>   				     "Failed to create workqueue\n");
>   
>   	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_wq, priv->wq);

Hi Yingliang,

In general this looks good to me. Thanks for catching this!

Reviewed-by: ChiaEn Wu <chiaen_wu@richtek.com>

-- 
Best Regards,
ChiaEn Wu

