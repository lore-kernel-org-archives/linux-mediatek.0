Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6706EC77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 05:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bd1OqNxrY+Wc7yTjEuF/vCnYa/8bCtAXbutPvq/tlVg=; b=KnSs3ZZoiXvJVfucluaiOBZ7zv
	ZpBvwg16nMF8Lp5Zqt9kAGWwgu61mO636ufyFJ3+xpNtDQDJZTctBzcNFJEifJNx01hg3O64q7Qqx
	CjCVpZ7LRSllLld39Q8IAZtZWkdu9a7yJJV/pzntg7KqLD61LTVpeMh0BJZA8ve8H0bss7XOd5Mxh
	wZeub1yNIiXw68GlOL25aixmoVSxPhsTuWOXhdDglPh+5bjfgDr6Fdy2MCV4ZJxVHeuPV1ThP8uIj
	Ad3gFE6R1H2w1iDsUdILdG53MepeQ7A2xYtbeUVh8o2h5nAkxwatZfsQBDTszzQWkglmHtkg7+3yw
	iB5YyUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptLsV-00FHct-13;
	Mon, 01 May 2023 05:15:11 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptLsS-00FHc7-04;
	Mon, 01 May 2023 05:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682918108; x=1714454108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ux9Ts+3V9zBCVDNMcJUyurtBq8zr7ey0DE6a6V0SDgM=;
  b=YrJeOalhYmcnedJnYlHRHXoxNlptURfpqIFhzYLE2ou7yUUA0H+GLl1h
   nb6XDxineQGk136OYM6McCcbl6DCMhzfRG97l315r3katATc+qBhqaork
   rBqNZpx5zSShyr21sIK+UHmsLUMjZ1+NuKaedg2XKAOEbTyqvj/TzJU69
   AfEu9jBJI/EPzR7FKWHtCz5wJq5hMvFjWolyyKC/Z2KexMfn5cSYNfguL
   qpVPs94Mde50F02fZC2x5N6JXOLDVl32ejZ35r8xQeIfUlrvMBpkrZoxt
   IvojH7c28b5vWtqJ6dAg6vhgDKKkOSli8K4aZKgOyDKfa3GySXCqzoO4O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="376132469"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="376132469"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 22:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="765181857"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="765181857"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2023 22:14:58 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptLsH-0000JV-23;
	Mon, 01 May 2023 05:14:57 +0000
Date: Mon, 1 May 2023 13:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
	kishon@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] phy: mediatek: rework the floating point comparisons to
 fixed point
Message-ID: <202305011302.fwiJuq8v-lkp@intel.com>
References: <20230501025716.2905609-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501025716.2905609-1-trix@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_221508_108650_3AFEC62E 
X-CRM114-Status: GOOD (  15.94  )
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

Hi Tom,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230428]
[cannot apply to linus/master pza/reset/next pza/imx-drm/next mbgg-mediatek/for-next v6.3 v6.3-rc7 v6.3-rc6 v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Rix/phy-mediatek-rework-the-floating-point-comparisons-to-fixed-point/20230501-110044
base:   next-20230428
patch link:    https://lore.kernel.org/r/20230501025716.2905609-1-trix%40redhat.com
patch subject: [PATCH] phy: mediatek: rework the floating point comparisons to fixed point
config: arm64-randconfig-r026-20230430 (https://download.01.org/0day-ci/archive/20230501/202305011302.fwiJuq8v-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7a707b74a3a3ce9d018ee340e478e5c75301c894
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tom-Rix/phy-mediatek-rework-the-floating-point-comparisons-to-fixed-point/20230501-110044
        git checkout 7a707b74a3a3ce9d018ee340e478e5c75301c894
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/phy/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011302.fwiJuq8v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           if (ret)
               ^~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the variable 'ret' to silence this warning
           int i, ret;
                     ^
                      = 0
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:331:32: warning: result of comparison of constant 74175000000 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           } else if ((pixel_clk * 1000) >= 74175 * MEGA && pixel_clk <= 300 * MEGA) {
                      ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:336:58: warning: result of comparison of constant 74175000000 with expression of type 'u32' (aka 'unsigned int') is always true [-Wtautological-constant-out-of-range-compare]
           } else if (pixel_clk >= 27 * MEGA && (pixel_clk * 1000) < 74175 * MEGA) {
                                                ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   3 warnings generated.


vim +331 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c

   303	
   304	static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
   305	{
   306		struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
   307		void __iomem *regs = hdmi_phy->regs;
   308		u8 data_channel_bias, clk_channel_bias;
   309		u8 impedance, impedance_en;
   310		u32 tmds_clk;
   311		u32 pixel_clk = hdmi_phy->pll_rate;
   312	
   313		tmds_clk = pixel_clk;
   314	
   315		/* bias & impedance setting:
   316		 * 3G < data rate <= 6G: enable impedance 100ohm,
   317		 *      data channel bias 24mA, clock channel bias 20mA
   318		 * pixel clk >= HD,  74.175MHZ <= pixel clk <= 300MHZ:
   319		 *      enalbe impedance 100ohm
   320		 *      data channel 20mA, clock channel 16mA
   321		 * 27M =< pixel clk < 74.175: disable impedance
   322		 *      data channel & clock channel bias 10mA
   323		 */
   324	
   325		/* 3G < data rate <= 6G, 300M < tmds rate <= 594M */
   326		if (tmds_clk > 300 * MEGA && tmds_clk <= 594 * MEGA) {
   327			data_channel_bias = 0x3c; /* 24mA */
   328			clk_channel_bias = 0x34; /* 20mA */
   329			impedance_en = 0xf;
   330			impedance = 0x36; /* 100ohm */
 > 331		} else if ((pixel_clk * 1000) >= 74175 * MEGA && pixel_clk <= 300 * MEGA) {
   332			data_channel_bias = 0x34; /* 20mA */
   333			clk_channel_bias = 0x2c; /* 16mA */
   334			impedance_en = 0xf;
   335			impedance = 0x36; /* 100ohm */
 > 336		} else if (pixel_clk >= 27 * MEGA && (pixel_clk * 1000) < 74175 * MEGA) {
   337			data_channel_bias = 0x14; /* 10mA */
   338			clk_channel_bias = 0x14; /* 10mA */
   339			impedance_en = 0x0;
   340			impedance = 0x0;
   341		} else {
   342			return -EINVAL;
   343		}
   344	
   345		/* bias */
   346		mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D0, data_channel_bias);
   347		mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D1, data_channel_bias);
   348		mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D2, data_channel_bias);
   349		mtk_phy_update_field(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_IBIAS_CLK, clk_channel_bias);
   350	
   351		/* impedance */
   352		mtk_phy_update_field(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_IMP_EN, impedance_en);
   353		mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D0_EN1, impedance);
   354		mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D1_EN1, impedance);
   355		mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D2_EN1, impedance);
   356		mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_CLK_EN1, impedance);
   357	
   358		return 0;
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

