Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0107C7619A
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Apr 2023 06:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=USrOT2vOr4OWdw0y6bm5mKbl25NsVHUGI5sgMmlAFGk=; b=lSCoNrp61rT6EMEKLhIkCAb6KO
	LsNKWDzksyEXmWHQamE9OqSywEZAFJhMzJqHdEBeDGu3uSwglu4ARKmkDEJLWshKvewoIIZzOLN3j
	ahcRuwmVWEVekwnqhWoNUDmRwn/3tUgYmyg7rArvBdmTRLcMcRp6z0O33FLJ1EEd4lE2wJnco55Bl
	v/XL9CA7JJprTB9zdx/8WKV9xbIH4HtFIlUfj/innj5zbHiDOBxECBiQz+IzaoG3FDFisuKzQafPk
	RW4nCyFaKp1FTtVar8oTsJHSn+2wY0atV5lCP6rw93C8j+IXCVH5MlLoWNIk764wj2ICMspmVjFNS
	8sNi6dzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnZRc-00BSW1-1E;
	Sat, 15 Apr 2023 06:31:32 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnZRW-00BSV5-0G;
	Sat, 15 Apr 2023 06:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681540286; x=1713076286;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vNjobJbkMOaL4V9aYbIr6Qr1gsthsCZ8xnDOUbhuCzI=;
  b=jYDFs9yqGn+oqw7AkcK5JiwgCnY4FZQlVWOrsf31AJIL9i2RzctisYtQ
   WjpwFQyf4z109BxlhcdftpZLw+ZVwz2n/ZaELHOxTioY3KKZexgbL4zvT
   Ptx4rdknw3msNPMsf7n6JO4hRlePsH0xC8QQiT/Ri5FdLw7ANAMJDEB0l
   ilqhfot1jUO53AM++5PH+qSFPpGFJ3PKlTpsf9pT2Fty3+17IOmRa9GrV
   s/nTsENpY6JESGoOaetgmOc5b9NvrShRoRWK8g6e4st+iSnwVqFFZQrpm
   5mUDFO9RSAHYPz9F36106q0jLsaYLIQob0y1XoE49Ajtm3xQmoyC1cRhd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346464338"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="346464338"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 23:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722720540"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="722720540"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 23:31:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnZRM-000ab7-2f;
	Sat, 15 Apr 2023 06:31:16 +0000
Date: Sat, 15 Apr 2023 14:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, linux-xfs@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD SUCCESS WITH WARNING
 d3f2cd24819158bb70701c3549e586f9df9cee67
Message-ID: <643a4484.lQNwSPXmxToKotfK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_233126_278480_DFE63259 
X-CRM114-Status: UNSURE (   6.86  )
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
branch HEAD: d3f2cd24819158bb70701c3549e586f9df9cee67  Add linux-next specific files for 20230414

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202303161521.jbGbaFjJ-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:351:13: warning: variable 'bw_needed' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:352:25: warning: variable 'link' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/legacy/ray_cs.c:628:17: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]

Unverified Warning (likely false positive, please contact us if interested):

drivers/acpi/property.c:985 acpi_data_prop_read_single() error: potentially dereferencing uninitialized 'obj'.
drivers/gpu/host1x/context.c:82 host1x_memory_context_list_init() warn: missing error code 'err'
drivers/gpu/host1x/dev.c:417 host1x_iommu_attach() warn: passing zero to 'ERR_PTR'
fs/xfs/scrub/refcount.c: xfs_mount.h is included more than once.
fs/xfs/scrub/refcount.c: xfs_trans_resv.h is included more than once.

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   `-- drivers-net-wireless-legacy-ray_cs.c:warning:strncpy-specified-bound-equals-destination-size
|-- alpha-randconfig-r013-20230409
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- arc-randconfig-c023-20230412
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- arc-randconfig-r022-20230409
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- arm-randconfig-m041-20230413
|   |-- drivers-gpu-host1x-context.c-host1x_memory_context_list_init()-warn:missing-error-code-err
|   `-- drivers-gpu-host1x-dev.c-host1x_iommu_attach()-warn:passing-zero-to-ERR_PTR
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- i386-randconfig-m021
|   `-- drivers-acpi-property.c-acpi_data_prop_read_single()-error:potentially-dereferencing-uninitialized-obj-.
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   `-- drivers-net-wireless-legacy-ray_cs.c:warning:strncpy-specified-bound-equals-destination-size
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- microblaze-randconfig-r012-20230415
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- parisc-randconfig-r003-20230410
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- powerpc-randconfig-r034-20230413
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- riscv-randconfig-r042-20230410
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   `-- drivers-net-wireless-legacy-ray_cs.c:warning:strncpy-specified-bound-equals-destination-size
|-- sparc64-randconfig-r014-20230415
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- x86_64-allnoconfig
|   |-- fs-xfs-scrub-refcount.c:xfs_mount.h-is-included-more-than-once.
|   `-- fs-xfs-scrub-refcount.c:xfs_trans_resv.h-is-included-more-than-once.
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
`-- x86_64-randconfig-m001
    `-- drivers-acpi-property.c-acpi_data_prop_read_single()-error:potentially-dereferencing-uninitialized-obj-.
clang_recent_errors
|-- arm-randconfig-r046-20230409
|   `-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c:warning:variable-ret-is-uninitialized-when-used-here
|-- arm64-randconfig-r032-20230410
|   `-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c:warning:variable-ret-is-uninitialized-when-used-here
`-- powerpc-randconfig-r035-20230410
    `-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c:warning:variable-ret-is-uninitialized-when-used-here

elapsed time: 734m

configs tested: 156
configs skipped: 13

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r006-20230415   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230409   gcc  
alpha                randconfig-r034-20230409   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r022-20230409   gcc  
arc                  randconfig-r032-20230413   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230415   gcc  
arm          buildonly-randconfig-r005-20230415   gcc  
arm                                 defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                        keystone_defconfig   gcc  
arm                   milbeaut_m10v_defconfig   clang
arm                  randconfig-r002-20230409   gcc  
arm                  randconfig-r006-20230410   gcc  
arm                  randconfig-r014-20230409   clang
arm                  randconfig-r024-20230409   clang
arm                  randconfig-r033-20230410   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm                           spitz_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230410   gcc  
arm64                randconfig-r032-20230410   clang
arm64                randconfig-r035-20230413   gcc  
arm64                randconfig-r036-20230413   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r015-20230409   clang
hexagon              randconfig-r015-20230413   clang
hexagon              randconfig-r024-20230410   clang
hexagon              randconfig-r031-20230409   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230409   gcc  
loongarch            randconfig-r021-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230409   gcc  
m68k                 randconfig-r012-20230409   gcc  
m68k                 randconfig-r015-20230410   gcc  
microblaze   buildonly-randconfig-r001-20230415   gcc  
microblaze           randconfig-r003-20230409   gcc  
microblaze           randconfig-r011-20230415   gcc  
microblaze           randconfig-r012-20230415   gcc  
microblaze           randconfig-r016-20230413   gcc  
microblaze           randconfig-r021-20230410   gcc  
microblaze           randconfig-r033-20230413   gcc  
microblaze           randconfig-r035-20230409   gcc  
microblaze           randconfig-r036-20230410   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                 randconfig-r031-20230410   gcc  
nios2        buildonly-randconfig-r003-20230415   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230409   gcc  
nios2                randconfig-r016-20230409   gcc  
nios2                randconfig-r026-20230409   gcc  
openrisc             randconfig-r012-20230410   gcc  
openrisc             randconfig-r022-20230410   gcc  
openrisc             randconfig-r026-20230410   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230410   gcc  
parisc               randconfig-r005-20230410   gcc  
parisc               randconfig-r011-20230413   gcc  
parisc               randconfig-r023-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                 mpc8540_ads_defconfig   gcc  
powerpc              randconfig-r034-20230413   gcc  
powerpc              randconfig-r035-20230410   clang
powerpc                    socrates_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230409   clang
riscv                randconfig-r036-20230409   clang
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230410   clang
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230410   gcc  
sh                   randconfig-r002-20230410   gcc  
sh                   randconfig-r013-20230410   gcc  
sh                           se7722_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230409   gcc  
sparc                randconfig-r011-20230410   gcc  
sparc                randconfig-r013-20230415   gcc  
sparc                randconfig-r032-20230409   gcc  
sparc                randconfig-r033-20230409   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64              randconfig-r014-20230413   gcc  
sparc64              randconfig-r014-20230415   gcc  
sparc64              randconfig-r016-20230410   gcc  
sparc64              randconfig-r016-20230415   gcc  
sparc64              randconfig-r025-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r034-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

