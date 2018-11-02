From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v4] mm/page_owner: clamp read count to PAGE_SIZE
Date: Thu, 1 Nov 2018 17:03:08 -0700
Message-ID: <20181102000307.GO10491@bombadil.infradead.org>
References: <1541091607-27402-1-git-send-email-miles.chen@mediatek.com>
 <20181101144723.3ddc1fa1ab7f81184bc2fdb8@linux-foundation.org>
 <3c81f60ac1ff270df972ded4128a7dbf41a91113.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <3c81f60ac1ff270df972ded4128a7dbf41a91113.camel@perches.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joe Perches <joe@perches.com>
Cc: Michal Hocko <mhocko@suse.com>, wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, miles.chen@mediatek.com, linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Nov 01, 2018 at 04:30:12PM -0700, Joe Perches wrote:
> On Thu, 2018-11-01 at 14:47 -0700, Andrew Morton wrote:
> > +++ a/mm/page_owner.c
> > @@ -351,7 +351,7 @@ print_page_owner(char __user *buf, size_
> >  		.skip = 0
> >  	};
> >  
> > -	count = count > PAGE_SIZE ? PAGE_SIZE : count;
> > +	count = min_t(size_t, count, PAGE_SIZE);
> >  	kbuf = kmalloc(count, GFP_KERNEL);
> >  	if (!kbuf)
> >  		return -ENOMEM;
> 
> A bit tidier still might be
> 
> 	if (count > PAGE_SIZE)
> 		count = PAGE_SIZE;
> 
> as that would not always cause a write back to count.

90% chance 'count' is already in a register and will stay there.  99.9%
chance that if it's not in a register, it's on the top of the stack,
which is by definition a hot, local, dirty cacheline.

What you're saying makes sense for a struct which might well be in a
shared cacheline state.  But for a function-local variable?  No.
