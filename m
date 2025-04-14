Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2BBC369A2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSPX/TbzronNETf+6T1qob9Fj8RgDBqBjqNXnAsD94g=; b=kiX4lsc71rG/CdlWlikqtzN1A2
	ocTJppB5uxxRteHTbh0rMtmhSv54wCzhMqyPHraU0IPtOtujcUfsi2LqAhhrtfj6cgUSgbuysLrV6
	VR+RToqsXzeB4Bcg+QqNu5EVN7JDCaHWBUJimK3E0KfkLHZ+MoRy/+O784zWnhZ2dYrsC++qJATEz
	fV124MmBoSzcpgZK1uM3EUPHKhBgK2005Ym2HlHm9fZXnT0U6svIAAU+PU/UgueI4xLZX/tSeZDPq
	sJLJ3XKIHO3GVk4hviXy8V3LjUUVDkA0ikQaz1Qs6gdj3BXOAd/vwJeQfjFX0oZNu0L08sDmi0N6H
	67Sp+pqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KKC-00000002GCT-3G96;
	Mon, 14 Apr 2025 13:58:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KIJ-00000002Fid-15jo
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Apr 2025 13:56:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso33150255e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Apr 2025 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744638973; x=1745243773; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wSPX/TbzronNETf+6T1qob9Fj8RgDBqBjqNXnAsD94g=;
        b=yuebA3yYY1KB9ZrFWBqIPcf7NeSdqN7/bZcCp2yZtfxOuat7M9NA2fN0H63/9HW7M1
         CQLhWZ+ouyfoU3rMFbXFYlDfli2mQM3uUGHsnakZGyZlXTKPk53wJtPeWQPmWGlf3sAb
         15fu7A/PHUVghZXI6PduytYknCVpa5JrccJTju1jq7tyvL86xrTvOQdY2F9saIT/V0so
         ygtT2jrwbi2mGnnAAgrPRiX2Ah5kbOS/fCJ8RX2/86ZHIgQdIh7rGlE/QTS2Ty48r+5H
         EkkPSkvBMbdsG2DP1g7gJiZEOZLJMwjFQ7XTaNwZRGdAx23anq0MDr0XJLSm/mI6mAhX
         RrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638973; x=1745243773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSPX/TbzronNETf+6T1qob9Fj8RgDBqBjqNXnAsD94g=;
        b=xEjOL6Wctsz6d+jxi1hhogR2mX27IKGBN+qqBUdv4UOJVVqrDqxxsIuKLV8rmS1MfV
         q/k+eO6ZLGhDVbeG5idn56XBaAI+Y/CDXaSrk/sAGmLzRUcSR2fMN2YYONPZl+7eWYf2
         4LyWq9e3s0DeOX28VP8Luyx+B7nEfdGC2GZViiIaCDbA7EC59z9IJCM764vZnKxzxHeU
         9qAIYppPgiiwItPQ8VIdWKQYkqHYEGsThC7c5gb2xfh0DrU1KcbysC6yhXYW7RbnoMZH
         +k/KepR4CTtdC7E4wZMujGJMIc5r/40TZ5SRZIXhtI7NZecmG6qXFZsIrF96mWZUq97Z
         QnAw==
X-Forwarded-Encrypted: i=1; AJvYcCVL3EGdipBfOfSr1fFimaD7QuiiOzB4EuOyw2MR9H/aU3NEolGXLQIM9FkhTOGIrYcsIKZfdbSy1tqYPETobA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwI7bDbzEb9eHYyJ2zDX2G5IxTIdEV05x2eH/Sj3HHxytpHYmw
	dkdJzKP6xLF6cdHmpwFlP7cdfBg4SIi0YqMuRhoP15U28XFtXcxtdIQuq0XfHcI=
X-Gm-Gg: ASbGnctqPzC/0UcIcMMIUYAnfhP1FaXslQX1Nhkh+SRT2fXRMJAsDEZ5b1kjN4z5mK4
	dU9NaTosocxwyPLnD6s/3/0d2xqcIJdI+LuFzjkGjCy6Tqbt2euh4KFbwmNiNYaqFRqPjEPcEMO
	lloTmpEI+J+9nJJsBwbmWUdwuizh+ReNM2BXWM/hcOQ90x5XZvJGQ+5tWl7V+kFfo5xTlcR/Ecy
	23eZapCw20j4EDVQISKDOkTLZGXEWOYMchgQA+z6klUHK0HbXqwtaaVUi2hmzokjZm4P7TBZ+Yj
	oSkVxOQFROYLaId/Z2vLCDSe9+jzx5e8oIYuHyhtPxMGZFcdin4S1fZWj1Jx3mFTZVBEVra4+tb
	kRakYdxt1ibIH
X-Google-Smtp-Source: AGHT+IEiisaCyzTv/c4YGT/191xkPS9XSCL07GXPd0MhBX6X1cLo7SxgbsZldJJbAyTaapzLfN0VMA==
X-Received: by 2002:a05:6000:2507:b0:391:6fd:bb65 with SMTP id ffacd0b85a97d-39ea51eef37mr9727002f8f.9.1744638973332;
        Mon, 14 Apr 2025 06:56:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5ee:79d0:2dda:96f4:b94d:164c? ([2a01:e0a:5ee:79d0:2dda:96f4:b94d:164c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae97751fsm11004403f8f.41.2025.04.14.06.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:56:12 -0700 (PDT)
Message-ID: <97cfeafe-7044-4f06-b2e6-e4a158419473@baylibre.com>
Date: Mon, 14 Apr 2025 15:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local> <202504111339359e840246@mail.local>
 <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_065615_292132_5B6DF607 
X-CRM114-Status: GOOD (  22.40  )
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



On 14/04/2025 13:09, AngeloGioacchino Del Regno wrote:
> Il 11/04/25 15:39, Alexandre Belloni ha scritto:
>> On 11/04/2025 15:36:12+0200, Alexandre Belloni wrote:
>>> On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
>>>> The start time parameters is currently hardcoded to the driver, but
>>>> it may not fit with all equivalent RTC that driver is able to support.
>>>>
>>>> Remove the start_secs and set_start_time value setup because it
>>>> will be handled by the rtc_device_get_offset function using the
>>>> start-year DTS property.
>>>>
>>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>> ---
>>>>   drivers/rtc/rtc-mt6397.c | 2 --
>>>>   1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
>>>> index 692c00ff544b2..d47626d47602f 100644
>>>> --- a/drivers/rtc/rtc-mt6397.c
>>>> +++ b/drivers/rtc/rtc-mt6397.c
>>>> @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>>>>       rtc->rtc_dev->ops = &mtk_rtc_ops;
>>>>       rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>>>>       rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
>>>> -    rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
>>>> -    rtc->rtc_dev->set_start_time = true;
>>>
>>> This is going to break the time for people upgrading their kernel, you
>>> are unfortunately stuck with this.
>>>
>>
>> To be clear, the breakage will happen when upgrading the kernel but not
>> the device tree with 5/5
>>
> 
> Yes, you're stuck with this. Devicetree has to be retrocompatible.
> 
> Besides, this start_secs is what gets used by default, and the start-year
> devicetree property should take precedence and effectively override the
> start_secs default.
> 
> Just keep it there.... :-)

When you boot your board for the first time, is the date January 2nd 1968 ? If not, that mean it is 
used as a finetune offset year.
IMHO, mktime64(1968, 1, 2, 0, 0, 0) is a workaround for the rtc framework issue we try to solve in 
this serie because start_secs is negative (1968 < 1970). Now framework handle the negative value 
properly, even if you keep mktime64(1968, 1, 2, 0, 0, 0) , the device time will change. I prefer to 
notify you.  :)


TBH, it's hard to follow the logic, so I've a question:
If I push in my V4 a framework fix that drivers using year < 1970 will need to have a new start_secs 
or start-year value to stay aligned with there previous value, do you will accept it ?

Because drivers implementation are based on a bugged framework, so it's impossible, IMHO, to fix the 
framework without impacting date values.

If you don't want to touch framework, then consider offset year in the drivers to reach above 1970 :)

If you have a solution to keep "rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);" without 
having the date changed, don't hesitate to tell me, I'm not forcing for a specific one, just tell me 
what you prefer for the V4.

Regards,
Alex


-- 
Regards,
Alexandre

