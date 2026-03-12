Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ECE1067041
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+mnhKzR6koen5x240QrG841FRepe8eQeNZ0LApge2M=; b=TbZV6u4tgtjpIMh3TWsLLaOk4p
	4VCW0PH3xk47QpEG0BJ+RbKwHksexi8AKEgq/ejAisMRtDkOGSdIqr8uBkQcZEXW6tssRYDeQhiu1
	IdJRhsVfTtTpAYsXeo7KWli2BhY3YobziQh3RwX8kIwZ4cAyuDijcZLlZmcgBxJoSd/DepPMbq4aH
	lPUPVO94+puPSmi6q7QeuKtEAEIZhQUbBZQ4EIcRrwuTz54HDeEMivYxQ7R6HYAYtCUyOBc1Y3N8O
	TX/Ry19Fd2TTSYWnvljaExCHthBujJWIJ0wJFYVHsHV+own2io5bG93OcQo8qHp4Kw1Sk7GQQoPYe
	oTw5KIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hd0-0000000EJeu-1pk1;
	Thu, 12 Mar 2026 15:07:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hcy-0000000EJcR-0mEj;
	Thu, 12 Mar 2026 15:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773328024;
	bh=C/VLxADi0AmoarizBsBrzfTctfP0TzEKu7r45IT3lGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZdJELFYPD+gR2aB1AQNxMh5HVB2wPFRX3KTKOZbsBZ7BRucZgPsTFV5XOVFMr84KD
	 V3AJxnmEBzu4cKz53SqwSU1063IMNfZrot1PaNMPdhsIJYKDOx7ilm7IqThjbW3doL
	 4G0iUiCU3W5Ct6+SIpIAeaGQxHjRmwFrsW5pc8Z7L3ZxcZYztvPKhGTqZjXYiUjZGE
	 TTxOQjkm9gsquXxmeByqNyKC6Q04u8/4GVa/iNv4WvIHmzVweECqcme0veAc9w1uoS
	 H1QxCTvEnJbBakUnbt4ehA0i0ejNCXhcaFOD7go8pWJ+Xu+0B6oAE3SFWD8BE/4bF4
	 P9opvkn2AlyBQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DA3917E12BA;
	Thu, 12 Mar 2026 16:07:04 +0100 (CET)
Message-ID: <0798cf33-b2b4-420e-97a0-7e2d0fbedb08@collabora.com>
Date: Thu, 12 Mar 2026 16:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
To: Ulf Hansson <ulf.hansson@linaro.org>, Adam Ford <aford173@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260210053708.17239-1-aford173@gmail.com>
 <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
 <7fd891b7-b1ff-4668-ac99-8f8ac244d90c@collabora.com>
 <CAPDyKFqbS+PUkLXkjoHjbiVFCYM4FxQeHdJk_LVVfLA5nGEZ-A@mail.gmail.com>
 <108e6fad-401c-427a-bc30-8ddd00bd93a5@collabora.com>
 <CAPDyKFoY+pdSh-h_=Ko9L7QaFo4V4iA2_A0jA3BfnuKmiCyzCA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPDyKFoY+pdSh-h_=Ko9L7QaFo4V4iA2_A0jA3BfnuKmiCyzCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_080708_383814_F0D04B1B 
X-CRM114-Status: GOOD (  47.43  )
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

Il 12/03/26 15:42, Ulf Hansson ha scritto:
> On Thu, 12 Mar 2026 at 13:46, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 11/03/26 18:29, Ulf Hansson ha scritto:
>>> On Fri, 6 Mar 2026 at 10:50, AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 12/02/26 12:34, Ulf Hansson ha scritto:
>>>>> On Tue, 10 Feb 2026 at 06:40, Adam Ford <aford173@gmail.com> wrote:
>>>>>>
>>>>>> The wrong value of the number of domains is wrong which leads to
>>>>>> failures when trying to enumerate nested power domains.
>>>>>>
>>>>>>     PM: genpd_xlate_onecell: invalid domain index 0
>>>>>>     PM: genpd_xlate_onecell: invalid domain index 1
>>>>>>     PM: genpd_xlate_onecell: invalid domain index 3
>>>>>>     PM: genpd_xlate_onecell: invalid domain index 4
>>>>>>     PM: genpd_xlate_onecell: invalid domain index 5
>>>>>>     PM: genpd_xlate_onecell: invalid domain index 13
>>>>>>     PM: genpd_xlate_onecell: invalid domain index 14
>>>>>>
>>>>>> Attempts to use these power domains fail, so fix this by
>>>>>> using the correct value of calculated power domains.
>>>>>>
>>>>>> Signed-off-by: Adam Ford <aford173@gmail.com>
>>>>>
>>>>> We should have a fixes tag for this too I think:
>>>>>
>>>>> Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware
>>>>> Voter power domains")
>>>>>
>>>>>
>>>>>> ---
>>>>>>     drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
>>>>>> index 58648f4f689b..d2b8d0332951 100644
>>>>>> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
>>>>>> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
>>>>>> @@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
>>>>>>            scpsys->soc_data = soc;
>>>>>>
>>>>>>            scpsys->pd_data.domains = scpsys->domains;
>>>>>> -       scpsys->pd_data.num_domains = soc->num_domains;
>>>>>> +       scpsys->pd_data.num_domains = num_domains;
>>>>>
>>>>> Not sure this is the complete fix, as scpsys_add_one_domain() seems to
>>>>> be using the wrong value of "num_domains" too, no?
>>>>>
>>>>
>>>> No, scpsys_add_one_domain() uses num_domains from the soc_data for DIRECT_CTL,
>>>> which is expected. Maybe that can be improved, but it's how it is supposed to work.
>>>>
>>>> So yeah, this patch is resolving an issue, and it is a complete fix.
>>>
>>> I had a closer look and unfortunately, it still looks weird to me.
>>>
>>> More precisely, we are allocating and registering a number of genpds,
>>> that corresponds to the sum of "soc->num_domains +
>>> soc->num_hwv_domains". The index each genpd gets in the array (struct
>>> genpd_onecell_data) must correspond to the index specified in DT, for
>>> both a consumer-node and a child-domain-node, right?
>>>
>>> It seems like adding them dynamically changes the index. In other
>>> words, the index specified using the "reg" property in a
>>> child-domain-node, may not match what a consumer-node should specify
>>> in its "power-domains" property. Isn't that a problem? Perhaps not,
>>> because we never have both "scpsys_domain_data" and
>>> "scpsys_hwv_domain_data", but then why are we adding them in ->probe()
>>> with "soc->num_domains + soc->num_hwv_domains"?
>>>
>>
>> As you understood, having both is not really supported right now, and the
>> intention there was to have the flexibility to do so without restructuring
>> the entire thing in the future.
> 
> Thanks for clarifying!
> 

Oh you're welcome, of course.

> Although, having both seems problematic for the reasons I pointed out
> above. At least, it looks like some more re-work will be needed to
> support that case.

Yeah, that's right.
It's still a lot of work, but hopefully I made it "less than if this wasn't there".

Not sure if I did, but there's that, anyway...

> 
>>
>> Though, from what I understand, the confusion comes from a single line (and
>> reading it again, I do agree, because I got confused myself for a moment as
>> well, and I'm the one who wrote this, so that's bad bad bad):
>>
>>          num_domains = soc->num_domains + soc->num_hwv_domains;
>>
>> where, to avoid confusion, this should've been:
>>
>>          num_domains = soc->num_domains ?
>>                        soc->num_domains : soc->num_hwv_domains;
> 
> Agreed.
> 
>>
>> (perhaps with a check `if (num_domains && num_hwv_domains) dev_err(only one
>>    supported)` but being this taken from hardcoded data, I'm not really for it)
> 
> Agreed, a print would be superfluous.
> 

Eh I forgot to add a "return -EINVAL" in the mix, which was the whole point of the
"parenthesis"... ugh. :-)

In any case I can understand that we're on the same page about superfluous stuff,
which is enough for the context of that.

>>
>> ...and still, like the proposed fix does:
>>
>>          scpsys->pd_data.num_domains = num_domains;
>>
>>
>> While I agree, again, in that the code could be improved (and it shall be),
>> how the logic behaves, right now, with the proposed fix, still looks good to me.
> 
> Okay, I'm queuing the $subject patch as a fix and by adding a stable/fixes-tag.
> 
>>
>> I can eventually just send a patch that clarifies the `num_domains` if you prefer.
> 
> Well, actually, I would suggest splitting the driver into two drivers
> (each handling its own type of match data) and adding some shared
> helper functions, that both drivers can use.
> 
> It's more work, but we should end up with more maintainable code, I think.
> 
> What do you think?
> 

I had the same idea initially, but with how fundamentally broken is the "Hardware
Voter" mechanism in the current MediaTek SoCs (Dimensity 9400 MT6991, 9500 MT6993
and derivatives like Kompanio Ultra MT8196 and Genio Pro) I didn't want to really
do that.

I suspect that the HWV will change in the future, but I don't really know how, nor
I have any knowledge that would make me able to safely predict.

So, well, while in theory having two drivers, with some common code in between,
could make this more maintainable, I'm afraid that if we do this *right now* in
the current state of things, we will end up with three drivers instead...

Small clarification about the brokenness of the HWV: all of the HWV Domains and
clocks aren't really linked together internally... as much as HWV Domains and
some external regulators, so, basically, as of now, the mechanism is practically
useless if not for MCU-vs-AP *only partial* voting of resources (as dependencies
are not handled, and some of them are not even HWV dependencies.... eh.. anyway,
a big thread happened when initially upstreaming this entire thing, where a bit
more is explained...)

Ewww... I'm losing myself in blurb again..!

In any case - my plan of action is to keep things as they are (structurally, but
of course with the necessary quality/readability enhancements) until something
new, with a proper resource voting system implementation in hardware, comes out.

If everything goes according to the plan (again... if), once a SoC with a proper
implementation (HW ... but really it's firmware that can't be changed) we'll be
sure that any decision that we'll take on this will most probably result in a
flexible and maintainable implementation.

And that's why I'm basically saying "I would agree, but not now" :-)

Cheers,
Angelo

> [...]
> 
> Kind regards
> Uffe


