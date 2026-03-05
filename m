Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46334F47CA3
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 17:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eolf1pGuoIaM2lrM4rtJS35JhbyONR0lBRZ4bHVC8w=; b=ckHpYUV5QXLj7/VX3sJAWOpFYw
	KN/kB7Tm5G5KGFfsDfaeLMpLpaPY5TTD7c7Dvgq/bUgJfYu8jRREvwsjyGs+xBC69uqkPMf5nnoLb
	Y+cyCUhhSPKg8sF9kU0gNmRm43rFaDgLmlVa2PdNCsMlIYoveKX6iqpqBFKYMcy7pEvhXtmfPSn55
	tnD/Z8zV1HF74y1k3gGl4tQM6+rkOQk32L91KmnhB7Imoqre1tF5p4Iq1/cfcFMjX3s2/uQhDlx0+
	67v9FFoIX/b/44XURaUmlS280JaftIagqGImEMHkK4CmP/PJgEtHLrnAaKBRmniBsINDsL+IJfbmb
	K35xtuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCxC-00000002KrM-3Ivi;
	Thu, 05 Mar 2026 17:57:42 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCx9-00000002KqW-1XNI
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 17:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772733460; x=1804269460;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=pEHbOS9jGAn9wxxS79L6fTM66oe9RkMnRW9/MRACoCM=;
  b=WouZ2soGfrxl+COO1J+6Xs8Xvz07qtus6MT2XBxPAa9Pb6Jbmb1TR4/R
   1Mf1v0OUrwO5PJSN9MaAmHNVEeb5li3RqvmIQF8l52gvXAQDrDv0f0FDQ
   EdO0oozTLM/IHrnPMLUj6jiNEwKQrX4tAfwOYJ/7gH7Xii73aqz0bqumZ
   3oXSQtHYR1yi8T8ogmMSW6FbKzdRqx0OvFfYTEjV/KNft99ZgEJMZomyW
   PshCdLBxRaRCqUjKauBfPygqXxychGXDh3kOdrffCb+bbdd5AIEVmzYj0
   688olfbCNRr1stSolM2C2WH974rP/CJChGNvYmbSk8tdOyJUIimW6QxYu
   A==;
X-CSE-ConnectionGUID: UAuybaBbQaCFlPPz8j/BZQ==
X-CSE-MsgGUID: 6zqi+12+SPa3wTJ3NXobpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77433043"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77433043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:57:37 -0800
X-CSE-ConnectionGUID: 30FUmx6bRL2AQE8FTOvkwA==
X-CSE-MsgGUID: eNJuc0OvTQyWI5mh6gPCPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223451978"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2026 09:57:35 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyCx3-0000000012s-0RoH;
	Thu, 05 Mar 2026 17:57:33 +0000
Date: Fri, 6 Mar 2026 01:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] soc: mediatek: mtk-dvfsrc: use flex array
Message-ID: <202603060141.sYb2R56a-lkp@intel.com>
References: <20260304232014.164408-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304232014.164408-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_095739_465113_2BA29FE9 
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
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260306/202603060141.sYb2R56a-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060141.sYb2R56a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060141.sYb2R56a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-dvfsrc.c:522:59: error: use of undeclared identifier 'num_ops'; did you mean 'num_opps'?
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                                                  ^~~~~~~
         |                                                                  num_opps
   include/linux/overflow.h:435:39: note: expanded from macro 'struct_size'
     435 |         __builtin_choose_expr(__is_constexpr(count),                    \
         |                                              ^
   include/linux/compiler.h:326:48: note: expanded from macro '__is_constexpr'
     326 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   drivers/soc/mediatek/mtk-dvfsrc.c:493:6: note: 'num_opps' declared here
     493 |         u32 num_opps, gear_info;
         |             ^
>> drivers/soc/mediatek/mtk-dvfsrc.c:522:59: error: use of undeclared identifier 'num_ops'; did you mean 'num_opps'?
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                                                  ^~~~~~~
         |                                                                  num_opps
   include/linux/overflow.h:436:45: note: expanded from macro 'struct_size'
     436 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \
         |                                                           ^
   include/linux/overflow.h:419:39: note: expanded from macro 'flex_array_size'
     419 |         __builtin_choose_expr(__is_constexpr(count),                    \
         |                                              ^
   include/linux/compiler.h:326:48: note: expanded from macro '__is_constexpr'
     326 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   drivers/soc/mediatek/mtk-dvfsrc.c:493:6: note: 'num_opps' declared here
     493 |         u32 num_opps, gear_info;
         |             ^
>> drivers/soc/mediatek/mtk-dvfsrc.c:522:59: error: use of undeclared identifier 'num_ops'; did you mean 'num_opps'?
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                                                  ^~~~~~~
         |                                                                  num_opps
   include/linux/overflow.h:436:45: note: expanded from macro 'struct_size'
     436 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \
         |                                                           ^
   include/linux/overflow.h:420:4: note: expanded from macro 'flex_array_size'
     420 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                  ^
   drivers/soc/mediatek/mtk-dvfsrc.c:493:6: note: 'num_opps' declared here
     493 |         u32 num_opps, gear_info;
         |             ^
>> drivers/soc/mediatek/mtk-dvfsrc.c:522:59: error: use of undeclared identifier 'num_ops'; did you mean 'num_opps'?
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                                                  ^~~~~~~
         |                                                                  num_opps
   include/linux/overflow.h:437:53: note: expanded from macro 'struct_size'
     437 |                 size_add(sizeof(*(p)), flex_array_size(p, member, count)))
         |                                                                   ^
   include/linux/overflow.h:419:39: note: expanded from macro 'flex_array_size'
     419 |         __builtin_choose_expr(__is_constexpr(count),                    \
         |                                              ^
   include/linux/compiler.h:326:48: note: expanded from macro '__is_constexpr'
     326 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   drivers/soc/mediatek/mtk-dvfsrc.c:493:6: note: 'num_opps' declared here
     493 |         u32 num_opps, gear_info;
         |             ^
>> drivers/soc/mediatek/mtk-dvfsrc.c:522:59: error: use of undeclared identifier 'num_ops'; did you mean 'num_opps'?
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                                                  ^~~~~~~
         |                                                                  num_opps
   include/linux/overflow.h:437:53: note: expanded from macro 'struct_size'
     437 |                 size_add(sizeof(*(p)), flex_array_size(p, member, count)))
         |                                                                   ^
   include/linux/overflow.h:420:4: note: expanded from macro 'flex_array_size'
     420 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                  ^
   drivers/soc/mediatek/mtk-dvfsrc.c:493:6: note: 'num_opps' declared here
     493 |         u32 num_opps, gear_info;
         |             ^
>> drivers/soc/mediatek/mtk-dvfsrc.c:522:59: error: use of undeclared identifier 'num_ops'; did you mean 'num_opps'?
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                                                  ^~~~~~~
         |                                                                  num_opps
   include/linux/overflow.h:436:45: note: expanded from macro 'struct_size'
     436 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \
         |                                                           ^
   include/linux/overflow.h:421:12: note: expanded from macro 'flex_array_size'
     421 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^
   drivers/soc/mediatek/mtk-dvfsrc.c:493:6: note: 'num_opps' declared here
     493 |         u32 num_opps, gear_info;
         |             ^
>> drivers/soc/mediatek/mtk-dvfsrc.c:522:59: error: use of undeclared identifier 'num_ops'; did you mean 'num_opps'?
     522 |         desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
         |                                                                  ^~~~~~~
         |                                                                  num_opps
   include/linux/overflow.h:437:53: note: expanded from macro 'struct_size'
     437 |                 size_add(sizeof(*(p)), flex_array_size(p, member, count)))
         |                                                                   ^
   include/linux/overflow.h:421:12: note: expanded from macro 'flex_array_size'
     421 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^
   drivers/soc/mediatek/mtk-dvfsrc.c:493:6: note: 'num_opps' declared here
     493 |         u32 num_opps, gear_info;
         |             ^
>> drivers/soc/mediatek/mtk-dvfsrc.c:726:11: error: flexible array requires brace-enclosed initializer
     726 |                 .opps = dvfsrc_opp_mt6893_lp4,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:75:20: note: initialized flexible array member 'opps' is here
      75 |         struct dvfsrc_opp opps[] __counted_by(num_opp);
         |                           ^
   drivers/soc/mediatek/mtk-dvfsrc.c:759:11: error: flexible array requires brace-enclosed initializer
     759 |                 .opps = dvfsrc_opp_mt8183_lp4,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:75:20: note: initialized flexible array member 'opps' is here
      75 |         struct dvfsrc_opp opps[] __counted_by(num_opp);
         |                           ^
   drivers/soc/mediatek/mtk-dvfsrc.c:763:11: error: flexible array requires brace-enclosed initializer
     763 |                 .opps = dvfsrc_opp_mt8183_lp3,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:75:20: note: initialized flexible array member 'opps' is here
      75 |         struct dvfsrc_opp opps[] __counted_by(num_opp);
         |                           ^
   drivers/soc/mediatek/mtk-dvfsrc.c:767:11: error: flexible array requires brace-enclosed initializer
     767 |                 .opps = dvfsrc_opp_mt8183_lp3,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:75:20: note: initialized flexible array member 'opps' is here
      75 |         struct dvfsrc_opp opps[] __counted_by(num_opp);
         |                           ^
   drivers/soc/mediatek/mtk-dvfsrc.c:799:11: error: flexible array requires brace-enclosed initializer
     799 |                 .opps = dvfsrc_opp_mt8195_lp4,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-dvfsrc.c:75:20: note: initialized flexible array member 'opps' is here
      75 |         struct dvfsrc_opp opps[] __counted_by(num_opp);
         |                           ^
   12 errors generated.


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

