From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: Re: [PATCH v3] kasan: add memory corruption identification for
 software tag-based mode
Date: Thu, 13 Jun 2019 18:50:25 +0300
Message-ID: <278bd641-7d74-b9ac-1549-1e630ef3d38c@virtuozzo.com>
References: <20190613081357.1360-1-walter-zh.wu@mediatek.com>
 <da7591c9-660d-d380-d59e-6d70b39eaa6b@virtuozzo.com>
 <CACT4Y+ZGEmGE2LFmRfPGgtUGwBqyL+s_CSp5DCpWGanTJCRcXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACT4Y+ZGEmGE2LFmRfPGgtUGwBqyL+s_CSp5DCpWGanTJCRcXw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Walter Wu <walter-zh.wu@mediatek.com>, Alexander Potapenko <glider@google.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Matthias Brugger <matthias.bgg@gmail.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Vasily Gorbik <gor@linux.ibm.com>, Andrey Konovalov <andreyknvl@google.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Miles Chen <miles.chen@mediatek.com>, kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org



On 6/13/19 4:05 PM, Dmitry Vyukov wrote:
> On Thu, Jun 13, 2019 at 2:27 PM Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
>> On 6/13/19 11:13 AM, Walter Wu wrote:
>>> This patch adds memory corruption identification at bug report for
>>> software tag-based mode, the report show whether it is "use-after-free"
>>> or "out-of-bound" error instead of "invalid-access" error.This will make
>>> it easier for programmers to see the memory corruption problem.
>>>
>>> Now we extend the quarantine to support both generic and tag-based kasan.
>>> For tag-based kasan, the quarantine stores only freed object information
>>> to check if an object is freed recently. When tag-based kasan reports an
>>> error, we can check if the tagged addr is in the quarantine and make a
>>> good guess if the object is more like "use-after-free" or "out-of-bound".
>>>
>>
>>
>> We already have all the information and don't need the quarantine to make such guess.
>> Basically if shadow of the first byte of object has the same tag as tag in pointer than it's out-of-bounds,
>> otherwise it's use-after-free.
>>
>> In pseudo-code it's something like this:
>>
>> u8 object_tag = *(u8 *)kasan_mem_to_shadow(nearest_object(cacche, page, access_addr));
>>
>> if (access_addr_tag == object_tag && object_tag != KASAN_TAG_INVALID)
>>         // out-of-bounds
>> else
>>         // use-after-free
> 
> But we don't have redzones in tag mode (intentionally), so unless I am
> missing something we don't have the necessary info. Both cases look
> the same -- we hit a different tag.

We always have some redzone. We need a place to store 'struct kasan_alloc_meta',
and sometimes also kasan_free_meta plus alignment to the next object.


> There may only be a small trailer for kmalloc-allocated objects that
> is painted with a different tag. I don't remember if we actually use a
> different tag for the trailer. Since tag mode granularity is 16 bytes,
> for smaller objects the trailer is impossible at all.
> 

Smaller that 16-bytes objects have 16 bytes of kasan_alloc_meta.
Redzones and freed objects always painted with KASAN_TAG_INVALID.
