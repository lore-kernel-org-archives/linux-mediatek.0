Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C27C282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSr0TDQLJaYD83EU6zHlB1nKsxywhTiBP95UqC0cvIM=; b=OsbtVnMyNO9XZT/afPvII3/+R1
	2hrEDBPTZAtr8N5ujWHntVuf8gZuoUBail/3kKiyEFE4DsXoBLhuomzT/uOp+rK4h7xmizZG7JeP+
	FvbV4qs79RQkNZC3ZBd6ASA1XSMmsF2ZV18ylaZ4KWRe+SXW0LtpRMtuHjFoIaZWeZm++Kg9A/lek
	O3JY5JV57xJeeAxEGg2ZA3d3HxT0Qm2NoKbUvfEGesKpt7dGezNEgbulDvERBFLRTieMkXI7jNaKq
	g+eaCXmGNe2ZJlaX0lcdgSUv5pqroSwGTSgNsSzn3G5ss+6aI7DwX2rw75FDpIcvnnTbYlLoNCbVL
	4W2lRuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzOv-00000005mXT-101y;
	Tue, 11 Mar 2025 13:12:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzOs-00000005mVu-2sPj
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Mar 2025 13:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741698721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSr0TDQLJaYD83EU6zHlB1nKsxywhTiBP95UqC0cvIM=;
	b=AuxcVmX5L98J6CV1pP70CYL/5e/gCcKr0I7DA366OzwOQlQvYF5eCmLzSOZH5VBNFXCQBv
	nXGFLtunYLNMPiBn9I78iepk/+FrexDiRgF9PUjSLraE3LpBrFE5leIKhkcHpNu27ozV+1
	3C8EXiy6oiN0t8KNsqmfBnXEGplL8KA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-J-YM1hcbM2qJ1k09NlrITg-1; Tue, 11 Mar 2025 09:08:50 -0400
X-MC-Unique: J-YM1hcbM2qJ1k09NlrITg-1
X-Mimecast-MFC-AGG-ID: J-YM1hcbM2qJ1k09NlrITg_1741698529
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so12822715e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Mar 2025 06:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741698529; x=1742303329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSr0TDQLJaYD83EU6zHlB1nKsxywhTiBP95UqC0cvIM=;
        b=XBxPX+gCrL7XnEW8dcP+itUID2lG5FjHeScptkjIsmvb67QOCp+YjX/Wi33b/iHMG0
         8TV9MtgoBXbpkQYCnZLKDIblpI4u1AFzUwfetHW7GKzjRsRFyHFIVgUM8XlyAUa6PUCi
         sk67zcnAHb17GiCC8h3jKAmy8a7NMTNsCGCsfuMVX+2ENKAL/sGh+SBuybsdvWSck5Rr
         CAWsFZXbZU7HvKBr4TUTogC+Y7ZRtrBPeWf/OjAhoqrs8HPEZlXoODyOnLwMQhY43vVY
         TVgKIVF5Sk3WQrE55Ko/UOs3mpoqEwDuJZYu0FbEoC4Wnsknnn+gvHPqXfaCFnqFqUgz
         WWHA==
X-Forwarded-Encrypted: i=1; AJvYcCWADpCXUds2yenn9FiechQgYjLP/TDwsvEHi2MBcZ1Ouu7edABWqko/qlYlEeGgPQELYg2QYgyTSi6RIAlUPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO9iwTjsXkvDG68NsC3hRLbwl03pnsH2e85/N4nJBU92kvWRTy
	wFZgYOOBrt1/gTT7138nelXZofxXhr/bPDJxpSXrw18ec2csVpuRiVz8LeMYK/64zFiKVdowyj6
	A+hldHaPcB9Pl1afDweJH8LlxHnSW7qM70gchCsaD9RjvzCsdnA0AkOqBZ7/XN656om+1ew==
X-Gm-Gg: ASbGncurBqsFngf6hhMtTZhpShlYeAX/gRshWCXdULxFmDk7Ge2VllAvb4W/t8CuXA3
	USV0qB+eZWRsgPqRqE9g0yDuhX44E8tqLBIRquziNwg4aWsU6ZrmTK3TUXN2gXpWGW3i0h3Whd9
	8A8wJwBHY82mASHZAZL4ToZO4Jv1Ve6VcCrmmUKG/QWB2kYMF80Qkl4EtVBIZt3K5BfA/aIcDqV
	VNFgRb/gCMW4plyuQH9sU/Cf/7vxHRPZS541OcvlHbapFyuQWRJgtZ3c2lIlTes77VIi0ysZNd2
	n2AcpKmScLO7xPEuQtVuLe/JoWXjae5ZeqW1vCJcCXGsIA==
X-Received: by 2002:a05:600c:3b04:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-43cf44c7703mr98399015e9.14.1741698528863;
        Tue, 11 Mar 2025 06:08:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHg2xJEtdcFy90P2VzdKFh3p/fCZJcgu7H/volTSsPrNEA8I4PMuG+4jYjYdTWL3xOUsvL7A==
X-Received: by 2002:a05:600c:3b04:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-43cf44c7703mr98398315e9.14.1741698528418;
        Tue, 11 Mar 2025 06:08:48 -0700 (PDT)
Received: from [192.168.88.253] (146-241-12-146.dyn.eolo.it. [146.241.12.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf3ca4f5asm82801875e9.12.2025.03.11.06.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 06:08:47 -0700 (PDT)
Message-ID: <72cd7f5a-ab92-494c-b7f8-4696d23ed4b1@redhat.com>
Date: Tue, 11 Mar 2025 14:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH net-next v11 0/4] fix the DMA API misuse
 problem for page_pool
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Yunsheng Lin <yunshenglin0825@gmail.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net, kuba@kernel.org
Cc: zhangkun09@huawei.com, liuyonglong@huawei.com, fanghaiqing@huawei.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Gaurav Batra <gbatra@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, IOMMU <iommu@lists.linux.dev>,
 MM <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>
References: <20250307092356.638242-1-linyunsheng@huawei.com>
 <87v7slvsed.fsf@toke.dk> <40b33879-509a-4c4a-873b-b5d3573b6e14@gmail.com>
 <875xkj1t70.fsf@toke.dk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <875xkj1t70.fsf@toke.dk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vQgezpF3ht6qq9Q9odyx0kQDiF03XRIqSy6Dc1Fusmc_1741698529
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_061202_789829_5606A285 
X-CRM114-Status: GOOD (  20.64  )
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

On 3/8/25 3:40 PM, Toke Høiland-Jørgensen wrote:
> Yunsheng Lin <yunshenglin0825@gmail.com> writes:
>> I only took a glance at git code above, it seems reusing the
>> _pp_mapping_pad for pp_dma_index seems like a wrong direction
>> as mentioned in discussion with Ilias above as the field might
>> be used when a page is mmap'ed to user space, and reusing that
>> field in 'struct page' seems to disable the tcp_zerocopy feature,
>> see the below commit from Eric:
>> https://github.com/torvalds/linux/commit/577e4432f3ac810049cb7e6b71f4d96ec7c6e894
>>
>> Also, I am not sure if a page_pool owned page can be spliced into the fs
>> subsystem yet, but if it does, I am not sure how is reusing the
>> page->mapping possible if that page is called in __filemap_add_folio()?
>>
>> https://elixir.bootlin.com/linux/v6.14-rc5/source/mm/filemap.c#L882
> 
> Hmm, so I did look at the mapping field, but concluded using it wouldn't
> interfere with anything relevant as long as it's reset back to zero
> before the page is returned to the page allocator. However, I definitely
> missed the TCP zero-copy thing, and other things as well, it would seem
> (cf the discussion you referred to above).
> 
> However, I did consider alternatives: AFAICT there should be space in
> the pp_magic field (used for the PP_SIGNATURE), so that with a bit of
> care we can stick an ID into the upper bits and still avoid ending up
> with a value that could look like a valid pointer.
> 
> I didn't implement that initially because I wasn't sure it was
> necessary, but seeing as it is, I will take another look at it. I have
> one or two other ideas if this turns out not to pan out.

Another dumb option would be storing directly the page address in the
xarray, and avoid entirely going through an ID. I guess it will use more
memory (the array will be more sparse) and will have more overhead, but
could be possibly simpler?

/P


