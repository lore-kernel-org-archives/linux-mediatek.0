Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A1FC4321E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 11:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkFIY9JgDQLOA0YES2IiXZL62YgCJOVKQUBToHrTrkc=; b=V5xXgcxDE9Vi9h
	Sdyezz+zxWmuO1A4JGvRwxeM9rzXZzT5mf7EamYx5H/cRtEsO5u2/V/L73GczcV3l6K28Tc9qmg+C
	tzY0ZRHIXgafv7WdYaBfFaHOrQXyWyHBE/NUCfkV67FrkxIIiziWQAuvdKhY2aOi8BDYEhAkktXec
	/W+LHaunwZBPIMoubyBgLJEg+LNVk2IxjsMBLeWFl0NmqWnji+Mj3utMc0w1bGJjWC6+IxBIe0UnQ
	wbW5p+OkDmezOOJbaU/30J8T2TaXWCWrLXJaPAwuGDo0mgg5fx1MjEOo3pxNtIVuKJTnGOoQ2lBIb
	5Lgzt413gVW3ePEZX8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13n1-00Fopp-1h; Fri, 02 Dec 2022 11:01:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13mi-00FogN-4R; Fri, 02 Dec 2022 11:00:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 077756602BBC;
	Fri,  2 Dec 2022 11:00:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669978844;
	bh=ImyF3LBwQuJj0NtUGxM/9EVhT91WQ2WRRYpMkYLSKTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UtsUdwd2wxqzJ9t310+AggFqfN1AOlhV/PJPNW9X7H319Xyz1NdP1PYb8gNBWy2AI
	 7JFORXfkuAYKPXdzLAy1ky6CpTYp/HIHksJkbU/Vzv72IJz2rxWSnY2JbUYXY6VVoo
	 YCgrE0A7IQEJVucgwStgxhnv4wViwXKUW5EzHBcASRlRGAXGQuwqnsK+YkxMLSQV3n
	 X0R4wvC3xAWuUvBMJRIBmbuEubu9ZoQRedi7e5kq8q8k+K696BIfYtUJs0mBPRWdw9
	 B4i0/tqyj4aKpUsWxXMq9KdUsPn+/DX4yu4FNI+hlQXIUSnJXKBbQmyu7Bj92Xus4m
	 QOSvrDb7zqP8A==
Message-ID: <37468027-6a27-dcb8-9c14-8f8426ec50d1@collabora.com>
Date: Fri, 2 Dec 2022 12:00:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
 <eb142a22-b35e-ec3f-ee0a-9e3e7b24cea6@gmail.com>
 <bf8d2a8f-7654-29be-1104-a842c6657b5e@systemli.org>
 <02c2c955-940b-b315-0474-85d0eddad7a3@leemhuis.info>
 <Y4jHvomTrU8guBox@makrotopia.org>
 <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
 <20221202052716.uj3kzkunazmgazeq@vireshk-i7>
 <0ebef1a2-6b5a-04b9-a79b-79eb3349c32b@collabora.com>
 <c76bd301-0e8d-2d2b-0d3e-a57ece9b496f@collabora.com>
 <b1822bbc3775730c4cedf9652323c7d72e663e4b.camel@mediatek.com>
 <8be3e050-f32a-6761-8ebd-49c38dfcf9eb@collabora.com>
 <c186d104-43e0-ca10-3ce2-c2f922acd8bf@leemhuis.info>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c186d104-43e0-ca10-3ce2-c2f922acd8bf@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_030048_514401_8AFC77D8 
X-CRM114-Status: GOOD (  27.27  )
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
Cc: "vincent@systemli.org" <vincent@systemli.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "daniel@makrotopia.org" <daniel@makrotopia.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "thomas.huehn@hs-nordhausen.de" <thomas.huehn@hs-nordhausen.de>, =?UTF-8?B?SmlhLXdlaSBDaGFuZyAo5by15L2z5YGJKQ==?= <Jia-wei.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/12/22 11:41, Thorsten Leemhuis ha scritto:
> On 02.12.22 11:02, AngeloGioacchino Del Regno wrote:
>> Il 02/12/22 10:43, Allen-KH Cheng (程冠勳) ha scritto:
>>>
>>> Jia-wei is working on this issue.
>>> We will update progress ASAP.
>>>
>>
>> I think I've found something: the MT7622/7623 voltage constraints
>> set in mediatek-cpufreq's platform data seem to be wrong.
> 
> Thx for looking into this.
>> I've sent a commit to fix those [1]
> 
> Quick question: is that relative to apply at this point of the 6.1 devel
> cycle? Or would it be better to revert the culprit (already introduced
> in 5.19) for now and reapply it together with that fix for 6.2 (and then
> backport to 6.1 stable later)?
> 
>> and that should solve the issue
>> that was seen on MT7622, but the code in the voltage tracking algorithm
>> is unsafe: this crash should be happening because we may be calling
>> regulator_set_voltage() with max_uV < min_uV --- and this is not legal.
> 
> [...]
> 
>> [1]:
>> https://lore.kernel.org/lkml/20221202095227.167492-1-angelogioacchino.delregno@collabora.com/
> 
> Side note, that patch afaics should have:
> 
> Reported-by: Nick <vincent@systemli.org>
> Link:
> https://lore.kernel.org/r/930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org/
> 

I'm sorry, forgot about those. I'll wait for feedback on that patch first.

If Viresh can add those while applying the patch, that's fine for me - otherwise
I can send a v2 adding the two suggested missing tags.

Thanks all!
Angelo

> To explain: Linus[1] and others considered proper link tags important in
> cases like this, as they allow anyone to look into the backstory of a
> commit weeks or years later. That's nothing new, the documentation[2]
> for some time says to place tags in cases like this. I care personally
> (and made it a bit more explicit in the docs a while ago), because these
> tags make my regression tracking efforts a whole lot easier, as they
> allow my tracking bot 'regzbot' to automatically connect reports with
> patches posted or committed to fix tracked regressions.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> [1] for details, see:
> https://lore.kernel.org/all/CAHk-=wjMmSZzMJ3Xnskdg4+GGz=5p5p+GSYyFBTh0f-DgvdBWg@mail.gmail.com/
> https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/
> https://lore.kernel.org/all/CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com/
> 
> [2] see Documentation/process/submitting-patches.rst
> (http://docs.kernel.org/process/submitting-patches.html) and
> Documentation/process/5.Posting.rst
> (https://docs.kernel.org/process/5.Posting.html)
> 
> 
> 
>>> Thanks,
>>> Allen
>>>
>>> On Fri, 2022-12-02 at 10:19 +0100, AngeloGioacchino Del Regno wrote:
>>>> Il 02/12/22 09:57, AngeloGioacchino Del Regno ha scritto:
>>>>> Il 02/12/22 06:27, Viresh Kumar ha scritto:
>>>>>> On 01-12-22, 16:39, Thorsten Leemhuis wrote:
>>>>>>> Thx for clarifying. And I noticed I made a mistake: I should
>>>>>>> have
>>>>>>> directed my earlier question wrt to any progress here more into
>>>>>>> the
>>>>>>> direction of Jia-Wei Chang (who authored 6a17b3876b) and Viresh
>>>>>>> Kumar
>>>>>>> (who committed it).
>>>>>>
>>>>>> I was waiting for the platform maintainers to come up with a fix.
>>>>>> I
>>>>>> have sent a patch now to revert this, in-reply-to this thread.
>>>>>>
>>>>>> Please confirm this is working fine. Thanks.
>>>>>>
>>>>>
>>>>> Can you guys try this patch that I've sent a while ago?
>>>>>
>>>>>
>>> https://lore.kernel.org/lkml/20220909093724.40078-1-angelogioacchino.delregno@collabora.com/T/#u
>>>>>
>>>>> There were comments on it, but if that solves your issue I can push
>>>>> a v2
>>>>> to solve what was reported.
>>>>>
>>>>> Regards,
>>>>> Angelo
>>>>
>>>> Wait, sorry, I've re-read the stacktrace and that won't help at all.
>>>> MediaTek, can you please look at this issue?
>>>>
>>>> Reverting the proposed commit will make MT8183 unstable.
>>>>
>>>>
> 
> #regzbot monitor:
> https://lore.kernel.org/r/930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org/

-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


