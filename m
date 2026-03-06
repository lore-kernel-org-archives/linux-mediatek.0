Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2195F513F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 04:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZureWBAyTJSzuyM2ejfxqXoeTGtRnHdy0xmbdpvxOo=; b=cz8BMXM0KbYd7pZuDspulO+kJj
	bhbmCaLoBFxmDbVeGmqmnQYk65pFOqXmeQYP7d3KZpd0FmC7ZNYqFddw01tMja306yi5x+eMmFAbT
	hEO0yApJAKn3SRzGSmdwSbxNytStl3KOjP34jichKSs97xxUpXmm6MKJL8xbZ/7vUTU8bR8Xe9wT/
	+mJ2nqO1EGMJKKue8B2gGE51RHzeTooiTdn6Ud6jFMhgJbB95EXH5hJtZzMmHliLFoNBurV/JBPB6
	oYuBIQhPY3H/EwfUK27ogGgFb7pyp99bl5Vzkw5CYFaOMkfiufDt0W1mdV54zvay5IvUvbgSW3iqK
	JeRMYPLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyN4c-0000000317i-1zFU;
	Fri, 06 Mar 2026 04:46:02 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyN4X-0000000316m-1HcD
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 04:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772772357; x=1804308357;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=uA28ddI7piPDzwe4z/7BP8nLkfmRuu2NcgsSu8t9kOE=;
  b=eaF0hmT6AbBzAQfTivYB/nrNWe4s5UMymLBsXYIXV72PGLjmuKBs47QJ
   uMFCylNaoNeQGDh9eWBPW+AKJ/gcZ2IcdTVGILafCkKKQhgd2gZMcYl6b
   lxdA3QYO6e3tkKEsOgK3SL6A/+bgJ2rR8jKaQVsoI9sqYkJc6TgzORFLE
   y11KdfKWRCk1ax7K7PdREGS6EQbQl1Is+iUe1QqXgdHmHinnNFGtDY/cH
   +AGdVW35lWvqcPzNENmEEXpxb5l6smgwRVums8MF9rL6Y9HOUCUjwmkvd
   P/KMH9+3YASt+WBFykvlfvU9NbuXv85U9lEe2F0IvpV0juIVSX1YqL0/e
   w==;
X-CSE-ConnectionGUID: X7QG6DgERvenKYntybTwhg==
X-CSE-MsgGUID: 9qhrW+6NRA+UlNh0R6Mkpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84204458"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84204458"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 20:45:54 -0800
X-CSE-ConnectionGUID: 6+veTn5nRu2ZhrJWMhp40g==
X-CSE-MsgGUID: Y79k93fiT6inMSYK1bVJaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223596214"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2026 20:45:53 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyN4Q-000000000Mn-2Muk;
	Fri, 06 Mar 2026 04:45:50 +0000
Date: Fri, 6 Mar 2026 12:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] soc: mediatek: mtk-dvfsrc: use flex array
Message-ID: <202603061220.aCSWpwU6-lkp@intel.com>
References: <20260304232014.164408-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304232014.164408-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_204557_457722_6AAE82F6 
X-CRM114-Status: GOOD (  15.43  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/kspp]
[also build test ERROR on linus/master v7.0-rc2 next-20260305]
[cannot apply to kees/for-next/pstore]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/soc-mediatek-mtk-dvfsrc-use-flex-array/20260305-072355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20260304232014.164408-1-rosenp%40gmail.com
patch subject: [PATCH] soc: mediatek: mtk-dvfsrc: use flex array
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260306/202603061220.aCSWpwU6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061220.aCSWpwU6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061220.aCSWpwU6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/arm-smccc.h:9,
                    from drivers/soc/mediatek/mtk-dvfsrc.c:8:
   drivers/soc/mediatek/mtk-dvfsrc.c: In function 'dvfsrc_get_hw_opps_v4':
>> drivers/soc/mediatek/mtk-dvfsrc.c:522:66: error: 'num_ops' undeclared (first use in this function); did you mean 'num_opps'?
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
>> include/linux/overflow.h:419:9: error: first argument to '__builtin_choose_expr' not a constant
     419 |         __builtin_choose_expr(__is_constexpr(count),                    \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:436:32: note: in expansion of macro 'flex_array_size'
     436 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \
         |                                ^~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:522:42: note: in expansion of macro 'struct_size'
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                          ^~~~~~~~~~~
>> include/linux/overflow.h:419:9: error: first argument to '__builtin_choose_expr' not a constant
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
>> drivers/soc/mediatek/mtk-dvfsrc.c:726:25: error: initialization of 'unsigned int' from 'const struct dvfsrc_opp *' makes integer from pointer without a cast [-Wint-conversion]
     726 |                 .opps = dvfsrc_opp_mt6893_lp4,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:726:25: note: (near initialization for 'dvfsrc_opp_mt6893_desc[0].opps[0].vcore_opp')
>> drivers/soc/mediatek/mtk-dvfsrc.c:727:17: error: initialization of flexible array member in a nested context
     727 |                 .num_opp = ARRAY_SIZE(dvfsrc_opp_mt6893_lp4),
         |                 ^
   drivers/soc/mediatek/mtk-dvfsrc.c:727:17: note: (near initialization for 'dvfsrc_opp_mt6893_desc[0].opps')
   drivers/soc/mediatek/mtk-dvfsrc.c:724:64: warning: missing braces around initializer [-Wmissing-braces]
     724 | static const struct dvfsrc_opp_desc dvfsrc_opp_mt6893_desc[] = {
         |                                                                ^
     725 |         [0] = {
     726 |                 .opps = dvfsrc_opp_mt6893_lp4,
         |                         {{                   }}
   drivers/soc/mediatek/mtk-dvfsrc.c:724:64: warning: missing braces around initializer [-Wmissing-braces]
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


vim +522 drivers/soc/mediatek/mtk-dvfsrc.c

   489	
   490	static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
   491	{
   492		struct dvfsrc_opp_desc *desc;
   493		u32 num_opps, gear_info;
   494		u8 num_vcore, num_dram;
   495		u8 num_emi;
   496		int i;
   497	
   498		num_opps = dvfsrc_get_opp_count_v4(dvfsrc);
   499		if (num_opps == 0) {
   500			dev_err(dvfsrc->dev, "No OPPs programmed in DVFSRC MCU.\n");
   501			return -EINVAL;
   502		}
   503	
   504		/*
   505		 * The first 16 bits set in the gear info table says how many OPPs
   506		 * and how many vcore, dram and emi table entries are available.
   507		 */
   508		gear_info = dvfsrc_readl(dvfsrc, DVFSRC_GEAR_INFO_L);
   509		if (gear_info == 0) {
   510			dev_err(dvfsrc->dev, "No gear info in DVFSRC MCU.\n");
   511			return -EINVAL;
   512		}
   513	
   514		num_vcore = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info) + 1;
   515		num_dram = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info) + 1;
   516		num_emi = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info) + 1;
   517		dev_info(dvfsrc->dev,
   518			 "Discovered %u gears and %u vcore, %u dram, %u emi table entries.\n",
   519			 num_opps, num_vcore, num_dram, num_emi);
   520	
   521		/* Allocate everything now as anything else after that cannot fail */
 > 522		desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
   523		if (!desc)
   524			return -ENOMEM;
   525	
   526		desc->num_opp = num_opps + 1;
   527	
   528		/* Read the OPP table gear indices */
   529		for (i = 0; i <= num_opps; i++) {
   530			gear_info = dvfsrc_get_opp_gear(dvfsrc, num_opps - i);
   531			desc->opps[i].vcore_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info);
   532			desc->opps[i].dram_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info);
   533			desc->opps[i].emi_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info);
   534		};
   535	
   536		/* Assign to main structure now that everything is done! */
   537		dvfsrc->curr_opps = desc;
   538	
   539		return 0;
   540	}
   541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

