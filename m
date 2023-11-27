Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D5C07CB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdJZT2pnGM7WjHBPmNijisd5rSz18hyLGGQm8RchWfY=; b=Ur1N9oNAuM4lNotReyKBkI+zoi
	TCUY2MQbyg0kb+dMhfbZKKdyqthjuvA9FkZCWFUUDm8BPS9vLd5WghtgCVQHhNnOI5EcSR1wU2tM2
	ZP3NInf4xFqMr/Ct76XclF7pxLUkSmZkyCFscA0SJ/G7YCBWpi342YP+krl1IdGYrmeNjE5J2/Gfn
	9YSsREBLdL+HLX5xNsACyaJYvTkWx/hxBa82ihoDhjNMnfkv6ZTH0rX2LMK1xC3i3G1LYq5/7u0jC
	R3fg/RqF8N/Pit00DXMxrLay/ZNezCnZ9Lsf3Rhmcor3zZSv7gcm0o32M16Jvu9ZsLhkWE6202V8T
	+SzNnqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7boG-002aoL-1q;
	Mon, 27 Nov 2023 13:38:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7boC-002amz-1b;
	Mon, 27 Nov 2023 13:37:57 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0144D660716E;
	Mon, 27 Nov 2023 13:37:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701092275;
	bh=HWTWeZczkKPebiHhuo5BZO805K/Z7hkRFhrXyPuPjTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O4vVdIowbsdyovhSATp87/gj9HKXh6j9UJSHTbH31aSq12FPYr/dn7P0zBiDFOyjv
	 V3iwiYBZjbpOt26uzfHwybMZkW6ursKUy4tVVUVa8fBhcHMnNAenrMuqbOqjK1Iq9W
	 A+EOJVsocw7IPAvQ/Ofs+htd4g20OknlOv0kj1WMTRXH/GL39DM2hHCMjwF7IXj2IZ
	 zJ9XOr0Q2w99UPgbon9Rk5R74FA9Bhowpr0vOmEgjZr1o1sN9bjxrM7HQqpUtP30pi
	 f9eNbiezuDiF/RxrT3MhUwYXKoBLDU7RJfOdlgJlMfqdtsnS5VUgvVjnSPMhr5GyQ5
	 V2UQTO83VeVug==
Message-ID: <efc64b77-e454-4b9e-9508-311f00d2db83@collabora.com>
Date: Mon, 27 Nov 2023 14:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek: tphy: add a property for
 force-mode switch
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Bear.Wang" <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20231125012303.760-1-chunfeng.yun@mediatek.com>
 <e34c2746-8e93-48b8-9c96-690242fbf6e9@linaro.org>
 <239def9b-437b-9211-7844-af4332651df0@mediatek.com>
 <0dc24d82-e09d-45bc-98ae-1dfb6318cb96@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <0dc24d82-e09d-45bc-98ae-1dfb6318cb96@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_053756_663975_C36C2CB2 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

Il 27/11/23 08:21, Krzysztof Kozlowski ha scritto:
> On 27/11/2023 08:09, Macpaul Lin wrote:
>> On 11/25/23 18:37, Krzysztof Kozlowski and Chunfeng Yun wrote:
>>> 	
>>>
>>> External email : Please do not click links or open attachments until you
>>> have verified the sender or the content.
>>>
>>> On 25/11/2023 02:23, Chunfeng Yun wrote:
>>>> Due to some old SoCs with shared t-phy only support force-mode switch, and
>>>> can't use compatible to distinguish between shared and non-shared t-phy,
>>>> add a property to supported it.
>>>> But now prefer to use "mediatek,syscon-type" on new SoC as far as possible.

Two questions:
1. Why is it *not* possible to use the compatible string to distinguish between
    shared and non-shared T-PHYs?
2. If we really can't use compatibles, what's the reason why we can't use the
    "mediatek,syscon-type" property?

Regards,
Angelo

>>>>
>>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>> index 2bb91542e984..eedba5b7025e 100644
>>>> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>> @@ -235,6 +235,12 @@ patternProperties:
>>>>             Specify the flag to enable BC1.2 if support it
>>>>           type: boolean
>>>>   
>>>> +      mediatek,force-mode:
>>>> +        description:
>>>> +          Use force mode to switch shared phy mode, perfer to use the bellow
>>>


