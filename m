Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164CAC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 07:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D28611CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 07:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1D28611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOOlE1RqQ+rpj5LHDZzARQQhnoVZkvuGAW0KWQes5EE=; b=ih3O+w5pwLfyJk
	8H3EwEKimz+oqyazII6vOJ9G+qnfqAUH2S/yETWIVr7KROHLtE2DN9Lp781v4MUozxP6BzQ14RjBp
	SkVD6np10vR1DWEoc4cX1WGTKHfdMiGBAZQqCyg+6yQRyC8bRLy2IrXFomyp7TU+/e1J8W485QB5t
	cJYdlDUJmRBpxE0QTp56gQse3W4IkkfMHKWfp28Bh2L/HRmqmUr4Jx1CU7sDgAQEDEbiqILplwbb3
	CE9eHhjpvk/JubJp8obN75gnbcd0sP4yAsoTsVnpnV8lC83G5rLlO5Ak6fRRjYLYWsnpetpmgPsNe
	2NRfO/fKQhgiOqEGb9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8HpR-00DukD-SA; Tue, 27 Jul 2021 07:48:41 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8HF8-00DlAb-70
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 07:11:12 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so12540005oth.7
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T4jXR1i3kQRbLOtYJPUwTyuXvag/F8LgWkncG8JS3kw=;
 b=ez4vH2iSyB0oa1ojnnUH/oppE2vInZw2DCUOsIJMczkkbCo0ZS4HOfnR+wwt08JB1/
 7q1jjUTru/9XpQaSTbBlRwAZtowDWooKcMqnfiEfIf1Dr8CKgwrQCM/qlxXAhd7KKXkf
 rU7MWbV7FnnRDNoOH5oR5N8n5zhUCreFiQaVQaR+w5K5l34zgfnqfD8MBJGoWoqZfyfM
 Nu7zTgE2WC5ZGRr6Pevcop7KacBGQyqippbdLEG86KFE9yVcfj4cdhkbsSXLb+YuJG6O
 AfhzUPokeRZQcTgonnXM/FDIkMgo7udEpWmVphlhnRQSPhM0vZsM21fHWLj//wG5unao
 Tukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T4jXR1i3kQRbLOtYJPUwTyuXvag/F8LgWkncG8JS3kw=;
 b=NFeEfALby3JJ45uludh1J9iarXJwbJn4Pf58vtKTuETssxwDPSbQkFfT+6q08lKlAZ
 6FCc7cI429nJYf2uJfYsV5++Sc/VXTpiL3DQlvZ3cPQoouENt7O9d9/eZcrBN7gldFyi
 YR/M61DNrMCAz+YBof/9ShYibC23DjFHNfQgplf0Z4fg32uIkRXI+VbGd/8Jp1ol3tyg
 yfHA9P5rbw9hlFVC4d7kas9hLindjqsjvEINZuTzWVS/JS4wu9U27vlgi1rtEJcyYq1z
 gcPFl2kAUQE1fdon0FVDcEICZUWh7jnQlNB/kUjVzPyHs9lo7B/pmgmnDdUIAfpOjtrn
 rrdA==
X-Gm-Message-State: AOAM533N6lwz2BCUyvnAojXBNgT1V3INxzNtCWgrWUOzKgnaS407fKyH
 kqWPGWuZLMovQaBB5+snkobtH/7qszi/TCYTCokk2g==
X-Google-Smtp-Source: ABdhPJzcx3FBzoI6gvI0bU/P3mLzZFisd8fyRX2ATyO+zv46x7mk7zcvY5u+dCccKFE1pqsqiD0miKrhnqQkq6ZE20Q=
X-Received: by 2002:a9d:d04:: with SMTP id 4mr15077003oti.251.1627369862852;
 Tue, 27 Jul 2021 00:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
 <20210727040021.21371-2-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210727040021.21371-2-Kuan-Ying.Lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jul 2021 09:10:51 +0200
Message-ID: <CANpmjNM03Pag9OvBBVnWnSBePRxsT+BvZtBwrh_61Qzmvp+dvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan, mm: reset tag when access metadata
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Nicholas Tang <nicholas.tang@mediatek.com>,
 Andrew Yang <andrew.yang@mediatek.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, 
 Andrew Morton <akpm@linux-foundation.org>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_001110_384347_9198C7B8 
X-CRM114-Status: GOOD (  21.22  )
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

+Cc Catalin

On Tue, 27 Jul 2021 at 06:00, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> Hardware tag-based KASAN doesn't use compiler instrumentation, we
> can not use kasan_disable_current() to ignore tag check.
>
> Thus, we need to reset tags when accessing metadata.
>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

This looks reasonable, but the patch title is not saying this is
kmemleak, nor does the description say what the problem is. What
problem did you encounter? Was it a false positive?

Perhaps this should have been "kmemleak, kasan: reset pointer tags to
avoid false positives" ?

> ---
>  mm/kmemleak.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index 228a2fbe0657..73d46d16d575 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -290,7 +290,7 @@ static void hex_dump_object(struct seq_file *seq,
>         warn_or_seq_printf(seq, "  hex dump (first %zu bytes):\n", len);
>         kasan_disable_current();
>         warn_or_seq_hex_dump(seq, DUMP_PREFIX_NONE, HEX_ROW_SIZE,
> -                            HEX_GROUP_SIZE, ptr, len, HEX_ASCII);
> +                            HEX_GROUP_SIZE, kasan_reset_tag((void *)ptr), len, HEX_ASCII);
>         kasan_enable_current();
>  }
>
> @@ -1171,7 +1171,7 @@ static bool update_checksum(struct kmemleak_object *object)
>
>         kasan_disable_current();
>         kcsan_disable_current();
> -       object->checksum = crc32(0, (void *)object->pointer, object->size);
> +       object->checksum = crc32(0, kasan_reset_tag((void *)object->pointer), object->size);
>         kasan_enable_current();
>         kcsan_enable_current();
>
> @@ -1246,7 +1246,7 @@ static void scan_block(void *_start, void *_end,
>                         break;
>
>                 kasan_disable_current();
> -               pointer = *ptr;
> +               pointer = *(unsigned long *)kasan_reset_tag((void *)ptr);
>                 kasan_enable_current();
>
>                 untagged_ptr = (unsigned long)kasan_reset_tag((void *)pointer);
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210727040021.21371-2-Kuan-Ying.Lee%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
