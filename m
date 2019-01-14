From: Bhupesh Sharma <bhsharma@redhat.com>
Subject: Re: [PATCH v2 6/9] arm64: kexec: no need to ClearPageReserved()
Date: Mon, 14 Jan 2019 21:20:01 +0530
Message-ID: <CACi5LpPb5Mkk-AQARm96mHJ6S5KLKkSswP-=4z9oPYzK0-knEQ@mail.gmail.com>
References: <20190114125903.24845-1-david@redhat.com> <20190114125903.24845-7-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114125903.24845-7-david@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-mediatek@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Dave Kleikamp <dave.kleikamp@oracle.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>, Matthew Wilcox <willy@infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi David,

Thanks for the patch.

On Mon, Jan 14, 2019 at 6:29 PM David Hildenbrand <david@redhat.com> wrote:
>
> This will be done by free_reserved_page().
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Bhupesh Sharma <bhsharma@redhat.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Dave Kleikamp <dave.kleikamp@oracle.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Acked-by: James Morse <james.morse@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/arm64/kernel/machine_kexec.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index aa9c94113700..6f0587b5e941 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -361,7 +361,6 @@ void crash_free_reserved_phys_range(unsigned long begin, unsigned long end)
>
>         for (addr = begin; addr < end; addr += PAGE_SIZE) {
>                 page = phys_to_page(addr);
> -               ClearPageReserved(page);
>                 free_reserved_page(page);
>         }
>  }
> --
> 2.17.2
>

Reviewed-by: Bhupesh Sharma <bhsharma@redhat.com>
