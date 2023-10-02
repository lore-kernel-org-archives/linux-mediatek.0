Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98112E784A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLItkWOSmnnNXv+kCY8EU93ntwCR+zjqfNmGFwjcMaQ=; b=Ja1yjbB+fVTpYdvEulswvbNDcM
	0j8WKEI/vwUavwoB1jVLIwe/AF/E87bVXF8O3z+aUGx+P3pBC25k/BS/XrMLzlNtq0HdwWV4g85c0
	s/SKr1hCAM8vdQEuOfoYFUylwazT6zDLL8TZRyQMcLuCQjyjtveZpI/DM9L8oIs1E6AXW/KhaMyi/
	93cw0OcySi12DijYRQFlJNJmmMvkxEW63+yFb7dJTCuL2hhmBbdow2N9jyLo0BOTLdTktxRFsraB2
	GcZTNtG9Vba83DrThCh+w8mM9LKmJA2pyCpHlfcSCcdZQonmu5iBD0qG3zAPRl+u/GBj4Rn/d0CbP
	qctb/t+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnEHL-00C8dw-18;
	Mon, 02 Oct 2023 08:27:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnEHI-00C8dL-08
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 08:27:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C1C26607243;
	Mon,  2 Oct 2023 09:27:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696235257;
	bh=5d0H3ooLLwyUXG2ElTtSzQlVCmRg5ncESVD8hW9Pdt8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DMCg/s4CE5Hr47J1ZGPp9lSS1PjubV/KkwdsufNPvJkUoFdZUJo2PGaJ2lhANj9R3
	 ytO4NT7rFlcQFXKpSeYThp+mMfoSQhjGvgKjyvi54BBPWwIjU1tLkThI4MhycVHS6s
	 HgrmypMwfJxU6Lwp9wajahx5Dn42+sD5H46gDiwxUHUEP/QwwK0ob4elCH7hx2XtMC
	 BTCim7lwYVeiP2J7eQK8foOM7CRopPjLTCI09oCMKZUXRoORGS61FK5a9Wh3KJXU1t
	 2TLqa2ZP6OKrvrsok5k1iN6GFpLmlxlX0qUfLYsLqlwtPT/q18GcVc1hpzdwFkYXx/
	 AKD1YGnM7vpOQ==
Message-ID: <660c5c93-4a02-0f6b-4640-ddf67a477490@collabora.com>
Date: Mon, 2 Oct 2023 10:27:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
To: Chen-Yu Tsai <wenst@chromium.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 amergnat@baylibre.com, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
 <84b2de54-8337-42a3-a25c-a95cf2f3349f@app.fastmail.com>
 <CAGXv+5FtBcHwEhQEoEUBx24Zf4ABrDeSaWo_mDbM7OvmBLF5nA@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FtBcHwEhQEoEUBx24Zf4ABrDeSaWo_mDbM7OvmBLF5nA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_012744_362379_4B551E42 
X-CRM114-Status: GOOD (  26.86  )
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

Il 02/10/23 05:30, Chen-Yu Tsai ha scritto:
> On Sat, Sep 30, 2023 at 3:37 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Fri, Sep 29, 2023, at 04:20, AngeloGioacchino Del Regno wrote:
>>> I am a top reviewer mainly for MediaTek SoC related patches in most
>>> subsystems and I've also been upstreaming both improvements, fixes
>>> and new drivers and devicetrees when required.
>>>
>>> The MediaTek scene saw a generous increase in number of patches that
>>> are sent to the lists every week, increasing the amount of required
>>> efforts to maintain the MTK bits overall, and we will possibly see
>>> even more of that.
>>>
>>> For this reason, and also because of suggestions and encouragement
>>> coming from the community, I'm stepping up to be a co-maintainer of
>>> MediaTek SoCs support.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com>
>>> ---
>>>
>>> P.S.: I tried to reach to Matthias for almost two months, but I couldn't
>>> find any way to talk to him and he has been unresponsive on the mailing
>>> lists as well.
>>>
>>> P.P.S.: This also comes after Rob Herring's suggestion to have myself as
>>> a MediaTek SoC co-maintainer [1] and support from other people.
>>>
>>> [1]: https://lore.kernel.org/all/20230804225813.12493-1-robh@kernel.org/
>>
>> Thanks for volunteering for this!
>>
>> I have no information on what Mattias is doing, but I see that he
>> has not merged any patches since June, and that he never sent a
>> pull request for your patches that are still in his for-next
>> branch.
>>
>> I hope he's going to be ok, but let's plan for you to take over
>> for the moment, at least until Matthias is again able to keep
>> maintaining the platform in the near future.
>>
>> Here is my suggestion for how to continue from here:
>>
>> - Please send your MAINTAINERS file update to soc@kernel.org
>>    along  with any urgent bugfixes you may have, so I can forward
>>    them for 6.7. I'm wrapping up the current set of fixes at
>>    the moment, so this would be for next week's rc
>>
>> - Create a git tree with the ususal branches (drivers, soc, dt,
>>    fixes, for-next) and ask Stephen Rothwell (on Cc) to add
>>    the combined for-next branch  to linux-next for integration testing
> 
> I suggest creating a shared git tree from the start. That way when
> Mattias comes back and does agree to co-maintainership, or if anyone
> else joins in, you don't have to change the git tree URL in a lot of
> places.
> 

I agree with creating a shared git tree from the start... I currently don't have
a kernel.org account yet, as I'm waiting for helpdesk to grant my account request.

They asked me to send a patch adding myself to MAINTAINERS as they would use that
as a basis to grant the account request... so I guess it's happening soon; seen
the urgency, I would do anything in my power to speed up the process, but probably
there's "nothing to do" about it.

I am guessing that the right thing to do right now is to just send the mostly
critical fixes to soc@kernel.org, along with this patch, and wait until a shared
tree is created to keep things clean?

>> - Start each branch on 6.6-rc2 (usually we use rc1, but this time
>>    rc2 is a better candidate because of the last-minute
>>    drivers/pmdomain rename), and merge the corresponding branches
>>    from git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
>>    into those to avoids conflicts with his tree
>>
>> - Add any further patches you want in 6.7 on top
>>
>> - Send a first set of pull requests to soc@kernel.org for whatever
>>    you have merged as soon as you are confident about them,
>>    ideally by the end of next week.
>>
>> - Send additional pull requests for fixups or late features in
>>    the weeks after that as you see fit.
>>
>> See Documentation/process/maintainer-soc.rst for more details
>> on the above. When Mattias comes back, you can work out a new
>> process together with him.
> 
> I can also answer any questions you might have about the process.
> 

Many thanks for your support, I greatly appreciate that.

Cheers,
Angelo


