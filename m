Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1573F3D33A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHj1dy0YT/4AdirGjWEuwMWLrhSAAUkup2U42pQmZVo=; b=jGulketZ+T7VDxq4C5cZqJ9ozx
	ybLIHb01KtMik1n0DDApu+b/Sexv9CwsEd4ONUnVTnwUD6pcLIhqEu5NeYJh41ezfiJ5xrjey6OjX
	KaZb+B99w5v1C7U/7yJqpoEpg2Alu16016zdjR2xkyKeRYot+uB5YY4Z02zrSjvf2J9lldgMOsAtL
	o5zU9rzFnwxQ9ICDF+2wXoCDWW+fcdmmQlUscqQGUmkNb9aRifC3O5mPD5Byei+MHIHqd1MmpN3ct
	fxdQuhzEQgrMP+5B5aTJ0NWdse9ww96pAVQk3drIaok+EBq+WNUtj9kxL8ErG/ZvGBKvSdTs+LE/F
	OUlhQhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCHS-00000002Gow-3DqW;
	Thu, 05 Mar 2026 17:14:34 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCHK-00000002Ghq-09fx
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 17:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772730866; x=1804266866;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=pu3U3XafogV/7AHtjBSw22TKUA1Aul4SoXitl4OxRQw=;
  b=BnSveKk+IFyeSesg17mQbEd0GohcnfMnfH06lAXIY3Byq4kK8d5rI0rN
   +/Qs1ROZd2c8SZim+JJGHkryJDdCB3+MPyMcllhXwVGJEf9Y7APE9gZk6
   SiXpXPMSd7lQPXhITRgkZIbZ7DOfVn7+EOnfSXrF5FyKLFOz2fdta2DdT
   A0NBFTW2oA2pxMG33fCps0yOrjZP/iOUfOoc9xns0m0860CzfCD/ZIekx
   mAZM29cveRHnBVaWuNnEg92opXyTDJk9iwrVhhjLo+l/coGexraZlq9Pw
   O3EGsnU01wb8NKflB8i+L+wlWsQqz18f7PveNfviCZN2HVPQq0rkUOrBm
   w==;
X-CSE-ConnectionGUID: cIj+SN8oRHicasYUVGyhDA==
X-CSE-MsgGUID: vPLzBo19SpW9OD9OdA7c0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73874481"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73874481"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:14:25 -0800
X-CSE-ConnectionGUID: N3ohgf+NSYSPTPgg7hMvwg==
X-CSE-MsgGUID: /PelYUYsTLadADQFzyRHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223231017"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Mar 2026 09:14:24 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyCHF-000000000yA-1z4D;
	Thu, 05 Mar 2026 17:14:21 +0000
Date: Fri, 6 Mar 2026 01:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] soc: mediatek: mtk-dvfsrc: use flex array
Message-ID: <202603060154.IZyLqpzw-lkp@intel.com>
References: <20260304232014.164408-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304232014.164408-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_091428_135037_374D7170 
X-CRM114-Status: GOOD (  15.45  )
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

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/kspp]
[also build test WARNING on linus/master v7.0-rc2 next-20260305]
[cannot apply to kees/for-next/pstore]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/soc-mediatek-mtk-dvfsrc-use-flex-array/20260305-072355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20260304232014.164408-1-rosenp%40gmail.com
patch subject: [PATCH] soc: mediatek: mtk-dvfsrc: use flex array
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260306/202603060154.IZyLqpzw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060154.IZyLqpzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060154.IZyLqpzw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/arm-smccc.h:9,
                    from drivers/soc/mediatek/mtk-dvfsrc.c:8:
   drivers/soc/mediatek/mtk-dvfsrc.c: In function 'dvfsrc_get_hw_opps_v4':
   drivers/soc/mediatek/mtk-dvfsrc.c:522:66: error: 'num_ops' undeclared (first use in this function); did you mean 'num_opps'?
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                                                  ^~~~~~~
   include/linux/compiler.h:326:55: note: in definition of macro '__is_constexpr'
     326 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   drivers/soc/mediatek/mtk-dvfsrc.c:522:42: note: in expansion of macro 'struct_size'
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                          ^~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:522:66: note: each undeclared identifier is reported only once for each function it appears in
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                                                  ^~~~~~~
   include/linux/compiler.h:326:55: note: in definition of macro '__is_constexpr'
     326 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   drivers/soc/mediatek/mtk-dvfsrc.c:522:42: note: in expansion of macro 'struct_size'
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                          ^~~~~~~~~~~
   In file included from include/linux/string.h:13,
                    from include/linux/uuid.h:11,
                    from include/linux/arm-smccc.h:12:
   include/linux/overflow.h:419:9: error: first argument to '__builtin_choose_expr' not a constant
     419 |         __builtin_choose_expr(__is_constexpr(count),                    \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:436:32: note: in expansion of macro 'flex_array_size'
     436 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \
         |                                ^~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:522:42: note: in expansion of macro 'struct_size'
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                          ^~~~~~~~~~~
   include/linux/overflow.h:419:9: error: first argument to '__builtin_choose_expr' not a constant
     419 |         __builtin_choose_expr(__is_constexpr(count),                    \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:437:40: note: in expansion of macro 'flex_array_size'
     437 |                 size_add(sizeof(*(p)), flex_array_size(p, member, count)))
         |                                        ^~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:522:42: note: in expansion of macro 'struct_size'
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                          ^~~~~~~~~~~
   include/linux/overflow.h:435:9: error: first argument to '__builtin_choose_expr' not a constant
     435 |         __builtin_choose_expr(__is_constexpr(count),                    \
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:522:42: note: in expansion of macro 'struct_size'
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                          ^~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c: At top level:
   drivers/soc/mediatek/mtk-dvfsrc.c:726:25: error: initialization of 'unsigned int' from 'const struct dvfsrc_opp *' makes integer from pointer without a cast [-Wint-conversion]
     726 |                 .opps = dvfsrc_opp_mt6893_lp4,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:726:25: note: (near initialization for 'dvfsrc_opp_mt6893_desc[0].opps[0].vcore_opp')
   drivers/soc/mediatek/mtk-dvfsrc.c:727:17: error: initialization of flexible array member in a nested context
     727 |                 .num_opp = ARRAY_SIZE(dvfsrc_opp_mt6893_lp4),
         |                 ^
   drivers/soc/mediatek/mtk-dvfsrc.c:727:17: note: (near initialization for 'dvfsrc_opp_mt6893_desc[0].opps')
>> drivers/soc/mediatek/mtk-dvfsrc.c:724:64: warning: missing braces around initializer [-Wmissing-braces]
     724 | static const struct dvfsrc_opp_desc dvfsrc_opp_mt6893_desc[] = {
         |                                                                ^
     725 |         [0] = {
     726 |                 .opps = dvfsrc_opp_mt6893_lp4,
         |                         {{                   }}
>> drivers/soc/mediatek/mtk-dvfsrc.c:724:64: warning: missing braces around initializer [-Wmissing-braces]
     724 | static const struct dvfsrc_opp_desc dvfsrc_opp_mt6893_desc[] = {
         |                                                                ^
     725 |         [0] = {
     726 |                 .opps = dvfsrc_opp_mt6893_lp4,
         |                         {{                   }}
   drivers/soc/mediatek/mtk-dvfsrc.c:759:25: error: initialization of 'unsigned int' from 'const struct dvfsrc_opp *' makes integer from pointer without a cast [-Wint-conversion]
     759 |                 .opps = dvfsrc_opp_mt8183_lp4,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:759:25: note: (near initialization for 'dvfsrc_opp_mt8183_desc[0].opps[0].vcore_opp')
   drivers/soc/mediatek/mtk-dvfsrc.c:760:17: error: initialization of flexible array member in a nested context
     760 |                 .num_opp = ARRAY_SIZE(dvfsrc_opp_mt8183_lp4),
         |                 ^
   drivers/soc/mediatek/mtk-dvfsrc.c:760:17: note: (near initialization for 'dvfsrc_opp_mt8183_desc[0].opps')
   drivers/soc/mediatek/mtk-dvfsrc.c:757:64: warning: missing braces around initializer [-Wmissing-braces]
     757 | static const struct dvfsrc_opp_desc dvfsrc_opp_mt8183_desc[] = {
         |                                                                ^
     758 |         [0] = {
     759 |                 .opps = dvfsrc_opp_mt8183_lp4,
         |                         {{                   }}
   drivers/soc/mediatek/mtk-dvfsrc.c:763:25: error: initialization of 'unsigned int' from 'const struct dvfsrc_opp *' makes integer from pointer without a cast [-Wint-conversion]
     763 |                 .opps = dvfsrc_opp_mt8183_lp3,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:763:25: note: (near initialization for 'dvfsrc_opp_mt8183_desc[1].opps[0].vcore_opp')
   drivers/soc/mediatek/mtk-dvfsrc.c:764:17: error: initialization of flexible array member in a nested context
     764 |                 .num_opp = ARRAY_SIZE(dvfsrc_opp_mt8183_lp3),
         |                 ^
   drivers/soc/mediatek/mtk-dvfsrc.c:764:17: note: (near initialization for 'dvfsrc_opp_mt8183_desc[1].opps')
   drivers/soc/mediatek/mtk-dvfsrc.c:757:64: warning: missing braces around initializer [-Wmissing-braces]
     757 | static const struct dvfsrc_opp_desc dvfsrc_opp_mt8183_desc[] = {
         |                                                                ^
     758 |         [0] = {
     759 |                 .opps = dvfsrc_opp_mt8183_lp4,
         |                         {{                   }}
   ......
     763 |                 .opps = dvfsrc_opp_mt8183_lp3,
         |                         {{                   }}
   drivers/soc/mediatek/mtk-dvfsrc.c:767:25: error: initialization of 'unsigned int' from 'const struct dvfsrc_opp *' makes integer from pointer without a cast [-Wint-conversion]
     767 |                 .opps = dvfsrc_opp_mt8183_lp3,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:767:25: note: (near initialization for 'dvfsrc_opp_mt8183_desc[2].opps[0].vcore_opp')
   drivers/soc/mediatek/mtk-dvfsrc.c:768:17: error: initialization of flexible array member in a nested context
     768 |                 .num_opp = ARRAY_SIZE(dvfsrc_opp_mt8183_lp3),
         |                 ^
   drivers/soc/mediatek/mtk-dvfsrc.c:768:17: note: (near initialization for 'dvfsrc_opp_mt8183_desc[2].opps')
   drivers/soc/mediatek/mtk-dvfsrc.c:757:64: warning: missing braces around initializer [-Wmissing-braces]
     757 | static const struct dvfsrc_opp_desc dvfsrc_opp_mt8183_desc[] = {
         |                                                                ^
     758 |         [0] = {
     759 |                 .opps = dvfsrc_opp_mt8183_lp4,
         |                         {{                   }}
   ......
     763 |                 .opps = dvfsrc_opp_mt8183_lp3,
         |                         {{                   }}
   ......
     767 |                 .opps = dvfsrc_opp_mt8183_lp3,
         |                         {{                   }}
   drivers/soc/mediatek/mtk-dvfsrc.c:757:64: warning: missing braces around initializer [-Wmissing-braces]
     757 | static const struct dvfsrc_opp_desc dvfsrc_opp_mt8183_desc[] = {
         |                                                                ^
     758 |         [0] = {
     759 |                 .opps = dvfsrc_opp_mt8183_lp4,
         |                         {{                   }}
   ......
     763 |                 .opps = dvfsrc_opp_mt8183_lp3,
         |                         {{                   }}
   ......
     767 |                 .opps = dvfsrc_opp_mt8183_lp3,
         |                         {{                   }}
   drivers/soc/mediatek/mtk-dvfsrc.c:799:25: error: initialization of 'unsigned int' from 'const struct dvfsrc_opp *' makes integer from pointer without a cast [-Wint-conversion]
     799 |                 .opps = dvfsrc_opp_mt8195_lp4,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:799:25: note: (near initialization for 'dvfsrc_opp_mt8195_desc[0].opps[0].vcore_opp')
   drivers/soc/mediatek/mtk-dvfsrc.c:800:17: error: initialization of flexible array member in a nested context
     800 |                 .num_opp = ARRAY_SIZE(dvfsrc_opp_mt8195_lp4),
         |                 ^
   drivers/soc/mediatek/mtk-dvfsrc.c:800:17: note: (near initialization for 'dvfsrc_opp_mt8195_desc[0].opps')
   drivers/soc/mediatek/mtk-dvfsrc.c:797:64: warning: missing braces around initializer [-Wmissing-braces]
     797 | static const struct dvfsrc_opp_desc dvfsrc_opp_mt8195_desc[] = {
         |                                                                ^
     798 |         [0] = {
     799 |                 .opps = dvfsrc_opp_mt8195_lp4,
         |                         {{                   }}
   drivers/soc/mediatek/mtk-dvfsrc.c:797:64: warning: missing braces around initializer [-Wmissing-braces]
     797 | static const struct dvfsrc_opp_desc dvfsrc_opp_mt8195_desc[] = {
         |                                                                ^
     798 |         [0] = {
     799 |                 .opps = dvfsrc_opp_mt8195_lp4,
         |                         {{                   }}


vim +724 drivers/soc/mediatek/mtk-dvfsrc.c

e5ea18102c9d3b AngeloGioacchino Del Regno 2025-04-10  723  
e5ea18102c9d3b AngeloGioacchino Del Regno 2025-04-10 @724  static const struct dvfsrc_opp_desc dvfsrc_opp_mt6893_desc[] = {
e5ea18102c9d3b AngeloGioacchino Del Regno 2025-04-10  725  	[0] = {
e5ea18102c9d3b AngeloGioacchino Del Regno 2025-04-10  726  		.opps = dvfsrc_opp_mt6893_lp4,
e5ea18102c9d3b AngeloGioacchino Del Regno 2025-04-10  727  		.num_opp = ARRAY_SIZE(dvfsrc_opp_mt6893_lp4),
e5ea18102c9d3b AngeloGioacchino Del Regno 2025-04-10  728  	}
e5ea18102c9d3b AngeloGioacchino Del Regno 2025-04-10  729  };
e5ea18102c9d3b AngeloGioacchino Del Regno 2025-04-10  730  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

