Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C93C25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 00:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGi6LyyX/vRVRuOdKrPif1k2geP8pMfGGf74bivHI9o=; b=X92HbI73qjkfBHAnKmyjk+5Pfz
	U+jZOiHDn+Qj9NF12t4/aMVZhGbqw3SO1XFfXnEd5CUXbWUa2qQynOvRVo9SdX7b6nALhHhXWGh0G
	mQqqmnrj+SOAJ27zA+2FOp+1Ygf0YtvDTGH4fC68/lntHnA2swkVFtfypqh5K9e5GPUK3AW2EOYcG
	AAUhW6PHy1+FuZiKyw97v1CT186D0Ku6rnNzbbxkzXGJOjDEw8n6m7LKZ3088w3dLg5+Y3M0Eeje6
	S/5KacMsb96kgLgNbI/ZU25Wo4XnQRWSOaW69FqHPKsvZKccqc2pKeLzIunmlP9UQh4gENNeE5O4U
	xukeixZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBkkC-0000000Gggh-1H8K;
	Tue, 28 May 2024 00:31:12 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBkk9-0000000Ggfv-0NpS;
	Tue, 28 May 2024 00:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716856270; x=1748392270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P0/LfQaKGoP69x5KXxg8N7p9+FFI1udCwW9JW2WzM08=;
  b=lj3mrXaqhluQrBNXivLRZkKWFTPdWA0Mq8FdtdRH/wIt/BMoFcWVV7sw
   Ae2maWflH2RugQEW9opoiBlhaswQxkx4ledsg+dydqixAgTvBzqOgpAJ7
   ZO9MepPei3YFi8jo38UOT9U2CtOy0hgqCx92SvU7/cJezvd+Smpw3gDdd
   2naWfWKAKh2BpjYb+If4BI7dykiCUxrmFijtoWYRnLeOmqcrr2aiGrJCk
   3QgUPoXq4/p06IMhZ8T4a6GIRJwSxduIXcOico6xZiY/uuiO+e18TyCYZ
   B+LD+LVGv68agEsp2sVnFwF92qoKOWGASU6kWwf367AM9k95X+a9i9Wfx
   w==;
X-CSE-ConnectionGUID: oa6SxJWsR+STeaKYhIP4Jw==
X-CSE-MsgGUID: gmv23bbwSQu7OVE2mRvFMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23739166"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="23739166"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 17:31:06 -0700
X-CSE-ConnectionGUID: 6fE9edj0SF+S12iXuccd1w==
X-CSE-MsgGUID: 2uN9A4pzSzKI4Z9OaDJrkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="66098716"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2024 17:31:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBkjy-000BED-2N;
	Tue, 28 May 2024 00:30:58 +0000
Date: Tue, 28 May 2024 08:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dong Aisheng <aisheng.dong@nxp.com>,
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
Message-ID: <202405280821.FcDAyD2b-lkp@intel.com>
References: <20240527212742.1432960-6-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527212742.1432960-6-andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_173109_206878_48F707A2 
X-CRM114-Status: GOOD (  12.60  )
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
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.10-rc1 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-berlin-Make-use-of-struct-pinfunction/20240528-053304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240527212742.1432960-6-andy.shevchenko%40gmail.com
patch subject: [PATCH v1 05/11] pinctrl: pinmux: Add a convenient define PINCTRL_FUNCTION_DESC()
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240528/202405280821.FcDAyD2b-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280821.FcDAyD2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280821.FcDAyD2b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinmux.c:880:11: error: assigning to 'struct function_desc *' from incompatible type 'struct function_desc'; take the address with &
     880 |         function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    &(                                                )
   1 error generated.


vim +880 drivers/pinctrl/pinmux.c

   849	
   850	/**
   851	 * pinmux_generic_add_function() - adds a function group
   852	 * @pctldev: pin controller device
   853	 * @name: name of the function
   854	 * @groups: array of pin groups
   855	 * @num_groups: number of pin groups
   856	 * @data: pin controller driver specific data
   857	 */
   858	int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
   859					const char *name,
   860					const char * const *groups,
   861					const unsigned int ngroups,
   862					void *data)
   863	{
   864		struct function_desc *function;
   865		int selector, error;
   866	
   867		if (!name)
   868			return -EINVAL;
   869	
   870		selector = pinmux_func_name_to_selector(pctldev, name);
   871		if (selector >= 0)
   872			return selector;
   873	
   874		selector = pctldev->num_functions;
   875	
   876		function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
   877		if (!function)
   878			return -ENOMEM;
   879	
 > 880		function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
   881	
   882		error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
   883		if (error)
   884			return error;
   885	
   886		pctldev->num_functions++;
   887	
   888		return selector;
   889	}
   890	EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
   891	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

