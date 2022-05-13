Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30508C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 02:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkTFYkP5we8drghtsS2QfuOHkGbESBWHUSH02RMyUA0=; b=uv0MHGuEar08Lg
	z2998+yA2kath+yHbutDSVzpPJLJQ7ObXFEDZ7djw+tWb+78ozHXGsR+oXvuSRMghlQgC0oDlok4y
	COKsn25cSQvB7zH+k55Ixlseev8JnLC/ny752znZeS1t2av8JgqTmhWD6OlyoagCpy+k1kI1KlfKp
	F05M4FStOe1rfE0fhZjDcZcGCfgJE+uDyxZewJWeH6PLwFbcwmFUilo3XM/YfMBQqcBfbhnghWHMC
	ckN8PNxrTeDe/8AO6I8bEifPdJZghYcY+NZu7udKaXEFsvhJTtmdPrkkDhNmK6zx32MmI73/t8/ul
	b1j5IJihl8ozTXk0ZuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npLHM-00EDFo-2j; Fri, 13 May 2022 02:43:44 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npLHA-00EDDb-OU; Fri, 13 May 2022 02:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652409812; x=1683945812;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+cUtYQK4Km2C++rGq/ah79HG9mDpGf2y1yRstGxDmSo=;
 b=FwAv7Mh+CORvgIgtpRzVIGkls8J/m+M1bLqEizEG64cJXZZvEBNZn9p6
 c0RlqmDopKXUoLUCv0UP5HLW9xbHHIpQSKmDYnivBUXFBjX86pQNY0QGT
 ASCC4yhuVElKLmQWKcQHy/kvV7ixVsO5NRqkJlXWNB+S4XpOGKCz/KSys
 zR74CAxT1+oD+v+t2mOgqFbgq/9FA61lQ7ftoGNgp1PPqoW1PZuf6DNER
 JirwMay0Ratv1hD6Hk6cHExpr/w2stOdsZF84eqC6GSHElI2s9Ky6aKEL
 uds3wYNpgxP/G/BfAw0BMbOo7SDPnHxzwbo/UqEEkRGk3Rrc3otawj627 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="333230778"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="333230778"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 19:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="566987110"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 12 May 2022 19:43:26 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npLH3-000LCz-Bl;
 Fri, 13 May 2022 02:43:25 +0000
Date: Fri, 13 May 2022 10:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: yf.wang@mediatek.com, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Georgi Djakov <quic_c_gdjako@quicinc.com>, Sven Peter <sven@svenpeter.dev>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Cc: kbuild-all@lists.01.org, wsd_upstream@mediatek.com,
 Libo Kang <Libo.Kang@mediatek.com>, Yong Wu <Yong.Wu@mediatek.com>,
 Ning Li <ning.li@mediatek.com>
Subject: Re: [PATCH v3 1/2] iommu/io-pgtable-arm-v7s: Add a quirk to allow
 pgtable PA up to 35bit
Message-ID: <202205131021.3GskEbg2-lkp@intel.com>
References: <20220512144557.18025-2-yf.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512144557.18025-2-yf.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_194332_884887_E1ED8B6F 
X-CRM114-Status: GOOD (  13.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on arm-perf/for-next/perf]
[also build test WARNING on linus/master v5.18-rc6]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/yf-wang-mediatek-com/iommu-io-pgtable-arm-v7s-Add-a-quirk-to-allow-pgtable-PA-up-to-35bit/20220512-234603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
config: arm-qcom_defconfig (https://download.01.org/0day-ci/archive/20220513/202205131021.3GskEbg2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/916a5fc41cbb8ddfe343193598f250d06b09e3fa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review yf-wang-mediatek-com/iommu-io-pgtable-arm-v7s-Add-a-quirk-to-allow-pgtable-PA-up-to-35bit/20220512-234603
        git checkout 916a5fc41cbb8ddfe343193598f250d06b09e3fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/iommu/io-pgtable-arm-v7s.c:25:
   drivers/iommu/io-pgtable-arm-v7s.c: In function 'arm_v7s_alloc_pgtable':
   include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-arm-v7s.c:154:46: note: in expansion of macro 'GENMASK'
     154 |         ((ttbr & ((u32)(~0U << 3))) | ((pa & GENMASK(34, 32)) >> 32))
         |                                              ^~~~~~~
   drivers/iommu/io-pgtable-arm-v7s.c:886:25: note: in expansion of macro 'ARM_V7S_TTBR_35BIT_PA'
     886 |                         ARM_V7S_TTBR_35BIT_PA(cfg->arm_v7s_cfg.ttbr, paddr);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-arm-v7s.c:154:46: note: in expansion of macro 'GENMASK'
     154 |         ((ttbr & ((u32)(~0U << 3))) | ((pa & GENMASK(34, 32)) >> 32))
         |                                              ^~~~~~~
   drivers/iommu/io-pgtable-arm-v7s.c:886:25: note: in expansion of macro 'ARM_V7S_TTBR_35BIT_PA'
     886 |                         ARM_V7S_TTBR_35BIT_PA(cfg->arm_v7s_cfg.ttbr, paddr);
         |                         ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/io-pgtable-arm-v7s.c:154:63: warning: right shift count >= width of type [-Wshift-count-overflow]
     154 |         ((ttbr & ((u32)(~0U << 3))) | ((pa & GENMASK(34, 32)) >> 32))
         |                                                               ^~
   drivers/iommu/io-pgtable-arm-v7s.c:886:25: note: in expansion of macro 'ARM_V7S_TTBR_35BIT_PA'
     886 |                         ARM_V7S_TTBR_35BIT_PA(cfg->arm_v7s_cfg.ttbr, paddr);
         |                         ^~~~~~~~~~~~~~~~~~~~~


vim +154 drivers/iommu/io-pgtable-arm-v7s.c

   145	
   146	#define ARM_V7S_TTBR_S			BIT(1)
   147	#define ARM_V7S_TTBR_NOS		BIT(5)
   148	#define ARM_V7S_TTBR_ORGN_ATTR(attr)	(((attr) & 0x3) << 3)
   149	#define ARM_V7S_TTBR_IRGN_ATTR(attr)					\
   150		((((attr) & 0x1) << 6) | (((attr) & 0x2) >> 1))
   151	
   152	/* Mediatek extend ttbr bits[2:0] for PA bits[34:32] */
   153	#define ARM_V7S_TTBR_35BIT_PA(ttbr, pa)					\
 > 154		((ttbr & ((u32)(~0U << 3))) | ((pa & GENMASK(34, 32)) >> 32))
   155	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
