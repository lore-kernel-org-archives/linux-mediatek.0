Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA38CC87FCB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 19:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7UUfiKeOYlsuGZHT7CWAZbKMNooPk/lkfRZ63Id3bE=; b=Xn+YoxKkZBmNGZPiWiwgXvoznk
	VIgD2fjNYdK5ynBE4AVbOEf7shRL55KKCintnYDVGGVdpiFBitEZ2Ax4AfJAXvXKwd+v5BnClRS0O
	d27BH1uUudmZHbkSndmWHppvqpFyLuJEuZca7YS2dE4mf+Wh2UUixHJcfk7wn+F9hWal/uhOWtcsT
	GGjQrtePiRvkS8Kqz2hGitJcN3a0E0NHcec9aMsQuJfNy4yS3xGTXtgKv5m9nR52UbRRPVOK/DqhL
	c8L4Bk6llMCXuACH8nrtybFGXy7st09H1inbdUr5I214XicyKMc2nQ7fFtSQGESadKL3Bl+z+sVOk
	+cySadMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1LO-0000000BGZK-0dzA;
	Mon, 04 Aug 2025 19:59:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj0G5-0000000BBFz-1qLm
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Aug 2025 18:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754333404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T7UUfiKeOYlsuGZHT7CWAZbKMNooPk/lkfRZ63Id3bE=;
	b=iUyjlQjUfkfrZONjTtzR75EqjG7NdQjqLYN5VEhXK1va1Zsx6OU/+4dKxWHZSAkxlRsrpq
	dhmuqrrWjule8Oz01sFI/TdxkMlDHTKCf8ExPkR9leFnDiaq0wCsIIqCOr2zNS9tqp3p/1
	COko4aC1apeEMRq1Rv4VOGxzSabBuPs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-tMQjBamkO6mPoBbB6WgE3g-1; Mon, 04 Aug 2025 14:50:00 -0400
X-MC-Unique: tMQjBamkO6mPoBbB6WgE3g-1
X-Mimecast-MFC-AGG-ID: tMQjBamkO6mPoBbB6WgE3g_1754333399
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-458a31421a3so17390335e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Aug 2025 11:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754333399; x=1754938199;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T7UUfiKeOYlsuGZHT7CWAZbKMNooPk/lkfRZ63Id3bE=;
        b=fR7Su41b4QiUVmxemaxF7YVptn8agaYUQllK6RG56Z6XZekj7p5lLIhaZYDMXNLq/M
         GWPYMo0Qu6AhWkY8vii4GUcL62Rz9NGtWUpj3h1L4JGaC+kGr6uYNxO2649nONmZ5ETR
         6HYHD25MdtoO+UY50RrQRcSfeAmwz0qPrcSX/ECaeOilBontaRBuhN12ORqXGo6AwSg3
         b1OXHWasu7GLtmEqBHZGH4cD7SnhNXPK1lmzmVvrrx0NEurUISEvphoBq/Ax2ukV13GW
         mre98N7kNyCfzZ5ssjJcT/tqaO3D97de/ktvZXOU/lcnOc/XNaVorIsITtPMmkn496Jv
         k9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFYPuKM/wpp/9uf23Ru9YFe4pvIrTu6sqlJ70Q+TZPh45OwVvuOmJLcxNhIrVYjfIChHdbI48ZLOfVzCEUFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMPyC6fyRM8OgwplLwMREo+x/5X5n2pnPPkQQlM1zn5/jicmYL
	flmdFH9A9N82pSjxKdqriTsgqLzS//LIaGkngdbS2NOSrHK39LYfRWSubYWjNoEZzUtZDY/KreH
	9WVWR0MpqW2QJmhzP0GFO2Pi0f/oYW4CdLnjG3YU0p0KSpO/Gp7GJVyrpvu3rGMWBlL3Q8qemQw
	==
X-Gm-Gg: ASbGnctPO6mfxMIeG2b2H0Zq22nz2gJJLK2CbIU5Ud1lq/yMyBhHAI70pM+bu3kU0pn
	GvbOtL9D0rUyzOfsew4gYsYDzCdR7gtno0CmyU1QS1JeOn0ME3qbD0bmy0HPtrfFaQ0K/VFG1Zb
	9tlLzbC8He+pbv8atyRfOOjCKyoyZpPB6YRyThl/AyHCwWPdkm1qoGmjaj/EwOKDX0bEn/q/PNw
	GrsGXZfvznKQiiXmkZdnQdpcHqPY/tZOqvHBnRvrcLCHG/xJHFirBOH0Pqt6k5LvU91Q2aX9QLS
	+lBjDy+HX+JGO6Gr5UxEK9qsUDQhHRy2cbTzTGN5F0U0dLvh1W604SYAtOgGg7tax+rbYvw=
X-Received: by 2002:a05:600c:4e10:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-459443eb330mr58589135e9.8.1754333399548;
        Mon, 04 Aug 2025 11:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP5GKxPERgMzvVb32ee5lNTwOD6PwhOAZJzd+FoxhfvfxFD7V+1+8Wo8Q6qFIfAKQ4FNeWAg==
X-Received: by 2002:a05:600c:4e10:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-459443eb330mr58588875e9.8.1754333399118;
        Mon, 04 Aug 2025 11:49:59 -0700 (PDT)
Received: from [192.168.3.141] (p4ff1f1eb.dip0.t-ipconnect.de. [79.241.241.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47b10asm16101568f8f.60.2025.08.04.11.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 11:49:58 -0700 (PDT)
Message-ID: <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com>
Date: Mon, 4 Aug 2025 20:49:57 +0200
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VLfsW2Rmlcof-reY0vrgyQahhgijQMEJRXjryUE_1fQ_1754333399
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_115005_543386_101DF5E5 
X-CRM114-Status: GOOD (  16.91  )
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

On 04.08.25 20:20, Juan Yescas wrote:
> Hi David/Zi,
> 
> Is there any reason why the MIGRATE_CMA pages are not in the PCP lists?
> 
> There are many devices that need fast allocation of MIGRATE_CMA pages,
> and they have to get them from the buddy allocator, which is a bit
> slower in comparison to the PCP lists.
> 
> We also have cases where the MIGRATE_CMA memory requirements are big.
> For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 500MiBs.
> These cases would benefit if we have THPs for CMAs.
> 
> Could we add the support for MIGRATE_CMA pages on the PCP and THP lists?

Remember how CMA memory is used:

The owner allocates it through cma_alloc() and friends, where the CMA 
allocator will try allocating *specific physical memory regions* using 
alloc_contig_range(). It doesn't just go ahead and pick a random CMA 
page from the buddy (or PCP) lists. Doesn't work (just imagine having 
different CMA areas etc).

Anybody else is free to use CMA pages for MOVABLE allocations. So we 
treat them as being MOVABLE on the PCP.

Having a separate CMA PCP list doesn't solve or speedup anything, really.

I still have no clue what this patch here tried to solve: it doesn't 
make any sense.

-- 
Cheers,

David / dhildenb


