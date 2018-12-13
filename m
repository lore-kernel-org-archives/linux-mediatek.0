From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH] arm64: kaslr: print PHYS_OFFSET in dump_kernel_offset()
Date: Thu, 13 Dec 2018 19:15:45 +0100
Message-ID: <CAKv+Gu_40M=JO+P3GOJogXfm=x0JXYjHs=rHWAtR-6QNxjSYvA@mail.gmail.com>
References: <1544612209-13660-1-git-send-email-miles.chen@mediatek.com> <20181213181317.GD18185@edgewater-inn.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213181317.GD18185@edgewater-inn.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Miles Chen <miles.chen@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Thu, 13 Dec 2018 at 19:12, Will Deacon <will.deacon@arm.com> wrote:
>
> [+Ard because I'll basically go with his preference on this one]
>
> On Wed, Dec 12, 2018 at 06:56:49PM +0800, Miles Chen wrote:
> > When debug with kaslr, it is sometimes necessary to have PHYS_OFFSET to
> > perform linear virtual address to physical address translation.
> > Sometimes we're debugging with only few information such as a kernel log
> > and a symbol file, print PHYS_OFFSET in dump_kernel_offset() for that case.
> >
> > Tested by:
> > echo c > /proc/sysrq-trigger
> > [   11.996161] SMP: stopping secondary CPUs
> > [   11.996732] Kernel Offset: 0x2522200000 from 0xffffff8008000000
> > [   11.996881] PHYS_OFFSET: 0xffffffeb40000000
> >
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > Tested-by: Miles Chen <miles.chen@mediatek.com>

Fine with me, but I would like to see an ack from Miles Chen :-)

> > ---
> >  arch/arm64/kernel/setup.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> > index f4fc1e0544b7..4b0e1231625c 100644
> > --- a/arch/arm64/kernel/setup.c
> > +++ b/arch/arm64/kernel/setup.c
> > @@ -388,6 +388,7 @@ static int dump_kernel_offset(struct notifier_block *self, unsigned long v,
> >       if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && offset > 0) {
> >               pr_emerg("Kernel Offset: 0x%lx from 0x%lx\n",
> >                        offset, KIMAGE_VADDR);
> > +             pr_emerg("PHYS_OFFSET: 0x%llx\n", PHYS_OFFSET);
> >       } else {
> >               pr_emerg("Kernel Offset: disabled\n");
> >       }
> > --
> > 2.18.0
> >
