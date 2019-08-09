From: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [RFC PATCH v2] mm: slub: print kernel addresses in slub debug
 messages
Date: Thu, 8 Aug 2019 19:46:44 -0700
Message-ID: <20190809024644.GL5482@bombadil.infradead.org>
References: <20190809010837.24166-1-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190809010837.24166-1-miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Christoph Lameter <cl-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Joonsoo Kim <iamjoonsoo.kim-Hm3cg6mZ9cc@public.gmane.org>, "Tobin C . Harding" <me-xzjC0nNlxno@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Aug 09, 2019 at 09:08:37AM +0800, miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> Possible approaches are:
> 1. stop printing kernel addresses
> 2. print with %pK,
> 3. print with %px.

No.  The point of obscuring kernel addresses is that if the attacker manages to find a way to get the kernel to spit out some debug messages that we shouldn't
leak all this extra information.

> 4. do nothing

5. Find something more useful to print.

> INFO: Slab 0x(____ptrval____) objects=25 used=10 fp=0x(____ptrval____)

... you don't have any randomness on your platform?

> INFO: Object 0x(____ptrval____) @offset=1408 fp=0x(____ptrval____)
> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone (____ptrval____): bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object (____ptrval____): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5
> Redzone (____ptrval____): bb bb bb bb bb bb bb bb
> Padding (____ptrval____): 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
> Padding (____ptrval____): 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
> Padding (____ptrval____): 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
> Padding (____ptrval____): 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
> ...
> FIX kmalloc-128: Object at 0x(____ptrval____) not freed

But if you have randomness, at least some of these "pointers" are valuable
because you can compare them against "pointers" printed by other parts
of the kernel.

> After this patch:
> 
> INFO: Slab 0xffffffbf00f57000 objects=25 used=23 fp=0xffffffc03d5c3500
> INFO: Object 0xffffffc03d5c3500 @offset=13568 fp=0xffffffc03d5c0800
> Redzone 00000000: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone 00000010: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone 00000020: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone 00000030: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone 00000040: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone 00000050: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone 00000060: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Redzone 00000070: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb
> Object 00000000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object 00000010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object 00000020: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object 00000030: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object 00000040: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object 00000050: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object 00000060: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> Object 00000070: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5
> Redzone 00000000: bb bb bb bb bb bb bb bb
> Padding 00000000: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
> Padding 00000010: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
> Padding 00000020: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
> Padding 00000030: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
> ...
> FIX kmalloc-128: Object at 0xffffffc03d5c3500 not freed

It looks prettier, but I'm not convinced it's more useful.  Unless your
platform lacks randomness ...
