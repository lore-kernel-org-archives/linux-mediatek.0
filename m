Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576C3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CenrAMUhuy7No5JoRejBvuvAOSnjGpy/yDxPGevvI6w=; b=kIbeYU1/BRV2TtjtGBbq3cryHS
	oE1zKWRNwp4d/d74auIOkw4/kJ/TtSB/MErE3PavZ8v34HW2xW9As2eN3LwNvYYbdD78tlzZSJI2a
	shFkrmq9QRYH5FEXzc0V96/arxhdYaSsLzRPPVCh6T1bOOon1+uXIu+q54S8dgnvtCb8HUXXSZc0W
	FnrG9FgGKXlpZSaY3BxsrMc592xwc7lysp22XfHqaILwaRWbSOZWKvQHUo2nqcRtRPg/9A6etCKm3
	KmgWpUZ6LOfkuQ+x1punVG4u0X+1l2y5S3RRK+NzuppxDYF1+ixYnag71a7ZKp8CpgFxYC3HOVb/O
	ghEL5bfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBBPK-008opt-2V; Tue, 12 Jul 2022 08:38:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBBOy-008oaZ-Aa
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 08:37:54 +0000
Received: by mail-lj1-x229.google.com with SMTP id w17so7489431ljh.6
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Jul 2022 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CenrAMUhuy7No5JoRejBvuvAOSnjGpy/yDxPGevvI6w=;
        b=TNiGyZvtDjh/rLQpYxoih0/HM/mJIDIXidnoQkzLB8nJx3KN27Wmq2fwspjkk0jJIY
         Sipgh3cMsW0pY0S1027VqXD52CaN6ht7b+EbZZune4iCXpgIJG2pgyOh4rlccMmICvsm
         ziubgm7D8MfSzruhCUhTUu2TGu9vqSZOEblP2UGvbRSoUj9Ue2WHKyceiw9KtK9D7IrO
         NU9D9k8Odkt4+8K0nv66yS2ifBcOSAt3Na0XGohYpU4sNpgMVmIvefGP6xm4+QoQtvMy
         j3A+GyGgjNcKsddivpyyZ/vbXWXWN3yHYcIBm6nH+jZsoPM8fMXOdGXmXUiymyI69seA
         tOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CenrAMUhuy7No5JoRejBvuvAOSnjGpy/yDxPGevvI6w=;
        b=Qqu5qUPdmWq86rEiGPidC3E/igZk1NxUI3ZkcO2b3v9JyzjFDTlHuUIimQ7eehCWqn
         hux/JAaZfFFclfpaJYAo4zhT0zsJHCsdhHxE/V6hN7Fbxhyl4MmiW/dtxpGfyi7DTYJf
         k1ObLUpvU/jwx+z5ioZgdLtFGdpnViSlO8egq1WM+xTPUZPVYikVQZ8kUyH9UsZseYda
         +2Jr369gHt2R1Xkjteq0vplpHuQvlAetwC6v2D51T/jmm3sGrn4bCAjHkXwkNm7mK++6
         HCVwhQqg6aNrXz5q9z9bohiadgwZ7JAFEUgYWEBlJa6Fd8XZYKVoUbPbzacgvlzETriB
         chZA==
X-Gm-Message-State: AJIora/2yjFXKKA3ci6myeTcAS1MjxSU/3znQXN/TNaowZqYfBmbJQYO
	vctGYuZVTptlP0cuXrrgJrTkug==
X-Google-Smtp-Source: AGRyM1vJVOlhps4ABBcnniF1AYWAiwD0akYFf+tbCizI9CmKnyi4+od3r3nmnLJoJHB3N2pNUSj7Ug==
X-Received: by 2002:a05:651c:1542:b0:249:a87f:8a34 with SMTP id y2-20020a05651c154200b00249a87f8a34mr12385394ljp.442.1657615068373;
        Tue, 12 Jul 2022 01:37:48 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id g7-20020a056512118700b0047f647414efsm2056015lfr.190.2022.07.12.01.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:37:47 -0700 (PDT)
Message-ID: <1eb212ea-c5a9-b06f-606f-1271ac52adf9@linaro.org>
Date: Tue, 12 Jul 2022 10:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 08/16] arm64: dts: mt8195: Add power domains controller
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b6523c64-dfe2-13b0-db60-fb4f53ed1e31@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_013752_383314_8CA85818 
X-CRM114-Status: GOOD (  29.22  )
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

On 12/07/2022 10:17, AngeloGioacchino Del Regno wrote:
> Il 06/07/22 17:18, Krzysztof Kozlowski ha scritto:
>> On 06/07/2022 14:00, Tinghan Shen wrote:
>>> Hi Krzysztof,
>>>
>>> After discussing your message with our power team,
>>> we realized that we need your help to ensure we fully understand you.
>>>
>>> On Mon, 2022-07-04 at 14:38 +0200, Krzysztof Kozlowski wrote:
>>>> On 04/07/2022 12:00, Tinghan Shen wrote:
>>>>> Add power domains controller node for mt8195.
>>>>>
>>>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>>>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 327 +++++++++++++++++++++++
>>>>>   1 file changed, 327 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>>> index 8d59a7da3271..d52e140d9271 100644
>>>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>>> @@ -10,6 +10,7 @@
>>>>>   #include <dt-bindings/interrupt-controller/irq.h>
>>>>>   #include <dt-bindings/phy/phy.h>
>>>>>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>>>>> +#include <dt-bindings/power/mt8195-power.h>
>>>>>   
>>>>>   / {
>>>>>   	compatible = "mediatek,mt8195";
>>>>> @@ -338,6 +339,332 @@
>>>>>   			#interrupt-cells = <2>;
>>>>>   		};
>>>>>   
>>>>> +		scpsys: syscon@10006000 {
>>>>> +			compatible = "syscon", "simple-mfd";
>>>>
>>>> These compatibles cannot be alone.
>>>
>>> the scpsys sub node has the compatible of the power domain driver.
>>> do you suggest that the compatible in the sub node should move to here?
>>
>> Not necessarily, depends. You have here device node representing system
>> registers. They need they own compatibles, just like everywhere in the
>> kernel (except the broken cases...).
>>
>> Whether this should be compatible of power-domain driver, it depends
>> what this device node is. I don't know, I don't have your datasheets or
>> your architecture diagrams...
>>
>>>
>>>>> +			reg = <0 0x10006000 0 0x1000>;
>>>>> +			#power-domain-cells = <1>;
>>>>
>>>> If it is simple MFD, then probably it is not a power domain provider.
>>>> Decide.
>>>
>>> this MFD device is the power controller on mt8195.
>>
>> Then it is not a simple MFD but a power controller. Do not use
>> "simple-mfd" compatible.
>>
>>> Some features need
>>> to do some operations on registers in this node. We think that implement
>>> the operation of these registers as the MFD device can provide flexibility
>>> for future use. We want to clarify if you're saying that an MFD device
>>> cannot be a power domain provider.
>>
>> MFD device is Linuxism, so it has nothing to do here. I am talking only
>> about simple-mfd. simple-mfd is a simple device only instantiating
>> children and not providing anything to anyone. Neither to children. This
>>   the most important part. The children do not depend on anything from
>> simple-mfd device. For example simple-mfd device can be shut down
>> (gated) and children should still operate. Being a power domain
>> controller, contradicts this usually.
>>
> 
> If my interpretation of this issue is right, I have pushed a solution for it.
> Krzysztof, Matthias, can you please check [1] and give feedback, so that
> Tinghan can rewrite this commit ASAP?
> 
> Reason is - I need the MT8195 devicetree to be complete to push the remaining
> pieces for Tomato Chromebooks, of course.
> 
> [1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=658527

I have two or three similar discussions, so maybe I lost the context,
but I don't understand how your fix is matching real hardware.

In the patchset here, Tinghan claimed that power domain controller is a
child of 10006000. 10006000 is also a power domain controller. This was
explicitly described by the DTS code.

Now you abandon this hierarchy in favor of syscon. If the hierarchy was
correct, your patchset does not match the hardware, so it's a no-go.
Describe the hardware.

However maybe this patch did not make any sense and there is no
relationship parent-child... so what do you guys send here? Bunch of
hacks and work-arounds?

Your DTS should reflect the hardware, not some hacks.

Best regards,
Krzysztof

