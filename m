From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2] arm64: mm: print hexadecimal EC value in
 mem_abort_decode()
Date: Thu, 8 Aug 2019 11:51:33 +0530
Message-ID: <256df022-6ad2-bae8-cc94-908adf409a07@arm.com>
References: <20190807003336.28040-1-miles.chen@mediatek.com>
 <98bdbcfb-24ed-fcd8-4b2c-f2c78b245dda@arm.com>
 <1565244075.26350.3.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565244075.26350.3.camel@mtkswgap22>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Mark Rutland <Mark.rutland@arm.com>, James Morse <james.morse@arm.com>
List-Id: linux-mediatek@lists.infradead.org



On 08/08/2019 11:31 AM, Miles Chen wrote:
> On Thu, 2019-08-08 at 11:19 +0530, Anshuman Khandual wrote:
>>
>> On 08/07/2019 06:03 AM, Miles Chen wrote:
>>> This change prints the hexadecimal EC value in mem_abort_decode(),
>>> which makes it easier to lookup the corresponding EC in
>>> the ARM Architecture Reference Manual.
>>>
>>> The commit 1f9b8936f36f ("arm64: Decode information from ESR upon mem
>>> faults") prints useful information when memory abort occurs. It would
>>> be easier to lookup "0x25" instead of "DABT" in the document. Then we
>>> can check the corresponding ISS.
>>>
>>> For example:
>>> Current	info	  	Document
>>> 		  	EC	Exception class
>>> "CP15 MCR/MRC"		0x3	"MCR or MRC access to CP15a..."
>>> "ASIMD"			0x7	"Access to SIMD or floating-point..."
>>> "DABT (current EL)" 	0x25	"Data Abort taken without..."
>>> ...
>>>
>>> Before:
>>> Unable to handle kernel paging request at virtual address 000000000000c000
>>> Mem abort info:
>>>   ESR = 0x96000046
>>>   Exception class = DABT (current EL), IL = 32 bits
>>>   SET = 0, FnV = 0
>>>   EA = 0, S1PTW = 0
>>> Data abort info:
>>>   ISV = 0, ISS = 0x00000046
>>>   CM = 0, WnR = 1
>>>
>>> After:
>>> Unable to handle kernel paging request at virtual address 000000000000c000
>>> Mem abort info:
>>>   ESR = 0x96000046
>>>   EC = 0x25: DABT (current EL), IL = 32 bits
>>>   SET = 0, FnV = 0
>>>   EA = 0, S1PTW = 0
>>> Data abort info:
>>>   ISV = 0, ISS = 0x00000046
>>>   CM = 0, WnR = 1
>>>
>>> Change since v1:
>>> print "EC" instead of "Exception class"
>>> print EC in fixwidth
>>>
>>> Cc: Mark Rutland <Mark.rutland@arm.com>
>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Cc: James Morse <james.morse@arm.com>
>>> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
>>
>> This version implements the suggestion, hence it should have
>> also contained acked-by tag from Mark from earlier version.
>>
> 
> No problem. Sorry for not including the tag.
> I was not sure if I should add the acked-by tag from Mark in patch v2.

Yeah because V2 has now implemented the suggestion as required for
getting the tag per Mark in V1.

> 
>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> If I send patch v3, I should include acked-by tag from Mark and
> Reviewed-by tag from you, right?

Right.
