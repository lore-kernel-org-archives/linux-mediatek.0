From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC PATCH v2] mm: slub: print kernel addresses in slub debug
 messages
Date: Mon, 12 Aug 2019 15:32:20 +0200
Message-ID: <c144b64d-6b13-868a-b797-db61176c66ea@suse.cz>
References: <20190809010837.24166-1-miles.chen@mediatek.com>
 <20190809024644.GL5482@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809024644.GL5482@bombadil.infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>, miles.chen@mediatek.com
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, "Tobin C . Harding" <me@tobin.cc>, Kees Cook <keescook@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

On 8/9/19 4:46 AM, Matthew Wilcox wrote:
> On Fri, Aug 09, 2019 at 09:08:37AM +0800, miles.chen@mediatek.com wrote:
>> Possible approaches are:
>> 1. stop printing kernel addresses
>> 2. print with %pK,
>> 3. print with %px.
> 
> No.  The point of obscuring kernel addresses is that if the attacker manages to find a way to get the kernel to spit out some debug messages that we shouldn't
> leak all this extra information.

On the other hand, while CONFIG_SLUB_DEBUG=y is common, the actual
checks and printing happens when the (relatively expensive) checks are
actually enabled during boot, i.e. during a debugging session, not
production defaults. I can see how knowing the exact address might be
useful when e.g. a crash dump is also taken. I would say %pK would be a
good fit, if kptr_restrict also had a setting that makes %pK behave like
%px (looks like it doesn't), so that setting would be enabled in such a
debugging session.

>> 4. do nothing
> 
> 5. Find something more useful to print.
> 
>> INFO: Slab 0x(____ptrval____) objects=25 used=10 fp=0x(____ptrval____)
> 
> ... you don't have any randomness on your platform?
> 
>> INFO: Object 0x(____ptrval____) @offset=1408 fp=0x(____ptrval____)
>> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5
>> Redzone (____ptrval____): bb bb bb bb bb bb bb bb
>> Padding (____ptrval____): 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
>> Padding (____ptrval____): 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
>> Padding (____ptrval____): 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
>> Padding (____ptrval____): 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
>> ...
>> FIX kmalloc-128: Object at 0x(____ptrval____) not freed
> 
> But if you have randomness, at least some of these "pointers" are valuable
> because you can compare them against "pointers" printed by other parts
> of the kernel.
> 
>> After this patch:
>>
>> INFO: Slab 0xffffffbf00f57000 objects=25 used=23 fp=0xffffffc03d5c3500
>> INFO: Object 0xffffffc03d5c3500 @offset=13568 fp=0xffffffc03d5c0800
>> Redzone 00000000: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone 00000010: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone 00000020: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone 00000030: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone 00000040: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone 00000050: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone 00000060: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Redzone 00000070: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
>> Object 00000000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object 00000010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object 00000020: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object 00000030: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object 00000040: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object 00000050: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object 00000060: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
>> Object 00000070: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5
>> Redzone 00000000: bb bb bb bb bb bb bb bb
>> Padding 00000000: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
>> Padding 00000010: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
>> Padding 00000020: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
>> Padding 00000030: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
>> ...
>> FIX kmalloc-128: Object at 0xffffffc03d5c3500 not freed
> 
> It looks prettier, but I'm not convinced it's more useful.  Unless your
> platform lacks randomness ...
> 
