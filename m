Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A449C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 May 2022 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgFdziSXQJbchyn30k050pHbUnZCosn33/bbNQCF/Ew=; b=VuVy5gxRnaWq4f
	vzRmKfuUeK85gR9T9udft09Q+uDizZfFKGIV9Qwp9Admt2Z7aRqjtpJjWt2wrKMmQyGe7L1Zhf18i
	2TefYU+oak4Ln71ED0C36amorX6pM95TNk34Q118pa+oSlb4539TwRNXkKJIjIHGfwv1RFPTL5v/R
	y+bMxHA8RR5nnj1a9/fjDKIYK06DuDDoCOmc/9mGx73IJWG58/jiieT8mM7SszoCTwxFdT7mbO58X
	W0RX7003W+OoVinc8DzFPcBWYimO9VukHTB+g7Vpfp+ZMoLckhELUHEQapeq+BAGqqG/K9hCYuvle
	rEzdys5Y8umc76Bis6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuaBl-0008xe-FW; Fri, 27 May 2022 13:39:37 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuaBa-0008w8-Ir; Fri, 27 May 2022 13:39:28 +0000
Received: by mail-vs1-xe31.google.com with SMTP id z6so4324470vsp.0;
        Fri, 27 May 2022 06:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hqlg/w/fu3XfRPgdp6en7FxQt+ggN/0l4WsjVJitcVw=;
        b=E2N132fvML6LrBTQk8CEDkWoE7iy6xHPtSdsWWbkkJ9qx2SDmdbsk/2gZz41g52LIE
         TcZrptshVkbF1zidVo3NqoiA1Uj+rRgGCrItspUx/MsbD65NZ8wCsJ+43tj4gSeOdyJT
         PDceHpT5Vc6O6aiNnu+WO7zRsm/ZUcsQBLdfKAu0+d55JKS4L707dtA0tKPlQhZPO4AQ
         oOFpQsdwi00qCGrzgNViGIUY0Y1RE5lk7BpBlg5pEVPibtdTb9whrFBl5rzaxws2CT+a
         sBxIiY+cNOSyLigrEBXnMpZvAUdhsyip742SYxRJRmSF4QJYeqSgWjShR9cflZxibk0M
         Uodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqlg/w/fu3XfRPgdp6en7FxQt+ggN/0l4WsjVJitcVw=;
        b=KCY9NKNLlfV9FlM4AC2LLhxyRBipNvoc4riPClOkFUv1LZIbuqX6jv5TRcqWcUMGZa
         G9eY+SXETGaB4JTlQzE7EAOrci61VicrYMM+QmtNYGSd090cgfi3yuPxzvFPYFnIMES2
         +GvzqNZzmmAmGz9JwnPytHe382C66yrCSYXRQh3pbnquwqZBFO6jpzJfUe5AvqzjFIFw
         nHqasGdhXimNUNkeNO9DSa1EhM9c+nkd2nkWSvSk2TjVnDR/Cv/xCwTAcSrECQ3I2WWR
         qc42IuuAZnt5qC6X0DfdKp6aGnTkxxz0fW7zblfG5uyt7GUMweWNyyW4PRBuM+V+nJ3e
         Mo9A==
X-Gm-Message-State: AOAM5329SQSRDJCDuJd0Gta9ynN+sDQtTcQL2iaWAWphi9Mk0P9nawli
	PoJtoOZSULiwgnLDgMO5h1LGtX/bNlq7jzXsXSgZu/m0wBw=
X-Google-Smtp-Source: ABdhPJySDv0PWTGe7FNJUI4axliR/+waikOZH4xVOoaC6lc/giZe/1RKNxnwujNEmpiXphYOtn97ISHWrkU6BVu3v/M=
X-Received: by 2002:a67:d808:0:b0:337:8cab:6c00 with SMTP id
 e8-20020a67d808000000b003378cab6c00mr14451432vsj.66.1653658764178; Fri, 27
 May 2022 06:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220527032504.30341-1-yee.lee@mediatek.com>
In-Reply-To: <20220527032504.30341-1-yee.lee@mediatek.com>
From: patrick wang <patrick.wang.shcn@gmail.com>
Date: Fri, 27 May 2022 21:39:11 +0800
Message-ID: <CAGcnep9B+z8QG4f4kkW8NF+fM1Kgj=NOV=YRhLK4yK74jbqpAw@mail.gmail.com>
Subject: Re: [PATCH] mm: kmemleak: Skip check in kmemleak_*_phys when pfn
 bound is not ready
To: yee.lee@mediatek.com
Cc: linux-kernel@vger.kernel.org, Kuan-Ying.lee@mediatek.com, 
	Andrew.Yang@mediatek.com, Sunny.Kao@mediatek.com, chinwen.chang@mediatek.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_063926_664493_CF83A218 
X-CRM114-Status: GOOD (  18.15  )
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

On Fri, May 27, 2022 at 11:25 AM <yee.lee@mediatek.com> wrote:
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> In some archs (arm64), memblock allocates memory in boot time when
> the pfn boundary (max_pfn/min_pfn) is not ready. The lowmen checks in
> kmemleak_*_phys() drop those blocks and cause some false leak alarms
> on common kernel objects.
>
> Kmemleak output: (Qemu/arm64)
> unreferenced object 0xffff0000c0170a00 (size 128):
>   comm "swapper/0", pid 1, jiffies 4294892404 (age 126.208s)
>   hex dump (first 32 bytes):
>     62 61 73 65 00 00 00 00 00 00 00 00 00 00 00 00  base............
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<(____ptrval____)>] __kmalloc_track_caller+0x1b0/0x2e4
>     [<(____ptrval____)>] kstrdup_const+0x8c/0xc4
>     [<(____ptrval____)>] kvasprintf_const+0xbc/0xec
>     [<(____ptrval____)>] kobject_set_name_vargs+0x58/0xe4
>     [<(____ptrval____)>] kobject_add+0x84/0x100
>     [<(____ptrval____)>] __of_attach_node_sysfs+0x78/0xec
>     [<(____ptrval____)>] of_core_init+0x68/0x104
>     [<(____ptrval____)>] driver_init+0x28/0x48
>     [<(____ptrval____)>] do_basic_setup+0x14/0x28
>     [<(____ptrval____)>] kernel_init_freeable+0x110/0x178
>     [<(____ptrval____)>] kernel_init+0x20/0x1a0
>     [<(____ptrval____)>] ret_from_fork+0x10/0x20
>
> This patch relaxs the boundary checking in kmemleak_*_phys api
> if max_low_pfn is uninitialzed.
>
> Fixes: 23c2d4 (mm: kmemleak: take a full lowmem check in kmemleak_*_phy)
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> ---
>  mm/kmemleak.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index a182f5ddaf68..6b2af544aa0f 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -1132,7 +1132,7 @@ EXPORT_SYMBOL(kmemleak_no_scan);
>  void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int min_count,
>                                gfp_t gfp)
>  {
> -       if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
> +       if (!max_low_pfn || (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn))

Just skip checking will bring the crash possibility back. Seems it's beyond
these interfaces' handle scope for this situation, since "min_low_pfn" and
"max_low_pfn" are depending on arches.

>                 kmemleak_alloc(__va(phys), size, min_count, gfp);
>  }
>  EXPORT_SYMBOL(kmemleak_alloc_phys);
> @@ -1146,7 +1146,7 @@ EXPORT_SYMBOL(kmemleak_alloc_phys);
>   */
>  void __ref kmemleak_free_part_phys(phys_addr_t phys, size_t size)
>  {
> -       if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
> +       if (!max_low_pfn || (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn))
>                 kmemleak_free_part(__va(phys), size);
>  }
>  EXPORT_SYMBOL(kmemleak_free_part_phys);
> @@ -1158,7 +1158,7 @@ EXPORT_SYMBOL(kmemleak_free_part_phys);
>   */
>  void __ref kmemleak_not_leak_phys(phys_addr_t phys)
>  {
> -       if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
> +       if (!max_low_pfn || (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn))
>                 kmemleak_not_leak(__va(phys));
>  }
>  EXPORT_SYMBOL(kmemleak_not_leak_phys);
> @@ -1170,7 +1170,7 @@ EXPORT_SYMBOL(kmemleak_not_leak_phys);
>   */
>  void __ref kmemleak_ignore_phys(phys_addr_t phys)
>  {
> -       if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
> +       if (!max_low_pfn || (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn))
>                 kmemleak_ignore(__va(phys));
>  }
>  EXPORT_SYMBOL(kmemleak_ignore_phys);
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
