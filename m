From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: next/master boot: 310 boots: 11 failed, 292 passed with 6 offline,
 1 untried/unknown (next-20190904)
Date: Wed, 04 Sep 2019 17:15:53 -0700
Message-ID: <7hzhjjsime.fsf@baylibre.com>
References: <5d700b15.1c69fb81.2abcd.479b@mx.google.com>
 <20190904192725.GI4348@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190904192725.GI4348@sirena.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Steven Liu <steven.liu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-mediatek@lists.infradead.org

[ + Steven Liu who donated this board to my kernelCI lab ]

Mark Brown <broonie@kernel.org> writes:

> On Wed, Sep 04, 2019 at 12:05:57PM -0700, kernelci.org bot wrote:
>
> Since 30th August -next fails to boot with no kernel output on
> mt7622-rfb1:
>
>> arm64:
>>     defconfig:
>>         gcc-8:
>>             mt7622-rfb1: 1 failed lab
>> 
>>     defconfig+CONFIG_RANDOMIZE_BASE=y:
>>         gcc-8:
>>             mt7622-rfb1: 1 failed lab
>
> There's logging from ATF so it looks like we try to boot the kernel:
>
> Starting kernel ...
>
> [ATF][    36.199793]save kernel info
> [ATF][    36.202824]Kernel_EL2
> [ATF][    36.205580]Kernel is 64Bit
> [ATF][    36.208768]pc=0x40080000, r0=0x5cf48000, r1=0x0
> INFO:    BL3-1: Preparing for EL3 exit to normal world, Kernel
> INFO:    BL3-1: Next image address = 0x40080000
> INFO:    BL3-1: Next image spsr = 0x3c9
> [ATF][    36.227037]el3_exit
>
> but no output.  More details including full logs at:
>
> 	https://kernelci.org/boot/id/5d6fe70059b514164ef1224d/
> 	https://kernelci.org/boot/id/5d6fe6e259b514164ef12243/

Bisected down to this commit[1], full bisect log here[2].  It didn't
revert cleanly on top of next-20190904, so I didn't get any further.

Kevin

[1]
419e2f1838819e954071dfa1d1f820ab3386ada1 is the first bad commit
commit 419e2f1838819e954071dfa1d1f820ab3386ada1
Author: Christoph Hellwig <hch@lst.de>
Date:   Mon Aug 26 09:03:44 2019 +0200

    dma-mapping: remove arch_dma_mmap_pgprot
    
    arch_dma_mmap_pgprot is used for two things:
    
     1) to override the "normal" uncached page attributes for mapping
        memory coherent to devices that can't snoop the CPU caches
     2) to provide the special DMA_ATTR_WRITE_COMBINE semantics on older
        arm systems and some mips platforms
    
    Replace one with the pgprot_dmacoherent macro that is already provided
    by arm and much simpler to use, and lift the DMA_ATTR_WRITE_COMBINE
    handling to common code with an explicit arch opt-in.
    
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>     # m68k
    Acked-by: Paul Burton <paul.burton@mips.com>            # mips

 arch/arm/Kconfig                   |  2 +-
 arch/arm/mm/dma-mapping.c          |  6 ------
 arch/arm64/Kconfig                 |  1 -
 arch/arm64/include/asm/pgtable.h   |  4 ++++
 arch/arm64/mm/dma-mapping.c        |  6 ------
 arch/m68k/Kconfig                  |  1 -
 arch/m68k/include/asm/pgtable_mm.h |  3 +++
 arch/m68k/kernel/dma.c             |  3 +--
 arch/mips/Kconfig                  |  2 +-
 arch/mips/mm/dma-noncoherent.c     |  8 --------
 include/linux/dma-noncoherent.h    | 13 +++++++++++--
 kernel/dma/Kconfig                 | 12 +++++++++---
 kernel/dma/mapping.c               |  8 +++++---
 13 files changed, 35 insertions(+), 34 deletions(-)
bisect run success

[2]
$ git bisect log
git bisect start
# bad: [35394d031b710e832849fca60d0f53b513f0c390] Add linux-next specific files for 20190904
git bisect bad 35394d031b710e832849fca60d0f53b513f0c390
# good: [089cf7f6ecb266b6a4164919a2e69bd2f938374a] Linux 5.3-rc7
git bisect good 089cf7f6ecb266b6a4164919a2e69bd2f938374a
# bad: [493424779be81b03fb4aca89cc05ba95e9fc0c31] Merge remote-tracking branch 'crypto/master'
git bisect bad 493424779be81b03fb4aca89cc05ba95e9fc0c31
# bad: [58a02f90fddfdc9e4dfbd6579ff788ffdc22afe4] Merge remote-tracking branch 'hid/for-next'
git bisect bad 58a02f90fddfdc9e4dfbd6579ff788ffdc22afe4
# bad: [27c3f6e1d84b47def9060fd481be92838d819a9b] Merge remote-tracking branch 'csky/linux-next'
git bisect bad 27c3f6e1d84b47def9060fd481be92838d819a9b
# good: [f119c164735d85f2a41d14503cb9933d219c539e] arm-soc: document merges
git bisect good f119c164735d85f2a41d14503cb9933d219c539e
# bad: [e87b432d6c45697defc03eb69261661060c85245] Merge remote-tracking branch 'actions/for-next'
git bisect bad e87b432d6c45697defc03eb69261661060c85245
# good: [1ab97157f64dadb44d029096c6a92305d6631ab2] Merge remote-tracking branch 'kbuild/for-next'
git bisect good 1ab97157f64dadb44d029096c6a92305d6631ab2
# good: [ac12cf85d682a2c1948210c65f7fb21ef01dd9f6] Merge branches 'for-next/52-bit-kva', 'for-next/cpu-topology', 'for-next/error-injection', 'for-next/perf', 'for-next/psci-cpuidle', 'for-next/rng', 'for-next/smpboot', 'for-next/tbi' and 'for-next/tlbi' into for-next/core
git bisect good ac12cf85d682a2c1948210c65f7fb21ef01dd9f6
# bad: [4934d349f6e5afc9345a44acb0daa3066594088a] Merge remote-tracking branch 'asm-generic/master'
git bisect bad 4934d349f6e5afc9345a44acb0daa3066594088a
# good: [5251a1c90f7f4e458dc3154920e09624311f54b6] Merge remote-tracking branch 'compiler-attributes/compiler-attributes'
git bisect good 5251a1c90f7f4e458dc3154920e09624311f54b6
# skip: [38c38cb73223218f6eedf485280917af1f8a0af2] mmc: queue: use bigger segments if DMA MAP layer can merge the segments
git bisect skip 38c38cb73223218f6eedf485280917af1f8a0af2
# bad: [419e2f1838819e954071dfa1d1f820ab3386ada1] dma-mapping: remove arch_dma_mmap_pgprot
git bisect bad 419e2f1838819e954071dfa1d1f820ab3386ada1
# good: [5518ea1ad2c0c7f38d067f621d9349e6a11c8879] unicore32: remove the unused pgprot_dmacoherent define
git bisect good 5518ea1ad2c0c7f38d067f621d9349e6a11c8879
# good: [b898e50f9f49f7d90f3bca94ac046145072034a2] arm-nommu: remove the unused pgprot_dmacoherent define
git bisect good b898e50f9f49f7d90f3bca94ac046145072034a2
