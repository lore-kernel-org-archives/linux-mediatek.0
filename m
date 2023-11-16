Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F85C54E76
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 22:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThZUZys4xqWnyrtARqtttkyXbd2cylsx24QMCKNYQk0=; b=YTcWfvZmCWnA4RhcE/3ARttE8H
	uLmRPd4jjnFHBd5Tr0EWDhmzx15y6YKqkhYHhOqYvQW0+sBvMyZEK1FvGiV1zMQpi4bU/fTe6HXHK
	OZ31nKpbgIpuKv+lil8KtIaFzWcZHhlmphVV065HJ4Qn7bLJbykwFRNXhzLqh9TeZz2SjVW6R2mCz
	AiUGZHfxrnv1+BitGLpxMQmLHn5wzkAd/p+QL8r2YZra7gdWKWW3RJ2YID2ohilk7k/rlBdcEDzXp
	mgXCvgcBDQMayMBRljwpVUo8v/zc7YuD3TnoTbdQsJXUUTHaOTViGzWz1tZoWcTDwQri292Rs+OFW
	G/KA6okQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ky7-00555o-16;
	Thu, 16 Nov 2023 22:36:15 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ky3-00553z-1b;
	Thu, 16 Nov 2023 22:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700174171; x=1731710171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PCo7Q6PwYdHeBIXeCSZfw9NiH4RVxY6/REL0RfEZyvU=;
  b=d2rRsvhdylATbGX8yZIU3hyD4lgLS8xp8R7EGhkY6KD8tbxI9hKGyQ94
   mzgqQxkhUBZt3wzgDaqeHLw5kBRSvS/17/iW2/rtfRYpgVdUIevagnkBs
   DohpnYi8uxw0wEQKa7m+kLS8p4FI6u5Ai0YTMxxOdYOkkwIMJcfDMA1oi
   qg+ahSYVL/czj9OTLruWzef/Qffcz97J7TBb+cWNVItt0y2URuBcxX6WO
   X+A+N+L8AY2gkmIxsGP1K9nZoVbSPmSHn+bip9CRH3ZE5ccntmqgn3ZHo
   vDFnSAr3/oPBVfxpKmg+v2jKC0MDBy3Dp2l6f08hZZ9Dw0+AMvwg9GnCR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4323655"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="4323655"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 14:36:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="938977790"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="938977790"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Nov 2023 14:36:00 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3kxp-00026s-2X;
	Thu, 16 Nov 2023 22:35:57 +0000
Date: Fri, 17 Nov 2023 06:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Jade Shih <jades.shih@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Willix Yeh <chi-shen.yeh@mediatek.com>,
	Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: Re: [PATCH v7 03/16] virt: geniezone: Add GenieZone hypervisor driver
Message-ID: <202311170638.aouOEHi7-lkp@intel.com>
References: <20231116152756.4250-4-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116152756.4250-4-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_143611_631938_F9B3229C 
X-CRM114-Status: GOOD (  13.90  )
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

Hi Yi-De,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc1 next-20231116]
[cannot apply to arm64/for-next/core robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20231116-233442
base:   linus/master
patch link:    https://lore.kernel.org/r/20231116152756.4250-4-yi-de.wu%40mediatek.com
patch subject: [PATCH v7 03/16] virt: geniezone: Add GenieZone hypervisor driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231117/202311170638.aouOEHi7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311170638.aouOEHi7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311170638.aouOEHi7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/geniezone/vm.c:25: warning: Function parameter or member 'a0' not described in 'gzvm_hypcall_wrapper'
>> arch/arm64/geniezone/vm.c:25: warning: Function parameter or member 'a1' not described in 'gzvm_hypcall_wrapper'
>> arch/arm64/geniezone/vm.c:25: warning: Function parameter or member 'a2' not described in 'gzvm_hypcall_wrapper'
>> arch/arm64/geniezone/vm.c:25: warning: Function parameter or member 'a3' not described in 'gzvm_hypcall_wrapper'
>> arch/arm64/geniezone/vm.c:25: warning: Function parameter or member 'a4' not described in 'gzvm_hypcall_wrapper'
>> arch/arm64/geniezone/vm.c:25: warning: Function parameter or member 'a5' not described in 'gzvm_hypcall_wrapper'
>> arch/arm64/geniezone/vm.c:25: warning: Function parameter or member 'a6' not described in 'gzvm_hypcall_wrapper'
>> arch/arm64/geniezone/vm.c:25: warning: Function parameter or member 'a7' not described in 'gzvm_hypcall_wrapper'


vim +25 arch/arm64/geniezone/vm.c

    12	
    13	/**
    14	 * gzvm_hypcall_wrapper() - the wrapper for hvc calls
    15	 * @a0-a7: arguments passed in registers 0 to 7
    16	 * @res: result values from registers 0 to 3
    17	 *
    18	 * Return: The wrapper helps caller to convert geniezone errno to Linux errno.
    19	 */
    20	int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
    21				 unsigned long a2, unsigned long a3,
    22				 unsigned long a4, unsigned long a5,
    23				 unsigned long a6, unsigned long a7,
    24				 struct arm_smccc_res *res)
  > 25	{
    26		arm_smccc_hvc(a0, a1, a2, a3, a4, a5, a6, a7, res);
    27		return gzvm_err_to_errno(res->a0);
    28	}
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

