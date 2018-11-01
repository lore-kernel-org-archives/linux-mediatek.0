From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4] mm/page_owner: clamp read count to PAGE_SIZE
Date: Thu, 01 Nov 2018 16:30:12 -0700
Message-ID: <3c81f60ac1ff270df972ded4128a7dbf41a91113.camel@perches.com>
References: <1541091607-27402-1-git-send-email-miles.chen@mediatek.com>
         <20181101144723.3ddc1fa1ab7f81184bc2fdb8@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101144723.3ddc1fa1ab7f81184bc2fdb8@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, miles.chen@mediatek.com
Cc: Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Michal Hocko <mhocko@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2018-11-01 at 14:47 -0700, Andrew Morton wrote:
> On Fri, 2 Nov 2018 01:00:07 +0800 <miles.chen@mediatek.com> wrote:
> 
> > From: Miles Chen <miles.chen@mediatek.com>
> > 
> > The page owner read might allocate a large size of memory with
> > a large read count. Allocation fails can easily occur when doing
> > high order allocations.
> > 
> > Clamp buffer size to PAGE_SIZE to avoid arbitrary size allocation
> > and avoid allocation fails due to high order allocation.
> > 
> > ...
> > 
> > --- a/mm/page_owner.c
> > +++ b/mm/page_owner.c
> > @@ -351,6 +351,7 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
> >  		.skip = 0
> >  	};
> >  
> > +	count = count > PAGE_SIZE ? PAGE_SIZE : count;
> >  	kbuf = kmalloc(count, GFP_KERNEL);
> >  	if (!kbuf)
> >  		return -ENOMEM;
> 
> A bit tidier:
> 
> --- a/mm/page_owner.c~mm-page_owner-clamp-read-count-to-page_size-fix
> +++ a/mm/page_owner.c
> @@ -351,7 +351,7 @@ print_page_owner(char __user *buf, size_
>  		.skip = 0
>  	};
>  
> -	count = count > PAGE_SIZE ? PAGE_SIZE : count;
> +	count = min_t(size_t, count, PAGE_SIZE);
>  	kbuf = kmalloc(count, GFP_KERNEL);
>  	if (!kbuf)
>  		return -ENOMEM;

A bit tidier still might be

	if (count > PAGE_SIZE)
		count = PAGE_SIZE;

as that would not always cause a write back to count.
