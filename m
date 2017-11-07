From: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH] slub: Fix sysfs duplicate filename creation when
 slub_debug=O
Date: Tue, 7 Nov 2017 09:22:18 -0600 (CST)
Message-ID: <alpine.DEB.2.20.1711070916480.18776@nuc-kabylake>
References: <1510023934-17517-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510023934-17517-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 7 Nov 2017, miles.chen@mediatek.com wrote:

> When slub_debug=O is set. It is possible to clear debug flags
> for an "unmergeable" slab cache in kmem_cache_open().
> It makes the "unmergeable" cache became "mergeable" in sysfs_slab_add().

Right but that is only if disable_higher_order_debug is set.

> These caches will generate their "unique IDs" by create_unique_id(),
> but it is possible to create identical unique IDs. In my experiment,
> sgpool-128, names_cache, biovec-256 generate the same ID ":Ft-0004096"
> and the kernel reports "sysfs: cannot create duplicate filename
> '/kernel/slab/:Ft-0004096'".

Ok then the aliasing failed for some reason. The creation of the unique id
and the alias detection needs to be in sync otherwise duplicate filenames
are created. What is the difference there?

The clearing of the DEBUG_METADATA_FLAGS looks ok to me. kmem_cache_alias
should do the same right?
