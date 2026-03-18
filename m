Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F15D107761B
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 20:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IH7ZfNBkhNS2N1nKFAJ+41w55RSVuCvKMdXY4crVddE=; b=z0cCRsnRlr2JeeLB8YYwVfRZPz
	LUuFgYj4BWLGsJLil68kNI1Pzx9JPGpzeru7t8IQsVQKa9Xh/WFMfM+enkJ7cJes+68gq7RNMRsI+
	/nuEK6UQFcEd1xnAqpnabtsxPgrH5UHSqgyIAMRm0qQoNWjr+fTkG1WGqFusdjHK/g1ZnVvpam5KH
	pfLHxX4gb/UZIByPqmJSNx+jwGOv9tjHarGy9s0jpdqfSOowgpq9jGDYrNrZ63+fhJKir8IExYLNO
	tEDqadJjDD6Cm6tSYHNHANHn6mYEWnyv4oqHEzsdRS7xyY0vyFA2adfVJEJyHP2UqJK+sO183mfmR
	EqtXhpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xiw-00000009Jrv-2BUS;
	Wed, 18 Mar 2026 20:42:38 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xiu-00000009Jpx-1agZ
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 20:42:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD99D33745D;
	Wed, 18 Mar 2026 21:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773866547; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IH7ZfNBkhNS2N1nKFAJ+41w55RSVuCvKMdXY4crVddE=;
	b=Arf80Ry9ZSgdnFL6DMRauRP2TPtgMtqVM+QTGzDI2XtURfxcVdRaGkODDSeSrlvSd2P1Fg
	+lgO+FBApYVN1J2YmOkq7AiEivggJAozWMz6SW4rGz35o4WzPXa7E+7nneIOxbXsQv8F0f
	un/YPCmO367nM+2wbKmqFKn0wqxqpBwQEy0hUv6PaU0WZRgVmylG7kiyIIYXko4wVRHzTr
	beZ6cGeIM9KEu/O0v9U84aeek5kWWGeunkEZkZPFydcFtetgsgo4oULvjGAL8udltgMl9T
	Vez3cgwpUE09wyKEiQl9oQ2a7s6Ye0yzf2edwVXFcbq4sjEPbN18zjBBBUo2+g==
Message-ID: <4d9f4984-3293-47ca-a15a-ceeb53cfabce@cjdns.fr>
Date: Wed, 18 Mar 2026 21:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: mediatek: Add support for EcoNet
 EN7528
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260316155157.679533-1-cjd@cjdns.fr>
 <20260316155157.679533-2-cjd@cjdns.fr>
 <20260317-feathered-cyber-snake-eb72fa@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260317-feathered-cyber-snake-eb72fa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_134236_621081_9C468440 
X-CRM114-Status: GOOD (  10.79  )
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


On 17/03/2026 08:26, Krzysztof Kozlowski wrote:
> On Mon, Mar 16, 2026 at 03:51:55PM +0000, Caleb James DeLisle wrote:
>>   
>>           mediatek,pbus-csr: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: econet,en7528-pcie
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +
>> +        clock-names:
>> +          maxItems: 1
>> +
>> +        reset: false
>> +
>> +        reset-names: false
>> +
>> +        power-domain: false
> Wrong property.
>
>> +
>> +        mediatek,pbus-csr: false
>> +
>> +      required:
>> +        - phys
>> +        - phy-names
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> @@ -436,3 +462,59 @@ examples:
>>               };
>>           };
>>       };
>> +
>> +  # EN7528
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>> +    #include <dt-bindings/clock/en7523-clk.h>
>> +    #include <dt-bindings/reset/airoha,en7523-reset.h>
>> +
>> +    soc_3 {
> soc
>
> Underscores are not allowed, but honestly neither soc node is needed nor
> the example. There are already 3 examples, it's enough, especially that
> there are no new properties here.

Ok, will remove the example then.

Thanks,

Caleb


>
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        pcie@1fb81000 {
>> +          compatible = "econet,en7528-pcie";
>> +          device_type = "pci";
>> +          linux,pci-domain = <0>;
>> +          #address-cells = <3>;
>> +          #size-cells = <2>;
>> +
>> +          reg = <0x1fb81000 0x1000>;
>> +          reg-names = "port0";
>> +
>> +          clocks = <&scuclk EN7523_CLK_PCIE>;
>> +          clock-names = "sys_ck0";
>> +
>> +          phys = <&pcie_phy0>;
>> +          phy-names = "pcie-phy0";
>> +
>> +          ranges = <0x01000000 0 0x00000000 0x1f600000 0 0x00010000>,
>> +                   <0x82000000 0 0x20000000 0x20000000 0 0x08000000>;
>> +
>> +          interrupt-parent = <&intc>;
>> +          interrupts = <23>;
>> +          interrupt-names = "pcie_irq";
>> +          bus-range = <0x00 0xff>;
>> +          #interrupt-cells = <1>;
>> +          interrupt-map-mask = <0 0 0 7>;
>> +          interrupt-map = <0 0 0 1 &pcie_intc 0>,
>> +              <0 0 0 2 &pcie_intc 1>,
>> +              <0 0 0 3 &pcie_intc 2>,
>> +              <0 0 0 4 &pcie_intc 3>;
>> +
>> +          pcie_intc: interrupt-controller {
>> +            interrupt-controller;
>> +            #address-cells = <0>;
>> +            #interrupt-cells = <1>;
>> +          };
>> +
>> +          slot0: pcie@0,0 {
>> +            device_type = "pci";
>> +            reg = <0x0000 0 0 0 0>;
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            ranges;
>> +          };
>> +        };
>> +    };
>> -- 
>> 2.39.5
>>

