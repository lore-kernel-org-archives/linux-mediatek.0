Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F19BC48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 10:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y12iY6rBj8ztUJ8rRVAj+B7UISr7LQ5WvJF4TeG8Usc=; b=MlzE1igJ8JzepyxBY+sqRtAUKA
	rE/iCHZqmkEyreF4kKDsvpSRzkOoygdn1yDWwbOZlwHbYAv5HPw/mbBCdVXTDx3uCkVapUZd8f/Ia
	lxGou1przdbuklR1uTJLSRsYmhGnRYLiKDdHIZgkBFkCPrlfbAuE2lFktvgvkmlye9pdd96Uo/p83
	b+Q/2vrc4Q8amYL0cMUfhJMqCI7yyxSungZ5h/zb459BNc/u1JanoLG0GaAQqYskuo4iBB/kHpdZ6
	Cqb5//EIuNKmTBlQDuHuoXXYS3IsjbHpx2Vk5bVZl18sN8FdKzadMNVj+Dqvq2ED90LkFHmJdLgxy
	aFFnG2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0Yd-00000009xls-3jyF;
	Mon, 19 Feb 2024 10:07:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0Ya-00000009xlA-49qX;
	Mon, 19 Feb 2024 10:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708337246;
	bh=am4RhiD/FxNhL3HLfhI49lqlwjcS8S6GwDUUEW8SpzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=roMbp9l49OJOpROD48oGAD38RS1uRNs6pN+0W1yv3jOIExs8smXlzqAyxN7hltckj
	 DhY008fWzU6Z8jydVKOVB6WG0i99EODJOHC4b41eI6J1TUqU6VKToGlBJnzVMG3hNq
	 TQzAoUdR/CQXAwuff8KXJxNZ8kJg0NQYGPHfV3T04toPx7f08ClzrwwMh9BteqLpO/
	 A+yt4guoJ/NJT26sbgRZNrw+g//ATmKcGpN4XQ0P14KT0FlTmiS+3KMJlBiQSujnnQ
	 HR0XX0wTlwdDrYFUdx+dKdpnjA0x/F+saXK6BOvHHP5dEb4c/8Lo96vC2oHErgvlKv
	 4FlOlMA9beDAQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4D5883781FF7;
	Mon, 19 Feb 2024 10:07:25 +0000 (UTC)
Message-ID: <9cc4fc3f-d697-4e51-a629-9f581dc3c35b@collabora.com>
Date: Mon, 19 Feb 2024 11:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: mediatek: add Kontron
 3.5"-SBC-i1200
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>
References: <20240219084456.1075445-1-mwalle@kernel.org>
 <ed3530f0-227a-47f2-938c-28eba90dd6eb@collabora.com>
 <CZ8YCQETS7LL.1BLJJZNCLV7DT@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CZ8YCQETS7LL.1BLJJZNCLV7DT@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_020729_199932_B748C925 
X-CRM114-Status: GOOD (  20.06  )
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

Il 19/02/24 10:36, Michael Walle ha scritto:
> On Mon Feb 19, 2024 at 10:23 AM CET, AngeloGioacchino Del Regno wrote:
>> Il 19/02/24 09:44, Michael Walle ha scritto:
>>> Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
>>> computer.
>>>
>>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>>> ---
>>> v2:
>>>    - convert enum to const as there is only one specific board
>>>
>>>    Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> index 09f9ffd3ff7b..add167d8b8da 100644
>>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> @@ -357,6 +357,11 @@ properties:
>>>                  - radxa,nio-12l
>>>              - const: mediatek,mt8395
>>>              - const: mediatek,mt8195
>>> +      - description: Kontron 3.5"-SBC-i1200
>>> +        items:
>>> +          - const: kontron,3-5-sbc-i1200
>>> +          - const: mediatek,mt8395
>>> +          - const: mediatek,mt8195
>>>          - items:
>>>              - enum:
>>>                  - mediatek,mt8516-pumpkin
>>
>> I understand that you took inspiration from the Google Chromebooks entries, but
>> those are separated only because they've got "a bunch of revisions".
>>
> 
> I don't really care about the description. It's just the way I've
> done it in the past. And in this file, there is also google,burnet,
> google,cozmo, google,damu, without any further revs.
> 

Yeah, I have to check why it is like this - as in - if there's any real reason for
those to be like that... otherwise I wouldn't mind cleaning 'em all up.

Whatever - that's not on you, and completely irrelevant to this specific patch,
so don't worry about the cleanup of the other entries.

>> For machines that don't have a billion compatible strings, I would suggest to
>> add the compatible under a single big entry: like this, the binding is (imo) a
>> bit more readable .. and cleaner.
>>
>> Eventually, the machine name is in the devicetree so we're not losing any kind
>> of information anyway... :-)
>>
>>         - items:
>>             - enum:
>>                 - kontron,3-5-sbc-i1200
>>                 - mediatek,mt8395-evk
>>                 - radxa,nio-12l
>>             - const: mediatek,mt8395
>>             - const: mediatek,mt8195
> 
> Ack. I'll give you some time to look at the actual DTS before
> posting a new version.
> 
> -michael



