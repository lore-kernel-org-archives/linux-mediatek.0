Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C65DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kToBF7goGkkZvMbJLf3DfMuwbgCY0d7TwLJVSn5RO1I=; b=J8n2gKH8B5w316
	51Ern+hhLckoSrm3p4wOdDMHZk3DkTq8P4AfJTD4OsfN0M0husL0s8fpp6lyFTvxX9eTV8GRYjZ8z
	HswbsX+i/w0fAHArxBCNML72DpZ6csgeuhmHnhVc6518EKQ/idioSMqC4ObLZtiK2jEUItCq69p9g
	YeaQXsjBflFd8BT12wEYJPu8fHx8cSw0QTguUldKsVBqhNZpN4rhYmIoLnz+5A45AA4+3PkN5zeQA
	0s1l5fSQgHHNXm3xrtRPg0Cyfv929yaKTqAmel/xNkLRg73u1ecP/kMju8fvaWWf0MXZNsPkXpvjr
	0O3utPzbD/H7jw44abMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n71zt-00DOKX-3P; Mon, 10 Jan 2022 21:14:33 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n71ze-00DOFu-M1; Mon, 10 Jan 2022 21:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641849258; x=1673385258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=07J0kEnUclvM6FnzQLBdbihjujxj/fW7+ovEwmxMxl4=;
 b=eO2bXk6VMr5wFk05hDH238vKW4r64o3zq0GwLfEjpGEH42yhVVvG27L/
 NutVzNTuJPqyej6F1bX4qcZXL8yRcCYDS7dl8jmqAMaIJm5mbBXfqadSG
 YL9x630vtzWy1N+CFaFJySbh39GHLapN5merP/Y62QWrjD1v+7Fogz6xk
 trmvjOa/d6CwdwY05ar+uNpp7NsqC/fLL2bNKpYPao9PkwFmsXxiwcLB6
 iHrM7iQPqwYaoaR/hX+V5aXdMMkqVIU02XtI6nYKgIfsbbvykl7aq2muN
 3iw+DvV7h4pw/Ml2D4IiaxoDArF/cr/EeCJ/KWr+TTWqc6kLoQ3cNlo+b Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243276702"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="243276702"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 13:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="490133756"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 10 Jan 2022 13:14:12 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n71zY-0003yB-7m; Mon, 10 Jan 2022 21:14:12 +0000
Date: Tue, 11 Jan 2022 05:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com
Subject: Re: [v1 04/16] clk: mediatek: Add MT8186 topckgen clock support
Message-ID: <202201110556.oB2sYNXm-lkp@intel.com>
References: <20220110134416.5191-5-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110134416.5191-5-chun-jie.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_131418_837502_0376B823 
X-CRM114-Status: GOOD (  16.33  )
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

Hi Chun-Jie,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next v5.16 next-20220110]
[cannot apply to mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Chun-Jie-Chen/dt-bindings-ARM-Mediatek-Add-new-document-bindings-of-MT8186-clock/20220110-224451
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20220111/202201110556.oB2sYNXm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/265a72ef3e3b41a62f280049219cf4efe1d79171
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Chun-Jie-Chen/dt-bindings-ARM-Mediatek-Add-new-document-bindings-of-MT8186-clock/20220110-224451
        git checkout 265a72ef3e3b41a62f280049219cf4efe1d79171
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/clk/mediatek/clk-mt8186-topckgen.c: In function 'clk_mt8186_topck_probe':
>> drivers/clk/mediatek/clk-mt8186-topckgen.c:725:9: error: implicit declaration of function 'mtk_clk_unregister'; did you mean 'devm_clk_unregister'? [-Werror=implicit-function-declaration]
     725 |         mtk_clk_unregister(clk_data);
         |         ^~~~~~~~~~~~~~~~~~
         |         devm_clk_unregister
   cc1: some warnings being treated as errors


vim +725 drivers/clk/mediatek/clk-mt8186-topckgen.c

   691	
   692	static int clk_mt8186_topck_probe(struct platform_device *pdev)
   693	{
   694		struct clk_onecell_data *clk_data;
   695		struct device_node *node = pdev->dev.of_node;
   696		int r;
   697		void __iomem *base;
   698	
   699		base = devm_platform_ioremap_resource(pdev, 0);
   700		if (IS_ERR(base))
   701			return PTR_ERR(base);
   702	
   703		clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
   704		if (!clk_data)
   705			return -ENOMEM;
   706	
   707		mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
   708					    clk_data);
   709		mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
   710		mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
   711				       &mt8186_clk_lock, clk_data);
   712	
   713		mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
   714					    &mt8186_clk_lock, clk_data);
   715		mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
   716					    &mt8186_clk_lock, clk_data);
   717	
   718		r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
   719		if (r)
   720			goto unregister_clk;
   721	
   722		return r;
   723	
   724	unregister_clk:
 > 725		mtk_clk_unregister(clk_data);
   726		mtk_free_clk_data(clk_data);
   727		return r;
   728	}
   729	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
