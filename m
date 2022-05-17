Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19F0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMDyz1mLbh5CRL+TxGyOfZwFCmZgEas9L2y0sMe4Hq0=; b=hQ5SUrMa+XlgkV
	/tBSw3S3lIw5vagFTBH9aK7ZWqRL7yfsdkOUxm7Th2rVrz1gtrnj5vX+9ozvb5TtGjvTfzYaEy61s
	8wDGhsNWdq0IEZn+Lv4heI1zOB1IqE5oZFikIXnxeYYQW6D7gozqHaT8duiRopw2gLeqCL8GTLMwK
	dM9g03b4y9rVhnLTGylER2qh0+v3j7fGcr+xgXaP6NBGtunhV5R0Hy6D8UWa71jf8V8A1YLNJjB2U
	G1lMdpopHa7oRjQOD/4VyfgkCEhAqfetipie2cQFmAXKGIRMjJRbxXlZgtvVagKQOGbx0CWhK/6S/
	Oe/oYR/GvUch+gK2kkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqt3X-00CcFV-UK; Tue, 17 May 2022 08:59:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqt3H-00Cc82-NT; Tue, 17 May 2022 08:59:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BEB9E1F4437C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652777974;
 bh=Mb2hbGFeM52hKZ8GU+2jKOvCPHwygI7SBmGMh+S7OlU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NDMZMz97QjZ+6n2136BOiusqeDKlxIdwRmQgceeSDTjSCLr+lMkAx0TxgLYdbc6hU
 00ZvSwCp5Vd7txqOllbeGnJn4KXwvImPWH7zw/hbnhgiVBOBztGwVg444Ic/ExARH9
 XupLvHovcc8slkqLALq9Oye6c4F6K/QLr0R5O2bpeW5GZu4H6tYBADP7YZU/RHfpBV
 eqDjHgksANzacdkClI37ZkQt+8PFyKE81vs+9zbfXlXghjtg5/bnAoikL6GGlc2Yia
 lvDwPhg0on2pF8yOqMcI0upnJkAzug0gmFxhZ8oQapd5Vbq/rybDRGjnzunhTKROKJ
 7doURfJV/ecgw==
Message-ID: <ee5e5a81-1624-721a-3f9c-0ff7368f3724@collabora.com>
Date: Tue, 17 May 2022 10:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 5/5] clk: mediatek: Add MediaTek Helio X10 MT6795 clock
 drivers
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, y.oudjana@protonmail.com,
 jason-jh.lin@mediatek.com, ck.hu@mediatek.com, fparent@baylibre.com,
 rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
 <20220513165050.500831-6-angelogioacchino.delregno@collabora.com>
 <8177c547-2a38-691b-0a32-bc7e6ba1e2ed@gmail.com>
 <b65546e1-2d3a-d525-b664-1730dc06994f@collabora.com>
 <739b3ccc-e8ac-2748-9d40-0666a4038876@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <739b3ccc-e8ac-2748-9d40-0666a4038876@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_015936_080277_A614B7D3 
X-CRM114-Status: GOOD (  29.78  )
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

Il 17/05/22 10:48, Matthias Brugger ha scritto:
> Hi Angelo,
> 
> On 17/05/2022 10:07, AngeloGioacchino Del Regno wrote:
>> Il 16/05/22 13:30, Matthias Brugger ha scritto:
>>>
>>>
>>> On 13/05/2022 18:50, AngeloGioacchino Del Regno wrote:
>>>> Add the clock drivers for the entire clock tree of MediaTek Helio X10
>>>> MT6795, including system clocks (apmixedsys, infracfg, pericfg, topckgen)
>>>> and multimedia clocks (mmsys, mfg, vdecsys, vencsys).
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno 
>>>> <angelogioacchino.delregno@collabora.com>
>>>
>>> Thanks a lot for taking care of this!
>>> I just wonder if we couldn't build most of the clock drivers as modules like 
>>> done for the mt6779. It would help us to keep the kernel image smaller.
>>>
>>
>> Hello Matthias!
>>
>> You're welcome!
>> ...but I simply couldn't stand at seeing partially working (..or actually, not
>> really working) SoCs upstream. If something is upstream, it must work, or it
>> shouldn't be here for real :-)
>>
>> Regarding your question about the clock drivers as module... I believe we can,
>> but that'd be only for {vdec,venc}sys and *maybe* MFG (gpu clocks): I don't know
>> if it'd be worth to do, as these are about... 8 clocks out of... I haven't counted
>> them, but more than 250, I think?
>>
>> It *should* be straightforward though, just about giving them a tristate in Kconfig
>> instead of a bool, but that would still be limited to just those three...
>>
> 
> I think you could guide yourself by looking at
> f09b9460a5e4 ("clk: mediatek: support COMMON_CLK_MT6779 module build")
> 
> 

My clock drivers should already be able to be compiled as module, but I admit I
haven't even tried...
I'll check that commit out just to make sure that everything ticks right, thanks!

> I think having clocks as modules is a criteria to be part of Android's Generic 
> Kernel Image. Not that we target this here, just for your information (in case you 
> didn't know).
> 

No we're not targeting this, but if we have *no reason* to not be compatible with
GKI, we can satisfy that criteria, hence we have to.
Anyway - I didn't know that having clocks as modules was enforced by GKI... thanks
for the information!

>> The reason for me excluding clk-mt6795-mm from this choice is that - at least for
>> me - my development platform is a commercial smartphone, where the only thing that
>> "saves you" is having some display output... I mean - I *do* have a UART port, but
>> that's only because I've been able to solder thin wires on 0.2mm pads... you surely
>> agree on the fact that this isn't a common practice, even across developers.
>>
> 
> Yes I was wondering if you got some development smartphone or you did the 
> soldering. I have some solder knowledge but I think not enough to solder something 
> like this :D
> 

Hahaha! Everyone can do that by trying hard enough! You can, too! :-)

>> Besides, if you think that clk-mt6795-mm should indeed be a module by default,
>> well, that.. is.. possible - I don't see why it shouldn't be... obviously keeping
>> in mind that this will largely slow down the boot process, which isn't a big issue.
>>
> 
> Well I don't want to bother you with minor details, most important thing is that we 
> get support upstream... but ;) you can always mark the modules as compiled in, even 
> if it's tristate, which in your case you want to do.
> 
>> In any case, it is *not* possible to compile as module *any* of the clock drivers
>> that I have included in the CONFIG_COMMON_CLK_MT6795 (apmixed, infra, peri, topck)
>> as.. you know.. these are "a bit critical" on older platforms :-)
>>
>>
>> How would you proceed?
>>
> 
> I'd make all the drivers that theoretically can be build as modules tristate, you 
> can then define for your development environment to make them build-in.
> 
> Sounds good?
> 

Definitely - sounds good. You'll get a v2 ASAP, then!

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
