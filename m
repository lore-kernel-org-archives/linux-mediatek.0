Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE61C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 19:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OD0rUBsFbNT3ZWOluNcq3ml5obnQ3hpz5bYGARgmcHk=; b=abEgedYV9mm8R8
	MfNcjctr4zWgrbs1oEvTtQigLFyFHBacRnOn6vs2LG9v2YejOs8AfDHwqcF9BiDUPMWfWIe1YInVX
	J8iatdqtWYZ9/laejc6wSjieCCcK82i7v7Z1smQYoDqoVaS6CblbS74U+MxLRGhya4ljTFgYUzQqO
	Ttgxs4OPQz10RHOl9QxfQ4DGKBJfkAznwN+PUofahYcU8LdumXAreHusiJmfDgHMnlOEz3HzMgtIo
	dsoZ7gd8daNgKMbyzXQekj7rNjzxtfSU8mZjFky2zunSZYRFDg9AyjOter7SyhafrwsD3vYygCQ+L
	odwB1vowCMYiDICoD92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUCWN-00APwq-Fm; Tue, 15 Mar 2022 19:07:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUCWK-00APvJ-8d
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 19:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647371267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBJf1R7kBM9gH+xhtNa/kOhtVdAYjEafv1mIR3CkHEI=;
 b=a02ENoeAkU4H1SxZNuyf7cP0Rqd3nz3Nz1EWmF8nCz3aleTwmNLpN8V2YdlMaWeXn7zqb/
 A+Fc/A+yBoU8P3SS1WOTK41LK2/DV6UzTa54p4+RnqhSaU7pb3sJLj8WOShX+vwKqLIT1K
 LUn3wX3zqZNeIx/LMJT0O7tKsKjvKfI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-jsMZnFLANkyKmM4SS9uxCA-1; Tue, 15 Mar 2022 15:07:45 -0400
X-MC-Unique: jsMZnFLANkyKmM4SS9uxCA-1
Received: by mail-wr1-f70.google.com with SMTP id
 f9-20020a5d58e9000000b001f0247e5e96so5635684wrd.15
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Mar 2022 12:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fBJf1R7kBM9gH+xhtNa/kOhtVdAYjEafv1mIR3CkHEI=;
 b=qdTea0zQg20GbXzCswbENKk4VtHrCdKt3VE/ugJc4fnsUFTa+JZnDniRditu9ugR0g
 20Y/NRZ7Y457X/HgsA3STYjY3BV9zAP0KvAvofIVccaNnV4xe45qWfAvFVPUIWEUnzIv
 OvIAiEUdWEdSgKlg9z8QLe5bt/VzWi3gwX5uht2sy205JQ/TjFy5JBsIQg3sAPHSVgLh
 EWAb50fC7Fx9l2SJr8AYhFOwSfX8h+p785cOoUV/77y1XZky2R+o4HO9siQvv5mG4qEt
 YS5yV3A/BliNazIBtdpugJqamPVw0tL8n7IPlz8UWZQ+shC5PHus1oiGjGseAdJcaARd
 xjbQ==
X-Gm-Message-State: AOAM532ATqjToM94oo9tRqSujYiEQZ9E8msGRonjKMeYjBdK7p7617+8
 nGw8jjhWmq9Q3CBgNmFPNh5c8D0fq8F4WsRFhj5E34BkJkvdNMcojpMQztF44MF5WPMObfxWr07
 JdgjdWlH+R7+4bZnlc+4a8bOBOi6NMkgm
X-Received: by 2002:a05:600c:1c9f:b0:389:cf43:da64 with SMTP id
 k31-20020a05600c1c9f00b00389cf43da64mr4480388wms.206.1647371264793; 
 Tue, 15 Mar 2022 12:07:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyzLlJbwR1xveI8URJ60kP+00Vz8I0FYYiVHPL3IeEWq8UXFCK8AWIjfhzlGgS3nbkP0cs5A==
X-Received: by 2002:a05:600c:1c9f:b0:389:cf43:da64 with SMTP id
 k31-20020a05600c1c9f00b00389cf43da64mr4480382wms.206.1647371264585; 
 Tue, 15 Mar 2022 12:07:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:1800:42bd:3cac:d22a:3c62?
 (p200300cbc708180042bd3cacd22a3c62.dip0.t-ipconnect.de.
 [2003:cb:c708:1800:42bd:3cac:d22a:3c62])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfc74f000000b001e888b871a0sm16915200wrh.87.2022.03.15.12.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 12:07:43 -0700 (PDT)
Message-ID: <a39c3fe4-3309-dbc4-77f9-f797e3131feb@redhat.com>
Date: Tue, 15 Mar 2022 20:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] mm/migrate: fix race between lock page and clear
 PG_Isolated
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andrew Yang <andrew.yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 David Howells <dhowells@redhat.com>,
 William Kucharski <william.kucharski@oracle.com>,
 Yang Shi <shy828301@gmail.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Nicholas Tang <nicholas.tang@mediatek.com>,
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
References: <20220315030515.20263-1-andrew.yang@mediatek.com>
 <20220314212127.a2797926ee0ef8a7ad05dcaa@linux-foundation.org>
 <4cb789a5-c49c-f095-1f7e-67be65ba508a@redhat.com>
 <YjDQRdShE6syVSnM@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YjDQRdShE6syVSnM@casper.infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_120748_420767_E27870C0 
X-CRM114-Status: GOOD (  20.87  )
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

On 15.03.22 18:43, Matthew Wilcox wrote:
> On Tue, Mar 15, 2022 at 04:45:13PM +0100, David Hildenbrand wrote:
>> On 15.03.22 05:21, Andrew Morton wrote:
>>> On Tue, 15 Mar 2022 11:05:15 +0800 Andrew Yang <andrew.yang@mediatek.com> wrote:
>>>
>>>> When memory is tight, system may start to compact memory for large
>>>> continuous memory demands. If one process tries to lock a memory page
>>>> that is being locked and isolated for compaction, it may wait a long time
>>>> or even forever. This is because compaction will perform non-atomic
>>>> PG_Isolated clear while holding page lock, this may overwrite PG_waiters
>>>> set by the process that can't obtain the page lock and add itself to the
>>>> waiting queue to wait for the lock to be unlocked.
>>>>
>>>> CPU1                            CPU2
>>>> lock_page(page); (successful)
>>>>                                 lock_page(); (failed)
>>>> __ClearPageIsolated(page);      SetPageWaiters(page) (may be overwritten)
>>>> unlock_page(page);
>>>>
>>>> The solution is to not perform non-atomic operation on page flags while
>>>> holding page lock.
>>>
>>> Sure, the non-atomic bitop optimization is really risky and I suspect
>>> we reach for it too often.  Or at least without really clearly
>>> demonstrating that it is safe, and documenting our assumptions.
>>
>> I agree. IIRC, non-atomic variants are mostly only safe while the
>> refcount is 0. Everything else is just absolutely fragile.
> 
> We could add an assertion ... I just tried this:
> 
> +++ b/include/linux/page-flags.h
> @@ -342,14 +342,16 @@ static __always_inline                                                    \
>  void __folio_set_##lname(struct folio *folio)                          \
>  { __set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }         \
>  static __always_inline void __SetPage##uname(struct page *page)                \
> -{ __set_bit(PG_##lname, &policy(page, 1)->flags); }
> +{ VM_BUG_ON_PGFLAGS(atomic_read(&policy(page, 1)->_refcount), page);   \
> +  __set_bit(PG_##lname, &policy(page, 1)->flags); }
> 
>  #define __CLEARPAGEFLAG(uname, lname, policy)                          \
>  static __always_inline                                                 \
>  void __folio_clear_##lname(struct folio *folio)                                \
>  { __clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }       \
>  static __always_inline void __ClearPage##uname(struct page *page)      \
> -{ __clear_bit(PG_##lname, &policy(page, 1)->flags); }
> +{ VM_BUG_ON_PGFLAGS(atomic_read(&policy(page, 1)->_refcount), page);   \
> +  __clear_bit(PG_##lname, &policy(page, 1)->flags); }
> 
>  #define TESTSETFLAG(uname, lname, policy)                              \
>  static __always_inline                                                 \
> 
> ... but it dies _really_ early:
> 
> (gdb) bt
> #0  0xffffffff820055e5 in native_halt ()
>     at ../arch/x86/include/asm/irqflags.h:57
> #1  halt () at ../arch/x86/include/asm/irqflags.h:98
> #2  early_fixup_exception (regs=regs@entry=0xffffffff81e03cf8,
>     trapnr=trapnr@entry=6) at ../arch/x86/mm/extable.c:283
> #3  0xffffffff81ff243c in do_early_exception (regs=0xffffffff81e03cf8,
>     trapnr=6) at ../arch/x86/kernel/head64.c:419
> #4  0xffffffff81ff214f in early_idt_handler_common ()
>     at ../arch/x86/kernel/head_64.S:417
> #5  0x0000000000000000 in ?? ()
> 
> and honestly, I'm not sure how to debug something that goes wrong this
> early.  Maybe I need to make that start warning 5 seconds after boot
> or only if we're not in pid 1, or something ...

Maybe checking for "system_state >= SYSTEM_RUNNING" or "system_state >=
SYSTEM_SCHEDULING" to exclude early boot where no (real) concurrency is
happening. But I assume you'll still get plenty of such reports.

-- 
Thanks,

David / dhildenb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
