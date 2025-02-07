Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD84C02192
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2025 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTv0l3P8oHjIwWa0vJ1xNlM+ceYNV5pE7I4XlmUzuLU=; b=JEm1Jk6hW+fNbsTdhH35ft/Kqc
	TJ2AZm648/IudaAhNvUMkiW2pEVK2Ekz88gK+x1/eS5IV/+VUt11ELbediKRTYKaFLAWiVN+yPL8X
	JSDneM/JhcTHLtJZTjajSsLKhPdfRsnP0eu3HWweAQ7pqKRlxVLUrBNFwEwJRR1CDVdfrX0tE6nQ3
	zXLIbnpEi8GrnqEkx3DHlKqC9ncI+9Pn8g/fCHXKG160TeSpf0r1u06uuY4AGOgIHwAp45yq4NS2r
	aRyyTVk7rc57OLaWCPWTsSlZakFGGVaY5QK2lLIHNWE+idoN5qWewlAuEUzzZbMJWnxhmJPNjZJYv
	Qc0YDoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKmF-0000000933F-3p96;
	Fri, 07 Feb 2025 09:35:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKhB-00000009278-3djX
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Feb 2025 09:30:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43675b1155bso19988075e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Feb 2025 01:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738920644; x=1739525444; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTv0l3P8oHjIwWa0vJ1xNlM+ceYNV5pE7I4XlmUzuLU=;
        b=McT7dYGT+FVlZvazL4SCa5RU7xqHQstCj4qhVg5A7gA/jvRSeYRo3WOj0yda9TShZv
         g4B/YtvN2mNU/2tEbtP+yxr7ARwr4kup9DBqa0sDIWU1UEXf6kKL2Nmsl/QJ6mNohgAb
         AwcxCisMMsBt0HWePnlgNcup8zseIhfPATsG5y3pMG9QTs+UYHSkj8U6UQqN/9cpIdVf
         0nUF8edBjVxTKzAJY4KP4jnmTw4nzPIKHr72O9utbeDabxO09icloW4sezQGPvvhpUS9
         gjSFcgiKUEfXKDk5wig7w+z+18+2HLusM0yibVI9DGeeXc82UyPNf+uUmgPVSty5I23Y
         ZrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920644; x=1739525444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTv0l3P8oHjIwWa0vJ1xNlM+ceYNV5pE7I4XlmUzuLU=;
        b=uuVA+LD0Q+dP+RfC9dOb8YYsXTIxa7fiaIl31KpPaL/7tIpZtAzyFjf3452FVa6d97
         g4OiJVwm0A3rW1rGrl5Q6ImxgYzQyv5j4P+AYQ9oLEdUr60+701jMvgv7QHV99IaO6MI
         vp2X90yx7k31n5CVSyKF8F4DCoiFkFyYpuOpxngWywgtOL71wfvewK7oJRB/T0Iw5xPm
         sjPhL89f+yRzUzrOSFOZ6l4JIORVqt9uFLgcCuEci1DfdL21dYSeiRyVq1c+pw0EvUnS
         0Dz63yJqzrMsHzkyx5enYOtq4QdQ2c2W2pUIFqMu1N2quW46wy8RHVkszKAWmwO46E+O
         LmVA==
X-Forwarded-Encrypted: i=1; AJvYcCVgcsuYxolZFxcpmy6fqmVLO+vXxEMQoNmc0d+fsH6d5psirJxSv5r63jGijwlIfycoPJCaVqWrGGTr1uJVGA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/E/7joy3CZRFXhkrAOK7kT9UOo3owQZNyhYCrhZLegHiBb7MT
	meMNPkZnmhRW0oN1sDl0POHw7n/9ViOmcfxoXCdJYMNtSPVJ7L/tb5q2oCak9W0=
X-Gm-Gg: ASbGncv7ybNwc8h3mINUolFs0mCDPp/Y9D7L5v5H8T9rpM1LkTLeR9zb7w73myoEKUY
	O6iBFOJ5hTwYYXjyYqtci4IoMGJbXbs/TCt2prvNF280QLbLA1ERmfCoANuxrsVyNHAxbZYzPGB
	r9/w7cjsJ42k54iFG/s5Nj1yyj4WI5Q049siRRVoqrczA9vWHZIQn7uUcl+peka3hhPcOsrmiLM
	suMVQ4rPA3Ju9Zg3CGABVk+delDf+P5ezMDXd7a5jQ2bHEbnz+V8vG4X2c1I1Reh4AXVD4zqvIV
	5C7bELcbvY0tltRYN8xEwL7jb2IN87xwIkMMkqTZsz0M8w8+qEcFidgVsmHo9v8=
X-Google-Smtp-Source: AGHT+IElsKs0XLYEriSWI3dDW9xTs2P0W29PLLdDtB0wMdiWa2+7KZzbYDArv0YRFXODUIVGn6d1iQ==
X-Received: by 2002:a05:600c:4ece:b0:436:1971:2a4 with SMTP id 5b1f17b1804b1-439249913damr19584105e9.17.1738920643824;
        Fri, 07 Feb 2025 01:30:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94dd1esm85365915e9.16.2025.02.07.01.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:30:43 -0800 (PST)
Message-ID: <82b5b5d6-2009-45d6-bb4e-517b8978b88c@baylibre.com>
Date: Fri, 7 Feb 2025 10:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rtc: mt6359: fix year issue
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
 <20250109-enable-rtc-v1-2-e8223bf55bb8@baylibre.com>
 <202501091546387cff95fd@mail.local>
 <49b100ae-9b81-404d-b64c-93c60baa859f@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <49b100ae-9b81-404d-b64c-93c60baa859f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_013045_916919_00AB71F1 
X-CRM114-Status: GOOD (  31.91  )
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

Hello Alex and Angelo

Thanks for your comments

Angelo, IMHO, "regmap_read_poll_timeout", mutex, RTC_PROT, register read/write,... aren't related to 
this issue (but I've verified anyway to be sure and everything works as expected ;) )

After digging a bit more, RTC_MIN_YEAR_OFFSET (68) hide another problems.
Please, keep in mind that I probably misunderstand how range_min, range_max, start_secs have to be use.

1)
Default driver values:
	rtc->rtc_dev->range_min = mktime64(1900, 1, 1, 0, 0, 0);
	rtc->rtc_dev->range_max = mktime64(2027, 1, 1, 23, 59, 59);
	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);

First issue is HW alarm doesn't fire.
When the PMIC is powered-on, the year register value is 42 (is it a bug or usefull feature ?)
When "hwclock -r" (read) is sent, the RTC framework steps are:
- read time from the HW registers
- set alarm
- HW alarm triggered
- read time from the HW registers
...

But the year value written during the "set alarm" is different from 42 due to an offset issue. Then 
the alarm will trigger some years later and the timeout fire instead.

I understand that offset_secs value come from different formulas depending of the 3 variable value.
In this case, the formula is 'offset_secs = start_secs - range_min'.

Then change start_secs to mktime64(1942, 1, 1, 0, 0, 0) to have, in theory, the good offset.
But now, I don't reach the set_alarm step and have:

     Waiting for clock tick...
     ioctl(3, RTC_UIE_ON, 0): Invalid argument
     Waiting in loop for time from /dev/rtc0 to change
     hwclock: ioctl(RTC_RD_NAME) to /dev/rtc0 to read the time failed: Invalid argument
     ...synchronization failed


This issue above doesn't appear if I remove this piece of code
	/*
	 * Since the reading time values from RTC device are always in the RTC
	 * original valid range, but we need to skip the overlapped region
	 * between expanded range and original range, which is no need to add
	 * the offset.
	 */
	if (rtc->start_secs > rtc->range_min && secs >= rtc->start_secs)
		return;


Better but not over.
My current local time is 7:31:4 1-0-42 (hour:min:sec day-month-year)
Now the alarm setup value is 7:31:5 1-1-84. Compared to working setup, year value isn't consistent, 
it should be 42 instead of 84.
The removed piece of code isn't the cause of that because before removing it I've workarounded it by 
adding 8 hours (or one day) to the start_secs (mktime64(1942, 1, 1, 8, 0, 0)) and I observe the same 
issue: alarm value = 15:31:5 1-1-84 which is 8 hours and 42 years more than expected. Come back to 
the first issue, alarm doesn't fire, that make sense.

So why the alarm value is 1-1-84 instead of 1-1-42 for "start_secs = mktime64(1942, 1, 1, 0, 0, 0)" ?

2)
Playing with range allow me to find these 2 setup which have a working alarm setup and return me 
clock time : 2070/01/01, and I can't change the 2070 event if I shift the range.
In this case, the formula is 'offset_secs = range_max - range_min + 1', so change start_secs is 
useless unless I go out of the range and then, I have another issue...

	rtc->rtc_dev->range_min = mktime64(1960, 1, 1, 0, 0, 0);
	rtc->rtc_dev->range_max = mktime64(2087, 12, 31, 23, 59, 59);
	rtc->rtc_dev->start_secs = mktime64(2010, 1, 1, 0, 0, 0);
or
	rtc->rtc_dev->range_min = mktime64(2000, 1, 1, 0, 0, 0);
	rtc->rtc_dev->range_max = mktime64(2128, 1, 1, 23, 59, 59);
	rtc->rtc_dev->start_secs = mktime64(2010, 1, 1, 0, 0, 0);
or
	rtc->rtc_dev->range_min = mktime64(2004, 1, 1, 0, 0, 0);
	rtc->rtc_dev->range_max = mktime64(2132, 1, 1, 23, 59, 59);
	rtc->rtc_dev->start_secs = mktime64(2010, 1, 1, 0, 0, 0);

Note that I must add 1 day to the range_max in the 2nd & 3rd example to make it work, probably due 
to leap years ?


My first though was min and max range give the supported hardware year range, and start_secs a 
wished "software" value applying offset to the HW value. But after some try, I see a lot of 
limitations and requierements to make it "working", so I probably misunderstand how range_min, 
range_max, start_secs have to be use.


Regards
Alexandre Mergnat

On 14/01/2025 11:53, AngeloGioacchino Del Regno wrote:
> Il 09/01/25 16:46, Alexandre Belloni ha scritto:
>> On 09/01/2025 16:29:52+0100, Alexandre Mergnat wrote:
>>> Removing the RTC_MIN_YEAR_OFFSET addition and subtraction has
>>> introduced a regression.
>>>
>>> ~# hwclock -r --verbose
>>> hwclock from util-linux 2.37.4
>>> System Time: 1262312013.143552
>>> Trying to open: /dev/rtc0
>>> Using the rtc interface to the clock.
>>> Assuming hardware clock is kept in UTC time.
>>> Waiting for clock tick...
>>> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
>>> ...synchronization failed
>>>
>>> Bring back the RTC_MIN_YEAR_OFFSET to fix the RTC.
>>>
>>
>> NAK, you'd have to investigate a bit more, I want to get rid of the
>> RTC_MIN_YEAR_OFFSET insanity.
>>
> 
> If literally all currently supported MediaTek PMICs RTC are working fine (and
> it's not just one), but the one that is introduced here has issues, clearly
> the problem is *not* about the min_year_offset not being there, I'd say!
> 
> Btw:
> "hwclock: select() to /dev/rtc0 to wait for clock tick timed out"
> ...is the WRTGR write failing? :-)
> 
> And no, Alexandre M, don't trust the regmap_read_poll_timeout() to return an
> error, I'm not sure that the CBUSY gets set to zero for *literally all* failures...
> 
> In particular.... some RTCs are *locked* and need to be *unlocked*, and in that
> case I'm not sure if the write just goes through but gets ignored or if CBUSY
> stays set.
> 
> Anyway, check the RTC_PROT register for the unlocking mechanism :-)
> 
> Cheers,
> Angelo
> 
>>> Fixes: 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for start-year")
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>   drivers/rtc/rtc-mt6397.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
>>> index 55e75712edd4..9930b6bdb6ca 100644
>>> --- a/drivers/rtc/rtc-mt6397.c
>>> +++ b/drivers/rtc/rtc-mt6397.c
>>> @@ -96,6 +96,12 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
>>>               goto exit;
>>>       } while (sec < tm->tm_sec);
>>> +    /* HW register use 7 bits to store year data, minus
>>> +     * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
>>> +     * RTC_MIN_YEAR_OFFSET back after read year from register
>>> +     */
>>> +    tm->tm_year += RTC_MIN_YEAR_OFFSET;
>>> +
>>>       /* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
>>>       tm->tm_mon--;
>>>       tm->tm_wday--;
>>> @@ -110,6 +116,7 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
>>>       int ret;
>>>       u16 data[RTC_OFFSET_COUNT];
>>> +    tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>>>       tm->tm_mon++;
>>>       tm->tm_wday++;
>>> @@ -167,6 +174,7 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>>>       tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
>>>       tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
>>> +    tm->tm_year += RTC_MIN_YEAR_OFFSET;
>>>       tm->tm_mon--;
>>>       return 0;
>>> @@ -182,6 +190,7 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>>>       int ret;
>>>       u16 data[RTC_OFFSET_COUNT];
>>> +    tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>>>       tm->tm_mon++;
>>>       mutex_lock(&rtc->lock);
>>>
>>> -- 
>>> 2.25.1
>>>
>>
> 
> 

-- 
Regards,
Alexandre

