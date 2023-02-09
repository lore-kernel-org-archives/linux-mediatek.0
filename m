Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2818C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FswkjIXLYTHUtyxyGLmwf2cbBixonK1OPoMX2e8/z4M=; b=g55e9B2fcEGVnlccUNiEurHiBJ
	+hxwZqEcH9C3zRa7EslHD/tNaq4hiYHcp8nQlhvAIjPMzCIn5NC5X2/ZYmXhcrg+8bdUwvarcVIJ1
	idr6RuKofQd6LC28b0pDIAsu0ps7dDEMTnhGZ8CXdgNOXXkTFykxYczcSlxp2209Ron9o0p5wpTIX
	E66rsF/RSwptdj3G1OTqDdEz9iXiRt+LFbUnnbofS+SMNiY1leBuTRl1mKmJ02N1tD/4N/m46VNez
	RbZ+0A+mu99JgbQdm6/QEW980KDSxUem3p98DCNN4Us1cPW2o3ykdVBcm6mk9VjOTR86nWuYwBLnT
	EpykyEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ30g-000hqC-Mg; Thu, 09 Feb 2023 09:14:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ30T-000hl0-JH; Thu, 09 Feb 2023 09:14:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0FA9966020B9;
	Thu,  9 Feb 2023 09:14:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675934053;
	bh=X5aykjwR6Noi8jAOHiqv2GSFOIbKzmDiWJfxsu4VbMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FkgnIEjwSVQE5ec4W06abDhr1CC/YzTFVarvXPYUPv7D1zgXwHOdWwPSCspFnzugx
	 2VBw66rpynAQuskqFhNrPQaVMtIrP9oKKbJ4U75nvZIVmJK/zB3rFy5JKdp4v2NogA
	 R3+fe3ywtA0F2km85iyHw7Udf2aD8o7JYTvQrB3NnsCNLE5CaogZHHm8hpA19w7+2N
	 ryKevvAcea6/xFzwuN19ELDukLFQZsa1I7JvuGqSonY3icS+MH0pHogm2BuZNFDNgj
	 iXKxjp9OQUWx+7eQp/Gr7mhjYtRCv6avpsyinnH0ar6LoxuS1ziPbTtXDho8KdWh3m
	 /fBHZTZsz15UQ==
Message-ID: <62a86fd9-5770-c32c-ad65-467940cc3ee0@collabora.com>
Date: Thu, 9 Feb 2023 10:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 35/45] clk: mediatek: Split MT8195 clock drivers and
 allow module build
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 johnson.wang@mediatek.com, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com,
 msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com,
 zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
 yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com,
 sean.wang@mediatek.com, chen.zhong@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-36-angelogioacchino.delregno@collabora.com>
 <CAGXv+5HTP0cLGEQ+qkAt8nsOp5DqCOgPyAOJ66fF91SKX=hZvw@mail.gmail.com>
 <45f8e284-8d56-898b-0897-94c576e09c2c@collabora.com>
 <CAGXv+5FmmDx0Q_d17hv1gu+drfD12-vtgPoTpefExHGvdkcQyA@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FmmDx0Q_d17hv1gu+drfD12-vtgPoTpefExHGvdkcQyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_011417_848591_F02D92FD 
X-CRM114-Status: GOOD (  23.20  )
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

Il 09/02/23 04:46, Chen-Yu Tsai ha scritto:
> On Wed, Feb 8, 2023 at 5:00 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 08/02/23 09:28, Chen-Yu Tsai ha scritto:
>>> On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
>>>> option: there's no reason to do that, as it is totally unnecessary to
>>>> build in all or none of them.
>>>>
>>>> Split them out: keep boot-critical clocks as bool and allow choosing
>>>> non critical clocks as tristate.
>>>
>>> The power domain controller references vppsys*, vdecsys*, vdosys*, wpesys,
>>> imgsys and camsys. I'd argue that this makes these clock drivers
>>> semi-boot-critical. Maybe mfgcfg as well when we add the GPU?
>>
>> You don't need to power on additional power domains if you want to load modules
>> from a ramdisk! :-)
> 
> Right.
> 
>> Besides, you caught me: mtk-pm-domains will be my next target after clocks...
>> I don't like how it behaves in regard to probe deferrals. Specifically,
>> I dislike the fact that you either register *all domains* or *none at all*
>> (unless instantiating two different driver instances and that's ugly).
> 
> I don't really like it either, but is it possible to split probe deferrals?
> I mean, if you skip a couple power domains because the clocks aren't
> available, how do you come back to them?
> 

Honestly, I have no clue right now - I didn't even think about any possible
implementation for now... but let's see what I can come up with whenever I
get a chance to actually take a look.

Surely not before finishing work on this series, though.

> And IIRC for a clock provider that is _not_ marked as disabled in the DT,
> trying to fetch a clock from it would just give -EPROBEDEFER until
> the provider is registered.
> 

Yes it will give a probe deferral. An internal probe retry mechanism on the
power domains that couldn't probe would be one of the possible options.

Actually, we have almost endless options on how to resolve that power domains
issue, so it's not worrying me at all!

Cheers,
Angelo

> ChenYu
> 
>>>
>>> They should be bundled together at the very least. The power domain
>>> controller not probing disables all display and multimedia capabilities.
>>>
>>> Also wondering if we should have "default COMMON_CLK_MT8195" ...
>>>
>>> I suppose the same questions apply to other SoCs.
>>>
>>> ChenYu
>>
>>


