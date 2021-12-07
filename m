Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5048C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 12:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdS+++N5pGreVOkjfBX8/WjOd/rE10A2EJQ0FBCMKLU=; b=rEp4LwCPyuapzH0C86fCVGwdCO
	TbCfEW7xBt9vVxOLDqhhWFRTQgaXBRoiOmR3LzVimegEMx2CTSU1PRHHkkY6DrJSLqh0ZreyEX0vV
	wNKl9IhZ+00Tb1Uxz3ocVY9YzasN8G4GsVi/csyK3Zo51z8G/StT+SUYKHY4n6W5J90HTPcVig4bq
	bkONyQ4w0h6ERU1BxoaMBxUZsuT0W3HWlyWKv0KWsP5FzDOeIWZ9C1XYhuWc14u6ecBNuBtUEpc23
	PK8h8pHl86wIGf7aLwuozkvDmnQatVftHUPTnTqnberTy8SljM/8bdNrqdsRg44QBU6oiYMv6/Q1q
	TVvBzb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muZQU-008OYt-SJ; Tue, 07 Dec 2021 12:18:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muZOz-008Njy-RI; Tue, 07 Dec 2021 12:16:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0EE141F44F90
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638879415; bh=B15G7ImDZFtF6Fgqc3mnNZ9T/WxEYBMsfOlqdDJeg0c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KWVGlMzOSZiio+hBSkRv9KhAv9P4xPky5Uc+b9k/wK39xpfar9SRJh0Jise/8TGGC
 v+qCsrKl07At6FFXeORmjpT6xgdsvmQOWpJNdJI7KO1zrwJx3bWEDydOUBZmzQKDMs
 mZVd3VYdxvtxX4gABlx8VDEhalOoX423StYbXQzPzymB63IzDzuaLsfqmEPARqXbXn
 V6XFPSiZWbsYVoEWyH2PqlkAQ8Uu5ohcXvkgFrKUIoYS2LHkfFck0PY/ogUCsg4LNS
 6j4J43iWjbDXUUXOcNpr1kmKDM6Vfknuu9x5i6wsswxHe1NesnPyCATisJ1W4SGznJ
 p6vextvshl4GQ==
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <85ef182a-8ebe-7dbb-aa95-35e77cbb072c@collabora.com>
Date: Tue, 7 Dec 2021 13:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e1d72db69f424b9ee8987b7bafa7423c672ceef1.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_041658_199845_1B5FED9B 
X-CRM114-Status: GOOD (  38.16  )
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

Il 07/12/21 13:10, Yong Wu ha scritto:
> On Tue, 2021-12-07 at 09:56 +0100, AngeloGioacchino Del Regno wrote:
>> Il 07/12/21 07:24, Yong Wu ha scritto:
>>> Hi AngeloGioacchino,
>>>
>>> Thanks for your review.
>>>
>>> On Mon, 2021-12-06 at 16:08 +0100, AngeloGioacchino Del Regno
>>> wrote:
>>>> Il 03/12/21 07:40, Yong Wu ha scritto:
>>>>> sleep control means that when the larb go to sleep, we should
>>>>> wait
>>>>> a bit
>>>>> until all the current commands are finished. thus, when the
>>>>> larb
>>>>> runtime
>>>>> suspend, we need enable this function to wait until all the
>>>>> existed
>>>>> command are finished. when the larb resume, just disable this
>>>>> function.
>>>>> This function only improve the safe of bus. Add a new flag for
>>>>> this
>>>>> function. Prepare for mt8186.
>>>>>
>>>>> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>>> ---
>>>>>     drivers/memory/mtk-smi.c | 39
>>>>> +++++++++++++++++++++++++++++++++++----
>>>>>     1 file changed, 35 insertions(+), 4 deletions(-)
>>>
>>> [snip]
>>>
>>>>>     static int __maybe_unused mtk_smi_larb_suspend(struct device
>>>>> *dev)
>>>>>     {
>>>>>     	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>>>>> +	int ret = 0;
>>>>> +
>>>>> +	if (MTK_SMI_CAPS(larb->larb_gen->flags_general,
>>>>> MTK_SMI_FLAG_SLEEP_CTL))
>>>>> +		ret = mtk_smi_larb_sleep_ctrl(dev, true);
>>>>
>>>> Sorry but what happens if SLP_PROT_RDY is not getting set
>>>> properly?
>>>>    From what I can understand in the commit description that you
>>>> wrote,
>>>> if we reach
>>>> the timeout, then the LARB transactions are not over....
>>>>
>>>> I see that you are indeed returning a failure here, but you are
>>>> also
>>>> turning off
>>>> the clocks regardless of whether we get a failure or a success;
>>>> I'm
>>>> not sure that
>>>> this is right, as this may leave the hardware in an unpredictable
>>>> state (since
>>>> there were some more LARB transactions that didn't go through),
>>>> leading to crashes
>>>> at system resume (or when retyring to suspend).
>>>
>>> Thanks for this question. In theory you are right. In this case,
>>> the
>>> bus already hang.
>>>
>>> We only printed a fail log in this patch. If this fail happens, we
>>> should request the master to check which case cause the larb hang.
>>>
>>> If the master has a good reason or limitation, the hang is
>>> expected, I
>>> think we have to add larb reset in this fail case: Reset the larb
>>> when
>>> the larb runtime resume.
>>>
>>
>> Think about the case in which the system gets resumed only partially
>> due to a
>>
>> failure during resume of some driver, or due to a RTC or arch timer
>> resume and
>> suspend right after... or perhaps during runtime suspend/resume of
>> some devices.
>> In that case, we definitely want to avoid any kind of failure point
>> that would
>> lead to a system crash, or any kind of user noticeable (or UX
>> disrupting) "strange
>> behavior".
>>
>> I think that we should make sure that the system suspends cleanly,
>> instead of
>> patching up any possible leftover issue at resume time: if this is
>> doable with
>> a LARB reset in suspend error case, that looks like being a good
>> option indeed.
>>
>> As a side note, thinking about UX, losing a little more time during
>> suspend is
>> nothing really noticeable for the user... on the other hand, spending
>> more time
>> during resume may be something noticeable to the user.
>> For this reason, I think that guaranteeing that the system resumes as
>> fast as
>> possible is very important, which adds up to the need of suspending
>> cleanly.
> 
> Thanks for this comment. I will put it in the suspend when adding the
> reset. But I have no plan to add it in this version since I don't see
> the need for this right now. Maybe I should add a comment in the code
> for this.
> 

What I understand from your reply is that the reset is not trivial work
and needs quite some time to be done properly; in that case: yes, please
add a TODO comment that explains the situation and the discussed solution.

Also, since this SLP_PROT_RDY flag seems to be very nice, just a simple
question: is this a new feature in the SMI IP of MT8186, or is there anything
similar that we may use on other SoCs, like 8183, 8192, 8195, as a follow-up
of this series?

>>
>>> Fortunately, we have never got this issue. We could add this reset
>>> when
>>> necessary. Is this OK for you?
>>>
>>> Thanks.
>>>
>>>>
>>>>>     
>>>>>     	clk_bulk_disable_unprepare(larb->smi.clk_num, larb-
>>>>>> smi.clks);
>>>>> -	return 0;
>>>>> +	return ret;
>>>>>     }
>>>>>     
>>>>>     static const struct dev_pm_ops smi_larb_pm_ops = {
>>>>>
>>>>
>>>>
>>
>>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
