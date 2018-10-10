From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: =?utf-8?B?562U5aSN?= =?utf-8?Q?=3A?= [PATCH] kasan: avoid
 out-of-bounds in unwind_frame
Date: Wed, 10 Oct 2018 10:26:18 +0100
Message-ID: <20181010092618.pwkrqqw7br7762rs@lakrids.cambridge.arm.com>
References: <1539079863-19645-1-git-send-email-chunhui.li@mediatek.com>
 <20181009103833.sk2jyhl77f5fb64r@lakrids.cambridge.arm.com>
 <193a2b2efdaf41f39cb35a72feb3b39e@MTKMBS32N1.mediatek.inc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <193a2b2efdaf41f39cb35a72feb3b39e@MTKMBS32N1.mediatek.inc>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunhui Li =?utf-8?B?KOadjuaYpei+iSk=?= <chunhui.li@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, wsd_upstream <wsd_upstream@mediatek.com>, Miles Chen =?utf-8?B?KOmZs+awkeaouik=?= <Miles.Chen@mediatek.com>, Walter-ZH Wu =?utf-8?B?KOWQs+elluWvsCk=?= <Walter-ZH.Wu@mediatek.com>, Yu Liang =?utf-8?B?KOaigeWuhyk=?= <Yu.Liang@mediatek.com>, Nichol
List-Id: linux-mediatek@lists.infradead.org

On Wed, Oct 10, 2018 at 06:45:17AM +0000, Chunhui Li (李春辉) wrote:
> Hi Mark,
> 
> kasan detect out-of-bounds in stacktrace.c line 70, it's already over READ_ONCE_NOCHECK, but still crash
> kernel-4.9/arch/arm64/kernel/stacktrace.c
> 69frame->sp = fp + 0x10;
> 70frame->fp = READ_ONCE_NOCHECK(*(unsigned long *)(fp));
> 
> we test on Android platform, kernel-4.9 build with clang 6.0.2, we will do experiment to clarify whether compiler related issue.
> 
> READ_ONCE_NOCHECK->__read_once_size_nocheck with __no_sanitize_address if enable CONFIG_KASAN
> 
> kernel-4.9/include/linux/compiler-gcc.h
> #define __no_sanitize_address __attribute__((no_sanitize_address))
> 
> kernel-4.9/include/linux/compiler-clang.h
> #define __no_sanitize_address __attribute__((no_sanitize("address")))

If READ_ONCE_NOCHECK() isn't working as intended, then this is a
compiler issue, and there are bigger problems regardless.

If we need to workaround some compiler issue, that should be done in the
implementation of READ_ONCE_NOCHECK().

Please note that there are other issues with using clang to compile the
kernel; at minimum 7.0.0 is required to build a mainline kernel (and
even then, the LSE atomics have to be explicitly disabled), so if this
only affects 6.0.x, I don't think we need to carry any workaround
upstream.

> there is patch from internet, avoid kasan by wrapping with kasan_disable_current, it seems better.
> https://lore.kernel.org/patchwork/patch/644463
> such as:
> +kasan_disable_current();
>   // access fp
> +kasan_enable_current();

Please note that the solution later in the thread [1] was to use
READ_ONCE_NOCHECK().

Thanks,
Mark.

[1] https://lore.kernel.org/patchwork/patch/644463/#829858
