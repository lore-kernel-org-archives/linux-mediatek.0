Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F227C77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lj103Xxe2AURiJwAKtLoH7vXW9C4EN3UL+aV5FuO/ss=; b=I254j86UX9A+RIdM05ERSgCy/W
	dY9aOLW9RkjpBjOzilGC/X/W8tdzBJc7e99296Sg372N++RgxRV2P02dKjCo5PXRTNCv/MvsDFbSx
	5e4UHB6FPdq2hvQr/SjeCjjnl9hM8wm5YIXyfZw5wY54LV0L1oNkTyptwUnPyr1RYMBdR2oidA8H5
	22CKOYoUkfHcsY3QwEw5UO9wEolH96TgdoHFrr1R3BS38W4dw6fTEzs9yOkqx4me6OyoQKLUj14bv
	jYNsoeVRRm8EUOYNsi/AvJemh1vKuc9IAuKowUQ0erpjOrzPV4JxXnHnIpEueTiBqpVk0ppgtLBWk
	IT5LdyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psUXO-00Bilr-2U;
	Fri, 28 Apr 2023 20:17:50 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psUXK-00BilG-1u;
	Fri, 28 Apr 2023 20:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682713066; x=1714249066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yDRDS5djblnagCc1RW+ZqryqFHXn3yoxu+/t6ww9oCY=;
  b=c2rXiPK/eNwDsRck9fRuSApxaVD/Q8qYlmOJ8x+/vpqR4a8T3OiMh2+O
   9CHzgKajieZ7xBPXXP1M/VTlfDjC4MPJlXRTj3RjPSGz+Orvq9WB4qoKd
   dzD7hfeACSDfQecpjgcMVwYTf5xMXkTJPdH9UAiYbawGUKV5LjRM3/1ep
   6eam5kO3Ip7OWZ4vKXJVxZ/Fs90/d6TPPQJRsG6HwWWiMR2yK8AyQdDXC
   rQ0UphZBYAROWN0wpapZcAS8T3AhuZymdqJgXAATOWUaz4qID0J80Gavo
   lwykAUYsYC3zQzPoxmAa1uMJU3p7XBtoskJegiX9mCfKYj6fJw3TadsBq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346618468"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="346618468"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 13:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="838973080"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="838973080"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2023 13:17:43 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psUXG-0000fJ-1W;
	Fri, 28 Apr 2023 20:17:42 +0000
Date: Sat, 29 Apr 2023 04:17:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ziqin Liu <ziqin_l@hust.edu.cn>, dzm91@hust.edu.cn,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, hust-os-kernel-patches@googlegroups.com,
	Ziqin Liu <ziqin_l@hust.edu.cn>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: clk-mt8173: fix memory leak in
 clk_mt8173_apmixed_probe
Message-ID: <202304290405.yLxJEMC4-lkp@intel.com>
References: <20230425132601.106181-1-ziqin_l@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425132601.106181-1-ziqin_l@hust.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_131746_643193_EAF93B25 
X-CRM114-Status: GOOD (  16.16  )
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

Hi Ziqin,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziqin-Liu/clk-mediatek-clk-mt8173-fix-memory-leak-in-clk_mt8173_apmixed_probe/20230425-212917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230425132601.106181-1-ziqin_l%40hust.edu.cn
patch subject: [PATCH] clk: mediatek: clk-mt8173: fix memory leak in clk_mt8173_apmixed_probe
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20230429/202304290405.yLxJEMC4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cb4be4dcd48924984a6d0e3df7809cfc26286032
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ziqin-Liu/clk-mediatek-clk-mt8173-fix-memory-leak-in-clk_mt8173_apmixed_probe/20230425-212917
        git checkout cb4be4dcd48924984a6d0e3df7809cfc26286032
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/clk/mediatek/ drivers/video/fbdev/core/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290405.yLxJEMC4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/mediatek/clk-mt8173-apmixedsys.c: In function 'clk_mt8173_apmixed_probe':
>> drivers/clk/mediatek/clk-mt8173-apmixedsys.c:149:34: error: incompatible type for argument 1 of 'devm_of_iomap'
     149 |         base = devm_of_iomap(pdev->dev, node, 0, NULL);
         |                              ~~~~^~~~~
         |                                  |
         |                                  struct device
   In file included from include/linux/platform_device.h:13,
                    from drivers/clk/mediatek/clk-mt8173-apmixedsys.c:11:
   include/linux/device.h:241:44: note: expected 'struct device *' but argument is of type 'struct device'
     241 | void __iomem *devm_of_iomap(struct device *dev,
         |                             ~~~~~~~~~~~~~~~^~~


vim +/devm_of_iomap +149 drivers/clk/mediatek/clk-mt8173-apmixedsys.c

   139	
   140	static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
   141	{
   142		const u8 *fhctl_node = "mediatek,mt8173-fhctl";
   143		struct device_node *node = pdev->dev.of_node;
   144		struct clk_hw_onecell_data *clk_data;
   145		void __iomem *base;
   146		struct clk_hw *hw;
   147		int r;
   148	
 > 149		base = devm_of_iomap(pdev->dev, node, 0, NULL);
   150		if (!base)
   151			return PTR_ERR(base);
   152	
   153		clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
   154		if (IS_ERR_OR_NULL(clk_data))
   155			return -ENOMEM;
   156	
   157		fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
   158		r = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
   159					    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
   160		if (r)
   161			goto free_clk_data;
   162	
   163		hw = mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base + REGOFF_REF2USB);
   164		if (IS_ERR(hw)) {
   165			r = PTR_ERR(hw);
   166			dev_err(&pdev->dev, "Failed to register ref2usb_tx: %d\n", r);
   167			goto unregister_plls;
   168		}
   169		clk_data->hws[CLK_APMIXED_REF2USB_TX] = hw;
   170	
   171		hw = devm_clk_hw_register_divider(&pdev->dev, "hdmi_ref", "tvdpll_594m", 0,
   172						  base + REGOFF_HDMI_REF, 16, 3,
   173						  CLK_DIVIDER_POWER_OF_TWO, NULL);
   174		clk_data->hws[CLK_APMIXED_HDMI_REF] = hw;
   175	
   176		r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
   177		if (r)
   178			goto unregister_ref2usb;
   179	
   180		return 0;
   181	
   182	unregister_ref2usb:
   183		mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);
   184	unregister_plls:
   185		mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
   186					  ARRAY_SIZE(pllfhs), clk_data);
   187	free_clk_data:
   188		mtk_free_clk_data(clk_data);
   189		return r;
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

