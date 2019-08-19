From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: kasan: fix phys_to_virt() false positive on
 tag-based kasan
Date: Mon, 19 Aug 2019 13:56:26 +0100
Message-ID: <20190819125625.bu3nbrldg7te5kwc@willie-the-truck>
References: <20190819114420.2535-1-walter-zh.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190819114420.2535-1-walter-zh.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@google.com>, wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Aug 19, 2019 at 07:44:20PM +0800, Walter Wu wrote:
> __arm_v7s_unmap() call iopte_deref() to translate pyh_to_virt address,
> but it will modify pointer tag into 0xff, so there is a false positive.
> 
> When enable tag-based kasan, phys_to_virt() function need to rewrite
> its original pointer tag in order to avoid kasan report an incorrect
> memory corruption.

Hmm. Which tree did you see this on? We've recently queued a load of fixes
in this area, but I /thought/ they were only needed after the support for
52-bit virtual addressing in the kernel.

Will
