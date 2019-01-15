From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/9] mm: PG_reserved cleanups and documentation
Date: Tue, 15 Jan 2019 16:53:00 +0100
Message-ID: <447946ff-403a-6ca3-2958-688d28a82fce@redhat.com>
References: <20190114125903.24845-1-david@redhat.com>
 <20190115153839.GE26443@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190115153839.GE26443@infradead.org>
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
To: Christoph Hellwig <hch@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>, CHANDAN VN <chandan.vn@samsung.com>, David Airlie <airlied@linux.ie>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bhupesh Sharma <bhsharma@redhat.com>, Palmer Dabbelt <palmer@sifive.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Stefan Agner <stefan@agner.ch>, Michal Hocko <mhocko@kernel.org>, David Howells <dhowells@redhat.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>, linux-s390@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>Matthias Brugger <m>
List-Id: linux-mediatek@lists.infradead.org

On 15.01.19 16:38, Christoph Hellwig wrote:
> On Mon, Jan 14, 2019 at 01:58:54PM +0100, David Hildenbrand wrote:
>> Nothing major changed since the last version. I would be happy about
>> additional ACKs. If there are no further comments, can this go via the
>> mm-tree in one chunk?
>>
>> I was recently going over all users of PG_reserved. Short story: it is
>> difficult and sometimes not really clear if setting/checking for
>> PG_reserved is only a relict from the past. Easy to break things. I
>> guess I now have a pretty good idea wh things are like that
>> nowadays and how they evolved.
> 
> Any reason you skipped
> 
> drivers/gpu/drm/drm_pci.c:drm_pci_alloc()
> 
> and 
> 
> drivers/gpu/drm/drm_scatter.c:drm_legacy_sg_alloc()
> 
> which both look completely bogus as-is?
> 
> In fact we should probably just try to kill them off as they have
> very few users left.
> 

I actually have patches lying around for these, however excluded them
for now as I was not 100% sure about the implications ("Easy to break
things").

Are you sure nobody in the system (especially somebody who does a
PageReserved()) relies on this to identify e.g. MMIO pages? (e.g.
ioremap on some archs, KVM code)

(I am by far no DRM expert, but when I hear DMA, I tend to be careful)

-- 

Thanks,

David / dhildenb
