Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F278C3DA41
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbWRyQHdbZRGFzVDMgXq8UvaMtMnzRCnJkMmJq9icpY=; b=JNeWUAVK4Je376AqEQn0kIrL0s
	SwuFAvO4d3FWoNuyld4n2ZY3a+dmDofdNiyVv7lSp10f+fvkA7sj2U9Lp75pvyVUAxSukln5A/7hS
	jy7PFmLMwJIij0AAP9tlMMWfLPw/5Y6n6eIRMqiZDt6UX23klB+x05Kt6JbJ2pCT63BeOXSglYXHk
	85ed+mEA+naL/Pwg2Sep4ExKp+Gg84ppCjLtRoiB14sArd2q+4CvFxR5i+AsIfwW5/kud5Y4LFTQT
	/2YabKkS0Hzi+Cg4k6Q8xq5I0kwGy8ZEAbHHM9fuHsfX0OOWi3UprEdSi0DpWXwDBNe6PecHy/qUP
	+4ZZb7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpzb-0000000DL3o-3gVV;
	Thu, 11 Jul 2024 09:21:35 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpzJ-0000000DKz0-2eqO;
	Thu, 11 Jul 2024 09:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720689675;
	bh=tQJG8NMkrg/xn3s3bUs1n5Z3qe5f9ytiiGMbVgyGTIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xy8zeInqd48+wCBkc5QVrJawwT+52nNTL1C+MooVJlMxQKTd0rRFbRbL+kyaEyw0n
	 dl8rOynHmRCEEjrS0uK/VWHdeKddAp6G5EFTD4fwKFSOYKmfKctAhffrvqIh/f28tw
	 X4Kv4sQQylJ6LjB4kN6IsHSV8zNKiOUcscCdIbrJz71O/jksNPCedqTBVUzgXGtwFN
	 aIYBOgEREZPdl9NFzOUQXR9E3NHaPdEbYo9wB0onL0+n/ysyXLxj/d7NsxWR+nhQ1u
	 At6FwucdE0gYXcDuqvAcOhedrJ4Wduu83vB4IuBIUfSYoQjwzQOATADYqDv6vpahG7
	 pnxxvUG6nKFSg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0051137811F4;
	Thu, 11 Jul 2024 09:21:14 +0000 (UTC)
Message-ID: <2dba1638-f155-463b-8f87-421101b8f4f2@collabora.com>
Date: Thu, 11 Jul 2024 11:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Probe failure of usb controller @11290000 on MT8195 after
 next-20231221
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 Chen-Yu Tsai <wenst@chromium.org>, Bear Wang <bear.wang@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>
References: <9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano>
 <064935d8-fbda-4eda-b013-8c8fc63b561c@collabora.com>
 <375b2345-657a-4b8f-b5e3-dc16784ffde9@notapiano>
 <da27d957-866f-f055-9e83-cdc362d98dc7@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <da27d957-866f-f055-9e83-cdc362d98dc7@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_022117_830560_2893D7B1 
X-CRM114-Status: GOOD (  28.05  )
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

Il 11/07/24 06:13, Macpaul Lin ha scritto:
> 
> 
> On 7/11/24 03:15, Nícolas F. R. A. Prado wrote:
>> On Fri, Jan 19, 2024 at 10:12:07AM +0100, AngeloGioacchino Del Regno wrote:
>>> Il 18/01/24 19:36, Nícolas F. R. A. Prado ha scritto:
>>>> Hi,
>>>>
>>>> KernelCI has identified a failure in the probe of one of the USB controllers on
>>>> the MT8195-Tomato Chromebook [1]:
>>>>
>>>> [   16.336840] xhci-mtk 11290000.usb: uwk - reg:0x400, version:104
>>>> [   16.337081] xhci-mtk 11290000.usb: xHCI Host Controller
>>>> [   16.337093] xhci-mtk 11290000.usb: new USB bus registered, assigned bus 
>>>> number 5
>>>> [   16.357114] xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
>>>> [   16.357119] xhci-mtk 11290000.usb: can't setup: -110
>>>> [   16.357128] xhci-mtk 11290000.usb: USB bus 5 deregistered
>>>> [   16.359484] xhci-mtk: probe of 11290000.usb failed with error -110
>>>>
>>>> A previous message [2] suggests that a force-mode phy property that has been
>>>> merged might help with addressing the issue, however it's not clear to me how,
>>>> given that the controller at 1129000 uses a USB2 phy and the phy driver patch
>>>> only looks for the property on USB3 phys.
>>>>
>>>> Worth noting that the issue doesn't always happen. For instance the test did
>>>> pass for next-20240110 and then failed again on today's next [3]. But it does
>>>> seem that the issue was introduced, or at least became much more likely, between
>>>> next-20231221 and next-20240103, given that it never happened out of 10 runs
>>>> before, and after that has happened 5 out of 7 times.
>>>>
>>>> Note: On the Tomato Chromebook specifically this USB controller is not connected
>>>> to anything.
>>>>
>>>> [1] 
>>>> https://urldefense.com/v3/__https://linux.kernelci.org/test/case/id/659ce3506673076a8c52a428/__;!!CTRNKA9wMg0ARbw!jtg5drII8WUPwTiL4sWZiSRPXN-EBN8ctTGI85sirqvkmaUbA5z-wrLqPPfxlZZkQ7NItOWDT97OSdENT5oGHKY$
>>>> [2] https://lore.kernel.org/all/239def9b-437b-9211-7844-af4332651df0@mediatek.com/
>>>> [3] 
>>>> https://urldefense.com/v3/__https://linux.kernelci.org/test/case/id/65a8c66ee89acb56ac52a405/__;!!CTRNKA9wMg0ARbw!jtg5drII8WUPwTiL4sWZiSRPXN-EBN8ctTGI85sirqvkmaUbA5z-wrLqPPfxlZZkQ7NItOWDT97OSdENi-d0sVc$
>>>>
>>>> Thanks,
>>>> Nícolas
>>>
>>> Hey Nícolas,
>>>
>>> I wonder if this is happening because of async probe... I have seen those happening
>>> once in a (long) while on MT8186 as well with the same kind of flakiness and I am
>>> not even able to reproduce anymore.
>>>
>>> For MT8195 Tomato, I guess we can simply disable that controller without any side
>>> effects but, at the same time, I'm not sure that this would be the right thing to
>>> do in this case.
>>>
>>> Besides, the controller at 11290000 is the only one that doesn't live behind MTU3,
>>> but I don't know if that can ring any bell....
>>
>> An update on this issue: it looks like it only happens if "xhci-mtk
>> 11290000.usb" probes before "mtk-pcie-gen3 112f8000.pcie". What they have in
>> common is that both of those nodes use phys that share the same t-phy block:
>> pcie uses the usb3 phy while xhci uses the usb2 phy. So it seems that some of
>> the initialization done by the pcie controller might be implicitly needed by the
>> usb controller.
>>
>> This should help to narrow down the issue and find a proper fix for it.
>>
>> Thanks,
>> Nícolas
> 
> 'force-mode' should only applied to the boards which require XHCI function instead 
> of a PCIE port.
> 
> For example, mt8395-genio-1200-evk.dts requires property 'force-mode' to fix probe 
> issue for USBC @11290000.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/commit/?h=v6.10-next/dts64&id=666e6f39faff05fe12bfc64c64aa9015135ce783
> 
> 'force-mode' should be no need for tomato boards and the behavior should be the 
> same as before.
> 
> Another possibility is the firmware change on tomato boards. I'm not sure if there 
> is any changes on tomato's recent firmware for tphy of this port, which could also 
> be a reason causes this kind of failure.
> I don't have tomato boards on hand.
> 

Hello Macpaul,

it's just about the usb node missing a power domain: as the PCIE_MAC_P1 domain
seems to be shared between USB and PCIe, adding it to the USB node fixes the
setup phase.

I'll send a devicetree fix soon.

Cheers,
Angelo

> Thanks
> Macpaul Lin


