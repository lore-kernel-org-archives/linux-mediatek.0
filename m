Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9C4CCA47C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACxXBxS9wLm3s0o360W5tadVCtNgAfMCjbW4/7oTcA4=; b=xxVJBBvsqpJnYXK9/sLi1pqCbO
	BNvRNdsR62DzOAL6K16dK58z41umjl2uvc/zAd90DnI41W6LnkRs+1WXBzm3TTkzlhmEFJBbKiLeH
	ttiSJYpLat8ArFnrlx82lD/LMUaT4Q+FH14bMy/nEHxHpIHj9vFXq5KQN2VKAR7gMG443SYsZv9Ag
	PxJX4rJes9AMp+tc1dwBffzQjiSnYhKyDUcjg4cYTjCzHZxHgszBvZAhPOVsWNMMiZKWz/0UA2u58
	eBTVc/jYemuh4MChnvlmyRl2exqFA+G09xV8dcXLnenNEYgRpp1JXQXE4MTgaVXfGCVCbiw168tZX
	0qgv02Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Ljy-00EwSg-Gk; Thu, 23 Jun 2022 12:15:18 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Lbh-00EsrJ-JQ
	for linux-mediatek@lists.infradead.org; Thu, 23 Jun 2022 12:06:49 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id s1-20020a4adb81000000b00422e6bf0e92so1933607oou.13
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jun 2022 05:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ACxXBxS9wLm3s0o360W5tadVCtNgAfMCjbW4/7oTcA4=;
        b=SQAHvCcWiZPW2d3TCyD1ucF5/vuJJlyPVHSS/EBGdmL8eX5SUfz3/Ks10JcOSDF4FX
         6NM2LxV3aGPxbmKFW6CymAyrqLU04WuWmUf2W35juuB5SYN+qyur+64ek1GkZNdOxCws
         tTjaOk+a96XPGBxGCBD5TPY35OoLL5ZfevMzMdl7MTdY4Lju9vHRIWrmkL9wOONsxjX1
         O/asGkoOSqI99F3ZdcWFu2tF4TQnWuBOhwiu1f+nogWCWs7sx7Xb7ixvQeYV05cPLDTG
         vGEWDE0n6iE6LBdtk56t/E4aRGQdXA2peo3o93/9OM1CH/Qznz+D7SbjboU23TZ3IHe3
         YhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ACxXBxS9wLm3s0o360W5tadVCtNgAfMCjbW4/7oTcA4=;
        b=j23kgy6tJzHx9Ax735XMNlhXj+B8AHufbHIX4+BRm2fMet0vsKNbSCLr4e+vpSMVHh
         88pUH0AS5cgiiU/1Jbiu+rkOC/1uZnArqJfLlawKOL97WmujTkd0gU1RbQHBQC/YG6wX
         85kdfQg9hoGETqoip2LlwQ7NpXLNLBJt2sILGhBpvuxRQDJE6dDegf34qaVpQVArHFwe
         VR9X0C4Dq4E7HHiJh1XB2Iq2tYFp72pujoBflmeBFwL41+X5j0QoCLRiVhY6QbtJBtDf
         RN0xLrn0VztU3R1YLos6E5BfYQdAd2uuWHitEbNWrw3AcNSREyezDq9jY0/WTZO+QEcX
         SU4A==
X-Gm-Message-State: AJIora9vhhsI33Aplm8QWT+x9cFcgNI3vV9LxPn0To8B8nxKpawAPCFc
	NrfsFa2fyTeRYR4x6T/5laltBHHzPhnSU0XHlP2DOSMMW3Y=
X-Google-Smtp-Source: AGRyM1so/RVtDJwHhTKgYn+XHelVpXIxpsLsc4tp78gqxCR/ieVCu7jnZAYDuCZ45vtLrLwadNS0nmv5gI6/XxqOHnU=
X-Received: by 2002:a81:1591:0:b0:317:bb1f:fb83 with SMTP id
 139-20020a811591000000b00317bb1ffb83mr10329151ywv.362.1655985635802; Thu, 23
 Jun 2022 05:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220623111937.6491-1-yee.lee@mediatek.com> <20220623111937.6491-2-yee.lee@mediatek.com>
In-Reply-To: <20220623111937.6491-2-yee.lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Thu, 23 Jun 2022 13:59:59 +0200
Message-ID: <CANpmjNN-jsZoVmJWD2Dz6O3_YVjy0av6e0iD-+OYXpik1LbLvg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: kfence: skip kmemleak alloc in kfence_pool
To: yee.lee@mediatek.com
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "open list:KFENCE" <kasan-dev@googlegroups.com>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_050645_765356_A23BD879 
X-CRM114-Status: GOOD (  18.21  )
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

On Thu, 23 Jun 2022 at 13:20, yee.lee via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> Use MEMBLOCK_ALLOC_NOLEAKTRACE to skip kmemleak registration when
> the kfence pool is allocated from memblock. And the kmemleak_free
> later can be removed too.

Is this purely meant to be a cleanup and non-functional change?

> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
>
> ---
>  mm/kfence/core.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 4e7cd4c8e687..0d33d83f5244 100644
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

This appears to only be a non-functional change if the pool is
allocated early. If the pool is allocated late using page-alloc, then
there'll not be a kmemleak_free() on that memory and we'll have the
same problem.

