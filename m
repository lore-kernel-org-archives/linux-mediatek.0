From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 2/2] kasan: add test for invalid size in memmove
Date: Mon, 14 Oct 2019 08:07:10 -0700
Message-ID: <20191014150710.GY32665@bombadil.infradead.org>
References: <20191014103654.17982-1-walter-zh.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014103654.17982-1-walter-zh.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Mon, Oct 14, 2019 at 06:36:54PM +0800, Walter Wu wrote:
> Test size is negative numbers in memmove in order to verify
> whether it correctly get KASAN report.

You're not testing negative numbers, though.  memmove() takes an unsigned
type, so you're testing a very large number.
