Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FB0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Feb 2022 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ewU7ERBoTssl0txY4v+cwc3cKNtSg+Sov2JCD+5a1s=; b=sk+n4Lx808tHlw
	dver67Jg4PVRR2d1IC05wmy4P4tLwncNYq+TA9AjTc6k4N5YbKyoHBN2R62eCufX0uhpVnZ4EyW4K
	+9k22KkFJIr5eJGWkCEr4tHs+/ZRiB739c5EcSz3QNjyzQ26BmUB+6C8P3GR8hZkhw23/qB9qiGoN
	vs+KQCYhB5wxdBeCZq21yU8ebc//nJ2WRXF8N0luCHaGe4Hy9vcw6VzLPAGMGFkZ0WO2+iG6YFLce
	5zsLTGYsYBOgvHElpC05g2SvYqlmEqr62h6Nc75xcwhlEXHF08XsTz3PTbejLQ2Z2hM/B7UtTdSUg
	wzgMIuIGybVn04Ts1RCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFwSy-0044GW-Je; Fri, 04 Feb 2022 11:09:24 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFwSm-0044Ds-En
 for linux-mediatek@lists.infradead.org; Fri, 04 Feb 2022 11:09:14 +0000
Received: by mail-lj1-x232.google.com with SMTP id c15so7936574ljf.11
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Feb 2022 03:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fF8mTd2pmhBF5RAYFm/abAs/390CCKWUzH/vxBmyCuw=;
 b=Qm3ePs5PTzeaH/qa0Q2egUZvLRYCnMkFvv/fKj5QkZzciiSQKCKTUUdPSJ3Pc0tOAS
 MhrifwdqWYRBpDTpFD7uH3aSRFNLf+7xEZRC7qmqNXodXhHqx1qj6Ry5vhAC5R/YvgH9
 6ClC3SSIe+SEpy0pq7TOyXLCwx0GKfgfVxs4oVQ4Fw/ylitoyKqQYqlRvJaS3Nv27uh6
 HULVW8hVbklMr/vDX61Do7cStaUggNNHKbfVDZ7Ky0GCKGgQ9Hgw1Y7W515sCWQpBWLI
 zWNKeibb7vJnCGmEeTBicCkNgOlaby5wioYXZZDiPZnwxewGwH0/EJeN2WQN9utaazgY
 yVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fF8mTd2pmhBF5RAYFm/abAs/390CCKWUzH/vxBmyCuw=;
 b=6DWBTh2CDx5Fvp4Y+cbYBAa5eLomHqh4TCnYE3TFM7zQzujDW5ImWy1wcQFk4F4kkx
 b45cdx67NEqOicJX0GCbOqLyXe1uvLeBc9P8RuEXwengyjOYI8PA7+AyFpwxaVA69f7m
 eU/DNQWr35eTK33lYZEziiP1zx+Ww0I2FOh8sdrGzaoZCrHI139GsJYeD+4QKis0xgAM
 0pXRdrquMpdp2nlhOpb/c2QugEMjLTnnnIR3jbH3qtGuKmpZSnmYiu59go8/R8An5uUT
 HgLnhL8bRCjJlevQOIZLREX0m2BInDBhYAI7QyNkgkHEFis15HfPQQyc1A//2wAp4fhA
 qsZA==
X-Gm-Message-State: AOAM530hz1hTRFyOZ9J9iJJgMv4nnNUdj+vBsPFPJSTDbZSYwjSlnscp
 w5VGg7rj8B7Uh759ojtjPA5/Decg7aep4ECsPCUWXw==
X-Google-Smtp-Source: ABdhPJwOZnJEtk/elcgbxLe+bNyDlUywLIw/TA+/NB0F5W2moDXZRY/U9dSPSC1OIOze1WlfMu7GBq3TmJ0qM3b09fU=
X-Received: by 2002:a05:651c:4cd:: with SMTP id
 e13mr1465252lji.511.1643972949543; 
 Fri, 04 Feb 2022 03:09:09 -0800 (PST)
MIME-Version: 1.0
References: <20220204093254.2467-1-phil.chang@mediatek.com>
In-Reply-To: <20220204093254.2467-1-phil.chang@mediatek.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 4 Feb 2022 16:38:58 +0530
Message-ID: <CAFA6WYNR_axHaFdbS3sy7pRYFOuTv7KyRe+aP8MywkGdh33NaQ@mail.gmail.com>
Subject: Re: [PATCH] optee: make tee_shm_register vmalloc supported
To: Phil Chang <phil.chang@mediatek.com>
Cc: jens.wiklander@linaro.org, matthias.bgg@gmail.com, 
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_030912_532684_41D68A0D 
X-CRM114-Status: GOOD (  23.15  )
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

Hi,

On Fri, 4 Feb 2022 at 15:03, Phil Chang <phil.chang@mediatek.com> wrote:
>
> This patch allowed the tee shm use vmalloc area buffer.
>
> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> ---
>
> Hi,
>
>  In some low-memory devices, it's hard to aquire large-orders pages,
>  this pathes is allowed user use scatter pages to register shm.

This kind of info should go into the commit description describing why
this change is needed.

>
>  Thanks.
>
>  drivers/tee/optee/call.c |  2 +-
>  drivers/tee/tee_shm.c    | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
>

Also, I would like this patch to be rebased on top of SHM updates
series [1] from Jens as there has been a lot of refactoring touching
these files.

[1] https://lists.trustedfirmware.org/archives/list/op-tee@lists.trustedfirmware.org/thread/3J2IJX5LG2X4CZBYDLVA4PDVM4APMZSD/

-Sumit

> diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
> index b25cc1fac945..937bcc7df8e4 100644
> --- a/drivers/tee/optee/call.c
> +++ b/drivers/tee/optee/call.c
> @@ -362,7 +362,7 @@ int optee_check_mem_type(unsigned long start, size_t num_pages)
>          * Allow kernel address to register with OP-TEE as kernel
>          * pages are configured as normal memory only.
>          */
> -       if (virt_addr_valid(start))
> +       if (virt_addr_valid(start) || is_vmalloc_addr((void *)start))
>                 return 0;
>
>         mmap_read_lock(mm);
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 499fccba3d74..31d0c10485ff 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -195,6 +195,20 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
>         if (flags & TEE_SHM_USER_MAPPED) {
>                 rc = pin_user_pages_fast(start, num_pages, FOLL_WRITE,
>                                          shm->pages);
> +       } else if (is_vmalloc_addr((void *)start)) {
> +               struct page *page;
> +               int i;
> +
> +               for (i = 0; i < num_pages; i++) {
> +                       page = vmalloc_to_page((void *)(start + PAGE_SIZE * i));
> +                       if (!page) {
> +                               ret = ERR_PTR(-ENOMEM);
> +                               goto err;
> +                       }
> +                       get_page(page);
> +                       shm->pages[i] = page;
> +               }
> +               rc = num_pages;
>         } else {
>                 struct kvec *kiov;
>                 int i;
> --
> 2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
