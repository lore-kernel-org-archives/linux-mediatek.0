Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F342C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 05:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ti9e7B3Ln/waFpmzYFk+X5Vx6isKIvx5aUw/Nr65//E=; b=DIrSZJpSR4CvemWq6Oi6zuk7p3
	OAQ1sAYVg9OrxubU3d1FPrW3x/Fgg+me0FS3fioCGjXUMTtVHvw8ZNTYdjao6HdFsbrnMmplRDauq
	GaSbBeMZFJv5IAwyLs/A8hNfzBK4GmPl0GHe1wF3TzljRJwRH2w9gH3OLXWqnZuuKWSSqy4K6l1ZO
	XxbYzGsmKs1eHQJuv7qLnaa7F9Ch6taA6q0Lz8koV7o6FZspURtdYidMoBHplyp7S7TNXvU+J9M8O
	VAcWJ3gayDc3ld3EBS8cfTQvnG1pQpm8RUm/leFCM1KgjUxySvCY5BURoLzEu8NbwyjNrxO+NWWLh
	VYkSn/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSWEG-001ebf-26;
	Wed, 24 Jan 2024 05:55:16 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSWED-001eZx-0j;
	Wed, 24 Jan 2024 05:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706075713; x=1737611713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=npa1m/eGWO2TJ3lJA4sggzZkOD1geiwAWdqHkEt5kO0=;
  b=CEpObarUq5h6gV+00KSGID6TeXY+MM0szxkjrdrLtbT0iQ+nlqinzmfa
   Ht7xCyxLoukY7xTgFF8I2BcKh7IwwZpHnIHRmupzhk5AtqOqC2lKgpPz9
   bfTkgOwqZP+mVBlte3Nv31FzdC+3udEw9R+eC3Kig4PBX6nWnZB1RyVdj
   uxPCRaCBy5D0YA/1d1DxrE0DJpmAoyFETWo4IhVr5DwDZoG/ZUpyQxqao
   dWGRTN+fAEfH22EUQZiVJgVsATh5YI6kQN3SoMHNegFXqhvAQMn3s4dNs
   Af2vXZ9WSPTIK0gNV3gJWc1udzlRDiQGISeI4Q0TiaLimsnVdfD2srqXc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="466023630"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="466023630"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 21:55:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20610990"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2024 21:54:54 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSWDr-0007ub-37;
	Wed, 24 Jan 2024 05:54:51 +0000
Date: Wed, 24 Jan 2024 13:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ziyang Huang <hzyitc@outlook.com>, mcoquelin.stm32@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alexandre.torgue@foss.st.com, richardcochran@gmail.com,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [PATCH 3/8] net: stmmac: Introduce Qualcomm IPQ50xx DWMAC driver
Message-ID: <202401241342.SL4CiC8m-lkp@intel.com>
References: <TYZPR01MB5556B8833322A83632709631C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB5556B8833322A83632709631C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_215513_351417_691333BC 
X-CRM114-Status: GOOD (  13.09  )
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

Hi Ziyang,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on clk/clk-next pza/reset/next linus/master v6.8-rc1 next-20240123]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziyang-Huang/net-phy-Introduce-Qualcomm-IPQ5018-internal-PHY-driver/20240121-204840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/TYZPR01MB5556B8833322A83632709631C9762%40TYZPR01MB5556.apcprd01.prod.exchangelabs.com
patch subject: [PATCH 3/8] net: stmmac: Introduce Qualcomm IPQ50xx DWMAC driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240124/202401241342.SL4CiC8m-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project a31a60074717fc40887cfe132b77eec93bedd307)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241342.SL4CiC8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241342.SL4CiC8m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-ipq50xx.c:94:13: error: call to undeclared function 'stmmac_probe_config_dt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |         plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
         |                    ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-ipq50xx.c:94:13: note: did you mean 'devm_stmmac_probe_config_dt'?
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h:15:1: note: 'devm_stmmac_probe_config_dt' declared here
      15 | devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
         | ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac-ipq50xx.c:94:11: error: incompatible integer to pointer conversion assigning to 'struct plat_stmmacenet_data *' from 'int' [-Wint-conversion]
      94 |         plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/stmmac_probe_config_dt +94 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq50xx.c

    80	
    81	static int ipq50xx_gmac_probe(struct platform_device *pdev)
    82	{
    83		struct device *dev = &pdev->dev;
    84		struct stmmac_resources stmmac_res;
    85		struct plat_stmmacenet_data *plat_dat;
    86		struct ipq50xx_gmac *gmac;
    87		int ret;
    88	
    89		ret = stmmac_get_platform_resources(pdev, &stmmac_res);
    90		if (ret)
    91			return dev_err_probe(dev, ret,
    92					     "failed to get stmmac platform resources\n");
    93	
  > 94		plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
    95		if (IS_ERR_OR_NULL(plat_dat))
    96			return dev_err_probe(dev, PTR_ERR(plat_dat),
    97					     "failed to parse stmmac dt parameters\n");
    98	
    99		gmac = devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
   100		if (!gmac)
   101			return dev_err_probe(dev, -ENOMEM,
   102					     "failed to allocate priv\n");
   103	
   104		gmac->dev = dev;
   105	
   106		memcpy(gmac->clks, ipq50xx_gmac_clks, sizeof(gmac->clks));
   107		ret = devm_clk_bulk_get_optional(dev, ARRAY_SIZE(gmac->clks), gmac->clks);
   108		if (ret)
   109			return dev_err_probe(dev, ret,
   110					     "failed to acquire clocks\n");
   111	
   112		ret = clk_bulk_prepare_enable(ARRAY_SIZE(gmac->clks), gmac->clks);
   113		if (ret)
   114			return dev_err_probe(dev, ret,
   115					     "failed to enable clocks\n");
   116	
   117		gmac->rst = devm_reset_control_array_get_exclusive(dev);
   118		if (IS_ERR_OR_NULL(gmac->rst))
   119			return dev_err_probe(dev, PTR_ERR(gmac->rst),
   120					     "failed to acquire reset\n");
   121	
   122		ret = reset_control_reset(gmac->rst);
   123		if (ret)
   124			return dev_err_probe(dev, ret,
   125					     "failed to reset\n");
   126	
   127		gmac->uniphy = devm_phy_optional_get(dev, "uniphy");
   128		if (IS_ERR(gmac->uniphy))
   129			return dev_err_probe(dev, PTR_ERR(gmac->uniphy),
   130					     "failed to acquire uniphy\n");
   131	
   132		plat_dat->bsp_priv = gmac;
   133		plat_dat->serdes_powerup = ipq50xx_gmac_powerup;
   134		plat_dat->fix_mac_speed = ipq50xx_gmac_fix_speed;
   135	
   136		return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

