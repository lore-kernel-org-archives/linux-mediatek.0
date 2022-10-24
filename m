Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E09BC38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 17:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6r+bZ0KIQcgIBQGg/2lFnvTSqzRA/jSqFmirw/3MQHA=; b=sdikkw3Shcqqo9DGf23zd5Rsws
	wBc0LSesGJIJ9VWOV48Cvsl1N49GXHuxzwPD9dU4vkvZpTogsfqm7JmMD5XEyelPMM3RnlRQscsTI
	0Ro+Gp9YgChsH8CyVVJLVukXAdrD/XBcOt+wfSBc4OuY3TbrXInvsd8hKwqsJK0I6VNzbNQTSO9JN
	Pd9Ee7s8c8t03pk6Uzcg6fLeqtVey2DH6KXk80aYdFHuQ1AdmrkGW3nbRoX4QOVqx4VxFHpb2xLWV
	/A1RyJR5MhnTUi7Rl129hdFuGoA284tg9Keb+2rXxMftQw/STRtkyDd4VYPNHBElHNT/WtkpnlK3W
	+065uuQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on0np-002PYY-Ty; Mon, 24 Oct 2022 16:59:53 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on0nm-002PXP-3M; Mon, 24 Oct 2022 16:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666630790; x=1698166790;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9hFNN8FocKL1s+t62fqYOxCC2IjJmS0OeL8/lk60yi4=;
  b=I6CV5KdSLCTLtGqNwvyAxylPdkzPADq8jl3177kxixLoNsUb9Cj8Bn7F
   gBTnwhoDclsDBGVqbG8opfv203OwELJF3dztynXeia420Wd0mX3Vc3ye2
   nbfXNrY8JXoav3iNtSX/e+y6L9HrGLsbUWURYlDp0rN02YbOzhdxhezfN
   QxvWpEgp799wRYf5W1n+GT4b6VIm/QtVPcx0vh7JwklP4ybAXC6td8TH9
   6aHgE4TO8LQR0ubA/5Rn6Kq4+bI6VEzCRWf+SLPAQBOJ06Fq5fytwluvQ
   FF4NBn6FgJz7nTfm8bcmlMyArcBk83lWodklHt7/ilnU6BsFmq5PIbVVm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="334061555"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="334061555"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 09:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="662496666"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="662496666"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Oct 2022 09:59:46 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1on0nh-0005Wl-1e;
	Mon, 24 Oct 2022 16:59:45 +0000
Date: Tue, 25 Oct 2022 00:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ntfs3@lists.linux.dev, netdev@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD SUCCESS WITH WARNING
 76cf65d1377f733af1e2a55233e3353ffa577f54
Message-ID: <6356c451.pwLIF+9EvDUrDjTY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_095950_189497_54EBEA8A 
X-CRM114-Status: UNSURE (   6.69  )
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
branch HEAD: 76cf65d1377f733af1e2a55233e3353ffa577f54  Add linux-next specific files for 20221024

Warning reports:

https://lore.kernel.org/linux-mm/202210090954.pTR6m6rj-lkp@intel.com
https://lore.kernel.org/linux-mm/202210110857.9s0tXVNn-lkp@intel.com
https://lore.kernel.org/linux-mm/202210111318.mbUfyhps-lkp@intel.com
https://lore.kernel.org/linux-mm/202210240729.zs46Cfzo-lkp@intel.com

Warning: (recently discovered and may have been fixed)

arch/parisc/kernel/setup.c:78 setup_cmdline() warn: curly braces intended?
drivers/net/phy/phylink.c:588 phylink_validate_mask_caps() warn: variable dereferenced before check 'state' (see line 583)

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-randconfig-s041-20221024
|   |-- fs-ntfs3-index.c:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s1-got-unsigned-short
|   `-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s2-got-unsigned-short
|-- microblaze-randconfig-m031-20221023
|   `-- drivers-net-phy-phylink.c-phylink_validate_mask_caps()-warn:variable-dereferenced-before-check-state-(see-line-)
|-- parisc-randconfig-m031-20221023
|   `-- arch-parisc-kernel-setup.c-setup_cmdline()-warn:curly-braces-intended
`-- x86_64-randconfig-m001
    `-- arch-x86-kernel-apic-apic.c-generic_processor_info()-warn:always-true-condition-(num_processors-()-)-(-u32max-)
clang_recent_errors
|-- hexagon-randconfig-r045-20221023
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a001-20221024
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a011
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a015
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- powerpc-randconfig-r015-20221023
|   |-- drivers-gpu-drm-amd-amdgpu-mmhub_v2_0.c:warning:variable-data-is-uninitialized-when-used-here
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- riscv-randconfig-r042-20221023
|   `-- ld.lld:error:undefined-symbol:dax_holder_notify_failure
|-- s390-randconfig-r022-20221023
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- s390-randconfig-r044-20221023
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- x86_64-randconfig-a002-20221024
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- x86_64-randconfig-a004-20221024
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
`-- x86_64-randconfig-a005-20221024
    `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true

elapsed time: 726m

configs tested: 91
configs skipped: 3

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                          rhel-8.3-func
i386                                defconfig
x86_64               randconfig-a013-20221024
x86_64                               rhel-8.3
x86_64               randconfig-a012-20221024
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
m68k                        m5272c3_defconfig
x86_64               randconfig-a016-20221024
powerpc                           allnoconfig
arm                                 defconfig
mips                             allyesconfig
x86_64               randconfig-a011-20221024
i386                          randconfig-a014
powerpc                          allmodconfig
x86_64               randconfig-a015-20221024
csky                              allnoconfig
i386                             allyesconfig
sh                          kfr2r09_defconfig
sh                               allmodconfig
x86_64               randconfig-a014-20221024
i386                          randconfig-a012
i386                          randconfig-a016
arc                                 defconfig
alpha                            allyesconfig
powerpc                      makalu_defconfig
arm                              allyesconfig
arm                            xcep_defconfig
m68k                             allmodconfig
powerpc                    amigaone_defconfig
sh                           sh2007_defconfig
arm64                            allyesconfig
arc                              allyesconfig
arc                  randconfig-r043-20221024
m68k                             allyesconfig
arc                         haps_hs_defconfig
alpha                               defconfig
sh                            migor_defconfig
mips                     loongson1b_defconfig
riscv                randconfig-r042-20221024
s390                                defconfig
parisc                generic-64bit_defconfig
arc                  randconfig-r043-20221023
s390                             allmodconfig
xtensa                          iss_defconfig
s390                 randconfig-r044-20221024
powerpc                      bamboo_defconfig
ia64                             allmodconfig
s390                             allyesconfig
arm                        shmobile_defconfig
arm                            hisi_defconfig
arc                          axs103_defconfig
powerpc                        cell_defconfig
mips                        bcm47xx_defconfig
sparc                       sparc64_defconfig
x86_64                         rhel-8.3-kunit

clang tested configs:
i386                 randconfig-a001-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a005-20221024
i386                 randconfig-a006-20221024
hexagon              randconfig-r045-20221023
i386                          randconfig-a013
hexagon              randconfig-r041-20221024
i386                          randconfig-a011
riscv                randconfig-r042-20221023
x86_64               randconfig-a001-20221024
arm                          moxart_defconfig
powerpc                      obs600_defconfig
x86_64               randconfig-a005-20221024
x86_64               randconfig-a003-20221024
powerpc                       ebony_defconfig
x86_64               randconfig-a006-20221024
i386                          randconfig-a015
hexagon              randconfig-r045-20221024
x86_64               randconfig-a004-20221024
arm                             mxs_defconfig
s390                 randconfig-r044-20221023
mips                       rbtx49xx_defconfig
x86_64               randconfig-a002-20221024
arm                          pxa168_defconfig
powerpc                     tqm8540_defconfig
powerpc                      ppc44x_defconfig
hexagon              randconfig-r041-20221023
arm                            dove_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

