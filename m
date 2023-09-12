Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE55CA0EF2
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2B3Gk4Dx6wHEerfyR7Eq4KBmIn4xhOyEbnMyTnMopAU=; b=RJL0u3EiyDpe/1sFG9b37GmJCI
	QyOVSj/oke/Dzr5CzfpfRrIRsrToHUwqhllQickgQnO+CsQOTcjptDPdEbMFBUL6iMFOk5lHjccVf
	5nfPQpFXoKhmUItbgRujJw4Z1Ioc/L7a5f5CyrcPMaFtGLL9eJfGo0FCYQJv6Jm/WIQ+x/3IDeQft
	zPwPqgZWeUR75MZxiQtG4HhcZhdkAbTFOczVyNQexbfViK3jomaIOUAapli7VFc/EnK2k8vl++qZj
	mQPvgYFsAx73OxRi7zOhPZGEHYikDSKL1iOfWtIc4YlmFRVMnA6fhzvWcgGA7GloHsK99bgN8kJ3t
	TMYGtVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg5u4-003mqN-2G;
	Tue, 12 Sep 2023 16:06:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg5u0-003moV-14;
	Tue, 12 Sep 2023 16:06:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6143AC15;
	Tue, 12 Sep 2023 09:06:46 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 517A53F738;
	Tue, 12 Sep 2023 09:06:06 -0700 (PDT)
Message-ID: <e6f236aa-4a16-baf0-6567-1714248e2fc0@arm.com>
Date: Tue, 12 Sep 2023 17:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <20230911154448.GA1279317-robh@kernel.org>
 <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
 <c62a7ed8-d80a-3a82-040a-d4c74a71285a@linaro.org>
 <95f9dd3b-1f33-4af5-8757-a97e8b9bb216@arm.com>
 <20230912155338.GA842444-robh@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230912155338.GA842444-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_090612_482636_BDBE7EA2 
X-CRM114-Status: GOOD (  27.25  )
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

On 12/09/2023 4:53 pm, Rob Herring wrote:
> On Tue, Sep 12, 2023 at 11:13:50AM +0100, Robin Murphy wrote:
>> On 12/09/2023 9:28 am, Krzysztof Kozlowski wrote:
>>> On 12/09/2023 08:16, Yong Wu (吴勇) wrote:
>>>> Hi Rob,
>>>>
>>>> Thanks for your review.
>>>>
>>>> On Mon, 2023-09-11 at 10:44 -0500, Rob Herring wrote:
>>>>>    	
>>>>> External email : Please do not click links or open attachments until
>>>>> you have verified the sender or the content.
>>>>>    On Mon, Sep 11, 2023 at 10:30:37AM +0800, Yong Wu wrote:
>>>>>> This adds the binding for describing a CMA memory for MediaTek
>>>>> SVP(Secure
>>>>>> Video Path).
>>>>>
>>>>> CMA is a Linux thing. How is this related to CMA?
>>>>
>>>>>>
>>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>>>> ---
>>>>>>    .../mediatek,secure_cma_chunkmem.yaml         | 42
>>>>> +++++++++++++++++++
>>>>>>    1 file changed, 42 insertions(+)
>>>>>>    create mode 100644 Documentation/devicetree/bindings/reserved-
>>>>> memory/mediatek,secure_cma_chunkmem.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/reserved-
>>>>> memory/mediatek,secure_cma_chunkmem.yaml
>>>>> b/Documentation/devicetree/bindings/reserved-
>>>>> memory/mediatek,secure_cma_chunkmem.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..cc10e00d35c4
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/reserved-
>>>>> memory/mediatek,secure_cma_chunkmem.yaml
>>>>>> @@ -0,0 +1,42 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id:
>>>>> http://devicetree.org/schemas/reserved-memory/mediatek,secure_cma_chunkmem.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: MediaTek Secure Video Path Reserved Memory
>>>>>
>>>>> What makes this specific to Mediatek? Secure video path is fairly
>>>>> common, right?
>>>>
>>>> Here we just reserve a buffer and would like to create a dma-buf secure
>>>> heap for SVP, then the secure engines(Vcodec and DRM) could prepare
>>>> secure buffer through it.
>>>> But the heap driver is pure SW driver, it is not platform device and
>>>
>>> All drivers are pure SW.
>>>
>>>> we don't have a corresponding HW unit for it. Thus I don't think I
>>>> could create a platform dtsi node and use "memory-region" pointer to
>>>> the region. I used RESERVEDMEM_OF_DECLARE currently(The code is in
>>>> [9/9]). Sorry if this is not right.
>>>
>>> If this is not for any hardware and you already understand this (since
>>> you cannot use other bindings) then you cannot have custom bindings for
>>> it either.
>>>
>>>>
>>>> Then in our usage case, is there some similar method to do this? or
>>>> any other suggestion?
>>>
>>> Don't stuff software into DTS.
>>
>> Aren't most reserved-memory bindings just software policy if you look at it
>> that way, though? IIUC this is a pool of memory that is visible and
>> available to the Non-Secure OS, but is fundamentally owned by the Secure
>> TEE, and pages that the TEE allocates from it will become physically
>> inaccessible to the OS. Thus the platform does impose constraints on how the
>> Non-Secure OS may use it, and per the rest of the reserved-memory bindings,
>> describing it as a "reusable" reservation seems entirely appropriate. If
>> anything that's *more* platform-related and so DT-relevant than typical
>> arbitrary reservations which just represent "save some memory to dedicate to
>> a particular driver" and don't actually bear any relationship to firmware or
>> hardware at all.
> 
> Yes, a memory range defined by hardware or firmware is within scope of
> DT. (CMA at aribitrary address was questionable.)
> 
> My issue here is more that 'secure video memory' is not any way Mediatek
> specific. AIUI, it's a requirement from certain content providers for
> video playback to work. So why the Mediatek specific binding?

Based on the implementation, I'd ask the question the other way round - 
the way it works looks to be at least somewhat dependent on Mediatek's 
TEE, in ways where other vendors' equivalent implementations may be 
functionally incompatible, however nothing suggests it's actually 
specific to video (beyond that presumably being the primary use-case 
they had in mind).

Thanks,
Robin.

