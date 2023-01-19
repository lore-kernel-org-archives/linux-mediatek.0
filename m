Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61238C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWUY+nGMwQRRn9qKV3OMcfKlHJ0IrJJCjkoiQnnNiJE=; b=4CwsvOrtctPyOUnQyIatYN0WyO
	4E3AJPMbbqlOewcbU4fvwYMJlxNwaFa/heBylAKk4MJ8Ys/7o2pObYHnK9o1Cv+tSPKX6zkr3szC9
	GgAJxnbkWLWmTzaIN7pWKG7nRReu2cv8kootueFa3oATVBvZBGix3Wz2fLOowXT7JEaxIhfleAZ9Z
	ppyc0kU3zkLShL92Ck/rLIQY4NeC3oA/T4GBspWH875Gi+Za1bDwevemjONdf6VTzpAz4yIwNLgUC
	zN6wgE9szvZH4XgHG3TPH9iR9W+/Mcc86cIizLHmIgK55EVUbQCG8O9y7GObMYmVwr8BHEDq8aTtN
	ZjvmAKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIajY-0070K3-2l; Thu, 19 Jan 2023 19:38:00 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIaj8-0070Bx-Dx; Thu, 19 Jan 2023 19:37:39 +0000
Received: by mail-ej1-x634.google.com with SMTP id kt14so8472139ejc.3;
        Thu, 19 Jan 2023 11:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWUY+nGMwQRRn9qKV3OMcfKlHJ0IrJJCjkoiQnnNiJE=;
        b=Z4OiSgGlE0/HqZproBTYFHawXPoWq6Y9lq7aytkKanyqbAxcFn/IhnzTwcBT7ufpFm
         VgkzcQr5W2SUjcIptV7XcVBIK8opxIYkiT0aOjLx1PL8sd+qzDQu2tv9ynfiiMhu7GLZ
         JL3/MzBzKMdWVFRVuI6OtPntTwf26zQjIBS+VvOr4dKmGYjHzhrKGL1jQ6BwKOlbcPFX
         89gKG/t7d4PlCKlNCEHI99vESX8SPmAlXNAHNhESLWCsYqu5l2j0FmrvxRiXAZnPg0oq
         HIEHVP76V5fHn+AArHLe9oOj4044MMzWuqloik4ZbIgA36uXKOZ/oXWo3I6xpDmg5lpX
         Ckrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TWUY+nGMwQRRn9qKV3OMcfKlHJ0IrJJCjkoiQnnNiJE=;
        b=SKAsmECJBKDGkcJjczC+LYVY6PcZcI9gEKiLPXZpOvCxgBBMBIobApvdkbvaJ7uXEu
         7Vzy3JehejYV7CA9ZdtX8pmv2jILI+BqIwiAwLuK9O16b0kiozS3ZX43gJ28/E9Na2OW
         5pkhgY10/PMIwiA9SEXSptvkmf3Q/JLQuma1+3qfP15jLgtMaMiTHKo32Ft64h/WoPqv
         SL++pkwznhFf/dea+u795Pg03uovIuGzI2cMnE1+cOMQfUXQIYFTxKtT2hQrxv9WJzbR
         oWFrWY7QiTc6wi3M4VZKqcrqP2lYB/bNlrdPr4PzPBJAPuWCRo1vV3+bqYzgmZB1iTPM
         qisQ==
X-Gm-Message-State: AFqh2krs0+6inNU+tn4SLqSj2VXlZxUmbztvMHda67TCluE8cLtSjXol
	689xitb6JnOijtpH0zT0Tq4=
X-Google-Smtp-Source: AMrXdXs7cTdwMd4l/GYKEkUZlgXHRmArxsYaAYbuWxd/uQ48tWPmsVrg2sQxrbWFBYuOW5+e25gd9g==
X-Received: by 2002:a17:906:52d0:b0:870:5496:26c0 with SMTP id w16-20020a17090652d000b00870549626c0mr12054824ejn.34.1674157050955;
        Thu, 19 Jan 2023 11:37:30 -0800 (PST)
Received: from ?IPV6:2a01:c23:c477:4300:3c6e:3915:fc5a:2ff1? (dynamic-2a01-0c23-c477-4300-3c6e-3915-fc5a-2ff1.c23.pool.telefonica.de. [2a01:c23:c477:4300:3c6e:3915:fc5a:2ff1])
        by smtp.googlemail.com with ESMTPSA id y16-20020a1709063a9000b0084ce5d5d21bsm16722676ejd.22.2023.01.19.11.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 11:37:30 -0800 (PST)
Message-ID: <c6d797f8-8177-75c7-4522-eea3da6b56d8@gmail.com>
Date: Thu, 19 Jan 2023 20:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3] mmc: meson-gx: fix SDIO interrupt handling
In-Reply-To: <CACMGZgaS7z2YoViA3jV-gVBvASSq1maiGj_6hfrJQ3zr69esgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_113734_573464_8F184711 
X-CRM114-Status: GOOD (  26.76  )
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
>>
>>> Supposedly this is fixed in their codebase.
>>
>> Which codebase do you mean? A specific vendor driver? Or firmware?
> 
> The vendor driver from openlinux2.amlogic.com handles SDIO interrupts
> a bit differently. It uses mmc_signal_sdio_irq()
> 
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

One more thought:
When checking device tree I found that my system uses IRQ_TYPE_LEVEL_HIGH
for the SDIO interrupt. meson-g12-common.dtsi uses IRQ_TYPE_EDGE_RISING
in mainline Linux, however vendor kernel uses IRQ_TYPE_LEVEL_HIGH
in meson-g12-common.dtsi. A wrong interrupt trigger type may result in
lost interrupts.
So you could check which trigger type your system uses for the SDIO interrupt.
If it's IRQ_TYPE_EDGE_RISING, re-test with IRQ_TYPE_LEVEL_HIGH.








