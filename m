From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] mm/page_owner: fix incorrect looping in
 __set_page_owner_handle()
Date: Fri, 4 Oct 2019 15:59:34 +0800
Message-ID: <1570175974.23700.0.camel@mtkswgap22>
References: <20191004073755.3228-1-miles.chen@mediatek.com>
         <f5027e93-7cf3-3a90-f1f8-b829ea4b75b9@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f5027e93-7cf3-3a90-f1f8-b829ea4b75b9@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Michal Hocko <mhocko@suse.com>
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-10-04 at 09:57 +0200, Vlastimil Babka wrote:
> On 10/4/19 9:37 AM, Miles Chen wrote:
> > In __set_page_owner_handle(), we should loop over page
> > [0...(1 << order) - 1] and setup their page_owner structures.
> > 
> > Currently, __set_page_owner_handle() update page_ext at the end of
> > the loop, sets the page_owner of (page + 0) twice and
> > misses the page_owner of (page + (1 << order) - 1).
> > 
> > Fix it by updating the page_ext at the start of the loop.
> > 
> > In i == 0 case:
> > for (i = 0; i < (1 << order); i++) {
> > 	page_owner = get_page_owner(page_ext); <- page_ext belongs to page + 0
> > 	...
> > 	page_ext = lookup_page_ext(page + i); <- lookup_page_ext(page + 0)
> > }
> > 
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > Fixes: 7e2f2a0cd17c ("mm, page_owner: record page owner for each subpage")
> 
> Thanks. Kirill spotted it earlier and there's a fix pending:
> https://lore.kernel.org/linux-mm/20190930122916.14969-2-vbabka@suse.cz/

Great. thanks for the information.


Miles
> 
> > ---
> >  mm/page_owner.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/mm/page_owner.c b/mm/page_owner.c
> > index dee931184788..110c3e1987f2 100644
> > --- a/mm/page_owner.c
> > +++ b/mm/page_owner.c
> > @@ -178,6 +178,7 @@ static inline void __set_page_owner_handle(struct page *page,
> >  	int i;
> >  
> >  	for (i = 0; i < (1 << order); i++) {
> > +		page_ext = lookup_page_ext(page + i);
> >  		page_owner = get_page_owner(page_ext);
> >  		page_owner->handle = handle;
> >  		page_owner->order = order;
> > @@ -185,8 +186,6 @@ static inline void __set_page_owner_handle(struct page *page,
> >  		page_owner->last_migrate_reason = -1;
> >  		__set_bit(PAGE_EXT_OWNER, &page_ext->flags);
> >  		__set_bit(PAGE_EXT_OWNER_ACTIVE, &page_ext->flags);
> > -
> > -		page_ext = lookup_page_ext(page + i);
> >  	}
> >  }
> >  
> > 
> 
