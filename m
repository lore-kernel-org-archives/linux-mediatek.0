From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v2 1/2] mm/page_ext: support to record the last stack of
 page
Date: Tue, 10 Sep 2019 17:43:58 +0800
Message-ID: <1568108638.24886.7.camel@mtksdccf07>
References: <20190909085339.25350-1-walter-zh.wu@mediatek.com>
 <36b5a8e0-2783-4c0e-4fc7-78ea652ba475@redhat.com>
 <1568077669.24886.3.camel@mtksdccf07>
 <20190910093103.4cmqk4semlhgpmle@box.shutemov.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190910093103.4cmqk4semlhgpmle@box.shutemov.name>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Qian Cai <cai@lca.pw>, wsd_upstream@mediatek.com, Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, Andrey Konovalov <andreyknvl@google.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-09-10 at 12:31 +0300, Kirill A. Shutemov wrote:
> On Tue, Sep 10, 2019 at 09:07:49AM +0800, Walter Wu wrote:
> > On Mon, 2019-09-09 at 12:57 +0200, David Hildenbrand wrote:
> > > On 09.09.19 10:53, Walter Wu wrote:
> > > > KASAN will record last stack of page in order to help programmer
> > > > to see memory corruption caused by page.
> > > > 
> > > > What is difference between page_owner and our patch?
> > > > page_owner records alloc stack of page, but our patch is to record
> > > > last stack(it may be alloc or free stack of page).
> > > > 
> > > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > > ---
> > > >  mm/page_ext.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/mm/page_ext.c b/mm/page_ext.c
> > > > index 5f5769c7db3b..7ca33dcd9ffa 100644
> > > > --- a/mm/page_ext.c
> > > > +++ b/mm/page_ext.c
> > > > @@ -65,6 +65,9 @@ static struct page_ext_operations *page_ext_ops[] = {
> > > >  #if defined(CONFIG_IDLE_PAGE_TRACKING) && !defined(CONFIG_64BIT)
> > > >  	&page_idle_ops,
> > > >  #endif
> > > > +#ifdef CONFIG_KASAN
> > > > +	&page_stack_ops,
> > > > +#endif
> > > >  };
> > > >  
> > > >  static unsigned long total_usage;
> > > > 
> > > 
> > > Are you sure this patch compiles?
> > > 
> > This is patchsets, it need another patch2.
> > We have verified it by running KASAN UT on Qemu.
> 
> Any patchset must be bisectable: do not break anything in the middle of
> patchset.
> 

Thanks your reminder.
I should explain complete message at commit log.
Our patchsets is below:
https://lkml.org/lkml/2019/9/9/104
https://lkml.org/lkml/2019/9/9/123
