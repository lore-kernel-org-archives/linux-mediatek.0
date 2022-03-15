Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056B6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3D+V2ml7aooRJMMxRXIalmOpLBqlxfAxyi784312nk=; b=iJ+102wzDX5kGo
	KK74nIQZ14HxRhEpo+vmB/BK5YESvCjta3pQ8fXlNq5HVKxNGuSYT0CuJpidtpjeDgp7gY7DdCKna
	U/+mEDfEH1T1UXRh0U5cVK4Ai+Fz83gasdxRjz+b5iGgNPioobr6r+U7F5Nz5USYiJ+j7zNJ1YuOA
	mK2az7ArIqP8QvBkPRauLc6yPYLXDvc9wcq/W146fpL3d+xUx0vJgwJFL4HHIVygiU3DktpQ1EJCq
	WuWWQKD/sFkEoiLWne7mi4xAxuW9AJHBP4WdLHjcwkF1rsNe0Hf2eOX4x1ivBFwk1bJL5k/T9xsxm
	qcp1Z98IZECHYVQCbB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU9MP-009ljo-7q; Tue, 15 Mar 2022 15:45:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU9MM-009li9-JA
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 15:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647359117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYl1LSBqhgpJOo7T6+g24bgPe/Xpp9f9wR/UlrFgmkY=;
 b=bEimwjB7kvETAn4XMfFwiJe0hZNoakIphJPVkHcRW+9p6sUdJncxyQff4sa0HOi1T4nrH2
 ub9OJ/UdwYfYqFd/fGhZaHFoqg5i0GOM3+lMZ05Ls5/UrQM10rc5bqJQR/qBgCAVv/M0g9
 DeQKoAqTaRzFZFVSFjY+OR+PDUA31yY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-p9pASEfwOieVX2ibIVMrlA-1; Tue, 15 Mar 2022 11:45:16 -0400
X-MC-Unique: p9pASEfwOieVX2ibIVMrlA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h11-20020a5d430b000000b001f01a35a86fso5413798wrq.4
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Mar 2022 08:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bYl1LSBqhgpJOo7T6+g24bgPe/Xpp9f9wR/UlrFgmkY=;
 b=qqj8BMmReGanitTi0ddEGskBG9WM0Hvfqka7hGKMcovkSZZ5n2b7DhTZQSyooWv4to
 0sHjqM3rFxyIgqf+q03qym3wIbySJxkmLqW+EaUE72Yl/5S8XOq63S9JgCjgEX92OZii
 r6IdEYAhBoqDFmXP/p+H1Y2RbyKR9LL8lOVskA1+o6IP0bnC577rCoTDmGnTv2o5kHnp
 IuFnlgHxIFf7PYb/wL65OaJng0VarQScXl2SFVMKZHrtQe9X8rMYX4ResdqVy9CKK5gm
 L4PcMaUIF+tKxxyTAqpa1OhSlvNDFBIDwYhTO0pFWq4a7MLOlYBKfPAv4EmxccAELOrp
 c+yQ==
X-Gm-Message-State: AOAM530TnBuS4s8sebTHwI5iQHG7i55rtz9ogEaHqHgmH8pq+2GunGY5
 K1SiElK2F8Dr1GMBbQexEy2CvWPb5bJTDWlEFBp9oWJCuiVzLO+sFxQouZgxbMwh+0j3WtA5MBe
 imCJv9XaEsrWkTW3bWsX/eqESYwEs1yHF
X-Received: by 2002:a5d:5887:0:b0:1f1:eb44:724e with SMTP id
 n7-20020a5d5887000000b001f1eb44724emr21315051wrf.44.1647359114936; 
 Tue, 15 Mar 2022 08:45:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPoEJ1GBznl0gSlJSA8PP9PMIE7udTKKIyZAmfT4CMnFBi93qUV9w8thhZ2jRKEb3NPxfnVA==
X-Received: by 2002:a5d:5887:0:b0:1f1:eb44:724e with SMTP id
 n7-20020a5d5887000000b001f1eb44724emr21315036wrf.44.1647359114709; 
 Tue, 15 Mar 2022 08:45:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:1800:42bd:3cac:d22a:3c62?
 (p200300cbc708180042bd3cacd22a3c62.dip0.t-ipconnect.de.
 [2003:cb:c708:1800:42bd:3cac:d22a:3c62])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a1c2b04000000b0038a0e15ee13sm2637525wmr.8.2022.03.15.08.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 08:45:14 -0700 (PDT)
Message-ID: <4cb789a5-c49c-f095-1f7e-67be65ba508a@redhat.com>
Date: Tue, 15 Mar 2022 16:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] mm/migrate: fix race between lock page and clear
 PG_Isolated
To: Andrew Morton <akpm@linux-foundation.org>,
 Andrew Yang <andrew.yang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 David Howells <dhowells@redhat.com>,
 William Kucharski <william.kucharski@oracle.com>,
 Yang Shi <shy828301@gmail.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Nicholas Tang <nicholas.tang@mediatek.com>,
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
References: <20220315030515.20263-1-andrew.yang@mediatek.com>
 <20220314212127.a2797926ee0ef8a7ad05dcaa@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220314212127.a2797926ee0ef8a7ad05dcaa@linux-foundation.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_084518_773305_EEA172B5 
X-CRM114-Status: GOOD (  14.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 15.03.22 05:21, Andrew Morton wrote:
> On Tue, 15 Mar 2022 11:05:15 +0800 Andrew Yang <andrew.yang@mediatek.com> wrote:
> 
>> When memory is tight, system may start to compact memory for large
>> continuous memory demands. If one process tries to lock a memory page
>> that is being locked and isolated for compaction, it may wait a long time
>> or even forever. This is because compaction will perform non-atomic
>> PG_Isolated clear while holding page lock, this may overwrite PG_waiters
>> set by the process that can't obtain the page lock and add itself to the
>> waiting queue to wait for the lock to be unlocked.
>>
>> CPU1                            CPU2
>> lock_page(page); (successful)
>>                                 lock_page(); (failed)
>> __ClearPageIsolated(page);      SetPageWaiters(page) (may be overwritten)
>> unlock_page(page);
>>
>> The solution is to not perform non-atomic operation on page flags while
>> holding page lock.
> 
> Sure, the non-atomic bitop optimization is really risky and I suspect
> we reach for it too often.  Or at least without really clearly
> demonstrating that it is safe, and documenting our assumptions.

I agree. IIRC, non-atomic variants are mostly only safe while the
refcount is 0. Everything else is just absolutely fragile.

-- 
Thanks,

David / dhildenb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
