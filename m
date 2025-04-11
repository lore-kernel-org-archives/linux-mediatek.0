Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB44C36010
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Apr 2025 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdBe+uF56KhkOuabVb/m7WvzCAHrcIAYgMQIeJhFnuo=; b=VXfDWTpe+i8cUcvmBnlNYN6HsU
	kXduukdC45Z/agxKe5kjCUuq4DXvWSOKEXp1nIIQxU5/iKSoDs+2sClABKLKguw+zfzKR74anrXMO
	k4ADkP67p0Y8snuV1bpOTEZLptAFeckR37ND11hu6vx2DZleNhTs5owxnK0t88NlGTfIxcuDZNiqs
	69mohkbs+X+vCcaoeJUYFJlLMut2cFrocFPoeLiDIjIEPDAmPzX8ht0sjx601aCZ5aass7U4VNI+E
	Em64lhlxkbaAs2WxHiHzRaH2YjOL1JDDUboHKfDbVn0tDTEXRlCGt4APoHIwVrOX+EbNi3yzHu46E
	Gd+oVI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FRo-0000000E6hA-1nHO;
	Fri, 11 Apr 2025 14:33:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FEs-0000000E4Dd-1I14
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Apr 2025 14:20:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1226993f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Apr 2025 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744381212; x=1744986012; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdBe+uF56KhkOuabVb/m7WvzCAHrcIAYgMQIeJhFnuo=;
        b=FPb3GoFiIChJ9dFmTRzCGLEvH84MfRVO0Dtm/S2g2CSuE86wWAvCdC7IL6dWqYxWAC
         zkQmop7Ry9EwK/EhecfuzXnrHYGT/wLKmY2qR/KvynONCoZxZojAhIH+Zl7aoyY90dpw
         RqKdwwEsJcfowcp/ldWEB1uGJfp4bCUO5R6ItisHU+qA/qUNUYROIgLBjkBe7c7XBJx8
         bTmxtJaDOZKObTM/2J0kFrT82ezu6bTTqXp9nUAtrjIjepxg4iDfYUUJS0eFfoebMf6G
         IVndALcYC1jnMExK3HVDBTRUgZ+NS2CrRmKxiUrIW8zs7RkzAHPFad6l1EjOuPvxbHiN
         XOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381212; x=1744986012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdBe+uF56KhkOuabVb/m7WvzCAHrcIAYgMQIeJhFnuo=;
        b=Bu7UQY7QKdl782WLpK9tXi5DPMKXvzwNhH7fxSy3baNtO0DgO3U9DZd6HagSZ28qUr
         rx0J4w2kKPzjbU4STTsOMpSz7r5dFX++fkrDLZN5W8wzd8D8ZzenvL1nJQvgedhPFfZ0
         gXihYzvy+yCym3ESNIxUprQJL6hVQsfq31DMmN0gFLdF8njtoSIfwxa1IyBh+z1I7sN9
         JQwVXdC3NPiM0Sf+ucNqThpwKWcgHzLRQFQ/dWLZG5gYwF0ZN5s06cYEPQi4/qLQu2nI
         08vKgChORJWCOCoXCwQ3hmHTDCl9N+D72MD3uD385baPo/e+M/1vCZACx0j8vkuIc05S
         5S7A==
X-Forwarded-Encrypted: i=1; AJvYcCXvGY2fFhrrF+ssBVcZnlVqS6NrZbujxp9X1jNjPL6+ggs/Q6pbL+ds+8MxwDNNdqHs4i+vUEhN/Ft+M+eVgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiGAs9NTN6aZhgH26Rknmh6upH8K9Mns6F6Q3Q8B0+CDlEdSEM
	9329E9A8YIp1fN0S9ugdzM7auw3XbQurJzlV3rEjYMT0SEsdVXLqcHAUEyf1H4o=
X-Gm-Gg: ASbGnctoq9DCVHDEDKpd40KSaeO5/ejDVhkhri2Hikbg//dR6hldzaCZ3194fut5LoJ
	vVXgdFgjbX3GWWABqBdK6nBZY39guQRwHLIOXyUQBirMPAaPpR6cBC1r7UCcGdjBmEq5LxNrJ08
	sYKwLDLSmG1rP5D2Nz6SwtrTgfqyoybi+NzUMl0rt5yV50reIH8onHzsjorF4dPIjzCfnMaQ/69
	DqJLkBH6cuN+At1HNEP7Aj+AEMK+rG/boGhpTs4aRRwTbYMniEbIpOHRxC8QyJ32QzTS3FdI5Cx
	q53JvdJu4mzayUMZnqN32giZf44hgF2sfxgEmIIAOwY2v4pOlngn8rHEo+OPwjSxB/GuC5PHw2Y
	yadXYfdSVqw==
X-Google-Smtp-Source: AGHT+IFZ4lJFn1G3FTPM3/pefChplb5Ul1NZ2T59kDMMnV2Japyqu1iF66jX5ixamcxpq9HuXW+pSg==
X-Received: by 2002:a05:6000:1a8a:b0:391:1139:2653 with SMTP id ffacd0b85a97d-39eaaec9e98mr2481396f8f.52.1744381212408;
        Fri, 11 Apr 2025 07:20:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5ee:79d0:cf9d:bb30:5951:692? ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb43sm2138998f8f.65.2025.04.11.07.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:20:12 -0700 (PDT)
Message-ID: <8ea16b0a-85aa-4ff7-8531-9eb253a9575a@baylibre.com>
Date: Fri, 11 Apr 2025 16:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rtc: mt6397: Fix mt6357 RTC year offset handling
 for hwclock commands
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
 <20250109-enable-rtc-v2-2-d7ddc3e73c57@baylibre.com>
 <4d916221-d9ea-4e08-8d22-1be1982323ee@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <4d916221-d9ea-4e08-8d22-1be1982323ee@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_072014_349934_947F820A 
X-CRM114-Status: GOOD (  20.37  )
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



On 02/04/2025 15:03, AngeloGioacchino Del Regno wrote:
> Il 02/04/25 12:51, Alexandre Mergnat ha scritto:
>> The mt6357 RTC was failing when using the `hwclock -r --verbose` command,
>> despite reading correctly through sysfs. There is high chance for other
>> platform to be impacted by the year offset handling issue.
>>
>> The hardware RTC registers store years relative to 1968, but the driver
>> wasn't consistently applying the offset when converting between
>> hardware and Linux time representation.
>>
>> This inconsistency caused alarm rollover failures during device
>> registration, with the error "alarm rollover not handled -22" in the
>> logs, causing hwclock commands to fail.
>>
>> The ioctl interface used by the hwclock command requires proper time
>> range validation that wasn't happening with the inconsistent year
>> offsets.
>>
>> Fixes the issue by applying the year offset in all operations:
>>     - Adding (RTC_MIN_YEAR - RTC_BASE_YEAR) when reading from hardware
>>     - Subtracting the same offset when writing to hardware
>>     - Using the same logic for both regular time and alarm operations
>>
>> With these changes, the hwclock command works correctly and time
>> values are consistently handled across all interfaces.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   drivers/rtc/rtc-mt6397.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
>> index 692c00ff544b2..ba52e225dc8fa 100644
>> --- a/drivers/rtc/rtc-mt6397.c
>> +++ b/drivers/rtc/rtc-mt6397.c
>> @@ -77,7 +77,8 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
>>       tm->tm_mday = data[RTC_OFFSET_DOM];
>>       tm->tm_wday = data[RTC_OFFSET_DOW];
>>       tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
>> -    tm->tm_year = data[RTC_OFFSET_YEAR];
>> +    /* The RTC registers store years since 1968 (hardware's base year) */
>> +    tm->tm_year = data[RTC_OFFSET_YEAR] + (RTC_MIN_YEAR - RTC_BASE_YEAR);
> 
> This patch received a NACK because of RTC_MIN_YEAR_OFFSET.
> 
> What you're doing here is avoiding to use the "RTC_MIN_YEAR_OFFSET" definition name
> but otherwise doing the very same thing that was NACKed before.

You're right sorry. In my mind, the rtc framework was working well, then I try-hard to
fix the issue in this driver... but I was wrong. :(
The RTC framework have issues so fixes should be in the framework directly. My next suggestion:
https://lore.kernel.org/r/20250109-enable-rtc-v3-0-f003e8144419@baylibre.com


-- 
Regards,
Alexandre

