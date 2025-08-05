Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F09DC87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Aug 2025 21:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/eL0tC2humxAnE4NSMATRiPYyHhDovlDD4H4yRhz90=; b=TyNbzcnjM08X+4EMOhijKZGJG/
	Nz7c5o32Y2YlDxgOJvWR3CGYQdgLqTRsO0+dsx/gPEfqGSO93AwuVtBejzRGI4X56tiFaQsZ+l1Z3
	3pYqqYZVyPI1ROLOLt9Qa9wkIIQsCd76awTZX5B3IlaxWMF/Or1b1adRYi/OuVYnhnBMQrdQ4GR9I
	TQr5qRcxj0Q8QIRxy4YtMXTghx9YAAnRCah0FhPipD/NZFSU9aAAtCcWXqSvuBGefh4mMUI9be51i
	CuA00aHynrqg930eqmB5V/P+caOOcmAG4tjteU9+HyjRjVoTbmkRZw/yi4GSH6RJnAJA3WbJdBgb6
	7UkZRSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOv0-0000000DntB-3Bta;
	Tue, 05 Aug 2025 21:09:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOty-0000000DngN-2YGx
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Aug 2025 21:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754428133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=u/eL0tC2humxAnE4NSMATRiPYyHhDovlDD4H4yRhz90=;
	b=aWWOK+cU4Sj+SGHFTn3x+fy54G3zwLdW5O7HqwanwRGDVnCR/vV8hVTI4+5pCK2fPAUOz6
	5L9kMjbWehG/KyxmHjjAzoXV4zC/+OkHvNjJYdgt/D4S3hj4hIAchlKgT6vN2kOUa+J4mX
	tYu9BBrrBdEHDwui7HCttPlqEk1kFU0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-79NH7_2bO8myysjd5Kjocw-1; Tue, 05 Aug 2025 17:08:51 -0400
X-MC-Unique: 79NH7_2bO8myysjd5Kjocw-1
X-Mimecast-MFC-AGG-ID: 79NH7_2bO8myysjd5Kjocw_1754428130
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-459d6c83e2eso14612735e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Aug 2025 14:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754428130; x=1755032930;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u/eL0tC2humxAnE4NSMATRiPYyHhDovlDD4H4yRhz90=;
        b=eISymqFbKsIs9aXH1KWKBTUOKuj9yAT2Rx91zi9IczRV06iHtisjIQ1J9tCSbPTblt
         M7cBzHQRikU9xHI61oLmqCjAN1fK/fu62X/gsLVdwWbLaDEmBvinnuuzZ4GH1gRRcWp6
         NzDw9bz2+EjtSsIT6BRZMQAkfeyO1oANLHOr/7bUg68D8Zq/Uh2fejLe/Z50eB9qSMOI
         IBpBWHo0Xqe4lL9hOXZKp5wSrk6u83ZWIa+rdifiPH2ArJgBBFv7U8AJ/T0zSD7J29Kp
         jc1LLMsUraDQkZhV2wU34cHRr6AqApAs1LDTYL8wHO2grwI7H2D4/68wHJU3+BgR3Hq2
         be3g==
X-Forwarded-Encrypted: i=1; AJvYcCVRcFjdr0pkHRxje/NDTRlDsgA6s6HY8xBCjQg7nhtK0wSweIeKPufHvXAxbUU5HB3aPia1xvVpFj58Y9iHmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeOmTvrnz7V6kb9GeLjnukSOBsP4EYbj+Gl2nyWBy/BYVauiva
	y69+m0sz3rFi011WevA2Y0UHKcIexpIM5qdgtqeDj3hTPHBz+a4pbg4fqNrTg+3x550ifCLw+40
	EZ56v5U3HxoYxwcF6/DG7NNSIAGzbx2517Neemn11LB4WsVB2EGFufT0/3WxFDjIBC5Zngvf7ug
	==
X-Gm-Gg: ASbGncsMdXETfbEepzPSwsfqKOXGqvEbHzFjgpHGi2767z3N6vDkyqKshRw3j4spbgC
	D+mhtHeV0bt/wjfLErV6p44RKQS6tjlINF1uSUvZK97W/bqUhIeouZ6L+EfthKLm6Hj7SNP2VGA
	N6pffgNW2Ew7TKstKam0iP8FOZiT3gcxVs/WkJ8AaYGtnyWeV/c5xhqXxPa1HHLUdwffkgrwmZX
	kgx53ZtOrWXWCDVoaCm0MgeEhCDcktEGB1DhbbAXfrUQKDZmjDA2WX+CX0SC/FNnXwx6uXchFtN
	8Ql4JnfCJk5cU1ReKNlgc7Rbf1xVuxpENPeBBZ/qw0t1X8YAkgm02irtW5rXAN7tuDf7KVHvcqa
	p8ZLTaD7CmfM/R/XfODlfQYlSERRwm3/FLZm5OaybYtwMCG06zdKwL0nbGw9lZvEs3gM=
X-Received: by 2002:a05:600c:4fd5:b0:456:26a1:a0c1 with SMTP id 5b1f17b1804b1-459e70eeb5cmr2928335e9.17.1754428130192;
        Tue, 05 Aug 2025 14:08:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcSYv4Sqy94KAApt5uEeACzubGuEsOE55mxZ7I9ESflZEKKHfxakUYforoYyFFXqPR+btRNg==
X-Received: by 2002:a05:600c:4fd5:b0:456:26a1:a0c1 with SMTP id 5b1f17b1804b1-459e70eeb5cmr2928115e9.17.1754428129737;
        Tue, 05 Aug 2025 14:08:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4b:5100:3004:3864:4049:722e? (p200300d82f4b5100300438644049722e.dip0.t-ipconnect.de. [2003:d8:2f4b:5100:3004:3864:4049:722e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5879d76sm20391725e9.24.2025.08.05.14.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 14:08:49 -0700 (PDT)
Message-ID: <6dee6cd9-c67f-480f-b728-21c3a7b72004@redhat.com>
Date: Tue, 5 Aug 2025 23:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: Juan Yescas <jyescas@google.com>
Cc: akash.tyagi@mediatek.com, Andrew Morton <akpm@linux-foundation.org>,
 angelogioacchino.delregno@collabora.com, hannes@cmpxchg.org,
 Brendan Jackman <jackmanb@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com,
 Michal Hocko <mhocko@suse.com>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, wsd_upstream@mediatek.com,
 Zi Yan <ziy@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Isaac Manjarres <isaacmanjarres@google.com>
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com>
 <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
 <486c5773-c7fa-4e19-b429-90823ed2f7d5@redhat.com>
 <CAJDx_ri==3SxFcuKXHpNjrtxbp0hLyhM+zXeJ-LQX38rfbUChw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAmgsLPQFCRvGjuMACgkQTd4Q
 9wD/g1o0bxAAqYC7gTyGj5rZwvy1VesF6YoQncH0yI79lvXUYOX+Nngko4v4dTlOQvrd/vhb
 02e9FtpA1CxgwdgIPFKIuXvdSyXAp0xXuIuRPQYbgNriQFkaBlHe9mSf8O09J3SCVa/5ezKM
 OLW/OONSV/Fr2VI1wxAYj3/Rb+U6rpzqIQ3Uh/5Rjmla6pTl7Z9/o1zKlVOX1SxVGSrlXhqt
 kwdbjdj/csSzoAbUF/duDuhyEl11/xStm/lBMzVuf3ZhV5SSgLAflLBo4l6mR5RolpPv5wad
 GpYS/hm7HsmEA0PBAPNb5DvZQ7vNaX23FlgylSXyv72UVsObHsu6pT4sfoxvJ5nJxvzGi69U
 s1uryvlAfS6E+D5ULrV35taTwSpcBAh0/RqRbV0mTc57vvAoXofBDcs3Z30IReFS34QSpjvl
 Hxbe7itHGuuhEVM1qmq2U72ezOQ7MzADbwCtn+yGeISQqeFn9QMAZVAkXsc9Wp0SW/WQKb76
 FkSRalBZcc2vXM0VqhFVzTb6iNqYXqVKyuPKwhBunhTt6XnIfhpRgqveCPNIasSX05VQR6/a
 OBHZX3seTikp7A1z9iZIsdtJxB88dGkpeMj6qJ5RLzUsPUVPodEcz1B5aTEbYK6428H8MeLq
 NFPwmknOlDzQNC6RND8Ez7YEhzqvw7263MojcmmPcLelYbfOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCaCwtJQUJG8aPFAAKCRBN3hD3AP+DWlDnD/4k2TW+HyOOOePVm23F5HOhNNd7nNv3
 Vq2cLcW1DteHUdxMO0X+zqrKDHI5hgnE/E2QH9jyV8mB8l/ndElobciaJcbl1cM43vVzPIWn
 01vW62oxUNtEvzLLxGLPTrnMxWdZgxr7ACCWKUnMGE2E8eca0cT2pnIJoQRz242xqe/nYxBB
 /BAK+dsxHIfcQzl88G83oaO7vb7s/cWMYRKOg+WIgp0MJ8DO2IU5JmUtyJB+V3YzzM4cMic3
 bNn8nHjTWw/9+QQ5vg3TXHZ5XMu9mtfw2La3bHJ6AybL0DvEkdGxk6YHqJVEukciLMWDWqQQ
 RtbBhqcprgUxipNvdn9KwNpGciM+hNtM9kf9gt0fjv79l/FiSw6KbCPX9b636GzgNy0Ev2UV
 m00EtcpRXXMlEpbP4V947ufWVK2Mz7RFUfU4+ETDd1scMQDHzrXItryHLZWhopPI4Z+ps0rB
 CQHfSpl+wG4XbJJu1D8/Ww3FsO42TMFrNr2/cmqwuUZ0a0uxrpkNYrsGjkEu7a+9MheyTzcm
 vyU2knz5/stkTN2LKz5REqOe24oRnypjpAfaoxRYXs+F8wml519InWlwCra49IUSxD1hXPxO
 WBe5lqcozu9LpNDH/brVSzHCSb7vjNGvvSVESDuoiHK8gNlf0v+epy5WYd7CGAgODPvDShGN
 g3eXuA==
Organization: Red Hat
In-Reply-To: <CAJDx_ri==3SxFcuKXHpNjrtxbp0hLyhM+zXeJ-LQX38rfbUChw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h3oyyQi_fXWmHy6DtVIajan10ZPFrI21R3g_ki5fMrY_1754428130
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_140854_723841_C117B817 
X-CRM114-Status: GOOD (  27.39  )
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

On 05.08.25 18:57, Juan Yescas wrote:
> On Tue, Aug 5, 2025 at 2:58 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 05.08.25 03:22, Juan Yescas wrote:
>>> On Mon, Aug 4, 2025 at 11:50 AM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 04.08.25 20:20, Juan Yescas wrote:
>>>>> Hi David/Zi,
>>>>>
>>>>> Is there any reason why the MIGRATE_CMA pages are not in the PCP lists?
>>>>>
>>>>> There are many devices that need fast allocation of MIGRATE_CMA pages,
>>>>> and they have to get them from the buddy allocator, which is a bit
>>>>> slower in comparison to the PCP lists.
>>>>>
>>>>> We also have cases where the MIGRATE_CMA memory requirements are big.
>>>>> For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 500MiBs.
>>>>> These cases would benefit if we have THPs for CMAs.
>>>>>
>>>>> Could we add the support for MIGRATE_CMA pages on the PCP and THP lists?
>>>>
>>>> Remember how CMA memory is used:
>>>>
>>>> The owner allocates it through cma_alloc() and friends, where the CMA
>>>> allocator will try allocating *specific physical memory regions* using
>>>> alloc_contig_range(). It doesn't just go ahead and pick a random CMA
>>>> page from the buddy (or PCP) lists. Doesn't work (just imagine having
>>>> different CMA areas etc).
>>>>
>>>> Anybody else is free to use CMA pages for MOVABLE allocations. So we
>>>> treat them as being MOVABLE on the PCP.
>>>>
>>>> Having a separate CMA PCP list doesn't solve or speedup anything, really.
>>>>
>>>
>>> Thanks David for the quick overview.
>>>
>>>> I still have no clue what this patch here tried to solve: it doesn't
>>>> make any sense.
>>>>
>>>
>>> The story started with this out of tree patch that is part of Android.
>>>
>>> https://lore.kernel.org/lkml/cover.1604282969.git.cgoldswo@codeaurora.org/T/#u
>>>
>>> This patch introduced the __GFP_CMA flag that allocates pages from
>>> MIGRATE_MOVABLE
>>> or MIGRATE_CMA. What it happens then, it is that the MIGRATE_MOVABLE
>>> pages in the
>>> PCP lists were consumed pretty fast. To solve this issue, the PCP
>>> MIGRATE_CMA list was added.
>>> This list is initialized by rmqueue_bulk() when it is empty. That's
>>> how we end up with the PCP MIGRATE_CMA list
>>> in Android. In addition to this, the THP list for MIGRATE_MOVABLE was
>>> allowed to contain
>>> MIGRATE_CMA pages. This is causing THP MIGRATE_CMA pages to be used
>>> for THP MIGRATE_MOVABLE
>>> making later allocations from THP MIGRATE_CMA to fail.
>>
>> Okay, so this patch here really is not suitable for the upstream kernel
>> as is. It's purely targeted at the OOT Android patch.
>>
> Right, it is a temporary solution for the pinned MIGRATE_CMA pages.
> 
>>>
>>> These workarounds are mainly because we need to solve this issue upstream:
>>>
>>> - When devices reserve big blocks of MIGRATE_CMA pages, the
>>> underutilized MIGRATE_CMA
>>> can fall back to MIGRATE_MOVABLE and these pages can be pinned, so if
>>> we require MIGRATE_CMA
>>> pages, the allocations might fail.
>>>
>>> I remember that you presented the problem in LPC. Were you able to
>>> make some progress on that?
>>
>> There is the problem of CMA pages getting allocated by someone for a
>> MOVABLE allocation, to then short-term pin it for DMA. Long-term
>> pinnings are disallowed (we just recently fixed a bug where we
>> accidentally allowed it).
>>
> Nice, it is great the issue got caught and fixed upstream :)
> 
>> One concern is that a steady stream of short-term pinnings can turn such
>> pages unmovable. We discussed ideas on how to handle that, but there is
>> no solution upstream yet.
> 
> Are there any plans to continue the discussion? Is it in the priority
> list?

Ohh, it's somewheeeeeere on the todo list :)

Do you (or one of your colleagues) have capacity to work on that? One 
idea was to flag folios as "pending on migration" and disallow any 
further short-term pins until migration is done. IIRC, there were other 
ideas (e.g., isolated pageblock).

> Maybe
> a topic we can discuss in LPC Japan?

Sounds good, feel free to propose this as a topic. I wills end out the 
announcement of the MM MC probably next week.

-- 
Cheers,

David / dhildenb


