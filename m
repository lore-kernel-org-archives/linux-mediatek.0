Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC0CC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2487A61353
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2487A61353
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vn959+KGbm1NBVCYL+6kSxALcyBF1IbhK0zBhG1/Y6M=; b=R0wUNwwCqkEZOc
	3hc/8MM45632KbI+6A/9XI6UpQdXJm+RYswuVsmM2aM9nkrES9HMt2XUhFGZCp95MXblfWOt3FSu9
	MwBO3Wt525Ng3REQ8Khho26aFZ96dpzZHBn8g161fzVxa/OnGUMsyiIfmx5h6k1wVR4Bc6Vzxjx6J
	k64ZgNuZ2QwzAf1kv1+Vk4hQby8GeNp1PKZ4ArBy/zgw30xJtQdYRR+BgL9AXik39pk9OafzUB41C
	TcYSC4WzHoXzgkTgMdaTu8LXq3phGUp1RUa4sCZ2ZpGpRd1eZZEF2EY2sxXIJpgvX/tgA/RZHtLjT
	ag4NilGwggQsTOcsjINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvcI2-006L6o-Q8; Tue, 22 Jun 2021 09:01:50 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvcHn-006L3O-Si
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 09:01:37 +0000
Received: by mail-ot1-x32b.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so20559622otl.3
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 02:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E3vujFtQzQ6HHb36nCRkPnI6sILbeapGxmxAb4EfnkI=;
 b=CB752prxx4dAwLiJh978X4UEniRLciLoj78ygr06BhzO9Zg7gd4UEFbVgZXdlVMHDt
 p2vaKWQ1OJcHnvkvP5Tu45vm8+XZy0OhLLxui1fAfHsP5/d4JeU6Idj+wyDXEF93AVl6
 SUMEwVJYMziAOsHVQ9vDsGCZHT873ntwOguGUK2ALiLzW6WBKUyUDKWOrMmyiu0C17s5
 RP8HZEa2qe1olyrZy6gNVC1IJ3jJ58ILo6TsaqFcAlBXYK6PmUJPOyIpNV8Jpwvgvlut
 xYAdLL+t/fKOXk9CaBN/ZTnLpMInTCxfXCSoqiVG3oc34ZJ6Q5DFL97vyZEHdqRQCBpJ
 kOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3vujFtQzQ6HHb36nCRkPnI6sILbeapGxmxAb4EfnkI=;
 b=cZ6yjXccfoSszlBa/CmWfsjq3adfeAqNskTKm2KTh1q4iGUkPHfU+CDsQ37NfyKPve
 MGxAONXMjOoajSIZIpjrIg4imC9sDa2uqnnM7V/rEX3t33VKFIygC3LGplpG1/Zh0cs2
 Rwoh6Tn5g1GfDVSLN+f9bpSos77FyE3Bku3DgtKnrNmlH4h6T2MId3aQ8Vu0m3q7FQDi
 0lbt0eT4FJd7nX8KUdxNB2MnyRn3M9ILZ6mBz+XnIaUHNSh/zA3C47sodZzlAPJdVst+
 PgBX3K3uy3yZCIlb697wcng3sTwpkAWE46BlFkMqNSq5TlwI5+1q6AdTG/HzuTFKTSdr
 5LLA==
X-Gm-Message-State: AOAM533VAMtuZEC2ubNfXmKF8PHPmJiOGr7P0zKdIty9NLiQ3ziJ97Ti
 Lvm/nQXvYPKcNpE26oW6Mb67N4Tko3GBy05amTwoXw==
X-Google-Smtp-Source: ABdhPJz6x9ikQTihlpl50ySejohRlYsuuYzk1020DWbzWFDGxvVI6FgPvghPiE/lufEm9zK+hYyHAKWDluvyY14hCZw=
X-Received: by 2002:a05:6830:1bcb:: with SMTP id
 v11mr2292496ota.251.1624352492722; 
 Tue, 22 Jun 2021 02:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210622084723.27637-1-yee.lee@mediatek.com>
In-Reply-To: <20210622084723.27637-1-yee.lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Tue, 22 Jun 2021 11:01:21 +0200
Message-ID: <CANpmjNPyP2-oULXuO9ZdC=yj_XSiC2TWKNBp0RL_h3k-XvpFsA@mail.gmail.com>
Subject: Re: [PATCH] kasan: [v2]unpoison use memzero to init unaligned object
To: yee.lee@mediatek.com
Cc: andreyknvl@gmail.com, wsd_upstream@mediatek.com, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:KASAN" <kasan-dev@googlegroups.com>, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_020135_957213_B0C6CFC9 
X-CRM114-Status: GOOD (  28.84  )
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

On Tue, 22 Jun 2021 at 10:48, <yee.lee@mediatek.com> wrote:
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> Follows the discussion: https://patchwork.kernel.org/project/linux-mediatek/list/?series=504439

The info about the percentage of how frequent this is could have been
provided as a simple reply to the discussion.

> This patch Add memzero_explict to initialize unaligned object.

This patch does not apply to anything (I see it depends on the previous patch).

What you need to do is modify the original patch, and then send a
[PATCH v2] (git helps with that by passing --reroll-count or -v) that
applies cleanly to your base kernel tree.

The commit message will usually end with '---' and then briefly denote
what changed since the last version.
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format

> Based on the integrateion of initialization in kasan_unpoison(). The hwtag instructions, constrained with its granularity, has to overwrite the data btyes in unaligned objects. This would cause issue when it works with SLUB debug redzoning.
>
> In this patch, an additional initalizaing path is added for the unaligned objects. It contains memzero_explict() to clear out the data and disables its init flag for the following hwtag actions.
>
> In lab test, this path is executed about 1.1%(941/80854) within the overall kasan_unpoison during a non-debug booting process.

Nice, thanks for the data. If it is somehow doable, however, I'd still
recommend to additionally guard the new code path by a check if
debug-support was requested. Ideally with an IS_ENABLED() config check
so that if it's a production kernel the branch is simply optimized out
by the compiler.

> Lab test: QEMU5.2 (+mte) / linux kernel 5.13-rc7
>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> ---
>  mm/kasan/kasan.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index d8faa64614b7..edc11bcc3ff3 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -389,7 +389,7 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
>                 return;
>         if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
>                 init = false;
> -               memset((void *)addr, 0, size);
> +               memzero_explicit((void *)addr, size);
>         }
>         size = round_up(size, KASAN_GRANULE_SIZE);
>         hw_set_mem_tag_range((void *)addr, size, tag, init);
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210622084723.27637-1-yee.lee%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
