Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1C9C54FCC
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 13:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA94206F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 13:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FcY3MsTp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UTEX4+n2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AA94206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOS3ypGemefi8sWLNDw/7229nv9MmOTBQ/b8dbGWH1U=; b=FcY3MsTpyAwVHZ
	oiweP8DxnOgG7U+Ns++DxnzVy0/sBEvm1LgQ79CsheyY9HvoQYxqjXo1GJZ+ePVZAU8aWZYqhRg0j
	cpHN++2vdbM0TD1TTyfVXgz/fnIOzmT8+RlFus3AAqnpQxsaiERk4b6AeiRQv8yWtWstHvsdLJj+B
	H93iegGCuB9M2RljDbphutmxsupnxZIcP/jv+XtfrAbdF3G6CrzoN9oHxLvZHC8Tt+7Q9SU1jiy5Y
	42p8ePZSwZNj9rxZediRVfd2D3G5wxWD4AubeuS6FOlr0k9LoPqWZ+Ln0edVWvT7iMfCT5VLah3tK
	6xonWsyOFBTAi95pLMzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQt6B-0002aD-7Z; Tue, 21 Apr 2020 13:38:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQt67-0002Yl-Kn; Tue, 21 Apr 2020 13:38:01 +0000
X-UUID: 7aef3cae0bc74e8ebfbf641041b22f82-20200421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JX00X8S2zWSDA5/Zsgs0O/ncM6aJvIG88Eh4mjiOiX4=; 
 b=UTEX4+n2pZQ0fF+O3YomMJTx5Chv4HrzbCXIH4djX0EtxWKEH0nnrPg/PkrPU8ht/SwiJIT0MmGZOUCbWQ8AD6mWxzrKWYedkpsHU7aQ3379tWU/sEGWrq8fmCOriTi+NVUEhlPVEuNzrPbOM7j7+msHHJjlTzkh/nctkzOcvLs=;
X-UUID: 7aef3cae0bc74e8ebfbf641041b22f82-20200421
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 473077511; Tue, 21 Apr 2020 05:37:33 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 06:37:51 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 21:37:52 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Apr 2020 21:37:48 +0800
Message-ID: <1587476272.5870.15.camel@mtksdccf07>
Subject: Re: [PATCH] kasan: fix KASAN unit tests for tag-based KASAN
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 21 Apr 2020 21:37:52 +0800
In-Reply-To: <CACT4Y+avYV1xoqB6V5XrQSs-p2s3mKKu+LZQc4EzPaW-jV+KaA@mail.gmail.com>
References: <20200421014007.6012-1-walter-zh.wu@mediatek.com>
 <CACT4Y+af5fegnN9XOUSkf_B62J5sf2ZZbUwYk=GxtSmAhF3ryQ@mail.gmail.com>
 <1587472005.5870.7.camel@mtksdccf07>
 <CACT4Y+avYV1xoqB6V5XrQSs-p2s3mKKu+LZQc4EzPaW-jV+KaA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BC3A44A52E9D8AE093BF388FD62DAE971AB1F492889557179C30B461B1F267482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_063759_856973_E9EF013A 
X-CRM114-Status: GOOD (  30.21  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 Patricia Alfonso <trishalfonso@google.com>, Andrey
 Konovalov <andreyknvl@google.com>, Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux-MM <linux-mm@kvack.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>, David Gow <davidgow@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-04-21 at 15:01 +0200, 'Dmitry Vyukov' via kasan-dev wrote:
> On Tue, Apr 21, 2020 at 2:26 PM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > Hi Dmitry,
> >
> > On Tue, 2020-04-21 at 13:56 +0200, Dmitry Vyukov wrote:
> > > On Tue, Apr 21, 2020 at 3:40 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > > >
> > > > When we use tag-based KASAN, then KASAN unit tests don't detect
> > > > out-of-bounds memory access. Because with tag-based KASAN the state
> > > > of each 16 aligned bytes of memory is encoded in one shadow byte
> > > > and the shadow value is tag of pointer, so we need to read next
> > > > shadow byte, the shadow value is not equal to tag of pointer,
> > > > then tag-based KASAN will detect out-of-bounds memory access.
> > > >
> > > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > > > Cc: Dmitry Vyukov <dvyukov@google.com>
> > > > Cc: Alexander Potapenko <glider@google.com>
> > > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > > Cc: Andrey Konovalov <andreyknvl@google.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > ---
> > > >  lib/test_kasan.c | 62 ++++++++++++++++++++++++++++++++++++++++++------
> > > >  1 file changed, 55 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/lib/test_kasan.c b/lib/test_kasan.c
> > > > index e3087d90e00d..a164f6b47fe5 100644
> > > > --- a/lib/test_kasan.c
> > > > +++ b/lib/test_kasan.c
> > > > @@ -40,7 +40,12 @@ static noinline void __init kmalloc_oob_right(void)
> > > >                 return;
> > > >         }
> > >
> > > Hi Walter,
> > >
> > > This would be great to have!
> > > But I am concerned about these series that port KASAN tests to KUNIT:
> > > https://lkml.org/lkml/2020/4/17/1144
> > > I suspect it will be one large merge conflict. Not sure what is the
> > > proper way to resovle this. I've added authors to CC.
> > >
> > Yes, it should have conflicts. Thanks for your reminder.
> > >
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > >         ptr[size] = 'x';
> > > > +#else
> > > > +       ptr[size + 5] = 'x';
> > > > +#endif
> > > > +
> > >
> > > For this particular snippet I think we can reduce amount of idef'ery
> > > and amount of non-compiled code in each configuration with something
> > > like:
> > >
> > >   ptr[size + 5] = 'x';
> > >   if (ENABLED(CONFIG_KASAN_GENERIC))
> > >       ptr[size] = 'x';
> > >
> > > One check runs always (it should pass in both configs, right?). The
> >
> > There is a problem, With generic KASAN it may trigger two KASAN reports.
> 
> Why is this a problem? If there are 2, fine. KUNIT can check that if
> we expect 2, there are indeed 2.
> 
Sorry, I originally assume my patch doesn't include in KUNIT. so I think
there is a problem. but I know your meaning. Can my patch upstream
first?

> > if we change it like:
> >
> > if (ENABLED(CONFIG_KASAN_GENERIC))
> >     ptr[size] = 'x';
> > else
> >     ptr[size + 5] = 'x';
> >
> > > only only in GENERIC, but it's C-level if rather than preprocessor.
> > > KUNIT should make 2 bugs per test easily expressable (and testable).
> > >
> >
> > >
> > >
> > >
> > > >         kfree(ptr);
> > > >  }
> > > >
> > > > @@ -92,7 +97,12 @@ static noinline void __init kmalloc_pagealloc_oob_right(void)
> > > >                 return;
> > > >         }
> > > >
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > >         ptr[size] = 0;
> > > > +#else
> > > > +       ptr[size + 6] = 0;
> > > > +#endif
> > > > +
> > > >         kfree(ptr);
> > > >  }
> > > >
> > > > @@ -162,7 +172,11 @@ static noinline void __init kmalloc_oob_krealloc_more(void)
> > > >                 return;
> > > >         }
> > > >
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > >         ptr2[size2] = 'x';
> > > > +#else
> > > > +       ptr2[size2 + 13] = 'x';
> > > > +#endif
> > > >         kfree(ptr2);
> > > >  }
> > > >
> > > > @@ -180,7 +194,12 @@ static noinline void __init kmalloc_oob_krealloc_less(void)
> > > >                 kfree(ptr1);
> > > >                 return;
> > > >         }
> > > > +
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > >         ptr2[size2] = 'x';
> > > > +#else
> > > > +       ptr2[size2 + 2] = 'x';
> > > > +#endif
> > > >         kfree(ptr2);
> > > >  }
> > > >
> > > > @@ -216,7 +235,11 @@ static noinline void __init kmalloc_oob_memset_2(void)
> > > >                 return;
> > > >         }
> > > >
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > >         memset(ptr+7, 0, 2);
> > > > +#else
> > > > +       memset(ptr+15, 0, 2);
> > > > +#endif
> > > >         kfree(ptr);
> > > >  }
> > > >
> > > > @@ -232,7 +255,11 @@ static noinline void __init kmalloc_oob_memset_4(void)
> > > >                 return;
> > > >         }
> > > >
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > >         memset(ptr+5, 0, 4);
> > > > +#else
> > > > +       memset(ptr+15, 0, 4);
> > > > +#endif
> > > >         kfree(ptr);
> > > >  }
> > > >
> > > > @@ -249,7 +276,11 @@ static noinline void __init kmalloc_oob_memset_8(void)
> > > >                 return;
> > > >         }
> > > >
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > >         memset(ptr+1, 0, 8);
> > > > +#else
> > > > +       memset(ptr+15, 0, 8);
> > > > +#endif
> > > >         kfree(ptr);
> > > >  }
> > > >
> > > > @@ -265,7 +296,11 @@ static noinline void __init kmalloc_oob_memset_16(void)
> > > >                 return;
> > > >         }
> > > >
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > >         memset(ptr+1, 0, 16);
> > > > +#else
> > > > +       memset(ptr+15, 0, 16);
> > > > +#endif
> > > >         kfree(ptr);
> > > >  }
> > > >
> > > > @@ -281,7 +316,11 @@ static noinline void __init kmalloc_oob_in_memset(void)
> > > >                 return;
> > > >         }
> > > >
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > >         memset(ptr, 0, size+5);
> > > > +#else
> > > > +       memset(ptr, 0, size+7);
> > > > +#endif
> > > >         kfree(ptr);
> > > >  }
> > > >
> > > > @@ -415,7 +454,11 @@ static noinline void __init kmem_cache_oob(void)
> > > >                 return;
> > > >         }
> > > >
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > >         *p = p[size];
> > > > +#else
> > > > +       *p = p[size + 8];
> > > > +#endif
> > > >         kmem_cache_free(cache, p);
> > > >         kmem_cache_destroy(cache);
> > > >  }
> > > > @@ -497,6 +540,11 @@ static noinline void __init copy_user_test(void)
> > > >         char __user *usermem;
> > > >         size_t size = 10;
> > > >         int unused;
> > > > +#ifdef CONFIG_KASAN_GENERIC
> > > > +       size_t oob_size = 1;
> > > > +#else
> > > > +       size_t oob_size = 7;
> > > > +#endif
> > > >
> > > >         kmem = kmalloc(size, GFP_KERNEL);
> > > >         if (!kmem)
> > > > @@ -512,25 +560,25 @@ static noinline void __init copy_user_test(void)
> > > >         }
> > > >
> > > >         pr_info("out-of-bounds in copy_from_user()\n");
> > > > -       unused = copy_from_user(kmem, usermem, size + 1);
> > > > +       unused = copy_from_user(kmem, usermem, size + oob_size);
> > > >
> > > >         pr_info("out-of-bounds in copy_to_user()\n");
> > > > -       unused = copy_to_user(usermem, kmem, size + 1);
> > > > +       unused = copy_to_user(usermem, kmem, size + oob_size);
> > > >
> > > >         pr_info("out-of-bounds in __copy_from_user()\n");
> > > > -       unused = __copy_from_user(kmem, usermem, size + 1);
> > > > +       unused = __copy_from_user(kmem, usermem, size + oob_size);
> > > >
> > > >         pr_info("out-of-bounds in __copy_to_user()\n");
> > > > -       unused = __copy_to_user(usermem, kmem, size + 1);
> > > > +       unused = __copy_to_user(usermem, kmem, size + oob_size);
> > > >
> > > >         pr_info("out-of-bounds in __copy_from_user_inatomic()\n");
> > > > -       unused = __copy_from_user_inatomic(kmem, usermem, size + 1);
> > > > +       unused = __copy_from_user_inatomic(kmem, usermem, size + oob_size);
> > > >
> > > >         pr_info("out-of-bounds in __copy_to_user_inatomic()\n");
> > > > -       unused = __copy_to_user_inatomic(usermem, kmem, size + 1);
> > > > +       unused = __copy_to_user_inatomic(usermem, kmem, size + oob_size);
> > > >
> > > >         pr_info("out-of-bounds in strncpy_from_user()\n");
> > > > -       unused = strncpy_from_user(kmem, usermem, size + 1);
> > > > +       unused = strncpy_from_user(kmem, usermem, size + oob_size);
> > > >
> > > >         vm_munmap((unsigned long)usermem, PAGE_SIZE);
> > > >         kfree(kmem);
> > > > --
> > > > 2.18.0
> > > >
> > > > --
> > > > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > > > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > > > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200421014007.6012-1-walter-zh.wu%40mediatek.com.
> >
> > --
> > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/1587472005.5870.7.camel%40mtksdccf07.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
