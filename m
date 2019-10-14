From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH 0/2] fix the missing underflow in memory operation function
Date: Mon, 14 Oct 2019 12:36:45 +0200
Message-ID: <CACT4Y+aSybD6Z0YHuhbaTKK+fd4c3t4z8WneYdRRqA4N-G0fkA@mail.gmail.com>
References: <20191014103148.17816-1-walter-zh.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014103148.17816-1-walter-zh.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Oct 14, 2019 at 12:32 PM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> The patchsets help to produce KASAN report when size is negative numbers
> in memory operation function. It is helpful for programmer to solve the
> undefined behavior issue. Patch 1 based on Dmitry's review and
> suggestion, patch 2 is a test in order to verify the patch 1.

Hi Walter,

I only received this cover letter, but not the actual patches. I also
don't see them in the group:
https://groups.google.com/forum/#!forum/kasan-dev
nor on internet. Have you mailed them? Where are they?

> [1]https://bugzilla.kernel.org/show_bug.cgi?id=199341
> [2]https://lore.kernel.org/linux-arm-kernel/20190927034338.15813-1-walter-zh.wu@mediatek.com/
>
> Walter Wu (2):
> kasan: detect negative size in memory operation function
> kasan: add test for invalid size in memmove
>
> ---
>  lib/test_kasan.c          | 18 ++++++++++++++++++
>  mm/kasan/common.c         | 13 ++++++++-----
>  mm/kasan/generic.c        |  5 +++++
>  mm/kasan/generic_report.c | 18 ++++++++++++++++++
>  mm/kasan/tags.c           |  5 +++++
>  mm/kasan/tags_report.c    | 17 +++++++++++++++++
>  6 files changed, 71 insertions(+), 5 deletions(-)
>
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20191014103148.17816-1-walter-zh.wu%40mediatek.com.
