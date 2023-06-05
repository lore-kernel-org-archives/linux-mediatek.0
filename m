Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAFAC7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgz67U8OGPR8OxbpVwcl0tAWF1erfvr1egn1tMS4EyQ=; b=eo055AQFDOUQ5C6s5RnrkC+aM5
	lpMEhhQwH/GEUfM7Mdr50zW/Jp9FIFGWv06jzSW2nZyUJbyK3vea3trAkcDpW82p7vxUDAdp2Ux6A
	GTCeW9eUVDrQnE0Mkz4ABlL5jlfM0iwovJc1IwUAtDY0fOLDnv7QKiRdzlEo70Dm5LNMIobZN+Hrj
	X/rdADusI+GI/iUgOxxAZEeuT5lsXgkiK+DocjNsBpj1t5Nrf3eTfKwvbOOsNy9QJAFWo9WwbJCoj
	RxrMWc7ZnMvUw3z+4YB1nXozax06zXvUq59SEysO6dUArhuP5OLi3V201ZwgH2ZW0O2/LLwj5j/i3
	zCpn1vqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65os-00Ek9r-04;
	Mon, 05 Jun 2023 08:44:06 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65oo-00Ek7R-1o;
	Mon, 05 Jun 2023 08:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685954642; x=1717490642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZKd1hojcEofK8WgGk5N5pRnS4q4s9sbyMNImCRd9UFk=;
  b=T1R2WsjKp56jqiBxPQDy98DkBFqxZj2gzhhD8RMnHqHk9Eb2Las4LIJe
   K7zQRv3au5E6GqoZ/ngy0AqHdwN4PuNO9x3uqZZsL9G4uxvFK/K/bgJCF
   l+Mhds3TGp2kTCw9RqjBUrQiMH5GYqU7mCNoTLikkEnGi6elIRy5s3I1d
   +BPP/f6SrpkebBgtuGsPqLzTYwe56hMwKqrXqm/3ZCz0E1xtIS6X8NDCT
   c5bVxKvUmDULaQLI6/Ak5O5ECsmkP6xUaoQUqP+qLK3/WMgvqF09CNyUO
   6ad/d/A3DpzLuy4DLTmh49M02gL+Leki3XFstXhbgX1byKK7yIEdWH7Gj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="356327450"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="356327450"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 01:43:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="798340337"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="798340337"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 01:43:54 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q65of-00042B-25;
	Mon, 05 Jun 2023 08:43:53 +0000
Date: Mon, 5 Jun 2023 16:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ritesh Harjani <riteshh@codeaurora.org>,
	Asutosh Das <asutoshd@codeaurora.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [PATCH v3] mmc: mtk-sd: reduce CIT for better performance
Message-ID: <202306051634.orHLaQ9t-lkp@intel.com>
References: <20230605060107.22044-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605060107.22044-1-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_014402_611770_015D6002 
X-CRM114-Status: GOOD (  15.93  )
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

Hi Wenbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on ulf-hansson-mmc-mirror/next v6.4-rc5 next-20230605]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenbin-Mei/mmc-mtk-sd-reduce-CIT-for-better-performance/20230605-140238
base:   linus/master
patch link:    https://lore.kernel.org/r/20230605060107.22044-1-wenbin.mei%40mediatek.com
patch subject: [PATCH v3] mmc: mtk-sd: reduce CIT for better performance
config: x86_64-randconfig-a004-20230605 (https://download.01.org/0day-ci/archive/20230605/202306051634.orHLaQ9t-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/225e46f420d48f7ad73253636a0553bd5f986435
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wenbin-Mei/mmc-mtk-sd-reduce-CIT-for-better-performance/20230605-140238
        git checkout 225e46f420d48f7ad73253636a0553bd5f986435
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mmc/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051634.orHLaQ9t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/host/mtk-sd.c:2489:4: error: expected expression
           } else {
             ^
>> drivers/mmc/host/mtk-sd.c:2495:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:2513:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:2539:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:2549:1: error: function definition is not allowed here
   {
   ^
>> drivers/mmc/host/mtk-sd.c:2577:20: error: use of undeclared identifier 'msdc_cqe_enable'
           .enable         = msdc_cqe_enable,
                             ^
>> drivers/mmc/host/mtk-sd.c:2578:20: error: use of undeclared identifier 'msdc_cqe_disable'
           .disable        = msdc_cqe_disable,
                             ^
>> drivers/mmc/host/mtk-sd.c:2579:16: error: use of undeclared identifier 'msdc_cqe_pre_enable'; did you mean 'msdc_cqe_cit_cal'?
           .pre_enable = msdc_cqe_pre_enable,
                         ^~~~~~~~~~~~~~~~~~~
                         msdc_cqe_cit_cal
   drivers/mmc/host/mtk-sd.c:2454:13: note: 'msdc_cqe_cit_cal' declared here
   static void msdc_cqe_cit_cal(struct msdc_host *host, u64 timer_ns)
               ^
>> drivers/mmc/host/mtk-sd.c:2580:18: error: use of undeclared identifier 'msdc_cqe_post_disable'
           .post_disable = msdc_cqe_post_disable,
                           ^
   drivers/mmc/host/mtk-sd.c:2585:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:2616:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:2668:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:2892:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:2920:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:2947:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:2978:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:2997:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:3016:1: error: function definition is not allowed here
   {
   ^
   drivers/mmc/host/mtk-sd.c:3041:1: error: function definition is not allowed here
   {
   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +2489 drivers/mmc/host/mtk-sd.c

  2453	
  2454	static void msdc_cqe_cit_cal(struct msdc_host *host, u64 timer_ns)
  2455	{
  2456		struct mmc_host *mmc = mmc_from_priv(host);
  2457		struct cqhci_host *cq_host = mmc->cqe_private;
  2458		u8 itcfmul;
  2459		u32 hclk_freq;
  2460		u64 value;
  2461	
  2462		/* Since MSDC CQE uses msdc_hclk as ITCFVAL, so driver should use hclk
  2463		 * frequency to get the actual time for CIT.
  2464		 */
  2465		if (host->h_clk) {
  2466			hclk_freq = clk_get_rate(host->h_clk);
  2467			itcfmul = CQHCI_CAP_ITCFMUL(cqhci_readl(cq_host, CQHCI_CAP));
  2468			switch (itcfmul) {
  2469			case 0x0:
  2470				do_div(hclk_freq, 1000);
  2471				break;
  2472			case 0x1:
  2473				do_div(hclk_freq, 100);
  2474				break;
  2475			case 0x2:
  2476				do_div(hclk_freq, 10);
  2477				break;
  2478			case 0x3:
  2479				break;
  2480			case 0x4:
  2481				hclk_freq = hclk_freq * 10;
  2482				break;
  2483			default:
  2484				host->cq_ssc1_time = 0x40;
  2485				return;
  2486			value = hclk_freq * timer_ns;
  2487			do_div(value, 1000000000ULL);
  2488			host->cq_ssc1_time = value;
> 2489		} else {
  2490			host->cq_ssc1_time = 0x40;
  2491		}
  2492	}
  2493	
  2494	static void msdc_cqe_enable(struct mmc_host *mmc)
> 2495	{
  2496		struct msdc_host *host = mmc_priv(mmc);
  2497		struct cqhci_host *cq_host = mmc->cqe_private;
  2498	
  2499		/* enable cmdq irq */
  2500		writel(MSDC_INT_CMDQ, host->base + MSDC_INTEN);
  2501		/* enable busy check */
  2502		sdr_set_bits(host->base + MSDC_PATCH_BIT1, MSDC_PB1_BUSY_CHECK_SEL);
  2503		/* default write data / busy timeout 20s */
  2504		msdc_set_busy_timeout(host, 20 * 1000000000ULL, 0);
  2505		/* default read data timeout 1s */
  2506		msdc_set_timeout(host, 1000000000ULL, 0);
  2507	
  2508		/* Set the send status command idle timer */
  2509		cqhci_writel(cq_host, host->cq_ssc1_time, CQHCI_SSC1);
  2510	}
  2511	
  2512	static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
  2513	{
  2514		struct msdc_host *host = mmc_priv(mmc);
  2515		unsigned int val = 0;
  2516	
  2517		/* disable cmdq irq */
  2518		sdr_clr_bits(host->base + MSDC_INTEN, MSDC_INT_CMDQ);
  2519		/* disable busy check */
  2520		sdr_clr_bits(host->base + MSDC_PATCH_BIT1, MSDC_PB1_BUSY_CHECK_SEL);
  2521	
  2522		val = readl(host->base + MSDC_INT);
  2523		writel(val, host->base + MSDC_INT);
  2524	
  2525		if (recovery) {
  2526			sdr_set_field(host->base + MSDC_DMA_CTRL,
  2527				      MSDC_DMA_CTRL_STOP, 1);
  2528			if (WARN_ON(readl_poll_timeout(host->base + MSDC_DMA_CTRL, val,
  2529				!(val & MSDC_DMA_CTRL_STOP), 1, 3000)))
  2530				return;
  2531			if (WARN_ON(readl_poll_timeout(host->base + MSDC_DMA_CFG, val,
  2532				!(val & MSDC_DMA_CFG_STS), 1, 3000)))
  2533				return;
  2534			msdc_reset_hw(host);
  2535		}
  2536	}
  2537	
  2538	static void msdc_cqe_pre_enable(struct mmc_host *mmc)
  2539	{
  2540		struct cqhci_host *cq_host = mmc->cqe_private;
  2541		u32 reg;
  2542	
  2543		reg = cqhci_readl(cq_host, CQHCI_CFG);
  2544		reg |= CQHCI_ENABLE;
  2545		cqhci_writel(cq_host, reg, CQHCI_CFG);
  2546	}
  2547	
  2548	static void msdc_cqe_post_disable(struct mmc_host *mmc)
  2549	{
  2550		struct cqhci_host *cq_host = mmc->cqe_private;
  2551		u32 reg;
  2552	
  2553		reg = cqhci_readl(cq_host, CQHCI_CFG);
  2554		reg &= ~CQHCI_ENABLE;
  2555		cqhci_writel(cq_host, reg, CQHCI_CFG);
  2556	}
  2557	
  2558	static const struct mmc_host_ops mt_msdc_ops = {
  2559		.post_req = msdc_post_req,
  2560		.pre_req = msdc_pre_req,
  2561		.request = msdc_ops_request,
  2562		.set_ios = msdc_ops_set_ios,
  2563		.get_ro = mmc_gpio_get_ro,
  2564		.get_cd = msdc_get_cd,
  2565		.hs400_enhanced_strobe = msdc_hs400_enhanced_strobe,
  2566		.enable_sdio_irq = msdc_enable_sdio_irq,
  2567		.ack_sdio_irq = msdc_ack_sdio_irq,
  2568		.start_signal_voltage_switch = msdc_ops_switch_volt,
  2569		.card_busy = msdc_card_busy,
  2570		.execute_tuning = msdc_execute_tuning,
  2571		.prepare_hs400_tuning = msdc_prepare_hs400_tuning,
  2572		.execute_hs400_tuning = msdc_execute_hs400_tuning,
  2573		.card_hw_reset = msdc_hw_reset,
  2574	};
  2575	
  2576	static const struct cqhci_host_ops msdc_cmdq_ops = {
> 2577		.enable         = msdc_cqe_enable,
> 2578		.disable        = msdc_cqe_disable,
> 2579		.pre_enable = msdc_cqe_pre_enable,
> 2580		.post_disable = msdc_cqe_post_disable,
  2581	};
  2582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

