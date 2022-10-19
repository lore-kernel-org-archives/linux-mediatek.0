Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7C7C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 14:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+tWQaeIQsJ/hU9EXQIicaHKPbwUSRzgjdrId554pPs0=; b=ZCQU7hWWzNetPUoTFq5KtqpnGr
	w4gITtfZNF6yKpIKCvlkOX1YW6EEvD4f+iIBvi/GbUzR5CF7JODLBn5WryKdwthV2jYVylyxzwomN
	kSKlhZR8ZXyeMD9l/ePUhlRyXsKOMHNEEJUGpy+jJoyzWW98JEkGuuRfJkv9KfnGSOg2W7r0h7yRy
	AgWHAg1Y4OpTPtOmsmz7qrXuikDyUCnIlxk/dVU6cg3Q9l9SBES+YxG/8TucxadSJWMl1eOe4SMV7
	Fegn/aYkEDcyOz6YHlexaR5Ea9vRUVjjdBYgXIHl0YzSuv56pRv6doNcffmypD5jWHPNB++SOk7VX
	eII7xHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olAVU-002xFH-UZ; Wed, 19 Oct 2022 14:57:20 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olAFh-002qGe-64; Wed, 19 Oct 2022 14:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666190461; x=1697726461;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6v6qLdtYAoaiS5TSUCzJk/2BpQGCWyMLYrB07TdQAKY=;
  b=Idjcfcb1nYGdps3p83fxwdl2r6zTvPqUlQ+zfLh4LcDZAyaLLPs9aENe
   IaLR/kKK7TURUskgm4Eh2CPxKHSRSi1x8xzrIX9e6zIZpEnqYd9BaIh3M
   P/rqpfM81zD18r9cFs/caWUqwdwwDeN9dAyPSz6UO0VctJuBcxOYw2BLU
   m2EkaozU2gHKHs06py5S4I29wHSjE3ZZjWkD9jrutoQ6bxMu70Yj+Zmhc
   tUek98LJ8QRbm6V6HGjb9iYi4WuSbn3DZNYbEiKjLtMvFFaUOZ+BuSDLN
   CwXpCwGXxyq+W0pQFyjDMHkGdQ3Ih51Cx6Rd5QGuPKOxWhD0ZBsY6b9EE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="307535359"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="307535359"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 07:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="692416016"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="692416016"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 Oct 2022 07:40:55 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1olAFV-00006T-2P;
	Wed, 19 Oct 2022 14:40:49 +0000
Date: Wed, 19 Oct 2022 22:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ntfs3@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-ext4@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 a72b55bc981b62f7186600d06d1824f1d0612b27
Message-ID: <63500c67.OtDDn8C+xvHrmrIj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_074101_386979_86F4288F 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: a72b55bc981b62f7186600d06d1824f1d0612b27  Add linux-next specific files for 20221019

Error/Warning reports:

https://lore.kernel.org/linux-mm/202210090954.pTR6m6rj-lkp@intel.com
https://lore.kernel.org/linux-mm/202210110857.9s0tXVNn-lkp@intel.com
https://lore.kernel.org/linux-mm/202210111318.mbUfyhps-lkp@intel.com
https://lore.kernel.org/llvm/202210060148.UXBijOcS-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
arch/powerpc/mm/nohash/e500.c:314:21: error: no previous prototype for 'relocate_init' [-Werror=missing-prototypes]
fs/ext4/super.c:1744:19: warning: 'deprecated_msg' defined but not used [-Wunused-const-variable=]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-randconfig-c041-20221019
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-randconfig-s031-20221019
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- fs-ntfs3-index.c:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s1-got-unsigned-short
|   `-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s2-got-unsigned-short
|-- i386-allyesconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-defconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a003
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a005
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a012
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a014
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a016
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- microblaze-randconfig-s033-20221019
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- fs-ntfs3-index.c:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s1-got-unsigned-short
|   `-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s2-got-unsigned-short
|-- openrisc-randconfig-s052-20221019
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
clang_recent_errors
|-- hexagon-defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-randconfig-r013-20221019
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-randconfig-r031-20221019
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-randconfig-r036-20221019
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmnewmap
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmsetvec
|   `-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-memset
|-- hexagon-randconfig-r041-20221018
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmnewmap
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmsetvec
|   `-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-memset
|-- hexagon-randconfig-r045-20221018
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmnewmap
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmsetvec
|   `-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-memset
|-- i386-randconfig-a002
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a004
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a011
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a013
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a015
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- powerpc-buildonly-randconfig-r004-20221019
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|-- powerpc-mvme5100_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- riscv-randconfig-r024-20221019
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-get_symbol_pos:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_num_syms
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-get_symbol_pos:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_names
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_num_syms
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_relative_base

elapsed time: 725m

configs tested: 77
configs skipped: 3

gcc tested configs:
arc                              alldefconfig
um                             i386_defconfig
um                           x86_64_defconfig
m68k                       m5208evb_defconfig
powerpc                    klondike_defconfig
x86_64                          rhel-8.3-func
i386                                defconfig
x86_64                    rhel-8.3-kselftests
arc                                 defconfig
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                        randconfig-a013
i386                          randconfig-a014
x86_64                        randconfig-a004
x86_64                              defconfig
x86_64                        randconfig-a011
arc                  randconfig-r043-20221018
x86_64                         rhel-8.3-kunit
loongarch                         allnoconfig
x86_64                        randconfig-a002
riscv                randconfig-r042-20221018
x86_64                           rhel-8.3-kvm
alpha                               defconfig
i386                             allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a012
s390                 randconfig-r044-20221018
x86_64                        randconfig-a006
arm64                            allyesconfig
i386                          randconfig-a016
x86_64                               rhel-8.3
sh                          polaris_defconfig
i386                          randconfig-a001
arm                              allyesconfig
i386                          randconfig-a003
mips                         cobalt_defconfig
x86_64                           allyesconfig
sh                             shx3_defconfig
i386                          randconfig-a005
powerpc                           allnoconfig
m68k                             allmodconfig
powerpc                          allmodconfig
arc                              allyesconfig
mips                             allyesconfig
s390                             allmodconfig
alpha                            allyesconfig
s390                                defconfig
sh                               allmodconfig
arc                         haps_hs_defconfig
ia64                             allmodconfig
arc                           tb10x_defconfig
sparc                             allnoconfig
m68k                             allyesconfig
m68k                        mvme16x_defconfig
s390                             allyesconfig
arm                         cm_x300_defconfig
sh                   sh7724_generic_defconfig
sh                           se7712_defconfig

clang tested configs:
hexagon                             defconfig
hexagon              randconfig-r045-20221018
i386                          randconfig-a013
x86_64                        randconfig-a016
i386                          randconfig-a011
x86_64                        randconfig-a012
mips                        bcm63xx_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a014
hexagon              randconfig-r041-20221018
x86_64                        randconfig-a003
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                      obs600_defconfig
x86_64                          rhel-8.3-rust
powerpc                    mvme5100_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

