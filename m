From: David Hildenbrand <david@redhat.com>
Subject: [PATCH RFC 0/7] mm: PG_reserved cleanups and documentation
Date: Wed,  5 Dec 2018 13:28:44 +0100
Message-ID: <20181205122851.5891-1-david@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-mediatek@lists.infradead.org, David Hildenbrand <david@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bhupesh Sharma <bhsharma@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@c-s.fr>, Dan Williams <dan.j.williams@intel.com>, Dave Kleikamp <dave.kleikamp@oracle.com>, David Airlie <airlied@linux.ie>
List-Id: linux-mediatek@lists.infradead.org

I was recently going over all users of PG_reserved. Short story: it is
difficult and sometimes not really clear if setting/checking for
PG_reserved is only a relict from the past. Easy to break things.

I had way more cleanups in this series inititally,
but some architectures take PG_reserved as a way to apply a different
caching strategy (for MMIO pages). So I decided to only include the most
obvious changes (that are less likely to break something).

So let's see if the documentation update for PG_reserved I crafted
actually covers most cases or if there is plenty more.

Most notably, for device memory we can hopefully soon stop setting
it PG_reserved

I only briefly tested this on s390x.

David Hildenbrand (7):
  agp: efficeon: no need to set PG_reserved on GATT tables
  s390/vdso: don't clear PG_reserved
  powerpc/vdso: don't clear PG_reserved
  riscv/vdso: don't clear PG_reserved
  m68k/mm: use __ClearPageReserved()
  arm64: kexec: no need to ClearPageReserved()
  mm: better document PG_reserved

 arch/arm64/kernel/machine_kexec.c |  1 -
 arch/m68k/mm/memory.c             |  2 +-
 arch/powerpc/kernel/vdso.c        |  2 --
 arch/riscv/kernel/vdso.c          |  1 -
 arch/s390/kernel/vdso.c           |  2 --
 drivers/char/agp/efficeon-agp.c   |  2 --
 include/linux/page-flags.h        | 18 ++++++++++++++++--
 7 files changed, 17 insertions(+), 11 deletions(-)

-- 
2.17.2
