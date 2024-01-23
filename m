Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD23AC47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 10:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwQqK6ErMCNxTFwfEPRSt8NI76cL+B4HKQIwP9v0GUA=; b=yrEoPFMHEjF51w3LMqV2oK5ZwP
	OAa5pl3O/3IRA4jzF3yZAKK032udyz3zcZkJ7FX6zAInpXP/hmtO02s01iVkFCZtRVb927+rsi319
	6F+D1ZYJQoHLu95pcVdKxTmG+2drAJj897FuSbMndMDAUPUSQ7GLcfUxb+6jXDiyzJOAUvq+mlLJv
	8aQA7JGNyCS2ZrC3MCEMi1X6pWGk23wSHTSctXVMDzsB6cy+zPmq7MMdlOMeqpJxTlhtcFHEvn8WH
	MPxu65kE3AODaXRa8dvlSTFWWPpmHAK6/Nf89UedzOCRt8XEcb60YdOLmgiRu5a7dKVfbG9nXCLhM
	b67bKdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEDD-00FywL-1d;
	Tue, 23 Jan 2024 10:40:59 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSED9-00FyvK-35;
	Tue, 23 Jan 2024 10:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706006451;
	bh=s4p4CLV+pTT8G1cNbeHX4mdCI5yB1F5H8tIRN0w1MxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KCXB9rsPb1aJGlxX68Ab5Gb+R5dgLfA4hoWCkrUVDATQVt6rF8xnwh1l2wICT8cvQ
	 bL6Mi2RnXULodReB52ZrM1ASZqBFAW9/4eSKLQTECXEH/a2Hp/WhX6Ocx4YCS5I07G
	 GnEzZ0QXeMR4cLeM3JYDuTYLyezw6mQ+tOH3U3NsdPiilxFcljraNkuXIu0obmrGj6
	 KXo+M1jRKkc8wkS8kDIpU7BtcmInaFlL2a3kmIrhfGvwTgq6janE1BSjDzMJauRL6R
	 /q8omfi++AYEuaqECFFEfTlIgLm2E7JbUYQfB+r/5CHmpLHhQDHML9liBP8wWzOHCD
	 Gz7EuP1GlqDHg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B138737820A9;
	Tue, 23 Jan 2024 10:40:50 +0000 (UTC)
Message-ID: <6e2c7fed-0e61-41fe-8213-9c7ae483cfd7@collabora.com>
Date: Tue, 23 Jan 2024 11:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240122124949.29577-1-zajec5@gmail.com>
 <1c4e14f7-ca34-4433-96cb-0ba6d6c6906d@gmail.com>
 <311fa703-7dbc-41d2-bfde-85dd7cb20657@gmail.com>
 <227a0fec-d295-45ea-8d65-3cb0a7ce1af5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <227a0fec-d295-45ea-8d65-3cb0a7ce1af5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_024056_143850_88225A6E 
X-CRM114-Status: GOOD (  12.03  )
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

Il 23/01/24 09:57, Krzysztof Kozlowski ha scritto:
> On 22/01/2024 18:40, Rafał Miłecki wrote:
>> On 22.01.2024 14:19, Matthias Brugger wrote:
>>> On 22/01/2024 13:49, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> This helps validating DTS files. Introduced changes:
>>>> 1. Reworded title
>>>> 2. Dropper redundant properties descriptions
>>>> 3. Added required #include and adjusted "reg" in example
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>>    .../bindings/rtc/mediatek,mt2712-rtc.yaml     | 39 +++++++++++++++++++
>>>>    .../devicetree/bindings/rtc/rtc-mt2712.txt    | 14 -------
>>>>    2 files changed, 39 insertions(+), 14 deletions(-)
>>>>    create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>>>>    delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>>>
>>> In this schema can easily fit "mediatek,mt7622-rtc", so how about renaming it and add reference for that RTC as well?
>>
>> I see your point but by looking at existing Linux drivers:
>> drivers/rtc/rtc-mt2712.c
>> drivers/rtc/rtc-mt7622.c
>> it seems like quite different hardware blocks.
>>
>> Different registers, different programming, clk in MT7622.
>>
>> Should they really share a YAML binding just because they use similar
>> properties?
> 
> Hardware aspect matters more, including features not yet present in the
> binding, like some power on/off control. Different clock inputs is also
> an argument.
> 

I agree - those IPs are different, we should have two bindings for the two
(very) different IP versions.

Cheers,
Angelo


