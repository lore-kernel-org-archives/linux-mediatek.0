Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444BDCAC5A7
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX11camkE4Hg4H4xV/n8C7NJAv/AAjeZxxkMV/ADChc=; b=tXRy+/Qehlucs4XAnhYmg1ZdV3
	UlRtzTBLw+qFnqqTdBKYPOe9gQ2RKw29bXWqjbo/7WOnfmygvUR754mDUy7WdkQTqLvJXBIpX2AnQ
	siiL5CPOR4+kP0YZCXphtCWLQzb5I7SXU3NTyI3GwaH7LIk8b6DCspPStjNQr7TBtVTRnCAWqMbI/
	X57UJ25aATNtsRL4YEh7lsUuMB5M6Irh19B/byjEbZlfKiDlT12LuM5yd+H3WyKvVXS1JdOQJVntv
	Fhca8JGEm6WBzrr4XR95LyEjHE7lymXimi/xJxaPUxhuFKXvx9cqNTMR15rh3Cslphp4Pdymv0ZpO
	cNrUPBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LZ4-0000000G0a0-313r;
	Wed, 24 Sep 2025 09:13:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LZ1-0000000G0Yj-3pq5
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 09:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758705205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zX11camkE4Hg4H4xV/n8C7NJAv/AAjeZxxkMV/ADChc=;
	b=Xs2Tag4QD8TmRy931UMYvcPJRGbk8sGSu7ZtPZBVi0UCNrhUCbWC0c33OaNrjKoPMcFOvo
	l6c+o1ipqTJgLWJNoNfE1n1WnAPZNBD+1PwdbKXN5djVxkoBFYhDR0h3b6UBfOY3Xtwip7
	2XyCN9gWcJqBQUnLMGrxDb4nKGam9zE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-fxGXvsFlOSSPQ2osrKKj8A-1; Wed, 24 Sep 2025 05:13:23 -0400
X-MC-Unique: fxGXvsFlOSSPQ2osrKKj8A-1
X-Mimecast-MFC-AGG-ID: fxGXvsFlOSSPQ2osrKKj8A_1758705203
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3ece0fd841cso4273419f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Sep 2025 02:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758705202; x=1759310002;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zX11camkE4Hg4H4xV/n8C7NJAv/AAjeZxxkMV/ADChc=;
        b=k5cLlA2ijWgQajqERG+AgoE5Paff6E7G8CKDFNG6ksqNHJZMIEK4kLwJ6LhZDiLVQm
         Whp4NW2fm1sdEVv97kHn8NYZ0oKL6NSe5ywoW++ml6lggUdXBb9AY6Utjw92viI+UqVN
         eeIpBqzOM9Ql+qD50Xv4DmMO+UAAkRDF4VO6ZDXXJn8sxD/PFomDpdtRLirQlMMNEWiG
         lw5TQRo6AOozso9jQPFW75WMG0RWi0RdQJZwnHsdnLc5iHI0fNj3UspZKsNuoI7u1PkU
         YAjxTQYtHIz5z6MawxYLBrqI1BM5fNNyfrjCZlNHKWTV1QdT8ysOe8ok12n8ITztfJV4
         naSw==
X-Forwarded-Encrypted: i=1; AJvYcCXDDIcaifMUIVRFFp0AuvVrcJ2YnrHr8Cq7z/5yM+4KYP3Bzv8IDUOUbk3+8Bgf+rXM6M6Kg7cA3KquIYlTZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV8/UcFektj3xUGrjuJ0UU9T30ClLMqQQ6h9y3dNKb/xm4OJkd
	F9M+KINRMIqDBF22PUKXh5qnFNkt1XvdiE0wkekPWpq2/CMFGEHTkFBsKtaNUnMIwwxyszySa+O
	eeisNFlVzs8YapZAK7vELAG6KcBjNNbF/hI6hqFjZ1WE4U++Cr01tVzIeZIDlMxmvtCpEe6D1ow
	==
X-Gm-Gg: ASbGnctuZpWJTlqtkNCQpGiESwXWA4S4/pPhrt2U6/yMx/pDrA9GcX2idRqt/lLQp/X
	k4vupKH/WhMhwx4v4GFUPrUjxYlx4I+W2UNc4NBTyclUQfA+lPpig98VcRAhbwiywCgOmoELUoB
	VyMYSR3bogr2uvsVkhrR8i4tB6+5COaQftgOfuQShmbG6nK6ORflb3q0T8OCqxVAnxWvg7/QWFB
	X8b9lrmUGlm0RCzQy4vCoxkJGZw/1XkgqjVpXvaGQyEjdL9eOIUnbiUefVAYo/oq7w7K7KvZ17L
	myUMquQI4U88VzRwzkY4mOdIow41b4wYudzIoMC8MKzQTlIyzgB32fBx2Y9j68LrgoUl4x5ansK
	hQPeREOEi4b+s2CndcR+ZPUVQRQva37JEy3vrKoGxVHFw3g8vY33NerugdNdVi5wq9g==
X-Received: by 2002:a5d:5f83:0:b0:405:3028:1bf0 with SMTP id ffacd0b85a97d-405c3e2784emr5360082f8f.10.1758705202439;
        Wed, 24 Sep 2025 02:13:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBZFEPN12p6SWA1LtLwcoBT+0w/wHU0RQBUXQwTIxfVpyQEni4vEmdES/G/ydEaBnhiqp96A==
X-Received: by 2002:a5d:5f83:0:b0:405:3028:1bf0 with SMTP id ffacd0b85a97d-405c3e2784emr5360028f8f.10.1758705201838;
        Wed, 24 Sep 2025 02:13:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f14:2400:afc:9797:137c:a25b? (p200300d82f1424000afc9797137ca25b.dip0.t-ipconnect.de. [2003:d8:2f14:2400:afc:9797:137c:a25b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee15bfab67sm23593007f8f.43.2025.09.24.02.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 02:13:21 -0700 (PDT)
Message-ID: <17dabd83-0849-44c9-b4a2-196af60d9676@redhat.com>
Date: Wed, 24 Sep 2025 11:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
To: Catalin Marinas <catalin.marinas@arm.com>,
 Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 usamaarif642@gmail.com, yuzhao@google.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, baohua@kernel.org, voidice@gmail.com,
 Liam.Howlett@oracle.com, cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
 kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
 roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
 dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
 surenb@google.com, hughd@google.com, willy@infradead.org,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, qun-wei.lin@mediatek.com, Andrew.Yang@mediatek.com,
 casper.li@mediatek.com, chinwen.chang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mm@kvack.org, ioworker0@gmail.com,
 stable@vger.kernel.org
References: <20250922021458.68123-1-lance.yang@linux.dev>
 <aNGGUXLCn_bWlne5@arm.com> <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
 <aNKJ5glToE4hMhWA@arm.com> <aNLHexcNI53HQ46A@arm.com>
 <f2fe9c01-2a8d-4de9-abd5-dbb86d15a37b@linux.dev> <aNOwuKmbAaMaEMb7@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aNOwuKmbAaMaEMb7@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HZIwTYXAiAWKR-11bn0HMTHolgc34vH8CBKshKOIWP0_1758705203
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_021328_039764_A4EFC616 
X-CRM114-Status: GOOD (  17.02  )
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

On 24.09.25 10:50, Catalin Marinas wrote:
> On Wed, Sep 24, 2025 at 10:49:27AM +0800, Lance Yang wrote:
>> On 2025/9/24 00:14, Catalin Marinas wrote:
>>> So alternative patch that also fixes the deferred struct page init (on
>>> the assumptions that the zero page is always mapped as pte_special():
>>
>> I can confirm that this alternative patch also works correctly; my tests
>> for MTE all pass ;)
> 
> Thanks Lance for testing. I'll post one of the variants today.
> 
>> This looks like a better fix since it solves the boot hang issue too.
> 
> In principle, yes, until I tracked down why I changed it in the first
> place - 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to
> the zero page"). ptrace() can read tags from PROT_MTE mappings and we
> want to allow reading zeroes as well if the page points to the zero
> page. Not flagging the page as PG_mte_tagged caused issues.
> 
> I can change the logic in the ptrace() code, I just need to figure out
> what happens to the huge zero page. Ideally we should treat both in the
> same way but, AFAICT, we don't use pmd_mkspecial() on the huge zero
> page, so it gets flagged with PG_mte_tagged.

I changed that recently :) The huge zero folio will now always have 
pmd_special() set.

-- 
Cheers

David / dhildenb


