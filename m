From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC 6/7] arm64: kexec: no need to ClearPageReserved()
Date: Wed, 5 Dec 2018 14:00:35 +0000
Message-ID: <ce6a4c28-3c3b-329e-df01-325294bd9b2e@arm.com>
References: <20181205122851.5891-1-david@redhat.com>
 <20181205122851.5891-7-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205122851.5891-7-david@redhat.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-mediatek@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Bhupesh Sharma <bhsharma@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>, Dave Kleikamp <dave.kleikamp@oracle.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>, Matthew Wilcox <willy@infradead.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

Hi David,

(CC: +Akashi)

On 05/12/2018 12:28, David Hildenbrand wrote:
> This will already be done by free_reserved_page().

(will already be -> will be ?)

So it does!


> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index 922add8adb74..0ef4ea73aa54 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -353,7 +353,6 @@ void crash_free_reserved_phys_range(unsigned long begin, unsigned long end)
>  
>  	for (addr = begin; addr < end; addr += PAGE_SIZE) {
>  		page = phys_to_page(addr);
> -		ClearPageReserved(page);
>  		free_reserved_page(page);
>  	}
>  }
> 

Acked-by: James Morse <james.morse@arm.com>


Thanks,

James
