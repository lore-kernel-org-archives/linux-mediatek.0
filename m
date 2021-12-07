Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6268C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgP7mlWUForiOvmi3wxGtIQ/pX89kBA5jccT7T9B5rM=; b=VFR3MD7I496VAjpdlA9UiHOf2I
	htcpPkvsPv/K2/TpDOY5PKwDDI0HpvkXnvSxdvQ/Mpyc0NHULz96TX4JvsL4FTcWBzulYV0vLiS7A
	mWS3VFYOo3qhGblaxTFv2V6D5UULRfn/hnU2e+1bS3gpMO5vgddpckagpkfu3gaOMMfusOoQPDgvC
	SDh3QuhOBwbhT+/gROI/AU6bvXigCJn9dVyjFdVCj6+GuvVA4qwKLcpaN8w60QWXHwudHYtIcQWu2
	b+eiDEFoVBPxQv1+W39wXcYvRNVm7bEmeeRV/qMC5ukmLz4iRVyCwCWoCSFffLNRcvAngFFxutRnW
	WwAKFF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muWSE-007i95-Oc; Tue, 07 Dec 2021 09:08:06 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muWHX-007eRH-U4; Tue, 07 Dec 2021 08:57:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id ADE191F44D8B
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638867422; bh=6nmUTy2qScz4iTwXjqQt0rHoA1TXWwXjzZV/fmWui78=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QKWHMuu5MIBaoMET43C9soRtIOij55jI75VSMpib0iawKdoiBkK20yQOfM8K0bA1H
 mIlHI5anp3xP/om0YfO56YFbkE+x59LCgTk0P1E6jEI4TSAgOB8Bn+HudlcEl5L7Lj
 0W1xcTyM7p8C/EIkgyAQxsMREoHfomCqmI1R35niwX3m/9U/RgcartIfFL9cYEw0NY
 dACSCmbJNTgttlGUTumf7Ixv+qkDxuxUmLBIJId5xrGRjvcmvVUv6c5XAN0HaXhB6s
 pnW8XiOmhbLvCpGPlYjl548ujYKn9zTyWKZHZy926Psh3P8ZEEanceqXYmtEBqgCvV
 pIWWjhztMnuBg==
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <47c30f6f-ce9d-9ea7-283c-9026ae9ed1c0@collabora.com>
Date: Tue, 7 Dec 2021 09:56:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ebc8e4c0b0519043c5a82c6c967ac6d524e8869a.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_005704_291251_898C68B7 
X-CRM114-Status: GOOD (  34.10  )
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

Il 07/12/21 07:24, Yong Wu ha scritto:
> Hi AngeloGioacchino,
> 
> Thanks for your review.
> 
> On Mon, 2021-12-06 at 16:08 +0100, AngeloGioacchino Del Regno wrote:
>> Il 03/12/21 07:40, Yong Wu ha scritto:
>>> sleep control means that when the larb go to sleep, we should wait
>>> a bit
>>> until all the current commands are finished. thus, when the larb
>>> runtime
>>> suspend, we need enable this function to wait until all the existed
>>> command are finished. when the larb resume, just disable this
>>> function.
>>> This function only improve the safe of bus. Add a new flag for this
>>> function. Prepare for mt8186.
>>>
>>> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>    drivers/memory/mtk-smi.c | 39
>>> +++++++++++++++++++++++++++++++++++----
>>>    1 file changed, 35 insertions(+), 4 deletions(-)
> 
> [snip]
> 
>>>    static int __maybe_unused mtk_smi_larb_suspend(struct device
>>> *dev)
>>>    {
>>>    	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>>> +	int ret = 0;
>>> +
>>> +	if (MTK_SMI_CAPS(larb->larb_gen->flags_general,
>>> MTK_SMI_FLAG_SLEEP_CTL))
>>> +		ret = mtk_smi_larb_sleep_ctrl(dev, true);
>>
>> Sorry but what happens if SLP_PROT_RDY is not getting set properly?
>>   From what I can understand in the commit description that you wrote,
>> if we reach
>> the timeout, then the LARB transactions are not over....
>>
>> I see that you are indeed returning a failure here, but you are also
>> turning off
>> the clocks regardless of whether we get a failure or a success; I'm
>> not sure that
>> this is right, as this may leave the hardware in an unpredictable
>> state (since
>> there were some more LARB transactions that didn't go through),
>> leading to crashes
>> at system resume (or when retyring to suspend).
> 
> Thanks for this question. In theory you are right. In this case, the
> bus already hang.
> 
> We only printed a fail log in this patch. If this fail happens, we
> should request the master to check which case cause the larb hang.
> 
> If the master has a good reason or limitation, the hang is expected, I
> think we have to add larb reset in this fail case: Reset the larb when
> the larb runtime resume.
> 

Think about the case in which the system gets resumed only partially due to a

failure during resume of some driver, or due to a RTC or arch timer resume and
suspend right after... or perhaps during runtime suspend/resume of some devices.
In that case, we definitely want to avoid any kind of failure point that would
lead to a system crash, or any kind of user noticeable (or UX disrupting) "strange
behavior".

I think that we should make sure that the system suspends cleanly, instead of
patching up any possible leftover issue at resume time: if this is doable with
a LARB reset in suspend error case, that looks like being a good option indeed.

As a side note, thinking about UX, losing a little more time during suspend is
nothing really noticeable for the user... on the other hand, spending more time
during resume may be something noticeable to the user.
For this reason, I think that guaranteeing that the system resumes as fast as
possible is very important, which adds up to the need of suspending cleanly.

> Fortunately, we have never got this issue. We could add this reset when
> necessary. Is this OK for you?
> 
> Thanks.
> 
>>
>>>    
>>>    	clk_bulk_disable_unprepare(larb->smi.clk_num, larb->smi.clks);
>>> -	return 0;
>>> +	return ret;
>>>    }
>>>    
>>>    static const struct dev_pm_ops smi_larb_pm_ops = {
>>>
>>
>>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
