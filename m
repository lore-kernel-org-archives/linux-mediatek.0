Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CC2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 10:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bIIO9ucc1w3ovip9ibDpv5O5bHGkFtBjnv3es72uDc=; b=pOIgq+6DdiFWC1xlncIzKOyuyb
	6Yxtq538+W1nUc4PFnfZwrIR2pgL8hLD9WQUithbu4xLCuvM/ptvdTl4BnwAIZi+UwggbHGgfN6fw
	IhB3i9K1kF16zPhqre0RTSif3/EmBlJLF0cLlcgQAs3EK3n9rDlhv/HUBXB4O03yjOYW7ShqPJyiW
	7M6TY5EptvzMUHrVefC/odUq1baqa2GnBkxJ9o9jZkff7rHW1qvjY+AwsCZflkw09RV/n1d37tyCq
	IyDKMaaM1AiKEjrOaNOzegriz3E1h0Abj1AVc2nT7NJ1I5erqjGS3Qx8mmYPohMDvIcQsymCUr2gS
	A6VSqGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDDe-009uFs-Cv; Tue, 12 Jul 2022 10:34:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDDS-009u8l-F8; Tue, 12 Jul 2022 10:34:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BE3BB66016F8;
	Tue, 12 Jul 2022 11:34:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657622041;
	bh=Vh2dVrKjI8O9JWG1xhVqcPgAC+jNPhm0RQs7Of+wMjM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qe6ms3Qxwln/MHvjh9XxK6Qs4Lk4iO7cVhxF+yH+xA+yb3vlnYrUnXscsGVOMZm/a
	 jnZf0KSU7kbWmQCCFW0ItUjjOH4MkhU5d5uraBuamF0fqyHIpBff/w2SqWBkx4BKnp
	 bmMPoabHi0S18atfpqCD4KJOPqwOS8UaiomRkqn0IG/0m4APRcr2me1fFlN/65113W
	 iQ2SRK+Ljgs/xa3PDLNORLMY/bPltFfyazLIiZD4qiVtKH/mGSbra/T9Bn6kSYkzyq
	 IdijxJWcp3ONwTikLAWwJ6ioALORnm5CjptKu3OCGHPxBc1Z+A4ptJZA7m8Ylc/4vn
	 nyGXFt22AFPcg==
Message-ID: <83162e4f-a31f-79cf-ba01-58b45fd4f62e@collabora.com>
Date: Tue, 12 Jul 2022 12:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 08/16] arm64: dts: mt8195: Add power domains controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-9-tinghan.shen@mediatek.com>
 <3b65405d-167f-a0c7-d15e-5da6f08d99b3@linaro.org>
 <eec6aee5cd023fff6d986882db0330e1ab85a59d.camel@mediatek.com>
 <0301ebc6-1222-e813-f237-f14ad8444940@linaro.org>
 <b6523c64-dfe2-13b0-db60-fb4f53ed1e31@collabora.com>
 <1eb212ea-c5a9-b06f-606f-1271ac52adf9@linaro.org>
 <c243bc9c-0862-450d-6bff-00ec5591e791@collabora.com>
 <d8bc3b20-45db-a869-2aff-9cda8e0fca92@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <d8bc3b20-45db-a869-2aff-9cda8e0fca92@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_033407_005543_39D82B2B 
X-CRM114-Status: GOOD (  39.56  )
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

Il 12/07/22 11:03, Krzysztof Kozlowski ha scritto:
> On 12/07/2022 10:53, AngeloGioacchino Del Regno wrote:
>> Il 12/07/22 10:37, Krzysztof Kozlowski ha scritto:
>>> On 12/07/2022 10:17, AngeloGioacchino Del Regno wrote:
>>>> Il 06/07/22 17:18, Krzysztof Kozlowski ha scritto:
>>>>> On 06/07/2022 14:00, Tinghan Shen wrote:
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> After discussing your message with our power team,
>>>>>> we realized that we need your help to ensure we fully understand you.
>>>>>>
>>>>>> On Mon, 2022-07-04 at 14:38 +0200, Krzysztof Kozlowski wrote:
>>>>>>> On 04/07/2022 12:00, Tinghan Shen wrote:
>>>>>>>> Add power domains controller node for mt8195.
>>>>>>>>
>>>>>>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>>>>>>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>>>>>>> ---
>>>>>>>>     arch/arm64/boot/dts/mediatek/mt8195.dtsi | 327 +++++++++++++++++++++++
>>>>>>>>     1 file changed, 327 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>>>>>> index 8d59a7da3271..d52e140d9271 100644
>>>>>>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>>>>>> @@ -10,6 +10,7 @@
>>>>>>>>     #include <dt-bindings/interrupt-controller/irq.h>
>>>>>>>>     #include <dt-bindings/phy/phy.h>
>>>>>>>>     #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>>>>>>>> +#include <dt-bindings/power/mt8195-power.h>
>>>>>>>>     
>>>>>>>>     / {
>>>>>>>>     	compatible = "mediatek,mt8195";
>>>>>>>> @@ -338,6 +339,332 @@
>>>>>>>>     			#interrupt-cells = <2>;
>>>>>>>>     		};
>>>>>>>>     
>>>>>>>> +		scpsys: syscon@10006000 {
>>>>>>>> +			compatible = "syscon", "simple-mfd";
>>>>>>>
>>>>>>> These compatibles cannot be alone.
>>>>>>
>>>>>> the scpsys sub node has the compatible of the power domain driver.
>>>>>> do you suggest that the compatible in the sub node should move to here?
>>>>>
>>>>> Not necessarily, depends. You have here device node representing system
>>>>> registers. They need they own compatibles, just like everywhere in the
>>>>> kernel (except the broken cases...).
>>>>>
>>>>> Whether this should be compatible of power-domain driver, it depends
>>>>> what this device node is. I don't know, I don't have your datasheets or
>>>>> your architecture diagrams...
>>>>>
>>>>>>
>>>>>>>> +			reg = <0 0x10006000 0 0x1000>;
>>>>>>>> +			#power-domain-cells = <1>;
>>>>>>>
>>>>>>> If it is simple MFD, then probably it is not a power domain provider.
>>>>>>> Decide.
>>>>>>
>>>>>> this MFD device is the power controller on mt8195.
>>>>>
>>>>> Then it is not a simple MFD but a power controller. Do not use
>>>>> "simple-mfd" compatible.
>>>>>
>>>>>> Some features need
>>>>>> to do some operations on registers in this node. We think that implement
>>>>>> the operation of these registers as the MFD device can provide flexibility
>>>>>> for future use. We want to clarify if you're saying that an MFD device
>>>>>> cannot be a power domain provider.
>>>>>
>>>>> MFD device is Linuxism, so it has nothing to do here. I am talking only
>>>>> about simple-mfd. simple-mfd is a simple device only instantiating
>>>>> children and not providing anything to anyone. Neither to children. This
>>>>>     the most important part. The children do not depend on anything from
>>>>> simple-mfd device. For example simple-mfd device can be shut down
>>>>> (gated) and children should still operate. Being a power domain
>>>>> controller, contradicts this usually.
>>>>>
>>>>
>>>> If my interpretation of this issue is right, I have pushed a solution for it.
>>>> Krzysztof, Matthias, can you please check [1] and give feedback, so that
>>>> Tinghan can rewrite this commit ASAP?
>>>>
>>>> Reason is - I need the MT8195 devicetree to be complete to push the remaining
>>>> pieces for Tomato Chromebooks, of course.
>>>>
>>>> [1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=658527
>>>
>>> I have two or three similar discussions, so maybe I lost the context,
>>> but I don't understand how your fix is matching real hardware.
>>>
>>> In the patchset here, Tinghan claimed that power domain controller is a
>>> child of 10006000. 10006000 is also a power domain controller. This was
>>> explicitly described by the DTS code.
>>>
>>> Now you abandon this hierarchy in favor of syscon. If the hierarchy was
>>> correct, your patchset does not match the hardware, so it's a no-go.
>>> Describe the hardware.
>>>
>>> However maybe this patch did not make any sense and there is no
>>> relationship parent-child... so what do you guys send here? Bunch of
>>> hacks and work-arounds?
>>>
>>
>> For how I get it, hardware side, the SPM (System Power Manager) resides inside
>> of the SCPSYS block (consequently, in that iospace).
>>
>> As Matthias pointed out earlier, SCPSYS provides more functionality, but the
>> only one that's currently implemented upstream is the System Power Manager,
>> responsible for managing the MTCMOS (power domains).
>>
>> In any case, now I'm a little confused on how to proceed, can you please give
>> some suggestion?
> 
> You should make SCPSYS (0x10006000, AFAIU) a proper driver with its own
> compatible (followed by syscon if needed), even if now it is almost
> empty stub. The driver should populate OF children and then you can
> embed SPM inside and reference to parent's regmap. No need for
> simple-mfd. Later the SCPSYS can grow, if you ever need it.
> 
> 

I see an issue with such approach: the SCPSYS doesn't have a mailbox, doesn't
need power management from the Linux side, doesn't have any register to check
HW revision, it's always online (hence it doesn't need Linux to boot it), it
doesn't need any root clock, nor regulator, nor mmu context, and there's no
retrievable "boot log" of any sort.

Hence, a driver with its own compatible would be an empty stub forever: it's
not going to get any "scpsys root handling" at all, because there's none to do.

Digging through some downstream kernels, the only other functionality that I
can find in the SCPSYS is a MODULE_RESET (which is used to reset the SCP System)
and a INFRA_IRQ_SET, used to set "wake locks" on the AP and CONNSYS (modem).

Both of these may only be used in the SCP mailbox driver (which is *not* SCPSYS)
to perform an ipi_send operation (but currently we simply en/disable the clock
and that's enough), or to perform a reset and firmware reload of the SCP (but
currently we're simply powering off and back on: this may change in the future).

So, at the end of the day, we would end up having a copy of simple-pm-bus and
nothing else, which doesn't look like being optimal at all.

My own vision is that either using syscon (as shown in the series that you've
checked), keeping "simple-mfd", or changing it to "simple-bus" (whatever) is
the cleanest (and best approach) - please otherwise explain why having such
a practically forever-stub driver (practically, a copy of simple-pm-bus.c)
would be beneficial in any way.

Regards,
Angelo

> 
> Best regards,
> Krzysztof



