From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v3] mm/page_owner: use kvmalloc instead of kmalloc
Date: Thu, 1 Nov 2018 11:27:34 +0100
Message-ID: <20181101102734.GF23921@dhcp22.suse.cz>
References: <20181029081706.GC32673@dhcp22.suse.cz>
 <1540862950.12374.40.camel@mtkswgap22>
 <20181030060601.GR32673@dhcp22.suse.cz>
 <1540882551.23278.12.camel@mtkswgap22>
 <20181030081537.GV32673@dhcp22.suse.cz>
 <1540975637.10275.10.camel@mtkswgap22>
 <20181031101501.GL32673@dhcp22.suse.cz>
 <1540981182.16084.1.camel@mtkswgap22>
 <20181031114107.GM32673@dhcp22.suse.cz>
 <1541066412.31492.10.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541066412.31492.10.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Thu 01-11-18 18:00:12, Miles Chen wrote:
[...]
> I did a test today, the only code changed is to clamp to read count to
> PAGE_SIZE and it worked well. Maybe we can solve this issue by just
> clamping the read count.
> 
> count = count > PAGE_SIZE ? PAGE_SIZE : count;

This i what Matthew was proposing AFAIR. At least as a stop gap
solution. Maybe we want to extend this to a more standard implementation
later on (e.g. seq_file).
-- 
Michal Hocko
SUSE Labs
