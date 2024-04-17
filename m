Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59972C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMQ6Btf9vSGEcfa3IbGsBMc1XqsNYidUvb2ccCCywKs=; b=LM2vdnHYvRKpcb8E/To/yAnvwI
	ycHbd0dpJwFLyEgXuEmrl3e/9disUgSriIQTxDtNQ4AYiFwYY/lLczJZwGdEAdhVnKun/Y0Pxmm74
	7/ZyPuzAK5KdxiSZM06NHTR6lBp4OaU0RL5irwpMOSKrSlULU6NKVDKhYbBlkHHgaiICRWSgaTZ2J
	sDCm52y+P7AwW2j0+r0o5zPLd9FBMSC0dVVnIa0XXhwJ92KREhLwqzRa2dzfZzm77Vkc9EY9I7h7Z
	jCoGBmjDA9SS32hvDgi1mt1S8t2lPQxgqi/YGAX8QB6+TfxwP+SDa0iIfkJ+2692YGs82CYqn0trG
	B+nNDDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0cR-0000000FCad-3ICV;
	Wed, 17 Apr 2024 08:26:15 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0cN-0000000FCZe-1cm5;
	Wed, 17 Apr 2024 08:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713342368;
	bh=kmHlwLbZHjHC2EJS+ABo1wg0PZ40MFvgtD9PeNxxQPM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oTd9SgVZIiAqJCmnodpLckCDcAWx4PKtjv/xCqwa194AAZDqTERfnWrM/Kw4MP6ME
	 hjEkfD5SOR1oXf0SAORnl0QjTdorQfj+oqytmMekXR70JTNK4caD3pBc+XOiGO5O6S
	 bz0TvhGyiF8R4tluA8SfN0nZQKYDOSWc+vLLGMw4U2RVyq/T2e4MovmHoctxXRIhSR
	 SpYa8UK4l3q+/bCJyNr67oOUpRam7VqD9/t+oRu4yc8rhMzPyM8s/OP9wYLZWbauyv
	 IS+dIdXAgJtO2K6QqSiPxkkmoGatISludLOarjDsfvRltLlE8lmaFQXzDlQj1nbWz2
	 jv7y4yMn3s/XA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9136637820F9;
	Wed, 17 Apr 2024 08:26:07 +0000 (UTC)
Message-ID: <ef29f74b-af21-4807-8d72-0e627586a288@collabora.com>
Date: Wed, 17 Apr 2024 10:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] dt-bindings: soc: mediatek: Add DVFSRC bindings
 for MT8183 and MT8195
To: Conor Dooley <conor@kernel.org>
Cc: djakov@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, keescook@chromium.org, gustavoars@kernel.org,
 henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org, amergnat@baylibre.com
References: <20240416153805.431118-1-angelogioacchino.delregno@collabora.com>
 <20240416153805.431118-2-angelogioacchino.delregno@collabora.com>
 <20240416-grope-blissful-a914854b3732@spud>
 <20240416-onion-prone-44b45d5a003e@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240416-onion-prone-44b45d5a003e@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_012611_809910_0A6DEADA 
X-CRM114-Status: GOOD (  23.09  )
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

Il 16/04/24 19:30, Conor Dooley ha scritto:
> On Tue, Apr 16, 2024 at 06:28:58PM +0100, Conor Dooley wrote:
>> On Tue, Apr 16, 2024 at 05:38:00PM +0200, AngeloGioacchino Del Regno wrote:
>>> Add bindings for the MediaTek Dynamic Voltage and Frequency Scaling
>>> Resource Collector (DVFSRC), a hardware module used to collect all the
>>> requests from both software and the various remote processors embedded
>>> into the SoC and decide about a minimum operating voltage and a minimum
>>> DRAM frequency to fulfill those requests in an effort to provide the
>>> best achievable performance per watt.
>>>
>>> This hardware IP is capable of transparently performing direct register
>>> R/W on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  | 57 +++++++++++++++++++
>>>   1 file changed, 57 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
>>> new file mode 100644
>>> index 000000000000..12bcc3fdfd07
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
>>> @@ -0,0 +1,57 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8183-dvfsrc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC)
>>> +
>>> +description:
>>> +  The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) is a
>>> +  Hardware module used to collect all the requests from both software and the
>>> +  various remote processors embedded into the SoC and decide about a minimum
>>> +  operating voltage and a minimum DRAM frequency to fulfill those requests in
>>> +  an effort to provide the best achievable performance per watt.
>>> +  This hardware IP is capable of transparently performing direct register R/W
>>> +  on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
>>> +
>>> +maintainers:
>>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> +  - Henry Chen <henryc.chen@mediatek.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>
>> This items should not be needed with the enum, right?
>>

Whoops. Yep items is not needed.

>>> +          - enum:
>>> +              - mediatek,mt8183-dvfsrc
>>> +              - mediatek,mt8195-dvfsrc
>>> +      - items:
>>> +          - const: mediatek,mt8192-dvfsrc
>>> +          - const: mediatek,mt8195-dvfsrc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +    description: DVFSRC common register address and length.
>>> +
>>> +patternProperties:
>>> +  "@[0-9a-f]+$":
>>> +    type: object
>>
>> Why is there no enforcement of what a child could be here?
> 
> Seems like you know exactly what the children are: regulators and an
> interconnect? What am I missing?
> 

I wasn't sure whether that would've been a good idea, given that there will
be more possible children in the future - as in - more drivers that need the
DVFSRC communication.

But anyway yes, for now, it's just the regulator and interconnect drivers.

>>
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        dvfsrc@10012000 {
>>
>> "dvfsrc" looks like something my (imaginary given allergies) cat would

(allergies: ugh, same here - feel you)

>> produce from sitting on my keyboard. Could you use full words for the
>> node name and make it something that attempts to be generic please?
>>

I'm not entirely sure that I can find a generic name for this... I wonder if
"remoteproc" could work - as this is a remote processor (a MCU, actually).

To give you context, this doesn't need firmware to be loaded, and does not have
any remoteproc driver.

Because then, I don't think that "performance-controller" would be correct,
even though I have this N.2 choice... ideas?

Cheers,
Angelo

>>> +            compatible = "mediatek,mt8195-dvfsrc";
>>> +            reg = <0 0x10012000 0 0x1000>;
>>> +        };
>>> +    };
>>> -- 
>>> 2.44.0
>>>
> 
> 


