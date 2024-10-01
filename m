Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEC3CE7D13
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GhjymdA1/EvYXGsK/SB9VF3drNFo21SXTRrdUivtT0=; b=gxhGPNA/ycen8AHlX4MPIcBjee
	nYVXouAnJRoRmkoNUHE9In0Pj+WQJtxhKZOh2gYi0C5hW+SAedZp0lPgaIE5sWXy+PcimlvgFJged
	iET/R+qXKNmL17wh/x42RDob9UqJuuIr13TAocsAje+8QOLN+jBQ1SidwADjaxqhVyqoS9NOzVEti
	PHLlJIysCp8d3jtijsqu5gpk3LzEXqXpQ7SIPpUbiaXberRb7lyWGNtTt+yxeL0chICiHGUKVCqzW
	3C8OpJ0d5Z2c99H9t8mw/l3RRrbTqCKHczLkX9E/fHcJLJo84OTFAEc2/22i47ZZjHAdypXpM4ifq
	dIBcLsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbQs-00000002bAk-1FdF;
	Tue, 01 Oct 2024 11:52:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svbB3-00000002XhA-1e5X;
	Tue, 01 Oct 2024 11:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727782582;
	bh=9LVfX5DE4WDwQ8o0TCm+Ht76lDuHkNfNyC8x+bsil+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e/86Gb1AM4O0IEKiOyQ4yd6lMyq+7+f7d7WHPpjqKiUuawvdYjDQdFqQQRDNIJOI7
	 WvCNWvzh6fOdo8MDAhOVuigra8U2jud1+AVMauKohpruTg8W3dAYvJeSnnyW0YGyT5
	 W46JHAjyJI5bpUBpw9iMJQxvAUL45xy8Jj8VWvZ25jDQtOt6i/8aFUm/hv4tQcFWr3
	 KPSsjgzVgt0OMO7u8Lk9PxCifkkRUuGwBo/3l3jyghZVHg+YviKsBOclkmmixg73pY
	 pBPFPm9XqNwRT6/NHi8rlFrhpHoPWf/YX9xbZ9E8a/bM2S/RWY7cZpQGjGL4h2/meN
	 H9MmARibsgmLA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64C2F17E0F7D;
	Tue,  1 Oct 2024 13:36:22 +0200 (CEST)
Message-ID: <b7032557-0b7c-4329-9762-14bda341e79c@collabora.com>
Date: Tue, 1 Oct 2024 13:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediate: Introduce MT8186
 Chinchou/Chinchou360 Chromebooks
To: =?UTF-8?Q?Albert_Jakie=C5=82a?= <jakiela@google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, wenst@chromium.org, rafal@milecki.pl,
 hsinyi@chromium.org, nfraprado@collabora.com, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240927122940.4190949-1-jakiela@google.com>
 <20240927122940.4190949-2-jakiela@google.com>
 <2c5614f7-0ada-453a-bd81-2f0054a919a0@collabora.com>
 <CAODvyLQ0pUUvBtfk7Pj05vwTkjEnCkfBY4-EG0okQB972tLC-g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAODvyLQ0pUUvBtfk7Pj05vwTkjEnCkfBY4-EG0okQB972tLC-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043625_607818_145F8CC4 
X-CRM114-Status: GOOD (  15.75  )
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

Il 01/10/24 13:13, Albert Jakieła ha scritto:
> Deleting `compatible` property will not allow the sound card to probe, so I
> override it with proper compat.
> 

The inherited `compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound"` from
mt8186-corsola.dtsi should allow that to probe correctly.

Can you please share the log of the error(s) that you're seeing?

Thanks,
Angelo

> On Mon, Sep 30, 2024 at 11:23 AM AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com> wrote:
> 
>> Il 27/09/24 14:29, Albert Jakieła ha scritto:
>>> The MT8186 Chinchou/Chinchou360, also known as the Asus Chromebook
>>> CZ12/CZ11 Flip, is a clamshell or convertible device with touchscreen,
>>> stylus and extra buttons.
>>>
>>
>> You have a typo in your commit title `mediate` -> `mediatek`
>>
>>> Signed-off-by: Albert Jakieła <jakiela@google.com>
>>> ---
>>> Changes in v2:
>>> - PATCH 2/2: Remove sku2147483647, remove duplicate nodes, add model
>>>        and remove uneccecery nodes from sound card.
>>> - Link to v1:
>> https://lore.kernel.org/all/20240925080353.2362879-2-jakiela@google.com/
>>>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/Makefile         |   3 +
>>>    .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
>>>    .../mediatek/mt8186-corsola-chinchou-sku1.dts |  34 ++
>>>    .../mt8186-corsola-chinchou-sku16.dts         |  28 ++
>>>    .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 432 ++++++++++++++++++
>>>    5 files changed, 515 insertions(+)
>>>    create mode 100644
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
>>>    create mode 100644
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
>>>    create mode 100644
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
>>>    create mode 100644
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
>>>
>>
>> ..snip..
>>
>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
>> b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
>>> new file mode 100644
>>> index 000000000000..96cc3c267c20
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
>>> @@ -0,0 +1,432 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright 2023 Google LLC
>>> + */
>>> +
>>> +/dts-v1/;
>>> +#include "mt8186-corsola.dtsi"
>>> +
>>> +/ {
>>
>> ..snip..
>>
>>> +
>>> +&sound {
>>> +     status = "okay";
>>> +
>>> +     compatible = "mediatek,mt8186-mt6366-rt5650-sound";
>>
>> Why did you keep the compatible string override?
>>
>>> +     model = "mt8186_rt5650";
>>> +
>>
>> Regards,
>> Angelo
>>
>>
>>
>>
>>
> 



