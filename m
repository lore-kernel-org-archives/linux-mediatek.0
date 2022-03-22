Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F95C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVKzSq/UkDf7CfQ09bfMimGwnoA5mULNoFZR2DXnjjw=; b=JG4EIs3xe4muCz
	C7JHavm5pTfIDXqzFXYrI8Z2TRI/LUQxtd0F3x4TY5G6jPlofG7mpf5RNholYSUiEsN4eMP4ZJTqF
	Y9QbixDnf/RFR20aZDmjoXEWoQXko3Wk5CODlIgOaDBGpWsicf7KZqEdyS7Vn37EEoNL+vTL7DY6I
	S+lg2EBDK6xWOskDVoJtlmuvPgU/3PBS9qGZzUIYuJbxe24x6G0Hxiqa+GnXDdjckC4k3CMlZElFW
	MJ7V38niCiaMckVlaoEmun1+kM0yXLDiE8+9PWBH8LQA5NG845wZPWo2mh7BfD++Um4VaH3Lq/GOf
	uAAYMBiuK3Fz388M5muQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWa6J-00ASKl-IE; Tue, 22 Mar 2022 08:42:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWa66-00ASGB-2N; Tue, 22 Mar 2022 08:42:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 648181F43DA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647938552;
 bh=ZNH440yknkDh/m/M5zf1aXWnLlpXC6fg0XWbHBtoN7M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EeM1uYKCpBYjXvUDyOx6y+vxbXAaJzLk3Ge26/1Xy2eJCOadADsvRuo+jPUVoEE5v
 igb7eq2Oduhale4IAuQUCnGb+Ejf4u1MJviwCMkjuKHu9VEfMMaHni45sLbQ3xTM7O
 Duw29OL3LMKr/mdC6t6yjGGaJbaiACBaGwBpOiTKGQ3kM7AKWw/7Z46wtrkRxMa9ld
 uQgJKW3XvSVzB5FznnLyn3mQFzltxOyymH3s8st6eR6W+G9mWxunJcKO/GTfBFI8hV
 LEuMbAXpELgraVmQxSK/he0kT6rFfKF/OIyGjQZOULwwAF8t+OAvCCjeB+hBR2CsvQ
 vcKOEppgZpCjA==
Message-ID: <5d9c7655-b05e-aa77-d405-c1ec971daa77@collabora.com>
Date: Tue, 22 Mar 2022 09:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Content-Language: en-US
To: Axe Yang <axe.yang@mediatek.com>, Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220321115133.32121-1-axe.yang@mediatek.com>
 <20220321115133.32121-2-axe.yang@mediatek.com>
 <YjkKURNzg8JPbXcg@robh.at.kernel.org>
 <b03df175f871ee9a6561862f5bd7bceb9cafbde1.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b03df175f871ee9a6561862f5bd7bceb9cafbde1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_014234_345973_F56CC5DF 
X-CRM114-Status: GOOD (  16.18  )
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

Il 22/03/22 02:35, Axe Yang ha scritto:
> On Mon, 2022-03-21 at 18:29 -0500, Rob Herring wrote:
>> On Mon, Mar 21, 2022 at 07:51:32PM +0800, Axe Yang wrote:
>>> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
>>> This feature allow SDIO devices alarm asynchronous interrupt to
>>> host
>>> even when host stop providing clock to SDIO card. An extra wakeup
>>> interrupt and pinctrl states for SDIO DAT1 pin state switching are
>>> required in this scenario.
>>>
>>> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
>>> ---
>>>   .../devicetree/bindings/mmc/mtk-sd.yaml       | 23
>>> ++++++++++++++++++-
>>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> index 297ada03e3de..f57774535a1d 100644
>>> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> @@ -69,12 +69,23 @@ properties:
>>>         - const: ahb_cg
>>>   
>>>     interrupts:
>>> -    maxItems: 1
>>> +    description:
>>> +      Should at least contain MSDC GIC interrupt. To support SDIO
>>> in-band wakeup, an extended
>>> +      interrupt is required and be configured as wakeup source
>>> irq.
>>> +    minItems: 1
>>> +    maxItems: 2
>>>   
>>>     pinctrl-names:
>>> +    description:
>>> +      Should at least contain default and state_uhs. To support
>>> SDIO in-band wakeup, dat1 pin
>>> +      will be switched between GPIO mode and SDIO DAT1 mode,
>>> state_eint and state_dat1 are
>>> +      mandatory in this scenarios.
>>> +    minItems: 2
>>>       items:
>>>         - const: default
>>>         - const: state_uhs
>>> +      - const: state_eint
>>> +      - const: state_dat1
>>>   
>>>     pinctrl-0:
>>>       description:
>>> @@ -86,6 +97,16 @@ properties:
>>>         should contain uhs mode pin ctrl.
>>>       maxItems: 1
>>>   
>>> +  pinctrl-2:
>>> +    description:
>>> +      should switch dat1 pin to GPIO mode.
>>> +    maxItems: 1
>>> +
>>> +  pinctrl-3:
>>> +    description:
>>> +      should switch SDIO dat1 pin from GPIO mode back to SDIO
>>> mode.
>>
>> How is this different than pinctrl-0?
> 
> pinctrl-0 contains default settings for all IO pins(CLK/CMD/DAT).
> pinctrl-1 contains settings for all IO pins(CLK/CMD/DAT) in UHS mode.
> pinctrl-3 is lightweight pinctrl-1, only keep SDIO DAT1 pin function
> switch part.
> 

Is there any particular reason why we cannot simply select pinctrl-1 again
instead of pinctrl-3, apart from the virtually not existent overhead of
one more mmio write?

> ...
> 
> Regards,
> Axe
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
