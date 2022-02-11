Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F8DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 01:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIwnmE2b5laqvqBXV2sFhPt7xfZdVJ9jIrmbdDRHZOg=; b=k4Ed/SHVudFWvs
	Q9oLsPWp4Omm5GSngrikQVDJ9uyUFaZBE/uczhvIZAF2KJrhIskgdSlDLJW2S5YJBjc/foU9ByzJz
	qj3rMtFOWFT/b91dK9KOj4iEtU4f3tqaz+9yTgbxVxEPyBRNpl9wzJK3mjxo34iUQBiulMuSO0SQw
	ln5285aRvMVBmIpCrVJW0w5NTI1ShMK5TEUNxvFdkqoeKEM+UQcV/Hu9M+dCK6lIbGxQZ98JRVMtv
	dIvy0ShWeVtFLoAur4fBmEakRoA0E9wNOMqvLTQuY4htbZmmUwpnJ1RneV0TkP50Dc9+uNRtXJS3e
	WFboPT+bglHleiDR6xJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIKwc-005R5G-0C; Fri, 11 Feb 2022 01:41:54 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIKwP-005R3j-UZ; Fri, 11 Feb 2022 01:41:43 +0000
Received: by mail-io1-xd32.google.com with SMTP id w7so9720333ioj.5;
 Thu, 10 Feb 2022 17:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g672afMOWPofXOHvvpzMvP9no/e9tuPgH5JHAmWPU8Y=;
 b=ndoVMRkaFlE5uP+00x6Ts/PUE4LWG3Od0SOLJomDYAqb3ExhfLwgb32rA1o8beLjTU
 669MmZKMX15+2uZ4xHxl/nuAiB4MC5f4GuqTd44R9Ccwp6W+NSAjFpoYPz1LiOj0/EGV
 pAJXYf7fLa3OWVsitFb3SATLm2AjkK+BmXKsIZTD2y8vV8wxMmUxBs4zQgaPRFn5USk9
 RRhd9aYY7jcQhPCEA48GHdkEJIqlW+PoQClKxy1hYn1m6XwVNnm25q/4XsLCuHKNK2gV
 /mQ/1sSrJg+/U583qtvsGhxdT4GYo2eU77OIYReybBY3h90tpeLH7GImTMCXBPRn1QoI
 L/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g672afMOWPofXOHvvpzMvP9no/e9tuPgH5JHAmWPU8Y=;
 b=ufuWqgIpYPt4nM+o1IeLcA70HRApe3beH0qyM9yJQee1Tgaai2dHi2x11+Ey/iUVJc
 2peRdvdlaP+tRNC9u8YrQkoXv8LeHP8ynMFLQG2wE8eRdutvYW4H6DT1io+MZeMYtQGn
 3q7Ph4gqyaWATWPvAyoiu486ELxwBFRMkErfonFt25wRp1hkdpz5KFRchgc1bu9soX1N
 Qt2+vID/oTeAnUw3WskrsJq+vO4ECAZ2peGme3kN6zGvsGAd8g0rTZZA3xJRJX87qJ2i
 AublRU++33nSPWZ2B6P9ctw0tm0d0Y070SyxXlM0Zl3V9m1vGIz6ZCRo3ynEi4x0dedb
 EGmQ==
X-Gm-Message-State: AOAM533kh4f8cLggAmUGALsJJbsHqydCJxb6A4UTrjOaAHd+y8O2RdUX
 Ix6IiBHoBhNUAbt6t72OD736eU+NaGw7D67TKWPG/YNA2lsj+Q==
X-Google-Smtp-Source: ABdhPJxC9eGByQeSdgYqYLzhyYHZME+2EFUVP1AXlEQbwcxc0ZAHjxxfggmaKLG8zVSb6vHb/m6iuUXgbaTmS/IX0qo=
X-Received: by 2002:a02:c8c8:: with SMTP id q8mr5164312jao.243.1644543698735; 
 Thu, 10 Feb 2022 17:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20220211001345.3429572-1-gch981213@gmail.com>
In-Reply-To: <20220211001345.3429572-1-gch981213@gmail.com>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Thu, 10 Feb 2022 17:41:28 -0800
Message-ID: <CALCv0x3uYMovfqzobM6xfr8_apZQtz=DhyM-DsJe2L_rqAj65g@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: do memory detection on KSEG1
To: Chuanhong Guo <gch981213@gmail.com>
Cc: "open list:MIPS" <linux-mips@vger.kernel.org>,
 Rui Salvaterra <rsalvaterra@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_174142_033831_AC20BE23 
X-CRM114-Status: GOOD (  24.48  )
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

Hi Guo,

On Thu, Feb 10, 2022 at 4:14 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> It's reported that current memory detection code occasionally detects
> larger memory under some bootloaders.
> Current memory detection code tests whether address space wraps around
> on KSEG0, which is unreliable because it's cached.
>
> Rewrite memory size detection to perform the same test on KSEG1 instead.
> While at it, this patch also does the following two things:
> 1. use a fixed pattern instead of a random function pointer as the magic
>    value.
> 2. add an additional memory write and a second comparison as part of the
>    test to prevent possible smaller memory detection result due to
>    leftover values in memory.
>
> Fixes: 139c949f7f0a MIPS: ("ralink: mt7621: add memory detection support")
> Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
> index d6efffd4dd20..12c8808e0dea 100644
> --- a/arch/mips/ralink/mt7621.c
> +++ b/arch/mips/ralink/mt7621.c
> @@ -22,7 +22,9 @@
>
>  #include "common.h"
>
> -static void *detect_magic __initdata = detect_memory_region;
> +#define MT7621_MEM_TEST_PATTERN         0xaa5555aa
> +
> +static u32 detect_magic __initdata;
>
>  int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
>  {
> @@ -58,24 +60,32 @@ phys_addr_t mips_cpc_default_phys_base(void)
>         panic("Cannot detect cpc address");
>  }
>
> +static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
> +{
> +       void *dm = (void *)KSEG1ADDR(&detect_magic);
> +
> +       if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
> +               return true;
> +       __raw_writel(MT7621_MEM_TEST_PATTERN, dm);
> +       if (__raw_readl(dm) != __raw_readl(dm + size))
> +               return false;
> +       __raw_writel(!MT7621_MEM_TEST_PATTERN, dm);
> +       return __raw_readl(dm) == __raw_readl(dm + size);
> +}
> +
>  static void __init mt7621_memory_detect(void)
>  {
> -       void *dm = &detect_magic;
>         phys_addr_t size;
>
> -       for (size = 32 * SZ_1M; size < 256 * SZ_1M; size <<= 1) {
> -               if (!__builtin_memcmp(dm, dm + size, sizeof(detect_magic)))
> -                       break;
> +       for (size = 32 * SZ_1M; size <= 256 * SZ_1M; size <<= 1) {
> +               if (mt7621_addr_wraparound_test(size)) {
> +                       memblock_add(MT7621_LOWMEM_BASE, size);
> +                       return;
> +               }
>         }
>
> -       if ((size == 256 * SZ_1M) &&
> -           (CPHYSADDR(dm + size) < MT7621_LOWMEM_MAX_SIZE) &&
> -           __builtin_memcmp(dm, dm + size, sizeof(detect_magic))) {
> -               memblock_add(MT7621_LOWMEM_BASE, MT7621_LOWMEM_MAX_SIZE);
> -               memblock_add(MT7621_HIGHMEM_BASE, MT7621_HIGHMEM_SIZE);
> -       } else {
> -               memblock_add(MT7621_LOWMEM_BASE, size);
> -       }
> +       memblock_add(MT7621_LOWMEM_BASE, MT7621_LOWMEM_MAX_SIZE);
> +       memblock_add(MT7621_HIGHMEM_BASE, MT7621_HIGHMEM_SIZE);
>  }
>
>  void __init ralink_of_remap(void)
> --
> 2.34.1
>
Thanks for your change. I think this will also fix
https://lore.kernel.org/lkml/202201191557.OISJHNMi-lkp@intel.com/
since you are removing __builtin_memcmp usage.

Ilya

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
