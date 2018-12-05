From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 0/7] mm: PG_reserved cleanups and documentation
Date: Wed, 5 Dec 2018 14:04:21 +0100
Message-ID: <dd8ed63e-a296-ee2c-52d2-db6d8247f710@redhat.com>
References: <20181205122851.5891-1-david@redhat.com>
 <20181205125607.GM1286@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205125607.GM1286@dhcp22.suse.cz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Hocko <mhocko@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-mediatek@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bhupesh Sharma <bhsharma@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@c-s.fr>, Dan Williams <dan.j.williams@intel.com>, Dave Kleikamp <dave.kleikamp@oracle.com>, David Airlie <airlied@linux.ie>, Geert
List-Id: linux-mediatek@lists.infradead.org

On 05.12.18 13:56, Michal Hocko wrote:
> On Wed 05-12-18 13:28:44, David Hildenbrand wrote:
> [...]
>> Most notably, for device memory we can hopefully soon stop setting
>> it PG_reserved
> 
> I am busy as hell so I am not likely to look at specific patche this
> week. But could you be more specific why we need to get rid of other
> PG_reserved users before we can do so for device memory?
> 

No worries, this has time.

For device memory, nothing should really be needed. I am only collecting
and docuumenting users and this is one user soon to go (eventually) :)

> I am all for removing relicts because they just confuse people but I
> fail to see any relation here.
> 

It's really only "why is this patch set not bigger", nothing related to
device memory actually :)

-- 

Thanks,

David / dhildenb
