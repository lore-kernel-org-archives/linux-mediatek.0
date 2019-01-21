From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/9] mm: PG_reserved cleanups and documentation
Date: Mon, 21 Jan 2019 12:36:35 +0100
Message-ID: <6abb9ad2-f103-12a2-e1dc-eec81b801338@redhat.com>
References: <20190114125903.24845-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190114125903.24845-1-david@redhat.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>, CHANDAN VN <chandan.vn@samsung.com>, David Airlie <airlied@linux.ie>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bhupesh Sharma <bhsharma@redhat.com>, Palmer Dabbelt <palmer@sifive.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Tony Luck <tony.luck@intel.com>, Stefan Agner <stefan@agner.ch>, Michal Hocko <mhocko@kernel.org>, David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linux-riscv@lists.infradead.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>, linux-s390@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Logan Gunthorpe <logang@deltatee.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>, Geert
List-Id: linux-mediatek@lists.infradead.org

On 14.01.19 13:58, David Hildenbrand wrote:
> Nothing major changed since the last version. I would be happy about
> additional ACKs. If there are no further comments, can this go via the
> mm-tree in one chunk?

For the time being, I will not add further patches to this series (as
discussed in response to one question, we have to be careful dropping
PG_reserved at some places). Only ACKs were added during review so far.

@Andrew, how to proceed with this?

-- 

Thanks,

David / dhildenb
