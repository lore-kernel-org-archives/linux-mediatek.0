Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC437D0D791
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 13:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQGnKXGMD/jd3LTWPOuFrMlwOdbC5EsGlhAOU++vmwc=; b=EN6oqBucEDtp4fPdg2m1eKf2hH
	OJszIF83+hNtSmOfYlx/rH4s5k7Tpg2cYzLfmhPYIDFbkJXy43SG5D3GN16T8vEhSPHSYnWdEGxl5
	BDxzj3PXte1DgmuVt1JUWU6cf9ta6L+O8sX1hKzuw4DVDemH2xhlJaqazzM6AcjVk2h6F0yNWBq4L
	Xzf4ZO/yEf7kzxUQvEmXME3x25folz7VB5hCbBk3OqQoanzMTSzO3qw7jY1Du0FZrtW+ZgZ0BZVPT
	3VQQ93H1YeItJ/sxhmvVNL6tglfAnW915FgYS4UEXm7k/aHZ4U6p2anMrocEqD/3sskWzFRAnUFv2
	MXLkzFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFm2-0000000GSuB-3bFF;
	Fri, 11 Oct 2024 13:33:42 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFZ2-0000000GQXn-0QcB;
	Fri, 11 Oct 2024 13:20:17 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso721923a91.2;
        Fri, 11 Oct 2024 06:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728652815; x=1729257615; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQGnKXGMD/jd3LTWPOuFrMlwOdbC5EsGlhAOU++vmwc=;
        b=Omcz2JtB5A0n4S8MUdTnvRygnX5UekJDqaurKuo/7+QnlMNqmjSB3XkZ56lpoX8BBf
         s+SOEHC9Tr0s3AZft4UDogXSIDIDZG/9s96Cu4DhBk1aCYO9FiBXHTT2RAWDA5Fgch0c
         ZFPpxIDIFn52h8JhdPQ96eoDBrkHB39pfNoU+YHV4Sm3t2hobyLIuLJSrIopls2HZUe0
         AD919sx/13Ac7rsEqm4hGXQmdF9Hscs3X2kHmnAzQ/Mi++RA/zHKWIyNmqQCoX+6md1v
         1QOurlEhMELEw844Z6axcethSNA8HiYuiDPVW7O39gHkP8aUJmOObn5hwGp26O/NOJa5
         a4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652815; x=1729257615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQGnKXGMD/jd3LTWPOuFrMlwOdbC5EsGlhAOU++vmwc=;
        b=fud+A1piyirfHhuRNQAo643KCAWLL5uQSLuCiUURx58ohLcMKeGRePLjQf3ArxK0O5
         aTU6AHJhgbaquf87+7mpQx/BkihYjShTrxNY7sP6YqG9TfQRHQ0oAVvDqqw3CpVI2nix
         5+qHqmYxcMgAMQprM89a7Pj+PBlILn1ANmse3KEdYgFYZfMSOhvifV3AW+wrENDYbR7v
         UuIZW11nyCad6T88VMev9A65umugJxr+2GKewEbHhtm+E1X4+d8RKltMRL9FlORTjLkj
         oy9ncJN7sfIF1AicoP97q+Ap2jgrlym1+9GtbomQ8d/qQeV9R/5SGGEqbTrulDNcrKyP
         4vrg==
X-Forwarded-Encrypted: i=1; AJvYcCU8cBvUu4hsntVscrTXioF8qQc9VZCl8c+aT7a9QN1TdH1S/+HWZE0J10Hu6HDluVvJhkqWqdthw0hLvGIbqj4=@lists.infradead.org, AJvYcCXkUO4WCfNz3hAmD//ZCJZ5MIVTiu8R7UgBnZGUEIDdLJFO0+H74MKUU0oPBz8XDrKV2ipw+kTqpcWmG/pDPB1i@lists.infradead.org
X-Gm-Message-State: AOJu0YzW3dsMmN7IvYD4HA9XDcPCJfCLwqcG+8K8kHBH4aJRl05nFRrv
	TTHj+dLWd/1m7aC+zuDy4970AkFrwhd9Z7rPTXoHOYc1gshnCFjc
X-Google-Smtp-Source: AGHT+IH5nEeE+SMSc6DH3bEQIbFsOMs4TIXRax9wCnVZVUm8SWqh9hQoGE5QLcDKtpZh23qzawXOfg==
X-Received: by 2002:a17:90a:c250:b0:2e2:d1a3:faf8 with SMTP id 98e67ed59e1d1-2e2f0dac7c2mr3651218a91.33.1728652814511;
        Fri, 11 Oct 2024 06:20:14 -0700 (PDT)
Received: from ?IPV6:2409:40c0:11a4:8d8a:687:fb0b:3c04:c809? ([2409:40c0:11a4:8d8a:687:fb0b:3c04:c809])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5fc5e1bsm3153033a91.52.2024.10.11.06.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 06:20:13 -0700 (PDT)
Message-ID: <83572cde-19a1-4089-b02b-361a8ef40bee@gmail.com>
Date: Fri, 11 Oct 2024 18:50:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
To: Lee Jones <lee@kernel.org>
Cc: pavel@ucw.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
 <20241011074702.GN661995@google.com>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <20241011074702.GN661995@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_062016_178766_B914D0D4 
X-CRM114-Status: GOOD (  13.43  )
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

On 11/10/24 13:17, Lee Jones wrote:
> On Sun, 06 Oct 2024, SurajSonawane2415 wrote:
> 
>> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
>> to resolve the following warning:
>> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
>> error: uninitialized symbol 'ret'.
>> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
>> access.
>>
>> Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
> 
> Real names only.  Please update your .gitconfig.
> 
>> ---
>>   drivers/leds/rgb/leds-mt6370-rgb.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
>> index 10a0b5b45..87805c21e 100644
>> --- a/drivers/leds/rgb/leds-mt6370-rgb.c
>> +++ b/drivers/leds/rgb/leds-mt6370-rgb.c
>> @@ -587,7 +587,7 @@ static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
>>   	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
>>   	struct mt6370_priv *priv = led->priv;
>>   	struct mc_subled *subled;
>> -	int i, ret;
>> +	int i, ret = 0;
>>   
>>   	mutex_lock(&led->priv->lock);
>>   
>> -- 
>> 2.34.1
>>
> 

Thanks for the feedback. I'll update my .gitconfig to use my real name 
for future patches.

Best regards,
Suraj Sonawane

