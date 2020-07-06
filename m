Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA3FC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 07:01:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D3720724
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 07:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ER1oxqeW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZWXHNQeH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64D3720724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TczyPqqnKUt/Zk/IWZWxWS5McuthVGaU/CzIP/H4JDY=; b=ER1oxqeWUi04G1zNYWJXnV36J
	y0qxJMv4tNKOkM/tiApy6okZhQVI99yYKmyUoptgQUM+s4puTjDMfP1QWCxKfo87P5Ec5rRsDbE8Q
	XpErriXjIE3a4X4PJJ6ZNbCvGXI81CrW5yENZCAeN/wmb/lkRst2POhTprsH4d8TZlpH/828d7GFi
	peMaZ8hJc4sODIry7HWM1TI4Yu3+JgAsTNH358pyjRmhhe2jZRqqfe8MElqR5EZvRahOWJmhVQlMl
	OVUV/OQpigTogApHkLEuXV/d4+zAXA6yahfZvIs2NUumjH0a5Wr60u/F5YRrsmTBuN4nVr1rx7pPc
	qag0fXPNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsL8E-0004rm-V6; Mon, 06 Jul 2020 07:01:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsL8C-0004r0-Mn; Mon, 06 Jul 2020 07:01:38 +0000
X-UUID: c4d431e22eca48d2af69ef4f192548cb-20200705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nPZqNQDBxsg4ytdwwt0Endr8/iEUUms3Rc4LlN2aaeY=; 
 b=ZWXHNQeH1glsAO9qmsaQtK4QYBMYcdFFunWVpfOPSc1cQesMWSBAg0Ozg8+WOSsU9dvXY14iZK/duB2n1jtMLwoUc4oi6ytmd41yiS55w74pYvxhSxLs7Xg5E6xTCYgeat0yLC84FmyOqfTx2hmx3I9sabm+/rE/4Cg7W8bfa2k=;
X-UUID: c4d431e22eca48d2af69ef4f192548cb-20200705
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2125156264; Sun, 05 Jul 2020 23:01:23 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 23:59:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 14:59:13 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Jul 2020 14:59:13 +0800
Message-ID: <1594018755.1706.3.camel@mtksdccf07>
Subject: Re: [PATCH v2] kasan: fix KASAN unit tests for tag-based KASAN
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 6 Jul 2020 14:59:15 +0800
In-Reply-To: <CACT4Y+akZ5iu2ohQhRqiUd8zkew-NmrUPrA=xYtS1xxHWZ60Og@mail.gmail.com>
References: <20200706022150.20848-1-walter-zh.wu@mediatek.com>
 <CACT4Y+akZ5iu2ohQhRqiUd8zkew-NmrUPrA=xYtS1xxHWZ60Og@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_030136_887292_A26AC7D6 
X-CRM114-Status: GOOD (  31.04  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>, Andrey
 Konovalov <andreyknvl@google.com>, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux-MM <linux-mm@kvack.org>, Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-06 at 08:19 +0200, Dmitry Vyukov wrote:
> On Mon, Jul 6, 2020 at 4:21 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > We use tag-based KASAN, then KASAN unit tests don't detect out-of-bounds
> > memory access. They need to be fixed.
> >
> > With tag-based KASAN, the state of each 16 aligned bytes of memory is
> > encoded in one shadow byte and the shadow value is tag of pointer, so
> > we need to read next shadow byte, the shadow value is not equal to tag
> > value of pointer, so that tag-based KASAN will detect out-of-bounds
> > memory access.
> >
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Cc: Alexander Potapenko <glider@google.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: Andrey Konovalov <andreyknvl@google.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
> >
> > changes since v1:
> > - Reduce amount of non-compiled code.
> > - KUnit-KASAN Integration patchset are not merged yet. My patch should
> >   have conflict with it, if needed, we can continue to wait it.
> >
> > ---
> >
> >  lib/test_kasan.c | 81 ++++++++++++++++++++++++++++++++++++++----------
> >  1 file changed, 64 insertions(+), 17 deletions(-)
> >
> > diff --git a/lib/test_kasan.c b/lib/test_kasan.c
> > index e3087d90e00d..660664439d52 100644
> > --- a/lib/test_kasan.c
> > +++ b/lib/test_kasan.c
> > @@ -40,7 +40,11 @@ static noinline void __init kmalloc_oob_right(void)
> >                 return;
> >         }
> >
> > -       ptr[size] = 'x';
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               ptr[size] = 'x';
> > +       else
> > +               ptr[size + 5] = 'x';
> > +
> 
> Hi Walter,
> 
> Would if be possible to introduce something like:
> 
> #define OOB_TAG_OFF (IS_ENABLED(CONFIG_KASAN_GENERIC) ? 0 : 8)
> 

It is good suggestion. Thanks.

> and then add it throughout as
> 
>         ptr[size + OOB_TAG_OFF] = 'x';
> 
> ?
> The current version results in quite some amount of additional code
> that needs to be read, extended  and maintained in the future. So I am
> thinking if it's possible to minimize it somehow...
> 

Ok, I will send next patch by your suggestion.

Thanks.

> >         kfree(ptr);
> >  }
> >
> > @@ -92,7 +96,11 @@ static noinline void __init kmalloc_pagealloc_oob_right(void)
> >                 return;
> >         }
> >
> > -       ptr[size] = 0;
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               ptr[size] = 0;
> > +       else
> > +               ptr[size + 6] = 0;
> > +
> >         kfree(ptr);
> >  }
> >
> > @@ -162,7 +170,11 @@ static noinline void __init kmalloc_oob_krealloc_more(void)
> >                 return;
> >         }
> >
> > -       ptr2[size2] = 'x';
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               ptr2[size2] = 'x';
> > +       else
> > +               ptr2[size2 + 13] = 'x';
> > +
> >         kfree(ptr2);
> >  }
> >
> > @@ -180,7 +192,12 @@ static noinline void __init kmalloc_oob_krealloc_less(void)
> >                 kfree(ptr1);
> >                 return;
> >         }
> > -       ptr2[size2] = 'x';
> > +
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               ptr2[size2] = 'x';
> > +       else
> > +               ptr2[size2 + 2] = 'x';
> > +
> >         kfree(ptr2);
> >  }
> >
> > @@ -216,7 +233,11 @@ static noinline void __init kmalloc_oob_memset_2(void)
> >                 return;
> >         }
> >
> > -       memset(ptr+7, 0, 2);
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               memset(ptr+7, 0, 2);
> > +       else
> > +               memset(ptr+15, 0, 2);
> > +
> >         kfree(ptr);
> >  }
> >
> > @@ -232,7 +253,11 @@ static noinline void __init kmalloc_oob_memset_4(void)
> >                 return;
> >         }
> >
> > -       memset(ptr+5, 0, 4);
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               memset(ptr+5, 0, 4);
> > +       else
> > +               memset(ptr+15, 0, 4);
> > +
> >         kfree(ptr);
> >  }
> >
> > @@ -249,7 +274,11 @@ static noinline void __init kmalloc_oob_memset_8(void)
> >                 return;
> >         }
> >
> > -       memset(ptr+1, 0, 8);
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               memset(ptr+1, 0, 8);
> > +       else
> > +               memset(ptr+15, 0, 8);
> > +
> >         kfree(ptr);
> >  }
> >
> > @@ -265,7 +294,11 @@ static noinline void __init kmalloc_oob_memset_16(void)
> >                 return;
> >         }
> >
> > -       memset(ptr+1, 0, 16);
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               memset(ptr+1, 0, 16);
> > +       else
> > +               memset(ptr+15, 0, 16);
> > +
> >         kfree(ptr);
> >  }
> >
> > @@ -281,7 +314,11 @@ static noinline void __init kmalloc_oob_in_memset(void)
> >                 return;
> >         }
> >
> > -       memset(ptr, 0, size+5);
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               memset(ptr, 0, size+5);
> > +       else
> > +               memset(ptr, 0, size+7);
> > +
> >         kfree(ptr);
> >  }
> >
> > @@ -415,7 +452,11 @@ static noinline void __init kmem_cache_oob(void)
> >                 return;
> >         }
> >
> > -       *p = p[size];
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               *p = p[size];
> > +       else
> > +               *p = p[size + 8];
> > +
> >         kmem_cache_free(cache, p);
> >         kmem_cache_destroy(cache);
> >  }
> > @@ -497,6 +538,7 @@ static noinline void __init copy_user_test(void)
> >         char __user *usermem;
> >         size_t size = 10;
> >         int unused;
> > +       size_t oob_size;
> >
> >         kmem = kmalloc(size, GFP_KERNEL);
> >         if (!kmem)
> > @@ -511,26 +553,31 @@ static noinline void __init copy_user_test(void)
> >                 return;
> >         }
> >
> > +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > +               oob_size = 1;
> > +       else
> > +               oob_size = 7;
> > +
> >         pr_info("out-of-bounds in copy_from_user()\n");
> > -       unused = copy_from_user(kmem, usermem, size + 1);
> > +       unused = copy_from_user(kmem, usermem, size + oob_size);
> >
> >         pr_info("out-of-bounds in copy_to_user()\n");
> > -       unused = copy_to_user(usermem, kmem, size + 1);
> > +       unused = copy_to_user(usermem, kmem, size + oob_size);
> >
> >         pr_info("out-of-bounds in __copy_from_user()\n");
> > -       unused = __copy_from_user(kmem, usermem, size + 1);
> > +       unused = __copy_from_user(kmem, usermem, size + oob_size);
> >
> >         pr_info("out-of-bounds in __copy_to_user()\n");
> > -       unused = __copy_to_user(usermem, kmem, size + 1);
> > +       unused = __copy_to_user(usermem, kmem, size + oob_size);
> >
> >         pr_info("out-of-bounds in __copy_from_user_inatomic()\n");
> > -       unused = __copy_from_user_inatomic(kmem, usermem, size + 1);
> > +       unused = __copy_from_user_inatomic(kmem, usermem, size + oob_size);
> >
> >         pr_info("out-of-bounds in __copy_to_user_inatomic()\n");
> > -       unused = __copy_to_user_inatomic(usermem, kmem, size + 1);
> > +       unused = __copy_to_user_inatomic(usermem, kmem, size + oob_size);
> >
> >         pr_info("out-of-bounds in strncpy_from_user()\n");
> > -       unused = strncpy_from_user(kmem, usermem, size + 1);
> > +       unused = strncpy_from_user(kmem, usermem, size + oob_size);
> >
> >         vm_munmap((unsigned long)usermem, PAGE_SIZE);
> >         kfree(kmem);
> > --
> > 2.18.0
> >
> > --
> > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://urldefense.com/v3/__https://groups.google.com/d/msgid/kasan-dev/20200706022150.20848-1-walter-zh.wu*40mediatek.com__;JQ!!CTRNKA9wMg0ARbw!zqGS_g-oLI7o6850GjV_P7YQPr8SufdeC8fbnt27o4WtvhX5PZ8-eZ6BWyF3bwm7Tizipw$ .

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
