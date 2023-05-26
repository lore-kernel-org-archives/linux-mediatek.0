Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80658C77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAbN/2lmj85EfJ5ZXB9Lxx6BdfoaVulpG4pANfEifWY=; b=tC4cAMThapSjsucXEhytwruOxY
	IkL97liJJ5AZFgYq9hJCzuSjPQBfudDFWeXehrPnc9m+xXBxstsD1KGasDbPdYzjWCRLzakba1/0G
	B23PPxvJOJOH8wa7lOJialZiLCkK4JuH3Mv1eTZn5WDDCkGtRPyd/Gp1pFKAltKm4bUdZua6jIYso
	dvlTws0nCtJIr9Y1qOWtlOfQDcCjVpZnVWyJXD28yTNp3vrVSjTonA8bXYBlsCcbHF+xNK9h7iyKs
	oA7QTF7+wfDaKoX/wP7KE+CeOj2JUGBVvt/R1b3YoaEOYjKFplRTzfSpU9JEoyLqXsw6KC6qsmSqj
	iHe7V6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Y60-002k8k-2N;
	Fri, 26 May 2023 14:07:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Y5x-002k6p-1h
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 14:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685110023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAbN/2lmj85EfJ5ZXB9Lxx6BdfoaVulpG4pANfEifWY=;
	b=GOGuIzFgP7RhYIWFiC1ifWirqhrHvY7S/OVaDzqJ7Eb9rhmgG3zXxSn1wbbRnO0iGefq2J
	LfqfvtQzCJoqNyiXvTrMYR3LqZ7JOHuZjoFI4drZXS6knPndPxsGM3C8Kr+6nsTulZQx8r
	HTB9pOi3EeWFd8x5EuSUaghPOYWjAZc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-4rql5ZLuPb-rDJ9B2fCNtg-1; Fri, 26 May 2023 10:06:59 -0400
X-MC-Unique: 4rql5ZLuPb-rDJ9B2fCNtg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4f3a7765189so421890e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 07:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685110018; x=1687702018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAbN/2lmj85EfJ5ZXB9Lxx6BdfoaVulpG4pANfEifWY=;
        b=L3g5dZmeK6EEb30n3wlFcQoHcLJuLCqoahVx9HR1+R/0RuzGBGaamRaKgkWgHn6pr+
         jXnOCsrjuXh8B5hYkdhSE8zynVkTihz5YlwkRg1GSOE5Md1xY08swpcQMIRC9Ru1zewM
         1nkmpfPxKVbkfbRbEBG+V4tW/QU1L+jGgfYWE5wX5C6HJdhBAB+VPos1jajlHokKIpkI
         MvsgtVh6dxZ+oShH+6C+Jx3kCbLsZtWxfUgFMaSc3kt1dh19nlCX2q7YWdayBRKMmDhE
         e8ceoqpryMrtsnD76vs4hiOj4JgFdiJpmPpN0Ku2Y/72im/PdzZBAB5YiYmGkoONwB9g
         j2tg==
X-Gm-Message-State: AC+VfDziR/78F1aaztnyyJ6lAe595l9RqjQdMxGImd/QhT/cRJ1l1idF
	sJbutoadn/DStdy18f0AEO6mvAb9w8EskYPqu/2y64NOb4bAWnm1ryezT4Iw/yDBJbgJgNRMg2C
	hDWws8rcdlkKOA6DsWUvPpETZxS8+kC0=
X-Received: by 2002:ac2:59cf:0:b0:4ed:d2cf:857b with SMTP id x15-20020ac259cf000000b004edd2cf857bmr543154lfn.5.1685110017971;
        Fri, 26 May 2023 07:06:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7er+LeGsxnFDYQXWSIbLqlc4+5J32U68qYkTck/GPaTlh3YQQH7LynqG86HW/G1yXwV5CNog==
X-Received: by 2002:ac2:59cf:0:b0:4ed:d2cf:857b with SMTP id x15-20020ac259cf000000b004edd2cf857bmr543126lfn.5.1685110017600;
        Fri, 26 May 2023 07:06:57 -0700 (PDT)
Received: from [192.168.1.121] (85-23-48-202.bb.dnainternet.fi. [85.23.48.202])
        by smtp.gmail.com with ESMTPSA id j22-20020ac253b6000000b004f3aee3aae2sm639896lfh.140.2023.05.26.07.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 07:06:56 -0700 (PDT)
Message-ID: <5dd62fee-56bf-0b54-2e91-c31068a2b040@redhat.com>
Date: Fri, 26 May 2023 17:06:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 04/12] mm: Make the page_frag_cache allocator use
 multipage folios
To: David Howells <dhowells@redhat.com>, Yunsheng Lin
 <linyunsheng@huawei.com>, Matthew Wilcox <willy@infradead.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 David Ahern <dsahern@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Jeroen de Borst <jeroendb@google.com>, Catherine Sullivan
 <csully@google.com>, Shailend Chand <shailend@google.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <a819dd80-54cc-695f-f142-e3d42ce815a7@huawei.com>
 <20230524153311.3625329-1-dhowells@redhat.com>
 <20230524153311.3625329-5-dhowells@redhat.com>
 <739166.1685105220@warthog.procyon.org.uk>
From: =?UTF-8?Q?Mika_Penttil=c3=a4?= <mpenttil@redhat.com>
In-Reply-To: <739166.1685105220@warthog.procyon.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_070705_642132_9B76609A 
X-CRM114-Status: GOOD (  33.07  )
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

Hi,

On 26.5.2023 15.47, David Howells wrote:
> Yunsheng Lin <linyunsheng@huawei.com> wrote:
> 
>>> Change the page_frag_cache allocator to use multipage folios rather than
>>> groups of pages.  This reduces page_frag_free to just a folio_put() or
>>> put_page().
>>
>> put_page() is not used in this patch, perhaps remove it to avoid
>> the confusion?
> 
> Will do if I need to respin the patches.
> 
>> Also, Is there any significant difference between __free_pages()
>> and folio_put()? IOW, what does the 'reduces' part means here?
> 
> I meant that the folio code handles page compounding for us and we don't need
> to work out how big the page is for ourselves.
> 
> If you look at __free_pages(), you can see a PageHead() call.  folio_put()
> doesn't need that.
> 
>> I followed some disscusion about folio before, but have not really
>> understood about real difference between 'multipage folios' and
>> 'groups of pages' yet. Is folio mostly used to avoid the confusion
>> about whether a page is 'headpage of compound page', 'base page' or
>> 'tailpage of compound page'? Or is there any abvious benefit about
>> folio that I missed?
> 
> There is a benefit: a folio pointer always points to the head page and so we
> never need to do "is this compound? where's the head?" logic to find it.  When
> going from a page pointer, we still have to find the head.
> 


But page_frag_free() uses folio_put(virt_to_folio(addr)) and 
virt_to_folio() depends on the compound infrastructure to get the head 
page and folio.


> Ultimately, the aim is to reduce struct page to a typed pointer to massively
> reduce the amount of space consumed by mem_map[].  A page struct will then
> point at a folio or a slab struct or one of a number of different types.  But
> to get to that point, we have to stop a whole lot of things from using page
> structs, but rather use some other type, such as folio.
> 
> Eventually, there won't be a need for head pages and tail pages per se - just
> memory objects of different sizes.
> 
>>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>>> index 306a3d1a0fa6..d7c52a5979cc 100644
>>> --- a/include/linux/mm_types.h
>>> +++ b/include/linux/mm_types.h
>>> @@ -420,18 +420,13 @@ static inline void *folio_get_private(struct folio *folio)
>>>   }
>>>   
>>>   struct page_frag_cache {
>>> -	void * va;
>>> -#if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
>>> -	__u16 offset;
>>> -	__u16 size;
>>> -#else
>>> -	__u32 offset;
>>> -#endif
>>> +	struct folio	*folio;
>>> +	unsigned int	offset;
>>>   	/* we maintain a pagecount bias, so that we dont dirty cache line
>>>   	 * containing page->_refcount every time we allocate a fragment.
>>>   	 */
>>> -	unsigned int		pagecnt_bias;
>>> -	bool pfmemalloc;
>>> +	unsigned int	pagecnt_bias;
>>> +	bool		pfmemalloc;
>>>   };
>>
>> It seems 'va' and 'size' field is used to avoid touching 'stuct page' to
>> avoid possible cache bouncing when there is more frag can be allocated
>> from the page while other frags is freed at the same time before this patch?
> 
> Hmmm... fair point, though va is calculated from the page pointer on most
> arches without the need to dereference struct page (only arc, m68k and sparc
> define WANT_PAGE_VIRTUAL).
> 
> David
> 

--Mika


