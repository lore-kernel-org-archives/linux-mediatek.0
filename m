Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62FBC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjXiSmZE8qt4l6SDKWvSagFOWUAnbzRXg8KGsa2R5+4=; b=WugK81lMg/nt98wUrnhfdX1q/Y
	FUQjf9mKFVP2PSILkOF+5Ja5B3ffW7hbD9iNqd3eAB8cXzngQXU5wlVjJQBkNDYry/6kI99dYxC8C
	7a0H21Q88x/X3d3QDX6OmyWNLBi1HUGuHcqDbqlK7X8xSqNDJJpgRrt37fvvLeTdMRg9f/XxAh2Mq
	O/TocMhNQ/4A5N1zYx8ZkI5LqYQsrMXRQ/LcTQBz8p1/+wbuXfb2Y0Z7XMHQ7Czi3b0pKoB+2u0nn
	9FJ4jvC+EPVUfyHjf+mx93lh7BZeRc9CFKQoktfiTCt2gwNSw8ptEHz+D/UeFDs1Yf3uiskBgv3zI
	WXmDeYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8HwZ-006EZl-0t; Mon, 04 Jul 2022 09:00:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hvi-006E8n-Jf; Mon, 04 Jul 2022 08:59:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F60B66015BA;
	Mon,  4 Jul 2022 09:59:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656925181;
	bh=vD4hvMa+D2Y960A8Jp1pvDzf4SloHgIl/k1DXoxXJyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XaReWsOoEXnyDB2hRvcDh0CZkYviM5JYojQpfFeQ9QLYduCj6NSMk+iMo4cvDz1DO
	 NN99bxfRRGMIIm5kW10CYIsE36Pkw3EGIf8w7WhnthC9e40e4pu3ZxGryAX9HDeL/K
	 2ePzLf3ATXDb+QPGpXHQM6Cj17trUxfiQ/iSSp6n57oc4diGQz25kKD0aSVGPyiiBE
	 bAfS4gCQnH0OkYmOApxca8A+3IwRsvIeCmqcI3/SBsCR3jqjRtDCh8q3lM1tGgbcnH
	 qa2zsdaTlCUaqISOh+0SNxJKgvHCyCQpIgKymkYHlYQNLfTwq0z7WuyQSAmAs/7EJ3
	 sEfyV4qfZh0fw==
Message-ID: <91e60954-d44d-f99f-2b4f-c164fb33cc0e@collabora.com>
Date: Mon, 4 Jul 2022 10:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/11] arm64: dts: mediatek: Introduce MT8195 Cherry
 platform's Tomato
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, hsinyi@chromium.org, allen-kh.cheng@mediatek.com,
 gtk3@inbox.ru, luca@z3ntu.xyz, sam.shih@mediatek.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-3-angelogioacchino.delregno@collabora.com>
 <20220701221158.iuw5fehgkjrqw6zh@notapiano>
 <CAGXv+5FwDuUjbP4THBsXorps12in-=JUtB-4VO5ygDBuQn1SeQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FwDuUjbP4THBsXorps12in-=JUtB-4VO5ygDBuQn1SeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_015942_821745_82744F33 
X-CRM114-Status: GOOD (  23.31  )
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

Il 04/07/22 06:17, Chen-Yu Tsai ha scritto:
> On Sat, Jul 2, 2022 at 6:12 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
>>
>> On Thu, Jun 30, 2022 at 05:33:07PM +0200, AngeloGioacchino Del Regno wrote:
>>> Introduce the MT8195 Cherry Chromebook platform, including three
>>> revisions of Cherry Tomato boards.
>>>
>>> This basic configuration allows to boot Linux on all board revisions
>>> and get a serial console from a ramdisk.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   arch/arm64/boot/dts/mediatek/Makefile         |  3 +++
>>>   .../dts/mediatek/mt8195-cherry-tomato-r1.dts  | 11 ++++++++
>>>   .../dts/mediatek/mt8195-cherry-tomato-r2.dts  | 11 ++++++++
>>>   .../dts/mediatek/mt8195-cherry-tomato-r3.dts  | 12 +++++++++
>>>   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 26 +++++++++++++++++++
>>>   5 files changed, 63 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
>>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
>>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> [..]
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>>> new file mode 100644
>>> index 000000000000..17e9e4d6f6ab
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>>> @@ -0,0 +1,11 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright (C) 2021 MediaTek Inc.
>>> + */
>>> +/dts-v1/;
>>> +#include "mt8195-cherry.dtsi"
>>> +
>>> +/ {
>>> +     model = "MediaTek Tomato (rev1) board";
>>
>> Given that the compatible is "google," I believe we'll want to rename the model
>> to "Google Tomato", much like was commented on the Asurada series [1], but
>> better to have confirmation from someone from Google. Chen-Yu? :)
> 
> I asked for clarification internally and it turns out we didn't get the
> Asurada series quite right either.
> 
> Google only owns the reference design, that is Asurada for MT8192 and
> Cherry for MT8195. The vendor own the end product design that is based
> off of Google's reference design.
> 
> So for Tomato, the vendor is Acer. Note that "Tomato" and the other
> codenames seen in ChromeOS are public codenames that Google uses.
> 
> The compatible string will likely stay "google,XXX", since this is set
> in firmware, and updating it after the product has shipped poses both
> a significant hurdle and risk.
> 

Yeah, makes sense. Should we call this "Acer Tomato (revX) board" then?
...if we do that, though, we need to know if the other revisions of Tomato
are also from Acer, or we would be getting one right and all the others wrong.

Cheers,
Angelo

> 
> Regards
> ChenYu
> 
>> Otherwise,
>>
>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> Thanks,
>> Nícolas
>>
>> [1] https://lore.kernel.org/all/CAGXv+5Gv2pjPXynz6HCdgux+giPDC5qRk+KW1aFduVz82rM=+g@mail.gmail.com/
>>
>>> +     compatible = "google,tomato-rev1", "google,tomato", "mediatek,mt8195";
>>> +};
>> [..]
>>> --
>>> 2.35.1
>>>


