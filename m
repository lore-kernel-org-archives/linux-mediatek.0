From: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH] slub: Fix sysfs duplicate filename creation when
 slub_debug=O
Date: Thu, 9 Nov 2017 09:49:49 -0600 (CST)
Message-ID: <alpine.DEB.2.20.1711090949250.12587@nuc-kabylake>
References: <1510023934-17517-1-git-send-email-miles.chen@mediatek.com> <alpine.DEB.2.20.1711070916480.18776@nuc-kabylake> <1510119138.17435.19.camel@mtkswgap22> <alpine.DEB.2.20.1711080903460.6161@nuc-kabylake> <1510217554.32371.17.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1510217554.32371.17.camel@mtkswgap22>
Sender: owner-linux-mm@kvack.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 9 Nov 2017, Miles Chen wrote:

> In this fix patch, it disables slab merging if SLUB_DEBUG=O and
> CONFIG_SLUB_DEBUG_ON=y but the debug features are disabled by the
> disable_higher_order_debug logic and it holds the "slab merging is off
> if any debug features are enabled" behavior.

Sounds good. Where is the patch?

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
