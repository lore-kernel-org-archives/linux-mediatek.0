From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2] mm/slub: introduce SLAB_WARN_ON_ERROR
Date: Tue, 29 Jan 2019 11:45:57 +0800
Message-ID: <1548733557.9796.13.camel@mtkswgap22>
References: <1548313223-17114-1-git-send-email-miles.chen@mediatek.com>
         <alpine.DEB.2.21.1901281739230.216488@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1901281739230.216488@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Rientjes <rientjes@google.com>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-01-28 at 17:41 -0800, David Rientjes wrote:
> On Thu, 24 Jan 2019, miles.chen@mediatek.com wrote:
> 
> > From: Miles Chen <miles.chen@mediatek.com>
> > 
> > When debugging slab errors in slub.c, sometimes we have to trigger
> > a panic in order to get the coredump file. Add a debug option
> > SLAB_WARN_ON_ERROR to toggle WARN_ON() when the option is set.
> > 
> 
> Wouldn't it be better to enable/disable this for all slab caches instead 
> of individual caches at runtime?  I'm not sure excluding some caches 
> because you know they'll WARN and trigger panic_on_warn unnecessarily is 
> valid since it could be enabled for that cache as well through this 
> interface.

We can enable this option only for specific slab(s).
e.g., slub_debug=W,dentry
or
enable this option for all slabs
e.g., slub_debug=W
