From: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v3] mm/kasan: dump alloc and free stack for page allocator
Date: Wed, 11 Sep 2019 11:19:19 -0400
Message-ID: <5E358F4B-552C-4542-9655-E01C7B754F14@lca.pw>
References: <20190911083921.4158-1-walter-zh.wu@mediatek.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190911083921.4158-1-walter-zh.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Andrey Konovalov <andreyknvl@google.com>, Vlastimil Babka <vbabka@suse.cz>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org



> On Sep 11, 2019, at 4:39 AM, Walter Wu <walter-zh.wu@mediatek.com> =
wrote:
>=20
> This patch is KASAN's report adds the alloc/free stack for page =
allocator
> in order to help programmer to see memory corruption caused by the =
page.
>=20
> By default, KASAN doesn't record alloc or free stack for page =
allocator.
> It is difficult to fix up the page use-after-free or double-free =
issue.
>=20
> We add the following changing:
> 1) KASAN enable PAGE_OWNER by default to get the alloc stack of the =
page.
> 2) Add new feature option to get the free stack of the page.
>=20
> The new feature KASAN_DUMP_PAGE depends on DEBUG_PAGEALLOC, it will =
help
> to record free stack of the page, it is very helpful for solving the =
page
> use-after-free or double-free issue.
>=20
> When KASAN_DUMP_PAGE is enabled then KASAN's report will show the last
> alloc and free stack of the page, it should be:
>=20
> BUG: KASAN: use-after-free in kmalloc_pagealloc_uaf+0x70/0x80
> Write of size 1 at addr ffffffc0d60e4000 by task cat/115
> ...
> prep_new_page+0x1c8/0x218
> get_page_from_freelist+0x1ba0/0x28d0
> __alloc_pages_nodemask+0x1d4/0x1978
> kmalloc_order+0x28/0x58
> kmalloc_order_trace+0x28/0xe0
> kmalloc_pagealloc_uaf+0x2c/0x80
> page last free stack trace:
> __free_pages_ok+0x116c/0x1630
> __free_pages+0x50/0x78
> kfree+0x1c4/0x250
> kmalloc_pagealloc_uaf+0x38/0x80
>=20
> Changes since v1:
> - slim page_owner and move it into kasan
> - enable the feature by default
>=20
> Changes since v2:
> - enable PAGE_OWNER by default
> - use DEBUG_PAGEALLOC to get page information
>=20
> cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> cc: Vlastimil Babka <vbabka@suse.cz>
> cc: Andrey Konovalov <andreyknvl@google.com>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> ---
> lib/Kconfig.kasan | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>=20
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index 4fafba1a923b..4d59458c0c5a 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -41,6 +41,7 @@ config KASAN_GENERIC
> 	select SLUB_DEBUG if SLUB
> 	select CONSTRUCTORS
> 	select STACKDEPOT
> +	select PAGER_OWNER
> 	help
> 	  Enables generic KASAN mode.
> 	  Supported in both GCC and Clang. With GCC it requires version =
4.9.2
> @@ -63,6 +64,7 @@ config KASAN_SW_TAGS
> 	select SLUB_DEBUG if SLUB
> 	select CONSTRUCTORS
> 	select STACKDEPOT
> +	select PAGER_OWNER
> 	help
> 	  Enables software tag-based KASAN mode.
> 	  This mode requires Top Byte Ignore support by the CPU and =
therefore
> @@ -135,6 +137,19 @@ config KASAN_S390_4_LEVEL_PAGING
> 	  to 3TB of RAM with KASan enabled). This options allows to =
force
> 	  4-level paging instead.
>=20
> +config KASAN_DUMP_PAGE
> +	bool "Dump the last allocation and freeing stack of the page"
> +	depends on KASAN
> +	select DEBUG_PAGEALLOC
> +	help
> +	  By default, KASAN enable PAGE_OWNER only to record alloc stack
> +	  for page allocator. It is difficult to fix up page =
use-after-free
> +	  or double-free issue.
> +	  This feature depends on DEBUG_PAGEALLOC, it will extra record
> +	  free stack of page. It is very helpful for solving the page
> +	  use-after-free or double-free issue.
> +	  This option will have a small memory overhead.
> +
> config TEST_KASAN
> 	tristate "Module for testing KASAN for bug detection"
> 	depends on m && KASAN
> =E2=80=94=20

The new config looks redundant and confusing. It looks to me more of a =
document update
in Documentation/dev-tools/kasan.txt to educate developers to select =
PAGE_OWNER and
DEBUG_PAGEALLOC if needed.
