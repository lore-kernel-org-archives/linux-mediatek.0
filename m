Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E207FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 09:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdsWct/dTCq4GSQXZAMPRtS3IJSqr2FyTQT6/oSt7U8=; b=paa2aMbnnjcY17QAOQvbtkDWuP
	zZyTWx+Uc8ItW7UPabBDcG3uM/5PLK0g3eOIzD7KjSZ1qiWapvEcgpbLUfZ3upqlwrbP/R/UBzc3y
	nbFXnedG/KveAjUEK0DkNNnUlvaIhf7G3SzVceuDGm35qeb3O/oF1jlH7HIyX/fffxXRU2ZRhNQbV
	Ao0SAZWHZHYynMOZE4Ef2Y2AJWua9U0c0uNgD7mjs+MuWzyYcCW6fDc2UrX+HhpAgH6937nglbAfN
	Ex4ooG+1YysT79iq/kOgbH8ruYAJG+22nPz6wbfJpRHTofKS2vvynN9bOd76QMLRMLpwDzO6LKSdG
	Xbntsxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8I2x-006Ibz-Iu; Mon, 04 Jul 2022 09:07:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8I2b-006IOI-VS; Mon, 04 Jul 2022 09:06:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BECD066015C4;
	Mon,  4 Jul 2022 10:06:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656925608;
	bh=ZLaV/c/rcUgSuQPVP2rou6vYx2Qty36P/udcHxe9V40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=khwsrNIdeMvoixIqNmkbZ3jCLNdaVHSmHSAIRQwlbY+zvpzs/v4XSY9GveHyRDJvh
	 8B0n85T7AEPlmGjkqwUpr0aeApKoFXEr5pUcpn7+qj1JKrt+gGbMSa31twx3fqBPha
	 8avirJFoTaK4HHAtJtJhV5S0TJcIiqzn9/WPsZHospgh6TTMaPpD4nWOUJjnjR1pzI
	 OSOdAHGHqiUwan8MUQJIYgk/niuBMgNb+2pUvR3+00r3Rye8TxjDNG+9Tfbnp8Gd6Z
	 2+QMhaK6oNKnMrfA+ebrS69u/+bDJMjzHeMRcBxC74jRsKXcsENErBguXR59FQS6iP
	 uZGIiRg3jpQGw==
Message-ID: <623cb2a8-ff28-9bda-04a9-0c64c31616b1@collabora.com>
Date: Mon, 4 Jul 2022 11:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/11] arm64: dts: mediatek: Introduce MT8195 Cherry
 platform's Tomato
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, hsinyi@chromium.org, allen-kh.cheng@mediatek.com,
 gtk3@inbox.ru, luca@z3ntu.xyz, sam.shih@mediatek.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-3-angelogioacchino.delregno@collabora.com>
 <20220701221158.iuw5fehgkjrqw6zh@notapiano>
 <CAGXv+5FwDuUjbP4THBsXorps12in-=JUtB-4VO5ygDBuQn1SeQ@mail.gmail.com>
 <91e60954-d44d-f99f-2b4f-c164fb33cc0e@collabora.com>
 <CAGXv+5HUQ1pNSDqyiH8taec8ykeaztjNY5dQPKTcJPpYh5JS9g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5HUQ1pNSDqyiH8taec8ykeaztjNY5dQPKTcJPpYh5JS9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_020650_333467_655F9D1A 
X-CRM114-Status: GOOD (  20.87  )
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

Il 04/07/22 11:05, Chen-Yu Tsai ha scritto:
> On Mon, Jul 4, 2022 at 4:59 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 04/07/22 06:17, Chen-Yu Tsai ha scritto:
>>> On Sat, Jul 2, 2022 at 6:12 AM Nícolas F. R. A. Prado
>>> <nfraprado@collabora.com> wrote:
>>>>
>>>> On Thu, Jun 30, 2022 at 05:33:07PM +0200, AngeloGioacchino Del Regno wrote:
>>>>> Introduce the MT8195 Cherry Chromebook platform, including three
>>>>> revisions of Cherry Tomato boards.
>>>>>
>>>>> This basic configuration allows to boot Linux on all board revisions
>>>>> and get a serial console from a ramdisk.
>>>>>
>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/mediatek/Makefile         |  3 +++
>>>>>    .../dts/mediatek/mt8195-cherry-tomato-r1.dts  | 11 ++++++++
>>>>>    .../dts/mediatek/mt8195-cherry-tomato-r2.dts  | 11 ++++++++
>>>>>    .../dts/mediatek/mt8195-cherry-tomato-r3.dts  | 12 +++++++++
>>>>>    .../boot/dts/mediatek/mt8195-cherry.dtsi      | 26 +++++++++++++++++++
>>>>>    5 files changed, 63 insertions(+)
>>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
>>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
>>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>>> [..]
>>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>>>>> new file mode 100644
>>>>> index 000000000000..17e9e4d6f6ab
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>>>>> @@ -0,0 +1,11 @@
>>>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>>>> +/*
>>>>> + * Copyright (C) 2021 MediaTek Inc.
>>>>> + */
>>>>> +/dts-v1/;
>>>>> +#include "mt8195-cherry.dtsi"
>>>>> +
>>>>> +/ {
>>>>> +     model = "MediaTek Tomato (rev1) board";
>>>>
>>>> Given that the compatible is "google," I believe we'll want to rename the model
>>>> to "Google Tomato", much like was commented on the Asurada series [1], but
>>>> better to have confirmation from someone from Google. Chen-Yu? :)
>>>
>>> I asked for clarification internally and it turns out we didn't get the
>>> Asurada series quite right either.
>>>
>>> Google only owns the reference design, that is Asurada for MT8192 and
>>> Cherry for MT8195. The vendor own the end product design that is based
>>> off of Google's reference design.
>>>
>>> So for Tomato, the vendor is Acer. Note that "Tomato" and the other
>>> codenames seen in ChromeOS are public codenames that Google uses.
>>>
>>> The compatible string will likely stay "google,XXX", since this is set
>>> in firmware, and updating it after the product has shipped poses both
>>> a significant hurdle and risk.
>>>
>>
>> Yeah, makes sense. Should we call this "Acer Tomato (revX) board" then?
>> ...if we do that, though, we need to know if the other revisions of Tomato
>> are also from Acer, or we would be getting one right and all the others wrong.
> 
> AFAIK each "device build" is its own project and gets its own codename,
> otherwise it would get real confusing for us internally really fast.

All clear.

Thanks,
Angelo

> 
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>>
>>> Regards
>>> ChenYu
>>>
>>>> Otherwise,
>>>>
>>>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>>
>>>> Thanks,
>>>> Nícolas
>>>>
>>>> [1] https://lore.kernel.org/all/CAGXv+5Gv2pjPXynz6HCdgux+giPDC5qRk+KW1aFduVz82rM=+g@mail.gmail.com/
>>>>
>>>>> +     compatible = "google,tomato-rev1", "google,tomato", "mediatek,mt8195";
>>>>> +};
>>>> [..]
>>>>> --
>>>>> 2.35.1
>>>>>
>>


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

