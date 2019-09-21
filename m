From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] mm: slub: print_hex_dump() with DUMP_PREFIX_OFFSET
Date: Sat, 21 Sep 2019 09:00:18 -0700
Message-ID: <20190921160018.GF15392@bombadil.infradead.org>
References: <20190920104849.32504-1-miles.chen@mediatek.com>
 <alpine.DEB.2.21.1909210207240.259613@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1909210207240.259613@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Rientjes <rientjes@google.com>
Cc: Miles Chen <miles.chen@mediatek.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Sat, Sep 21, 2019 at 02:08:59AM -0700, David Rientjes wrote:
> On Fri, 20 Sep 2019, Miles Chen wrote:
> 
> > Since commit ad67b74d2469d9b8 ("printk: hash addresses printed with %p"),
> > The use DUMP_PREFIX_OFFSET instead of DUMP_PREFIX_ADDRESS with
> > print_hex_dump() can generate more useful messages.
> > 
> > In the following example, it's easier get the offset of incorrect poison
> > value with DUMP_PREFIX_OFFSET.
> > 
> > Before:
> > Object 00000000e817b73b: 00 00 00 00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > Object 00000000816f4601: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > Object 00000000169d2bb8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > Object 00000000f4c38716: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > Object 00000000917e3491: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > Object 00000000c0e33738: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > Object 000000001755ddd1: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > 
> > After:
> > Object 00000000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > Object 00000010: 63 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > Object 00000020: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > Object 00000030: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5
> 
> I agree it looks nicer for poisoning, I'm not sure that every caller of 
> print_section() is the same, however.  For example trace() seems better 
> off as DUMP_PREFIX_ADDRESS since it already specifies the address of the 
> object being allocated or freed and offset here wouldn't really be useful, 
> no?

While it looks nicer, it might be less useful for debugging.  The point of
obfuscated %p is that you can compare two "pointer" values for equality.
So if you know that you freed object 00000000e817b73b from an earlier
printk, then you can match it up to this dump.  It's obviously not
perfect since we're only getting the pointers at addresses that are
multiples of 16, but it's a help.
