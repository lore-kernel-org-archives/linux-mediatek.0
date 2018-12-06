From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 7/7] mm: better document PG_reserved
Date: Thu, 6 Dec 2018 11:46:41 +0100
Message-ID: <a395c1af-9220-772b-df85-52b8de33bbc9@redhat.com>
References: <20181205122851.5891-1-david@redhat.com>
 <20181205122851.5891-8-david@redhat.com>
 <20181205143510.GA17232@bombadil.infradead.org>
 <46d0e90f-f0bb-815e-7a5b-4429de1c502a@redhat.com>
 <20181205173201.GA11646@bombadil.infradead.org>
 <35689ede-d86e-d692-adae-bc2f1adfb2ab@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <35689ede-d86e-d692-adae-bc2f1adfb2ab@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Tatashin <pasha.tatashin@oracle.com>, Michal Hocko <mhocko@suse.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Anthony Yznaga <anthony.yznaga@oracle.com>, Miles Chen <miles.chen@mediatek.com>, yi.z.zhang@linux.intel.com, Dan Williams <dan.j.williams@intel.com>
List-Id: linux-mediatek@lists.infradead.org

On 05.12.18 19:13, David Hildenbrand wrote:
> On 05.12.18 18:32, Matthew Wilcox wrote:
>> On Wed, Dec 05, 2018 at 04:05:12PM +0100, David Hildenbrand wrote:
>>> On 05.12.18 15:35, Matthew Wilcox wrote:
>>>> On Wed, Dec 05, 2018 at 01:28:51PM +0100, David Hildenbrand wrote:
>>>>> I don't see a reason why we have to document "Some of them might not even
>>>>> exist". If there is a user, we should document it. E.g. for balloon
>>>>> drivers we now use PG_offline to indicate that a page might currently
>>>>> not be backed by memory in the hypervisor. And that is independent from
>>>>> PG_reserved.
>>>>
>>>> I think you're confused by the meaning of "some of them might not even
>>>> exist".  What this means is that there might not be memory there; maybe
>>>> writes to that memory will be discarded, or maybe they'll cause a machine
>>>> check.  Maybe reads will return ~0, or 0, or cause a machine check.
>>>> We just don't know what's there, and we shouldn't try touching the memory.
>>>
>>> If there are users, let's document it. And I need more details for that :)
>>>
>>> 1. machine check: if there is a HW error, we set PG_hwpoison (except
>>> ia64 MCA, see the list)
>>>
>>> 2. Writes to that memory will be discarded
>>>
>>> Who is the user of that? When will we have such pages right now?
>>>
>>> 3. Reads will return ~0, / 0?
>>>
>>> I think this is a special case of e.g. x86? But where do we have that,
>>> are there any user?
>>
>> When there are gaps in the physical memory.  As in, if you put that
>> physical address on the bus (or in a packet), no device will respond
>> to it.  Look:
>>
>> 00000000-00000fff : Reserved
>> 00001000-00057fff : System RAM
>> 00058000-00058fff : Reserved
>> 00059000-0009dfff : System RAM
>> 0009e000-000fffff : Reserved
>>
>> Those examples I gave are examples of how various different architectures
>> respond to "no device responded to this memory access".
>>
> 
> Okay, so for this memory we will have
> a) vmmaps
> b) Memory block devices
> c) A sections that is online
> 
> So essentially "Gaps in physical memory" which is part of a online section.
> 
> This might be a candidate for PG_offline as well.
> 
> Thanks for the info, I'll try to find out how such things are handled.
> In general I assume this memory has to be readable, because otherwise
> kdump and friends would crash already when trying to dump?
> 

So I finally understood how physical memory holes in online sections are
handled when dumping. They won't be dumped because the list of dumpable
chunks (contained in /proc/kcore and after a crash /proc/vmcore) is
built using walk_system_ram_range(). So anything not listed as RAM will
be ignored.

I will update the documentation, describing that if we have an online
section that is not completely IORESOURCE_SYSTEM_RAM, that the physical
memory gaps will also be set to PG_reserved.

Trying to touch this memory is indeed dangerous, luckily dumping is
properly handled.

I'll think about if marking these ranges as PG_offline might make sense
(and if it can be easily added). Then we directly know when seeing that
page type that we should not touch it. Ever.

That hint was really helpful :)

-- 

Thanks,

David / dhildenb
