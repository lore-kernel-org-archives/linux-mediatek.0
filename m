Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2DFC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 19:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7z310ECkIF8ZIDTjgg46Q2v6BcKj9bWP+Nfq0LTJRc=; b=PcP/wwQT0sYM39kdxE8lSl9R2d
	yMEZZKXkJAMBvk09SGvhIgvkqZNBekWaR90aIdrBnNYYXL6+Q9zylxsb6xsDaEgGwx+HPMafnZ2Do
	4A0D45DV5ogMnZPcaScFkF78/VVMx/VNaCiF1YOLiWzQNa+8L505WOs5KKYrQoqYnSXlrtI/tE8uB
	EqECcqvwgTy8tA2FNLxF19vDux6aOnDT+1/TQqsP77iABc2LBA9d6lrpASWJYhZdTtio8JbzEUZDo
	3YeiL1xx6hkANzS4rmQuMbha7DXk8JtNGtTk8lnxcbts2tIo04zJow1JCOykHz6JZOCxiTxmV3i+V
	4pNhTLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPqKE-00Gm0p-RO; Wed, 08 Feb 2023 19:41:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPqK3-00Glxm-IP; Wed, 08 Feb 2023 19:41:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id ud5so35876ejc.4;
        Wed, 08 Feb 2023 11:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7z310ECkIF8ZIDTjgg46Q2v6BcKj9bWP+Nfq0LTJRc=;
        b=Mroeh/8th/XwtYv26Sgqcd48ZPjIM1GUF974znlhRjfZMzt2NBOUrJhxf7RIgxdDkX
         cjiQSKg89WtgJMu4Vw3siG+9stoukZwpl20r0BgqVAkXaP3j9SJFMxA45X/I8ve1J9uO
         r1f3NcKfvVXNm8LkAJKQyDU3+DWG9+UFA6BLw6OGRADHQZAjHD57rUCDXjpTEGvdh/Zp
         G7OW2rvcRBH72JEzh28dr9xS0wkAO4Q0ZrbY+XL7S3q/IRRud85UNkhtxnYuW0eD29GJ
         7eqvbTm7IrMdSgHUB7g16F1Ij2ErtE6TFlkjgUSalGuQmVId08GzmKgR67kL386yhLoq
         Q1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7z310ECkIF8ZIDTjgg46Q2v6BcKj9bWP+Nfq0LTJRc=;
        b=LPCBvb26oTkNB3sY2H4stGYQNS0fLdJ2JPGXD7XtGSt5a4mD+NLE5CHKNlgadH+ui8
         HVXfHdUndjOykTCF1V/1AQ0vbPdmDa3AnxE8bD3/ZSQ7ENeuGaGPn1ax30z/z/dhEM9y
         CO1ff5J3Hjk8VocZcKoSHCOT2KhWZxnJGFnggiF8wSue2/SlBvzAyj7DwWNmHihv2bWw
         QcYdc44AwH6lr3OEeaJPncQ5+0mf8N4pgOds/FeVqiI7kjYGhAqyu3tKgHwU6/LSlpr2
         BsltI2XukyRRs0eBPiUtxlHOCWu6H2Lk2OS1CuYOVbsupD0gyA8LORO7XPECq8KOSk95
         BmdA==
X-Gm-Message-State: AO0yUKV1Voz6ISaEuf8J9+XMfu3CHHhKxFPifc0tiXYQ2aNmhTOFRNrQ
	Ff+IGiMr3cS0QVAAGFusQdk=
X-Google-Smtp-Source: AK7set83+61MVaW4S6ceQAaGahYCU3F+Hgxy4cs9xFCZi6NAZ1C3uFpcRZ2vZUKegoRj8a/2D9BL8A==
X-Received: by 2002:a17:907:d19:b0:884:26ec:388b with SMTP id gn25-20020a1709070d1900b0088426ec388bmr11909072ejc.39.1675885294997;
        Wed, 08 Feb 2023 11:41:34 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g18-20020a170906595200b00878775876c5sm8759827ejr.73.2023.02.08.11.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 11:41:34 -0800 (PST)
Message-ID: <ad3a5c30-5062-55ae-7908-c0a127bec5ee@gmail.com>
Date: Wed, 8 Feb 2023 20:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] time/sched_clock: Export sched_clock_register()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230208094813.20874-1-walter.chang@mediatek.com>
 <20230208094813.20874-2-walter.chang@mediatek.com>
 <e1a89a4e-8a0d-47e1-a8fd-75ea152ef816@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <e1a89a4e-8a0d-47e1-a8fd-75ea152ef816@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_114139_659409_9CFB095C 
X-CRM114-Status: GOOD (  17.23  )
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



On 08/02/2023 15:24, Krzysztof Kozlowski wrote:
> On 08/02/2023 10:48, walter.chang@mediatek.com wrote:
>> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>
>> clocksource driver may use sched_clock_register()
>> to resigter itself as a sched_clock source.
>> Export it to support building such driver
>> as module, like timer-mediatek.c
>>
>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>> ---
>>   kernel/time/sched_clock.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
>> index 8464c5acc913..8e49e87d1221 100644
>> --- a/kernel/time/sched_clock.c
>> +++ b/kernel/time/sched_clock.c
>> @@ -150,8 +150,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
>>   	return HRTIMER_RESTART;
>>   }
>>   
>> -void __init
>> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
> 
> Is there a non-init caller?
> 
>>   {
>>   	u64 res, wrap, new_mask, new_epoch, cyc, ns;
>>   	u32 new_mult, new_shift;
>> @@ -223,6 +222,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>>   
>>   	pr_debug("Registered %pS as sched_clock source\n", read);
>>   }
>> +EXPORT_SYMBOL_GPL(sched_clock_register);
> 
> Where is the module using it?
> 
> You need to bring users of these two changes, not just prepare something
> for your out of tree patches.
> 

I'd propose to add at least one driver that will need these changes, to make it 
clear why you need that.

Regards,
Matthias

