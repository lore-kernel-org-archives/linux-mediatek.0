Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD40C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 05:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhUnDu5afKjtRsbNpzLivHcyOUf0w5sScG12iSZxwks=; b=jcFQxe8jNrIStm
	SK5+QovLIQBK8mH/SUKllKP6pRXpSOclhGdAF90AmfFN1/lCAVfxIGkzLsuTurZY032bzvM7tze9Y
	KW25mZ/PS7CHmXhqSERZQVL2NoEVGFRKQ+cgdUFdi2dU+xUUIAg9xYJ6H6ujONtdmDrRDDDcteK00
	TSfns29wAPyUVar5VpdaQrKV+/NvpaKr8bBZYk/wVEXQx3jrRVWYWjXD4cWuEvqibZT2TKufdSQ59
	eRk3drKtMhxlRY51+3nmHgBNis7bTjNB54+h8QzYVjnbThxmU5sUSVrYc0Fkm9RUU0OvmvFI9GQBk
	tmuUEVxk4tFoicFyxLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM1jg-003ZSQ-Qx; Mon, 21 Feb 2022 05:59:48 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM1jZ-003ZPW-FA
 for linux-mediatek@lists.infradead.org; Mon, 21 Feb 2022 05:59:43 +0000
Received: by mail-lf1-x136.google.com with SMTP id b9so16589324lfv.7
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Feb 2022 21:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z3epHuUYfz+WUAI/LAxK3vgXKIpB82CcxkhBmhauKLc=;
 b=Gdf1eQMxTIf+KJfkNJ1tawz7LJdaENEUBQlsbA/YqS9D0+LexQ4E3qAbP22oj7o1a7
 Bn9pw+0SyArLWzePBxy8J7t3vndI82jDKSB+9zgjVcRM7l9rFyTbtg02NZvNjuDEMffP
 TQ4XjNbgD80wurfeSqpb3VSbVSg7DKeWhYSeKD/6mXqz8s5zOvg7wwA1BgvgHBAOw6wt
 1dFpug5qRLI+Qis6eEyR6bMEKckuXTQTkF4TQ4VsZlmxHzVYkfVXNzo8Oav0ehsOgfyL
 oE436/LNzxVnicfKH9NhedWD8HAJWAFQ1O/7xUfQZjgU8ayLgQH7QZ9YTkUXzzHruFjy
 o8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3epHuUYfz+WUAI/LAxK3vgXKIpB82CcxkhBmhauKLc=;
 b=yoGuGXVJSgMl9eiu7CmNKuHFT2gncakXFv/OpdlnXMP9WQF8QG/WzlYhHlXuNt4qUH
 LJUfmVFn8mWd5lYPWB2MHDLUdKKElD5+ukmmSsPZs/5CfDZ0DU+IKaWDBRFYUtjOwfbs
 Ivx3kw/T6LsKdX8r+U3GjrQYctROP8koYPmwp62goCqc8tm28B4wX+MlfON/fyDJlT1L
 DTq4Q2D1P1QfiFZ0cZuBkwtdiHL0D7ZSnrVorE6sYbqLdOvI9ZQvOvXA60/3h59ErLxW
 ZtJi9ELxIrzqaq9q5chgcsSmkSHmW4QKzD3/l2Vomji8k3hgDChKppPaQZZPBWMp+NLf
 oouw==
X-Gm-Message-State: AOAM5303fIMGzBtVX4oNfVQpAdgz/MWQs2knjJUgFPSL64PtIfUhR9L6
 cq8OP7T1HLwfgFsDJlgBnFv5pHNiA3ptoBIWJjbqhA==
X-Google-Smtp-Source: ABdhPJxCztzqv2Asz9YqnW6boj0syKAMz2iapKRHDJ0jArJ/slDF0+6ARy1ddqQXcPuEgOEASBxgAWy7OunXAyvqZ1w=
X-Received: by 2002:a05:6512:965:b0:443:7340:9893 with SMTP id
 v5-20020a056512096500b0044373409893mr13045429lft.119.1645423178084; Sun, 20
 Feb 2022 21:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20220218141004.16912-1-phil.chang@mediatek.com>
In-Reply-To: <20220218141004.16912-1-phil.chang@mediatek.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 21 Feb 2022 11:29:26 +0530
Message-ID: <CAFA6WYMtxbJXh=WHLPg5gg7JMKUGy+NdKTh9Jb3RbNO97kjoDg@mail.gmail.com>
Subject: Re: [PATCH v3] tee: make tee_shm_register_kernel_buf vmalloc supported
To: Phil Chang <phil.chang@mediatek.com>
Cc: jens.wiklander@linaro.org, matthias.bgg@gmail.com, 
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_215941_546367_D22F10C3 
X-CRM114-Status: GOOD (  19.58  )
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

On Fri, 18 Feb 2022 at 19:40, Phil Chang <phil.chang@mediatek.com> wrote:
>
> In some low-memory devices, it's hard to aquire large-orders pages,
> this patch allowed user using scatter pages to register shm.
>
> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> ---
>
> Changelog
>         v2 -> v3: use the "n" variable to walk through "page_count"
>
>  drivers/tee/optee/call.c |  2 +-
>  drivers/tee/tee_shm.c    | 37 ++++++++++++++++++++++++++-----------
>  2 files changed, 27 insertions(+), 12 deletions(-)
>

Apart from minor nit below, feel free to add:

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
> index bd49ec934060..2082e632adff 100644
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
> index f31e29e8f1ca..1412adad9397 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -23,21 +23,36 @@ static void shm_put_kernel_pages(struct page **pages, size_t page_count)
>  static int shm_get_kernel_pages(unsigned long start, size_t page_count,
>                                 struct page **pages)
>  {
> -       struct kvec *kiov;

> -       size_t n;
>         int rc;
> +       size_t n;

nit: this redundant change can be removed.

-Sumit

>
> -       kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
> -       if (!kiov)
> -               return -ENOMEM;
> +       if (is_vmalloc_addr((void *)start)) {
> +               struct page *page;
>
> -       for (n = 0; n < page_count; n++) {
> -               kiov[n].iov_base = (void *)(start + n * PAGE_SIZE);
> -               kiov[n].iov_len = PAGE_SIZE;
> -       }
> +               for (n = 0; n < page_count; n++) {
> +                       page = vmalloc_to_page((void *)(start + PAGE_SIZE * n));
> +                       if (!page)
> +                               return -ENOMEM;
> +
> +                       get_page(page);
> +                       pages[n] = page;
> +               }
> +               rc = page_count;
> +       } else {
> +               struct kvec *kiov;
>
> -       rc = get_kernel_pages(kiov, page_count, 0, pages);
> -       kfree(kiov);
> +               kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
> +               if (!kiov)
> +                       return -ENOMEM;
> +
> +               for (n = 0; n < page_count; n++) {
> +                       kiov[n].iov_base = (void *)(start + n * PAGE_SIZE);
> +                       kiov[n].iov_len = PAGE_SIZE;
> +               }
> +
> +               rc = get_kernel_pages(kiov, page_count, 0, pages);
> +               kfree(kiov);
> +       }
>
>         return rc;
>  }
> --
> 2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
