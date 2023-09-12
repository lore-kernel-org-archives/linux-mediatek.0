Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB5ACA0ECF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 08:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLzVKDkkOXZ4N+LBDosJ9GVpBHoDNwCkMSqFqUtTQYE=; b=CIVI0Su74l0F2O7PNYSIpCN4zu
	HRdHqFTkQb1rR6qpsTEBCV9r4RxCScQVcnDnMuCxmGUF6aOO8V9iNnTumqp75qvQo3GsuSyLsUAjx
	vd0GfLaw7gzMfJPX4CBXySOiTR/5XaWb3KbjfOhyGshUCs9cpjuu0q3QeNVCYRDJgWOj7XUCVtLZr
	JFTBLxmqXsqqAVRmCHunBN0LryzDa+tYyPS5KU0cMJN29h0ZB/SP/yJI8gfJBJFhshUwOwoMUJyYU
	Ij9i+SKLSiXT+y9TNmxeTIE4woSJbYdz0R/rpaOvXusUbXW4aaPuqYgmcMXFGguyN73xjyOCPmAlG
	uoosU3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfylG-002ZXP-2x;
	Tue, 12 Sep 2023 08:28:42 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfylD-002ZWP-3A
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 08:28:41 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9a21b6d105cso678543066b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694507318; x=1695112118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLzVKDkkOXZ4N+LBDosJ9GVpBHoDNwCkMSqFqUtTQYE=;
        b=KgYIWfOVez1E9ki8hekJD984LGRbRZDWpTpEg4BLtD9PzvkAwTPuNnrwzHdjM9gZY2
         9Ye6RWTLX2TPHIXOPlYWaRt4C7kergGjGZhrLxz36vu2kwcdnninBX4JSy1oEZzXkywR
         C/vSbKgB55X5KgRNNaDeIAYzqNXMQqkCb7x6CNTE+SVBAcPshOiMw0Yz7ZRcApgyMK3f
         ra4CEKEPy0Q1KcRoBlyXAmh2Dy3ZRpxdEBICyLgc8JwK6aD65EknmtbkmJZRXo1CIE5k
         +pXhqxcL8bXWpP3Bwz8PF/6O3V/aIqUV83fBrLoavgp6GUYHmMMsfBYlasAnaZCHf5jo
         vOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694507318; x=1695112118;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLzVKDkkOXZ4N+LBDosJ9GVpBHoDNwCkMSqFqUtTQYE=;
        b=e8ozw2Ok4ex3EOlZdvKxbQNDPaXwWWVjQm9i1MNdKspuFvj83YoGaLYYgOheLPPjb6
         IINfy7NTcsBLl+iOBx9UY2VQdTHjGSW/pd9I+p8gHb8Pw1VguzlYyxMMsTBn0svz6+gH
         ZJhmB0vgABMkiUX0yQdUtGtwbEKvVSd9UC6SdkYEfeTDI4xZddFt19qrehv7qWJJj4e8
         hs6rgGniClbJftbddUrekufOZhUgHau32O5P7B+zEgC/4DynS8QxKLNsNql9ROCO8IVO
         0VWoTTUXlArmZ4TTQ76Rt3bVRAP96eWqSDvle56cIz4OP7qNQ7ijtdHVPWGCNfhye9EK
         ll7Q==
X-Gm-Message-State: AOJu0Yy17D7FzMywsGI4OSqUDwsHOdfc/3pbVzQqJtiY0fngPQFP1zl0
	6jgWu6gfqvlvPVNvrXj/eTBB7A==
X-Google-Smtp-Source: AGHT+IHki0HI2dzDOWH07bBWQQqpwLHYoRHu3OffIZhdj/Y17PLOWS/fEeXHSa+TXIl8iuit84dkTA==
X-Received: by 2002:a17:907:2ccb:b0:9a9:ee3d:48e3 with SMTP id hg11-20020a1709072ccb00b009a9ee3d48e3mr9692911ejc.12.1694507318462;
        Tue, 12 Sep 2023 01:28:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id q18-20020a170906a09200b0099b8234a9fesm6507600ejy.1.2023.09.12.01.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 01:28:37 -0700 (PDT)
Message-ID: <c62a7ed8-d80a-3a82-040a-d4c74a71285a@linaro.org>
Date: Tue, 12 Sep 2023 10:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Content-Language: en-US
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_012840_059260_D5D975FC 
X-CRM114-Status: GOOD (  25.63  )
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

On 12/09/2023 08:16, Yong Wu (吴勇) wrote:
> Hi Rob,
> 
> Thanks for your review.
> 
> On Mon, 2023-09-11 at 10:44 -0500, Rob Herring wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On Mon, Sep 11, 2023 at 10:30:37AM +0800, Yong Wu wrote:
>>> This adds the binding for describing a CMA memory for MediaTek
>> SVP(Secure
>>> Video Path).
>>
>> CMA is a Linux thing. How is this related to CMA?
> 
>>>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>  .../mediatek,secure_cma_chunkmem.yaml         | 42
>> +++++++++++++++++++
>>>  1 file changed, 42 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/reserved-
>> memory/mediatek,secure_cma_chunkmem.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/reserved-
>> memory/mediatek,secure_cma_chunkmem.yaml
>> b/Documentation/devicetree/bindings/reserved-
>> memory/mediatek,secure_cma_chunkmem.yaml
>>> new file mode 100644
>>> index 000000000000..cc10e00d35c4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/reserved-
>> memory/mediatek,secure_cma_chunkmem.yaml
>>> @@ -0,0 +1,42 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: 
>> http://devicetree.org/schemas/reserved-memory/mediatek,secure_cma_chunkmem.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek Secure Video Path Reserved Memory
>>
>> What makes this specific to Mediatek? Secure video path is fairly 
>> common, right?
> 
> Here we just reserve a buffer and would like to create a dma-buf secure
> heap for SVP, then the secure engines(Vcodec and DRM) could prepare
> secure buffer through it.
>  
> But the heap driver is pure SW driver, it is not platform device and

All drivers are pure SW.

> we don't have a corresponding HW unit for it. Thus I don't think I
> could create a platform dtsi node and use "memory-region" pointer to
> the region. I used RESERVEDMEM_OF_DECLARE currently(The code is in 
> [9/9]). Sorry if this is not right.

If this is not for any hardware and you already understand this (since
you cannot use other bindings) then you cannot have custom bindings for
it either.

> 
> Then in our usage case, is there some similar method to do this? or
> any other suggestion?

Don't stuff software into DTS.

Best regards,
Krzysztof


