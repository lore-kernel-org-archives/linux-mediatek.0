Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E7FFC616C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 18:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ij3f+Zg9q1wEj0EAhWF57UqUFM/ywF6i9hjSulti+t0=; b=vyMoTHe+KVQ11GBz6YQkkqlm5x
	HnXvQfy7lBAopP3dNhBCSBV6Wa4m4FD4M2KHnfg4rK7sP8eEyCmNpUEUTT/sD/D48Dohjy+taXkF0
	gNSROHq+XrhYSmwT1KfAUm4vRFKEzAQ4XRGHmYWcTtc4vhBvFlR5uWEJvtvMECUzNk3dRs3ZF/mgF
	DX5JCTNcwutvKR/g3L49RuSxxibDdS6BcF1kxKLWw5FcMRUBIGfq8igg3SVt9ffke45a1Ur2A7MW+
	o/nnbrAR3GK9/X+jOypsD3vVanxQMpzbNfK7YAtfEM9HSJBcN9Bcxs44c2+Rs0mpg9FTyLFFsQpD8
	Sk6pbk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spAr8-0000000GnEj-3CGk;
	Fri, 13 Sep 2024 18:17:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spAq3-0000000Gn5O-2HOx;
	Fri, 13 Sep 2024 18:16:13 +0000
X-UUID: 3e35c6fc71fc11efb3adad29d29602c1-20240913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=Ij3f+Zg9q1wEj0EAhWF57UqUFM/ywF6i9hjSulti+t0=;
	b=nARov+PS0W7CHJjEblgvyNTcjetr8Emh1bZQ8gNp74SGtoGJ8j0/OEQtxXO3Q811CmoY8t8NV6PoczJJZBM9HIu4fsVMgRX0CoUHI/EYKpA/55kipMT0OxCrV0sStdoUnffcXKerzUc+pNePIJaRem40YtQysToAqwFgDkD7FRk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4e39bc62-8a7e-40a8-b378-3f43a28749be,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:49f9fcb6-8c4d-4743-b649-83c6f3b849d4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3e35c6fc71fc11efb3adad29d29602c1-20240913
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1734770239; Fri, 13 Sep 2024 11:16:06 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 14 Sep 2024 02:16:02 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Sat, 14 Sep 2024 02:15:52 +0800
Message-ID: <963d092c-9288-2d38-f677-6d99d3d0bcce@mediatek.com>
Date: Sat, 14 Sep 2024 02:15:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/7] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-leds@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek
	<pavel@ucw.cz>, Sean Wang <sean.wang@mediatek.com>, Lee Jones
	<lee@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, Flora Fu
	<flora.fu@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen Chu
	<sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, "MediaTek
 Chromebook Upstream" <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
 <20240830110732.30080-2-macpaul.lin@mediatek.com>
 <20240830153343.GA4175444-robh@kernel.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240830153343.GA4175444-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--31.857400-8.000000
X-TMASE-MatchedRID: z5DqD3Ob670OwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0r/bIpz2qRIjUgYkh+Pnbt/VU3yVpaj3QyZf5btvM85AYnqJzDYczEQ7aX
	GVbcCMAiPwoDCfZrLw/8ijbz9Ht9kVHcNS6pil70mZusHWPhfCg+jS+LRpl81u6qThyrnanMEx4
	344nEbqtULYabc/6TSmDRSrJ335I8mNHlC7DQV5XQEQEU5OIef3Dm7Ebb7HTIR34ro7k23nUgCl
	CIX2gewXP1H+XULAzzAGMBwYFOuhaOz+j0QSEPd4aieqCznPEEF15s6prCIuzRCaZSKE/OsFERd
	nCEO4XESIx4SDL9Y5lp9Y+7xNeAjmOB2bikpqTC3D7EeeyZCM+A1Zxhcgbyla0TOsL14A2kHmIo
	dDsjQdchbvCCsG7xBolm+sKcVMKS9F7NKcWMllUfhraIl1XgxGsd4UAEvFdV2jMhVTmZHqFq767
	Z30NK43QY8bZKBde/nF6I+6o/d0an4NN7RsxjJDB+ErBr0bAOl9VzHf0qr7hKs4drB12RxTC8HO
	Fm6diJ0rLTB6ohEDSmgu0XPkjfjC3d7vPRaKlGeAiCmPx4NwLTrdaH1ZWqC1B0Hk1Q1KyJXaDn6
	DhA2Ao2j49Ftap9EkGUtrowrXLg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--31.857400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8A8122B569888C725D5B530ED86E46EE44D6BD97E2016A2C44C82F9C4671F4192000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_111611_638558_BDB75B94 
X-CRM114-Status: GOOD (  29.93  )
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


On 8/30/24 23:33, Rob Herring wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Fri, Aug 30, 2024 at 07:07:27PM +0800, Macpaul Lin wrote:
>> Convert the mfd: mediatek: mt6397 binding to DT schema format.
>> 
>> MT6323/MT6358/MT6397 are PMIC devices with multiple function of
>> subdevices. They have some variant of the combinations of subdevices
>> but share a common PMIC design.
>> 
>> New updates in this conversion:
>>  - RTC:
>>   - Convert rtc-mt6397.txt and add it into parent's mt6397 PMIC DT schema.
>>  - regulators:
>>   - Align generic names "regulators" instead of origin names.
>>   - mt6323-regulator: Replace "txt" reference with mt6323-regulaotr.yaml
>>   - mt6358-regulator: Replace "txt" reference with mt6358-regulator.yaml
>>   - mt6397-regulator: Replace "txt" reference with mt6397-reuglator.yaml
>>  - audio-codec:
>>   - Align generic name "audio-codec" for codec and sound subdevices.
>>   - Add "mediatek,dmic-mode" and "Avdd-supply".
>>  - clocks:
>>   - Align generic name "clocks" for clockbuffer subdevices.
>>  - leds:
>>   - Convert leds-mt6323.txt and add it into parent's mt6397 PMIC DT schema.
>>  - keys:
>>   - Add more specific descriptions for power and home keys.
>>   - Add compatible: mediatek,mt6358-keys
>>  - power-controller:
>>   - Add property #power-domain-cells for fixing dt-binding check error.
>>   - Add "Baseband power up" as the explaination of abbrevitation "BBPU".
>>  - pinctrl:
>>   - Align generic name "pinctrl" instead of "pin-controller".
>> 
>> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>  .../bindings/mfd/mediatek,mt6397.yaml         | 1026 +++++++++++++++++
>>  .../devicetree/bindings/mfd/mt6397.txt        |  110 --
>>  2 files changed, 1026 insertions(+), 110 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/mfd/mt6397.txt
>> 
>> Changes for v1:
>>  - This patch depends on conversion of mediatek,mt6397-regulator.yaml
>>    [1] https://lore.kernel.org/lkml/20240807091738.18387-1-macpaul.lin@mediatek.com/T/
>> 
>> Changes for v2:
>>  - This patch has been made base on linux-next/master git repo.
>>  - Keep the parent and child relationship with mediatek,pwrap in description.
>>    [2] https://lore.kernel.org/all/20240826-slurp-earphone-0d5173923ae8@spud/
>>  - Keep the $ref for regulators since dt_binding_check didn't report any issue
>>    based on linux-next/master repo.  
>>  - Fix description of mt6397/mt6323 devices, use "power management chip"
>>    instead of "multifunction device"
>>  - Drop unnecessary comments or description according to the review.
>>  - Convert sub-modules to DT Schema:
>>   - RTC, LEDs, power-controllers, regulators
>>  - Drop duplicate sub node name and description for sub-modules
>>   - RTC, Keys
>>  - examples: 
>>   - drop parent pwrap node
>>   - Add examples from mediatek,mt6323-regulator.yaml
>>   - Add examples from mediatek,mt6358-regulator.yaml
>>   - Add examples from mediatek,mt6397-regulator.yaml
>>   - Complete the examples as could as possible.
>> 
>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> new file mode 100644
>> index 0000000..f5bea33
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> @@ -0,0 +1,1026 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek MT6397/MT6323 Multifunction Device (PMIC)
>> +
>> +maintainers:
>> +  - Sen Chu <sen.chu@mediatek.com>
>> +  - Macpaul Lin <macpaul.lin@mediatek.com>
>> +
>> +description: |
>> +  MT6397/MT6323 is a power management system chip.
>> +  Please see the sub-modules below for supported features.
>> +
>> +  MT6397/MT6323 is a multifunction device with the following sub modules:
>> +  - Regulators
>> +  - RTC
>> +  - Audio codec
>> +  - GPIO
>> +  - Clock
>> +  - LED
>> +  - Keys
>> +  - Power controller
>> +
>> +  It is interfaced to host controller using SPI interface by a proprietary hardware
>> +  called PMIC wrapper or pwrap. MT6397/MT6323 PMIC is a child device of pwrap.
>> +  See the following for pwrap node definitions:
>> +  Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml

[snip]

>> +  rtc:
>> +    type: object
>> +    $ref: /schemas/rtc/rtc.yaml#
>> +    unevaluatedProperties: false
>> +    description:
>> +      MT6397 Real Time Clock.
> 
> Blank line

Will fix this in v3 version.

> 
>> +    properties:
>> +      compatible:
>> +        oneOf:
>> +          - enum:
>> +              - mediatek,mt6323-rtc
>> +              - mediatek,mt6331-rtc
>> +              - mediatek,mt6358-rtc
>> +              - mediatek,mt6397-rtc
>> +          - items:
>> +              - enum:
>> +                  - mediatek,mt6366-rtc
>> +              - const: mediatek,mt6358-rtc
> 
> Blank line between DT properties

Will fix this in v3 version.

>> +      start-year: true
>> +    required:
>> +      - compatible
>> +
>> +  regulators:
>> +    type: object
>> +    oneOf:
>> +      - $ref: /schemas/regulator/mediatek,mt6323-regulator.yaml
>> +      - $ref: /schemas/regulator/mediatek,mt6358-regulator.yaml
>> +      - $ref: /schemas/regulator/mediatek,mt6397-regulator.yaml
>> +    unevaluatedProperties: false
>> +    description:
>> +      List of child nodes that specify the regulators.
>> +    properties:
>> +      compatible:
>> +        oneOf:
>> +          - enum:
>> +              - mediatek,mt6323-regulator
>> +              - mediatek,mt6358-regulator
>> +              - mediatek,mt6397-regulator
>> +          - items:
>> +              - enum:
>> +                  - mediatek,mt6366-regulator
>> +              - const: mediatek,mt6358-regulator
> 
> You need the references or compatible, but not both. It's more efficient
> if you list the compatibles along with a 'additionalProperties: true'.
> Otherwise, the referenced schemas have to all be applied and the
> matching one will be applied twice.
> 
> Also, for compatible here, just use 'contains' and list all possible
> compatibles. The exact combinations are enforced in the regulator
> schemas.

Both 'addtionalProperties: true' and 'contains' will be added to
v3 version. Since there are different regulator nodes in these
DT Schema but seems no other common nodes, $ref will be added
to if..then.. match rulesfor each compatible.


[snip]

>> +
>> +  leds:
>> +    type: object
>> +    additionalProperties: false
>> +    description:
> 
> You need '|' or '>' to preserve line breaks.

Will be fixed in v3 version.


>> +
>> +    properties:
>> +      compatible:
>> +        oneOf:
> 
> Only 1 entry, don't need oneOf.
> 

Will be fixed in v3 version.

>> +          - enum:
>> +              - mediatek,mt6323-led
>> +              - mediatek,mt6331-led
>> +              - mediatek,mt6332-led
>> +      "#address-cells":
>> +        const: 1
> 
> blank line

Will be fixed in v3 version.

>> +      "#size-cells":
>> +        const: 0
> 
> blank line. And so on...

Will be fixed in v3 version.

>> +      reg:
>> +        description:
>> +          LED channel number (0..3)
>> +        minimum: 0
>> +        maximum: 3
> 
> Doesn't use the led binding?

Will be fixed in v3 version: using led bindings.

[snip]

>> +

>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    mt6323_pmic: pmic {
> 
> Drop unused labels.

Will be fixed in v3 version.

>> +        compatible = "mediatek,mt6323";
>> +        interrupt-parent = <&pio>;
>> +        interrupts = <150 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <2>;
>> +
>> +        mt6323_leds: leds {
>> +                compatible = "mediatek,mt6323-led";
>> +                #address-cells = <1>;
>> +                status = "disabled";
> 
> Examples shouldn't be disabled.

Will be fixed in v3 version.

[snip]

Thanks for the review.

Regards,
Macpaul Lin

