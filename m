Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCB7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3fHkrIxijoBStBNKBFe28Ky1K1PmG5rkzdsIiVXF7w=; b=nlU772Hfn01XAv
	L7Aa1VJegTJSy0Zp4K6bzevMUKaClvn3J3wrr8eWNwvSv0TaMhzc81Fq2HTMQOqQWpG3UDlK2Kuy+
	gm7f1pKq8/krfNLWket0vyz/GON119/9vQ6vIB5RBE3Jpn5dC5q2nu8YaLZXoyJMjPPWoLDASnLFv
	lqdVB2noc7ZMsntzv2TcQU4s6WYJp2HRGSEalBbfwtsvYVNuGzweAZOGuxYBqS63ucjBPAssF6wAD
	q4BvvvcSgO0KIPXTaF7+UzbHf65EmoaB0ITiW2N9X+RbV3nTZ0cwqIV1kmH1T0p8V3ROOWrHtTwwL
	nrIRsPqlZc2u3p95cKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKEzf-005t5q-NR; Wed, 16 Feb 2022 07:44:55 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKEzc-005t4d-PD
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 07:44:54 +0000
Received: by mail-pg1-x533.google.com with SMTP id 195so1437090pgc.6
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Feb 2022 23:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idVPFv+DSP7Si9bHKwJJc9JjyE+2OuKAEjgsCztUSos=;
 b=gy/dL5TIr1X+xakwzesx8ufBPPqKcsEU/MydhPv52av2EGesaFMns/kPwGnB/HR1NV
 j/o5MsXn5rMr6hyt1iZ38HeGLOfghXgiWLc97H+V2w2t/HnnCzA021pn0+M0Y0/HM6k2
 yaaWfNRT+5YJMn9WoA3zcKvWOPkOgjtZVSrp2azu4vidQ/eYhHoyhagV8E85N943KU7d
 DxtM25hc6bJWAtYfl/DiUG1mmGjiotzQPs+HaxZ+gUBv3AU0QFz2Y0etWKp3ghE2TWR3
 nuBvqBdCamH9pH0gl1k4u/bTQBTZGwXYDgiHejfbDYpi+N+NhvMKEmlRCfzLrjn7O9DO
 b9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idVPFv+DSP7Si9bHKwJJc9JjyE+2OuKAEjgsCztUSos=;
 b=NQEnm5X/q7oBv7/heJ3cwZEwYcoIEmIZTG+zQOlxUXOy4QkmfKkux+Fjg9gyO22Ekd
 k4ibeFeR+eNz2zU0R1kJaB13/ozOpR61+mMJT/RmQ9Ig4ySEXXjuEbG9jmcok6AVT+Mu
 bJ07OWjHfhe7wwMt2Brq5K53geWAhiy+w3jtyspZL3uQ5v14+940kGF63fY7kQxPbedx
 ZsZnruqdn626BCXRxXiJVfoXST7WBfzrGvTZPFhlhQwESDxySIPhErv972d9dzyj/Vl1
 M8AQNo1tBV0iugrbYu3ZrJisIjuq0rcGpH69pkWl0IRACL3eHHP91pmS9J77m56I3KiT
 os+Q==
X-Gm-Message-State: AOAM532+gjM9MLt0W+A1TU/64a2zWQl24zy8TpPRx9kN0FmDh49Yha08
 2UKbSDGticKcaCpxnByG2kyJlcoVKZnBU24ulbkWvSIpd4w=
X-Google-Smtp-Source: ABdhPJzuIh5wWz46XEA0zvfNNZJo1eWh+z4xvjWNgivErUGhnKJ5WQ58yHemMMrLvrGS19L1gJrURpQMej4oPpcEOEM=
X-Received: by 2002:a05:6a00:2301:b0:4e1:5842:48d7 with SMTP id
 h1-20020a056a00230100b004e1584248d7mr2037614pfh.14.1644997489966; Tue, 15 Feb
 2022 23:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20220213162110.27210-1-phil.chang@mediatek.com>
In-Reply-To: <20220213162110.27210-1-phil.chang@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 16 Feb 2022 08:44:39 +0100
Message-ID: <CAHUa44HynmNkNdzxu0R0NALLja86jT2WGEVcz0rCYfpxt=bjdw@mail.gmail.com>
Subject: Re: [PATCH] tee: make tee_shm_register_kernel_buf vmalloc supported
To: Phil Chang <Phil.Chang@mediatek.com>
Cc: matthias.bgg@gmail.com, op-tee@lists.trustedfirmware.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_234452_909997_5C572CC2 
X-CRM114-Status: GOOD (  22.45  )
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

On Sun, Feb 13, 2022 at 5:21 PM Phil Chang <phil.chang@mediatek.com> wrote:
>
> In some low-memory devices, it's hard to aquire large-orders pages,
> this patch allowed user using scatter pages to register shm.
>
> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> ---
>  drivers/tee/optee/call.c |  2 +-
>  drivers/tee/tee_shm.c    | 40 ++++++++++++++++++++++++++++------------
>  2 files changed, 29 insertions(+), 13 deletions(-)
>
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
> index f31e29e8f1ca..861403588485 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -23,22 +23,38 @@ static void shm_put_kernel_pages(struct page **pages, size_t page_count)
>  static int shm_get_kernel_pages(unsigned long start, size_t page_count,
>                                 struct page **pages)
>  {
> -       struct kvec *kiov;
> -       size_t n;
>         int rc;
>
> -       kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
> -       if (!kiov)
> -               return -ENOMEM;
> -
> -       for (n = 0; n < page_count; n++) {
> -               kiov[n].iov_base = (void *)(start + n * PAGE_SIZE);
> -               kiov[n].iov_len = PAGE_SIZE;
> +       if (is_vmalloc_addr((void *)start)) {
> +               struct page *page;
> +               int i;
> +
> +               for (i = 0; i < page_count; i++) {

page_count is of an unsigned type and i is of a signed type, this is
bound to cause a warning.
Please move the "n" variable below to the top of this function and use
that as an index variable here too.

> +                       page = vmalloc_to_page((void *)(start + PAGE_SIZE * i));
> +                       if (!page)
> +                               return -ENOMEM;
> +
> +                       get_page(page);
> +                       pages[i] = page;
> +               }
> +               rc = page_count;
> +       } else {
> +               struct kvec *kiov;
> +               size_t n;
> +
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
>         }
>
> -       rc = get_kernel_pages(kiov, page_count, 0, pages);
> -       kfree(kiov);
> -
>         return rc;
>  }
>
> --
> 2.25.1

This patch makes sense. Please fix the comment above and post a v3
(with a changelog this time).

Cheers,
Jens

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
