Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8D4CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 02:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2o3DubClAWsVDJ1BnGOUzNOsvzg6slCDhpRe/M692Y=; b=VuLzX+kLWTMKxILz2THsQab9VL
	upJlXxM8Nyc4jSJuUyl6kjHSAfF+lzEgpTU+A+Mkoc9aIuBnzHtO50n4YfQSM6xIYBF2JwvI40EZv
	4ap1eaa4TLzKhKHzOck6LcywBoFGgvNIcTJ28HHGnTN4OWmL9wpRreyn9l1N0Ql8eVsJByx8M13yS
	nOqU94Z4xqvEFi2EKavlqJbE07ziMYvoEw+Ua1+bzx6mt5blQJzkQHI9d/JRHX7FdHbYT2aUnvmE1
	4/QTZKkImZ01zgUyVKTIlP44qYj7TTXakdLw3kmaU3kO4D+Dye4gTui44r+0FXHHjsxJojh7K4Zpu
	a6IglZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sUT-0000000C7E1-3Pqk;
	Tue, 23 Sep 2025 02:10:49 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sUQ-0000000C7Bb-1YeP
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 02:10:48 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b2ef8e00becso164066666b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Sep 2025 19:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758593444; x=1759198244; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2o3DubClAWsVDJ1BnGOUzNOsvzg6slCDhpRe/M692Y=;
        b=OMRQkEKCmu8EmTuqlXobJc9dMurez3GuI24CgcHIwFw9A38kaN3pwcvlP/1/L021P1
         RFOHP/X2Gh3bOMKe3qh0nK9oSdospmL0t9cwkpa88u2UNYLM61F78qlqbkPiAsk/Xx9F
         gl4DqmkUnBP2mQ49XDbygeKm6+vWXgP2pP9bso+jZvg1Q9nRTcUbytvEFe2ZzddWfvah
         ydSxEHJpuMtOX2ZeSLqR/c2nvSMrA0PpMz3J7haLW2/9AZrMPygqJ75J0JYGtwvXmuV6
         ObBOcyZc162iC6NA7fmanaQ/SN2FAE1UPmH7ofv5ZXus/pLyJ1AW4OqA26xLfEWqhY1i
         nzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758593444; x=1759198244;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A2o3DubClAWsVDJ1BnGOUzNOsvzg6slCDhpRe/M692Y=;
        b=qzP2aPddHlRJpWAcQ7YJ8M9jSxm+JZRSJCfG9L4ZZgGjN65mmrMyrQpb9p8zmXJS7D
         yXo0fa5NZcp0gfpHCZWLp2+/5NV0mcACns6yXm+5ch9gzSWH9BvwVBPiuQWkR97W0orj
         J7Q9wbiEz1A/x20bP8pCr4BbvfPtRusopqs6KtHKaarShd0Gv8PHMOWWiLGMkxzrVe7X
         IqPUmjYXBNLnoxdV4GWGyLmxPwlBTpMh4FHqTPKrvoPyh9qd5ne1FujQ7/1eS+wemjpt
         QI4wYizQV1XKJJ8ynjRpeBh0I18gHquc6Yv5TpAjLf0b0Z0Qb525C4vpKDDrOrMLK+gk
         66ag==
X-Forwarded-Encrypted: i=1; AJvYcCU2S6O/mg0tXYrnsMLq1Kw7PQyQrumVOV+BvttaZTXOPYwdZ6YTBnkFKp+5JMefBAcQJ/lqA5emOgVd8r+TcA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8bZfzNsdFP1N3YDkqxDP347B6ZPo98E0Sj4sazMRUqSjnJl1K
	Qc+vk6aLjsJHglIAyyC5r7LNSukWJ3nPB6fJCZeukBERhXT1aqimW+yf
X-Gm-Gg: ASbGncvgT3Z6BMTWdVa1d9v8oeOBiu3+yAxdHv8lHYFa3/ZAffPakWGpzZ4mNA0aV32
	2pDoAkZaQHGz/+QqQQbsgcnM+r8olrQPC0dQmZ9010k21gyJC0cNL3qdjNFijHbvBTddb3DbiV+
	xtFGTn5E+9KW/VE9hcuw0Ikzq+Zw2OjjK7fqkL2+HaH3h9t/fdtFD/xL2vr/8mvCZ7Uxutw9Wbx
	iLsulZh6nqRhqCzYl1P0qyHOSR5bGkpFCr/9IHJp93td3ZPF/LYdyuX5ANaEhcuKV5rX2hwYlTi
	X6pzAdnWcz8FrXuRq/21i4h+lepwN2Ve/itWDarNNMmo2VDspfDxmTwSnnzKZqaFF5dKmd38lVH
	+7IGJolA9DhB8RxCo4rDM82ymmpVTzYGwISlH1yoh
X-Google-Smtp-Source: AGHT+IHh1ALlBKynJpngfEEL3Ms5mRjlxZlK1yneebgFCzG1payJHzKI+8XXxoWxK83o13jhnY/w3Q==
X-Received: by 2002:a17:907:6ea0:b0:b0b:f228:25a with SMTP id a640c23a62f3a-b302cccb3e8mr56042366b.64.1758593444044;
        Mon, 22 Sep 2025 19:10:44 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28a990f6e1sm658553266b.37.2025.09.22.19.10.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Sep 2025 19:10:43 -0700 (PDT)
Date: Tue, 23 Sep 2025 02:10:43 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
	usamaarif642@gmail.com, yuzhao@google.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, baohua@kernel.org, voidice@gmail.com,
	Liam.Howlett@oracle.com, catalin.marinas@arm.com,
	cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
	kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
	dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
	surenb@google.com, hughd@google.com, willy@infradead.org,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, qun-wei.lin@mediatek.com,
	Andrew.Yang@mediatek.com, casper.li@mediatek.com,
	chinwen.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org, ioworker0@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Message-ID: <20250923021043.nx2k4ftzle6e2jht@master>
References: <20250922021458.68123-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922021458.68123-1-lance.yang@linux.dev>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_191046_425279_B742E829 
X-CRM114-Status: GOOD (  12.08  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 22, 2025 at 10:14:58AM +0800, Lance Yang wrote:
>From: Lance Yang <lance.yang@linux.dev>
>
>When both THP and MTE are enabled, splitting a THP and replacing its
>zero-filled subpages with the shared zeropage can cause MTE tag mismatch
>faults in userspace.
>
>Remapping zero-filled subpages to the shared zeropage is unsafe, as the
>zeropage has a fixed tag of zero, which may not match the tag expected by
>the userspace pointer.
>
>KSM already avoids this problem by using memcmp_pages(), which on arm64
>intentionally reports MTE-tagged pages as non-identical to prevent unsafe
>merging.
>
>As suggested by David[1], this patch adopts the same pattern, replacing the
>memchr_inv() byte-level check with a call to pages_identical(). This
>leverages existing architecture-specific logic to determine if a page is
>truly identical to the shared zeropage.
>
>Having both the THP shrinker and KSM rely on pages_identical() makes the
>design more future-proof, IMO. Instead of handling quirks in generic code,
>we just let the architecture decide what makes two pages identical.
>
>[1] https://lore.kernel.org/all/ca2106a3-4bb2-4457-81af-301fd99fbef4@redhat.com
>
>Cc: <stable@vger.kernel.org>
>Reported-by: Qun-wei Lin <Qun-wei.Lin@mediatek.com>
>Closes: https://lore.kernel.org/all/a7944523fcc3634607691c35311a5d59d1a3f8d4.camel@mediatek.com
>Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
>Suggested-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Lance Yang <lance.yang@linux.dev>

Nice catch.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me

