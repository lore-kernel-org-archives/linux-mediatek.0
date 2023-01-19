Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A91BC00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWviBnBumLa3lo5dwVP+uotrksiLTeP+2ci/rlH33Ks=; b=QBqH3GnBI4L5Wz1Vy1VSiJ2ybf
	qV2+vlkfi14OBfWJT4yBP1gB59qICKv0EG6XeYde9SZKFQ2NVQ7DZtl0ceOP56y2IgPGjLgBX8wxH
	Jqztck/17i+DGwnHYIQxdDdenv9lMQ0Db7HCxsQ+UtLpWOoNmyxHYPtrow1QCaFGro+X+n578FlEP
	6sLl3+5qpq57PObPBhgXEosqxcwz402BrJrumXQ7DK0dBJUl1KCnedmBiOdasGmAXOI42FJSBOSD5
	hyYIxJoG9+4xiDVNt6aqjQBo6HUm0Skve6vlUK2upLu3LDtrTm0buuYzWY0fOOTQgTdQofGyUkXBd
	aOF6z5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPm0-003yfp-EZ; Thu, 19 Jan 2023 07:55:48 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPk2-003y0Q-KH; Thu, 19 Jan 2023 07:53:48 +0000
Received: by mail-ed1-x530.google.com with SMTP id 18so1799994edw.7;
        Wed, 18 Jan 2023 23:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWviBnBumLa3lo5dwVP+uotrksiLTeP+2ci/rlH33Ks=;
        b=T5UxcrAvnlPwErYlYjaaCYCHK0tvutr+16i5q64bp4X1NZwevZYx+vreTJhv2pUhE3
         PBP/12VMv1h5nn0IC9NZwOoC2SlFQ5Ure1efJaReQ3zkyaNSv8H3Mxy00iTKb/L2KkKW
         VO3KEXIunNHVjNryMqxlAuWlaDnkaKJGRQ3QmqxpchlyrjhDS17RaG43TIcNHtrC3fT3
         pxBvPHF1CPX4M3m6U8ZfDk8wN+Xu2L0FyiF9cj9FctU2yX42yXY9NpH8bQvTDSBnrPuo
         PAtxU836CAuLPcgCcC7FNUgQ0UA6g9JtcKOlNHkPGv1/J1zQlJVJLuUQAox1zNmUjDTJ
         Vgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWviBnBumLa3lo5dwVP+uotrksiLTeP+2ci/rlH33Ks=;
        b=OVqxLHKVqJjQlUjvWivlz4V0p9qfQa7EmcVUs5XGvJU4tm1jEkqH6hqNN3RFiJjlyv
         UA83iWAHPoH51qI/fdfQ3Wc8PPWqblYNxOSgmSL15Khkyc5dCAHKP9hpGozBSr4X/84R
         lM2gIj5D/epeO5LPyQBTrxI96bM6BRIRC7/0z2hkSfhWqrJ7IWj15JDoEozFIL7Wm8Gy
         2he2HmQftb48SnSkeMdw4s7pWaFGhhLc1HkyJi6/8CLvSTA/WE7rlAbF+9/MxEd23G5g
         +T0Vyi6RVAlHsGl2t02is3cr0LHwkI8Auw01UU/lcEnp3XWWrnhDRseXHk1zck8XBqh4
         6jzA==
X-Gm-Message-State: AFqh2kqJm08n+5ULMSWxJEnA3+MR5KnqLutRb3pPXzXcL+Dak2vg/ufE
	YikXX8vKFOiGWl4iNWWG5nhO7Cda7UM=
X-Google-Smtp-Source: AMrXdXtC1FhLxOa5uddlJTrPG2c8t/oFYkLbKvmlT6Q60PgvJzzurTbjwq5gdVLJM7BwN/R3/hD20A==
X-Received: by 2002:aa7:c44d:0:b0:46c:b919:997f with SMTP id n13-20020aa7c44d000000b0046cb919997fmr870882edr.17.1674114823272;
        Wed, 18 Jan 2023 23:53:43 -0800 (PST)
Received: from ?IPV6:2a01:c23:c477:4300:6902:d630:fe6:8186? (dynamic-2a01-0c23-c477-4300-6902-d630-0fe6-8186.c23.pool.telefonica.de. [2a01:c23:c477:4300:6902:d630:fe6:8186])
        by smtp.googlemail.com with ESMTPSA id w1-20020aa7dcc1000000b0047a3a407b49sm15278976edu.43.2023.01.18.23.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 23:53:42 -0800 (PST)
Message-ID: <e40f8fec-58b0-cb93-7858-6ac143b83747@gmail.com>
Date: Thu, 19 Jan 2023 08:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Peter Suti <peter.suti@streamunlimited.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <52861a84-0fe2-37f0-d66a-145f2ebe1d79@gmail.com>
 <20221214134620.3028726-1-peter.suti@streamunlimited.com>
 <c6863a3e-8855-50fe-25cb-0b38bc3a05e0@gmail.com>
 <CACMGZgZY4Zb+3vHUDAS0+3r55K4_J40dtbsTPTFZMd6duBikpQ@mail.gmail.com>
 <7c4aa0d2-d8e9-416b-b2ad-f5c3c8ea33de@gmail.com>
 <CACMGZgaS7z2YoViA3jV-gVBvASSq1maiGj_6hfrJQ3zr69esgQ@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3] mmc: meson-gx: fix SDIO interrupt handling
In-Reply-To: <CACMGZgaS7z2YoViA3jV-gVBvASSq1maiGj_6hfrJQ3zr69esgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_235346_731867_0269BB91 
X-CRM114-Status: GOOD (  30.94  )
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

On 18.01.2023 14:32, Peter Suti wrote:
> On Thu, Jan 12, 2023 at 10:27 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 09.01.2023 12:52, Peter Suti wrote:
>>> On Wed, Dec 14, 2022 at 10:33 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>>
>>>> On 14.12.2022 14:46, Peter Suti wrote:
>>>>>
>>>>> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
>>>>> index 6e5ea0213b47..7d3ee2f9a7f6 100644
>>>>> --- a/drivers/mmc/host/meson-gx-mmc.c
>>>>> +++ b/drivers/mmc/host/meson-gx-mmc.c
>>>>> @@ -1023,6 +1023,22 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>>>>>       if (ret == IRQ_HANDLED)
>>>>>               meson_mmc_request_done(host->mmc, cmd->mrq);
>>>>>
>>>>> +     /*
>>>>> +     * Sometimes after we ack all raised interrupts,
>>>>> +     * an IRQ_SDIO can still be pending, which can get lost.
>>>>> +     *
>>>>
>>>> A reader may scratch his head here and wonder how the interrupt can get lost,
>>>> and why adding a workaround instead of eliminating the root cause for losing
>>>> the interrupt. If you can't provide an explanation why the root cause for
>>>> losing the interrupt can't be fixed, presumably you would have to say that
>>>> you're adding a workaround for a suspected silicon bug.
>>> After talking to the manufacturer, we got the following explanation
>>> for this situation:
>>
>> To which manufacturer did you talk, Marvell or Amlogic?
> 
> Amlogic
> 
>>
>>> "wifi may have dat1 interrupt coming in, without this the dat1
>>> interrupt would be missed"
>>
>> I don't understand this sentence. W/o the interrupt coming in
>> the interrupt would be missed? Can you explain it?
> 
> So the "without this" part of that sentence referred to the patch.
> Which means that without the patch, the interrupt can be missed.
> 

Did you ask Amlogic for the root cause of the problem? Silicon bug?

>>
>>> Supposedly this is fixed in their codebase.
>>
>> Which codebase do you mean? A specific vendor driver? Or firmware?
> 
> The vendor driver from openlinux2.amlogic.com handles SDIO interrupts
> a bit differently. It uses mmc_signal_sdio_irq()
> 
This is the legacy API for SDIO irq.

>>
>>> Unfortunately we were not able to find out more and can't prepare a
>>> patch with a proper explanation.
>>
>> The workaround is rather simple, so we should add it.
>> It's just unfortunate that we have no idea about the root cause of the issue.
> 
> After doing a more long term stress test, it was revealed that this
> patch is still not sufficient, but only masks the underlying problem
> better. Reverting 066ecde fixes the issue fully for us (verified
> overnight with iperf).
> v1 and v2 also fix the issue, but v3 does not correct the bug when
> WiFi is stressed for a longer time. And therefore it should not be
> used.
> Could you please give us some advice on how to investigate this further?

When talking about v2 of the patch, it includes a number of actual changes:

- hold lock from start to end of interrupt handler
- if SDIO irq was disabled when entering the irq handler I see no change
- if SDIO irq was enabled
  - disable SDIO irq at start of irq handler, no matter which type of interrupt was received
    -> means disable SDIO irq during irq handler even if some other interrupt was received
  - if SDIO and another interrupt source flag is set, leave irq handler with SDIO irq enabled.
    Not sure whether that's intentional, you can use the small patch listed below on top of v2
    to check whether SDIO irq still works ok or not.
    

At least to me it's not clear which (or all?) of the changes are needed to work
around the problem. So you could check whether SDIO irq still works fine if you
remove a single change from the patch.


diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index f4b102b85..711431706 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -994,6 +994,7 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 			spin_unlock(&host->lock);
 			return IRQ_HANDLED;
 		}
+		irq_enabled = false;
 	}
 
 	if (WARN_ON(!cmd))
-- 
2.39.0



