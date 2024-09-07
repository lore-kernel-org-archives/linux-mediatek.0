Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2A4ECE573
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 22:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYC6QIo1juTuTZ9/Y1qG6lgMiu14ecOg3Vq9N8buy0g=; b=3BdxSINm8P18g73W1kaUBZNB8O
	uOqtOlBceVQzZDIA0TvROn1qdUEo4PWJNKxQgDFXnliTOuwHZN/4E6c3lR4iwmATPuomN7ZqX/Hni
	9g1XtOaSI8YTmSBHwgymsJi3Ud5SEpCpRAEafWuvG1RfzsCZUcoorNm0oAgKG/SsYE/nRXe2f5A1z
	ZOkvjYmgoC+GkCav6UhMwhhrMsXw3VkJcmzICEulfEuO67x1y7Q577dOsmnivJ4mGAOO/VZAtxkU1
	8+1eerP+0c6WdVvNyr5OVXRubQL5fhCFjdzDWqCxGz819e5Wtg0CSbZauCTeiO9Qtr8BUqtn/9k6E
	BD9SD5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn3oN-0000000FjZs-17Zf;
	Sat, 07 Sep 2024 22:21:43 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn3nL-0000000FjT5-3oCn;
	Sat, 07 Sep 2024 22:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725747640; x=1757283640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=18QHyOowCoerOI8GyYR6ejC+zvs3qPUSNSXla/8mTQQ=;
  b=TDzwdrS1npdzY6W9zvTs63xTovboLN28b4/v/HdCy/jp2j66Ou5104Kf
   ic0LZR4gUzw9ei0L3UzZvhzIFpzIRdNY9IVx5p+mVSwPyEWBJd9YMCGzE
   8i9mhikmuU2fBxul73SS1qHvDdXbNitYLQPI0sSrsLVIXPWQ3yv4FzyPB
   t+No7qcuj2WKEo8Pszhx9OYUaTwhznAFURu4u8yWmTRzeBRC8bfO3J2Yg
   NYkaYoc6S7+LOjkr6kpEN28QASOC1fLbDaXUgcofho654+5WQlqiks8As
   lbW0YAdJkExPmYx90MlqDZe0fNicfWE54n/FijpeRdRzXAISfszY0HdLt
   Q==;
X-CSE-ConnectionGUID: UkI44xs4RHqeupK9Kl3SSg==
X-CSE-MsgGUID: HMGaczZXSn2iwv0PfyrDrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="27397996"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="27397996"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 15:20:32 -0700
X-CSE-ConnectionGUID: 0o2KY8N/R/OI7fU2DO3w6Q==
X-CSE-MsgGUID: gFO3pKwNQD26MyxnmRlHxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="103750126"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Sep 2024 15:20:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn3n8-000D3Q-2V;
	Sat, 07 Sep 2024 22:20:26 +0000
Date: Sun, 8 Sep 2024 06:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chunhui Li <chunhui.li@mediatek.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	Chunhui Li <chunhui.li@mediatek.com>,
	Petr Pavlu <petr.pavlu@suse.com>, kernel test robot <lkp@intel.com>,
	Xion Wang <xion.wang@mediatek.com>
Subject: Re: [PATCH v3 1/1] module: abort module loading when sysfs setup
 suffer errors
Message-ID: <202409080534.y2m1URF1-lkp@intel.com>
References: <20240906115748.5367-2-chunhui.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906115748.5367-2-chunhui.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_152039_965569_0D9846DA 
X-CRM114-Status: GOOD (  13.05  )
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

Hi Chunhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on linus/master v6.11-rc6 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunhui-Li/module-abort-module-loading-when-sysfs-setup-suffer-errors/20240907-000002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20240906115748.5367-2-chunhui.li%40mediatek.com
patch subject: [PATCH v3 1/1] module: abort module loading when sysfs setup suffer errors
config: powerpc-asp8347_defconfig (https://download.01.org/0day-ci/archive/20240908/202409080534.y2m1URF1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080534.y2m1URF1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080534.y2m1URF1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/sysfs.c:232:86: warning: non-void function does not return a value [-Wreturn-type]
     232 | static inline int add_sect_attrs(struct module *mod, const struct load_info *info) { }
         |                                                                                      ^
   kernel/module/sysfs.c:234:87: warning: non-void function does not return a value [-Wreturn-type]
     234 | static inline int add_notes_attrs(struct module *mod, const struct load_info *info) { }
         |                                                                                       ^
   2 warnings generated.


vim +232 kernel/module/sysfs.c

   230	
   231	#else /* !CONFIG_KALLSYMS */
 > 232	static inline int add_sect_attrs(struct module *mod, const struct load_info *info) { }
   233	static inline void remove_sect_attrs(struct module *mod) { }
   234	static inline int add_notes_attrs(struct module *mod, const struct load_info *info) { }
   235	static inline void remove_notes_attrs(struct module *mod) { }
   236	#endif /* CONFIG_KALLSYMS */
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

