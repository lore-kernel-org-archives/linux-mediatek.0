Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD65C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+ImQjEp3uxMnJ06//veofoeIUWLe4XOE0Xosn2SIvE=; b=trayE6OMvShLQo
	jNO+i0CUWNXJvbfiqnq+bd2vPlMXUGwwjfu6LuWuUta0Otp5wtpK4vqQt+wxEUwU9v1+ZHrULNOdN
	+TRmi+NHTBVuO8Sf+bvndGWGMRqJ1R6ezhRrw+2NnFBJvPiLpnj3lhHqvUV7l9htqWr65FtG2Yt5K
	2KF7BkRHwbtogpy+AMmQg+w3beFqPdXbKlwPDQ45zInILCtwT8/kT3RB8NNIqLBa4voRWuQrhX2yy
	GPDVMSLSIzYzWpe8ycaNd8N5jWP8wu2GHmCo9Z2eGVZSYQSm7OKQtRIV9RXUtDiXMiTf7DAqTf+x5
	rgul/wD+k4OLFR+Vtc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMn7-00A3w1-JL; Thu, 07 Apr 2022 07:42:53 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncMmu-00A3qZ-01
 for linux-mediatek@lists.infradead.org; Thu, 07 Apr 2022 07:42:41 +0000
Received: by mail-pf1-x433.google.com with SMTP id s2so4726804pfh.6
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Apr 2022 00:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mmGJug9XSvLc9UYs1snhVqbU1zFE1jKfOiCb4bT1Xyg=;
 b=TJToiuxAPxO5gLD+PPdeYwNbEDsymoriISgGQMYm42U8IwVbKx0WrqMGHSbilyJb3S
 Sqx8moZPwNEVW7CPcU5qbbHcrA0xQOqYjV89Wyq8q5k7yhUR3jNKvMsf49IBMStV1adY
 0tLWB2SF/fBoQg0g7VDy3KaG1MXvzAqSBVaH8MvY5KPrr2+sxqZRxeE6HWkmfg13mQd7
 P/B0GqanU/0MUAx2Btjd8XvipjUR9DBmUrexqTgtO3+JkCR2ICJAgzqepmSKESe4zv2d
 3AkbJCIC7jZ6k2H/o4TIb3Iz/UOACOY2Sbl/8Qn2z/e8iLCQYt4s85+wfUXPT89oZftL
 2htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mmGJug9XSvLc9UYs1snhVqbU1zFE1jKfOiCb4bT1Xyg=;
 b=D45/DiJwQybuhkzqYk93klj6swjkeUnYjr58X30IugdmCgsUnE9nIz69izpOhdRjQu
 41p3HuQDPfgeZc+k0Nt3674mc9/kAbuZzw4PU+vRZbUrwl3hVo47kUzoKRpatnWGax8V
 Abeyayn3nm8Zz0kSsEbCESPE0ONf/0IAoe1bLnXGnDu65U7PSanavmvLqLGxpysCMxI0
 ei4GwKzIolbYU4JLIAJRzXVudJQuf8khvnSWqu8lW11qGgehhFz7CJZpM33PMWAV6tqX
 Oasg8bL2HsycnwKG6RpoXiClvJ9oBR5dPnVlfhhw7e3ZcpNsATNKf69gLu1QulUQHt0G
 cg5Q==
X-Gm-Message-State: AOAM5321oM5QLdYJwU+Uoh6QgN1hbIS9F/0OaEyZVXqX4j3GWLLkaj0R
 shPl9A0gEOOKg5yl388BELlAtXruzYVXid43zqVm+Q==
X-Google-Smtp-Source: ABdhPJzL4k8cNQVWa4KDJhE14ZI813y48fsqof0zEaw00HIk2pdqyRAXsd/G22FnKYSuMAjQx3qQezRJ+iq5Yv+hb1A=
X-Received: by 2002:a05:6a00:995:b0:4fb:607d:444c with SMTP id
 u21-20020a056a00099500b004fb607d444cmr12738497pfg.69.1649317355656; Thu, 07
 Apr 2022 00:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAHUa44GDg7hAAFsmeOOkeqi8_1P1Q6jATRdnV9b6S-DhpEEQrA@mail.gmail.com>
 <20220406144028.4203-1-phil.chang@mediatek.com>
In-Reply-To: <20220406144028.4203-1-phil.chang@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 7 Apr 2022 09:42:24 +0200
Message-ID: <CAHUa44GDp=GSP5D=eCowZv09Ws_j44Y7mc=dY3eFAf0uLQBsRA@mail.gmail.com>
Subject: Re: Re: [PATCH v4] tee: make tee_shm_register_kernel_buf vmalloc
 supported
To: Phil Chang <Phil.Chang@mediatek.com>
Cc: sumit.garg@linaro.org, matthias.bgg@gmail.com, 
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_004240_100275_8DF87350 
X-CRM114-Status: GOOD (  26.66  )
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

Hi Phil,

On Wed, Apr 6, 2022 at 4:40 PM Phil Chang <phil.chang@mediatek.com> wrote:
>
> > On Fri, Feb 25, 2022 at 4:20 PM Phil Chang <phil.chang@mediatek.com>
> > wrote:
> >>
> >> In some low-memory devices, it's hard to aquire large-orders pages,
> >> this patch allowed user using scatter pages to register shm.
> >>
> >> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> >> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
> >> ---
> >>  drivers/tee/optee/call.c |  2 +-
> >>  drivers/tee/tee_shm.c    | 35 +++++++++++++++++++++++++----------
> >>  2 files changed, 26 insertions(+), 11 deletions(-)
> >
> > Looks good to me. Unfortunately this is too late for the coming merge
> > window, so it's going to be the one after that. Meanwhile it will be
> > in linux-next.
> >
> > Thanks,
> > Jens
>
>  Hi Jens
>    thanks for your review, did I push again wile merge window open ?
>    Or just wait ?

Just wait. You should be able to see it in linux-next for now.

Cheers,
Jens

>
>  Thanks
>
> >>
> >> diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
> >> index bd49ec934060..2082e632adff 100644
> >> --- a/drivers/tee/optee/call.c
> >> +++ b/drivers/tee/optee/call.c
> >> @@ -362,7 +362,7 @@ int optee_check_mem_type(unsigned long start,
> >> size_t num_pages)
> >>          * Allow kernel address to register with OP-TEE as kernel
> >>          * pages are configured as normal memory only.
> >>          */
> >> -       if (virt_addr_valid(start))
> >> +       if (virt_addr_valid(start) || is_vmalloc_addr((void *)start))
> >>                 return 0;
> >>
> >>         mmap_read_lock(mm);
> >> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> >> index f31e29e8f1ca..836872467dc6 100644
> >> --- a/drivers/tee/tee_shm.c
> >> +++ b/drivers/tee/tee_shm.c
> >> @@ -23,21 +23,36 @@ static void shm_put_kernel_pages(struct page
> >> **pages, size_t page_count)
> >>  static int shm_get_kernel_pages(unsigned long start, size_t
> >>  page_count,
> >>                                 struct page **pages)
> >>  {
> >> -       struct kvec *kiov;
> >>         size_t n;
> >>         int rc;
> >>
> >> -       kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
> >> -       if (!kiov)
> >> -               return -ENOMEM;
> >> +       if (is_vmalloc_addr((void *)start)) {
> >> +               struct page *page;
> >>
> >> -       for (n = 0; n < page_count; n++) {
> >> -               kiov[n].iov_base = (void *)(start + n * PAGE_SIZE);
> >> -               kiov[n].iov_len = PAGE_SIZE;
> >> -       }
> >> +               for (n = 0; n < page_count; n++) {
> >> +                       page = vmalloc_to_page((void *)(start +
> >> PAGE_SIZE * n));
> >> +                       if (!page)
> >> +                               return -ENOMEM;
> >> +
> >> +                       get_page(page);
> >> +                       pages[n] = page;
> >> +               }
> >> +               rc = page_count;
> >> +       } else {
> >> +               struct kvec *kiov;
> >> +
> >> +               kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
> >> +               if (!kiov)
> >> +                       return -ENOMEM;
> >>
> >> -       rc = get_kernel_pages(kiov, page_count, 0, pages);
> >> -       kfree(kiov);
> >> +               for (n = 0; n < page_count; n++) {
> >> +                       kiov[n].iov_base = (void *)(start + n *
> >> PAGE_SIZE);
> >> +                       kiov[n].iov_len = PAGE_SIZE;
> >> +               }
> >> +
> >> +               rc = get_kernel_pages(kiov, page_count, 0, pages);
> >> +               kfree(kiov);
> >> +       }
> >>
> >>         return rc;
> >>  }
> >> --
> >> 2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
