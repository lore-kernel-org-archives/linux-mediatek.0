Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6B3C43215
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 22:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27721206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 22:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ejDouOrY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27721206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=virtuozzo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OApwNw1zfJoq9bBS14QqG/1pzn5zPjJvt9vvGEDrBTs=; b=ejDouOrYHTWYOO
	PsLEJIlms0yMS2ggaun0OCehmqhxtdGwa7oisecX8iMfWceYY+kCs+dNZAMVUJMv3ykDjjJDGVdnE
	TZTUUrB3smin8lF/jqEOqUSyDWfCQZEhwLWZd8e0Rpya76dZct2rdL0YRFcdDoD2z2gqxkLSE53di
	TcLoOPRBfERx3AE7mw6KWFr3DbWD+UYKX/PdiRdxalizPONkOdRLLE1SJgc6ElLjbMwMH+4C/3JOL
	ifhn5TpNC6mHM/1r3X9iA+VnQzOl/mIfnrvsexxStxRlQiLwA7Dpzna39cRZgUINlyalu1QRBfVBB
	qWQBYO1RCZMXy3jV0BGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXuoh-0003Cf-8A; Thu, 21 Nov 2019 22:20:47 +0000
Received: from relay.sw.ru ([185.231.240.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXuod-0003C3-MY; Thu, 21 Nov 2019 22:20:45 +0000
Received: from [192.168.15.154] by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1iXuoL-0007nb-4j; Fri, 22 Nov 2019 01:20:25 +0300
Subject: Re: [PATCH v4 1/2] kasan: detect negative size in memory operation
 function
To: Dmitry Vyukov <dvyukov@google.com>
References: <20191112065302.7015-1-walter-zh.wu@mediatek.com>
 <040479c3-6f96-91c6-1b1a-9f3e947dac06@virtuozzo.com>
 <CACT4Y+botuVF6KanfRrudDguw7HGkJ1mrwvxYZQQF0eWoo-Lxw@mail.gmail.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <ad1aa63b-38d7-4c8d-00c0-bd215cf9b66e@virtuozzo.com>
Date: Fri, 22 Nov 2019 01:18:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACT4Y+botuVF6KanfRrudDguw7HGkJ1mrwvxYZQQF0eWoo-Lxw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_142043_734169_47380909 
X-CRM114-Status: GOOD (  15.33  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11/21/19 10:58 PM, Dmitry Vyukov wrote:
> On Thu, Nov 21, 2019 at 1:27 PM Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
>>> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
>>> index 6814d6d6a023..4bfce0af881f 100644
>>> --- a/mm/kasan/common.c
>>> +++ b/mm/kasan/common.c
>>> @@ -102,7 +102,8 @@ EXPORT_SYMBOL(__kasan_check_write);
>>>  #undef memset
>>>  void *memset(void *addr, int c, size_t len)
>>>  {
>>> -     check_memory_region((unsigned long)addr, len, true, _RET_IP_);
>>> +     if (!check_memory_region((unsigned long)addr, len, true, _RET_IP_))
>>> +             return NULL;
>>>
>>>       return __memset(addr, c, len);
>>>  }
>>> @@ -110,8 +111,9 @@ void *memset(void *addr, int c, size_t len)
>>>  #undef memmove
>>>  void *memmove(void *dest, const void *src, size_t len)
>>>  {
>>> -     check_memory_region((unsigned long)src, len, false, _RET_IP_);
>>> -     check_memory_region((unsigned long)dest, len, true, _RET_IP_);
>>> +     if (!check_memory_region((unsigned long)src, len, false, _RET_IP_) ||
>>> +         !check_memory_region((unsigned long)dest, len, true, _RET_IP_))
>>> +             return NULL;
>>>
>>>       return __memmove(dest, src, len);
>>>  }
>>> @@ -119,8 +121,9 @@ void *memmove(void *dest, const void *src, size_t len)
>>>  #undef memcpy
>>>  void *memcpy(void *dest, const void *src, size_t len)
>>>  {
>>> -     check_memory_region((unsigned long)src, len, false, _RET_IP_);
>>> -     check_memory_region((unsigned long)dest, len, true, _RET_IP_);
>>> +     if (!check_memory_region((unsigned long)src, len, false, _RET_IP_) ||
>>> +         !check_memory_region((unsigned long)dest, len, true, _RET_IP_))
>>> +             return NULL;
>>>
>>
>> I realized that we are going a wrong direction here. Entirely skipping mem*() operation on any
>> poisoned shadow value might only make things worse. Some bugs just don't have any serious consequences,
>> but skipping the mem*() ops entirely might introduce such consequences, which wouldn't happen otherwise.
>>
>> So let's keep this code as this, no need to check the result of check_memory_region().
> 
> I suggested it.
> 
> For our production runs it won't matter, we always panic on first report.
> If one does not panic, there is no right answer. You say: _some_ bugs
> don't have any serious consequences, but skipping the mem*() ops
> entirely might introduce such consequences. The opposite is true as
> well, right? :) And it's not hard to come up with a scenario where
> overwriting memory after free or out of bounds badly corrupts memory.
> I don't think we can somehow magically avoid bad consequences in all
> cases.
>

Absolutely right. My point was that if it's bad consequences either way,
than there is no point in complicating this code, it doesn't buy us anything.

 
> What I was thinking about is tests. We need tests for this. And we
> tried to construct tests specifically so that they don't badly corrupt
> memory (e.g. OOB/UAF reads, or writes to unused redzones, etc), so
> that it's possible to run all of them to completion reliably. Skipping
> the actual memory options allows to write such tests for all possible
> scenarios. That's was my motivation.

But I see you point now. No objections to the patch in that case.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
