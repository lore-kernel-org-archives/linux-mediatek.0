Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34541CAC5AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 16:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1QkzrTGCwMnovMp2G8JNLttd8EAbqBA5tlzUuHhOxE=; b=xEv3D/cVVnDvL7rVczU5SvvG67
	fOhehZ9Z79SUKPljd6S76U+WtR3qq5hubMAEfM4GjbAUez/DFod4HcIDObSGg538LLJeH7KKShZSx
	147GCt5gVZaDFxTZRgENf9enOyeUPlprgTBgF4NmLxSjcktJxu4+LNYUtPg8ZI0bFnFngbd4MnlXH
	urGyMmUGunuVIHxzBvcqmyleuG/EVJIWcNaTi/dFC2NmCr5rFvmyb2duWKXtPyln39nP+qoMTnvbm
	AT/cg3jWMtRN10cE7gjU0Vi48ez15Xv0/kE9F7cZQzNhPFDTvJ0Vf/AAp1jCsPEOIsIu30fS5JcO7
	BCn5VPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v163v-0000000EIM7-0eKD;
	Tue, 23 Sep 2025 16:40:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v163r-0000000EIL3-3z9R
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 16:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758645615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L1QkzrTGCwMnovMp2G8JNLttd8EAbqBA5tlzUuHhOxE=;
	b=ezK7popsJ7QgMq3FZPlcHKIY1sML2qu7zTdCPi0xvHj5n2aqJbSBfv61dXVyypJxUJmjZd
	86YPuluLyDQ7gto+o+Q5bRoi4H1toj9rZb3I5cAFrSl6lBRiQuHI6gYoZdadr7LTGVYSSk
	Lmoy7k8hEY+zF9sU9gmLjCM7zxYEExA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-dvgc9JpeMAKs9thAbU_fhg-1; Tue, 23 Sep 2025 12:40:11 -0400
X-MC-Unique: dvgc9JpeMAKs9thAbU_fhg-1
X-Mimecast-MFC-AGG-ID: dvgc9JpeMAKs9thAbU_fhg_1758645610
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3f44000639fso2906774f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 09:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758645610; x=1759250410;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1QkzrTGCwMnovMp2G8JNLttd8EAbqBA5tlzUuHhOxE=;
        b=Pup3jJaQsP6X2X6lDr+1FlgAu2zPfvqUwqn4LvkThfLQai79xR1WxYzmDFkQcRIe6q
         83QKZkXe26ouXsB0NXn7HJFCU0lxNG4UhU5KelYkuneX12RVjQa0jKucvpLvkZ4fcRLi
         7L1jF9trKOGTLg2rst9HHsCHm9mK2hB0uYNAIVXfeNO9Aov4rqqDSG0STxS0VnrP2Cwk
         GCtBGDY3dS094J2I+h//lqQNt9YNHE+js4A6djypgbI6wioeFccsIm8VnMc/DRkzv2QJ
         pt2mSkixUNLGCyLaF1y6L4m7HtZXJTBaSZtmKYVPFW/NcRhVbXkyJ0ceExThF+gBFiI2
         5MAA==
X-Forwarded-Encrypted: i=1; AJvYcCVVXv2aBJmH5zm+RvgruTknJ845W4rWPDnP3IT9W6IBgkyeFcZ3iQxvV3p7Vy2txBafHMUOlz7xqQReDUwgzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzobknixoB18jMMwcoZsNob3zcKx+4TF8dMcfmmUFpmOnCyv4jC
	bArPBRwNZ4IGaP0iBC7uEBC1ouToW84xi9JTZIdTT04IoNryNUcILWaLL/fOWO5l+NMbYlN2o7t
	qxSUHhw9GZSQ0rP6N53n3O1dEWBSzCaGTMGkLOQoHUpqlARHULCmHN0v59KcMtrr0mpV5MUKq1Q
	==
X-Gm-Gg: ASbGncuznhND86SkEv/l3EE17eSV8j74LpNSwAGcfCniWL/PRH2Ix3xD5liWPSK1D6I
	iNbFxJpQa4fwOzbXOF6UNRaozeyetQD5zu+/FwNzTKCugYAw1RuqbgufyZEh7SETSgLNiEMYGbJ
	A2VGiyJktZOZ2AMmof2FLhr+rV0OYdLurQuZAgSRUk6SgnMACM+/1M83N+i0s0JKfqVg3s9i4t5
	jRpn4Q7LZsVNcOOiZ9cVYUa6XyMJhvzu6jnpsY+x72Tv6FVMRYTiEx3j8n6Tg7pnSONTqHbGadQ
	RmxrmFTz8D9Wgs/6LQlU2ej7FC3u8NQZvl0Orj8XPXf5Ve3ZEU+GKp9Y4BokuwWNSkD/BBhGIv9
	S8Jzrh8d0i812MYrEu+1/IKuSN1xbuadj/8EcsJUJDK9NGcYlqnqS5lXgrLozNLzQLg==
X-Received: by 2002:a05:6000:607:b0:3e3:e7a0:1fec with SMTP id ffacd0b85a97d-405c6c1be66mr2624133f8f.16.1758645610496;
        Tue, 23 Sep 2025 09:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlBeAzcC62U49+wQ4+N2FLeq7Mpxq7qWokF6XhNbNHyY0QVTf/R3ihiA3HW6AmAgoSQoynKg==
X-Received: by 2002:a05:6000:607:b0:3e3:e7a0:1fec with SMTP id ffacd0b85a97d-405c6c1be66mr2624093f8f.16.1758645609976;
        Tue, 23 Sep 2025 09:40:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4f:700:c9db:579f:8b2b:717c? (p200300d82f4f0700c9db579f8b2b717c.dip0.t-ipconnect.de. [2003:d8:2f4f:700:c9db:579f:8b2b:717c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3fcb01a9049sm9757269f8f.61.2025.09.23.09.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 09:40:09 -0700 (PDT)
Message-ID: <45a7aa69-16df-4809-8ccd-c08c404d55cb@redhat.com>
Date: Tue, 23 Sep 2025 18:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, usamaarif642@gmail.com, yuzhao@google.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, baohua@kernel.org,
 voidice@gmail.com, Liam.Howlett@oracle.com, cerasuolodomenico@gmail.com,
 hannes@cmpxchg.org, kaleshsingh@google.com, npache@redhat.com,
 riel@surriel.com, roman.gushchin@linux.dev, rppt@kernel.org,
 ryan.roberts@arm.com, dev.jain@arm.com, ryncsn@gmail.com,
 shakeel.butt@linux.dev, surenb@google.com, hughd@google.com,
 willy@infradead.org, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
 ying.huang@linux.alibaba.com, apopple@nvidia.com, qun-wei.lin@mediatek.com,
 Andrew.Yang@mediatek.com, casper.li@mediatek.com,
 chinwen.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mm@kvack.org, ioworker0@gmail.com, stable@vger.kernel.org
References: <20250922021458.68123-1-lance.yang@linux.dev>
 <aNGGUXLCn_bWlne5@arm.com> <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
 <aNKJ5glToE4hMhWA@arm.com> <aNLHexcNI53HQ46A@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aNLHexcNI53HQ46A@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NrbCkZCf1ROkmRZE6K0H6AW4p2WkIS5VIzIhTjRXzLo_1758645610
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_094016_062072_07570D29 
X-CRM114-Status: GOOD (  22.21  )
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

On 23.09.25 18:14, Catalin Marinas wrote:
> On Tue, Sep 23, 2025 at 12:52:06PM +0100, Catalin Marinas wrote:
>> I just realised that on arm64 with MTE we won't get any merging with the
>> zero page even if the user page isn't mapped with PROT_MTE. In
>> cpu_enable_mte() we zero the tags in the zero page and set
>> PG_mte_tagged. The reason is that we want to use the zero page with
>> PROT_MTE mappings (until tag setting causes CoW). Hmm, the arm64
>> memcmp_pages() messed up KSM merging with the zero page even before this
>> patch.
> [...]
>> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
>> index e5e773844889..72a1dfc54659 100644
>> --- a/arch/arm64/kernel/mte.c
>> +++ b/arch/arm64/kernel/mte.c
>> @@ -73,6 +73,8 @@ int memcmp_pages(struct page *page1, struct page *page2)
>>   {
>>   	char *addr1, *addr2;
>>   	int ret;
>> +	bool page1_tagged = page_mte_tagged(page1) && !is_zero_page(page1);
>> +	bool page2_tagged = page_mte_tagged(page2) && !is_zero_page(page2);
>>   
>>   	addr1 = page_address(page1);
>>   	addr2 = page_address(page2);
>> @@ -83,11 +85,10 @@ int memcmp_pages(struct page *page1, struct page *page2)
>>   
>>   	/*
>>   	 * If the page content is identical but at least one of the pages is
>> -	 * tagged, return non-zero to avoid KSM merging. If only one of the
>> -	 * pages is tagged, __set_ptes() may zero or change the tags of the
>> -	 * other page via mte_sync_tags().
>> +	 * tagged, return non-zero to avoid KSM merging. Ignore the zero page
>> +	 * since it is always tagged with the tags cleared.
>>   	 */
>> -	if (page_mte_tagged(page1) || page_mte_tagged(page2))
>> +	if (page1_tagged || page2_tagged)
>>   		return addr1 != addr2;
>>   
>>   	return ret;
> 
> Unrelated to this discussion, I got an internal report that Linux hangs
> during boot with CONFIG_DEFERRED_STRUCT_PAGE_INIT because
> try_page_mte_tagging() locks up on uninitialised page flags.
> 
> Since we (always?) map the zero page as pte_special(), set_pte_at()

Yes. (if pte_special is implemented by the arch of course)

> won't check if the tags have to be initialised, so we can skip the
> PG_mte_tagged altogether. We actually had this code for some time until
> we introduced the pte_special() check in set_pte_at().
> 
> So alternative patch that also fixes the deferred struct page init (on
> the assumptions that the zero page is always mapped as pte_special():
> 

LGTM!

-- 
Cheers

David / dhildenb


