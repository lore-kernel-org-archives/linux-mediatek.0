Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B381BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 May 2022 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tst6JSxv9JLhXhHYKyL+syjXaxs4xu3gNeyNb6rcrR4=; b=OPke33awTcrt0V
	X7v8lQ2I3B1IWY2aaEuri8B71xyZkaCCoAUMQTCxz4ZqdNlY0KOqCA8i1k8G55wWh/SvXS32M+3bW
	mVi/zTPjAmDcexqPNmJx1cdu7oCwvfOTKJL5dno4HTAMQLycmP5rrLbnEUH0HvYEYzKQ/ZzCbJcHw
	a42g7cv5xEqj+K9fypqjoVlZjiGyBOHO+lw4/MCFzzE9AM1hcGe67jrNLqH0rI/Rw2a58qlFYDfqz
	cuu82Ayi2c4uC0PakPDsNACSMvPfZ8S9lCUnql+rTzdYod6QpeNV7Kjf+2gtiJunIezDJUHgKBECp
	1rXOL5+rjFWXWxoMiuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuX5F-00HJwg-DU; Fri, 27 May 2022 10:20:41 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuX53-00HJuj-SO; Fri, 27 May 2022 10:20:31 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id i25so1822586vkr.8;
        Fri, 27 May 2022 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TZKGv1sVPbn33wSFQC2Hq1TTGl51W+KoM8tu8whSa+8=;
        b=QPJBbxLga9z4bh76vDTCdWiIm0fFqSq0xsZaD4/EcFAsk7UUqTJMVgbymVey6Y8rhP
         PboTeGA3VQ2Xk04Jjgj56gdD/R76WekWIn10md8C9xSA6SyQDTYEZQRdiVkTg3+ashWs
         QDz+w0fzSf3U8uVQe8l2oRu9SZfmbHFuRzlVO3JF5DpkGNudYVwnhl0SQRvY9f7YvbI6
         BriJ6JmHW3g8ekfRRYekCrPj7hByDo5qlteqj/chMuFuzMDADe5I+n20pP1VqzgE5IB6
         Thr5+ZRpZYeFE68q86npCR6iptHjCk+ekb5DlLWvC2h5HeIwDjVgExL1HfAwqSK9e1f6
         GoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TZKGv1sVPbn33wSFQC2Hq1TTGl51W+KoM8tu8whSa+8=;
        b=V61Jxs0XX/6J3TsmFsG7cLHGDL6XN1i4H2vfqfJ7xjYXgAgRjTCHoyhZtzNI9OmRHb
         K3YF2Bhgs+MJknTA7UoAUZSHdFjKtO+cx7BfMJdEWxwnFZjZlOfTw3wHTi+A6bXjmWX+
         BW8LEJiQu7IHtcK0FPtdcxAuOhi5ST1XWv2/AGnlqs9cMrzlrKZHIdkiloeaHuX9mxjy
         0AKK+/dDYdCXoWSn379+1QRARRXjdUWkLozOzvY6oz5hQSsvwDdMVZlTgPYMYd77CxJm
         djbgO61HMGT/MkEdLv7m95JZfCq+e4BgyuLH/Li021MZ7MRoNcLKVB6tgTh7p3tgzARe
         kChw==
X-Gm-Message-State: AOAM531HDuZLk8Ij9s/juzLsLNv+CuPSZGQsVQFlfiNU4iGYlrVwUm6p
	yWGg71KSYftHduoBSYCMxQRNP4thC9CIQY9bJXc=
X-Google-Smtp-Source: ABdhPJzCvvChTLL1Ij936+gWZfCHT1cI1LarPkF1I6RwV3Pk4C5uy4ku0CQpduox7gHOYLFdtC0zFPW6WdlyCuyLSic=
X-Received: by 2002:a1f:a107:0:b0:357:a962:cef8 with SMTP id
 k7-20020a1fa107000000b00357a962cef8mr9396561vke.10.1653646826292; Fri, 27 May
 2022 03:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220527032504.30341-1-yee.lee@mediatek.com>
In-Reply-To: <20220527032504.30341-1-yee.lee@mediatek.com>
From: patrick wang <patrick.wang.shcn@gmail.com>
Date: Fri, 27 May 2022 18:20:14 +0800
Message-ID: <CAGcnep-t7GRkQxCQw-si0QgnsP9mQepcJ+xuYeQyzJLwc0Xicw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220527_032029_979290_A6A62841 
X-CRM114-Status: GOOD (  18.41  )
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

If I understand correctly, if those blocks are dropped, they will
not be added as kmemleak objects. So how could this affect
other objects?

Thanks,
Patrick

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
