Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01749C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 01:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJ285EJZkFQ3VH1v4+K2U8dxWVR8sy8E7VJ8AUc4p7M=; b=kGKPoQrPJ+/uvhFc/govdpBV1P
	GfXBc7pBMSlwj4rvPkRpFx/tLCxPOXjtLtqAKMRgbdGjF/vt+SiL0TdxZsmVRFpQ2DfOxJNMjyBDD
	OevsgENRdPsvrcVzxyFHp4bHnBXwuV2gzEyqROa3BvumNwqA4pQ/QPSNuEFKU2PLAjH/RPw5NUyC7
	YWocBw60qbKsWAxpFWWKsf5Q4N9NvI1MH+9K7QFmKrg+2fM89QarfqOqGYcw8YbqEBEoI5gOCCHp4
	VsbR5zsJpdYaGAhHtzKWWWUyv3JwIn6zVBKx1uvKjd1fWxEhOnDe10zxGZzD7fMkkoVvarehuORyG
	PjZwQQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXYD-00112Q-LS; Fri, 23 Sep 2022 01:32:21 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXIM-000wYq-SX; Fri, 23 Sep 2022 01:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663895758; x=1695431758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CvKvMtolEyCI8+WxsUgfsfdHD6KxACdHivq41STFQOA=;
  b=UtMkz+VDSB54GSZO1v/eLN9ObWkPvdB17LnM1qfprqq6JaNm4y5E9Obe
   JvJeiCqg+JJEFgiuQrysA8LHcwPGqHol2J7WWJUXeOq55Fj6Hjg6R03Yw
   W9Z1NrgsA1VS4B0rInMS97Pr/YWWyjrlYdL/gvxHDSh/jpa+0zWj2CAv8
   E+BOG4JbbIGSXOU2iDCBehrfu4Wv7TpY+2xok25dxxjabdahirPwr5fDG
   VhsWxdC9WvcVHhwQoLlx7V+KjEeLev7x5oSEuNCaMvoSLoGmDLibxWdle
   gTvx3s1q/ak70PfJgMD89ALhMtdBdeSCfb5aW3P7O94INcKC46dp3mrz5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="300465245"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="300465245"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 18:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="709121640"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2022 18:15:50 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obXID-00059I-1X;
	Fri, 23 Sep 2022 01:15:49 +0000
Date: Fri, 23 Sep 2022 09:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, sboyd@kernel.org,
	mturquette@baylibre.com, matthias.bgg@gmail.com,
	p.zabel@pengutronix.de
Cc: kbuild-all@lists.01.org, runyang.chen@mediatek.com,
	miles.chen@mediatek.com, wenst@chromium.org,
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH] reset: mediatek: Move mediatek system clock reset to
 reset folder
Message-ID: <202209230958.2rV4kEVM-lkp@intel.com>
References: <20220922141107.10203-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922141107.10203-1-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_181559_025786_FDA7D0CE 
X-CRM114-Status: GOOD (  15.12  )
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

Hi Bo-Chen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v6.0-rc6]
[also build test ERROR on linus/master]
[cannot apply to clk/clk-next pza/reset/next mbgg-mediatek/for-next next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Chen-Chen/reset-mediatek-Move-mediatek-system-clock-reset-to-reset-folder/20220922-221303
base:    521a547ced6477c54b4b0cc206000406c221b4d6
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220923/202209230958.2rV4kEVM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/69ce72445492a02115b1e7c7527a8a107f48aab8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bo-Chen-Chen/reset-mediatek-Move-mediatek-system-clock-reset-to-reset-folder/20220922-221303
        git checkout 69ce72445492a02115b1e7c7527a8a107f48aab8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/auxiliary_bus.h:11,
                    from drivers/reset/reset-mediatek-sysclk.c:6:
>> drivers/reset/reset-mediatek-sysclk.c:499:32: error: 'mtk_reset_ids' undeclared here (not in a function); did you mean 'mtk_reset_ops'?
     499 | MODULE_DEVICE_TABLE(auxiliary, mtk_reset_ids);
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> drivers/reset/reset-mediatek-sysclk.c:539:5: warning: no previous prototype for 'mtk_reset_init_with_node' [-Wmissing-prototypes]
     539 | int mtk_reset_init_with_node(struct device_node *np, const char *name)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/reset/reset-mediatek-sysclk.c:550:6: warning: no previous prototype for 'mtk_rst_remove_with_node' [-Wmissing-prototypes]
     550 | void mtk_rst_remove_with_node(struct device_node *np, const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:244:21: error: '__mod_auxiliary__mtk_reset_ids_device_table' aliased to undefined symbol 'mtk_reset_ids'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/reset/reset-mediatek-sysclk.c:499:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     499 | MODULE_DEVICE_TABLE(auxiliary, mtk_reset_ids);
         | ^~~~~~~~~~~~~~~~~~~


vim +499 drivers/reset/reset-mediatek-sysclk.c

   402	
   403	static struct auxiliary_device_id mtk_sysclk_reset_ids[] = {
   404		{
   405			.name = "clk_mt2701_eth.mt2701-eth-rst",
   406			.driver_data = MTK_RST_ID_MT2701_ETH,
   407		},
   408		{
   409			.name = "clk_mt2701_g3d.mt2701-g3d-rst",
   410			.driver_data = MTK_RST_ID_MT2701_G3D,
   411		},
   412		{
   413			.name = "clk_mt2701_hif.mt2701-hif-rst",
   414			.driver_data = MTK_RST_ID_MT2701_HIF,
   415		},
   416		{
   417			.name = "clk_mt2701.mt2701-infrasys-rst",
   418			.driver_data = MTK_RST_ID_MT2701_INFRASYS,
   419		},
   420		{
   421			.name = "clk_mt2701.mt2701-pericfg-rst",
   422			.driver_data = MTK_RST_ID_MT2701_PERICFG,
   423		},
   424		{
   425			.name = "clk_mt2712.mt2712-infra-rst",
   426			.driver_data = MTK_RST_ID_MT2712_INFRA,
   427		},
   428		{
   429			.name = "clk_mt2712.mt2712-peri-rst",
   430			.driver_data = MTK_RST_ID_MT2712_PERI,
   431		},
   432		{
   433			.name = "clk_mt7622_eth.mt7622-eth-rst",
   434			.driver_data = MTK_RST_ID_MT7622_ETH,
   435		},
   436		{
   437			.name = "clk_mt7622_hif.mt7622-usb-rst",
   438			.driver_data = MTK_RST_ID_MT7622_SSUSBSYS,
   439		},
   440		{
   441			.name = "clk_mt7622_hif.mt7622-pcie-rst",
   442			.driver_data = MTK_RST_ID_MT7622_PCIESYS,
   443		},
   444		{
   445			.name = "clk_mt7622.mt7622-infrasys-rst",
   446			.driver_data = MTK_RST_ID_MT7622_INFRASYS,
   447		},
   448		{
   449			.name = "clk_mt7622.mt7622-pericfg-rst",
   450			.driver_data = MTK_RST_ID_MT7622_PERICFG,
   451		},
   452		{
   453			.name = "clk_mt7629_eth.mt7629-ethsys-rst",
   454			.driver_data = MTK_RST_ID_MT7629_ETHSYS,
   455		},
   456		{
   457			.name = "clk_mt7629_hif.mt7629-usb-rst",
   458			.driver_data = MTK_RST_ID_MT7629_SSUSBSYS,
   459		},
   460		{
   461			.name = "clk_mt7629_hif.mt7629-pcie-rst",
   462			.driver_data = MTK_RST_ID_MT7629_PCIESYS,
   463		},
   464		{
   465			.name = "clk_mt8135.mt8135-infrasys-rst",
   466			.driver_data = MTK_RST_ID_MT8135_INFRASYS,
   467		},
   468		{
   469			.name = "clk_mt8135.mt8135-pericfg-rst",
   470			.driver_data = MTK_RST_ID_MT8135_PERICFG,
   471		},
   472		{
   473			.name = "clk_mt8173.mt8173-infracfg-rst",
   474			.driver_data = MTK_RST_ID_MT8173_INFRACFG,
   475		},
   476		{
   477			.name = "clk_mt8173.mt8173-pericfg-rst",
   478			.driver_data = MTK_RST_ID_MT8173_PERICFG,
   479		},
   480		{
   481			.name = "clk_mt8183.mt8183-infra-rst",
   482			.driver_data = MTK_RST_ID_MT8183_INFRA,
   483		},
   484		{
   485			.name = "clk_mtk.mt8186-infra-ao-rst",
   486			.driver_data = MTK_RST_ID_MT8186_INFRA_AO,
   487		},
   488		{
   489			.name = "clk_mt8192.mt8192-infra-rst",
   490			.driver_data = MTK_RST_ID_MT8192_INFRA,
   491		},
   492		{
   493			.name = "clk_mtk.mt8195-infra-ao-rst",
   494			.driver_data = MTK_RST_ID_MT8195_INFRA_AO,
   495		},
   496		{
   497		},
   498	};
 > 499	MODULE_DEVICE_TABLE(auxiliary, mtk_reset_ids);
   500	
   501	/* reset data */
   502	static struct mtk_clk_rst_data clk_rst_data[] = {
   503		[MTK_RST_ID_MT2701_ETH]		= { .desc = &mt2701_eth_rst_desc, },
   504		[MTK_RST_ID_MT2701_G3D]		= { .desc = &mt2701_g3d_clk_rst_desc, },
   505		[MTK_RST_ID_MT2701_HIF]		= { .desc = &mt2701_eth_rst_desc, },
   506		[MTK_RST_ID_MT2701_INFRASYS]	= { .desc = &mt2701_infrasys_clk_rst_desc, },
   507		[MTK_RST_ID_MT2701_PERICFG]	= { .desc = &mt2701_pericfg_clk_rst_desc, },
   508		[MTK_RST_ID_MT2712_INFRA]	= { .desc = &mt2701_infrasys_clk_rst_desc, },
   509		[MTK_RST_ID_MT2712_PERI]	= { .desc = &mt2701_pericfg_clk_rst_desc, },
   510		[MTK_RST_ID_MT7622_ETH]		= { .desc = &mt2701_eth_rst_desc, },
   511		[MTK_RST_ID_MT7622_SSUSBSYS]	= { .desc = &mt2701_eth_rst_desc, },
   512		[MTK_RST_ID_MT7622_PCIESYS]	= { .desc = &mt2701_eth_rst_desc, },
   513		[MTK_RST_ID_MT7622_INFRASYS]	= { .desc = &mt7622_infrasys_clk_rst_desc, },
   514		[MTK_RST_ID_MT7622_PERICFG]	= { .desc = &mt2701_pericfg_clk_rst_desc, },
   515		[MTK_RST_ID_MT7629_ETHSYS]	= { .desc = &mt2701_eth_rst_desc, },
   516		[MTK_RST_ID_MT7629_SSUSBSYS]	= { .desc = &mt2701_eth_rst_desc, },
   517		[MTK_RST_ID_MT7629_PCIESYS]	= { .desc = &mt2701_eth_rst_desc, },
   518		[MTK_RST_ID_MT8135_INFRASYS]	= { .desc = &mt2701_infrasys_clk_rst_desc, },
   519		[MTK_RST_ID_MT8135_PERICFG]	= { .desc = &mt2701_pericfg_clk_rst_desc, },
   520		[MTK_RST_ID_MT8173_INFRACFG]	= { .desc = &mt2701_infrasys_clk_rst_desc, },
   521		[MTK_RST_ID_MT8173_PERICFG]	= { .desc = &mt2701_pericfg_clk_rst_desc, },
   522		[MTK_RST_ID_MT8183_INFRA]	= { .desc = &mt8183_rst_desc, },
   523		[MTK_RST_ID_MT8186_INFRA_AO]	= { .desc = &mt8186_rst_desc, },
   524		[MTK_RST_ID_MT8192_INFRA]	= { .desc = &mt8192_rst_desc, },
   525		[MTK_RST_ID_MT8195_INFRA_AO]	= { .desc = &mt8195_rst_desc, },
   526		{},
   527	};
   528	
   529	static struct mtk_clk_rst_data *find_rst_data(const char *name)
   530	{
   531		int i;
   532	
   533		for (i = 0; i < ARRAY_SIZE(mtk_sysclk_reset_ids); i++)
   534			if (mtk_sysclk_reset_ids[i].name == name)
   535				return &clk_rst_data[mtk_sysclk_reset_ids[i].driver_data];
   536		return NULL;
   537	}
   538	
 > 539	int mtk_reset_init_with_node(struct device_node *np, const char *name)
   540	{
   541		struct mtk_clk_rst_data *data = find_rst_data(name);
   542	
   543		if (!np || !data)
   544			return -EINVAL;
   545	
   546		return register_rst_ctrl_with_node(np, data);
   547	}
   548	EXPORT_SYMBOL_GPL(mtk_reset_init_with_node);
   549	
 > 550	void mtk_rst_remove_with_node(struct device_node *np, const char *name)
   551	{
   552		struct mtk_clk_rst_data *data = find_rst_data(name);
   553	
   554		if (!np || !data)
   555			return;
   556	
   557		reset_controller_unregister(&data->rcdev);
   558	}
   559	EXPORT_SYMBOL_GPL(mtk_rst_remove_with_node);
   560	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

