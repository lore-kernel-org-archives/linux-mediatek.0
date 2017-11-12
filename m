From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] slub: Fix sysfs duplicate filename creation when
 slub_debug=O
Date: Sun, 12 Nov 2017 09:40:23 +0800
Message-ID: <1510450823.27196.2.camel@mtkswgap22>
References: <1510023934-17517-1-git-send-email-miles.chen@mediatek.com>
         <alpine.DEB.2.20.1711070916480.18776@nuc-kabylake>
         <1510119138.17435.19.camel@mtkswgap22>
         <alpine.DEB.2.20.1711080903460.6161@nuc-kabylake>
         <1510217554.32371.17.camel@mtkswgap22>
         <alpine.DEB.2.20.1711090949250.12587@nuc-kabylake>
         <1510271512.11555.3.camel@mtkswgap22>
         <alpine.DEB.2.20.1711100941030.29707@nuc-kabylake>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1711100941030.29707@nuc-kabylake>
Sender: linux-kernel-owner@vger.kernel.org
To: Christopher Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2017-11-10 at 10:02 -0600, Christopher Lameter wrote:
> On Fri, 10 Nov 2017, Miles Chen wrote:
> 
> > By checking disable_higher_order_debug & (slub_debug &
> > SLAB_NEVER_MERGE), we can detect if a cache is unmergeable but become
> > mergeable because the disable_higher_order_debug=1 logic. Those kind of
> > caches should be keep unmergeable.
> 
> Acked-by: Christoph Lameter <cl@linux.com>
> 

Thanks for the ack, I already sent a v2 patch to fix a build warning in
this patch.(fix a build error: use instead DEBUG_METADATA_FLAGS of
SLAB_NEVER_MERGE)

diff --git a/mm/slub.c b/mm/slub.c
index 1efbb812..8e1c027 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5704,6 +5704,10 @@ static int sysfs_slab_add(struct kmem_cache *s)
                return 0;
        }

+       if (!unmergeable && disable_higher_order_debug &&
+                       (slub_debug & DEBUG_METADATA_FLAGS))
+               unmergeable = 1;
+
        if (unmergeable) {
                /*
                 * Slabcache can never be merged so we can use the name
proper.
