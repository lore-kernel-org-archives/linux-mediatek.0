Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B710CAC5AC
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 07:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzHIUQbJNzpGAehghm14zuXxtLTVpwy94eSLphrZ324=; b=maoD6Iby5MHZMSjAoHYYAuWyT4
	CXc1/AU6n7GFev7FYMVGxezxVLIfzlzfPTuBSgAyITJ0J2M/GbRHwsfKBCOoacg3ZEOkgC/Ihfr3J
	/wJ85GRxMlLiM/PMy2OTgNGX/OH1BRWbLSe/5zFo5npblYAROAY9nw1vA56yx9s+Ed6cuuYKjupR4
	RSN0KoHbHeON8cR6e+RMSwP7Va0s1OxziWnIIe11lj4DWkVWhPK9vDdXWBtSNIfcIRH2nSMWoDtEQ
	B8bKEyFKKJjVwSZHK2eRRezRTL/SOZ1OUQrFlJG94cpjUP7oMY3M+NKBWv7JipTew10VmPXsaw/TP
	6XikcyIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bBD-00000009RKs-0i4n;
	Mon, 22 Sep 2025 07:41:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bBA-00000009RGB-2931
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 07:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758526901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fzHIUQbJNzpGAehghm14zuXxtLTVpwy94eSLphrZ324=;
	b=U3uSviETBw9QvzfoBI0ae571TW/RjiTeHaxS03i3UM2nwDFurXdtw2vOaRgtuHwE3mmSGK
	d1KvQx8ZgJBV2Q/NwUNli64Ul1D67NE2tibP9DFs32VDKL41rblAT05FCfbNx19zVOKlFR
	GaeTeP111etg1U7qsn9/1WJANx5pYRM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-gSil3VBxPlO-tSpT-9jORA-1; Mon, 22 Sep 2025 03:41:39 -0400
X-MC-Unique: gSil3VBxPlO-tSpT-9jORA-1
X-Mimecast-MFC-AGG-ID: gSil3VBxPlO-tSpT-9jORA_1758526898
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ecdd61b798so2153830f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Sep 2025 00:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758526898; x=1759131698;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzHIUQbJNzpGAehghm14zuXxtLTVpwy94eSLphrZ324=;
        b=v6LeZEFk1vd5kiH/7FGoUJuc+o9nfi6N/H3cP+0JtNkHUv7wIrD7jOzYY3V99kyuqI
         Ew+aAl+uY03q6bxCnT9FS3bG/x9xn4wa2wkJXmo0jXeUWc4je3O5+i6RUH0IW4j8mr94
         nSQum5PrU6nPrEz3LdhlQjKdS9Fj5LW+S2Eth+2e6mq4MnrURUwS6EZV9EerH4KWZM1j
         Vxfx1cPB5fZJXAjjf6VrhPm983ehfW7INeX0hgZAzFfjaBNM0IIsEvTqn/7UY2aJdhJC
         zkq6bGxc6AQ8jvXe0nKj62rf3uZgb1zVyUbPUOUXS6eXbVcUpnh4FuuryVKvdB5shve2
         O1ng==
X-Forwarded-Encrypted: i=1; AJvYcCVy0wjk44X9tq1BWlMtv9D928IOEmdnxdyIW2JIhzSaIDnyVb2xSKilMvWrs7mnhOgJmosL9dkg+beq2HUd+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS+D5LWdSHnbBLAwZ75MqSGVNPtEyTn6gKTXeNlvrXA0rMtm/l
	GDhf4RoeWYvzVjXVTBylgKWkNiz2hyPyXc8UV7EjhoetPxo+BY6kSquUxOM/zaqd9K8SrAZ94tV
	Y71pZ5OovsZmDEbhO9s0XdLiyZy4FbIV4T2kxK/OSRLtwkRS+iFOvtrjaCy0sLy7cYFSpOOH/bg
	==
X-Gm-Gg: ASbGnctjtc0EFf2RX3mNHebV0xG/hAtrzXtnFqy8TwDpzYz8hJYuwDG3+4n8MI8TIdW
	J8nx13skOer88fY4jUmulnorTx6oDSuKE3wMxUaOXhKSWc/K5M9Mgw2QtsiuVtyOwf+xaHiizmb
	LTrNsXhq6ogxstkcxPrtqRr44U4VA/ePNta9tHJnLhrikV9z0rdTOA8OyNo9xiwBvUQuaw3OkHK
	5Rm22kTz+xTAL6Pkhq4Il57a9SCLEvng5ZHb8GVfr824R2pDlW4blsw+JmEEuXOvnhbmbQGshRd
	nkyN1JcsiwFpLtKpZfXe71RgA/9GMxskubPVw3XfaGB5Z2rQMOOfmV/NY7ElJkbEF5hHVJIt3+E
	+xAMb4AgYIhXUTdKsDCAjUdMKUOgBKYXouJTpux6q+GmcQIJbnbUikuzs6cI0e2Y=
X-Received: by 2002:a05:6000:2203:b0:3ee:1296:d9e8 with SMTP id ffacd0b85a97d-3ee7e1066dbmr9258922f8f.17.1758526898188;
        Mon, 22 Sep 2025 00:41:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9B1weiPfO6bMVbHAqxOgbive1f1Crq3xoi47kw3u1f8xvVepvQI2XfzLgozHSVwVEVQfJTg==
X-Received: by 2002:a05:6000:2203:b0:3ee:1296:d9e8 with SMTP id ffacd0b85a97d-3ee7e1066dbmr9258869f8f.17.1758526897678;
        Mon, 22 Sep 2025 00:41:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2a:e200:f98f:8d71:83f:f88? (p200300d82f2ae200f98f8d71083f0f88.dip0.t-ipconnect.de. [2003:d8:2f2a:e200:f98f:8d71:83f:f88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407cffsm18716189f8f.16.2025.09.22.00.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 00:41:36 -0700 (PDT)
Message-ID: <111b1bfb-e2e0-4b2f-a559-9803828f3406@redhat.com>
Date: Mon, 22 Sep 2025 09:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com
Cc: usamaarif642@gmail.com, yuzhao@google.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, baohua@kernel.org, voidice@gmail.com,
 Liam.Howlett@oracle.com, catalin.marinas@arm.com,
 cerasuolodomenico@gmail.com, hannes@cmpxchg.org, kaleshsingh@google.com,
 npache@redhat.com, riel@surriel.com, roman.gushchin@linux.dev,
 rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com, ryncsn@gmail.com,
 shakeel.butt@linux.dev, surenb@google.com, hughd@google.com,
 willy@infradead.org, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
 ying.huang@linux.alibaba.com, apopple@nvidia.com, qun-wei.lin@mediatek.com,
 Andrew.Yang@mediatek.com, casper.li@mediatek.com,
 chinwen.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mm@kvack.org, ioworker0@gmail.com, stable@vger.kernel.org
References: <20250922021458.68123-1-lance.yang@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250922021458.68123-1-lance.yang@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ol0rv1Tf5EGAlX9dhOdgz7Ta-f8vsRNG601NV9ntzwU_1758526898
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_004144_618978_323F8C5B 
X-CRM114-Status: GOOD (  13.87  )
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

On 22.09.25 04:14, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
> 
> When both THP and MTE are enabled, splitting a THP and replacing its
> zero-filled subpages with the shared zeropage can cause MTE tag mismatch
> faults in userspace.
> 
> Remapping zero-filled subpages to the shared zeropage is unsafe, as the
> zeropage has a fixed tag of zero, which may not match the tag expected by
> the userspace pointer.
> 
> KSM already avoids this problem by using memcmp_pages(), which on arm64
> intentionally reports MTE-tagged pages as non-identical to prevent unsafe
> merging.
> 
> As suggested by David[1], this patch adopts the same pattern, replacing the
> memchr_inv() byte-level check with a call to pages_identical(). This
> leverages existing architecture-specific logic to determine if a page is
> truly identical to the shared zeropage.
> 
> Having both the THP shrinker and KSM rely on pages_identical() makes the
> design more future-proof, IMO. Instead of handling quirks in generic code,
> we just let the architecture decide what makes two pages identical.
> 
> [1] https://lore.kernel.org/all/ca2106a3-4bb2-4457-81af-301fd99fbef4@redhat.com
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: Qun-wei Lin <Qun-wei.Lin@mediatek.com>
> Closes: https://lore.kernel.org/all/a7944523fcc3634607691c35311a5d59d1a3f8d4.camel@mediatek.com
> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---

LGTM, thanks

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


