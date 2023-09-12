Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AACCA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMy6jSxlLVQzjvcfRtLq3NXvZdu60RtRCF9sxWo1nvI=; b=nkEGs0795RV++aVMlM7sANuoTR
	SSI7XD7DbPb7IB5vSpEN2iH7B+PkyQXR1BWvZT5n+h/JmGSCQ4sBHG6x47WNYKPOnFk687NVLHa0a
	WHkZ/GzWwK3dXE+SXOhHtvP8A0EQuEMgR7UlJpPpr+cmbteAuBjcjU9Z6H5FCGDSObvI4E4660yF8
	3CsJr20Ds451Rb8i4VzdTL7A+AN1lHbHhT/mvvfTyjroR5a8hb8RvH9vLZbLYDo5nilBMfLcnyFx5
	/3VMbkdCGB5XjCEIJ+sR3k4hcTbNFrj6AdPS8TMR9qjKwhvrJgEvryLIGpOXifZx3YxnDO4d6t29q
	UHDZd5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxTa-002Luy-2n;
	Tue, 12 Sep 2023 07:06:22 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxTX-002LtZ-0v;
	Tue, 12 Sep 2023 07:06:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99bdcade7fbso658240566b.1;
        Tue, 12 Sep 2023 00:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694502376; x=1695107176; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CMy6jSxlLVQzjvcfRtLq3NXvZdu60RtRCF9sxWo1nvI=;
        b=As5TIMgrEeu2ptlIE9MdYQVj9caHjjA6cnEdaqmZGrUfz5kwb5Ws3jImIGu8YpS8rp
         Ag7LSDL4laY8DpY6pedfedIwK5GGaLiA6K3XcY1phu3VbbjfuLzVlT2rhV1prPY81WEr
         JM7nQR/rx6XeKWHvD4XG4wd1Y2Y2DMNSIrB29RegQ3kbnZ4lkz9dKmseKEbTl8oGnzjw
         ftk41vRcHKPZ+OfR04Cjslp7dJEBHirInq1epHs3WFi+DqdeRkkAkvFSIWZm1zduFcHe
         /XXnknMmkDGj0rwCk6cst3JgkIgZ5Fw182I7L+AsQX1UeDfI9o+K2zdt68MgkVS9cVKv
         Y3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502376; x=1695107176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMy6jSxlLVQzjvcfRtLq3NXvZdu60RtRCF9sxWo1nvI=;
        b=QzBW+8Wd4KTFS4TXHiaMjyAabamDWgqUsT1hmFSk242HlpqdE+EfgUwS3cxW6AcTMC
         Sw3CNfr49lz9bXxarhe3n/mli0xsjz7yoa0afhtYR04EpafDtryD0KOLTEVN3cnOYnwt
         Jm4CL9mXmRzs0ti76fcfZ4Ap/LRoj1iDAC1ijpxcVrXqVGYLiNWgOvyeCBDMG5xJ3PW+
         abuoDzndHFusQpZ5TCEwvcCvP5ZHzvahjkgtV4falaxQfoVz/rKkkMZmzHkNX0FSxB7s
         XytxeCqjFjHQkjk/i1RNB1lQP3Slkfn6whWbfnyhbq3IBKSWiruNDtXb2RcpYZ1mILUo
         qWjg==
X-Gm-Message-State: AOJu0YxSmQc2fTooc2IFk3ylSt6OthThbFv2wLXxhHZUO754CKns546y
	rTrKNPfNM8E9fOF5hEQ8YmU=
X-Google-Smtp-Source: AGHT+IEOrMxMs1WFBCbVhLR01bYFYeYSawxe090qODnBi4upxpLOi7jNd1Rrxbto/3+X6VvKL39rYA==
X-Received: by 2002:a17:906:8b:b0:9a1:d7cd:6040 with SMTP id 11-20020a170906008b00b009a1d7cd6040mr9828714ejc.37.1694502375674;
        Tue, 12 Sep 2023 00:06:15 -0700 (PDT)
Received: from [192.168.178.25] ([185.254.126.42])
        by smtp.gmail.com with ESMTPSA id p21-20020a170906b21500b0099b6becb107sm6415474ejz.95.2023.09.12.00.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 00:06:15 -0700 (PDT)
Message-ID: <23e71d1f-08c1-3834-5b1f-2b5714c7bfaa@gmail.com>
Date: Tue, 12 Sep 2023 09:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel drivers
 can allocate dmabufs from specific heaps
Content-Language: en-US
To: John Stultz <jstultz@google.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, tjmercier@google.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, jianjiao.zeng@mediatek.com,
 kuohong.wang@mediatek.com
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-4-yong.wu@mediatek.com>
 <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
 <CANDhNCrQyiFZ+8DnG0iyKBXC0H1698K1a9d2AxOq4whDsZBn+Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CANDhNCrQyiFZ+8DnG0iyKBXC0H1698K1a9d2AxOq4whDsZBn+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_000619_326015_95D5F88C 
X-CRM114-Status: GOOD (  33.65  )
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

Am 11.09.23 um 20:29 schrieb John Stultz:
> On Mon, Sep 11, 2023 at 3:14 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 11.09.23 um 04:30 schrieb Yong Wu:
>>> From: John Stultz <jstultz@google.com>
>>>
>>> This allows drivers who don't want to create their own
>>> DMA-BUF exporter to be able to allocate DMA-BUFs directly
>>> from existing DMA-BUF Heaps.
>>>
>>> There is some concern that the premise of DMA-BUF heaps is
>>> that userland knows better about what type of heap memory
>>> is needed for a pipeline, so it would likely be best for
>>> drivers to import and fill DMA-BUFs allocated by userland
>>> instead of allocating one themselves, but this is still
>>> up for debate.
>> The main design goal of having DMA-heaps in the first place is to avoid
>> per driver allocation and this is not necessary because userland know
>> better what type of memory it wants.
>>
>> The background is rather that we generally want to decouple allocation
>> from having a device driver connection so that we have better chance
>> that multiple devices can work with the same memory.
> Yep, very much agreed, and this is what the comment above is trying to describe.
>
> Ideally user-allocated buffers would be used to ensure driver's don't
> create buffers with constraints that limit which devices the buffers
> might later be shared with.
>
> However, this patch was created as a hold-over from the old ION logic
> to help vendors transition to dmabuf heaps, as vendors had situations
> where they still wanted to export dmabufs that were not to be
> generally shared and folks wanted to avoid duplication of logic
> already in existing heaps.  At the time, I never pushed it upstream as
> there were no upstream users.  But I think if there is now a potential
> upstream user, it's worth having the discussion to better understand
> the need.

Yeah, that indeed makes much more sense.

When existing drivers want to avoid their own handling and move their 
memory management over to using DMA-heaps even for internal allocations 
then no objections from my side. That is certainly something we should 
aim for if possible.

But what we should try to avoid is that newly merged drivers provide 
both a driver specific UAPI and DMA-heaps. The justification that this 
makes it easier to transit userspace to the new UAPI doesn't really count.

That would be adding UAPI already with a plan to deprecate it and that 
is most likely not helpful considering that UAPI must be supported 
forever as soon as it is upstream.

> So I think this patch is a little confusing in this series, as I don't
> see much of it actually being used here (though forgive me if I'm
> missing it).
>
> Instead, It seems it get used in a separate patch series here:
>    https://lore.kernel.org/all/20230911125936.10648-1-yunfei.dong@mediatek.com/

Please try to avoid stuff like that it is really confusing and eats 
reviewers time.

Regards,
Christian.

>
> Yong, I appreciate you sending this out! But maybe if the secure heap
> submission doesn't depend on this functionality, I might suggest
> moving this patch (or at least the majority of it) to be part of the
> vcodec series instead?  That way reviewers will have more context for
> how the code being added is used?
>
> thanks
> -john


