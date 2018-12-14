From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 0/9] mm: PG_reserved cleanups and documentation
Date: Fri, 14 Dec 2018 12:10:05 +0100
Message-ID: <20181214111014.15672-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-mm@kvack.org
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>, CHANDAN VN <chandan.vn@samsung.com>, David Hildenbrand <david@redhat.com>, David Airlie <airlied@linux.ie>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bhupesh Sharma <bhsharma@redhat.com>, Palmer Dabbelt <palmer@sifive.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Stefan Agner <stefan@agner.ch>, Michal Hocko <mhocko@kernel.org>, David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linux-riscv@lists.infradead.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>, linux-s390@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Logan Gunthorpe <logang@deltatee.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>G
List-Id: linux-mediatek@lists.infradead.org

I was recently going over all users of PG_reserved. Short story: it is
difficult and sometimes not really clear if setting/checking for
PG_reserved is only a relict from the past. Easy to break things. I
guess I know have a pretty good idea wh things are like that
nowadays and how they evolved.

I had way more cleanups in this series inititally,
but some architectures take PG_reserved as a way to apply a different
caching strategy (for MMIO pages). So I decided to only include the most
obvious changes (that are less likely to break something). So the big
chunk of manual SetPageReserved users are MMIO/DMA related things on
device buffers.

Most notably, for device memory we will hopefully soon stop setting
PG_reserved. The the documentation has to be updated.

RFC -> V1:
- Add more details to "mm: better document PG_reserved"
- Add "arm64: kdump: No need to mark crashkernel pages manually
       PG_reserved"
- Add "ia64: perfmon: Don't mark buffer pages as PG_reserved"
- Added ACKs

David Hildenbrand (9):
  agp: efficeon: no need to set PG_reserved on GATT tables
  s390/vdso: don't clear PG_reserved
  powerpc/vdso: don't clear PG_reserved
  riscv/vdso: don't clear PG_reserved
  m68k/mm: use __ClearPageReserved()
  arm64: kexec: no need to ClearPageReserved()
  arm64: kdump: No need to mark crashkernel pages manually PG_reserved
  ia64: perfmon: Don't mark buffer pages as PG_reserved
  mm: better document PG_reserved

 arch/arm64/kernel/machine_kexec.c |  3 +-
 arch/arm64/mm/init.c              | 27 --------------
 arch/ia64/kernel/perfmon.c        | 59 +++----------------------------
 arch/m68k/mm/memory.c             |  2 +-
 arch/powerpc/kernel/vdso.c        |  2 --
 arch/riscv/kernel/vdso.c          |  1 -
 arch/s390/kernel/vdso.c           |  2 --
 drivers/char/agp/efficeon-agp.c   |  2 --
 include/linux/page-flags.h        | 33 +++++++++++++++--
 9 files changed, 37 insertions(+), 94 deletions(-)

-- 
2.17.2
