From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] mm/slub: introduce SLAB_WARN_ON_ERROR
Date: Mon, 28 Jan 2019 12:29:54 -0800
Message-ID: <20190128122954.949c2e6699d6e5ef060a325c@linux-foundation.org>
References: <1548313223-17114-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548313223-17114-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: miles.chen@mediatek.com
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 24 Jan 2019 15:00:23 +0800 <miles.chen@mediatek.com> wrote:

> From: Miles Chen <miles.chen@mediatek.com>
> 
> When debugging slab errors in slub.c, sometimes we have to trigger
> a panic in order to get the coredump file. Add a debug option
> SLAB_WARN_ON_ERROR to toggle WARN_ON() when the option is set.
> 
> Change since v1:
> 1. Add a special debug option SLAB_WARN_ON_ERROR and toggle WARN_ON()
> if it is set.
> 2. SLAB_WARN_ON_ERROR can be set by kernel parameter slub_debug.
> 

Hopefully the slab developers will have an opinion on this.

> --- a/Documentation/vm/slub.rst
> +++ b/Documentation/vm/slub.rst
> @@ -52,6 +52,7 @@ Possible debug options are::
>  	A		Toggle failslab filter mark for the cache
>  	O		Switch debugging off for caches that would have
>  			caused higher minimum slab orders
> +	W		Toggle WARN_ON() on slab errors
>  	-		Switch all debugging off (useful if the kernel is
>  			configured with CONFIG_SLUB_DEBUG_ON)

This documentation is poorly phrased.  The term "toggle" means to
invert the value of a boolean: if it was 1, make it 0 and if it was 0,
make it 1.  But that isn't what these options do.  Something like
"enable/disable" would be better.   So...

--- a/Documentation/vm/slub.rst~mm-slub-introduce-slab_warn_on_error-fix
+++ a/Documentation/vm/slub.rst
@@ -49,10 +49,10 @@ Possible debug options are::
 	P		Poisoning (object and padding)
 	U		User tracking (free and alloc)
 	T		Trace (please only use on single slabs)
-	A		Toggle failslab filter mark for the cache
+	A		Enable/disable failslab filter mark for the cache
 	O		Switch debugging off for caches that would have
 			caused higher minimum slab orders
-	W		Toggle WARN_ON() on slab errors
+	W		Enable/disable WARN_ON() on slab errors
 	-		Switch all debugging off (useful if the kernel is
 			configured with CONFIG_SLUB_DEBUG_ON)
 
_
