Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1027DCD4851
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdySX/ZAG+QDlmVqBL6ay9H8VC+3eImS5s4YAi/Erhc=; b=wdX9yT8CeQ7jnB7SY10938vrnh
	+aVEmqjWVwqpQiwNR8Jsl6hVO8aiRvcQZ+LPbdEnYJYFoJVFuHflXLyqwxh9QDBRtd7/nRd8R+O8r
	XX4bsVl4i1QQm/QeUJqshiK7LCINmh0VQLuzqUGOT5h5/Z2l7AE3xe0ItDWxV5E2No3cdARNKDyvR
	KhP0Db5VzeVPHQpta4OiVkvKXdOrkq2ARzlIk3YrbrVNJhAqnB5YSeB9+u4MrX8ftA5XdyN1K4fXk
	dg6BjNnI8VNDX0mIdMMSTpXxY6NKN15i4isxe83dPQAjXQAyCPO+1LfXvTEtUp0//kVcJZ88TsSZo
	E/wmsPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWxw-00000005hgz-3Xyz;
	Thu, 14 May 2026 14:23:08 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWxu-00000005hfz-1xOb;
	Thu, 14 May 2026 14:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778768586; x=1810304586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1+cb2sStXOE2OW7LJ8lDA5+VJbnboBqGunLXZmnPBgo=;
  b=HHBcmpSqqjSdIGLnGoe2EB9GajemTWpobs36i0E/MgrPFZbfwu9Ro0yw
   hb7+FVuYDXeqdlRsb5+u0pvabJM7L2whOdrqPvHtCx+CjTS/8LKxoLvcq
   c1L9LNouD1SchgN+/PEnidp20TMs54jGWOP3xKjYU2r2LScLVQFIVxRlF
   jagjyT1T9xof2S6Z/IoQHyLAsd0rxfxf9w8qvHncZxtZ4BZubVTBqrU+H
   vkK4/V+zzF4aocajCfMzPJIHiliVVb3BVqcQxQWAG+C7AR5mSiYtw9HcC
   MHBkFP4hcLc/g7E4EV8AH8zhqi/QmoSiyvqGUkhitJLqUpvrM56anlMbg
   Q==;
X-CSE-ConnectionGUID: eMrLJ1x4SjGUx1brmackWA==
X-CSE-MsgGUID: C3RcO5ftRyC3IQcX0NdP3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79422781"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79422781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:23:04 -0700
X-CSE-ConnectionGUID: MoTmitk+SYGyMdDayYUivQ==
X-CSE-MsgGUID: j2Ra0cpgRtCqNzrKqlrxCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238289913"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2026 07:22:59 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNWxk-000000008or-1YWQ;
	Thu, 14 May 2026 14:22:56 +0000
Date: Thu, 14 May 2026 16:22:22 +0200
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, s-vadapalli@ti.com,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Zhang <18255117159@163.com>
Subject: Re: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link
 training
Message-ID: <202605141646.YYkbS6Hg-lkp@intel.com>
References: <20260506152346.166056-9-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506152346.166056-9-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072306_575849_F081239F 
X-CRM114-Status: GOOD (  10.82  )
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

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on a293ec25d59dd96309058c70df5a4dd0f889a1e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Zhang/PCI-Add-pcie_wait_after_link_train-helper/20260514-132815
base:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
patch link:    https://lore.kernel.org/r/20260506152346.166056-9-18255117159%40163.com
patch subject: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link training
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260514/202605141646.YYkbS6Hg-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141646.YYkbS6Hg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141646.YYkbS6Hg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/pci-thunder-pem.c:16:
   drivers/pci/controller/../pci.h: In function 'pcie_wait_after_link_train':
>> drivers/pci/controller/../pci.h:73:17: error: implicit declaration of function 'msleep' [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^~~~~~
--
   In file included from drivers/pci/controller/dwc/pcie-al.c:14:
   drivers/pci/controller/dwc/../../pci.h: In function 'pcie_wait_after_link_train':
>> drivers/pci/controller/dwc/../../pci.h:73:17: error: implicit declaration of function 'msleep' [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^~~~~~


vim +/msleep +73 drivers/pci/controller/../pci.h

    62	
    63	/**
    64	 * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
    65	 * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
    66	 *
    67	 * Must be called after Link training completes and before the first
    68	 * Configuration Request is sent.
    69	 */
    70	static inline void pcie_wait_after_link_train(int max_link_speed)
    71	{
    72		if (max_link_speed > 2)
  > 73			msleep(PCIE_RESET_CONFIG_WAIT_MS);
    74	}
    75	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

