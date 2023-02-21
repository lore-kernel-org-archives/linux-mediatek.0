Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487D0C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQngTxIAa7bq5F++Qt1+J5qF8M9CFcFTXwihCMqwxiU=; b=E/AgtuPZuRm1FxOAFD6HxiMGXK
	TtrizBbjAXgCcGWkf757Nz/fgRc9KRqpYHfche1pZATH5rBbZG8PAwUFxtLnwupWyEJ4+gu8M19Jt
	BMK/9+kwt58wv7Ladf59vq8yzv4D2jWgHqAPARmOgM8kugZz/fGcc1AYcV+VSP/1fZd6POnzMdpx/
	cXw/qkcSYcN4cK3QMXpK1EyFcItPLveURgkqE8WAHvC4uMh78CiSa9ZFwVc1Mpi0lWZwZPvby6p0y
	laJ82ano8QWD/O9szam2YEXQzgeaivi1shp2rIxmVaCsDG1dUVpBl2c3L5XHAh6nprfsYNcNuAgBj
	3pHalpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUPZn-007KxQ-Se; Tue, 21 Feb 2023 10:08:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUPZj-007Kux-DY
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 10:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676974122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQngTxIAa7bq5F++Qt1+J5qF8M9CFcFTXwihCMqwxiU=;
	b=LXYefHCvgn3T8u3hrl1REa7QUrtDqiQN2MhHNZEmr5+d09NFedHeB4dxMuHYax3B2t15tA
	FjFGWRIrdGJfBoov4P8YzRtcuPtrHVdKuStcmh1ys/uWi6N0HRVdpJmdYdz/mfGPJNN+6x
	unOX0OwkZ8+AjeIQrx4r5VmTL1N0J+0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-WNdR1BD-NJCQpNGcJtUxQw-1; Tue, 21 Feb 2023 05:08:41 -0500
X-MC-Unique: WNdR1BD-NJCQpNGcJtUxQw-1
Received: by mail-wr1-f72.google.com with SMTP id g6-20020adfa486000000b002c55ef1ec94so680080wrb.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 02:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQngTxIAa7bq5F++Qt1+J5qF8M9CFcFTXwihCMqwxiU=;
        b=UN3htsIRXMNC+RJ9GaYbM3S8OTxSuR45HqvVgLqqTjygoUjGQKtteCiH/lHQSbe+mx
         59pgAPMR1VCjCsXPE5Xwae+I1RuB1SOnHjh3eNk/Yjbl7ksd9TDK4VhR4EBB2bj82Oaw
         2aEjfGQtnl6O5VM8HHd6MNSpt1QScgIMeUu8lQStO3tbJ8nKksnIcxz7Ic1U8Q8bjU+M
         TYa2UtcYRxdLp+hXuWPuAvgW+coraktutCdHK6d2Tyih21tAKCwZyCPAI/m8bLVneFdi
         ku5o7POxyx9FOfauLYlNLWmUqfZy9mFCSg+WVjm/rsZ3wrE4lm2n1u1VbGEihW2udmYh
         Cn+A==
X-Gm-Message-State: AO0yUKWEEekS7GkV/6FDNT3LxynVb9phiSsXOEgh6dEwlF4FFkn+fZj3
	z3j6EgMA4ASmPfUp+EtW1Jw6V40g7OeKTK/uJYD6JQW2cUW7KL/3DGBD3IwBLnBeqdDyOonu//c
	LHRF0ya5Cu6g3S5725qYT68bpMTXo/b1L
X-Received: by 2002:adf:fbc8:0:b0:2c5:5ff8:93e5 with SMTP id d8-20020adffbc8000000b002c55ff893e5mr3060441wrs.44.1676974120108;
        Tue, 21 Feb 2023 02:08:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+yvZn9hxlDINT7LN34Sejar7rKnrWklRGP11gcX16WuW5/FXenaqtVUV1kKpqHEv+TURtHBg==
X-Received: by 2002:adf:fbc8:0:b0:2c5:5ff8:93e5 with SMTP id d8-20020adffbc8000000b002c55ff893e5mr3060418wrs.44.1676974119708;
        Tue, 21 Feb 2023 02:08:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:4800:aecc:dadb:40a8:ce81? (p200300cbc7074800aeccdadb40a8ce81.dip0.t-ipconnect.de. [2003:cb:c707:4800:aecc:dadb:40a8:ce81])
        by smtp.gmail.com with ESMTPSA id f21-20020a7bcc15000000b003dfdeb57027sm3086701wmh.38.2023.02.21.02.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:08:39 -0800 (PST)
Message-ID: <1b3e8e88-ed5c-7302-553f-4ddb3400d466@redhat.com>
Date: Tue, 21 Feb 2023 11:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: Andrew Yang <andrew.yang@mediatek.com>, SeongJae Park <sj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, casper.lin@mediatek.com,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230221090313.15396-1-andrew.yang@mediatek.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] mm/damon/paddr: fix pin page problem
In-Reply-To: <20230221090313.15396-1-andrew.yang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_020843_596294_8BC61EC1 
X-CRM114-Status: GOOD (  21.09  )
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

On 21.02.23 10:03, Andrew Yang wrote:
> From: "andrew.yang" <andrew.yang@mediatek.com>

Nit: I'd suggest a different subject

"mm/damon/paddr: fix missing put_page()"


Fixes: ?
Cc: stable ?


I think a patch from Willy is queued that converts this code into folios.

> 
> damon_get_page() would always increase page _refcount and
> isolate_lru_page() would increase page _refcount if the page's lru
> flag is set.
> 
> If a unevictable page isolated successfully, there will be two more
> _refcount. The one from isolate_lru_page() will be decreased in
> putback_lru_page(), but the other one from damon_get_page() will be
> left behind. This causes a pin page.
> 
> Whatever the case, the _refcount from damon_get_page() should be
> decreased.
> 
> Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
> ---
>   mm/damon/paddr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
> index e1a4315c4be6..56d8abd08fb1 100644
> --- a/mm/damon/paddr.c
> +++ b/mm/damon/paddr.c
> @@ -223,8 +223,8 @@ static unsigned long damon_pa_pageout(struct damon_region *r)
>   			putback_lru_page(page);
>   		} else {
>   			list_add(&page->lru, &page_list);
> -			put_page(page);
>   		}
> +		put_page(page);
>   	}
>   	applied = reclaim_pages(&page_list);
>   	cond_resched();

-- 
Thanks,

David / dhildenb


