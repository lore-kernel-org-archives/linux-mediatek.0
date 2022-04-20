Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D39C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtvkiMoANc2qPzkYt+6zbnuIeBgOFCzjJshv7teCRbE=; b=aZLtmdeKwQik58
	smMMKWFRCEe5knLNgJOh8I3z3Ux0lBWGjATskt1DuC8UbTdeSGHGAjn2xNdHsgM8ghsKGaQkSgAqW
	Cmg6Fu1FaVp9p8X15llCyv4V3zZS7F78DIGvWZNSSMeUWsJDv47PS3qiuITI32EP6JfOxYsyUr0a1
	Rkty1YZwxp67DDKLwIyqYKnAf99vcnXH939LV0ms4PYqVoICdCagAj9s+iHlR6TkWilEDHQpXQJoJ
	2elD5d45FTgsLupLapRQXk9PNpLtu34UG/zP6VgAS7QIULeKdHkL/tVs224YMjEkY9yTPibeqAtQh
	UnRbPooIPBQKVGP1rogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh92b-008tvC-3h; Wed, 20 Apr 2022 12:02:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh92P-008trs-2Y; Wed, 20 Apr 2022 12:02:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 85CC01F439F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650456140;
 bh=eypPEIA55pVQnebCMYcNZUnShmDUItvbJq79kOP8Xm4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Eesz4c8/weJ3EMUtyNbhLYHLboEvf0/+iP4MdFSQFJLVB9lst9DeGrbGoFvpoqeNS
 3uALJ1UZTkkVzxVP8TyK21Dh52LhKRc1HUo2pGeBwEJBJmfygQvXKdh41/LAn6+C4i
 vA1u8WEYOf0usJcEuu0i9ntO0wBBUs6/Ulg+rcuLOaES6zgk+e3dYCiJ+87L1s9WaO
 gdRbM9nsohNdOKyV+QWx5/bHAN9c2QdgyaLUCrgLx54QrCxPGofynOi22MCrAoEYup
 evNeI/T/Hd3OowZZi6qNgGdYTv5xKDUJtrnUpeyQL5Sd10FhXYQTOEDaGuA1/cjJ/u
 2NdUmz7RnitLg==
Message-ID: <ca8048f4-2e75-a49b-6c54-9f6abba6ead3@collabora.com>
Date: Wed, 20 Apr 2022 14:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/7] clk: mediatek: Move to struct clk_hw provider APIs
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220419081246.2546159-1-wenst@chromium.org>
 <3591fcc1-d34a-b40a-4e78-edcf9d2ddf08@collabora.com>
 <CAGXv+5HhcQbdGLQFtgPnvzVbSKaQ5GQGvmjwPVOVxjrYnMh1dg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5HhcQbdGLQFtgPnvzVbSKaQ5GQGvmjwPVOVxjrYnMh1dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_050225_431998_4C49213E 
X-CRM114-Status: GOOD (  39.19  )
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

Il 19/04/22 18:09, Chen-Yu Tsai ha scritto:
> On Tue, Apr 19, 2022 at 11:08 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 19/04/22 10:12, Chen-Yu Tsai ha scritto:
>>> Hi everyone,
>>>
>>> This is part 2 of my proposed MediaTek clk driver cleanup work [1].
>>>
>>
>> ..snip..
>>
>>>
>>> The next phase of the cleanup/improvement shall be to introduce some
>>> variant of `struct clk_parent_data` to describe clk relationships
>>> efficiently.
>>>
>>> Please have a look.
>>>
>>
>> Hello Chen-Yu,
>>
>> I am grateful to see this series, as the MediaTek clock drivers are getting
>> a bit old, despite new platforms being implemented practically as we speak.
>>
>> With this, you surely get that I completely agree with the proposed cleanup
>> and modernization of the entire MediaTek clocks infrastructure, but I think
>> that introducing a `struct clk_parent_data` for these drivers is, at this
>> point, a must, that not only fully justifies these patches, but also "makes
>> the point" - as the effect of that would be a performance improvement as we
>> would *at least* avoid lots of clk_cpy_name() in case of parent_hws, or in
>> case or parent_data where no .fw_name is provided (which would be the case
>> for most of the clocks).
> 
> You and me both. :) And yes, one of the intended results is to make the
> clk driver probe faster.
> 
>> That said, my advice would be to add that conversion to declaring clocks
>> with .hw.init.parent_data and/or .hw.init.parent_hws to this series as to
>> really make it complete.
> 
> This series itself already touches a lot of code, even if most of it was
> done by coccinelle. I'd like to send them separately to not overwhelm
> people.
> 
> Also, I haven't actually started on that part yet. It is actually part 3
> of my overall plan. I have a good idea of what to do, given I did similar
> work for the sunxi-ng clk drivers (though half finished...).

Having a good plan means that you're already half-done though :) :) :)

Besides, the reason why I said that you should do the conversion in the same
series was exactly because your changes are done with coccinelle scripts...
...but I thought that you already had something in the works for that.

Since you still need some time for the final part, having this kind of (even
if partial) modernization is still golden.
Let's do it in two steps as you prefer then, that's fine for me.

> 
> Most of the clk references are internal to each driver, and those would
> be mapped from some CLK_ID to some `struct clk_hw *` internally, but all
> blocks have external parents that need to be modeled as well, and we
> would likely need global clk name fallbacks for the blocks that don't
> have parents declared in the device tree, which is unfortunately most
> of them. Especially the central clock controllers like infracfg or pericfg
> take many clk inputs, to the point that MediaTek folks were somewhat
> unwilling to bloat the device tree with them.
> 
> So it does seem easier to use something like clk_parent_data with
> `struct clk_hw *` replaced with an index everywhere. This structure
> would get converted into clk_parent_data by the singular clk registration
> helpers.
> 

I may not be understanding what you mean by mapping the CLK_ID internally, but
from what my brain processed, I think that you want to look at, and basically
replicate, how it's done in the Qualcomm clock drivers (and perhaps standardize
that in the clock API?).

Specifically, clk/qcom/common.h, struct parent_map.

Though, I admit I haven't looked at the MTK clocks *very deeply*, so I may be
misunderstanding something.

> This would have to coexist with the existing helpers we have. So I think
> this work would be combined with the helper API cleanup / alignment with
> clk provider API.
> 
> Does that make sense to you?
> 

Yes that does fully make sense to me.

>> Of course, if you have concerns about old platforms that you cannot test,
>> or for which this kind of conversion would require a huge amount of effort,
>> then I would go for converting as many as possible as a first step and then
>> leave the others for later.
>>
>> I would envision MT8183, 8186, 8192, 8195 to be a good amount of first
>> candidates for this great effort.
> 
> I'm working with MT8183 right now, as it can readily boot mainline to a
> shell. Depending on the schedule and whose on board with resources, I'd
> probably handle the other ChromeOS platforms, or delegate it internally.
> 
> 

That sounds like a plan. Besides, I wasn't trying to give you any hurry
whatsoever - I was simply thinking out loud :))

Regards,
Angelo

> Regards
> ChenYu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
