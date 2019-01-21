From: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH] mm/slub: use WARN_ON() for some slab errors
Date: Mon, 21 Jan 2019 22:02:36 +0000
Message-ID: <01000168726fcf15-81d8feb3-26f0-44d6-bbd8-62aa149118b5-000000@email.amazonses.com>
References: <1548063490-545-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548063490-545-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 21 Jan 2019, miles.chen@mediatek.com wrote:

> From: Miles Chen <miles.chen@mediatek.com>
>
> When debugging with slub.c, sometimes we have to trigger a panic in
> order to get the coredump file. To do that, we have to modify slub.c and
> rebuild kernel. To make debugging easier, use WARN_ON() for these slab
> errors so we can dump stack trace by default or set panic_on_warn to
> trigger a panic.

These locations really should dump stack and not terminate. There is
subsequent processing that should be done.

Slub terminates by default. The messages you are modifying are only
enabled if the user specified that special debugging should be one
(typically via a kernel parameter slub_debug).

It does not make sense to terminate the process here.
