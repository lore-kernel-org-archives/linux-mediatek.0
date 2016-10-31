From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] ARM: mediatek: clean up mach-mediatek/Makefile
Date: Mon, 31 Oct 2016 22:15:39 +0900
Message-ID: <CAK7LNAQbaQ38RZqgmJJW+BHOthrK5tPZ5JPPh9N9ry58YZ=kdg@mail.gmail.com>
References: <1474222273-23116-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474222273-23116-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Matthias,


Can you pick up this for your next pull request?



2016-09-19 3:11 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Kbuild descends into arch/arm/mach-mediatek/Makefile only when
> CONFIG_ARCH_MEDIATEK is enabled.  So, obj-$(CONFIG_ARCH_MEDIATEK)
> is always equivalent to obj-y in this Makefile.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/arm/mach-mediatek/Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-mediatek/Makefile b/arch/arm/mach-mediatek/Makefile
> index 2116460..dadae67 100644
> --- a/arch/arm/mach-mediatek/Makefile
> +++ b/arch/arm/mach-mediatek/Makefile
> @@ -1,4 +1,2 @@
> -ifeq ($(CONFIG_SMP),y)
> -obj-$(CONFIG_ARCH_MEDIATEK) += platsmp.o
> -endif
> -obj-$(CONFIG_ARCH_MEDIATEK) += mediatek.o
> +obj-$(CONFIG_SMP)      += platsmp.o
> +obj-y                  += mediatek.o
> --
> 1.9.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Best Regards
Masahiro Yamada
