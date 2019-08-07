From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] arm64: mm: print hexadecimal EC value in
 mem_abort_decode()
Date: Wed, 7 Aug 2019 08:29:21 +0800
Message-ID: <1565137761.18034.1.camel@mtkswgap22>
References: <20190806112948.4357-1-miles.chen@mediatek.com>
         <20190806123450.GE475@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806123450.GE475@lakrids.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Anshuman Khandual <anshuman.khandual@arm.com>, James Morse <james.morse@arm.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-08-06 at 13:34 +0100, Mark Rutland wrote:
> On Tue, Aug 06, 2019 at 07:29:48PM +0800, Miles Chen wrote:
> > This change prints the hexadecimal EC value in mem_abort_decode(),
> > which makes it easier to lookup the corresponding EC in
> > the ARM Architecture Reference Manual.
> > 
> > The commit 1f9b8936f36f ("arm64: Decode information from ESR upon mem
> > faults") prints useful information when memory abort occurs. It would
> > be easier to lookup "0x25" instead of "DABT" in the document. Then we
> > can check the corresponding ISS.
> > 
> > For example:
> > Current	info	  	Document
> > 		  	EC	Exception class
> > "CP15 MCR/MRC"		0x3	"MCR or MRC access to CP15a..."
> > "ASIMD"			0x7	"Access to SIMD or floating-point..."
> > "DABT (current EL)" 	0x25	"Data Abort taken without..."
> > ...
> > 
> > Before:
> > Unable to handle kernel paging request at virtual address 000000000000c000
> > Mem abort info:
> >   ESR = 0x96000046
> >   Exception class = DABT (current EL), IL = 32 bits
> >   SET = 0, FnV = 0
> >   EA = 0, S1PTW = 0
> > Data abort info:
> >   ISV = 0, ISS = 0x00000046
> >   CM = 0, WnR = 1
> > 
> > After:
> > Unable to handle kernel paging request at virtual address 000000000000c000
> > Mem abort info:
> >   ESR = 0x96000046
> >   EC = 0x25, Exception class = DABT (current EL), IL = 32 bits
> >   SET = 0, FnV = 0
> >   EA = 0, S1PTW = 0
> > Data abort info:
> >   ISV = 0, ISS = 0x00000046
> >   CM = 0, WnR = 1
> > 
> > Cc: Mark Rutland <Mark.rutland@arm.com>
> > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > Cc: James Morse <james.morse@arm.com>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  arch/arm64/mm/fault.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index cfd65b63f36f..afb6041e25e6 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -86,8 +86,8 @@ static void mem_abort_decode(unsigned int esr)
> >  	pr_alert("Mem abort info:\n");
> >  
> >  	pr_alert("  ESR = 0x%08x\n", esr);
> > -	pr_alert("  Exception class = %s, IL = %u bits\n",
> > -		 esr_get_class_string(esr),
> > +	pr_alert("  EC = 0x%lx, Exception class = %s, IL = %u bits\n",
> > +		 ESR_ELx_EC(esr), esr_get_class_string(esr),
> 
> Could we make this:
> 
> 	pr_alert("  EC = 0x%02lx: %s, IL = %u bits\n",
> 		 ESR_ELx_EC(esr), esr_get_class_string(esr));
> 
> We don't need to spell out "Exception Class" if we say "EC", and we
> should print the EC hex value with a consistent width as we do for the
> ISS.

Thanks for the advise.
It looks better this way. I'll send patch v2.



Miles

> 
> With that:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> Thanks,
> Mark.
