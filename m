From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v4] kasan: add memory corruption identification for
 software tag-based mode
Date: Thu, 22 Aug 2019 09:22:02 +0800
Message-ID: <1566436922.27117.0.camel@mtksdccf07>
References: <20190806054340.16305-1-walter-zh.wu@mediatek.com>
 <1566279478.9993.21.camel@mtksdccf07>
 <3318f9d7-a760-3cc8-b700-f06108ae745f@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3318f9d7-a760-3cc8-b700-f06108ae745f@virtuozzo.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: wsd_upstream@mediatek.com, Vasily Gorbik <gor@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, Andrey Konovalov <andreyknvl@google.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, Martin Schwidefsky <schwidefsky@de.ibm.com>, Miles Chen <miles.chen@mediatek.com>, Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-08-21 at 20:52 +0300, Andrey Ryabinin wrote:
> 
> On 8/20/19 8:37 AM, Walter Wu wrote:
> > On Tue, 2019-08-06 at 13:43 +0800, Walter Wu wrote:
> >> This patch adds memory corruption identification at bug report for
> >> software tag-based mode, the report show whether it is "use-after-free"
> >> or "out-of-bound" error instead of "invalid-access" error. This will make
> >> it easier for programmers to see the memory corruption problem.
> >>
> >> We extend the slab to store five old free pointer tag and free backtrace,
> >> we can check if the tagged address is in the slab record and make a
> >> good guess if the object is more like "use-after-free" or "out-of-bound".
> >> therefore every slab memory corruption can be identified whether it's
> >> "use-after-free" or "out-of-bound".
> >>
> >> ====== Changes
> >> Change since v1:
> >> - add feature option CONFIG_KASAN_SW_TAGS_IDENTIFY.
> >> - change QUARANTINE_FRACTION to reduce quarantine size.
> >> - change the qlist order in order to find the newest object in quarantine
> >> - reduce the number of calling kmalloc() from 2 to 1 time.
> >> - remove global variable to use argument to pass it.
> >> - correct the amount of qobject cache->size into the byes of qlist_head.
> >> - only use kasan_cache_shrink() to shink memory.
> >>
> >> Change since v2:
> >> - remove the shinking memory function kasan_cache_shrink()
> >> - modify the description of the CONFIG_KASAN_SW_TAGS_IDENTIFY
> >> - optimize the quarantine_find_object() and qobject_free()
> >> - fix the duplicating function name 3 times in the header.
> >> - modify the function name set_track() to kasan_set_track()
> >>
> >> Change since v3:
> >> - change tag-based quarantine to extend slab to identify memory corruption
> > 
> > Hi,Andrey,
> > 
> > Would you review the patch,please?
> 
> 
> I didn't notice anything fundamentally wrong, but I find there are some
> questionable implementation choices that makes code look weirder than necessary
> and harder to understand. So I ended up with cleaning it up, see the diff bellow.
> I'll send v5 with that diff folded.
> 

Thanks your review and suggestion.

Walter
