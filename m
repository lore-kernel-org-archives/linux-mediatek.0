Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B7CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDczMK6QGEx7AYRb10cj/ES1Fdkv4zSuiKYZ9KoSqzc=; b=msy61rOqpziJlqwjGhA3ye9QP1
	WUghewJLycFW1yWSXjI51pfQ8hHnUgxP7oo0rkZVC6HmeCZekiAA8NtfGxGYcljMi7TE9G+0O2pwh
	6cYEAiCWAg/ElpvgUVPkl7SVYfzQzCfRVkEQ8ycxTRVd9aCoLRSVVlgmJfp4qFX8vtKueG2siv1Js
	rSGP1f3YkwFf2kh6pi2KYq7sFtx19AvODgE/FKRNQgmarHW4WUUCvMQdylpPLTKTmzbDxwoqG2wkz
	2rqaaB1ziOndBnr5gDqwZRgGSFGCZAC7vcOGwwD938sp7dPI5G44QdfsRn7fQVtLFc1B9BWV8Kd4m
	l/SovCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWqK-00FN4p-AU; Thu, 02 Feb 2023 10:29:24 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWqG-00FN3j-Kl; Thu, 02 Feb 2023 10:29:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id mc11so4545882ejb.10;
        Thu, 02 Feb 2023 02:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDczMK6QGEx7AYRb10cj/ES1Fdkv4zSuiKYZ9KoSqzc=;
        b=oP3VnnlVakoXFC9lbChPggPB9j9in358xpuyk+vcZBZb0NTWI7uVQV6KbF8KJpDRON
         wLMVr1Cy4Zz7uAOqv0gKvGSs1VLJ0KCYgsNsycLnoo3XNlxE2kJ3YANyJhR24E+1zZH8
         oOWYZQWjjV1hg08sOGZqLLGDH5m9w5QUhBA1fMdtzPoQpKmR3R2VI9ZvsiFkVp/jjtw1
         KzQk92qeACoWACloKIe+kmukTTBgu7XA7Cjve+fwDYT1HqaNJRR3XG4EyODFVUNVm04Y
         mOoBuz5EBw6HKJtI+oioBLPZTfU/eLUjwtCwhhwD0loUri9XqtS42zo3I6b5l6T/rqSY
         FYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDczMK6QGEx7AYRb10cj/ES1Fdkv4zSuiKYZ9KoSqzc=;
        b=NNjIFos9KOt8AKSC6FMKTUci8ef4opnFe5DICFIC8Cahh5CgmNAivIz2NuyQNg6Olz
         Z9Nu+KNmf7UIxVif6NJnW9zMbliGIK52pzQOVJFVHSCz9bD7CPI38AwB9sxUgbhALIZM
         aqK7s+NjC/HSJ/i1lZMrg8//Sl+Jys6Uv17YwD7bJMYSmsLJ7cFdjLUABqCn979Z9BxN
         7ezXZ3k7K9dxtSzm10EqoYHJ5iM7W6jJ0dHzsKBI4fxIMrfO7l1J5fPgyTNrAtQUHbbQ
         SUj5xEeps4ckWQyQlSgZ5lRajOm1d+nDeAkGzhRoLUJNZnAnExxYZMZ95i6uAeiPWi3K
         M+MA==
X-Gm-Message-State: AO0yUKWNKPznmrdpMYyyOy0ymejh9+OTc6gxAEH98BirThou8jojYtJg
	9QScB1owXKOe19rn/MzFnHM=
X-Google-Smtp-Source: AK7set8z0SSifew38k/iqNDwEMvNSGdYPJ1KAUjZU2aBmDo8a+C3AQh/Oj8czl6jgs5LGPJXmyEGVA==
X-Received: by 2002:a17:906:885:b0:87b:d3fa:79f2 with SMTP id n5-20020a170906088500b0087bd3fa79f2mr6259755eje.19.1675333757590;
        Thu, 02 Feb 2023 02:29:17 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t15-20020a170906268f00b008888f4120d4sm6114171ejc.129.2023.02.02.02.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:29:16 -0800 (PST)
Message-ID: <68d19d2b-0613-f1b4-08ff-9d86f5021f9f@gmail.com>
Date: Thu, 2 Feb 2023 11:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: =?UTF-8?B?Um9nZXIgTHUgKOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>,
 "eballetbo@gmail.com" <eballetbo@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "drinkcat@google.com" <drinkcat@google.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?SmlhLXdlaSBDaGFuZyAo5by15L2z5YGJKQ==?=
 <Jia-wei.Chang@mediatek.com>, =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?=
 <fan.chen@mediatek.com>
References: <20230111074528.29354-1-roger.lu@mediatek.com>
 <20230111074528.29354-6-roger.lu@mediatek.com>
 <5192bc94-12c7-dce4-c2e6-fa4b8c1ced9d@gmail.com>
 <546d7f2b3607310f0ebe11b3d4e0aac40ac44c7a.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 05/14] soc: mediatek: mtk-svs: use svs clk control APIs
In-Reply-To: <546d7f2b3607310f0ebe11b3d4e0aac40ac44c7a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_022920_717844_9941FBDF 
X-CRM114-Status: GOOD (  21.73  )
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

你好，

On 01/02/2023 13:28, Roger Lu (陸瑞傑) wrote:
> Hi Matthias Sir,
> 
> On Tue, 2023-01-31 at 14:19 +0100, Matthias Brugger wrote:
>>
>> On 11/01/2023 08:45, Roger Lu wrote:
>>> In MediaTek HW design, svs and thermal both use the same clk source.
>>> It means that svs clk reference count from CCF includes thermal control
>>> counts. That makes svs driver confuse whether it disabled svs's main clk
>>> or not from CCF's perspective and lead to turn off their shared clk
>>> unexpectedly. Therefore, we add svs clk control APIs to make sure svs's
>>> main clk is controlled well by svs driver itself.
>>>
>>> Here is a NG example. Rely on CCF's reference count and cause problem.
>>>
>>> thermal probe (clk ref = 1)
>>> -> svs probe (clk ref = 2)
>>>      -> svs suspend (clk ref = 1)
>>>         -> thermal suspend (clk ref = 0)
>>>         -> thermal resume (clk ref = 1)
>>>      -> svs resume (encounter error, clk ref = 1)
>>>      -> svs suspend (clk ref = 0)
>>>         -> thermal suspend (Fail here, thermal HW control w/o clk)
>>>
>>> Fixes: a825d72f74a3 ("soc: mediatek: fix missing clk_disable_unprepare() on
>>> err in svs_resume()")
>>> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
>>
>> That looks wrong. Although I don't out of my mind, there should be a way to
>> tell
>> the clock framework that this clock is shared between several devices.
>>
>> I wonder if using clk_enable and clk_disable in svs_resume/suspend wouldn't
>> be
>> enough.
> 
> Oh yes, Common Clock Framework (CCF) knows the clock shared between several
> devices and maintains clock "on/off" by reference count.
> 

The thing is if you use clk_prepare_enable then the clock framework check's if 
the clock is already prepared, which could happen like you described in the 
svs_resume (encount error) case in the commit message. The question is, can't we 
just use clk_enable and clk_disable in resume/suspend and only prepare the clock 
in the probe function?

> We concern how to stop running svs_suspend() when svs clk is already disabled by
> svs_resume(). Take an example as below, if we refers to __clk_is_enabled()
> result for knowing svs clk status, it will return "true" all the time because
> thermal clk is still on. This causes the problem mentioned in commit message.
> 

I would expect that the kernel takes care that we can't enter a resume path for 
a device before the suspend path has finished. Honestly I don't really 
understand the problem here. It seems something different then what you 
described in the commit message.

Please help me understand better.

谢谢，再见

Matthias

> static int svs_suspend(struct device *dev)
> {
> ...
> 	if (!__clk_is_enabled(svsp->main_clk)) //always get `true`
> 		return 0;
> ...
> }
> 
>>
>> Regards,
>> Matthias
> 
> ... [snip] ...

