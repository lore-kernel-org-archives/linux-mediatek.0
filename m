Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE14C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:31:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71C5664FB2
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71C5664FB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E3PjgXqKO/U9IvjPSWCgCnkbGZv7y4UCVU+Bgj3EPko=; b=RXd/HotkJpbqAXzJDFaS9zoiu
	efGwPhL37PIXNP1JpB/NKkNWc7odagHWxbSkFdgwYbcKVcgVSPXJB9CZolhaSIu2tHNqxeTv0dxxY
	LxM8Txt3rtrvMyudW74SGtgoh6Rz9K4Qs0K6rZc9KMYHqRlwOx2wHgvD6bIPg/iWLfmbK9n87ikac
	rSpT7RIsUE66FXFNdHtS7jEZpMJuJO/8qf0yUw5tfgtp/hR9wBctM4QP+i5KQ75QvmuEBmykajNFz
	SXVAqqggqim72QbyR6JrnYDEVKtZvXIEb6/wfmj1Y+ReFbROtc+/0pUt89JZR4SUE4uKhcP0ZpPBT
	pOD3XR9zA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKipG-00BewY-Qz; Fri, 12 Mar 2021 14:31:38 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKip4-00BeuJ-8o
 for linux-mediatek@lists.infradead.org; Fri, 12 Mar 2021 14:31:30 +0000
Received: by mail-pf1-x431.google.com with SMTP id j12so1959588pfj.12
 for <linux-mediatek@lists.infradead.org>; Fri, 12 Mar 2021 06:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=87q9jccx8BT/1UJYduCnIq9RvFzXmVQYDuCBWc/EFfo=;
 b=vbw+LKbbjclyBg6+aa4R4rytJMpDYAjHpqS2eNNad9ebfKSnOKO05u+uX1AN4+MU4d
 YYX0K6uB1LiA32oNsjVpB0S15zxIv+gphscDNMgfM2JGp5JQ8usU/Pb7qdeUesJlaQ+6
 oC5DU8VdGH/omJgvldh90PGo/frhXEDUJ8L0Ek4IROU2sbVsAMj4Kxu3fn3wXXInfJou
 K/8hjTH8Mq8619s0G3cmY8+3UoGKFHex+s5/nrZpbEpdjidi5rL9QoVm05Iyav76D1zY
 yDh7lJp+ei+wCNwL7Ma0kKhBqH/yqvv1/8/A17SXELqAT7onBlhwRQedrWzMHdq30Mu2
 jrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=87q9jccx8BT/1UJYduCnIq9RvFzXmVQYDuCBWc/EFfo=;
 b=BOMnD6MGZYVnYwi9I463xvD4qrvxTtfE21mennvd4t5uNwH89URVWUM91vzJKtr1xU
 jRzWkboiEwpboBo5Sr3kSI/dClnTblxA9hOw55fUTj1jAKnM5csom2o02HRnSiD6iP7u
 eXQe1r85nel02/IwmC6V2eb+9y2TonWriuPju9OYFS/iQ8GYS8QsnKrH5YvQsc8yy2rR
 9zgGN3SGfffb97UpLJkCAOsNe6LABzeZ2BFLADbul9h2Oe4AprWHvGOaOrgnl1NJGy+q
 eK45OpvVCdX+IlcjVje3IPtwAbY09xS2MCIOXhB3RE2fnEX5d1jPHJO+N+zWAd8ZTUx3
 iQpw==
X-Gm-Message-State: AOAM531MGkdj95H8khRXxOVZmc8zeDtZP0HarXQ231ElSzjQeqHFzAL9
 UrZO37VyyAdf443qfh3rgEc5olEpjdcgI+K1poIz1Q==
X-Google-Smtp-Source: ABdhPJxds7YesawTpwHPzA8UcCXWE1vPkg2gDONJqSrSOurgAFvoZfgOpYL1K7Qs0JMruuuugiNipf8QqJ+AAxPLg3c=
X-Received: by 2002:aa7:91d1:0:b029:1fe:2a02:73b9 with SMTP id
 z17-20020aa791d10000b02901fe2a0273b9mr10366246pfa.2.1615559483690; Fri, 12
 Mar 2021 06:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20210226012531.29231-1-walter-zh.wu@mediatek.com>
 <1614772099.26785.3.camel@mtksdccf07> <1615426365.20483.4.camel@mtksdccf07>
 <20210310214552.6dcbcb224c0ba34f8e0a0a54@linux-foundation.org>
In-Reply-To: <20210310214552.6dcbcb224c0ba34f8e0a0a54@linux-foundation.org>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 12 Mar 2021 15:31:12 +0100
Message-ID: <CAAeHK+xBcFgft9yqNMEKs42tEWEDt4Za9n1_t95PAEiS7Cqibw@mail.gmail.com>
Subject: Re: [PATCH v4] kasan: remove redundant config option
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, kasan-dev <kasan-dev@googlegroups.com>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 wsd_upstream <wsd_upstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_143126_394207_6D4AB684 
X-CRM114-Status: GOOD (  12.21  )
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

On Thu, Mar 11, 2021 at 6:45 AM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 11 Mar 2021 09:32:45 +0800 Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> >
> > Hi Andrew,
> >
> > I see my v4 patch is different in the next tree now. please see below
> > information.
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ebced5fb0ef969620ecdc4011f600f9e7c229a3c
> > The different is in lib/Kconfig.kasan.
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/diff/lib/Kconfig.kasan?id=ebced5fb0ef969620ecdc4011f600f9e7c229a3c
> >
>
> They look the same to me.  I did have `int' for KASAN_STACK due to a
> merging mess, but I changed that to bool quite quickly.

There's still something wrong with this patch in the mm tree. The
KASAN_STACK option is duplicated in lib/Kconfig.kasan. Badly resolved
conflict with "kasan: fix KASAN_STACK dependency for HW_TAGS"?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
