Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFD6C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 10:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTpRONPkhdGjXQyPSOqs8y96hydX87sHRBuDqvRtazw=; b=CFp4cABZnuCK6L/JsIdLSwtuOb
	REkz/sFpVahtZ8vAXBr2sOvtklFt/InPEDFk0PfokoT7lyykGW5vYOBVaq6czKW/29vwA5P428s7z
	s/lGA7AO/IMKUzWTqu7Qo4qh3DBnAtCksm7hXYKij0kQi419D58Sb4+B4oD/LOT7adEJmO2T9P0l9
	Lme/MZFK5VKTnyeH6HKLZTrLmq+63s/pSAz2uvxZFgpJYsXLnBZljNHW2YE/aiga4kNln/vLb6h3M
	YVIeW8LFT67ga2gzOGZsT9Qyh0tErmNLGiUek1qscTuy+t0dNFUu8glJ7iXZc/qVsgTVCx3NFKfv1
	ksbie9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV872-00000002rjW-1k0z;
	Wed, 31 Jan 2024 10:46:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV616-00000002887-281N;
	Wed, 31 Jan 2024 08:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fTpRONPkhdGjXQyPSOqs8y96hydX87sHRBuDqvRtazw=; b=Fk2t2Cb5zMtWetT9IGUZtzYQPW
	HHZU4ulimxnu4xzlwhmFh7GhHvr2TO3Ltxm9qiWbIjvXbZKhFjiIiUb6q6eoJk8jthSPQ5KRiFQNJ
	BavKpVOG1LHAc5t+70/rfe+ZItTwhGfpkOUweURtxU65qOh4dvPjsiauFPmuem6XDY0OMfHo9m0Id
	hAMo4UtSukI68Uw1Lui+Bwhi/GN/bhYM2zmi3DCaF03i7Crw+qXmJZQeP2wxZuyvTbpPIJcYpLLW0
	DkekOQCEOn0MGLxBLPoq+Fplb5aSJC0u2732pQZ+vFEiVgQ476/oX4omnmla/yw688LDY5uJJujqz
	kZlunPyA==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV611-00000008pGN-0yzH;
	Wed, 31 Jan 2024 08:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706689930;
	bh=LnrH8a5zYVpmAlRagGxradQPGUkv1B0XDLbxWC6rdmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lDQSfraSCJwGUPW5n9z/BbT0hc5H5woZFWcMz7OmWUoONNJNka8sk8fzhPQ5ZJVX4
	 JtOqZTULJOVS9Lgl0KpXtULLXUqRyNZDpA2HtRPC46jTEktXLhyGAcx1s7+VfQCF/Z
	 8JwIwnbiuU6exVHUMgZo6Pfxc+9CabHXbXmq4n9/6P44t7Lu6bsUSERmjUjUL5bcDc
	 OHYI5CSyg0uLDfrerIBBUoC1dGX8qf3St3mRTTFKB10c7csVzrIFMj1osey0ATMvV0
	 7wPxXxJoQn3Tc4p+V3zz8JkS4RsqJuKTIgg28MNC/j8X1xhPmtPYMgl052FgMQrz5d
	 7bAyDN6ldt/1A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4543F37803EE;
	Wed, 31 Jan 2024 08:32:09 +0000 (UTC)
Message-ID: <7574acab-4a4e-4213-a477-5ef1870fe98a@collabora.com>
Date: Wed, 31 Jan 2024 09:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm: mediatek: convert PCIESYS to the
 json-schema
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20240123082100.7334-1-zajec5@gmail.com>
 <20240123082100.7334-3-zajec5@gmail.com>
 <e17b85b1-7f1f-4b60-89b7-43f560466cc2@collabora.com>
 <20240130203413.GA2290196-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240130203413.GA2290196-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_083215_413026_0FA929C6 
X-CRM114-Status: GOOD (  22.46  )
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

Il 30/01/24 21:34, Rob Herring ha scritto:
> On Tue, Jan 23, 2024 at 12:20:29PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 23/01/24 09:20, Rafał Miłecki ha scritto:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> This helps validating DTS files. Introduced changes:
>>> 1. Documented "reg" property
>>> 2. Adjusted "reg" in example
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>    .../arm/mediatek/mediatek,mt7622-pciesys.yaml | 47 +++++++++++++++++++
>>>    .../arm/mediatek/mediatek,pciesys.txt         | 25 ----------
>>>    2 files changed, 47 insertions(+), 25 deletions(-)
>>>    create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
>>>    delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
>>> new file mode 100644
>>> index 000000000000..7340a2512402
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
>>
>> I think that we should really move all those clock controller yaml files to their
>> proper directory, which would be
>>
>> Documentation/devicetree/bindings/clock/
>>
>> ...because those are clock controllers anyway and the fact that they do also
>> provide a reset controller doesn't really justify having them in arm/mediatek.
>>
>> Besides, I would appreciate if you could also move mt8186/92/95 and eventual
>> others that are there to clock/.
> 
> Yes, please move it.
> 
>>
>>> @@ -0,0 +1,47 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pciesys.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek PCIESYS controller
>>> +
>>> +description:
>>> +  The MediaTek PCIESYS controller provides various clocks to the system.
>>> +
>>> +maintainers:
>>> +  - Matthias Brugger <matthias.bgg@gmail.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - mediatek,mt7622-pciesys
>>> +          - mediatek,mt7629-pciesys
>>> +      - const: syscon
>>
>> I know that there's syscon all over the place and, even if I admit I didn't check,
>> I am fairly sure that there's absolutely no reason to have syscon there, and that
>> the syscon compatible never did anything for (most of, or all of) those clock
>> controllers, at all.
>>
>> I'm not sure - though - if removing syscon during the txt->yaml conversion is
>> acceptable (yeah we'd be cheating a bit), but something makes me say it is, because
>> the bindings couldn't validate before that one as well.
> 
> As long as you state why you are removing it in the commit msg.
> 
>>
>> Of course you'd have to remove the syscon compatible from the affected device trees
>> as well as omitting it here.
> 
> You could also do 'minItems: 1' and 'deprecated' in the 2nd item.
> 

That too. Yes. But I still really want to see the syscon compatible removed from
the device trees on those nodes because it doesn't make any sense to have it :-)

>> However, to be sure that we're doing the right thing here, I have to summon someone
>> that can actually give a definitive answer to what I just said.....
>>
>> Krzysztof, please? :-)




