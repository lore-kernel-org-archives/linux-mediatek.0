Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA76EB8FAD
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 02:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wU2b4FfMrOH1WfUlVsQQlHq+T7r0NVr/yzvkGrizXGY=; b=ZIDOog+ktiuXVpyMKao7lc/YJk
	ksRZO/ZeDwn1386mMf8cyCJ2Blbi5zCkUH9/uvtpuQFaCN0MRhQOyLaMYIjPxTAaoDwkWRLIAaJ1N
	Luc/qXgFO5bg28h4q+y/p9FvdnyLMK7kRj6hKAxWvUKB5+YQ0+ymC7xUi7umQlhUCpLPwF5UqaqY/
	1XvjNAXoQKOZ+LxpApmb1G4ImR4nWh7aJOJu6YLa7IMW4dXBNJZ6DNu8IzLZ4U96zqrfO3q9Mfp3g
	ll0n6VgkJgOAed5p+BHjE0/YcDMACiFCz7mzK/dILYGOeeN61z2QvgRbXrGuUq+hQ2iK4iu5nIYII
	09S+oq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdiUi-0075Wa-1a;
	Wed, 06 Sep 2023 02:42:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdiUf-0075W1-03;
	Wed, 06 Sep 2023 02:42:14 +0000
X-UUID: f7f604c24c5e11ee9b7791016c24628a-20230905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=wU2b4FfMrOH1WfUlVsQQlHq+T7r0NVr/yzvkGrizXGY=;
	b=kzjlTPaae/Jb44katXMSg89T66JNpC1LyuIaFKuJp+wHyPSWFFlGu2u1y/W0Db7Bb55hMLX0+ly6CW5QszZXtWWDuw6cSLOr31uKK0ATDW7du9c3G2nKsSRVp76JaF8Ct9GlSbrQ6Izg+a/jZ+hZeJSNhQBVyqrm56We/h/+gPQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:d0cac7cf-142b-4cb8-a576-d085ffade3e3,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:0ad78a4,CLOUDID:050b2a20-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f7f604c24c5e11ee9b7791016c24628a-20230905
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 690886401; Tue, 05 Sep 2023 19:42:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Sep 2023 10:41:28 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 6 Sep 2023 10:41:24 +0800
Message-ID: <0acb43c3-3164-2a17-0105-84dbd533af8a@mediatek.com>
Date: Wed, 6 Sep 2023 10:41:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8395-evk
 board
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich
	<frank-w@public-files.de>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?=
	<bero@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <e2e35d4d-7853-fccc-28c2-b8ecf309d6ec@linaro.org>
 <00f0a1cf-6246-92e9-13b0-cf31bb292a94@mediatek.com>
 <97b82a16-8710-9430-35c8-673381aaa417@linaro.org>
 <d5645707-bcb0-4d4b-1d94-d3cd17c042fb@mediatek.com>
 <ddbc2681-bbda-88a1-643c-54fcabc9b83a@linaro.org>
 <bf8394c6-5460-8696-f46b-0c39927aaf84@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <bf8394c6-5460-8696-f46b-0c39927aaf84@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_194213_057096_67C00091 
X-CRM114-Status: GOOD (  25.28  )
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



On 9/5/23 18:58, AngeloGioacchino Del Regno and Krzsztof Kozlowski wrote:
> Il 05/09/23 12:36, Krzysztof Kozlowski ha scritto:
>> On 05/09/2023 11:36, Macpaul Lin wrote:
>>>
>>>
>>> On 9/4/23 20:11, Krzysztof Kozlowski wrote:
>>>>
>>>>
>>>> External email : Please do not click links or open attachments until 
>>>> you
>>>> have verified the sender or the content.
>>>>
>>>> On 04/09/2023 11:50, Macpaul Lin wrote:
>>>>>
>>>>>
>>>>> On 9/4/23 17:33, Krzysztof Kozlowski wrote:
>>>>>>
>>>>>>
>>>>>> External email : Please do not click links or open attachments 
>>>>>> until you
>>>>>> have verified the sender or the content.
>>>>>>
>>>>>> On 04/09/2023 11:20, Macpaul Lin wrote:
>>>>>>> Add bindings for the MediaTek mt8395-evk board.
>>>>>>> The mt8359-evk board is also named as "Genio 1200-EVK".
>>>>>>> MT8195 and MT8395 are the same family series SoC could share
>>>>>>
>>>>>> How can be the same and have different numbers? You sill need 
>>>>>> dedicated
>>>>>> compatible.
>>>>>>
>>>>>
>>>>> The SoCs mt8195 and mt8395 are designed for different market 
>>>>> application
>>>>> and physical characteristics, using different efuse values for
>>>>> distinction. The booting flow and configurations are controllered 
>>>>> by the
>>>>> boot loaders, firmware, and TF-A. Therefore, the part numbers and
>>>>> procurement channels are different. The detail information of these
>>>>> efuse values is proprietary, so I cant disclose it futher. Hence the
>>>>> most of peripheral drivers and base address are almost the same.
>>>>
>>>> 1. Drivers? So we talk about compatibility, not the same.
>>>> 2. "almost the same" is not the same. Follow the guidelines for writing
>>>> bindings.
>>>>
>>>
>>> Thanks for the review.
>>>
>>> After internal confirmation and discussion, it can be confirmed that the
>>> MT8195 and MT8395 are identical SoCs from to binding's perspective.
>>
>> I am sorry, but I really do not care what you internally discussed about
>> bindings. I do not think your internal review respect existing
>> guidelines. You talked about drivers, not "bindings perspective", so
>> your internal discussion is clearly discussing something else.
>>
>>> MediaTek hope the mt8395 boards could directly use mt8195.dtsi, without
>>> the need to create a separate mt8395.dtsi to include mt8195.dtsi.
>>> Therefore, we hope to fully adopt the bindings of mt8195. However, I
>>> will submit a revised patch for compatible since they are different 
>>> boards.
>>
>> You can disagree but then I expect arguments from your side.
>>
> 
> In short - they're the same chip, as in, they behave the same on a 
> *hardware*
> perspective; what changes is the bootchain (plus stricter security from 
> TF-A)
> and allowable temperature ranges for operation, that's practically it...
> 
> ...so yes the compatible for the "new soc" must be documented, but that's
> practically just a revision, *not a new soc* at all.
> 
> (though, I agree that seeing a different name as in 1 -> 3 can be totally
> confusing)
> 
> The drivers difference that Macpaul hinted to are about drivers needing 
> some
> SMC calls instead of direct MMIO manipulation, so, something like two 
> bindings
> for something like two drivers will need to add a 8395 compatible; 
> speaking of
> what we would have in a devicetree for this SoC, that'd be exactly 99% 
> identical
> to mt8195.dtsi.
> 
> Anyway, drivers are drivers, bindings describe hardware - and the hw is, 
> again,
> the same...
> 
> Hope that this makes things clearer! :-)
> 
> Cheers,
> Angelo

Thanks for your patience and clarification.
I'll submit new SOC binding and revise the patches for mt8395 board.

Thanks
Macpaul Lin

