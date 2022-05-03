Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B208C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHAMgpDPxLm0gJOHLJJX6HZrKEXSCAbkXxbJf2XtM7M=; b=u6fdfQzs1di1b9
	sqn3AMlJmQkQfruvDgZyfxSexqgj9/VGIO82iA2mTs09kz93wB5MxJOS/zwmu29+KKpSNcYpbLvSI
	Umffij4ARAQx3+l1lixt2hL2Ym/V0YtChxIHFU/IzEJT7na+Y8Wo3k3uY5U1qMh8HxS7/g5MsG0mo
	3zMpDjouinqZTBCay3NxA5aAEiHI0p3tz7GUjMuncgFSg1NDvYFLFK1JzNXHRl1FaIYNK8h1Jvm9i
	jl4mITVa/U2sLXpwU6XM1h/BR5wbvEvIETURwuQTzGbo8jCPmPlJElkPYsa1ZPlun2A5KbRTYwTyv
	FDUrbeO6Uvjj7+xiPeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlseE-00632P-KR; Tue, 03 May 2022 13:33:02 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlse2-0062xV-Si; Tue, 03 May 2022 13:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651584770; x=1683120770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JlxBmqr/aIao9xFMLDsFN5AI8Tah43lYMJLHQyXhOXQ=;
 b=U+KhQqt5bsuDY0F9PPGvaBhwnf2deVcJXYpUL5Mr3sAmUjXtdEDMl14Z
 ommOWbdUgMyCAQb9yE1xTN8Oa3Np6lTPGuWamfd0BKq7RLmXFEDVwiwpq
 8/5JlE5Jg3zqlR8om+8A1o8FWBPCursxeEa9cIMBqP0bevrEEnaNpGte8
 44CRHD+ZQwVcUudo2FzCehiYLfm44V9Ffpaloj/ALhoJgl9CjbEgeuECd
 oB3HEkQXbrKBd7SOgN07zUYFmlgAoVdKLL9GB9IDuXBXhtF/NliVSgT/8
 QQvtHptciBX0C5SVEqDZLs5Wvf92mznMlvCKyj0q7JtKpZRnAL3PmQoW5 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="248021254"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="248021254"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 06:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="599070638"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 03 May 2022 06:32:44 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nlsdv-000AUZ-Cs;
 Tue, 03 May 2022 13:32:43 +0000
Date: Tue, 3 May 2022 21:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sean.wang@mediatek.com
Cc: kbuild-all@lists.01.org, vkoul@kernel.org, matthias.bgg@gmail.com,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] dmaengine: mediatek-cqdma: Add SoC-specific match data
Message-ID: <202205032104.sDnKlXcO-lkp@intel.com>
References: <20220503105328.54755-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503105328.54755-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_063250_982375_22A0A7D7 
X-CRM114-Status: GOOD (  17.28  )
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

Hi AngeloGioacchino,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on v5.18-rc5 next-20220503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-CQDMA-driver/20220503-185610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220503/202205032104.sDnKlXcO-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1516c04b4553b4a3037e86dada37c202af23e4b3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-CQDMA-driver/20220503-185610
        git checkout 1516c04b4553b4a3037e86dada37c202af23e4b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/dma/mediatek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dma/mediatek/mtk-cqdma.c: In function 'mtk_cqdma_start':
   drivers/dma/mediatek/mtk-cqdma.c:243:42: error: implicit declaration of function 'to_cqma_dev'; did you mean 'to_cqdma_dev'? [-Werror=implicit-function-declaration]
     243 |         struct mtk_cqdma_device *cqdma = to_cqma_dev(cvd->ch);
         |                                          ^~~~~~~~~~~
         |                                          to_cqdma_dev
>> drivers/dma/mediatek/mtk-cqdma.c:243:42: warning: initialization of 'struct mtk_cqdma_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/dma/mediatek/mtk-cqdma.c:259:30: error: 'struct mtk_cqdma_device' has no member named 'plat'
     259 |         mtk_dma_set(pc, cqdma->plat->reg_src2, 0);
         |                              ^~
   drivers/dma/mediatek/mtk-cqdma.c:267:30: error: 'struct mtk_cqdma_device' has no member named 'plat'
     267 |         mtk_dma_set(pc, cqdma->plat->reg_dst2, 0);
         |                              ^~
   drivers/dma/mediatek/mtk-cqdma.c: At top level:
   drivers/dma/mediatek/mtk-cqdma.c:754:54: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     754 | static const struct mtk_cqdma_plat_data cqdma_mt6765 {
         |                                                      ^
   drivers/dma/mediatek/mtk-cqdma.c:760:59: error: 'cqdma_mt6765' undeclared here (not in a function)
     760 |         { .compatible = "mediatek,mt6765-cqdma", .data = &cqdma_mt6765 },
         |                                                           ^~~~~~~~~~~~
   drivers/dma/mediatek/mtk-cqdma.c: In function 'mtk_cqdma_probe':
   drivers/dma/mediatek/mtk-cqdma.c:777:14: error: 'struct mtk_cqdma_device' has no member named 'plat'
     777 |         cqdma->plat = device_get_match_data(&pdev->dev);
         |              ^~
   drivers/dma/mediatek/mtk-cqdma.c:778:18: error: 'struct mtk_cqdma_device' has no member named 'plat'
     778 |         if (cqdma->plat)
         |                  ^~
   cc1: some warnings being treated as errors


vim +243 drivers/dma/mediatek/mtk-cqdma.c

   239	
   240	static void mtk_cqdma_start(struct mtk_cqdma_pchan *pc,
   241				    struct mtk_cqdma_vdesc *cvd)
   242	{
 > 243		struct mtk_cqdma_device *cqdma = to_cqma_dev(cvd->ch);
   244	
   245		/* wait for the previous transaction done */
   246		if (mtk_cqdma_poll_engine_done(pc, true) < 0)
   247			dev_err(cqdma2dev(to_cqdma_dev(cvd->ch)), "cqdma wait transaction timeout\n");
   248	
   249		/* warm reset the dma engine for the new transaction */
   250		mtk_dma_set(pc, MTK_CQDMA_RESET, MTK_CQDMA_WARM_RST_BIT);
   251		if (mtk_cqdma_poll_engine_done(pc, true) < 0)
   252			dev_err(cqdma2dev(to_cqdma_dev(cvd->ch)), "cqdma warm reset timeout\n");
   253	
   254		/* setup the source */
   255		mtk_dma_set(pc, MTK_CQDMA_SRC, cvd->src & MTK_CQDMA_ADDR_LIMIT);
   256	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
   257		mtk_dma_set(pc, cqdma->plat->reg_src2, cvd->src >> MTK_CQDMA_ADDR2_SHFIT);
   258	#else
   259		mtk_dma_set(pc, cqdma->plat->reg_src2, 0);
   260	#endif
   261	
   262		/* setup the destination */
   263		mtk_dma_set(pc, MTK_CQDMA_DST, cvd->dest & MTK_CQDMA_ADDR_LIMIT);
   264	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
   265		mtk_dma_set(pc, cqdma->plat->reg_dst2, cvd->dest >> MTK_CQDMA_ADDR2_SHFIT);
   266	#else
   267		mtk_dma_set(pc, cqdma->plat->reg_dst2, 0);
   268	#endif
   269	
   270		/* setup the length */
   271		mtk_dma_set(pc, MTK_CQDMA_LEN1, cvd->len);
   272	
   273		/* start dma engine */
   274		mtk_dma_set(pc, MTK_CQDMA_EN, MTK_CQDMA_EN_BIT);
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
