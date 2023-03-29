Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BBCC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3s5NWRjS9coC3ccmZgbuJi7DekhF5XXhsKpa86Jq5k=; b=h6TPbICPC4xGz6mGTX65mz5ajM
	bLKOsPetMJNL/IgSGMcmOLl+doiEDH3zLD/1AYx22VxtIFjmcsNXBSFYUOX652W1VP6nBQWaridt1
	l0poYmggsoHVxRVky11yxeQwYO1cRwXcyyj3ozsGIm1EEwfD23U7x76wFfz7EHPeckzh43Vh7O46p
	SeRCJrb6PoGmk6Gg3+jUH0tbks4BEjcjb6gLuHrINfMpL0fLFm9Yt8asFXQ0u5UWBZxtA/XAw4He4
	wHsY8XeAmuqCSaVemJ1RsoBCI/+Y+P+bu3si5OVI8xDLL9VEE8Ojy39WuLFbPXwMFZKPtQ3MCLFID
	bFlq+0Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVZp-000IPB-1M;
	Wed, 29 Mar 2023 13:10:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVZl-000INt-1J;
	Wed, 29 Mar 2023 13:10:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 51639660316A;
	Wed, 29 Mar 2023 14:10:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680095449;
	bh=zVF05hk59CfKnrDedjRCcIbn2rciK8fjt91K0SYGKs0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kLIK6vjSO6D3vnJU2Y7GEV43CCe5hMhUPU3FsmrbVWeNYe3O8t24DRNXUTqQizhdU
	 ZAlqnoByiPIvJX30W/jOXgt2jHTvDGSgVW+60vqcRDFan1dg4/z4wjb7UqK8sOAec2
	 ryVNiwSiqt3/NQqpwhw0lakQN4VnwMadeDs0S385Xv4170Tvp+efdDBwvPVuv3U5FD
	 NLixSbFUA8U5m+bxYm/cgN8LDSRylYG9jtYyYGzqW/dnoIKRq2VOnZizqUsYJLq6Et
	 j49ucpc/ut6t/bYR8lRX4/L7LpvF58zHTqtlsfn1V9+WAHnqvJJnIcgkid6lii4SP6
	 2H/zbEDSiZOIQ==
Message-ID: <75a890d1-b3b9-0316-749b-fb2bf80c3176@collabora.com>
Date: Wed, 29 Mar 2023 15:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Split out CPUXGPT
 timers
Content-Language: en-US
To: =?UTF-8?B?V2FsdGVyIENoYW5nICjlvLXntq3lk7Ip?= <Walter.Chang@mediatek.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 =?UTF-8?B?RnJlZGR5IEhzaW4gKOi+m+aBkuixkCk=?= <Freddy.Hsin@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20230309103913.116775-1-angelogioacchino.delregno@collabora.com>
 <e5fabff45596df1e78ed781e7433687327a807dc.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e5fabff45596df1e78ed781e7433687327a807dc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_061053_572296_98585994 
X-CRM114-Status: GOOD (  22.95  )
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

Il 29/03/23 09:51, Walter Chang (張維哲) ha scritto:
> On Thu, 2023-03-09 at 11:39 +0100, AngeloGioacchino Del Regno wrote:
>> On MediaTek platforms, CPUXGPT is the source for the AArch64 System
>> Timer, read through CNTVCT_EL0.
>>
>> The handling for starting this timer ASAP was introduced in commit
>> 327e93cf9a59 ("clocksource/drivers/timer-mediatek: Implement CPUXGPT
>> timers")
>> which description also contains an important full explanation of the
>> reasons why this driver is necessary and cannot be a module.
>>
>> In preparation for an eventual conversion of timer-mediatek to a
>> platform_driver that would be possibly built as a module, split out
>> the CPUXGPT timers driver to a new timer-mediatek-cpux.c driver.
>>
>> This commit brings no functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>
>> Note: I've added a mention to the commit that is introducing CPUXGPT
>> because it contains a broad explanation about why this is needed and
>> why it is mandatory to have it as built-in and initialized as early
>> as possible. This is mostly because this question was asked multiple
>> times and I've been pointing people to that commit to explain it all.
>>
>> This commit was made because of a discussion about the impossibility
>> to convert timer-mediatek to a module: even though that's definitely
>> not easy at all, this will make sure that whatever cannot (ever) be
>> built as module goes out of that driver.
>>
>> I tried to tackle a timer-mediatek conversion to platform_driver as
>> well, but I don't currently have the required bandwidth to do so:
>> as a first step I moved that, so I'm pushing this commit as to try
>> to reduce duplicated work.
>>
>> This commit was tested on MT6795 Sony Xperia M5.

..snip..

>> @@ -452,4 +339,3 @@ static int __init mtk_gpt_init(struct device_node
>> *node)
>>   }
>>   TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>>   TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer",
>> mtk_syst_init);
>> -TIMER_OF_DECLARE(mtk_mt6795, "mediatek,mt6795-systimer",
>> mtk_cpux_init);
> 
> This patch looks good to me. Thanks for assisting us in spliting out
> the CPUX driver.
> 

Hello Walter,

thanks for checking this patch. If you have actually reviewed this one,
you could help the maintainers to know by releasing your Reviewed-by tag
on this patch.

Regards,
Angelo



