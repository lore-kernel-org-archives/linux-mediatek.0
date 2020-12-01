Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDECBC64E7B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 08:00:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 581032087C
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 08:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jkTv5eFL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="wJyxFNus"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 581032087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zant//QhHmWN8ZygeBo1le9hWbH6aPvH9z+i7SOaoco=; b=jkTv5eFL/krCAnAiirV/V/KVi
	MmCV/mfq2/BZ/GZd2AT3e3Bip2HItSjqdUQFDA8j/fq0H9nBuW83wYgQ+BFR8veltwERJBnxX4Mpo
	xxgiBJEcoweaHVSyr8FvwXqur1YS0JSMyT5jZDlfOM3+K4jPg+Ob4QRI5QXHA2lEQD2bimq9wy5tr
	m/o3Uckx6ViG2Dlj8EzIm5wsCnzz5BcALV4921jwKOQMEfnwu8MFnVYQO4nYqDqSbTqwztECG51Hg
	OQd2ETULQNrIA7GVzk4mEqruUkQZp1bp9l2U2Z5ipg8OD3B/9myQvSNjaBe88YlhZSBjt3862DGeT
	/IvapnJLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk0a7-0003pw-Bc; Tue, 01 Dec 2020 08:00:15 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk0a5-0003pI-2V
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 08:00:13 +0000
Received: by mail-qk1-x743.google.com with SMTP id y18so493368qki.11
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Dec 2020 00:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wB450hvW9e7AfsLXXAZocstx55cLQvcfr6fR43xbcBE=;
 b=wJyxFNusdsDuwyAi69WN0ezTnUmElXIC+bVx2NKOZEzaA8KH5HMYRqHg18PLQ0eGWk
 kvWswi+j5rfOaoQwyLdZa3sBAJGk3mh+pORozELpaPkKZJNu+0+PJgLXbgr4dACsOCzx
 c8mOQmBc8zpik3P2XGadEWG10Syl0Cg6qi/YDuAAw29NYGbY8jpNw/lXH7HEx4yZPYKg
 cs7ZlM5JEz2qTZel7RGDRxnrGxMtFyLDr50t3lwDZWiLt37dqlJ+AjDc5feTUsL3M9rq
 IUY9087nM8OUj/xNO4f3S+6cGEhjQIpS67xHKa5BnzjWzGbspo6TfrENqDL18gUmdfmQ
 LaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wB450hvW9e7AfsLXXAZocstx55cLQvcfr6fR43xbcBE=;
 b=mDJy2rtV9EFyO4aP7xUJLVMIErgdzVVkWxD9hBxnkHkEsUK7uhCKfc+ix83zVFisdF
 b5FeUsvK2J3bYxdONMohxf9iVYb5v/RLmX6LaCThDKjKo0SgIDsCdLeEwaiTIjQoqIfR
 zg8kXt6Moif8NZolQ1vX9QTsSKGlYYpH/4UGESIfwJUKaPz/lAcASkpuqkEFTLQOaZ0E
 kpigT+W5BmGWyfoNszTeim6NOl3gL0YV7J+bQMhLEHu6n5XPll1F3klG21mMjYrPUKk6
 0hu3KI2rTFYLoMyrfVxFLpEc6zGoJse5vnnPCIkLw+di6L15L25u5Sc28TDmYhW25FES
 ExOw==
X-Gm-Message-State: AOAM530D4bL/rH718rlyDMQizTlVRfoQ27y421o9LXv1l6yfkNwONyos
 xEI1pB87HhiYKYJ9wkOJn/H5bV9eOjONOftQ3zGAqg==
X-Google-Smtp-Source: ABdhPJwXCE/d50QhUxDFlhDrKxp4+IR+1osE3SkqrUY+gAQJxO0ZPDV+UCHZE+6eX+bpLCu4GF1xWLqDqUEdyUloNII=
X-Received: by 2002:a37:7b44:: with SMTP id w65mr1641518qkc.350.1606809611184; 
 Tue, 01 Dec 2020 00:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
 <87h7rfi8pn.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87h7rfi8pn.fsf@nanos.tec.linutronix.de>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 1 Dec 2020 08:59:59 +0100
Message-ID: <CACT4Y+a=GmYVZwwjyXwO=_AeGy4QB9X=5x7cL76erwjPvRW6Zw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] kasan: add workqueue and timer stack for generic
 KASAN
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_030013_170368_37EE289C 
X-CRM114-Status: GOOD (  17.09  )
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
 wsd_upstream <wsd_upstream@mediatek.com>, Linux-MM <linux-mm@kvack.org>,
 Stephen Boyd <sboyd@kernel.org>, Alexander Potapenko <glider@google.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Marco Elver <elver@google.com>,
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 John Stultz <john.stultz@linaro.org>, Andrey Konovalov <andreyknvl@google.com>,
 Tejun Heo <tj@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 5:29 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Thu, Sep 24 2020 at 12:01, Walter Wu wrote:
> > Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
> > In some of these access/allocation happened in process_one_work(),
> > we see the free stack is useless in KASAN report, it doesn't help
> > programmers to solve UAF on workqueue. The same may stand for times.
> >
> > This patchset improves KASAN reports by making them to have workqueue
> > queueing stack and timer stack information. It is useful for programmers
> > to solve use-after-free or double-free memory issue.
> >
> > Generic KASAN also records the last two workqueue and timer stacks and
> > prints them in KASAN report. It is only suitable for generic KASAN.

Walter, did you mail v5?
Checking statuses of KASAN issues and this seems to be not in linux-next.

> > [1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
> > [2]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22%20expire_timers
>
> How are these links useful for people who do not have a gurgle account?

This is a public mailing list archive, so effectively the same way as
lore links ;)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
