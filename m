Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D997C25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 00:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfiLMifhNe1HIzDFEjYvwmHWO6JMIRUxrG50jjLAuXU=; b=h+Xjb71TUr0GJxZoSz/2nY8uVL
	pnNk6P3B3HdTYvS/WZL9wtpkBe3byoKifit9B2OHSeFQvXzkU1aRXlSgtlL912o7TiLs1czU6vYlq
	/PuMGgqnsse3b2cxUnon6nD3XahzuefMVfhV16oaKoDg8Q2i6LV+VFTvETi0sM1wflYgE3otPXpeC
	k0mnMjx3pMF0nUoyzLv+JtMfdfCFN8pkiAbOJ0gqB2XlCoq6aZiS+TC2PVfdt0Bx3G4dn+bpk+wha
	XiXef+hxyKc/WIHkQQc9oBPlHzUUgvKKr4gtVhCVN4PW0OtMdxcXSpz1adW5lXCsYrhwPgg5F6Nnh
	yWTTBeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBkkF-0000000Gghb-2PEC;
	Tue, 28 May 2024 00:31:15 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBkkA-0000000Ggfv-3qBg;
	Tue, 28 May 2024 00:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716856272; x=1748392272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5wyq/PCQQDCnYxQzdKRW3eAoy0uAeddcUgmwP9qxBFQ=;
  b=VP2Hi/qrIfaWWHYk1pciua2/gJU1EL/OoNimdQ5thUWrTRuRie+bES6u
   wQabk3Q5w8R0Ua1v2pjpsX4JZk7ygxA1ID72PCyrfndNgK/EbWf1rQGNL
   YwAeeVXsHggKfzDgCgsbY6AkXPQ+3K8oA3qPws84rRzUSj6aJv5Ywho/i
   wCIROlTR4vO6XoNE6XvewfYqmCuszufCAsUSM6CgVhy1z1sKTNHxop6D0
   MOvyNDPts4Ny+dl69F99/1SByijHEs3p68RwgMI9WldpNqdYRp4jLV95S
   QHENBdEnco9/R9ZJsJwQ3n+DaznjDhs2mfRFYk1WoEc1ooEf1ZSJHnPKW
   w==;
X-CSE-ConnectionGUID: Mn/okyO6QvuEaox02QcQxw==
X-CSE-MsgGUID: B0QXppESSqacBNRdFUbUjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23739176"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="23739176"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 17:31:06 -0700
X-CSE-ConnectionGUID: AnToqBoySGyg8R8G3srTXQ==
X-CSE-MsgGUID: DOdQIOmjRaWtK/W8/LXsTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="66098718"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2024 17:31:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBkjy-000BEB-2J;
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
Subject: Re: [PATCH v1 01/11] pinctrl: berlin: Make use of struct pinfunction
Message-ID: <202405280810.6djYxvIm-lkp@intel.com>
References: <20240527212742.1432960-2-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527212742.1432960-2-andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_173111_072944_AC62A6C8 
X-CRM114-Status: GOOD (  14.88  )
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
patch link:    https://lore.kernel.org/r/20240527212742.1432960-2-andy.shevchenko%40gmail.com
patch subject: [PATCH v1 01/11] pinctrl: berlin: Make use of struct pinfunction
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240528/202405280810.6djYxvIm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280810.6djYxvIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280810.6djYxvIm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/berlin/berlin.c:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pinctrl/berlin/berlin.c:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pinctrl/berlin/berlin.c:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/pinctrl/berlin/berlin.c:261:45: error: passing 'const char *const *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     261 |                         groups = devm_krealloc_array(&pdev->dev, function->groups,
         |                                                                  ^~~~~~~~~~~~~~~~
   include/linux/device.h:346:47: note: passing argument to parameter 'p' here
     346 | devm_krealloc_array(struct device *dev, void *p, size_t new_n, size_t new_size, gfp_t flags)
         |                                               ^
   6 warnings and 1 error generated.


vim +261 drivers/pinctrl/berlin/berlin.c

   200	
   201	static int berlin_pinctrl_build_state(struct platform_device *pdev)
   202	{
   203		struct berlin_pinctrl *pctrl = platform_get_drvdata(pdev);
   204		const struct berlin_desc_group *desc_group;
   205		const struct berlin_desc_function *desc_function;
   206		int i, max_functions = 0;
   207	
   208		pctrl->nfunctions = 0;
   209	
   210		for (i = 0; i < pctrl->desc->ngroups; i++) {
   211			desc_group = pctrl->desc->groups + i;
   212			/* compute the maximum number of functions a group can have */
   213			max_functions += 1 << (desc_group->bit_width + 1);
   214		}
   215	
   216		/* we will reallocate later */
   217		pctrl->functions = kcalloc(max_functions, sizeof(*pctrl->functions), GFP_KERNEL);
   218		if (!pctrl->functions)
   219			return -ENOMEM;
   220	
   221		/* register all functions */
   222		for (i = 0; i < pctrl->desc->ngroups; i++) {
   223			desc_group = pctrl->desc->groups + i;
   224			desc_function = desc_group->functions;
   225	
   226			while (desc_function->name) {
   227				berlin_pinctrl_add_function(pctrl, desc_function->name);
   228				desc_function++;
   229			}
   230		}
   231	
   232		pctrl->functions = krealloc(pctrl->functions,
   233					    pctrl->nfunctions * sizeof(*pctrl->functions),
   234					    GFP_KERNEL);
   235		if (!pctrl->functions)
   236			return -ENOMEM;
   237	
   238		/* map functions to theirs groups */
   239		for (i = 0; i < pctrl->desc->ngroups; i++) {
   240			desc_group = pctrl->desc->groups + i;
   241			desc_function = desc_group->functions;
   242	
   243			while (desc_function->name) {
   244				struct pinfunction *function = pctrl->functions;
   245				const char **groups;
   246				bool found = false;
   247	
   248				while (function->name) {
   249					if (!strcmp(desc_function->name, function->name)) {
   250						found = true;
   251						break;
   252					}
   253					function++;
   254				}
   255	
   256				if (!found) {
   257					kfree(pctrl->functions);
   258					return -EINVAL;
   259				}
   260	
 > 261				groups = devm_krealloc_array(&pdev->dev, function->groups,
   262							     function->ngroups,
   263							     sizeof(*function->groups),
   264							     GFP_KERNEL);
   265				if (!groups) {
   266					kfree(pctrl->functions);
   267					return -ENOMEM;
   268				}
   269				function->groups = groups;
   270				while (*groups)
   271					groups++;
   272	
   273				*groups = desc_group->name;
   274	
   275				desc_function++;
   276			}
   277		}
   278	
   279		return 0;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

