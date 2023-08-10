Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE485C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwkogVir+aH9lwGglDFwEcp1cybyKG7KluQCWJj8CDk=; b=hQsizvK5BNVSD6lLOE5gX14rDe
	AbOyO7+OnXmjE6XXcvfHux9nMNSweGexbFw4xOJFsBqUFDqw99PgYZ7+TGXpmg469TskoK+YYbbzR
	OhYmvklcAYwGKlf0q+C7bZksVQ+cf1BfsZ92RCefuCV11yda7pODphtnSUyzCJ30z7cSQLTz8sXGK
	CiYy5P7EIUWZCW1BhVOtCqyZ2TaFTIs6o9WLLpRAQ0vM1d2WwJvrAFkzloilf3cPEkMEcQ5pBuWZB
	QVLG2COYeyVlG0F6NS03Qu4et2jJwEv76lnqEZXd6lSSVroddFoy1z5UYCIciuYRY38hM2RhlnGab
	VQiL9uMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU7jH-0083j3-1N;
	Thu, 10 Aug 2023 15:37:39 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU7jC-0083g8-1e;
	Thu, 10 Aug 2023 15:37:36 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-78666f06691so35205739f.0;
        Thu, 10 Aug 2023 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691681852; x=1692286652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwkogVir+aH9lwGglDFwEcp1cybyKG7KluQCWJj8CDk=;
        b=ooGCXLyctROezjPLyOuJ9wcLTxpSVm11cpq1ZV7QNPqLOC4D+7Lb0N2iKFTTVru3V5
         JaNFZAI5Wot6a+ZnQLVc5AvMFagexbeCK0Ine/+siTUjfltUxCrYM2NhWfVfOnU6nnxL
         xfS5qxGV+eF7DV+DI+5jd8OsiRkSBOfnbeCEynWsMXTG4DE+zizMuqilMSxVYp66D22G
         cAB46IjI33e+HorPCMIMKR3LKVsYAQjGYpH0j5Vy3djYi9BMwyEod8YESFa9+l9N+BXR
         mJleXwuQUW3S990avKjBJyeMrQ4TU3KXgPl86sbPFkr2C1/fL1BirxHM3NbZF0V14t1/
         mCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691681852; x=1692286652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwkogVir+aH9lwGglDFwEcp1cybyKG7KluQCWJj8CDk=;
        b=csIElRwg6kRwNtnyDcsjZNiesCKtOxpDYKHUtXZyTDZlvV5gj6lqx5Jl6Ws/0Dwbqx
         YENAdPmEEHpDVgIwRkwhBJR8CNASPkSSIrSaAyM+T8kfv8jSL51oe6n/te+62c/9gx2u
         R0/8heEMROX/bGb36MmUA4mjrj4Hacfo8hlDdfB0a/6ILFUlKByBIKxYaJzUYP8+DvgQ
         DSUfJwPQu8ZaRXgJBRn/zAEuG1VuAB1o83nFYMfzhTcbsX0agWOzvSDaFSZdq3zbk98B
         IhuJ2U2Pcat5s+Qd6gcjtH6bBDaARBCdrXy8XKL7Hf1/RX4Xx42FGhOnEw6xjshnJc6l
         KtEg==
X-Gm-Message-State: AOJu0YxpqrvPs/dzfPS8mO28tu2/dNdmD7HLzQIgWMRHuCETKXr5/1Na
	J/kVf8vCHtx4p7llAEm/YvaohCYxhF7h+cRV8bw=
X-Google-Smtp-Source: AGHT+IFqi190O7n12MG3quvwqfaIFbJEYNG7nlvkmhMSXaWfeUkgnh1Rjqr939fiAUMz04LXyM6Zls66OTw1KFO80sQ=
X-Received: by 2002:a92:c544:0:b0:346:fe2:125a with SMTP id
 a4-20020a92c544000000b003460fe2125amr4155929ilj.26.1691681852295; Thu, 10 Aug
 2023 08:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230727062910.6337-1-andrew.yang@mediatek.com>
In-Reply-To: <20230727062910.6337-1-andrew.yang@mediatek.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 10 Aug 2023 08:37:21 -0700
Message-ID: <CAKEwX=ObJO8R6ybwXS0iDd0Vrb_pUqJpAV9oV68hsJr2aMsRoA@mail.gmail.com>
Subject: Re: [PATCH v2] zsmalloc: Fix races between modifications of fullness
 and isolated
To: Andrew Yang <andrew.yang@mediatek.com>
Cc: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, wsd_upstream@mediatek.com, casper.li@mediatek.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_083734_546743_2943BA75 
X-CRM114-Status: GOOD (  20.47  )
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

On Wed, Jul 26, 2023 at 11:30=E2=80=AFPM Andrew Yang <andrew.yang@mediatek.=
com> wrote:
>
> Since fullness and isolated share the same unsigned int,
> modifications of them should be protected by the same lock.
>
> Signed-off-by: Andrew Yang <andrew.yang@mediatek.com>
> Fixes: c4549b871102 ("zsmalloc: remove zspage isolation for migration")
> ---
> v2: Moving comment too
> ---
>  mm/zsmalloc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index 32f5bc4074df..b58f957429f0 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -1777,6 +1777,7 @@ static void replace_sub_page(struct size_class *cla=
ss, struct zspage *zspage,
>
>  static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
>  {
> +       struct zs_pool *pool;
>         struct zspage *zspage;
>
>         /*
> @@ -1786,9 +1787,10 @@ static bool zs_page_isolate(struct page *page, iso=
late_mode_t mode)
>         VM_BUG_ON_PAGE(PageIsolated(page), page);
>
>         zspage =3D get_zspage(page);
> -       migrate_write_lock(zspage);
> +       pool =3D zspage->pool;
> +       spin_lock(&pool->lock);
>         inc_zspage_isolation(zspage);
> -       migrate_write_unlock(zspage);
> +       spin_unlock(&pool->lock);
>
>         return true;
>  }
> @@ -1854,12 +1856,12 @@ static int zs_page_migrate(struct page *newpage, =
struct page *page,
>         kunmap_atomic(s_addr);
>
>         replace_sub_page(class, zspage, newpage, page);
> +       dec_zspage_isolation(zspage);
>         /*
>          * Since we complete the data copy and set up new zspage structur=
e,
>          * it's okay to release the pool's lock.
>          */
>         spin_unlock(&pool->lock);
> -       dec_zspage_isolation(zspage);
>         migrate_write_unlock(zspage);
>
>         get_page(newpage);
> @@ -1876,14 +1878,16 @@ static int zs_page_migrate(struct page *newpage, =
struct page *page,
>
>  static void zs_page_putback(struct page *page)
>  {
> +       struct zs_pool *pool;
>         struct zspage *zspage;
>
>         VM_BUG_ON_PAGE(!PageIsolated(page), page);
>
>         zspage =3D get_zspage(page);
> -       migrate_write_lock(zspage);
> +       pool =3D zspage->pool;
> +       spin_lock(&pool->lock);
>         dec_zspage_isolation(zspage);
> -       migrate_write_unlock(zspage);
> +       spin_unlock(&pool->lock);
>  }
>
>  static const struct movable_operations zsmalloc_mops =3D {
> --
> 2.18.0
>
>

I think this fixes an issue of mine that has been bugging me for
the past couple of weeks :) Thanks a lot, Andrew!

This should be added to other Linux stable versions too, right?
(with the caveat that before 6.2, use class's lock instead of
pool's lock).

Reviewed-by: Nhat Pham <nphamcs@gmail.com>

