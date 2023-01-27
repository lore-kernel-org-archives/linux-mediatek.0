Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A965C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGK9WZ16lbXZkqFtM3SgQR1Wjr6DeS1UPNxsNxP5Dls=; b=GrHiERHIWKB+AMJHUy7f4KSq8S
	xjoV7Ost5PUW2Pey1ahyhXSXi3gKsj/0EjGIZN/vwaUqaqY3YOgXADiiU6YffSg+67yNDQMPGxc/j
	eNyrboI2re6wE4YaLuRwMTgXSC4KzTYp76GvdVdfa94E6REfdipw7mcr5hvYsA2V/fMo51XRoXnmk
	aBEDKtnXEBBrniKNSrIDjc85MSgq4NciU9LqJlpx/KR61rlRvuI+h2S2GQSG11rjNBCMPx+2CLV1i
	gIItdXugxkyeTPauF2zcvX8+VeRLzEctNpZ0hDF9Ud/986L32Wyb8PuWtYUQNKDa5fcec4X1s2ZOj
	4WBiJ+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOES-00Ejij-BO; Fri, 27 Jan 2023 12:53:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLNJ3-00EJD4-N9
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 11:54:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id m7so4738205wru.8
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 03:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGK9WZ16lbXZkqFtM3SgQR1Wjr6DeS1UPNxsNxP5Dls=;
        b=Jzr99gL9j5L2AHl3a5sdtUtwpf2Uymr7zhnQA+wJNf7+HFWZaqVfR/xOouOaJzBKwC
         pq3wooZohecadT3h49kVa1D0mtVSsuKrnnFBuO8mppnpR463pq/Duv7/CR0yGLkPwP0b
         9aVXydRQH/cFjYMjudOOEQ8ejKchp3Rfh9X6ejTDtArHT6jrGDag4tHcX26kBZesOvTV
         zNXMYglrpn1Q/n+kfGLdA4LSocdJ1hTx0t38vAY1V831lAs8mgLRjcyXv6YnTo1Vf1zd
         aAHLb1+x6iAjXODk7PkIir0f6B2nEse/Ns7GjtHDXw49zpvugaIOV0tt1HCfqcE6SMse
         HtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGK9WZ16lbXZkqFtM3SgQR1Wjr6DeS1UPNxsNxP5Dls=;
        b=wwY6yAJBHFbroeN0LKX4UUyc8VeGM2AFY+W9t9whFP+UmmDNO6sS5LIgkrRVLs/3i/
         9pucbQpAz0iAWxOUTg+XldTq2is1QkNNgDG9IMbjns4rCzkQmn0TDk6Ura6mua3WdERd
         7jmsZIfkGLah3YMvgpk2SvO9IGkUg61D26hnNblaw5heZzqtOu2+0Eri6sRumIOnV7V2
         gcqJko/Yvxr5KcDEYrbUDNgC9gu4wzfWNVr1ffRLzzqVXozkrlFXOPYoZTCzfrqcIV7m
         jCLU+1T3TzxkJAfVVeBk6YJGJ8SVeoOTtcctbTQ9EOmdVj1fH/9/Ng0pSVQU9jeuZoQs
         hb0A==
X-Gm-Message-State: AO0yUKVD2p/Jlx0GMm3s+R7BMEABPlLPerSX0f+REFMmCoNPRjxdH92J
	qPp8o2YHo9WjECA4+mu1HKnpsA==
X-Google-Smtp-Source: AK7set+QpQ7+6LvKSS8XS3YposTYS1s0CwK2jSBHJSry7VY6/bljCNPbAGYx4jx9SoyTr6Ce5vH9+Q==
X-Received: by 2002:adf:aa93:0:b0:2bf:ad61:6018 with SMTP id h19-20020adfaa93000000b002bfad616018mr14543430wrc.10.1674820445489;
        Fri, 27 Jan 2023 03:54:05 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id a12-20020a056000100c00b002be2279f100sm3736504wrx.96.2023.01.27.03.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:54:04 -0800 (PST)
Message-ID: <d4da4803-134c-72aa-a24c-cc6fc3d8acc5@linaro.org>
Date: Fri, 27 Jan 2023 12:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 5/5] thermal: mediatek: try again if first temp read is
 bogus
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Michael Kao <michael.kao@mediatek.com>
References: <20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com>
 <20221018-up-i350-thermal-bringup-v8-5-23e8fbb08837@baylibre.com>
 <96e7aaf5-76ef-9356-84e2-ee1f747dafcd@linaro.org>
 <9b5911ec-9993-5540-6de5-c62c7c446274@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <9b5911ec-9993-5540-6de5-c62c7c446274@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_035409_801999_D441B9D0 
X-CRM114-Status: GOOD (  18.60  )
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


Hi Amjad,

On 27/01/2023 11:50, Amjad Ouled-Ameur wrote:
> Hi Daniel,
> 
> On 1/25/23 11:58, Daniel Lezcano wrote:
>> On 25/01/2023 10:50, Amjad Ouled-Ameur wrote:
>>> In mtk_thermal_bank_temperature, return -EAGAIN instead of 0
>>> on the first read of sensor that often are bogus values.
>>>
>>> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>>> Reviewed-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/thermal/mtk_thermal.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/thermal/mtk_thermal.c 
>>> b/drivers/thermal/mtk_thermal.c
>>> index b8e06f6c7c42..e7be450cd40a 100644
>>> --- a/drivers/thermal/mtk_thermal.c
>>> +++ b/drivers/thermal/mtk_thermal.c
>>> @@ -736,7 +736,7 @@ static int mtk_thermal_bank_temperature(struct 
>>> mtk_thermal_bank *bank)
>>>            * not immediately shut down.
>>>            */
>>>           if (temp > 200000)
>>> -            temp = 0;
>>> +            temp = -EAGAIN;
>>
>> Did you try to add a delay between the bank init and the thermal zone 
>> device register (eg. 1ms) ?
>>
>> May be the HW did not have time to initialize and capture a 
>> temperature before thermal_zone_device_register() is called (this one 
>> calls get_temp) ?
> 
> A delay of 29 ms actually fixed the issue, thanks for the suggestion. I 
> can send a V9 with this improvement.

I'm glad that helped.

Will you remove the "if (temp > 200000)" test ?

> Is there anything else to fix perhaps ?

Not in your changes

Thanks

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


