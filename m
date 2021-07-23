Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48C4C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 12:54:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940B560E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 12:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 940B560E95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nomP0TJR3WdCtmxGwpa37Ba881/0gYyrtOcCvJskZxg=; b=obT5TCnC/FZYXqusp+upzHEp4U
	e9CdCrZZ1Wv9XtpyruGlf8pwKt2g5uTUMS0X7zbSt8qCTSMsX+W/kCR4EVoiZjCRIP/Vk5uNYGoOW
	vv0VnHArDQOkl2pl5N5EV2Ebf5T6ACWbLNwI0sqPcVwafvQyQRUZCCgle99pSMGs1UAN2hFzmI4f+
	A8qslnVSi9m04MM9L774m7DwaAI6NdERLwzTQVeEyjpejpNjjIFjAe57+iygRSX9svD+hq/1/lkRV
	C7eFG2QFTjh05cm9M70xXiEoixaRFJT+AKXBmNtyOTySVXB1I9kWjlsfVOm4t6ZFFkyluh8j0N7WW
	/4CkBAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6uhM-004j4e-4W; Fri, 23 Jul 2021 12:54:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6uhG-004j1c-Kk
 for linux-mediatek@lists.infradead.org; Fri, 23 Jul 2021 12:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627044873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtohglzzzr374jKgrWszd7PUWfTWiFAWrR6LAClff6I=;
 b=COLzZ0zgJ1hJnZDjGVnplWERNgR44x4pPVEkHAaSYdFMXEhIaM/FYkm1byI/K0cCBl/Ctq
 1/UouZOfKtnGdgg8KHurgefYeAl/FOqZHrSTt9L4aEE5Hsgo+1YY+i+sEgdtOfjFJYg2v1
 trXSgWJI3ibevYW5Z8FDzjYlogGG+l4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-9htkJR0sN6yfZrtX5M-9gg-1; Fri, 23 Jul 2021 08:54:31 -0400
X-MC-Unique: 9htkJR0sN6yfZrtX5M-9gg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d18-20020adfe8520000b02901524df25ad7so965974wrn.8
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Jul 2021 05:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rtohglzzzr374jKgrWszd7PUWfTWiFAWrR6LAClff6I=;
 b=KuVAu5Ckd0w6plXtvNzHeFQZfasZYlKir6F5kuosv3hsYhDabodiQ0h19KMjuiFIHs
 JZjGODAb7HLQnr9AQjFi7yokbBVS5x5dLYVCIvdQ4o2pn2/FAyb2od06Eh+qj35g3M3x
 995xQ8u/asRBeFMDc7dMnc69xVj8V35BBjPdygo+AT4jAfKGSV+tIACAeuvx4XwjK9vL
 dkhTyfxf983iO3IPeX65uiGYWxLR+w/3aeJ/0LIS6R10rL5TpshO2ncCk9K7lFnH5C0c
 ak13BGs5XIB82SROqJ1ANuu7DgbwPY9EtrIV0DbFozL9jG1oT6LHYQJPTWITjIN0SHZU
 k4Lg==
X-Gm-Message-State: AOAM533uRA489CpdN7rK/2sjr/Wy3z5GoylpZBrCphFW26f+82OvUxy5
 eTXmUxgh3DCf8DcL8YxFsM9OEFhp51f0+tHmuMNQ8Gfh4V4nvFsZ9z8c+2UNCHDSGCFpyftOXiN
 Ur1pqg8+oxYGAwlEjYoIH1dAnOXg9oB7G
X-Received: by 2002:a5d:488a:: with SMTP id g10mr5048115wrq.327.1627044870619; 
 Fri, 23 Jul 2021 05:54:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEeQq9U7yP+rUIm4ZAIm04oUgSz6vh76SLYdZHF2hmw1P2cAukKj/ZsHWRhwgjoSiWwSxylA==
X-Received: by 2002:a5d:488a:: with SMTP id g10mr5048100wrq.327.1627044870401; 
 Fri, 23 Jul 2021 05:54:30 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id g3sm32896895wru.95.2021.07.23.05.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 05:54:30 -0700 (PDT)
Subject: Re: [PATCH v3] mm/sparse: clarify pgdat_to_phys
To: Miles Chen <miles.chen@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
References: <20210723123342.26406-1-miles.chen@mediatek.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <571dcb1d-1f3a-0633-17e1-1ca9856bee5e@redhat.com>
Date: Fri, 23 Jul 2021 14:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723123342.26406-1-miles.chen@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_055434_807093_5BDE6A92 
X-CRM114-Status: GOOD (  22.11  )
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

On 23.07.21 14:33, Miles Chen wrote:
> Clarify pgdat_to_phys() by testing if
> pgdat == &contig_page_data when CONFIG_NUMA=n.
> 
> We only expect contig_page_data in such case, so we
> use &contig_page_data directly instead of pgdat.
> 
> No functional change intended when CONFIG_BUG_VM=n.
> 
> Comment from Mark [1]:
> "
> ... and I reckon it'd be clearer and more robust to define
> pgdat_to_phys() in the same ifdefs as contig_page_data so
> that these, stay in-sync. e.g. have:
> 
> | #ifdef CONFIG_NUMA
> | #define pgdat_to_phys(x)	virt_to_phys(x)
> | #else /* CONFIG_NUMA */
> |
> | extern struct pglist_data contig_page_data;
> | ...
> | #define pgdat_to_phys(x)	__pa_symbol(&contig_page_data)
> |
> | #endif /* CONIFIG_NUMA */
> "
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20210615131902.GB47121@C02TD0UTHF1T.local/
> 
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> 
> --
> 
> Change since v1:
> Thanks for Mike's comment, check if pgdat == &contig_page_data,
> so it is clearer that we only expect contig_page_data when
> CONFIG_NUMA=n.
> 
> Change since v2:
> use VM_BUG_ON() to avoid runtime checking when CONFIG_BUG_VM=n
> ---
>   mm/sparse.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 6326cdf36c4f..d13d831f88a5 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -348,7 +348,8 @@ size_t mem_section_usage_size(void)
>   static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
>   {
>   #ifndef CONFIG_NUMA
> -	return __pa_symbol(pgdat);
> +	VM_BUG_ON(pgdat != &contig_page_data);
> +	return __pa_symbol(&contig_page_data);
>   #else
>   	return __pa(pgdat);
>   #endif
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
