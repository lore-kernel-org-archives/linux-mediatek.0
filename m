Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB83C25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 00:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Y/wNCvg4flEbCfInFarSt03hxHrj5RBOfyIrC87W/I=; b=D+NeQovsRlqs008nVKphXLhujO
	5ezIuFC6oHBtqefYMajcJNqjz4CurOtuG2DNaD1O20+4AIEzMldhkEMYg+jsfWZgsrFw4XUJZ5VHk
	K8PpGlr9BIUklWYBZoiOb3kA+KNpNAkRzs7evOuOxm7UBxD2GYZM6bSKi6k4/xTzb43BFT9y0nrBI
	Aq18y6G8gfMFphJt8pNvgl3TqLCHFnsMqebTTkBPkCoOxcAgbvIOEyLGHj0ezjHbyl4vSpM2zKVZ1
	nN+kulEc07gXlOIrwcAhrbg1t34CttAjTCzJKf9r29o1YSjdV5teyxrD6cchVNf6hFs1NLPKHF8nc
	GAbidxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBkZd-0000000GfmF-4AIt;
	Tue, 28 May 2024 00:20:17 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBkZX-0000000GflN-3ZhK;
	Tue, 28 May 2024 00:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716855611; x=1748391611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eWutr2ixlnG62KX0n+3CKcwCg7XUOaIpMKsxTO2P7eI=;
  b=exfyZubiBfYqV4FnFZT0K2UvUctuyth7gnUL+c4sxShniacnWLO7nBGX
   McNwYhT+zeSerXilhwkfw+P7tJx52M/BP5XFyHunjL9uvxSE6sXl7bnap
   ZjUwB3XD9q4nTbPIs19CWsGpz2aaIiLMYn6bxn2fhG9uoTUqbjn+CqBe5
   PfwUOm/LcEa8oHz/yUi8xuHz0V4Ero/Z9ztz0vn4aKe0X+4tQ2jr+fIGP
   5JCtCNe0Jj0elgAAojxGeIGEvzP5kssgypenVPebqTlmQ2cEbqcoN5aNw
   0q6YYRfC1lhtJx3+FThS43FwKWjO/R8c+GYyDf3y2KTPexBq105AT0DH8
   A==;
X-CSE-ConnectionGUID: HbtgS/K9Q8m/XV3Iqus/vQ==
X-CSE-MsgGUID: PFHsh6BCS4ygnRupNKs7GA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13005901"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13005901"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 17:20:06 -0700
X-CSE-ConnectionGUID: w4akoXTfQ/WInjn+IB/C/A==
X-CSE-MsgGUID: WDKBma7rRiOAj5w/CeSwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="65697189"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 May 2024 17:20:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBkZK-000BDz-1x;
	Tue, 28 May 2024 00:19:58 +0000
Date: Tue, 28 May 2024 08:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
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
Subject: Re: [PATCH v1 05/11] pinctrl: pinmux: Add a convenient define
 PINCTRL_FUNCTION_DESC()
Message-ID: <202405280739.VSX5oEnr-lkp@intel.com>
References: <20240527212742.1432960-6-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527212742.1432960-6-andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_172012_041881_AF70CC25 
X-CRM114-Status: GOOD (  11.86  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.10-rc1 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-berlin-Make-use-of-struct-pinfunction/20240528-053304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240527212742.1432960-6-andy.shevchenko%40gmail.com
patch subject: [PATCH v1 05/11] pinctrl: pinmux: Add a convenient define PINCTRL_FUNCTION_DESC()
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240528/202405280739.VSX5oEnr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280739.VSX5oEnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280739.VSX5oEnr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinmux.c:863: warning: Function parameter or struct member 'ngroups' not described in 'pinmux_generic_add_function'
>> drivers/pinctrl/pinmux.c:863: warning: Excess function parameter 'num_groups' description in 'pinmux_generic_add_function'


vim +863 drivers/pinctrl/pinmux.c

a76edc89b100e4 Tony Lindgren      2016-12-27  849  
a76edc89b100e4 Tony Lindgren      2016-12-27  850  /**
6bffa7e1631d55 Geert Uytterhoeven 2017-04-03  851   * pinmux_generic_add_function() - adds a function group
a76edc89b100e4 Tony Lindgren      2016-12-27  852   * @pctldev: pin controller device
a76edc89b100e4 Tony Lindgren      2016-12-27  853   * @name: name of the function
a76edc89b100e4 Tony Lindgren      2016-12-27  854   * @groups: array of pin groups
a76edc89b100e4 Tony Lindgren      2016-12-27  855   * @num_groups: number of pin groups
a76edc89b100e4 Tony Lindgren      2016-12-27  856   * @data: pin controller driver specific data
a76edc89b100e4 Tony Lindgren      2016-12-27  857   */
a76edc89b100e4 Tony Lindgren      2016-12-27  858  int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
a76edc89b100e4 Tony Lindgren      2016-12-27  859  				const char *name,
bd0aae66c48208 Rafał Miłecki      2021-12-16  860  				const char * const *groups,
368512f04e89e0 Andy Shevchenko    2024-05-28  861  				const unsigned int ngroups,
a76edc89b100e4 Tony Lindgren      2016-12-27  862  				void *data)
a76edc89b100e4 Tony Lindgren      2016-12-27 @863  {
a76edc89b100e4 Tony Lindgren      2016-12-27  864  	struct function_desc *function;
6ec89cd4d17bd5 Sergey Shtylyov    2023-07-19  865  	int selector, error;
f913cfce4ee49a Tony Lindgren      2018-07-05  866  
f913cfce4ee49a Tony Lindgren      2018-07-05  867  	if (!name)
f913cfce4ee49a Tony Lindgren      2018-07-05  868  		return -EINVAL;
f913cfce4ee49a Tony Lindgren      2018-07-05  869  
f913cfce4ee49a Tony Lindgren      2018-07-05  870  	selector = pinmux_func_name_to_selector(pctldev, name);
f913cfce4ee49a Tony Lindgren      2018-07-05  871  	if (selector >= 0)
f913cfce4ee49a Tony Lindgren      2018-07-05  872  		return selector;
f913cfce4ee49a Tony Lindgren      2018-07-05  873  
f913cfce4ee49a Tony Lindgren      2018-07-05  874  	selector = pctldev->num_functions;
a76edc89b100e4 Tony Lindgren      2016-12-27  875  
a76edc89b100e4 Tony Lindgren      2016-12-27  876  	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
a76edc89b100e4 Tony Lindgren      2016-12-27  877  	if (!function)
a76edc89b100e4 Tony Lindgren      2016-12-27  878  		return -ENOMEM;
a76edc89b100e4 Tony Lindgren      2016-12-27  879  
368512f04e89e0 Andy Shevchenko    2024-05-28  880  	function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
a76edc89b100e4 Tony Lindgren      2016-12-27  881  
6ec89cd4d17bd5 Sergey Shtylyov    2023-07-19  882  	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
6ec89cd4d17bd5 Sergey Shtylyov    2023-07-19  883  	if (error)
6ec89cd4d17bd5 Sergey Shtylyov    2023-07-19  884  		return error;
a76edc89b100e4 Tony Lindgren      2016-12-27  885  
a76edc89b100e4 Tony Lindgren      2016-12-27  886  	pctldev->num_functions++;
a76edc89b100e4 Tony Lindgren      2016-12-27  887  
f913cfce4ee49a Tony Lindgren      2018-07-05  888  	return selector;
a76edc89b100e4 Tony Lindgren      2016-12-27  889  }
a76edc89b100e4 Tony Lindgren      2016-12-27  890  EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
a76edc89b100e4 Tony Lindgren      2016-12-27  891  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

