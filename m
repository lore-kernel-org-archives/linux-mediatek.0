From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [RFC PATCH v2] mm: slub: print kernel addresses in slub debug
 messages
Date: Fri, 9 Aug 2019 22:11:58 +0800
Message-ID: <1565359918.12824.20.camel@mtkswgap22>
References: <20190809010837.24166-1-miles.chen@mediatek.com>
         <20190809024644.GL5482@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809024644.GL5482@bombadil.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, "Tobin C . Harding" <me@tobin.cc>, Kees Cook <keescook@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2019-08-08 at 19:46 -0700, Matthew Wilcox wrote:
> On Fri, Aug 09, 2019 at 09:08:37AM +0800, miles.chen@mediatek.com wrote:
> > Possible approaches are:
> > 1. stop printing kernel addresses
> > 2. print with %pK,
> > 3. print with %px.
> 
> No.  The point of obscuring kernel addresses is that if the attacker manages to find a way to get the kernel to spit out some debug messages that we shouldn't
> leak all this extra information.

got it.
> 
> > 4. do nothing
> 
> 5. Find something more useful to print.

agree
> 
> > INFO: Slab 0x(____ptrval____) objects=25 used=10 fp=0x(____ptrval____)
> 
> ... you don't have any randomness on your platform?

We have randomized base on our platforms.

> But if you have randomness, at least some of these "pointers" are valuable
> because you can compare them against "pointers" printed by other parts
> of the kernel.

Understood. Keep current %p, do not leak kernel addresses.

I'll collect more cases and see if we really need some extra
information. (maybe the @offset in current message is enough)


thanks for your comments!
