Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A669CC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 15:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+S29/9SNca0F00enRk5j0Kx8wG6+e4dzvw4zMRdxu38=; b=xBpJuCGi2BgXsMTXg1SQL1mUUO
	YgyY6sdvi+H0TaVHlxdmY1ObGKBEk9vYK5sBFM0vOflPs2m3oXRpU+MYuSihNF1CPpieOL8BqDdKZ
	Y7jeL75QXyB8AItdAQ/NFaPGXimoCubprm5lKj9lRdsi3UjXD1a2loV1VlW7EBNF3GenpBZ2Bsk+p
	hSyhToV0ARgHdtbmpIF7Q3ZNrZ7naSxMpURapDFbghBFIFtU2ZxEQxlwJspf4R77RV7gJC6j2pLG9
	G6BIuEjLXR6/GqIzLSNXA7Z3Ke0y+ghvLLiZue7Q6rg0Qle/AQ7vBhJD4aP786CcnC6lWuyqzBwr8
	TSMohHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSJ4-00DNk2-F1; Mon, 17 Oct 2022 15:45:34 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSJ0-00DNiQ-19; Mon, 17 Oct 2022 15:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666021530; x=1697557530;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3v629TfnQ6eCHCvRptZHiwXoRTAfdgVXR3TJuTbFQ10=;
  b=OUbP4VVev/2TyiLuaWNyCQdAMjWCALGGbSbhJ6AwsOoiKwWEznejElXX
   gk1fevQeQ3Ji5HkOT6X5Z5fqhUcmYOzAMKKapcmvstA16U49lPOTOaZfS
   30gQoQpDLBR1bXEFgAv7GfKdXCCQFXKLOjH18Ku7P+zMcJkbCGJZ+HPYj
   8U/6bm8siLkS3PLNf2vpUhG/J8Yht9rPfn97CplmI8un2f83gez/vlEZb
   Rgpw7tz255S7yx1FFRy1b05DDKG7ynPIjz4dA03XzsAkj7y93X4PuLC+l
   CVzKzjW3OMiSo2QQwXHDC8ApEIv/1Q3e1uDGZAImmVT8jmXg+eYJeHwe5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="307494823"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="307494823"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 08:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="717537483"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="717537483"
Received: from lkp-server01.sh.intel.com (HELO 8381f64adc98) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2022 08:45:25 -0700
Received: from kbuild by 8381f64adc98 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1okSIu-0000fA-28;
	Mon, 17 Oct 2022 15:45:24 +0000
Date: Mon, 17 Oct 2022 23:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ntfs3@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-ext4@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 77d8bf70fac0900844491376bc18b491710168bf
Message-ID: <634d7858.CIIfTENtfSUJb4x+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_084530_183551_BEC00AD1 
X-CRM114-Status: UNSURE (   6.13  )
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
branch HEAD: 77d8bf70fac0900844491376bc18b491710168bf  Add linux-next specific files for 20221017

Error/Warning reports:

https://lore.kernel.org/linux-mm/202210110857.9s0tXVNn-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
fs/ext4/super.c:1744:19: warning: 'deprecated_msg' defined but not used [-Wunused-const-variable=]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- i386-allyesconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-defconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a003-20221017
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- s390-allmodconfig
|   |-- ERROR:devm_ioremap_resource-drivers-dma-idma64.ko-undefined
|   `-- ERROR:devm_ioremap_resource-drivers-dma-qcom-hdma.ko-undefined
|-- x86_64-allyesconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-buildonly-randconfig-r003-20221017
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-defconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-a001-20221017
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-a002-20221017
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-a003-20221017
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-a004-20221017
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-a005-20221017
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-a006-20221017
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-r002-20221017
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-rhel-8.3
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-rhel-8.3-func
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-rhel-8.3-kselftests
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-rhel-8.3-kvm
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
`-- x86_64-rhel-8.3-syz
    `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
clang_recent_errors
|-- arm64-randconfig-r011-20221017
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- arm64-randconfig-r024-20221017
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-buildonly-randconfig-r006-20221017
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|-- hexagon-randconfig-r041-20221017
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a013-20221017
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a014-20221017
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a016-20221017
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- mips-randconfig-r005-20221017
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- riscv-randconfig-r042-20221017
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- s390-randconfig-r044-20221017
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- x86_64-randconfig-a011-20221017
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a012-20221017
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a016-20221017
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- x86_64-randconfig-r013-20221017
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
`-- x86_64-rhel-8.3-rust
    `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg

elapsed time: 726m

configs tested: 59
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221017
i386                 randconfig-a001-20221017
i386                                defconfig
i386                 randconfig-a002-20221017
i386                 randconfig-a003-20221017
x86_64                              defconfig
i386                 randconfig-a005-20221017
i386                 randconfig-a004-20221017
i386                 randconfig-a006-20221017
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
arc                                 defconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
s390                             allmodconfig
alpha                               defconfig
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
s390                                defconfig
x86_64                           allyesconfig
sh                               allmodconfig
mips                             allyesconfig
s390                             allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a002-20221017
arm                                 defconfig
x86_64               randconfig-a003-20221017
x86_64               randconfig-a004-20221017
x86_64               randconfig-a001-20221017
x86_64               randconfig-a005-20221017
x86_64               randconfig-a006-20221017
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20221017
hexagon              randconfig-r045-20221017
s390                 randconfig-r044-20221017
riscv                randconfig-r042-20221017
x86_64               randconfig-a013-20221017
i386                 randconfig-a011-20221017
x86_64               randconfig-a012-20221017
x86_64                          rhel-8.3-rust
i386                 randconfig-a013-20221017
x86_64               randconfig-a015-20221017
x86_64               randconfig-a016-20221017
i386                 randconfig-a012-20221017
i386                 randconfig-a014-20221017
x86_64               randconfig-a011-20221017
i386                 randconfig-a016-20221017
x86_64               randconfig-a014-20221017
i386                 randconfig-a015-20221017

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

