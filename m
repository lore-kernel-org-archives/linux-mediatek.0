Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D696DC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kivkjIcW/dBwtKQGxzqBhqyQNzFDh/iWcq1jAKuPzjQ=; b=hqmLRDEzYrebojJOC84sDKSt7Z
	1HoNaRenK80mqXJquKVF9NJYU7dK3k7Lj/FO20T+pDix6HquEtSmoouYMDBWQF3zsm/4DcId/jZ8J
	64cCmDGFEf3pbYz+a94s6YXLBoNHWHM1yHBBIbqh3sPAWZHYFqWq19fJyP6N2NkmqVl5t4agqDIxk
	P87QBqsWcKD0NjJVmqNeHoivQ0E4lblkKSBLJc480Nb34rlCs5pw3nq8hpJyGh5WcXOJ94xOF1Rko
	myDYh6xmTSGCvD2PZaFAZnOOrgl0tzvzIsQn542ih0nI49h8QCtrWB2sM5ir520+3LWMRg6Vip7R/
	RYXe1N7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6A3h-0066wS-UJ; Tue, 28 Jun 2022 12:11:09 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6A3W-0066sO-Fa
	for linux-mediatek@lists.infradead.org; Tue, 28 Jun 2022 12:11:00 +0000
Received: by mail-yb1-xb36.google.com with SMTP id i15so21934529ybp.1
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jun 2022 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kivkjIcW/dBwtKQGxzqBhqyQNzFDh/iWcq1jAKuPzjQ=;
        b=CLRflZYyQbg2Iw8XCTaSt3HhmxKw/xrafgduTJjfhqjN2UgMgl+t/Gw4w6ILs6K9J4
         MiBhpvtp9dwuJoICS/Nb1ZrtA3RQX7LEA7Mz5j+bBQgqJZtt6/ayHu+r5Hhb3qNZ4MWa
         hFjTG4fGYnkRgTZZBBgzYCRgfxmHlPzv/4ipJqE4P/j7/2M+hTvxyKMHh77AZQv+DXXp
         HhfG34tq68ucJafyFKHbBlkKZIavzOm2MyDj5K6/Q7swKn5I+xF/JVEwmlCwkvsZvZHr
         w9cyP8LjUEu4elAD/I0i18jI8ov478QkOC5jYowuBKa+OZLBRkMIuuXZdJu9woKbWYNY
         OIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kivkjIcW/dBwtKQGxzqBhqyQNzFDh/iWcq1jAKuPzjQ=;
        b=Swc+QVi/Q/mheERyZPiH7l/u01K7ENETqSltxMk7n2a7QUsbxXtmR+Czjofpcw3qHG
         5x0CCd8mDLWE2nb3UWpcPUXmigNAgidmhyQXpO+yDm9fvYHh5sffMn/cvCaa+xTppS9j
         7qgpMECSEWv6XrmMChU+EhFT3N6MtHUd88B/VTfJmzObvu9oClgQe533vBBwQQs1TsEB
         vPfbGUVeEpvB/zXH1XHKGk6kdGcEqNl0ltvzmmEHL6iR/ZslaMq4Om50aFjlQWH1MCQb
         +VkzMW9nIn5Tf04+8Ni78HyO5FclcUrpUOhf7zB8Z7Ei5vWySIoS7VPfL4I69YiqRdeT
         pldA==
X-Gm-Message-State: AJIora9nbhq5tf40DNbDKPUA4O5CXJfqIKK4MUfaDRObR8M144DxS4di
	3lmizRHnEWUl/ideoTRc12GsJuf8j1BHOzN0zM0oDg==
X-Google-Smtp-Source: AGRyM1smrNVxZFq8RnZCs9l8cbaNFOI8pfYR4MykJ5KZXRx6x1Zw9wNjdz4oF5DQdShpdaP6Z1l8ckzfBHZHCRervgg=
X-Received: by 2002:a25:cc56:0:b0:66c:d0f6:2f0e with SMTP id
 l83-20020a25cc56000000b0066cd0f62f0emr10988742ybf.168.1656418254817; Tue, 28
 Jun 2022 05:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220628113714.7792-1-yee.lee@mediatek.com> <20220628113714.7792-2-yee.lee@mediatek.com>
In-Reply-To: <20220628113714.7792-2-yee.lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Tue, 28 Jun 2022 14:10:18 +0200
Message-ID: <CANpmjNNSHEksMq+xR62mV5dzb0ZO7UPhUzt2ghSbqcR-Bsm_2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early
 allocated pool
To: yee.lee@mediatek.com
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	"open list:KFENCE" <kasan-dev@googlegroups.com>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_051058_591600_8FBAA017 
X-CRM114-Status: GOOD (  22.06  )
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

On Tue, 28 Jun 2022 at 13:37, yee.lee via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> This patch solves two issues.
>
> (1) The pool allocated by memblock needs to unregister from
> kmemleak scanning. Apply kmemleak_ignore_phys to replace the
> original kmemleak_free as its address now is stored in the phys tree.
>
> (2) The pool late allocated by page-alloc doesn't need to unregister.
> Move out the freeing operation from its call path.
>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Suggested-by: Marco Elver <elver@google.com>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>

Reviewed-by: Marco Elver <elver@google.com>

Does this want a Fixes tag?

> ---
>  mm/kfence/core.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 4e7cd4c8e687..32a4a75e820c 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -600,14 +600,6 @@ static unsigned long kfence_init_pool(void)
>                 addr += 2 * PAGE_SIZE;
>         }
>
> -       /*
> -        * The pool is live and will never be deallocated from this point on.
> -        * Remove the pool object from the kmemleak object tree, as it would
> -        * otherwise overlap with allocations returned by kfence_alloc(), which
> -        * are registered with kmemleak through the slab post-alloc hook.
> -        */
> -       kmemleak_free(__kfence_pool);
> -
>         return 0;
>  }
>
> @@ -620,8 +612,16 @@ static bool __init kfence_init_pool_early(void)
>
>         addr = kfence_init_pool();
>
> -       if (!addr)
> +       if (!addr) {
> +               /*
> +                * The pool is live and will never be deallocated from this point on.
> +                * Ignore the pool object from the kmemleak phys object tree, as it would
> +                * otherwise overlap with allocations returned by kfence_alloc(), which
> +                * are registered with kmemleak through the slab post-alloc hook.
> +                */
> +               kmemleak_ignore_phys(__pa(__kfence_pool));
>                 return true;
> +       }
>
>         /*
>          * Only release unprotected pages, and do not try to go back and change
> --
> 2.18.0

