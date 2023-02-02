Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A97C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 08:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEmUWkILhjHwy32wJlP5ahEThJlPzKxbPpXUXtBpjW8=; b=kZF7+bKi5QHvrsK0FlxZ6GJJ6s
	MvHEhTm8+6dTd30IYPY1VKnkfeb6HksDeo6y0ToIeWuOZkquUJ/2fyCFGbG/a2gOHLGyVgkyHdWRC
	dd+sCgFxgEj1lASMpfBHAX3egyeBZxSAD8QpfOJ0BeQzPXU1GK+Z31faAbLfO1j3SPrflM73FuMGo
	3v/oJto4ihWM0dXOTzc5OrwIm7SdQ0Ey2fI4Wt0bajVqCsU4tb+rs7Ly/MyjaTBOh/GLTLBTTSKKn
	JH4LL+wf8nheKuv8IKWFaFH9ZOgysqlJtNGBpkrPF5KXNvflQkhF7qaIu9eiia84zpGVF01rPCu8E
	tSSDpuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNV81-00F0DF-DK; Thu, 02 Feb 2023 08:39:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNV7w-00F0AL-HE
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 08:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675327166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEmUWkILhjHwy32wJlP5ahEThJlPzKxbPpXUXtBpjW8=;
	b=OGJrYQRjiPzR82ZOYbSRh86N0VkoguV3O8JR6weOUq27HfvLx+KqBs0DmX/cI5vK/vsfrH
	P05HrCFSbRjSb4yqU+WmlOSkow2HF8Pruvl6EFptir7cWaKNrTVt2tA8CcYVCV47p49HWn
	IZ1Tl26fxkdVTPZet7KPcfArXRub58s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-j4uHTlPCOQmGYHCkwE5nOw-1; Thu, 02 Feb 2023 03:39:24 -0500
X-MC-Unique: j4uHTlPCOQmGYHCkwE5nOw-1
Received: by mail-wm1-f69.google.com with SMTP id bg25-20020a05600c3c9900b003da1f6a7b2dso2459490wmb.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 00:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEmUWkILhjHwy32wJlP5ahEThJlPzKxbPpXUXtBpjW8=;
        b=5Uy1GfWAKX6k+pk4aSUIME28Ki+3NpYkAwFx7hqSScOZpLtzLi5XZl3XBwEDgneXbe
         +EMTymDu1w4gvqPA/eSXqenm2IY9Fks5kMfGcMy0qSA3MIf4kbhFzwwFi44iWKRWjV/B
         fh+UMcgOcWAJv6G14jWs7ppvaznR9DfJxS/qFbBbzDUI2h2VBihQQuvQuD+R+xyjt5MH
         qu3QYIYE/Ku6uZDhYWPvjRNGGDCtoaxcL9ps72wy74VCgfL/J38Jyke3KlcHePV42adx
         c2Ba9fYlYYolfGFtihSjH9iikuCUcEGqXvjVZH8lrt4WHAVz9FYrmLo3wkJqaoxvnkUt
         JDlQ==
X-Gm-Message-State: AO0yUKWpGhHSOYqrIkO3nM3+QyI/sJCR8NBvOlP0R7PGXRgySWM9PAGu
	DWBLHqIY9eOO/sdPtBuuwqt+ACRAd3ZoEgEUjcxtHlvEmzR3baylyATJ1d5FxHsfEkcQ+B1suGO
	soWELQSVGiApom+mWNswzR9mFuE8yazJu
X-Received: by 2002:adf:e192:0:b0:2bd:fa1d:5291 with SMTP id az18-20020adfe192000000b002bdfa1d5291mr5604512wrb.67.1675327163209;
        Thu, 02 Feb 2023 00:39:23 -0800 (PST)
X-Google-Smtp-Source: AK7set98llXB/OWQBWRDSwiILjhUm2SHG2oN+98oEMUauH+IM4rxQpqpkQvaA7kT1rOvZPHO/7OhmQ==
X-Received: by 2002:adf:e192:0:b0:2bd:fa1d:5291 with SMTP id az18-20020adfe192000000b002bdfa1d5291mr5604494wrb.67.1675327162961;
        Thu, 02 Feb 2023 00:39:22 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id a13-20020adfeecd000000b002bbedd60a9asm19075117wrp.77.2023.02.02.00.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 00:39:22 -0800 (PST)
Message-ID: <7eb43c35-5245-df9b-9e81-ae59d176839c@redhat.com>
Date: Thu, 2 Feb 2023 09:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] mm/gup: Add folio to list when folio_isolate_lru()
 succeed
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Cc: chinwen.chang@mediatek.com, andrew.yang@mediatek.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230131063206.28820-1-Kuan-Ying.Lee@mediatek.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230131063206.28820-1-Kuan-Ying.Lee@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_003928_713900_2D9173FC 
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

On 31.01.23 07:32, Kuan-Ying Lee wrote:
> If we call folio_isolate_lru() successfully, we will get
> return value 0. We need to add this folio to the
> movable_pages_list.
> 
> Fixes: 67e139b02d99 ("mm/gup.c: refactor check_and_migrate_movable_pages()")
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> ---
>   mm/gup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index f3d2cccb89f8..918c364d01ac 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1914,7 +1914,7 @@ static unsigned long collect_longterm_unpinnable_pages(
>   			drain_allow = false;
>   		}
>   
> -		if (!folio_isolate_lru(folio))
> +		if (folio_isolate_lru(folio))
>   			continue;
>   
>   		list_add_tail(&folio->lru, movable_page_list);

Agreed that this deserves cc:stable

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


