From: cl@linux.com
Subject: Re: [PATCH] mm: slub: print_hex_dump() with DUMP_PREFIX_OFFSET
Date: Sat, 21 Sep 2019 17:00:51 +0000 (UTC)
Message-ID: <alpine.DEB.2.21.1909211659470.27404@ip-172-31-20-140.us-east-2.compute.internal>
References: <20190920104849.32504-1-miles.chen@mediatek.com> <alpine.DEB.2.21.1909210207240.259613@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1909210207240.259613@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Rientjes <rientjes@google.com>
Cc: Miles Chen <miles.chen@mediatek.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Sat, 21 Sep 2019, David Rientjes wrote:

> I agree it looks nicer for poisoning, I'm not sure that every caller of
> print_section() is the same, however.  For example trace() seems better
> off as DUMP_PREFIX_ADDRESS since it already specifies the address of the
> object being allocated or freed and offset here wouldn't really be useful,
> no?

The address is printed earlier before the object dump. Maybe that is
sufficient and we could even reduce the number of digits further to have
the display more compact? In this case two hex digits would do the trick.
