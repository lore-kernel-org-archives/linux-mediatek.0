From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [RFC PATCH v2] mm: slub: print kernel addresses in slub debug
 messages
Date: Mon, 12 Aug 2019 16:24:50 +0800
Message-ID: <1565598290.5872.6.camel@mtkswgap22>
References: <20190809010837.24166-1-miles.chen@mediatek.com>
         <20190809024644.GL5482@bombadil.infradead.org>
         <1565359918.12824.20.camel@mtkswgap22>
         <20190809142617.GO5482@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809142617.GO5482@bombadil.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, "Tobin C . Harding" <me@tobin.cc>, Kees Cook <keescook@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-08-09 at 07:26 -0700, Matthew Wilcox wrote:
> On Fri, Aug 09, 2019 at 10:11:58PM +0800, Miles Chen wrote:
> > On Thu, 2019-08-08 at 19:46 -0700, Matthew Wilcox wrote:
> > > On Fri, Aug 09, 2019 at 09:08:37AM +0800, miles.chen@mediatek.com wrote:
> > > > INFO: Slab 0x(____ptrval____) objects=25 used=10 fp=0x(____ptrval____)
> > > 
> > > ... you don't have any randomness on your platform?
> > 
> > We have randomized base on our platforms.
> 
> Look at initialize_ptr_random().  If you have randomness, then you
> get a siphash_1u32() of the address.  With no randomness, you get this
> ___ptrval___ string instead.
> 
You are right. There is no randomness in this platform. (I ran my test
code on Qemu with no randomness)


thanks again
