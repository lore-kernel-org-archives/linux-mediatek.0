Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FE8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 23:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsCJf+W80m4JnOYQTNwvFXoXyL6yxh+A6mqqU7DJVBs=; b=1upg6ggoNyVDa8LFHk43B10Rbq
	XcNkTthXkW8sIESJdERmEfKGkldL+uZXSH0TWSh0rNmhF+AvdWpbiWFESgq3Iw0MNbvWu4U2tTTNk
	gqYVcsVPhNs3n5zxKPkCmD6LmfQWlKMzFA1ESYWd1YlqSRB2wf15MpDKTY2eG7ekDcuVjxLFWeZYU
	KaTQPC7QspvedcYdJIZMQw1UIqlCRQybktIMvBNO2UnqZzA9CzuhKAeG92XK9rdNfdmLDtx+0ycLa
	KxT/7cYfS+1YpcbKomg8qjxY4ZxmQ3zaS3a2WWBWyPUgQkbLdgMXfKPrz4et3cU32zi9M37Lo22cf
	sQSaPSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUpJ-00BDD5-Ih; Fri, 15 Jul 2022 23:34:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUo1-00BCOJ-EP; Fri, 15 Jul 2022 23:33:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 96AAAB82F01;
	Fri, 15 Jul 2022 23:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B59C34115;
	Fri, 15 Jul 2022 23:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1657927986;
	bh=C2b3YLrjkNeagDR8DxwpKkhSaFC5JfY7+Rq4F/K+LUM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FEnapZq/UkEN2jjYPl8+26kKS3k5gOPiKVO0480IXNXy2jy8Fv0LNLk5zZKQEjRrd
	 7uGrChARWx5XIGasYrEq7mh0U8jZqSDuZSVl6LlXXIqHcVq9FN9LzLQkQsozA42DTC
	 uB/aBzyjZrXApZE1z7dWbS9MuKm4D+hzdrGkWso0=
Date: Fri, 15 Jul 2022 16:33:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: yee.lee@mediatek.com, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, "open list:KFENCE" <kasan-dev@googlegroups.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Marco Elver <elver@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early
 allocated pool
Message-Id: <20220715163305.e70c8542d5e7d96c5fd87185@linux-foundation.org>
In-Reply-To: <CAMuHMdX=MTsmo5ZVa8ya3xmr4Mx7f0PB3gvFF42pdaTYB6-u5A@mail.gmail.com>
References: <20220628113714.7792-1-yee.lee@mediatek.com>
	<20220628113714.7792-2-yee.lee@mediatek.com>
	<CAMuHMdX=MTsmo5ZVa8ya3xmr4Mx7f0PB3gvFF42pdaTYB6-u5A@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_163309_685125_B72658C6 
X-CRM114-Status: GOOD (  19.93  )
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

On Fri, 15 Jul 2022 10:17:43 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Tue, Jun 28, 2022 at 1:42 PM <yee.lee@mediatek.com> wrote:
> > From: Yee Lee <yee.lee@mediatek.com>
> >
> > This patch solves two issues.
> >
> > (1) The pool allocated by memblock needs to unregister from
> > kmemleak scanning. Apply kmemleak_ignore_phys to replace the
> > original kmemleak_free as its address now is stored in the phys tree.
> >
> > (2) The pool late allocated by page-alloc doesn't need to unregister.
> > Move out the freeing operation from its call path.
> >
> > Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> > Suggested-by: Marco Elver <elver@google.com>
> > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> 
> Thank you, this fixes the storm of
> 
>     BUG: KFENCE: invalid read in scan_block+0x78/0x130
>     BUG: KFENCE: use-after-free read in scan_block+0x78/0x130
>     BUG: KFENCE: out-of-bounds read in scan_block+0x78/0x130
> 
> messages I was seeing on arm64.

Thanks, but...

- It would be great if we could identify a Fixes: for this.

- This patch has been accused of crashing the kernel:

	https://lkml.kernel.org/r/YsFeUHkrFTQ7T51Q@xsang-OptiPlex-9020

  Do we think that report is bogus?

