Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C843C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 08:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLQ+q/t9r7zFfqT96/08hqro8GIK9zX6oxTSiglozmg=; b=vU43iVRjpDV/Ip10J3cJXBZ6MO
	FkyHW8aYaiTExWkG41vVt++5KxjVWDJs295IiB/kinJF9UTsmLv+Ls9jCURxCGj+UaqfIkZuJ7JT+
	/ydRHhBySS95BBFLxcJhHo8iJxSC7bFpfVXuZFwMerW56noLOIjGMiiTHXjw7cgxla5bgxVPiVPmo
	TDVT8ly75A76aIv9yi6JOufh6FrO3sSC49P+uFjOv+f9kRlf/HqG8TyLplSHWv/w1Pyy9JdrqGzFQ
	5+0m33k0TllhFABIKWPdp9jLxk9QwWuGBWJZrcUBRnzVWaM60G3RrbhNZzeheisX3UH4LuEto7IWS
	RxcewCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBB5A-008d01-TT; Tue, 12 Jul 2022 08:17:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBB4x-008ctH-2U; Tue, 12 Jul 2022 08:17:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25AE06601A1F;
	Tue, 12 Jul 2022 09:17:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657613826;
	bh=d3b+CsWkPsYr8qKMtwTzmv9uLDZ9cL0m9n4E0ufVExw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fz2EGkZ9bpmliBI/TP4TTip8xfXgxpG5FeE08vweder9fo1LWxz2ddfc7e8VoKWmz
	 RQ4kSUcxxDI4oLUsXevLx+JYL7tdGNnWWR8aOJZHGNFm8GPmllL4539yYFiO8VL7Ol
	 TZhBRKH2wBKPHk/2rWYn749U0n8p/kPgtM66BigWXIEUUL2hLBlRrSH1M9akZJ+6Bu
	 1bq30IcUqKIB4VM3tLxfZIuqNomlRc/xnIX9w4GNa2xq1b/l7URBuZDPTVGwKwT2Tx
	 x0MgBVzjfZqQUbSs5Fgcj9lMT60Sbhv9q5RrALe1VsWrY/9yMWj+MFvp6DoyenH8jC
	 KSyRblMEgs7GA==
Message-ID: <b6523c64-dfe2-13b0-db60-fb4f53ed1e31@collabora.com>
Date: Tue, 12 Jul 2022 10:17:03 +0200
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <0301ebc6-1222-e813-f237-f14ad8444940@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_011711_511986_A9D552F9 
X-CRM114-Status: GOOD (  27.88  )
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

Il 06/07/22 17:18, Krzysztof Kozlowski ha scritto:
> On 06/07/2022 14:00, Tinghan Shen wrote:
>> Hi Krzysztof,
>>
>> After discussing your message with our power team,
>> we realized that we need your help to ensure we fully understand you.
>>
>> On Mon, 2022-07-04 at 14:38 +0200, Krzysztof Kozlowski wrote:
>>> On 04/07/2022 12:00, Tinghan Shen wrote:
>>>> Add power domains controller node for mt8195.
>>>>
>>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>>> ---
>>>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 327 +++++++++++++++++++++++
>>>>   1 file changed, 327 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>> index 8d59a7da3271..d52e140d9271 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>> @@ -10,6 +10,7 @@
>>>>   #include <dt-bindings/interrupt-controller/irq.h>
>>>>   #include <dt-bindings/phy/phy.h>
>>>>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>>>> +#include <dt-bindings/power/mt8195-power.h>
>>>>   
>>>>   / {
>>>>   	compatible = "mediatek,mt8195";
>>>> @@ -338,6 +339,332 @@
>>>>   			#interrupt-cells = <2>;
>>>>   		};
>>>>   
>>>> +		scpsys: syscon@10006000 {
>>>> +			compatible = "syscon", "simple-mfd";
>>>
>>> These compatibles cannot be alone.
>>
>> the scpsys sub node has the compatible of the power domain driver.
>> do you suggest that the compatible in the sub node should move to here?
> 
> Not necessarily, depends. You have here device node representing system
> registers. They need they own compatibles, just like everywhere in the
> kernel (except the broken cases...).
> 
> Whether this should be compatible of power-domain driver, it depends
> what this device node is. I don't know, I don't have your datasheets or
> your architecture diagrams...
> 
>>
>>>> +			reg = <0 0x10006000 0 0x1000>;
>>>> +			#power-domain-cells = <1>;
>>>
>>> If it is simple MFD, then probably it is not a power domain provider.
>>> Decide.
>>
>> this MFD device is the power controller on mt8195.
> 
> Then it is not a simple MFD but a power controller. Do not use
> "simple-mfd" compatible.
> 
>> Some features need
>> to do some operations on registers in this node. We think that implement
>> the operation of these registers as the MFD device can provide flexibility
>> for future use. We want to clarify if you're saying that an MFD device
>> cannot be a power domain provider.
> 
> MFD device is Linuxism, so it has nothing to do here. I am talking only
> about simple-mfd. simple-mfd is a simple device only instantiating
> children and not providing anything to anyone. Neither to children. This
>   the most important part. The children do not depend on anything from
> simple-mfd device. For example simple-mfd device can be shut down
> (gated) and children should still operate. Being a power domain
> controller, contradicts this usually.
> 

If my interpretation of this issue is right, I have pushed a solution for it.
Krzysztof, Matthias, can you please check [1] and give feedback, so that
Tinghan can rewrite this commit ASAP?

Reason is - I need the MT8195 devicetree to be complete to push the remaining
pieces for Tomato Chromebooks, of course.

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=658527

Thanks a lot,
Angelo

