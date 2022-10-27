Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308A6ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6TLxnvMho3VR2F1suhllbMOdjxPyqlGMmhnBFv67fpc=; b=nEyOhSqGqR6zo/bvcc+Bq3bZsF
	yzE1hYHBm6c+1jBwsQZvdFXY3HWCwtwl3Zi4qPK2l3AFkjfCiEVbYTk+3/bdF4CJft5XfZQLL71Bk
	92MQscl8NxOQtIppo67mjYoCpZT0spZxkX7BWUvWCIBdYTT4DfBeZGoI8mlNWNl1xJX9z9NVlvKOr
	S+A0oDzZ3hrdYM3koKUjMhC9KuKhCpRKHkbZK0OjJQ9/H5hqOJOsWxJjDWeUHbitq07jLO9McKe1i
	XbaUczqIXp2xgs1tquyIzQS5vZRhqu0vZQKzGMtAvcwcsIrT2rED+QOh/CoHd9KHLI0q/A7L0ru5t
	xR7DpYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo5qo-00EFQL-OT; Thu, 27 Oct 2022 16:35:26 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo5ql-00EFPp-4d; Thu, 27 Oct 2022 16:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666888523; x=1698424523;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g8JpxJ/7sThIg/BLIJ/mUFG37Ckprmp4RiCF2hAGE4k=;
  b=MhUwJn8g/T439Idcy9TjzxV0pQL+v5ABe+gVzW4oSlR5B5LZE8lCPJrQ
   f/JlDPDFZIGZy1sbh0J4gPWHwUQED8iOWQ/xfzVagRfOHo3iynUpFQt2V
   cHojNCEhbYoF9Qq++uQBN0x0C8iNhhU/kMfFeC9jtNfFy2tiwi5L6Al/K
   wXTCMep61hvs3lQ1YjSg7frJA5wGIV5pnQP63TleVZayhx1gJFEP9inHz
   Nvs+J5kxcbqv1U5qeCg7aBJtNhxLi/9BO5JKVYzfCl2mUw11T/HczV5xI
   iIRJ7MFpqXg4RwNpMo/HMpofQZljNBpVfKx3wss6Mv9QC1NDtciktdTou
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="307000896"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="307000896"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 09:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="757761930"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="757761930"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Oct 2022 09:35:16 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oo5qe-0008zP-0K;
	Thu, 27 Oct 2022 16:35:16 +0000
Date: Fri, 28 Oct 2022 00:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ntfs3@lists.linux.dev, netdev@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD SUCCESS WITH WARNING
 ecc4eeb2208ab537a3f3744984cd7f30ac971db8
Message-ID: <635ab32d.6UouMR1hjiK2K4CL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_093523_263755_C3046A66 
X-CRM114-Status: UNSURE (   5.09  )
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
branch HEAD: ecc4eeb2208ab537a3f3744984cd7f30ac971db8  Add linux-next specific files for 20221027

Warning reports:

https://lore.kernel.org/linux-mm/202210090954.pTR6m6rj-lkp@intel.com
https://lore.kernel.org/linux-mm/202210111318.mbUfyhps-lkp@intel.com
https://lore.kernel.org/linux-mm/202210261404.b6UlzG7H-lkp@intel.com
https://lore.kernel.org/llvm/202210060148.UXBijOcS-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210270637.Q5Y7FiKJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210271517.snUEnhD0-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210272129.7rvjxsdk-lkp@intel.com

Warning: (recently discovered and may have been fixed)

arch/loongarch/kernel/traps.c:250 die() warn: variable dereferenced before check 'regs' (see line 244)
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:615: warning: expecting prototype for setup_subvp_dmub_command(). Prototype was for populate_subvp_cmd_pipe_info() instead
drivers/hwmon/jc42.c:384 jc42_write() warn: inconsistent returns '&data->update_lock'.
drivers/net/ethernet/freescale/fman/fman_memac.c:1209 memac_initialization() warn: passing zero to 'PTR_ERR'
include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens

Unverified Warning (likely false positive, please contact us if interested):

lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-m031-20221025
|   `-- drivers-net-ethernet-freescale-fman-fman_memac.c-memac_initialization()-warn:passing-zero-to-PTR_ERR
|-- arm-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dc_dmub_srv.c:warning:expecting-prototype-for-setup_subvp_dmub_command().-Prototype-was-for-populate_subvp_cmd_pipe_info()-instead
|-- arm64-randconfig-s041-20221026
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   `-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- i386-randconfig-m021
|   |-- arch-x86-boot-compressed-..-..-..-..-lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequence()-warn:inconsistent-indenting
|   |-- arch-x86-boot-compressed-..-..-..-..-lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEnd()-warn:inconsistent-indenting
|   |-- arch-x86-boot-compressed-..-..-..-..-lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEndSplitLitBuffer()-warn:inconsistent-indenting
|   |-- arch-x86-boot-compressed-..-..-..-..-lib-zstd-decompress-zstd_decompress_internal.h-ZSTD_DCtx_get_bmi2()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-huf_compress.c-HUF_getIndex()-warn:the-RANK_POSITION_LOG_BUCKETS_BEGIN-macro-might-need-parens
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequence()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEnd()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEndSplitLitBuffer()-warn:inconsistent-indenting
|   `-- lib-zstd-decompress-zstd_decompress_internal.h-ZSTD_DCtx_get_bmi2()-warn:inconsistent-indenting
|-- ia64-randconfig-s052-20221026
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   `-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- loongarch-randconfig-m041-20221026
|   |-- arch-loongarch-kernel-traps.c-die()-warn:variable-dereferenced-before-check-regs-(see-line-)
|   |-- drivers-hwmon-jc42.c-jc42_write()-warn:inconsistent-returns-data-update_lock-.
|   |-- lib-zstd-compress-huf_compress.c-HUF_getIndex()-warn:the-RANK_POSITION_LOG_BUCKETS_BEGIN-macro-might-need-parens
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequence()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEnd()-warn:inconsistent-indenting
|   `-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEndSplitLitBuffer()-warn:inconsistent-indenting
|-- mips-randconfig-r013-20221027
|   |-- include-asm-generic-div64.h:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|   `-- include-asm-generic-div64.h:warning:right-shift-count-width-of-type
|-- nios2-randconfig-s042-20221026
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- fs-ntfs3-index.c:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s1-got-unsigned-short
clang_recent_errors
|-- arm-buildonly-randconfig-r003-20221026
|   |-- drivers-pinctrl-qcom-pinctrl-lpass-lpi.c:error:call-to-undeclared-function-FIELD_GET-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-pinctrl-qcom-pinctrl-lpass-lpi.c:error:call-to-undeclared-function-u32_encode_bits-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-pinctrl-qcom-pinctrl-lpass-lpi.c:error:call-to-undeclared-function-u32p_replace_bits-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- hexagon-randconfig-r041-20221026
|   `-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
`-- riscv-randconfig-r001-20221026
    |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-get_symbol_pos:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_num_syms
    |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-get_symbol_pos:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets
    |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_num_syms
    |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets
    |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_relative_base
    |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_on_each_symbol:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_num_syms
    |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_on_each_symbol:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets
    `-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_on_each_symbol:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_relative_base

elapsed time: 721m

configs tested: 79
configs skipped: 2

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a001
i386                          randconfig-a012
i386                          randconfig-a003
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
i386                          randconfig-a016
x86_64                           allyesconfig
x86_64                        randconfig-a002
powerpc                           allnoconfig
i386                             allyesconfig
arm                                 defconfig
arc                                 defconfig
arm                              allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
x86_64                        randconfig-a015
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
sh                               allmodconfig
arc                              allyesconfig
alpha                               defconfig
mips                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
riscv                randconfig-r042-20221026
s390                                defconfig
s390                             allmodconfig
arc                  randconfig-r043-20221026
s390                 randconfig-r044-20221026
s390                             allyesconfig
m68k                        m5272c3_defconfig
sparc                             allnoconfig
xtensa                    smp_lx200_defconfig
i386                          randconfig-c001
m68k                           sun3_defconfig
powerpc                 canyonlands_defconfig
m68k                       m5208evb_defconfig
riscv                               defconfig
sh                        dreamcast_defconfig
microblaze                      mmu_defconfig
m68k                         amcore_defconfig
openrisc                  or1klitex_defconfig
mips                         bigsur_defconfig
sh                             shx3_defconfig
arm                           h5000_defconfig
alpha                            alldefconfig
m68k                          hp300_defconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a003
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20221026
hexagon              randconfig-r041-20221026
arm                        mvebu_v5_defconfig
powerpc                     ppa8548_defconfig
arm                  colibri_pxa270_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                           spitz_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

