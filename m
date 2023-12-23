Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4385AC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Dec 2023 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZ0YrmCHn1unBBHTzUHWtqBD/LKotEbKtR8Lnn7RF0c=; b=nc8pc8pC4RuU1rpjQHVoD5VvJu
	FzIE3KGiVyfOZm+r+TVVeyM5neCvtwbSi7Y8UNcEsf8Eux+4yAxS/Mp1y6tSc2SGKUnL/dTSTj/Dd
	2a9NLaPk3tbwTBZQKwQOVHN42xPb9BTjUfdbajnuOspyxHbtWBsnfaMAqovU6iikoFiJtLn3l6ChM
	ZxN8RP1o+Q02bsnBroGiuJOp+YbKJxVyO2jkbq3sZjkB+3bC/70kJP44MO9y4r5Y6qLj+CPFAM76B
	ildMXiyvuwz/tv5+IxuSzN603SLr4+d6bGmuGq3XsPjtLNUm4ri5nlHJB3Bn5vUhAno0Lw+1B+ASm
	sV6phHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGwZY-007WIA-2F;
	Sat, 23 Dec 2023 07:37:24 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGwZV-007WHA-1b;
	Sat, 23 Dec 2023 07:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703317041; x=1734853041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a2m4tM/yHyh0WQQ5DyOfXe4Sy7woCWkTH+cVcUpAHIY=;
  b=chQyZ9LBoJaIO7Um0Xj8SDGz76uaVmYCxIqpPKUdp5kSlzBtZG9/9sds
   RKyPjb/Jr3ooFc1EarCLoJ3b35UwBnlE7vbJkOXVjjnviibTAr2+3HlPy
   jEKSDhF0s5ljwKP/NCFO8SNUWtNzWLCXBc0lNCPkTtR9K+N8FL7C6uhfp
   WA3CNyqEvJSANyMq0uAJRX45hUPQ4/SgY/FPuFgwE1VqsjWSqtmDfaaK+
   FrnkxhNKuDP/FQz9ZSOo/uEthvvqUBDpvtbdfSz3NTm2yirKzl8FE3u4O
   IzQsXWiesr+hwvK6xf98yPAvwVH3yRKFJfl0dVrB3t3PT4zsN53SC1+0D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="3027972"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="3027972"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 23:37:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="1108711237"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="1108711237"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Dec 2023 23:37:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGwZJ-000AQV-2N;
	Sat, 23 Dec 2023 07:37:09 +0000
Date: Sat, 23 Dec 2023 15:36:37 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 3/4] drm/mediatek: dsi: Use bitfield macros where
 useful
Message-ID: <202312231512.ioiD48LA-lkp@intel.com>
References: <20231220135722.192080-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220135722.192080-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_233721_573339_8435D351 
X-CRM114-Status: GOOD (  12.21  )
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
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc6 next-20231222]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/drm-mediatek-dsi-Use-GENMASK-for-register-mask-definitions/20231222-164513
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231220135722.192080-4-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 3/4] drm/mediatek: dsi: Use bitfield macros where useful
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231223/202312231512.ioiD48LA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312231512.ioiD48LA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312231512.ioiD48LA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dsi.c: In function 'mtk_dsi_phy_timconfig':
>> drivers/gpu/drm/mediatek/mtk_dsi.c:260:19: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     260 |         timcon0 = FIELD_PREP(LPX, timing->lpx) |
         |                   ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +260 drivers/gpu/drm/mediatek/mtk_dsi.c

   236	
   237	static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
   238	{
   239		u32 timcon0, timcon1, timcon2, timcon3;
   240		u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, 1000000);
   241		struct mtk_phy_timing *timing = &dsi->phy_timing;
   242	
   243		timing->lpx = (60 * data_rate_mhz / (8 * 1000)) + 1;
   244		timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
   245		timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
   246				     timing->da_hs_prepare;
   247		timing->da_hs_trail = timing->da_hs_prepare + 1;
   248	
   249		timing->ta_go = 4 * timing->lpx - 2;
   250		timing->ta_sure = timing->lpx + 2;
   251		timing->ta_get = 4 * timing->lpx;
   252		timing->da_hs_exit = 2 * timing->lpx + 1;
   253	
   254		timing->clk_hs_prepare = 70 * data_rate_mhz / (8 * 1000);
   255		timing->clk_hs_post = timing->clk_hs_prepare + 8;
   256		timing->clk_hs_trail = timing->clk_hs_prepare;
   257		timing->clk_hs_zero = timing->clk_hs_trail * 4;
   258		timing->clk_hs_exit = 2 * timing->clk_hs_trail;
   259	
 > 260		timcon0 = FIELD_PREP(LPX, timing->lpx) |
   261			  FIELD_PREP(HS_PREP, timing->da_hs_prepare) |
   262			  FIELD_PREP(HS_ZERO, timing->da_hs_zero) |
   263			  FIELD_PREP(HS_TRAIL, timing->da_hs_trail);
   264	
   265		timcon1 = FIELD_PREP(TA_GO, timing->ta_go) |
   266			  FIELD_PREP(TA_SURE, timing->ta_sure) |
   267			  FIELD_PREP(TA_GET, timing->ta_get) |
   268			  FIELD_PREP(DA_HS_EXIT, timing->da_hs_exit);
   269	
   270		timcon2 = FIELD_PREP(DA_HS_SYNC, 1) |
   271			  FIELD_PREP(CLK_ZERO, timing->clk_hs_zero) |
   272			  FIELD_PREP(CLK_TRAIL, timing->clk_hs_trail);
   273	
   274		timcon3 = FIELD_PREP(CLK_HS_PREP, timing->clk_hs_prepare) |
   275			  FIELD_PREP(CLK_HS_POST, timing->clk_hs_post) |
   276			  FIELD_PREP(CLK_HS_EXIT, timing->clk_hs_exit);
   277	
   278		writel(timcon0, dsi->regs + DSI_PHY_TIMECON0);
   279		writel(timcon1, dsi->regs + DSI_PHY_TIMECON1);
   280		writel(timcon2, dsi->regs + DSI_PHY_TIMECON2);
   281		writel(timcon3, dsi->regs + DSI_PHY_TIMECON3);
   282	}
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

