From: Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] mm: slub: print_hex_dump() with DUMP_PREFIX_OFFSET
Date: Mon, 23 Sep 2019 01:05:08 +0800
Message-ID: <1569171908.9436.55.camel@mtkswgap22>
References: <20190920104849.32504-1-miles.chen@mediatek.com>
 <alpine.DEB.2.21.1909210207240.259613@chino.kir.corp.google.com>
 <20190921160018.GF15392@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190921160018.GF15392-PfSpb0PWhxZc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Christoph Lameter <cl-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Joonsoo Kim <iamjoonsoo.kim-Hm3cg6mZ9cc@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Sat, 2019-09-21 at 09:00 -0700, Matthew Wilcox wrote:
> On Sat, Sep 21, 2019 at 02:08:59AM -0700, David Rientjes wrote:
> > On Fri, 20 Sep 2019, Miles Chen wrote:
> > 
> > > Since commit ad67b74d2469d9b8 ("printk: hash addresses printed with %p"),
> > > The use DUMP_PREFIX_OFFSET instead of DUMP_PREFIX_ADDRESS with
> > > print_hex_dump() can generate more useful messages.
> > > 
> > > In the following example, it's easier get the offset of incorrect poison
> > > value with DUMP_PREFIX_OFFSET.
> > > 
> > > Before:
> > > Object 00000000e817b73b: 00 00 00 00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > > Object 00000000816f4601: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > > Object 00000000169d2bb8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > > Object 00000000f4c38716: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > > Object 00000000917e3491: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > > Object 00000000c0e33738: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > > Object 000000001755ddd1: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > > 
> > > After:
> > > Object 00000000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > > Object 00000010: 63 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > > Object 00000020: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > > Object 00000030: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5
> > 
> > I agree it looks nicer for poisoning, I'm not sure that every caller of 
> > print_section() is the same, however.  For example trace() seems better 
> > off as DUMP_PREFIX_ADDRESS since it already specifies the address of the 
> > object being allocated or freed and offset here wouldn't really be useful, 
> > no?
> 
> While it looks nicer, it might be less useful for debugging.  The point of
> obfuscated %p is that you can compare two "pointer" values for equality.
> So if you know that you freed object 00000000e817b73b from an earlier
> printk, then you can match it up to this dump.  It's obviously not
> perfect since we're only getting the pointers at addresses that are
> multiples of 16, but it's a help.

Thanks for the reply.

The value of 00000000e817b73b dump and the value earlier printk should
be the same, Otherwise we have a serious problem because:

printf("%p", bad_ptr);
print_hex_dump(bad_ptr);

and we see a different hashed address of bad_ptr in print_hex_dump().
I think it's a rare case but we still have a chance to see that case.
DUMP_PREFIX_ADDRESS is useful for that case.


On the other hand, DUMP_PREFIX_OFFSET is useful for finding the offset
of incorrect poison value easier. 
Maybe I can print the offset of the bad poison value in 
check_bytes_and_report(). e.g., 

@@ -736,6 +736,7 @@ static int check_bytes_and_report(struct kmem_cache
*s, struct page *page,
 {
        u8 *fault;
        u8 *end;
+       u8 *addr = page_address(page);

        metadata_access_enable();
        fault = memchr_inv(start, value, bytes);
@@ -748,8 +749,9 @@ static int check_bytes_and_report(struct kmem_cache
*s, struct page *page,
                end--;

        slab_bug(s, "%s overwritten", what);
-       pr_err("INFO: 0x%p-0x%p. First byte 0x%x instead of 0x%x\n",
-                                       fault, end - 1, fault[0],
value);
+       pr_err("INFO: 0x%p-0x%p. First byte 0x%x instead of 0x%x,
offset=%tu\n",
+                                       fault, end - 1, fault[0], value,
fault -
+                                       addr);


and we can see the offset printed out:

=============================================================================
BUG kmalloc-1k (Tainted: G    B            ): Poison overwritten
-----------------------------------------------------------------------------

INFO: 0x(____ptrval____)-0x(____ptrval____). First byte 0x63 instead of
0x6b, offset=7052
INFO: Object 0x(____ptrval____) @offset=6272 fp=0x(____ptrval____)

and we can get the offset by: 7052 - 6272 = 780.
