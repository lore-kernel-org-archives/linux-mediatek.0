From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v2] mm: slub: print kernel addresses in slub debug
 messages
Date: Fri, 9 Aug 2019 07:26:17 -0700
Message-ID: <20190809142617.GO5482@bombadil.infradead.org>
References: <20190809010837.24166-1-miles.chen@mediatek.com>
 <20190809024644.GL5482@bombadil.infradead.org>
 <1565359918.12824.20.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565359918.12824.20.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, "Tobin C . Harding" <me@tobin.cc>, Kees Cook <keescook@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Aug 09, 2019 at 10:11:58PM +0800, Miles Chen wrote:
> On Thu, 2019-08-08 at 19:46 -0700, Matthew Wilcox wrote:
> > On Fri, Aug 09, 2019 at 09:08:37AM +0800, miles.chen@mediatek.com wrote:
> > > INFO: Slab 0x(____ptrval____) objects=25 used=10 fp=0x(____ptrval____)
> > 
> > ... you don't have any randomness on your platform?
> 
> We have randomized base on our platforms.

Look at initialize_ptr_random().  If you have randomness, then you
get a siphash_1u32() of the address.  With no randomness, you get this
___ptrval___ string instead.
