Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14FBC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCX/vuJouNzHKpnFyo4E8oKSIQjKhwKQRYs//I02LAM=; b=28JvD289XQFxXAIy6+ixyhc76H
	Yo0tH7zEdJXtm0v55uGJ/pY98/wQU6KzXIRTX3mEfKBYF/bXwENyuU3Xhs6Y71PvclRINl7f7daXa
	I8ySbwx0UjHJwTaxZM9VtAVM9GcGKIzhvwnt7ItJ/9xLKxI+cAvugoknp5bNWPNoXtBG6ZGGBr9SG
	gCBMdUc1vjbYemYW/ySrGtaYrY1IqWZhR4yzkZL9146xj12gZ5VXiRjksH2Qq4pAiQlipQ/jhPMVI
	+7jIG+4K5iylMbOjmEv4S65HpuISD5kUmBL/XW+lQG1BKxlSDHTuQ+letIyBdejpy+IMPPyuH8WiU
	Pm4WVOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxMQH-00000001JFT-244n;
	Thu, 18 Apr 2024 07:43:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxMQE-00000001JEY-0oBB;
	Thu, 18 Apr 2024 07:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713426184;
	bh=GLk8JMqo54bnpRu/mKNE88XqR0W0E3kJNx1Nb5NE5RM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jSSlcDUl3KojtgCcYK8Ve68K6Fol4vEzSfIwhqzZ0S3sxYT6M7ntIf2vYp0aPpkA2
	 qtdihonwioKZJatjD9D2NK2OoBJ4eWfCa3IY1meOdZiROPt6AXYHfuY4EPH/iIRy2O
	 HocyCBOLmfAjEc4hCpzyZe1HBk7cw4bDfoOhzFZ9FEEWZTv3q3JxFQk6fdBtxO9UOe
	 aGTIbKFlhITcuRduoEAtMm9JiyLXNNM7xbA0Dq36HhcKeSj45pR+5M3dzOAhkujIDp
	 L1h6mZkE5q1kVrskXUEBjka5+6X4u5cIdo90ulfjSHMQmc3KDeP4iVMAhO4U9FZ2PI
	 paqmRCslQCsDg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7EDB33781104;
	Thu, 18 Apr 2024 07:43:03 +0000 (UTC)
Message-ID: <1d1bbc68-b484-4dc5-92f2-9454e8e2d6fb@collabora.com>
Date: Thu, 18 Apr 2024 09:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: interconnect: Add MediaTek EMI
 Interconnect bindings
To: Rob Herring <robh@kernel.org>
Cc: djakov@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, keescook@chromium.org, gustavoars@kernel.org,
 henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org, amergnat@baylibre.com
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
 <20240417091442.170505-3-angelogioacchino.delregno@collabora.com>
 <20240417145402.GA2355631-robh@kernel.org>
 <207eb8d7-1a40-4114-a84b-26616dc39fcc@collabora.com>
 <20240417191445.GB3101736-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240417191445.GB3101736-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_004306_404239_14F1A1F5 
X-CRM114-Status: GOOD (  17.69  )
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

Il 17/04/24 21:14, Rob Herring ha scritto:
> On Wed, Apr 17, 2024 at 05:32:54PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 17/04/24 16:54, Rob Herring ha scritto:
>>> On Wed, Apr 17, 2024 at 11:14:37AM +0200, AngeloGioacchino Del Regno wrote:
>>>> Add bindings for the MediaTek External Memory Interface Interconnect,
>>>> which providers support system bandwidth requirements through Dynamic
>>>> Voltage Frequency Scaling Resource Collector (DVFSRC) hardware.
>>>>
>>>> This adds bindings for MediaTek MT8183 and MT8195 SoCs.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    .../interconnect/mediatek,mt8183-emi.yaml     | 76 +++++++++++++++++++
>>>>    .../interconnect/mediatek,mt8183.h            | 23 ++++++
>>>>    .../interconnect/mediatek,mt8195.h            | 44 +++++++++++
>>>>    3 files changed, 143 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
>>>>    create mode 100644 include/dt-bindings/interconnect/mediatek,mt8183.h
>>>>    create mode 100644 include/dt-bindings/interconnect/mediatek,mt8195.h
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
>>>> new file mode 100644
>>>> index 000000000000..3ad60fd21f83
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
>>>> @@ -0,0 +1,76 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/interconnect/mediatek,mt8183-emi.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: MediaTek External Memory Interface (EMI) Interconnect
>>>> +
>>>> +maintainers:
>>>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> +
>>>> +description: |
>>>> +  EMI interconnect providers support system bandwidth requirements through
>>>> +  Dynamic Voltage Frequency Scaling Resource Collector (DVFSRC) hardware.
>>>> +  The provider is able to communicate with the DVFSRC through Secure Monitor
>>>> +  Call (SMC).
>>>> +
>>>> +             ICC provider         ICC Nodes
>>>> +                              ----          ----
>>>> +             _________       |CPU |   |--- |VPU |
>>>> +    _____   |         |-----  ----    |     ----
>>>> +   |     |->|  DRAM   |       ----    |     ----
>>>> +   |DRAM |->|scheduler|----- |GPU |   |--- |DISP|
>>>> +   |     |->|  (EMI)  |       ----    |     ----
>>>> +   |_____|->|_________|---.   -----   |     ----
>>>> +               /|\         `-|MMSYS|--|--- |VDEC|
>>>> +                |             -----   |     ----
>>>> +                |                     |     ----
>>>> +                | change DRAM freq    |--- |VENC|
>>>> +             --------                 |     ----
>>>> +    SMC --> | DVFSRC |                |     ----
>>>> +             --------                 |--- |IMG |
>>>> +                                      |     ----
>>>> +                                      |     ----
>>>> +                                      |--- |CAM |
>>>> +                                            ----
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - mediatek,mt8183-emi
>>>> +      - mediatek,mt8195-emi
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  '#interconnect-cells':
>>>> +    const: 1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - '#interconnect-cells'
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interconnect/mediatek,mt8195.h>
>>>> +
>>>> +    soc {
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>> +
>>>> +        system-controller@10012000 {
>>>> +            compatible = "mediatek,mt8195-dvfsrc";
>>>> +            reg = <0 0x10012000 0 0x1000>;
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +
>>>> +            emi_icc: interconnect@1 {
>>>> +                compatible = "mediatek,mt8195-emi";
>>>> +                reg = <1>;
>>>> +                #interconnect-cells = <1>;
>>>
>>>
>>> There's not really any need for this node. Just put #interconnect-cells
>>> in the parent.
>>>
>>
>> Actually, I modeled it to be a subnode of the DVFSRC for multiple reasons:
>>
>> 1. Some SoCs have more than one interconnect on the DVFSRC (two different kinds
>>     of EMI interconnect, and then also a SMI interconnect); and
>>
>> 2. Some boards will want to not enable the interconnect driver because some of
>>     those are not battery powered (so they just keep the knobs at full thrust
>>     from the bootloader and never care scaling busses); and
>>
>> 3. Some DVFSRC interconnect features may depend on firmware (but I'm not
>>     sure which ones and which SoCs, as there are lots of SMI/EMI ICC things that
>>     are not implemented yet with this series).
>>
>> The alternative would've been to add a property to enable, or disable, the SMI ICC
>> (not present in this series), and/or one, or the other kind of EMI ICC (this series
>> implements only the simpler EMI ICC, and I keep saying "the other" because I
>> currently don't remember the name).... which is really ugly.
>>
>> Ideas? :-)
> 
> Just provide that reasoning in the commit msg.
> 

Okay, that's sensible - should've done that in v1 even. My bad.

Cheers
Angelo

> Rob



