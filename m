From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v2] mm/slub: introduce SLAB_WARN_ON_ERROR
Date: Mon, 28 Jan 2019 17:41:59 -0800 (PST)
Message-ID: <alpine.DEB.2.21.1901281739230.216488@chino.kir.corp.google.com>
References: <1548313223-17114-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548313223-17114-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 24 Jan 2019, miles.chen@mediatek.com wrote:

> From: Miles Chen <miles.chen@mediatek.com>
> 
> When debugging slab errors in slub.c, sometimes we have to trigger
> a panic in order to get the coredump file. Add a debug option
> SLAB_WARN_ON_ERROR to toggle WARN_ON() when the option is set.
> 

Wouldn't it be better to enable/disable this for all slab caches instead 
of individual caches at runtime?  I'm not sure excluding some caches 
because you know they'll WARN and trigger panic_on_warn unnecessarily is 
valid since it could be enabled for that cache as well through this 
interface.
