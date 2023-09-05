Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFFAC83F3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 10:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6C4sPv4wNMtLA4Jzp6hw1zzmzjhaBpEW7nE5UZodFU8=; b=WLsQ5opNShw6oNd/4F0tBWmf9N
	zdmyVExG9ESV/6EFwGR38OeJp81FKwAPAcaSbT9JNlpII6oUrjmKIkdQZwbYQr5TywxVFlOlUdT85
	RUNJvlcV++WMCOS/GwoqRhJiVU80ht0d++RS0fAHl8Gm3IgplzE66f86TWt9cgabIROwmU47N8TZM
	qJQORMmUY30GCWpwDwScWuQAIjGfJfZX7EgTEFUDkWXaQ+h9ReGe8+4Pbrf/I5oiCzu5kEB15qa2w
	FrytMJwMVRsYXBk8g7tBnuWYETtPNwxxh9VgOMeTuGPojAgojpB+e7D0McBe8+qDS4nLj0Vz7aibD
	Yay7dqqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTlh-005rey-0E;
	Tue, 05 Sep 2023 10:58:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTld-005reR-0G;
	Tue, 05 Sep 2023 10:58:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 583A3660728C;
	Tue,  5 Sep 2023 11:58:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693911521;
	bh=AWVZNq18PNoqeWFxoGKHOIFnvVBf8M/lxcWQmKKsNZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YhMeneWjMwe+HasAhRS+NTtkEkoVqzpZ86/ipWJ1CbQitu1HcGcqIlrRsrhJgV+bP
	 2HM/K7exvm6+f1bMF3sc493w/ZrZckRY3VlAv1Jl3jadxH5Mnb71jBeLbjUPhCW/pi
	 5Az/Pi8/EPo/6H+e4sVh6dG/bYLStfbcjKtRUqE4C7E989nGolhoAGEg3Jgmfdntot
	 /uV1qCCiW1U6zJO2TzrygDWqPKN32FguNSBqNd9GbzgXuLoWTw7rX3TE/rqii9fPe3
	 SFKgJZIAPVou+pO0l/l471RqTAO76fAKMEr+3jdYJHcUEsTn0vwGhkCt92o6kTkEHT
	 FhFqO4yrYU2aw==
Message-ID: <bf8394c6-5460-8696-f46b-0c39927aaf84@collabora.com>
Date: Tue, 5 Sep 2023 12:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8395-evk
 board
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <e2e35d4d-7853-fccc-28c2-b8ecf309d6ec@linaro.org>
 <00f0a1cf-6246-92e9-13b0-cf31bb292a94@mediatek.com>
 <97b82a16-8710-9430-35c8-673381aaa417@linaro.org>
 <d5645707-bcb0-4d4b-1d94-d3cd17c042fb@mediatek.com>
 <ddbc2681-bbda-88a1-643c-54fcabc9b83a@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ddbc2681-bbda-88a1-643c-54fcabc9b83a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_035845_414450_5A093384 
X-CRM114-Status: GOOD (  20.57  )
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

Il 05/09/23 12:36, Krzysztof Kozlowski ha scritto:
> On 05/09/2023 11:36, Macpaul Lin wrote:
>>
>>
>> On 9/4/23 20:11, Krzysztof Kozlowski wrote:
>>> 	
>>>
>>> External email : Please do not click links or open attachments until you
>>> have verified the sender or the content.
>>>
>>> On 04/09/2023 11:50, Macpaul Lin wrote:
>>>>
>>>>
>>>> On 9/4/23 17:33, Krzysztof Kozlowski wrote:
>>>>>
>>>>>
>>>>> External email : Please do not click links or open attachments until you
>>>>> have verified the sender or the content.
>>>>>
>>>>> On 04/09/2023 11:20, Macpaul Lin wrote:
>>>>>> Add bindings for the MediaTek mt8395-evk board.
>>>>>> The mt8359-evk board is also named as "Genio 1200-EVK".
>>>>>> MT8195 and MT8395 are the same family series SoC could share
>>>>>
>>>>> How can be the same and have different numbers? You sill need dedicated
>>>>> compatible.
>>>>>
>>>>
>>>> The SoCs mt8195 and mt8395 are designed for different market application
>>>> and physical characteristics, using different efuse values for
>>>> distinction. The booting flow and configurations are controllered by the
>>>> boot loaders, firmware, and TF-A. Therefore, the part numbers and
>>>> procurement channels are different. The detail information of these
>>>> efuse values is proprietary, so I cant disclose it futher. Hence the
>>>> most of peripheral drivers and base address are almost the same.
>>>
>>> 1. Drivers? So we talk about compatibility, not the same.
>>> 2. "almost the same" is not the same. Follow the guidelines for writing
>>> bindings.
>>>
>>
>> Thanks for the review.
>>
>> After internal confirmation and discussion, it can be confirmed that the
>> MT8195 and MT8395 are identical SoCs from to binding's perspective.
> 
> I am sorry, but I really do not care what you internally discussed about
> bindings. I do not think your internal review respect existing
> guidelines. You talked about drivers, not "bindings perspective", so
> your internal discussion is clearly discussing something else.
> 
>> MediaTek hope the mt8395 boards could directly use mt8195.dtsi, without
>> the need to create a separate mt8395.dtsi to include mt8195.dtsi.
>> Therefore, we hope to fully adopt the bindings of mt8195. However, I
>> will submit a revised patch for compatible since they are different boards.
> 
> You can disagree but then I expect arguments from your side.
> 

In short - they're the same chip, as in, they behave the same on a *hardware*
perspective; what changes is the bootchain (plus stricter security from TF-A)
and allowable temperature ranges for operation, that's practically it...

...so yes the compatible for the "new soc" must be documented, but that's
practically just a revision, *not a new soc* at all.

(though, I agree that seeing a different name as in 1 -> 3 can be totally
confusing)

The drivers difference that Macpaul hinted to are about drivers needing some
SMC calls instead of direct MMIO manipulation, so, something like two bindings
for something like two drivers will need to add a 8395 compatible; speaking of
what we would have in a devicetree for this SoC, that'd be exactly 99% identical
to mt8195.dtsi.

Anyway, drivers are drivers, bindings describe hardware - and the hw is, again,
the same...

Hope that this makes things clearer! :-)

Cheers,
Angelo

