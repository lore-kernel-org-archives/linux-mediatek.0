Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B40C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 13:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNwF7p+2S8E9III46N68yg/ZGuRx04nZxKBwULFHIVI=; b=jpEXnTdGJhWFlb
	tcCAWQkcjyLDhbjGz6CL6cvqmbz7JumTRY2Xuegk3Vp5jNRDO7JbKrkvAsWn4LrAYSGkymV3493OM
	qafVdYtSLOgYV1MiFNKjfJUH7cPgQvEZD2zCqXM3u2jbnjiUgIdnRIb58MxG7EW1GPLYXd2mX7b//
	14VU7/zs+psS+FrgdiSShTSvz0l7Bsvdt6qYsw1BWu7vvEGIy7mjWTHhxanYJLpZUUKJ+/zCqOek/
	00E1rcdwLbrfi5w6cqb6aeLagvHrNvO5powjvJ2GbfaIm0rvBFe2+mNiq08LXY8Tkwi7aUZgO8wSp
	+clqIFzgvrLWbLkSMUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPOsb-002kw3-TT; Wed, 02 Mar 2022 13:18:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPOsZ-002kuk-82
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 13:18:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id e2so1519126pls.10
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Mar 2022 05:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qK9d2CW5Qjm76cCegwle8ny9+Ev6C07txl5fuKAcuhc=;
 b=NfQZaZ+q0ThsmrmmiMdQJE5ZqDxPW3SQms7rRu6Rjpb1Xp/TZ30rbx4EAneBfMi/In
 L0RwOsoQ4+z9AP83cTrpdZsB1/FPKvt9JVDUQTu11QHVXhtiUx8Q/VA8RmRY2OwUojO/
 xyeshltWB2Ovpmj4dTxG8febqDnclwVD6JVY57Sw+DS4roS5ktML+furTRsrzPzgMQod
 EsxqnBlwXPljzmQgOwKq322hSjG6MfvMEvhSAJypu1noSulyNAARlSV8ql21DM50GFWa
 WKvg8nGfZWwPbrGUO2Q4QIV66ZhQeO29SYqasCiKOyMkhlb265k/y00H4uoTV70b2gOk
 YnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qK9d2CW5Qjm76cCegwle8ny9+Ev6C07txl5fuKAcuhc=;
 b=8M4PRn7/8od9LFtL2MYcmdj5nIBosKR6SnPK11Q8ahnPIsovCWfhtCCHHUzEjjmyiK
 TIdggMztPYiN1viB9X8TImgGTwCcaERQ01p05AFwwguowNZAmTl4FDve0yDwndm82Ma4
 MSj/0UYNm3uSNsOoGkueLhNVaNRwonH2zkPZbbOJXpM5GwriheR4+PSrZTc3WqgYCfSu
 CBa/ErObE4ZERDVHxQPO4MVIQtlZRSAyw0PeNIsETew9urF1KvlGBmLHRnPhscf2XpCE
 iNLhiX3sQvR51apASBbP8pE0JeEFcHGNVU9aUaAtHzVL2ZvmkC9Jt1y8zxcDFluUvTkt
 0XVQ==
X-Gm-Message-State: AOAM531ybz9Rvlu9v6axpnAv0aqujiswiC90etyST+YETkXY1usNutgM
 DpsNWVyczS+wf5xzNv3Sg4rNlFsylkyDUsVczO8img==
X-Google-Smtp-Source: ABdhPJzHllgvusx07u5CjUMpJFy7+fqUKXMPYz4mlr4zSQ8nq4cL6t+YcI+JLAVgOK3OmOA3gjwGDbQpT1+MahuuqTA=
X-Received: by 2002:a17:90a:fe86:b0:1bc:6935:346 with SMTP id
 co6-20020a17090afe8600b001bc69350346mr27461224pjb.150.1646227133275; Wed, 02
 Mar 2022 05:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20220225152040.31896-1-phil.chang@mediatek.com>
In-Reply-To: <20220225152040.31896-1-phil.chang@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 2 Mar 2022 14:18:41 +0100
Message-ID: <CAHUa44GDg7hAAFsmeOOkeqi8_1P1Q6jATRdnV9b6S-DhpEEQrA@mail.gmail.com>
Subject: Re: [PATCH v4] tee: make tee_shm_register_kernel_buf vmalloc supported
To: Phil Chang <Phil.Chang@mediatek.com>
Cc: sumit.garg@linaro.org, matthias.bgg@gmail.com, 
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_051855_326039_A95F6D68 
X-CRM114-Status: GOOD (  21.28  )
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

On Fri, Feb 25, 2022 at 4:20 PM Phil Chang <phil.chang@mediatek.com> wrote:
>
> In some low-memory devices, it's hard to aquire large-orders pages,
> this patch allowed user using scatter pages to register shm.
>
> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/tee/optee/call.c |  2 +-
>  drivers/tee/tee_shm.c    | 35 +++++++++++++++++++++++++----------
>  2 files changed, 26 insertions(+), 11 deletions(-)

Looks good to me. Unfortunately this is too late for the coming merge
window, so it's going to be the one after that. Meanwhile it will be
in linux-next.

Thanks,
Jens


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
> index f31e29e8f1ca..836872467dc6 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -23,21 +23,36 @@ static void shm_put_kernel_pages(struct page **pages, size_t page_count)
>  static int shm_get_kernel_pages(unsigned long start, size_t page_count,
>                                 struct page **pages)
>  {
> -       struct kvec *kiov;
>         size_t n;
>         int rc;
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
> +
> +               kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
> +               if (!kiov)
> +                       return -ENOMEM;
>
> -       rc = get_kernel_pages(kiov, page_count, 0, pages);
> -       kfree(kiov);
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
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
