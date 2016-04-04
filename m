From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [RFC PATCH 0/9] ARM: start to move arch/arm/mach-* to arch/arm/platforms/*
Date: Mon, 4 Apr 2016 10:57:56 +0900
Message-ID: <CAK7LNAR4sNgUwGskvNZcs84aDsmUjifff7V8xUjCjdjCETbtLQ@mail.gmail.com>
References: <1459694367-18635-1-git-send-email-yamada.masahiro@socionext.com>
	<20160403182543.GQ19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160403182543.GQ19428@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Mark Brown <broonie@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Marcus Cooper <codekipper@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Russell,

2016-04-04 3:25 GMT+09:00 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> On Sun, Apr 03, 2016 at 11:39:18PM +0900, Masahiro Yamada wrote:
>> We have growing number of mach-* directories in arch/arm, and I guess
>> it might be a good time to discuss moving them into a sub-directory.
>
> What does it buy us?  Let me summarise the actual change:
>
> - Move up to 71 arch/arm/mach-* directories to arch/arm/platforms/*,
>   which just means another level of directory structure.  We still
>   end up with up to 71 directories in arch/arm/platforms/

True, but we can separate non-SoC directories (kernel/, mm/, configs/, etc.)
from mach- directories, at least.


> - The ability to use obj-y rather than machine-y, where both already
>   work in the same way.

Yes, but Kbuild standard Makefiles might provide more flexible
directory structures
to tidy up similar SoC families from the same vendor.

For example,

arch/arm/platforms/samsung/
arch/arm/platforms/samsung/exynos/
arch/arm/platforms/samsung/s3c64xx/

instead of

arch/arm/plat-samsung/
arch/arm/mach-exynos/
arch/arm/mach-s3c64xx/

I am missing something, though.



> Is there anything I missed?
>
> If that is all, then I really do not like this change - it's seems
> to be churn for no benefit, and that's something we really should be
> minimising.  Linus Torvalds has historically moaned at the ARM
> architecture for stuff like this.

OK.


-- 
Best Regards
Masahiro Yamada
