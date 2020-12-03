Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF69C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 20:29:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8457C221EA
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 20:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8457C221EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tSPvZ3GwXXci7u1UmfF/pbtVeBNdyQJp/+hYwKxWgLU=; b=ApvRUI2Ytp03vXOBD9z+GwItw
	7GNgs+uqSCFW+ovu+gEZQAPeYcoZGdx/OcZmu24a6a/T3Fe1X1tiboaXh8FCvlXXA3Tn9UbgmtbvX
	B7JQobDsMRbsx6KM2e6X1N9iFw9xeNvtQdzeAAGe9v2wawZYeKakvPlS71ppQyJROBeLYiqbpTZ5c
	7btlxekszJYSNoJiuQ0x3BvACh/ORssXd/yAb40/IVSAm6PSVivQjg49wZ26wMvTaPujOmDFrWWrl
	GQlqHmWfhYjeod8t78/HeJXM+m7Kz/3CAehZnIJzrTJ2TNfPKCy570BvzAKAyUgvai4Mj1zcgGqU3
	6AsECSckg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkvDq-0005WW-Hu; Thu, 03 Dec 2020 20:29:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkvDl-0005V8-KH; Thu, 03 Dec 2020 20:28:58 +0000
Date: Thu, 3 Dec 2020 12:28:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1607027336;
 bh=3GM43n+ykpZXsrys2IYlOfIbVi376Zl7mMWmJ3lZbYw=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=n364KfYSfk6dKoaT1hGl5ZKC4bJ+y4HlL5vvt+0xHoc+94/W/P+VkpbB/m8OCXizm
 BQ/475H+qPEnifOSp+z7qF8dfi5erHXmT4iWeGmEV4w6HS6pEwXFbyyPoY6YBY/WOQ
 R7dWLpju9pF/P10HGLjtZQXyY4dLFnzx8XC0pcZ8=
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v3 1/1] kasan: fix object remain in offline per-cpu
 quarantine
Message-Id: <20201203122854.c8d5ed270ec9cfc7c17569d9@linux-foundation.org>
In-Reply-To: <CAAeHK+z+DPNysrUwfeu27h6sKdn5DDE=BL4t96KiF0mRBNPs+Q@mail.gmail.com>
References: <1606895585-17382-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <1606895585-17382-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <CAAeHK+z+DPNysrUwfeu27h6sKdn5DDE=BL4t96KiF0mRBNPs+Q@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_152857_873155_2C4A60B8 
X-CRM114-Status: GOOD (  10.89  )
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
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Miles Chen <miles.chen@mediatek.com>, kasan-dev <kasan-dev@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Nicholas Tang <nicholas.tang@mediatek.com>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 3 Dec 2020 13:46:59 +0100 Andrey Konovalov <andreyknvl@google.com> wrote:

> >  #define QLIST_INIT { NULL, NULL, 0 }
> > @@ -188,6 +190,11 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
> >         local_irq_save(flags);
> >
> >         q = this_cpu_ptr(&cpu_quarantine);
> > +       if (q->offline) {
> > +               qlink_free(&info->quarantine_link, cache);
> 
> Hi Kuan-Ying,
> 
> This needs to be rebased onto the mm tree: it has some KASAN patches
> that touch this code and rename the info variable to meta.

Yup.  I'm taking care of that.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
