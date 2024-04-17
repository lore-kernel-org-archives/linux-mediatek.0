Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FFDC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/P2JXllaEux0cfxfK0eaRmqWeoGvBlj4w7RS5xqfcg=; b=SARXVenTvrwj5wrwCLQbR3V6Lx
	d4n4+cYeRO78I3jB8rPwG6cBpPm7r0L0T87SncrZjTdfNvVMooQMWXK4EM8EEm1U63IzGRhIY2K8l
	ihBvDrFS5/klXJooWBSTZqILwPsHieojhScXebqqlzRcWKYijWs2Cqmzk7O1mY3QX9rhjw8EkDmPA
	OpDsQ/CK3n7wJGzXeaYPSaMlfOOAAAunyE6g9uXSoUonsje9VdJ4oUJ560KgBz7T2IiILtcclIJgK
	s5SjPALQiLFVEI7ZOFDGugxD1qUSaz+UJjhV0b+0E0hLDxsxLV54uejAOK+2+gpUr3ttDSLkOHhM3
	mb7ifmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7NY-0000000Gdwz-1uer;
	Wed, 17 Apr 2024 15:39:20 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7NU-0000000GduD-1xYc;
	Wed, 17 Apr 2024 15:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713368354;
	bh=I5hIRtUrBrDsG+h5jPN51ir1mk5P5T2b5m9gyZaZzmg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hmincq7dtHvoqMye61mzj+V5WEVKSIUpZh581SxDvrE5HZRosL7ef6VdLEsNenLC9
	 +c5680W/rLZjaqGTsrV3q0KvkAsPTpL4UHiJaAhki7uJJBA0wH2TPNOjeEaL2D93Ja
	 zittO0N3e/ytrc6hf1BfFV8NyA56jm+kxAaRojPcJTLR5a8vqmybHMNdF8IByHpvXm
	 FOyh1UvJ9OaISUFUur90F8Hx/uBl26jqPYUVjRFvzScQP0uZ5O62La2wLjY/JuONJn
	 NZK6I2z5GK/VI39wAq7gSjCFblL1jYv0TW8AGzy5isdvuK4dLLsOkuAnDIUmBHreTM
	 MMpMHxJ0sfhNg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 76BB83780629;
	Wed, 17 Apr 2024 15:39:13 +0000 (UTC)
Message-ID: <b728478d-d9c9-4256-aeab-a234316d81cc@collabora.com>
Date: Wed, 17 Apr 2024 17:39:12 +0200
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240417145238.GA2348962-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_083916_739930_473ADA11 
X-CRM114-Status: GOOD (  18.70  )
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

Il 17/04/24 16:52, Rob Herring ha scritto:
> On Wed, Apr 17, 2024 at 11:14:36AM +0200, AngeloGioacchino Del Regno wrote:
>> The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
>> are controlled with votes to the DVFSRC hardware.
>>
>> This adds support for the regulators found in MT6873, MT8183, MT8192
>> and MT8195 SoCs.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../mediatek,mt6873-dvfsrc-regulator.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
>> new file mode 100644
>> index 000000000000..446f1dab4d2e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
>> @@ -0,0 +1,71 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6873-dvfsrc-regulator.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek DVFSRC-controlled Regulators
>> +
>> +description:
>> +  The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
>> +  are controlled with votes to the DVFSRC hardware.
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt6873-dvfsrc-regulator
>> +      - mediatek,mt8183-dvfsrc-regulator
>> +      - mediatek,mt8192-dvfsrc-regulator
>> +      - mediatek,mt8195-dvfsrc-regulator
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  dvfsrc-vcore:
>> +    description: DVFSRC-controlled SoC Vcore regulator
>> +    $ref: regulator.yaml#
> 
>         unevaluatedProperties: false
> 

Will do!

>> +
>> +  dvfsrc-vscp:
>> +    description: DVFSRC-controlled System Control Processor regulator
>> +    $ref: regulator.yaml#
> 
> ditto
> 
>> +
>> +required:
>> +  - compatible
> 
> 'reg' is never optional. And how is no regulators at all valid?
> 

The two nodes that I'm adding with this series don't need reg, but others
that are not present in this do... but anyway, let's postpone that problem
for the future me, or the future-anyone-else implementing the rest, I will
remove the 'reg' property as it is indeed not needed for this node.

And yeah it's invalid to add that node without any regulator. Will check the
other regulator bindings on how they're doing it.


>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
> 
> Drop the example here. Just one complete example in the MFD doc.
> 

Oki, dropping in v3! That also resolves the circular dependency thing, so
that's even better.

>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        system-controller@10012000 {
>> +            compatible = "mediatek,mt8195-dvfsrc";
>> +            reg = <0 0x10012000 0 0x1000>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            regulators@0 {
>> +                compatible = "mediatek,mt8195-dvfsrc-regulator";
>> +                reg = <0>;
> 
> What does 'reg' value represent here? 0 and 1 seem pretty much made up.
> 

Gets removed in v3, tomorrow.

Cheers,
Angelo



