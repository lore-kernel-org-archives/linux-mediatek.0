Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A492C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 07:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPmoPYctaEhIh9n2WPomEDP0JikoNBBZt2Ent2wDAh0=; b=YW73LvbtjfgCUGM09Mf4pOEOIe
	7M3wJvF6Wc7Je7PeyikOpMUaysYPv7bQxw5968mtHLyM68f7LBiQPSUOxoVsFq3F2txK88Cujbfh1
	/Bp7g/GXEf1Vma1xDMeXnDHh75w0BR6nnjqHMW8HJpMRvx4hK2DrJIfJ4X07RmZx0ba3QbCN3UEku
	L63dYtsT4ETbNOXfwvsjAqzDHcN5xGD5Iyn4jC1Os5h5hRZAwGBjm/6gbYOnlWDjcMH6r93B1YXP/
	s/TydLjzAOxusbvZnzDZDLS04Yp0VWHH+1kHVL8RdKsI2BXtaub963OrNegqiTSvvmleK+r1Zn4lo
	OhYoa9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxMPX-00000001J4n-1iQX;
	Thu, 18 Apr 2024 07:42:23 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxMPT-00000001J30-18ou;
	Thu, 18 Apr 2024 07:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713426135;
	bh=dqSA5NoujkL4PW5NbCCZfdQkSnvU93YVUZl3EEQR5+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NvIqz0nk/PtcghNdZJ0AkED2ZIUiRrstINTajiF4z2Zzw15moOCxwncvzv25sBPWt
	 HzZgZcAfmGfRprsu4V+fkup7xwPb4jZaY4M7zekg17X44F2o/vFT1Dmm0XybWZmZvn
	 KGnATzK1ak77mKo0FT1wW1oXyBhkrNl/sqqGPoBxW43b9U1FlSvO7Q8OlZG+olSotx
	 psjKdetGu8uPo1PPI/pRNN/mcqou5I/Ylk/AHWe8awL65tZIy5YqtzL7E5zeDWd9Ah
	 G6qt/jGdKJ2q+INbQo+TXMe/0BbQcSsbPAu1fI8xvQ+dy5ecPhgXYGKbfDS+7AJvs7
	 FHXhjEP3rV/1g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 844F23782136;
	Thu, 18 Apr 2024 07:42:14 +0000 (UTC)
Message-ID: <4da3e998-d26d-4200-85ea-b8fd0176dff7@collabora.com>
Date: Thu, 18 Apr 2024 09:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: regulator: Add bindings for MediaTek
 DVFSRC Regulators
To: Rob Herring <robh@kernel.org>
Cc: djakov@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, keescook@chromium.org, gustavoars@kernel.org,
 henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org, amergnat@baylibre.com
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
 <20240417091442.170505-2-angelogioacchino.delregno@collabora.com>
 <20240417145238.GA2348962-robh@kernel.org>
 <b728478d-d9c9-4256-aeab-a234316d81cc@collabora.com>
 <20240417191247.GA3101736-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240417191247.GA3101736-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_004219_534700_510F2BF7 
X-CRM114-Status: GOOD (  22.81  )
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

Il 17/04/24 21:12, Rob Herring ha scritto:
> On Wed, Apr 17, 2024 at 05:39:12PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 17/04/24 16:52, Rob Herring ha scritto:
>>> On Wed, Apr 17, 2024 at 11:14:36AM +0200, AngeloGioacchino Del Regno wrote:
>>>> The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
>>>> are controlled with votes to the DVFSRC hardware.
>>>>
>>>> This adds support for the regulators found in MT6873, MT8183, MT8192
>>>> and MT8195 SoCs.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    .../mediatek,mt6873-dvfsrc-regulator.yaml     | 71 +++++++++++++++++++
>>>>    1 file changed, 71 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
>>>> new file mode 100644
>>>> index 000000000000..446f1dab4d2e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
>>>> @@ -0,0 +1,71 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6873-dvfsrc-regulator.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: MediaTek DVFSRC-controlled Regulators
>>>> +
>>>> +description:
>>>> +  The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
>>>> +  are controlled with votes to the DVFSRC hardware.
>>>> +
>>>> +maintainers:
>>>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - mediatek,mt6873-dvfsrc-regulator
>>>> +      - mediatek,mt8183-dvfsrc-regulator
>>>> +      - mediatek,mt8192-dvfsrc-regulator
>>>> +      - mediatek,mt8195-dvfsrc-regulator
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  dvfsrc-vcore:
>>>> +    description: DVFSRC-controlled SoC Vcore regulator
>>>> +    $ref: regulator.yaml#
>>>
>>>          unevaluatedProperties: false
>>>
>>
>> Will do!
>>
>>>> +
>>>> +  dvfsrc-vscp:
>>>> +    description: DVFSRC-controlled System Control Processor regulator
>>>> +    $ref: regulator.yaml#
>>>
>>> ditto
>>>
>>>> +
>>>> +required:
>>>> +  - compatible
>>>
>>> 'reg' is never optional. And how is no regulators at all valid?
>>>
>>
>> The two nodes that I'm adding with this series don't need reg, but others
>> that are not present in this do... but anyway, let's postpone that problem
>> for the future me, or the future-anyone-else implementing the rest, I will
>> remove the 'reg' property as it is indeed not needed for this node.
> 
> That might have been fine, but now that I know you *will* need it, it
> isn't fine. You could wait 1 week to 6 months to repost and hope I
> forget...

My bad, I should've explained a bit better, that was referred to the DVFSRC
main node, not to the REGULATOR node: that one doesn't need it at all.

I get it as it's fine if I drop reg from all of them (here and icc, and the
size/address cells from the parent node) and send a v3.

Did I get that wrong?


> 
> The ideal for these cases is you put the actual sub-range of
> MMIO registers in the child nodes. But sometimes it is just bit soup in
> the register layout and that doesn't work.
> 

I can confirm that there's a bit soup situation on MediaTek - bits for different
devices scattered all around in one register "far away".

>>
>> And yeah it's invalid to add that node without any regulator. Will check the
>> other regulator bindings on how they're doing it.
> 
> 'required' or anyOf with a list of required entries.
> 

That saves me lookup time - greatly appreciated, thank you!

Cheers,
Angelo

> Rob


