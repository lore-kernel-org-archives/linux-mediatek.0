Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19D4C38142
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jan 2023 22:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2fjqw/303bMNNUpoe3r4ayfN5p/kfqZGtLtAxKocJg=; b=VOevgozk+82JoY8IMRzS2NMokM
	8ETaj+HYnepgSEkKxA/r6nCgY5BQdc+LRiTVvK5+e7v4IQGzgQAHlEHEoeQJSLr4IRC7j/wclai3J
	xpEhCCymeHhiAcONssOBiFi+Evzm2ELzJeGyDeZPotj5dweSYsAlNZ6dPzR9Y9Ys2kSRiLjCMkM2Z
	6gdgIOYY0Pz2pmw9NFONfWyFdQvj6IfIjfpeqhmgyxK4zUtpP45cf57XOPbw52mvY595xYJZDyEb6
	Gx1x+Fa4FebzrktIwHMDJGYte1dMAxgZ73Ikp3b+AzxB+7cCbRwHVJ/3qfOlnZ/+hwV43uCWrxzNz
	xKJBGDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLtpl-000k21-TC; Sat, 28 Jan 2023 22:38:05 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLtpX-000k0M-0R; Sat, 28 Jan 2023 22:37:56 +0000
Received: by mail-pj1-x102e.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so1334921pjb.3;
        Sat, 28 Jan 2023 14:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g2fjqw/303bMNNUpoe3r4ayfN5p/kfqZGtLtAxKocJg=;
        b=gDrOrkXXN2+eZmzKxPlMyAE8toJamlTbn80o+fcvUjZ7VO1vm0sKjq19c1S+BkdkdX
         YpgziqRqC4MRufwEoEaUI7YMs10JaBQcKikCH/u1puk5BHeHFPu10Q9r1hnnAnlJTqtw
         W3nxPcuB2Xnj9vjSVt4nQhGUaFh35+1D9d9zZCr/T0Dmv7FzNbgXstcX959NB7q5lUoV
         fpTDRjZprkBWXam5MdsaRqGICXHN6LzYJKvetKNY2N2uyxVFpNiqmj936HyDVXV2MG66
         3vFIaWphhASTtmRFbVglFSfeaewYMCVxWAvbhzDUER8akBfzVaKyAThACtMtBldxr4S4
         gVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2fjqw/303bMNNUpoe3r4ayfN5p/kfqZGtLtAxKocJg=;
        b=Svb2rJ4knLdTinh/YbQXTpmKIxTpiQDaBcRygSNGlwXaAv7fhXHWPHmVznj4j4hKmX
         v7Du+bycsaYEuTu6cp9A8udfa3Q1wB3hUTPMTzdZniAJMB3YsR+hVYVaAUycv41bc1kO
         0n8m5/nHMkNCCGJkaOkxh+2EtBQPINEXCEtzH33O+c85NQm7EpePRIlMFKzt7LZG5yTs
         A0bSvyxSRLpfOQez3bx+ULcAN0KXI47W0r4Gomxsyh2Dbdfrw2QmLg79I+BNjFFzw/fp
         ZnnYC5LMGMDMDWGmnOb3+PMcLNZI2i3JCyK3iZ2MTn8gThH0b4L5CCAteUnidZNI51jq
         0jzw==
X-Gm-Message-State: AFqh2kqKatdlTm+3dVwNZrMSkKXAmhNx1dlb4GLkctG//BnfRxIb2Iqz
	J8BfHpPcrk+RmkeRqbzyNdFKy7Qq135YZkpf24E=
X-Google-Smtp-Source: AMrXdXtbqhrkWuN3kvH3D0ysENqY7fYj+QQkOyLGPF9AvkSWJ0b3ZzL39F+bOKy1vdH+iKUE/aeoGMcYaqisLQQ+STw=
X-Received: by 2002:a17:902:aa4b:b0:194:b3c6:18ee with SMTP id
 c11-20020a170902aa4b00b00194b3c618eemr4707438plr.29.1674945466747; Sat, 28
 Jan 2023 14:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20230128150025.14491-1-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20230128150025.14491-1-Kuan-Ying.Lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 28 Jan 2023 23:37:35 +0100
Message-ID: <CA+fCnZdSvTR=Ug3P9ZVxq9AG9Dh+TqLxDMRVOhvE8Sr1a2Oq4w@mail.gmail.com>
Subject: Re: [PATCH v3] kasan: infer allocation size by scanning metadata
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	chinwen.chang@mediatek.com, qun-wei.lin@mediatek.com, 
	Andrey Konovalov <andreyknvl@google.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_143751_092435_F7FA0986 
X-CRM114-Status: GOOD (  15.02  )
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

/On Sat, Jan 28, 2023 at 4:00 PM Kuan-Ying Lee
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> From: Andrey Konovalov <andreyknvl@google.com>

Ah, I think you need to reset the commit author before sending, so
that the patch gets recorded as authored by you.

> Make KASAN scan metadata to infer the requested allocation size instead of
> printing cache->object_size.
>
> This patch fixes confusing slab-out-of-bounds reports as reported in:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=216457
>
> As an example of the confusing behavior, the report below hints that the
> allocation size was 192, while the kernel actually called kmalloc(184):
>
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in _find_next_bit+0x143/0x160 lib/find_bit.c:109
> Read of size 8 at addr ffff8880175766b8 by task kworker/1:1/26
> ...
> The buggy address belongs to the object at ffff888017576600
>  which belongs to the cache kmalloc-192 of size 192
> The buggy address is located 184 bytes inside of
>  192-byte region [ffff888017576600, ffff8880175766c0)
> ...
> Memory state around the buggy address:
>  ffff888017576580: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>  ffff888017576600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >ffff888017576680: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
>                                         ^
>  ffff888017576700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff888017576780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ==================================================================
>
> With this patch, the report shows:
>
> ==================================================================
> ...
> The buggy address belongs to the object at ffff888017576600
>  which belongs to the cache kmalloc-192 of size 192
> The buggy address is located 0 bytes to the right of
>  allocated 184-byte region [ffff888017576600, ffff8880175766b8)
> ...
> ==================================================================
>
> Also report slab use-after-free bugs as "slab-use-after-free" and print
> "freed" instead of "allocated" in the report when describing the accessed
> memory region.
>
> Also improve the metadata-related comment in kasan_find_first_bad_addr
> and use addr_has_metadata across KASAN code instead of open-coding
> KASAN_SHADOW_START checks.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216457
> Co-developed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

Or change the Co-developed-by/Signed-off-by tags.

I don't mind either approach.

Thanks!

