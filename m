Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0166FC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmiGLlhATMklnA9oUrdyrSoRePBdjMSz7XgSSbWBZAM=; b=HZF3WHRxWV1GSq7rUYyvj6rogY
	Cr+RZ7Rx9Yv9X4LJf4XSyRvHgHTgi3hTuihxd8wDGD1Y8tW9VmGEK2ulF3wDvWRwTyPWJCasnU4QC
	jWC5qvAwnt7ZyF6buxQmlV/0peHqA/0ZzY++yEYij1qaV6igmW9eBbhTfZyy2AtcfrOOiZ4GcwA47
	tLQW5BH5f3YapAVrq9hh+s/VFtH7KLD2J9IXfm0dhDqJPps9Fv1rlTqNaJOuqByGbqmnzJDzWGJdS
	6sSffWxXTIq2NfTvWt7ywSrIPNvWuPxTWkHZHXTQ57e1eAJFIDEsfFAwJ2/j2hjnNLcx5VO1F9XPN
	r4t8oiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDD3-00000003vcY-3PZN;
	Thu, 02 Jul 2026 08:55:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDD1-00000003vbt-0rpx
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 08:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782982544;
	bh=IGCykDh6psS+r7kUCWByAKB9NnFwtLwmKKrpYiTMfx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LGrgx/g4Ftej2T+WGhpzoX+1btciiqeo47agTbAmlff18OS1sS8CxQ3NnEgsHn4dE
	 LBz0ansDXylX3Wzu+L11kXj5v6lYKgQot+6oBK0IzYIYoNVdugWcdho6GKYS0f9AUN
	 NMICkuXpal2sCOViaKChuV52YmidvRwTaLm7fKvDAubmjA8FPXKxTi5IYwuFmQJ6WA
	 13t82xE6lDvifYjNkB0+MOkaVIliHOJL1x4NEJvTAyH6OvjmTJkMUhZw0SA0bvZPH2
	 UTf2QhYl6RM0v3Bh+EI/YvQcWjjLRiNORGgwiCC1M5mRudk2F55ylZ72PUQ/4YYNJE
	 ayzww6GwZ6xPA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19E7E17E00A0;
	Thu,  2 Jul 2026 10:55:44 +0200 (CEST)
Message-ID: <7ad86380-6fc3-40d0-8908-22ab2943ac55@collabora.com>
Date: Thu, 2 Jul 2026 10:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
To: Conor Dooley <conor@kernel.org>,
 =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
 <Chun-hung.Wu@mediatek.com>,
 "linux-devicetree@vger.kernel.org" <linux-devicetree@vger.kernel.org>,
 =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
 <20260626074820.2537772-2-peter.wang@mediatek.com>
 <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
 <d077d61fa0e22a2e602dc3c8b47512a847f1049e.camel@mediatek.com>
 <20260701-city-during-7d76a326f2f4@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701-city-during-7d76a326f2f4@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_015547_410910_473E0109 
X-CRM114-Status: GOOD (  28.59  )
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

On 7/1/26 18:57, Conor Dooley wrote:
> On Wed, Jul 01, 2026 at 06:35:20AM +0000, Peter Wang (王信友) wrote:
>> On Fri, 2026-06-26 at 10:33 +0200, Philipp Zabel wrote
>>>
>>> Where is the binding doc for mediatek,mt8183-ufs0cfg_ao? Is this
>>> simple-mfd just to load the reset driver?
>>>
>>
>> Hi Philipp,
>>
>> Thanks for the review, and sorry for the late reply.
>> Yes, "mediatek,mt8183-ufs0cfg_ao" should be removed.
>> I will remove it in the next version.
>>
>>>> +        reg = <0x16840000 0x1000>;
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <1>;
>>>> +
>>>> +        ufs0cfgao_rst: reset-controller {
>>>> +            compatible = "mediatek,syscon-reset";
>>>
>>> It looks to me like this is just two registers inside ufs0cfg_ao, not
>>> a
>>> separate device. Why don't you just add #reset-cells to the parent
>>> node?
>>>
>>>> +            #reset-cells = <1>;
>>>> +            mediatek,reset-bits =
>>>> +                <0x48  3  0x4c  3  100>,
>>>> +                <0x148 0  0x14c 0  100>,
>>>> +                <0x148 1  0x14c 1  100>,
>>>> +                <0x148 2  0x14c 2  0>;
>>>> +        };
>>>
>>> Why is this in DT? This should be a table in the reset driver.
>>>
>>> regards
>>> Philipp
>>
>> Regarding the child node and reset-bits in DT,
>> We chose the child node approach with 'mediatek,reset-bits' defined
>> in DT to keep the reset line descriptions self-contained and reusable
>> across different SoC variants. MediaTek has many SoCs (mt8183, mt6985,
>> mt6989, ...) where the same UFS subsystem may have different register
>> offsets for reset lines. By describing them in DT, we can support new
>> SoC variants by updating the DT alone, without requiring a new driver
>> patch for every new SoC.
> 
>  From what I recall, mediatek ufs is a mess with lots of vendor kernel
> type things slipping into mainline without proper review on the DT
> front.
> Because of that, I at least am going to require that everything is done
> completely (and perhaps excessively) by the book here, including
> introducing complete bindings for syscon regions rather than partial
> bits for components like this one.
> 

Conor, thanks for chiming in.

I would've done that earlier but I'm going through a bit of busy period here, so
thanks x2.

Yes the UFS driver is quite a bit messy.
The latest version of our series that cleans it up is version 9, sent quite a while
ago at this point:

https://patchwork.kernel.org/project/linux-scsi/cover/20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com/

...but anyway, during these months we kept going on with it and we do have a newer
version of this series in our tree, which we're planning to send in a week or two.

That'll start fixing stuff around, at least, in both bindings and code.

>> This approach is also consistent with the existing 'ti,syscon-reset'
>> binding, which uses a similar per-entry table property 'ti,reset-bits'
>> to describe reset lines within a syscon block.
> 
> This was done about 10 years ago, I would not consider it a guide for
> what's acceptable today.
> 

I completely agree about that. Honestly, I'm not even sure why MediaTek needs the
resets in the ufscfg0-ao space (because I didn't do extensive research, but that
might be rightful), but this is getting a bit annoying as they keep pushing for
adding something similar to the TI syscon reset at least at every new chip that
comes out (or every 6-8 months if I recall correctly), and we keep doing the same
review over and over.

Please MediaTek, stop trying to add syscon-reset. Please!

I know that you're trying to do that because in your downstream you never stopped
using ti,syscon-reset: if that works better for you in your downstream, that's ok
as it's purely yours but, as a matter of fact, in this form, it's not upstreamable.

If you have to upstream a *pure* reset controller, make a reset controller driver
and put it in the appropriate kernel subsystem - but I also want to remind you
that I know MediaTek SoCs, and I know that up until MT8196 there shouldn't be any
hardware that is purely a reset controller (as in, there's no IP that manages only
resets).

Thanks everyone!
Angelo

