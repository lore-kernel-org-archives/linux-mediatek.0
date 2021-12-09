Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0087C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNpiCtjrmNayLdSHc+xhh3QBuhBTCyQPq+IxFLDDs8Y=; b=21XF3qJyIUphnCqroFZ8TH4akR
	vXVHl5cqjrqttfy45xzX7XDnhN6Z6Ul5+arW0INo8XVmRmZYCbbtm3wngU/IEz4rVSsIAri4Pm9bz
	oOShYyIiWrm6is/HiMoH1shpcumiwSXlPQqWi16VvfKdD3yM+tWfatOKOTK94nstrnjH/PKhpoSOb
	26Z9ZbO/iy0mlFkyGOMyt+llFcR3K7wf98Tza+v894DyWpnVXVsvLOy6W/a3j0qvk0bjQNA+ibdUW
	c3SlZE26aJY3cGmYJ2snlmo+jJxT83hcivUgL11UQaWCrlfPK7Goe4xk9OoHI89XEKUt/ziHRVDIT
	dIqXb/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvFbG-00FONS-9o; Thu, 09 Dec 2021 09:20:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvFTg-00FLyd-P2; Thu, 09 Dec 2021 09:12:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4C8921F4654A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639041153; bh=sPBqbsrB9UT6NfM6wy4+leJCOrkH2CX3quBKt/V3f9E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MhGZXeGyFwxOfTnQjje19Du8KHtsplWlJvMpNzYzmwMk3a/OPh0fN61y65fFoF0vS
 +PgKFPuIuu2hazvEwXL5VW45nwzH5vPz/+TLFAHGpTQAyp7vS2XqmEDzwwsbw/UuVg
 TqdxSNvGLRirp/WjjGshxpzIKo9Li8XOgw9t0BPsFalocAK5CPF5uZclYJw3pnNk5f
 yOXFG6lq7B05YXEZcV+5JUyHrMqtJns5i1zLavCMfaavrLPU/a/ZTcmihlWNVewYe/
 IQwWTM/iCYTN0EMnmAUfzMMRrzM4qUWeCuPhC3+H0mXUEd7pOb5CEmPCInXgAG4Qjm
 bxVLN4hI1oNwQ==
Subject: Re: [PATCH 3/4] memory: mtk-smi: Add sleep ctrl function
To: Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, lc.kan@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-4-yong.wu@mediatek.com>
 <f2ffd08a-44c3-9458-1bd8-68e3c0755611@collabora.com>
 <ebc8e4c0b0519043c5a82c6c967ac6d524e8869a.camel@mediatek.com>
 <47c30f6f-ce9d-9ea7-283c-9026ae9ed1c0@collabora.com>
 <e1d72db69f424b9ee8987b7bafa7423c672ceef1.camel@mediatek.com>
 <85ef182a-8ebe-7dbb-aa95-35e77cbb072c@collabora.com>
 <581d847ede5ce917762e2c5734e23dcd693fef32.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <dce1e8bd-c21c-202f-3e56-70be6e743a18@collabora.com>
Date: Thu, 9 Dec 2021 10:12:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <581d847ede5ce917762e2c5734e23dcd693fef32.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_011237_160530_60895B44 
X-CRM114-Status: GOOD (  45.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/12/21 03:42, Yong Wu ha scritto:
> On Tue, 2021-12-07 at 13:16 +0100, AngeloGioacchino Del Regno wrote:
>> Il 07/12/21 13:10, Yong Wu ha scritto:
>>> On Tue, 2021-12-07 at 09:56 +0100, AngeloGioacchino Del Regno
>>> wrote:
>>>> Il 07/12/21 07:24, Yong Wu ha scritto:
>>>>> Hi AngeloGioacchino,
>>>>>
>>>>> Thanks for your review.
>>>>>
>>>>> On Mon, 2021-12-06 at 16:08 +0100, AngeloGioacchino Del Regno
>>>>> wrote:
>>>>>> Il 03/12/21 07:40, Yong Wu ha scritto:
>>>>>>> sleep control means that when the larb go to sleep, we
>>>>>>> should
>>>>>>> wait
>>>>>>> a bit
>>>>>>> until all the current commands are finished. thus, when the
>>>>>>> larb
>>>>>>> runtime
>>>>>>> suspend, we need enable this function to wait until all the
>>>>>>> existed
>>>>>>> command are finished. when the larb resume, just disable
>>>>>>> this
>>>>>>> function.
>>>>>>> This function only improve the safe of bus. Add a new flag
>>>>>>> for
>>>>>>> this
>>>>>>> function. Prepare for mt8186.
>>>>>>>
>>>>>>> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
>>>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>>>>> ---
>>>>>>>      drivers/memory/mtk-smi.c | 39
>>>>>>> +++++++++++++++++++++++++++++++++++----
>>>>>>>      1 file changed, 35 insertions(+), 4 deletions(-)
>>>>>
>>>>> [snip]
>>>>>
>>>>>>>      static int __maybe_unused mtk_smi_larb_suspend(struct
>>>>>>> device
>>>>>>> *dev)
>>>>>>>      {
>>>>>>>      	struct mtk_smi_larb *larb =
>>>>>>> dev_get_drvdata(dev);
>>>>>>> +	int ret = 0;
>>>>>>> +
>>>>>>> +	if (MTK_SMI_CAPS(larb->larb_gen->flags_general,
>>>>>>> MTK_SMI_FLAG_SLEEP_CTL))
>>>>>>> +		ret = mtk_smi_larb_sleep_ctrl(dev, true);
>>>>>>
>>>>>> Sorry but what happens if SLP_PROT_RDY is not getting set
>>>>>> properly?
>>>>>>     From what I can understand in the commit description that
>>>>>> you
>>>>>> wrote,
>>>>>> if we reach
>>>>>> the timeout, then the LARB transactions are not over....
>>>>>>
>>>>>> I see that you are indeed returning a failure here, but you
>>>>>> are
>>>>>> also
>>>>>> turning off
>>>>>> the clocks regardless of whether we get a failure or a
>>>>>> success;
>>>>>> I'm
>>>>>> not sure that
>>>>>> this is right, as this may leave the hardware in an
>>>>>> unpredictable
>>>>>> state (since
>>>>>> there were some more LARB transactions that didn't go
>>>>>> through),
>>>>>> leading to crashes
>>>>>> at system resume (or when retyring to suspend).
>>>>>
>>>>> Thanks for this question. In theory you are right. In this
>>>>> case,
>>>>> the
>>>>> bus already hang.
>>>>>
>>>>> We only printed a fail log in this patch. If this fail happens,
>>>>> we
>>>>> should request the master to check which case cause the larb
>>>>> hang.
>>>>>
>>>>> If the master has a good reason or limitation, the hang is
>>>>> expected, I
>>>>> think we have to add larb reset in this fail case: Reset the
>>>>> larb
>>>>> when
>>>>> the larb runtime resume.
>>>>>
>>>>
>>>> Think about the case in which the system gets resumed only
>>>> partially
>>>> due to a
>>>>
>>>> failure during resume of some driver, or due to a RTC or arch
>>>> timer
>>>> resume and
>>>> suspend right after... or perhaps during runtime suspend/resume
>>>> of
>>>> some devices.
>>>> In that case, we definitely want to avoid any kind of failure
>>>> point
>>>> that would
>>>> lead to a system crash, or any kind of user noticeable (or UX
>>>> disrupting) "strange
>>>> behavior".
>>>>
>>>> I think that we should make sure that the system suspends
>>>> cleanly,
>>>> instead of
>>>> patching up any possible leftover issue at resume time: if this
>>>> is
>>>> doable with
>>>> a LARB reset in suspend error case, that looks like being a good
>>>> option indeed.
>>>>
>>>> As a side note, thinking about UX, losing a little more time
>>>> during
>>>> suspend is
>>>> nothing really noticeable for the user... on the other hand,
>>>> spending
>>>> more time
>>>> during resume may be something noticeable to the user.
>>>> For this reason, I think that guaranteeing that the system
>>>> resumes as
>>>> fast as
>>>> possible is very important, which adds up to the need of
>>>> suspending
>>>> cleanly.
>>>
>>> Thanks for this comment. I will put it in the suspend when adding
>>> the
>>> reset. But I have no plan to add it in this version since I don't
>>> see
>>> the need for this right now. Maybe I should add a comment in the
>>> code
>>> for this.
>>>
>>
>> What I understand from your reply is that the reset is not trivial
>> work
> 
> Yes. the reset bit is in different register regions, like mmsys,
> vdecsys. But the main problem is that I don't see why we need that. We
> never that problem.
> 

The fact that we didn't get any "visible" problem with that is very good,
indeed, but having a recovery mechanism in place in the event that something
like that happens is going to be helpful in the future, as driver updates (either
to support new SoCs or Linux API changes, or new APIs) may produce unexpected
results sometimes and this will make sure that, despite there may be a problem,
the hardware will still work even before solving the producer of the issue.

Sometimes it may happen that solving an issue is nothing trivial, hence requires
a lot of time, and that's the main usefulness of that - and it's as useful as
your *great* idea of enabling SLP_PROT_RDY to check on the bus.

> The sleep ctrl function is just for the safety of the bus. If we have
> not it, It also should be ok...If not, the question is: why does the
> larb master device call pm_runtime_put before his HW finish the job?
> 

I agree on the fact that calling pm_runtime_put before the HW finishes the
job is something that should *never* happen.

>> and needs quite some time to be done properly; in that case: yes,
>> please
>> add a TODO comment that explains the situation and the discussed
>> solution.
>>
>> Also, since this SLP_PROT_RDY flag seems to be very nice, just a
>> simple question: is this a new feature in the SMI IP of MT8186, or is
>> there anything similar that we may use on other SoCs, like 8183,
>> 8192, 8195, as a follow-up of this series?
> 
> All the three SoC support this function. I expect the later SoC will
> support this. but the previous SoC has already MP... If someone has
> already tested ok after adding it for the previous SoC, I'm ok of
> course.
> 

Thanks for the information. Again, this feature is very nice, so if it can
be used on any other SoC, it's going to be helpful in the future.

I will do some research.

Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
