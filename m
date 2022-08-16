Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C5AC25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oX7Uw1GdRzWPUR63yLpyR3Y8vFILF4KqV1mUqs3+f2U=; b=kmfbqdTbFURxcawDM8usUbyvns
	28+YnX3zNtP/bWNq4syn8P+WXjNbe0ynWpt+3+1HuJJgwRpjC3lY9GCgx8ebIDuNk3uCRZKpUJhzg
	CE9M9L7D7vfAtFSj/R65TdZ2B0UYXNwCe9Cyva4y5v9TSoRzB5QQxp0LMADxUAJk5o1IyQH+pKn3L
	TBSexqGCqnDvknMAwSwxCG7LEYTfJtBhUO4bFZNA0vVm6yV5Bz3j7HFHR8C26/qxuWtECIpRPNmdp
	bjt/FnZGuIIPfMiUPWnlHSyBLf7QwzScjda3fXAbtjdjblFI2bbLoAEoRYzYNh6F1Y7M5Wve6u21J
	1RSWYgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNxpA-003Zdd-71; Tue, 16 Aug 2022 14:45:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNxov-003ZUn-Ri; Tue, 16 Aug 2022 14:45:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B56A3610E7;
	Tue, 16 Aug 2022 14:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8958FC43144;
	Tue, 16 Aug 2022 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660661127;
	bh=xZzBfr/VvA4fl3EbZW4ZxaDkGPC5m8/WRe3PfD6pY54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V99ax+ID6rclDTUIBrCce/ZZOMJ6HYyMR5MXZ93azt+fU7Q5cM9q5XgmgsPF93PjR
	 jPOgSCCuQWxR1fM0ZgLJ7A7Xg1tvqr6Ne2vFCZZOj1SXSQ0Cd615ej/r4YGfDtzV6S
	 DHGEK04pAXShvEPBg+vxg0nEFrC55eytopkEHXgNsZ1dJCm0Xa6f/cM59rAvExiYLr
	 /trybM3fams6TtgpOvGtEggm9k1bBTjnj0V+3Pstj9lMsarcG6LCK2gNVsfU2xuR9d
	 gsjRf6ag/Ttl+sQZKaVFtV3L0+3cNzWUNcOI8nl0tzRjcQA17PS/oUL90diN0HSMrn
	 dfJCb+/cc6cBw==
Received: by mail-wr1-f49.google.com with SMTP id v3so12942792wrp.0;
        Tue, 16 Aug 2022 07:45:27 -0700 (PDT)
X-Gm-Message-State: ACgBeo3of7bPDNHF3cbL7TcI0s1ZcgR/i9K4ud+dOAV+0hTj1m4QuapS
	09NR3WbCuM45n0XrzHPc4lAku2pFq2n2015kPXk=
X-Google-Smtp-Source: AA6agR7JnQbViXE0WQ5IRSRqxR1MS+ODZfFKzYZJNwhcX6lu+uLF0bhIlhQSwp40TtpGDSVYuLnOKCWT7GSnefojbGg=
X-Received: by 2002:adf:d238:0:b0:21e:c972:7505 with SMTP id
 k24-20020adfd238000000b0021ec9727505mr12174103wrh.536.1660661125577; Tue, 16
 Aug 2022 07:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220814152437.2374207-1-sashal@kernel.org> <20220814152437.2374207-54-sashal@kernel.org>
In-Reply-To: <20220814152437.2374207-54-sashal@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 16 Aug 2022 16:45:14 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEzSwOtMGUi1VMg9xj60sHJ=9GHdjK2LXBXahSPmm56jw@mail.gmail.com>
Message-ID: <CAMj1kXEzSwOtMGUi1VMg9xj60sHJ=9GHdjK2LXBXahSPmm56jw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.19 54/64] ARM: 9202/1: kasan: support CONFIG_KASAN_VMALLOC
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, linux@armlinux.org.uk, ryabinin.a.a@gmail.com, 
	matthias.bgg@gmail.com, arnd@arndb.de, rostedt@goodmis.org, 
	nick.hawkins@hpe.com, john@phrozen.org, linux-arm-kernel@lists.infradead.org, 
	kasan-dev@googlegroups.com, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_074530_020386_8C11DC66 
X-CRM114-Status: GOOD (  24.79  )
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

On Sun, 14 Aug 2022 at 17:30, Sasha Levin <sashal@kernel.org> wrote:
>
> From: Lecopzer Chen <lecopzer.chen@mediatek.com>
>
> [ Upstream commit 565cbaad83d83e288927b96565211109bc984007 ]
>
> Simply make shadow of vmalloc area mapped on demand.
>
> Since the virtual address of vmalloc for Arm is also between
> MODULE_VADDR and 0x100000000 (ZONE_HIGHMEM), which means the shadow
> address has already included between KASAN_SHADOW_START and
> KASAN_SHADOW_END.
> Thus we need to change nothing for memory map of Arm.
>
> This can fix ARM_MODULE_PLTS with KASan, support KASan for higmem
> and support CONFIG_VMAP_STACK with KASan.
>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This patch does not belong in -stable. It has no fixes: or cc:stable
tags, and the contents are completely inappropriate for backporting
anywhere. In general, I think that no patch that touches arch/arm
(with the exception of DTS updates, perhaps) should ever be backported
unless proposed or acked by the maintainer.

I know I shouldn't ask, but how were these patches build/boot tested?
KAsan is very tricky to get right, especially on 32-bit ARM ...

> ---
>  arch/arm/Kconfig         | 1 +
>  arch/arm/mm/kasan_init.c | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 7630ba9cb6cc..545d2d4a492b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -75,6 +75,7 @@ config ARM
>         select HAVE_ARCH_KFENCE if MMU && !XIP_KERNEL
>         select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
>         select HAVE_ARCH_KASAN if MMU && !XIP_KERNEL
> +       select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
>         select HAVE_ARCH_MMAP_RND_BITS if MMU
>         select HAVE_ARCH_PFN_VALID
>         select HAVE_ARCH_SECCOMP
> diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
> index 5ad0d6c56d56..29caee9c79ce 100644
> --- a/arch/arm/mm/kasan_init.c
> +++ b/arch/arm/mm/kasan_init.c
> @@ -236,7 +236,11 @@ void __init kasan_init(void)
>
>         clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
>
> -       kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
> +       if (!IS_ENABLED(CONFIG_KASAN_VMALLOC))
> +               kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
> +                                           kasan_mem_to_shadow((void *)VMALLOC_END));
> +
> +       kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_END),
>                                     kasan_mem_to_shadow((void *)-1UL) + 1);
>
>         for_each_mem_range(i, &pa_start, &pa_end) {
> --
> 2.35.1
>

