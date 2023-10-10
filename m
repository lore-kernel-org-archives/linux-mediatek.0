Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A962CD8CB4
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 19:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9C33FK/mhypuEKRvbN96wMq7Q2blPztB7nZo12h8b8=; b=PTXOR5qfXr1fa+W0p9MfhuapCL
	JTcZ6jBtHC1DpEOOHsUztd9/xOW7uano60p9id/SK5ItLkXQa6ALylJlWPU8h34xzn4EZEY1hetTe
	8dYHqiX9Oi9NjbrxS6kN7r1Mxjqky7j6W4U/uDxjAWEgFGmyyrNCN33GE6Z7YtbY3Wz7ky95AhhLf
	8meFo5jVI199cGdC97+cvrMogC5VBuOJOBjCikA9fr1ZtzpweWvBaJgIt2vxTsW0Y5ayoXXscW9kX
	0c7afIGyyQhlcjrngEEG4Y0S2Rg5klT0QeFugev4g/r/OV7q7Vnk5VzyDTyvqV2TMrnRGSzUu5zA5
	mgWaWE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqI8n-00E0i9-31;
	Tue, 10 Oct 2023 19:11:37 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqI8i-00E0eR-2p;
	Tue, 10 Oct 2023 19:11:35 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-57bb6a2481fso2970460eaf.1;
        Tue, 10 Oct 2023 12:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696965088; x=1697569888; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9C33FK/mhypuEKRvbN96wMq7Q2blPztB7nZo12h8b8=;
        b=H7abd0bwY3vNMEh0E9LBocLHid63VpNk3WHRK1ezXIb2WQu5iDd9eSrW7P+6biDK+R
         nXwJWqI6jI5WZLvwRucWqSgYOC7ujirl8dPZw1zPcWEa34sgZlzrOaRrqOyxy9Z2pklg
         KlkXrgFRqC2jZzrmpcbpX6eTrgiv4Y7dqt2gsMA5FseOSRQ8VYE+aI/WtNF7XRAggd4T
         vzNFtPkp188rXvQ56uZ40H18kzWjnrS8UG9OY1ZuMC4M/anlylmnQQ3XSQsDxqR6OTFy
         zMaT5/Emk/NpfUGBbxXZDUJ9Mvhv1PJk2TnHPswIzy9ApQqablWveqmLaKDyqBbBnkO7
         wHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696965088; x=1697569888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9C33FK/mhypuEKRvbN96wMq7Q2blPztB7nZo12h8b8=;
        b=aoeZxOUWk+gVFPGxI2ajZV8ZWB62u8ZrgMUkejmjagI5DTU23LXSSORaF38qWnRPCi
         aY5ffRvyTPRQr3gFBS8FnbwERqYPv14SfoCtIvRWiHb2csyufj/MHEdlTBRIqsUYveUE
         Al0s2W67KSHal/xYNQoOnzdGifnWTkCsG5ZpGl2zsem2jSqI5FhMcR5T+0GOXLfyXm7O
         pP/XHhJCdTExBy7xNFTXcQ/p9NJJZOn3NagTMFZsidkUsH04epAt/HRuTYYMo19UN4Mb
         ZrAkSV9jvnqsChB0O16m6+w4npW1/kbMk/bDlxoAA2Ld2IgaI18b/HU/YfWcO0G6I5fM
         AfgQ==
X-Gm-Message-State: AOJu0YzKZDv+wpW30CxMWJz4uU7euXSa4sFgsMp5fCJcR/bbwyKv+V1U
	EGVxjXjsepvIHyxNvRVER3PaN+ER+rgHBhpjRPE=
X-Google-Smtp-Source: AGHT+IH6dRoUciMjgYLJk6PPxfjAtk7XfoSMwaSpFdWn4qtmxLsLRTU4XkvMLjfMaPaKXk1Dov3ncHoPahlMrRoARhY=
X-Received: by 2002:a05:6358:7246:b0:14f:9904:a17f with SMTP id
 i6-20020a056358724600b0014f9904a17fmr12015198rwa.15.1696965087737; Tue, 10
 Oct 2023 12:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231009073748.159228-1-haibo.li@mediatek.com>
In-Reply-To: <20231009073748.159228-1-haibo.li@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 10 Oct 2023 21:11:15 +0200
Message-ID: <CA+fCnZev8zdLV2Q4P5gyGEvLZpmpd5Afi8j3KAyHTFGKt5oTOg@mail.gmail.com>
Subject: Re: [PATCH v2] kasan:print the original fault addr when access
 invalid shadow
To: Haibo Li <haibo.li@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, xiaoming.yu@mediatek.com, 
	Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_121132_913928_C60DEAD2 
X-CRM114-Status: GOOD (  26.24  )
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

On Mon, Oct 9, 2023 at 9:37=E2=80=AFAM Haibo Li <haibo.li@mediatek.com> wro=
te:
>
> when the checked address is illegal,the corresponding shadow address
> from kasan_mem_to_shadow may have no mapping in mmu table.
> Access such shadow address causes kernel oops.
> Here is a sample about oops on arm64(VA 39bit)
> with KASAN_SW_TAGS and KASAN_OUTLINE on:
>
> [ffffffb80aaaaaaa] pgd=3D000000005d3ce003, p4d=3D000000005d3ce003,
>     pud=3D000000005d3ce003, pmd=3D0000000000000000
> Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 3 PID: 100 Comm: sh Not tainted 6.6.0-rc1-dirty #43
> Hardware name: linux,dummy-virt (DT)
> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : __hwasan_load8_noabort+0x5c/0x90
> lr : do_ib_ob+0xf4/0x110
> ffffffb80aaaaaaa is the shadow address for efffff80aaaaaaaa.
> The problem is reading invalid shadow in kasan_check_range.
>
> The generic kasan also has similar oops.
>
> It only reports the shadow address which causes oops but not
> the original address.
>
> Commit 2f004eea0fc8("x86/kasan: Print original address on #GP")
> introduce to kasan_non_canonical_hook but limit it to KASAN_INLINE.
>
> This patch extends it to KASAN_OUTLINE mode.
>
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>
> ---
> v2:
> - In view of the possible perf impact by checking shadow address,change
>    to use kasan_non_canonical_hook as it works after oops.
> ---
>  include/linux/kasan.h | 6 +++---
>  mm/kasan/report.c     | 4 +---
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 3df5499f7936..a707ee8b19ce 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -466,10 +466,10 @@ static inline void kasan_free_module_shadow(const s=
truct vm_struct *vm) {}
>
>  #endif /* (CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS) && !CONFIG_KASA=
N_VMALLOC */
>
> -#ifdef CONFIG_KASAN_INLINE
> +#ifdef CONFIG_KASAN
>  void kasan_non_canonical_hook(unsigned long addr);
> -#else /* CONFIG_KASAN_INLINE */
> +#else /* CONFIG_KASAN */
>  static inline void kasan_non_canonical_hook(unsigned long addr) { }
> -#endif /* CONFIG_KASAN_INLINE */
> +#endif /* CONFIG_KASAN */
>
>  #endif /* LINUX_KASAN_H */
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index ca4b6ff080a6..3974e4549c3e 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -621,9 +621,8 @@ void kasan_report_async(void)
>  }
>  #endif /* CONFIG_KASAN_HW_TAGS */
>
> -#ifdef CONFIG_KASAN_INLINE
>  /*
> - * With CONFIG_KASAN_INLINE, accesses to bogus pointers (outside the hig=
h
> + * With CONFIG_KASAN, accesses to bogus pointers (outside the high
>   * canonical half of the address space) cause out-of-bounds shadow memor=
y reads
>   * before the actual access. For addresses in the low canonical half of =
the
>   * address space, as well as most non-canonical addresses, that out-of-b=
ounds
> @@ -659,4 +658,3 @@ void kasan_non_canonical_hook(unsigned long addr)
>         pr_alert("KASAN: %s in range [0x%016lx-0x%016lx]\n", bug_type,
>                  orig_addr, orig_addr + KASAN_GRANULE_SIZE - 1);
>  }
> -#endif
> --
> 2.18.0
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thank you!

On a related note, I have debugged the reason why
kasan_non_canonical_hook sometimes doesn't get engaged properly for
the SW_TAGS mode. I'll post a fix next week.

