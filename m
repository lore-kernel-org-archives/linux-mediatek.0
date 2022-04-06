Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C88C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2Se5pg1n02TIFBk55UPJXkXLWbXCw2nCcfKHCrPwQg=; b=DZHgXNXY10dx8+
	ICzZprLxIY420uDeNanq5ygBtaTUf/p47Gt1f4R5jGjw/6cBHkOO3bh5J7lDrpmiPmDJXqpoMhHW5
	2R7rBMeCVnb4hMPUD18c7wJinXgD6f/no11YOMcPExkKZ3N9IoyY1R3rlDTjOkTo5XeO2rFB3P/hY
	TfA7SANDtS719gVShHBVJ6R1MBjaVM0wxOWVLOOcg16Q9cqOrQMgoaZpAudH0riyQ6d0FGMgE5upG
	eUm75e/s7lbZrSW390ThxV0Ras8ZaiEqu5lYTVG269gVODT6wLd1DDfssjz4uXIso6cVW3H5IN0RD
	N+eOiR9Versqq2/mb/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc0t4-004eNT-5c; Wed, 06 Apr 2022 08:19:34 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc0sd-004eAG-9g; Wed, 06 Apr 2022 08:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=aEB6aphFsgS6tcwbtUgdYyeAKuuzYXM7RIsKLxa8uvA=; b=Pnmfz+p3TpVQv30t+iXKOy9HP1
 IshLmKi2yNidJiLsGu1rxD8klUHG+h5ZfAsdjD5L4N6iEwAzug4A3fZuJOazknB+HBbriHZ2JvTXI
 cQQ4udex4fEwlGMN5WwHwoOlDn0BIxj/6XHLZ8KoQEEoztSIVbYUuCsIjN+UUrsFR6hk=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nc0sP-0003Ng-8L; Wed, 06 Apr 2022 10:18:53 +0200
Message-ID: <e3ea7381-87e3-99e1-2277-80835ec42f15@nbd.name>
Date: Wed, 6 Apr 2022 10:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-5-nbd@nbd.name>
 <d0bffa9a-0ea6-0f59-06b2-7eef3c746de1@linaro.org>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2 04/14] dt-bindings: arm: mediatek: document WED binding
 for MT7622
In-Reply-To: <d0bffa9a-0ea6-0f59-06b2-7eef3c746de1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_011907_572172_376752DA 
X-CRM114-Status: GOOD (  21.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 06.04.22 10:09, Krzysztof Kozlowski wrote:
> On 05/04/2022 21:57, Felix Fietkau wrote:
>> From: Lorenzo Bianconi <lorenzo@kernel.org>
>> 
>> Document the binding for the Wireless Ethernet Dispatch core on the MT7622
>> SoC, which is used for Ethernet->WLAN offloading
>> Add related info in mediatek-net bindings.
>> 
>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> ---
>>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 50 +++++++++++++++++++
>>  .../devicetree/bindings/net/mediatek-net.txt  |  2 +
>>  2 files changed, 52 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> 
> Don't store drivers in arm directory. See:
> https://lore.kernel.org/linux-devicetree/YkJa1oLSEP8R4U6y@robh.at.kernel.org/
> 
> Isn't this a network offload engine? If yes, then probably it should be
> in "net/".
It's not a network offload engine by itself. It's a SoC component that 
connects to the offload engine and controls a MTK PCIe WLAN device, 
intercepting interrupts and DMA rings in order to be able to inject 
packets coming in from the offload engine.
Do you think it still belongs in net, or maybe in soc instead?

>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
>> new file mode 100644
>> index 000000000000..787d6673f952
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
>> @@ -0,0 +1,50 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: MediaTek Wireless Ethernet Dispatch Controller for MT7622
>> +
>> +maintainers:
>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
>> +  - Felix Fietkau <nbd@nbd.name>
>> +
>> +description:
>> +  The mediatek wireless ethernet dispatch controller can be configured to
>> +  intercept and handle access to the WLAN DMA queues and PCIe interrupts
>> +  and implement hardware flow offloading from ethernet to WLAN.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - mediatek,mt7622-wed
>> +      - const: syscon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +      wed0: wed@1020a000 {
> 
> Generic node name, "wed" is specific. Maybe "network-offload"? Or
> "network-accelerator"? You probably know better what this device does,
> so maybe come with some generic name?
wed stands for "wireless ethernet dispatch". Both network-offload and 
network-accelerator don't really fit. Would it make sense to spell it 
out, or do you have any better naming ideas?

Thanks,

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
