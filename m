Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817BBC25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 04:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQ4zZXSy9sY36vJ5LdLIeS4BgydSdxkUvIUU9dh37dE=; b=4zozixoVej37g+PkHhBco+jbth
	yvvZFkh+AqNWCmhvylYhdSugGbJChQ2aHIfPlup5tM8ZuhvMH0TYHjS57vPW5XDzIF5N6xiF0mCRT
	VYiloc99HAeLGv/cKfZq2/rOJmoRhsX8DPoQk4W1ZSPOLtpbu3MiF9zBoRGnQEueoe+j6dH7vhlWi
	4W+hjJ/fF84qOqA5hCQI/Fjq7p6/tFknnITp77Qhp3JqR/+FmFs6p5M0pNvDUBv7M0G1L95Z6+7wg
	G0TKGUVgr5RIWF9zZ/PQLRCT5ntpc/2uIDu3hHuIFdDbwEg5VgXZSAkYg9bgqu/ono+exw/Um1pyh
	uKbW9xhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCXP2-00000006HbO-0GQC;
	Thu, 30 May 2024 04:28:36 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCXOs-00000006HYx-1evL;
	Thu, 30 May 2024 04:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717043306; x=1748579306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v5tjOO9HmCSCEa8MYghEPg07vHQ4gZzTHlkRqnsQfVI=;
  b=EgLmj8YA69VZE8su/D2SnaoewI1t64oV28Q1stif/r8GJjIxXgvCTnnq
   AHS7hvlk8TsjpxrJbM+C47eXt9xWq/Z5ziTqGPZTLx1Ek+HEcpJYGaAqw
   f51TnQKy7VJoupkaiHD/7eYoYUx7b/NpRN0dAFk1loDTEBp/chz2A/ZWG
   1kx2aVnUYFp/KR6L7jEFaLTwcw8zjoemgYAX/PmgA8NjNNUHp5tTf4nXQ
   lIjfQQcxfNurz6he5XgB94d3MRKEudObe9G9mK9t+X04hv1jKnDwXfDC0
   zvChm/4WLt05SBcTuhp71S5pOh5EO3PcgSWccDQJ+593vxu2wJVPIL1OI
   A==;
X-CSE-ConnectionGUID: PeO9QDrDR9S7FZpGr0P3wg==
X-CSE-MsgGUID: hKKn2zBtQ5+jjmVG24FUTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13340445"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13340445"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 21:28:24 -0700
X-CSE-ConnectionGUID: 0/ZUuWfvR7qEdHtbyIv6RQ==
X-CSE-MsgGUID: ehlieuwQQxmSfolO3L8mGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="36153670"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 May 2024 21:28:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCXOi-000Eo1-3B;
	Thu, 30 May 2024 04:28:16 +0000
Date: Thu, 30 May 2024 12:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: Re: [PATCH v2 07/11] pinctrl: imx: Convert to use func member
Message-ID: <202405301147.XaijPkPT-lkp@intel.com>
References: <20240528194951.1489887-8-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528194951.1489887-8-andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_212832_564659_EC059AFB 
X-CRM114-Status: GOOD (  12.97  )
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

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-berlin-Make-use-of-struct-pinfunction/20240529-035554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240528194951.1489887-8-andy.shevchenko%40gmail.com
patch subject: [PATCH v2 07/11] pinctrl: imx: Convert to use func member
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20240530/202405301147.XaijPkPT-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301147.XaijPkPT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301147.XaijPkPT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_parse_functions':
>> drivers/pinctrl/freescale/pinctrl-imx.c:603:52: error: 'struct function_desc' has no member named 'ngroups'
     603 |         group_names = devm_kcalloc(ipctl->dev, func->ngroups, sizeof(*func->func.groups),
         |                                                    ^~


vim +603 drivers/pinctrl/freescale/pinctrl-imx.c

   577	
   578	static int imx_pinctrl_parse_functions(struct device_node *np,
   579					       struct imx_pinctrl *ipctl,
   580					       u32 index)
   581	{
   582		struct pinctrl_dev *pctl = ipctl->pctl;
   583		struct device_node *child;
   584		struct function_desc *func;
   585		struct group_desc *grp;
   586		const char **group_names;
   587		u32 i;
   588	
   589		dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
   590	
   591		func = pinmux_generic_get_function(pctl, index);
   592		if (!func)
   593			return -EINVAL;
   594	
   595		/* Initialise function */
   596		func->func.name = np->name;
   597		func->func.ngroups = of_get_child_count(np);
   598		if (func->func.ngroups == 0) {
   599			dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
   600			return -EINVAL;
   601		}
   602	
 > 603		group_names = devm_kcalloc(ipctl->dev, func->ngroups, sizeof(*func->func.groups),
   604					   GFP_KERNEL);
   605		if (!group_names)
   606			return -ENOMEM;
   607		i = 0;
   608		for_each_child_of_node(np, child)
   609			group_names[i++] = child->name;
   610		func->func.groups = group_names;
   611	
   612		i = 0;
   613		for_each_child_of_node(np, child) {
   614			grp = devm_kzalloc(ipctl->dev, sizeof(*grp), GFP_KERNEL);
   615			if (!grp) {
   616				of_node_put(child);
   617				return -ENOMEM;
   618			}
   619	
   620			mutex_lock(&ipctl->mutex);
   621			radix_tree_insert(&pctl->pin_group_tree,
   622					  ipctl->group_index++, grp);
   623			mutex_unlock(&ipctl->mutex);
   624	
   625			imx_pinctrl_parse_groups(child, grp, ipctl, i++);
   626		}
   627	
   628		return 0;
   629	}
   630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

