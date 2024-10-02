Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0AACF31AE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mU1KQ/lvZLn0fEr/+Jy7BZvXZx8pZDt+Im5fIQNxZDo=; b=l/d0M1frZtW4x89NmPdsCpQE7D
	wnnU38m9Akmje+ptccC0fbrNXuflt6hwFkzWH5MsvnGWprjpV30YMqA6rpRN6gC6HF+4klFAq3LJs
	iT6dDc6zREAEbEIxHZGPLnDXVBr8PN/iey85QhbH0tHGpj7g0W6e5ep1U0OEl/wvWjlvQb9QHrMfp
	h3BAg+42QNHfR8R3ioj8svf5Sw+SSnbNUxxiZXyDL6Exj8vAkeGX21HBKHQHFpn12lbesLyBEmccO
	vHHFoxNUyk5lGWARHfhIV5mlJSXhJ1hkK//b1mWPQ1Vxovmf02HMpv0honPUKgDKVA4zf1BIQaZ4X
	xYBdwOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svwNc-00000005Se8-1RNl;
	Wed, 02 Oct 2024 10:14:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svwLC-00000005SCq-3ESk;
	Wed, 02 Oct 2024 10:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727863936;
	bh=Q1ywTNB9lkgOQO9Ms/otIbM6l1ohtJ5nkE73nfT4W4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rv9Qo73V3EUDx56HkQEEO2qvo2sdZ/FM+dPqx3fDZsJqmtp6+M5+hsXpdziSvNxBF
	 wClZ2AgIwXsek37vXzRz9QN7lAxUNoNaAvLXEitHlj/P6GIaV4UqkV8FjiplPxXxrX
	 3iDyEXOwKWcYwoUk+fMZRAWPw6rfxv0QPy+nD4+Tq8y36CVTczqymkNevqkv0sfmoH
	 dkf/Oo7AEglmo4i/H73KROqwVBgG43I2pGVBF6U0BbdTlCfYSwEIMgRaGl5zIqk2GN
	 hQKmavYQhND0B4iNpSUeEQMbfw0zuJJKINdT9cLYMNaIFYanTkvfK5OiXRkbEUzZSK
	 4JHKnUW04+PyQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D49E17E121F;
	Wed,  2 Oct 2024 12:12:15 +0200 (CEST)
Message-ID: <c952603f-2c01-48f1-9cd3-7ebc8f06a98c@collabora.com>
Date: Wed, 2 Oct 2024 12:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: iommu: mediatek: Fix interrupt count
 constraint for new SoCs
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Ben Lok <ben.lok@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240926111449.9245-1-macpaul.lin@mediatek.com>
 <20240926111449.9245-2-macpaul.lin@mediatek.com>
 <8883c84d-8333-4b04-83b5-022be5b6153c@collabora.com>
 <a41bf3aa-812e-2234-cca8-c68a8420f9e4@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a41bf3aa-812e-2234-cca8-c68a8420f9e4@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_031218_998836_BB231BA9 
X-CRM114-Status: GOOD (  16.41  )
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

Il 02/10/24 07:01, Macpaul Lin ha scritto:
> 
> 
> On 9/30/24 16:49, AngeloGioacchino Del Regno wrote:
>> Il 26/09/24 13:14, Macpaul Lin ha scritto:
>>> The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
>>> to an excessively long 'interrupts' property. The error message was:
>>>
> 
> [snip]
> 
>>>
>>> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml 
>>> b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>>> index ea6b0f5f24de..fdd2996d2a31 100644
>>> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>>> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>>> @@ -96,7 +96,8 @@ properties:
>>>       maxItems: 1
>>>     interrupts:
>>> -    maxItems: 1
>>> +    minItems: 1
>>> +    maxItems: 5
>>>     clocks:
>>>       items:
>>> @@ -210,6 +211,28 @@ allOf:
>>>         required:
>>>           - mediatek,larbs
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - mediatek,mt8195-iommu-infra
>>> +
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          description: |
>>
>> Do you really need to keep the formatting?
>>
>> If you rephrase that as:
>>
>> The infra IOMMU in MT8195 has five banks: each features one set
>> of APB registers for the normal world (set 0), one
> 
> Shouldn't we use a 'three' here?

Oops, yes, that's three. I wrote 'one' but described three. Heh!

> Three APB register sets for the protected world 1, protected world 2,
> and protected world 3.

three APB register sets for the protected world (sets 1/2/3) -- or
three APB register sets for the protected world (sets 1-3)

I mean, repeating "protected world X" three times is too much I think :-)

> 
>> for the protected
>> world (sets 1-3) and one for the secure world (set 4), and each set
>> has its own interrupt. Therefore, five interrupts are needed.
>>
>> ...you won't need the bar :-)
> 
> Thanks for the suggestion. The description has been moved to
> top common property in v3, and v4,
> hence the bar is still required to explain the
> others SOCs. I'll try to rephrase the description for MT8195 also.

Sure. You're welcome!

> 
>>> +            The IOMMU of MT8195 has 5 banks: 0/1/2/3/4.
>>> +            Each bank has a set of APB registers corresponding to the
>>> +            normal world, protected world 1/2/3, and secure world, respectively.
>>> +            Therefore, 5 interrupt numbers are needed.
>>> +          maxItems: 5
>>
>> minItems: 5
>>
>> Cheers,
>> Angelo
>>
>>
> 
> Thanks
> Macpaul Lin


