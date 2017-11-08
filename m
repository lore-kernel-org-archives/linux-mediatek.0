From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] slub: Fix sysfs duplicate filename creation when
 slub_debug=O
Date: Wed, 8 Nov 2017 13:32:18 +0800
Message-ID: <1510119138.17435.19.camel@mtkswgap22>
References: <1510023934-17517-1-git-send-email-miles.chen@mediatek.com>
         <alpine.DEB.2.20.1711070916480.18776@nuc-kabylake>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1711070916480.18776@nuc-kabylake>
Sender: linux-kernel-owner@vger.kernel.org
To: Christopher Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2017-11-07 at 09:22 -0600, Christopher Lameter wrote:
> On Tue, 7 Nov 2017, miles.chen@mediatek.com wrote:
> 
> > When slub_debug=O is set. It is possible to clear debug flags
> > for an "unmergeable" slab cache in kmem_cache_open().
> > It makes the "unmergeable" cache became "mergeable" in sysfs_slab_add().
> 
> Right but that is only if disable_higher_order_debug is set.

yes

> 
> > These caches will generate their "unique IDs" by create_unique_id(),
> > but it is possible to create identical unique IDs. In my experiment,
> > sgpool-128, names_cache, biovec-256 generate the same ID ":Ft-0004096"
> > and the kernel reports "sysfs: cannot create duplicate filename
> > '/kernel/slab/:Ft-0004096'".
> 
> Ok then the aliasing failed for some reason. The creation of the unique id
> and the alias detection needs to be in sync otherwise duplicate filenames
> are created. What is the difference there?

The aliasing failed because find_mergeable() returns if (flags &
SLAB_NEVER_MERGE) is true. So we do not go to search for alias caches.

__kmem_cache_alias()
  find_mergeable()
    kmem_cache_flags()  --> setup flag by the slub_debug
    if (flags & SLAB_NEVER_MERGE) return NULL;
    ...
    search alias logic...
    

The flags maybe changed if disable_higher_order_debug=1. So the
unmergeable cache becomes mergeable later.

> 
> The clearing of the DEBUG_METADATA_FLAGS looks ok to me. kmem_cache_alias
> should do the same right?
> 
Yes, I think clearing DEBUG_METADATA flags in kmem_cache_alias is
another solution for this issue.

We will need to do calculate_sizes() by using original flags and compare
the order of s->size and s->object_size when
disable_higher_order_debug=1.
