Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8BAC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 23:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eAIWeFmZQqOIaWa0qEnwmG7+gddq4/fVT/CRZt8reo=; b=DXhFkH0fXLEnUrKhjPsyVTahVC
	g3V7S07c835sNjD9eCt0Sf5R1OcXyR85UBfzpfV4/pOw2eBvyDqzJWHDZ32Ypm+C76mwez0z4qDPj
	DcfKKyPw4zH3TGMgzSLaNEJcvspkUccdkX1x9cbiz1XUX6SstZfKoKIKotGCyH5+/VrAelQhLe7yE
	yil1iAw7T7ToP3ybH2ND9YO1LCS4v7Qdve/+QZENDp/G0fE+RAlFcfGVP8zaN8ofKKIoPmDxZHoFy
	FKldWwHvjAmwNQeHAEsj2cdy6+YT9QnZh5J4BFN23kM9RUAvXS5pUKtS1F+C0yRjPxG+mVr3Z/eis
	uvlcOe1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDwXv-00EQ9S-7a; Tue, 19 Jul 2022 23:22:31 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDwXj-00EPys-8g; Tue, 19 Jul 2022 23:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658272939; x=1689808939;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DNYh3WvqLRfUXzaq47t9zdMeNxzavxqzs6FOlkMSOks=;
  b=f0CcdZzE3D0LCD1RPDqnVDujR9Eij69TTewpqLtPgukwsmIdPEz1U0oR
   5eWH0fP9PHs14qTF7objRt/IdnBcaiah7LL8QOJuxq/YMGoaloL2kY41Y
   FSXqxdQKvUWgtaQ/mFlk3LTaT9fYJlnyEtu5CsA7X5LREOa1sLdC5KwVb
   AulLaxHGc9pou7FpOvYXdobB1IBRL7OPSlsOrDSXVijlG/k8KMR1Eow9d
   /aze29gg1UQW5TCOfkFwDmqxdWc/avqU7W68z5vj8jqX4fw1UBGGnN6m8
   SJ32mQxb+lzE5aTZ7Re9muDFojTwHVXt3hhP5rQ+2fiiX5p0t3fIs96ML
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="273466730"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="273466730"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 16:22:13 -0700
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="687299824"
Received: from twliston-mobl1.amr.corp.intel.com (HELO [10.212.132.190]) ([10.212.132.190])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 16:22:12 -0700
Message-ID: <dc7800c0-43f3-6453-ef5f-1ceb659062de@intel.com>
Date: Tue, 19 Jul 2022 16:22:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early
 allocated pool
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, yee.lee@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:KFENCE" <kasan-dev@googlegroups.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20220628113714.7792-1-yee.lee@mediatek.com>
 <20220628113714.7792-2-yee.lee@mediatek.com>
 <CAMuHMdX=MTsmo5ZVa8ya3xmr4Mx7f0PB3gvFF42pdaTYB6-u5A@mail.gmail.com>
 <20220715163305.e70c8542d5e7d96c5fd87185@linux-foundation.org>
 <CAMuHMdWSsibmL=LauLm+OTn0SByLA4tGsbhbMsnvSRdb381RTQ@mail.gmail.com>
 <CANpmjNPhhPUZFSZaLbwyJfACWMOqFchvm-Sx+iwGSM3sxkky8Q@mail.gmail.com>
 <20220719161356.df8d7f6fc5414cc9cc7f8302@linux-foundation.org>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220719161356.df8d7f6fc5414cc9cc7f8302@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_162219_370416_F97361ED 
X-CRM114-Status: GOOD (  17.62  )
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

On 7/19/22 16:13, Andrew Morton wrote:
> On Mon, 18 Jul 2022 16:26:25 +0200 Marco Elver <elver@google.com> wrote:
> 
>> On Sat, 16 Jul 2022 at 20:43, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> [...]
>>>> - This patch has been accused of crashing the kernel:
>>>>
>>>>         https://lkml.kernel.org/r/YsFeUHkrFTQ7T51Q@xsang-OptiPlex-9020
>>>>
>>>>   Do we think that report is bogus?
>>> I think all of this is highly architecture-specific...
>> The report can be reproduced on i386 with CONFIG_X86_PAE=y. But e.g.
>> mm/memblock.c:memblock_free() is also guilty of using __pa() on
>> previously memblock_alloc()'d addresses. Looking at the phys addr
>> before memblock_alloc() does virt_to_phys(), the result of __pa()
>> looks correct even on PAE, at least for the purpose of passing it on
>> to kmemleak(). So I don't know what that BUG_ON(slow_virt_to_phys() !=
>> phys_addr) is supposed to tell us here.
>>
> It's only been nine years, so I'm sure Dave can remember why he added
> it ;)
> 
> 		BUG_ON(slow_virt_to_phys((void *)x) != phys_addr);
> 
> in arch/x86/mm/physaddr.c:__phys_addr().

I think I intended it to double check that the linear map is *actually*
a linear map for 'x'.  Sure, we can use the "x - PAGE_OFFSET" shortcut,
but did it turn out to be actually accurate for the address it was handed?

I'd be curious what the page tables actually say for the address that's
causing problems.

