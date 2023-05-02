Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AB4C77B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYLfa8wY9waR/VkVBVCgWUDtIiZliI2aHJRM481JfLs=; b=gDAtc/SNvRuNU6FLFXDtUmLJ/V
	x0hWpIb+jTAwGi7WSORpCVBjjmootNwmIJw+MFr3dK2EdfCtF5yVAZqS1qYGGHQEReibyTXb5XQ+f
	zrFnkUX81pklXAXvRRPevuPFsSwHYMx7bK3mVAAsbZ15appkr8mUcMH3+d4xq9g3RlC2Y/7NNa+lS
	jo6GjuKya6rvB0wIGIeacO9Fm1zkOmpeA//Z3+qMipgjzPxe1xtRqJ8A6Bki7annJHHpTw2dztVcb
	cKf2A4RhDNy2Cf/qdmqXbK7lP0LjL0x4ClAooF+cT+ro2WoRml/8Yt93l+GuwwFRhG7fQUeVZxi1r
	hy/6QgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pttSd-002BmS-0m;
	Tue, 02 May 2023 17:06:43 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pttSa-002Bkx-0N;
	Tue, 02 May 2023 17:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683047200; x=1714583200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fEYMsK1Iiuu4vvTM0awEdj78uMJDPmIYBFIrEeHP8uI=;
  b=V7fWUZKsEXvmwvlmCHbwxlJp3uFyV/8i34OsX+gew4fuetp55TjGugL6
   H8Tih4Hp92cVFqz730ru4dlP5fwIyRpWCwj+sq8VEpKDylA4MXcMXnKnl
   fRFtx5+/1ZQNQbeBYARI+zraH+d5FNsNZXs2wkvDTE71MU7pNQB7OXh3j
   zmxD9UIa6ttpiLAtNuuXsKZwwWUk9FN7Qa51kSlDxlgxa5//RjWIHsiwJ
   QiPx0yxmI3P1fdzKCWs/PgVZ/ekZWDAIqjr0jCqTPU0SMfyJCyESQm0Tv
   VpBJpLtXdd9VQDEjiWRHFKzMHvPo9C4vqxNYc+1IyXONEKHBMJ+MT8tz9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="345936013"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="345936013"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 10:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="729000952"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="729000952"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 May 2023 10:06:30 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pttSQ-0001BM-2i;
	Tue, 02 May 2023 17:06:30 +0000
Date: Wed, 3 May 2023 01:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 06/11] drm/mediatek: gamma: Use bitfield macros
Message-ID: <202305030043.iaNtiOtW-lkp@intel.com>
References: <20230502081650.25947-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502081650.25947-7-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_100640_242986_A8D48ED8 
X-CRM114-Status: GOOD (  17.73  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230502-161758
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230502081650.25947-7-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 06/11] drm/mediatek: gamma: Use bitfield macros
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230503/202305030043.iaNtiOtW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/171ab0605a0c2b44167dc1339b29dc80c2ac7d4d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230502-161758
        git checkout 171ab0605a0c2b44167dc1339b29dc80c2ac7d4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305030043.iaNtiOtW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_gamma.c: In function 'mtk_gamma_set_common':
>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:111:32: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     111 |                         word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
         |                                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +111 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

    77	
    78	void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
    79	{
    80		struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
    81		unsigned int i;
    82		struct drm_color_lut *lut;
    83		void __iomem *lut_base;
    84		bool lut_diff;
    85		u16 lut_size;
    86		u32 cfg_val, word;
    87	
    88		/* If there's no gamma lut there's nothing to do here. */
    89		if (!state->gamma_lut)
    90			return;
    91	
    92		if (gamma && gamma->data) {
    93			lut_diff = gamma->data->lut_diff;
    94			lut_size = gamma->data->lut_size;
    95		} else {
    96			lut_diff = false;
    97			lut_size = LUT_SIZE_DEFAULT;
    98		}
    99	
   100		cfg_val = readl(regs + DISP_GAMMA_CFG);
   101		lut_base = regs + DISP_GAMMA_LUT;
   102		lut = (struct drm_color_lut *)state->gamma_lut->data;
   103		for (i = 0; i < lut_size; i++) {
   104			struct drm_color_lut diff, hwlut;
   105	
   106			hwlut.red = drm_color_lut_extract(lut[i].red, LUT_BITS_DEFAULT);
   107			hwlut.green = drm_color_lut_extract(lut[i].green, LUT_BITS_DEFAULT);
   108			hwlut.red = drm_color_lut_extract(lut[i].blue, LUT_BITS_DEFAULT);
   109	
   110			if (!lut_diff || (i % 2 == 0)) {
 > 111				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
   112				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
   113				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
   114			} else {
   115				diff.red = lut[i].red - lut[i - 1].red;
   116				diff.red = drm_color_lut_extract(diff.red, LUT_BITS_DEFAULT);
   117	
   118				diff.green = lut[i].green - lut[i - 1].green;
   119				diff.green = drm_color_lut_extract(diff.green, LUT_BITS_DEFAULT);
   120	
   121				diff.blue = lut[i].blue - lut[i - 1].blue;
   122				diff.blue = drm_color_lut_extract(diff.blue, LUT_BITS_DEFAULT);
   123	
   124				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
   125				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
   126				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
   127			}
   128			writel(word, (lut_base + i * 4));
   129		}
   130	
   131		/* Enable the gamma table */
   132		cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
   133	
   134		writel(cfg_val, regs + DISP_GAMMA_CFG);
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

