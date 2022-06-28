Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF0EC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 20:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rh+Y3V3+f45N0EW8F/ZEjPLlLVEPgXDOOFv9dcH0Ycc=; b=BKGxrLGUnLLSIOqVcAOfm821Y2
	Lb+memONGm9gNdLCsTqGjPV7MXKh8u1s+NhsXpI61brqiBTNimcAeyliq1Hk9T2MznyZB4Xo2G5W7
	z0FxDB0vakewHwa2sju98ynYqWsRcRt2859YJQIuTICTEaVGSZ6ZgQeL3FBqyecriehByLalqWuTN
	FTyUZoR1WJKKnHoNfXDgMoKxDJeYxKHZ72lEX2CS2zkz0thkOfW/VUQ2RuAFwuMJNohZRM78LcyNn
	uOFCYfNFWwD5v4HxQ1EWkxp1yAtmXH6LBXNBySs5y+f6iSqWzaahsJa6pjq9xYcdLhXG+h1JsuwfG
	s8+b0Mmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6IJF-008AVJ-QV; Tue, 28 Jun 2022 20:59:45 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6IJC-008AU0-VP; Tue, 28 Jun 2022 20:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656449982; x=1687985982;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QK0HLafE+YKpw2cxy+6PgOYyuhwLGLCsViRFEk4ZbeM=;
  b=WBOWRupDcE7c/So178RiggyC531DP6y11dWMEVVsAINhxw/yKms5vFXY
   OqBW+Dq7d5qbVWF91ggpAfeMpS6B3Fs9u3iY3wli0iRyxrMvhW1QT2Xwg
   42xsQSSuooc5Kudk/IYOiZ1Uog/SLg286AiKOgA1YA4r+ldksRShHSkcR
   zbWDH6RqqkRYfIXVgHfj2+9ZuYOA4MWs+f48Yks3JXHozjj2tH25Vv8nu
   Yko2iV+pNCG2IeVXBzQ4Nm/wvG5hRUsMieTpqOHw8LEuBUntVJrgkV7W5
   ACFT3cV5YSCWN2EuPkWz2b9h7Arez8fw6vHwU33ukuSAwQx1oI5nrfDnk
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="280608398"
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; 
   d="scan'208";a="280608398"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 13:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; 
   d="scan'208";a="647077167"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jun 2022 13:59:34 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6IJ4-000Acs-17;
	Tue, 28 Jun 2022 20:59:34 +0000
Date: Wed, 29 Jun 2022 04:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: sound-open-firmware@alsa-project.org, netdev@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 cb71b93c2dc36d18a8b05245973328d018272cdf
Message-ID: <62bb6bb0.gs/a6XVO1Ng+Hc5l%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_135943_077633_F13BA206 
X-CRM114-Status: UNSURE (   6.33  )
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
branch HEAD: cb71b93c2dc36d18a8b05245973328d018272cdf  Add linux-next specific files for 20220628

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/kernel/interrupt.c:542:55: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
arch/powerpc/kernel/interrupt.c:542:55: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:1025:33: warning: variable 'pre_connection_type' set but not used [-Wunused-but-set-variable]
drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for 'pci_read' [-Wmissing-prototypes]
drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for 'pci_write' [-Wmissing-prototypes]
vmlinux.o: warning: objtool: __ct_user_enter+0x8c: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_idle_enter+0x19: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_idle_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_irq_enter+0x6a: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_irq_exit+0x6a: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_enter.constprop.0+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_enter_state+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_exit.constprop.0+0x53: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_exit_state+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_nmi_enter+0x4b: call to ftrace_likely_update() leaves .noinstr.text section

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/net/ethernet/microchip/lan743x_main.c:1238:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/soc/mediatek/mtk-mutex.c:799:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/staging/media/zoran/zr36016.c:430:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/staging/media/zoran/zr36050.c:829:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/staging/media/zoran/zr36060.c:869:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/thunderbolt/tmu.c:758:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
sound/soc/sof/intel/mtl.c:547:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- alpha-randconfig-r002-20220628
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- alpha-randconfig-r003-20220628
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-net-ethernet-microchip-lan743x_main.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   |-- drivers-soc-mediatek-mtk-mutex.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-staging-media-zoran-zr36016.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-staging-media-zoran-zr36050.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-staging-media-zoran-zr36060.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-thunderbolt-tmu.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   `-- sound-soc-sof-intel-mtl.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- powerpc-allmodconfig
|   |-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- powerpc-allnoconfig
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-buildonly-randconfig-r005-20220627
|   |-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- powerpc-randconfig-r023-20220627
|   `-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|-- riscv-buildonly-randconfig-r003-20220627
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- x86_64-randconfig-a011-20220627
|   |-- vmlinux.o:warning:objtool:__ct_user_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_idle_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_idle_exit:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_irq_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_irq_exit:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_enter_state:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_exit:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_exit_state:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   `-- vmlinux.o:warning:objtool:ct_nmi_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
`-- x86_64-randconfig-m001-20220627
    `-- arch-x86-events-core.c-init_hw_perf_events()-warn:missing-error-code-err

elapsed time: 726m

configs tested: 52
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64               randconfig-a015-20220627
x86_64               randconfig-a012-20220627
x86_64               randconfig-a016-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a013-20220627
x86_64               randconfig-a014-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a016-20220627
i386                 randconfig-a013-20220627
arc                  randconfig-r043-20220627
s390                 randconfig-r044-20220627
riscv                randconfig-r042-20220627
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a004-20220627
x86_64               randconfig-a006-20220627
i386                 randconfig-a002-20220627
i386                 randconfig-a004-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a006-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a005-20220627
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

