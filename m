Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465F3C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 12:01:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A1A6613B1
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 12:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A1A6613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ss7j0WblnxBcXCVRlDkAPRipPZC6xYJer3+N8SOz5ig=; b=QwDzR8K6iXD4qB2+kQQWS7LS6s
	nWQ+6KpiXQ4Bi4Geuxt+vkOu/n72E9ZHeCIDd9nB0JXM8+qOBDwrLQyVA6vAHolVCNkB2dRm+8bnK
	0VxWQBuKItumI2RuNb6v03nlTKWKVCZlSdYBk80145w6ZeZtqmACyGkrHBGYUA2QnhZBtKG0+afhP
	FCYfbFyFNSMaQLh8hZxGhkkT8xizO8nOo0z9WyjHJQ5S40ckdbmrKfzyFud/YM2b5CF2ZitsVHEx8
	X+FxBRivwbvmhIUaMka0lN6E0LwSG8FcfNXX2zDLi3ebaHw4RBERm/NUUjCOBJhe3J2e5xXv76gwA
	wxbyKO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loPYI-003sAa-Um; Wed, 02 Jun 2021 12:00:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loP7Y-003lUE-FG; Wed, 02 Jun 2021 11:33:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so3550300wmd.5; 
 Wed, 02 Jun 2021 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YpPo5MBLVYvDn/sYz6mEnGVnyd3ShtD58F9/Awc2BpA=;
 b=kVW6e8YiNo8g5jZzT0Bts2a0UncmcVWmaRW0M7i4O2D8xy+KvvmKD3sAyTGlgTG7kt
 zw+1i5ixEjtOgD6RVEZzoDp2k/njyKH8jrPuyLIhznfIc7VHdbm7b2UtgWB1YssswsbU
 ZuIG6NmLFgWN39RK9Ar7QVDrYpjbPUUYabz1oDvms+e9b8+DlXxRFI9wmNh2YngkXUdJ
 lKbjZZb5/P4fv7UmikpEZgwofHnuLV55T8byBfhsgH8pQXC9ZYV2Vb3cRkrUOE4AYVqL
 gLrtgaMlJQ6Zn10S60flrArFRJTPtIyhRQzDHlklc3hkveSxrwR+7R5zPjil+GV7TUdC
 fYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YpPo5MBLVYvDn/sYz6mEnGVnyd3ShtD58F9/Awc2BpA=;
 b=ZE9BfV9xUQFnQhp1opx2KHFc4/sHCIlTQlXYRSfZnKk6iPmKmtAWVjD7xyOj+Hh8sV
 lD4W6Qw2889wSggsNRHGyrQz/zTbtIKNjsXH5c1sORu3d4qwMLHYaGYb7KlLR0U+Ugd3
 xcmKlfeHGDQ/+hAWXUv8y/0+AjAwMYw5AcEsZBWt3k0Q/2Isen7GFfB7dMITSjfxZKa/
 e/tCdK5gwIEpgysHxpXIb2XRb2MHVpgHBQgtuu6lFM7+qXyxoSCTGhcz9KiI48vUS5eW
 2QOAsAyU0AWgf9mip+LfpqaJCAHV5qm+RlnIk/YNqfopkAsG/nzmV4YOstCMyHW8kSKy
 9iKg==
X-Gm-Message-State: AOAM531XtVURN8/zIr0lEda45daTUZrGfU5GsKmileVYBswjQ2t5EWLl
 bWAmBwatpTYkZLMXngZertQ=
X-Google-Smtp-Source: ABdhPJwCYFHyPJ4mtPKQH6YK0yXLSoUWALZ/L3nQxpyEn8N3GhSJpqhz2Lz5eakMQ6A+sxu6jdDVOg==
X-Received: by 2002:a7b:c002:: with SMTP id c2mr31535267wmb.118.1622633590311; 
 Wed, 02 Jun 2021 04:33:10 -0700 (PDT)
Received: from ziggy.stardust ([46.6.149.244])
 by smtp.gmail.com with ESMTPSA id r7sm3057110wma.9.2021.06.02.04.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 04:33:09 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8195
To: Chen-Yu Tsai <wenst@chromium.org>, Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Randy Wu <Randy.Wu@mediatek.com>, youlin.pei@mediatek.com
References: <20210601024408.24485-1-jianjun.wang@mediatek.com>
 <20210601024408.24485-2-jianjun.wang@mediatek.com>
 <CAGXv+5G-8+ppafiUnqWm2UeiL+edHJ2zYZvU-S7mz_NdrM3YsA@mail.gmail.com>
 <1622526594.9054.6.camel@mhfsdcap03>
 <CAGXv+5GMTbC5TTgURhPAvxBEY18S6-T-BZ9CpXsO91Trim7TXw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <db62910b-febd-6cba-8a72-2bf718f7b110@gmail.com>
Date: Wed, 2 Jun 2021 13:33:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAGXv+5GMTbC5TTgURhPAvxBEY18S6-T-BZ9CpXsO91Trim7TXw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_043312_615294_0C909B39 
X-CRM114-Status: GOOD (  33.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/06/2021 08:07, Chen-Yu Tsai wrote:
> Hi,
> 
> On Tue, Jun 1, 2021 at 1:50 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
>>
>> On Tue, 2021-06-01 at 11:53 +0800, Chen-Yu Tsai wrote:
>>> Hi,
>>>
>>> On Tue, Jun 1, 2021 at 10:50 AM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
>>>>
>>>> MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.
>>>
>>> Based on what I'm seeing internally, there seems to be some inconsistency
>>> across the MediaTek platform on whether new compatible strings should be
>>> introduced for "fully compatible" IP blocks.
>>>
>>> If this hardware block in MT8195 is "the same" as the one in MT8192, do we
>>> really need the new compatible string? Are there any concerns?
>>
>> Hi Chen-Yu,
>>
>> It's ok to reuse the compatible string with MT8192, but I think this
>> will be easier to find which platforms this driver is compatible with,
>> especially when we have more and more platforms in the future.
> 
> If it's just for informational purposes, then having the MT8192 compatible
> as a fallback would work, and we wouldn't need to make changes to the driver.
> This works better especially if we have to support multiple operating systems
> that use device tree.
> 
> So we would want
> 
>     "mediatek,mt8195-pcie", "mediatek,mt8192-pcie"
> 
> and
> 
>     "mediatek,mt8192-pcie"
> 
> be the valid options.
> 
> Personally I'm not seeing enough value to justify adding the compatible string
> just for informational purposes though. One could easily discern which hardware
> is used by looking at the device tree.
> 

I agree, if no differences between the two chips are known, adding a binding
withe new compatible and a fallback is a good thing. If we later on realize that
mt8195 PCI block has differences, we can add the matching to the driver.

Regards,
Matthias

> 
> Regards
> ChenYu
> 
> 
>> Thanks.
>>>
>>>
>>> Thanks
>>> ChenYu
>>>
>>>
>>>> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
>>>> index e7b1f9892da4..d5e4a3e63d97 100644
>>>> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
>>>> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
>>>> @@ -48,7 +48,9 @@ allOf:
>>>>
>>>>  properties:
>>>>    compatible:
>>>> -    const: mediatek,mt8192-pcie
>>>> +    oneOf:
>>>> +      - const: mediatek,mt8192-pcie
>>>> +      - const: mediatek,mt8195-pcie
>>>>
>>>>    reg:
>>>>      maxItems: 1
>>>> --
>>>> 2.18.0
>>>> _______________________________________________
>>>> Linux-mediatek mailing list
>>>> Linux-mediatek@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
