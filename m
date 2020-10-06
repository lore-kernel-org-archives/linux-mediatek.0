Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F393AC41604
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 14:40:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75B5B2065C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 14:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oD0ufdWR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75B5B2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=61L6i5wV6rokDSAOk5csPhdZKxuUUbZRt/C9o2BdIa8=; b=oD0ufdWRdqpZCt0VFHz8v5l76
	PFV/lxKr8BDGLpm2a7whPngfjTUztbHNlb3BU4hijaVpVd8J5rZ2N0Qlu2b8Qa0a4JS/54wA16Xtw
	a/Wp19CO2Msc6r9U5tkQUb8NJQgxP36CnDuV8BS0rD635urlsL0uCAws6y4dsZQqNxUid0fbswMao
	hEzloRa6fXX0ty2euQlNjfbkSG8fdAjkb7qrA1uCPIHy3ISrWarrk5OG9gvixH2kCwRTAzZnGoO5w
	WaW+k7JxrGkqJXDXfRlJYCsJB4fjJEDytIDFq1yIak/5VOekb/fy1TFjwxYgSrLu2enpUH1OHEX9E
	PRLuhaD4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPo8R-0007Jl-E9; Tue, 06 Oct 2020 14:40:11 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPo8L-0007IN-L6; Tue, 06 Oct 2020 14:40:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01EE8113E;
 Tue,  6 Oct 2020 07:40:03 -0700 (PDT)
Received: from [10.57.54.147] (unknown [10.57.54.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E34B03F71F;
 Tue,  6 Oct 2020 07:39:59 -0700 (PDT)
Subject: Re: [PATCH] thermal: power_allocate: add upper and lower limits
To: Michael Kao <michael.kao@mediatek.com>
References: <20200424071601.2636-1-michael.kao@mediatek.com>
 <accb83e0-ffbe-b6e3-6bf9-e7cc8b9fe19c@arm.com>
 <1588156776.3573.1.camel@mtksdccf07>
 <03286571-c110-7f5e-a911-24f8c3e4fd42@arm.com>
 <1598347775.16267.0.camel@mtksdccf07>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <25cb2d5b-0d87-8a22-a881-a5b6e46307ec@arm.com>
Date: Tue, 6 Oct 2020 15:39:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1598347775.16267.0.camel@mtksdccf07>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_104005_821872_4B6DBBCC 
X-CRM114-Status: GOOD (  31.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Michael,

On 8/25/20 10:29 AM, Michael Kao wrote:
> On Wed, 2020-04-29 at 21:24 +0100, Lukasz Luba wrote:
>>
>> On 4/29/20 11:39 AM, Michael Kao wrote:
>>> On Fri, 2020-04-24 at 10:22 +0100, Lukasz Luba wrote:
>>>> Hi Michael,
>>>>
>>>> On 4/24/20 8:16 AM, Michael Kao wrote:
>>>>> The upper and lower limits of thermal throttle state in the
>>>>> device tree do not apply to the power_allocate governor.
>>>>> Add the upper and lower limits to the power_allocate governor.
>>>>>
>>>>> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
>>>>> ---
>>>>>     drivers/thermal/thermal_core.c | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
>>>>> index 9a321dc548c8..f6feed2265bd 100644
>>>>> --- a/drivers/thermal/thermal_core.c
>>>>> +++ b/drivers/thermal/thermal_core.c
>>>>> @@ -598,7 +598,7 @@ int power_actor_set_power(struct thermal_cooling_device *cdev,
>>>>>     	if (ret)
>>>>>     		return ret;
>>>>>     
>>>>> -	instance->target = state;
>>>>> +	instance->target = clamp_val(state, instance->lower, instance->upper);
>>>>>     	mutex_lock(&cdev->lock);
>>>>>     	cdev->updated = false;
>>>>>     	mutex_unlock(&cdev->lock);
>>>>>
>>>>
>>>> Thank you for the patch and having to look at it. I have some concerns
>>>> with this approach. Let's analyze it further.
>>>>
>>>> In default the cooling devices in the thermal zone which is used by IPA
>>>> do not have this 'lower' and 'upper' limits. They are set to
>>>> THERMAL_NO_LIMIT in DT to give full control to IPA over the states.
>>>>
>>>> This the function 'power_actor_set_power' actually translates granted
>>>> power to the state that device will run for the next period.
>>>> The IPA algorithm has already split the power budget.
>>>> Now what happen when the 'lower' value will change the state to a state
>>>> which consumes more power than was calculated in the IPA alg... It will
>>>> became unstable.
>>>>
>>>> I would rather see a change which uses these 'lower' and 'upper' limits
>>>> before the IPA do the calculation of the power budget. But this wasn't
>>>> a requirement and we assumed that IPA has full control over the cooling
>>>> device (which I described above with this DT THERMAL_NO_LIMIT).
>>>>
>>>> Is there a problem with your platform that it has to provide some
>>>> minimal performance, so you tried to introduce this clamping?
>>>>
>>>> Regards,
>>>> Lukasz
>>>
>>>
>>> Hi Lukasz,
>>>
>>> I refer to the documentation settings of the thermal device tree
>>> (Documentation / devicetree / bindings / thermal / thermal.txt).
>>>
>>> It shows that cooling-device is a mandatory property, so max/min cooling
>>> state should be able to support in framework point of view.
>>> Otherwise, the limitation should be added in binding document.
>>>
>>> Different hardware mechanisms have different heat dissipation
>>> capabilities.
>>> Limiting the input heat source can slow down the heat accumulation and
>>> temperature burst.
>>> We want to reduce the accumulation of heat at high temperature by
>>> limiting the minimum gear of thermal throttle.
>>
>> I agree that these 'lower' and 'upper' limits shouldn't be just
>> ignored as is currently. This patch clamps the value at late stage,
>> though.
>>
>> Let me have a look how it could be taken into account in the early
>> stage, before the power calculation and split are done. Maybe there
>> is a clean way to inject this.
>>
>> Regards,
>> Lukasz
> Hi Lukasz,
> 
> After the research, do you have any ideas or suggestions?
> 
> Best Regards,
> Michael
> 

My apologies for the delay. I have done some experiments.
Could you resend the patch, please make sure it is not encoded in base64
like this one.

I am going to take your patch together with some other changes.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
