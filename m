Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5139ECEBF76
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 04:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Byeeoq2aXNk6ZXVhUYExI30baIpqFaEPSV7WmdVI+3A=; b=NErsqBXntTZnnvcl3YEDVnXtVS
	7N9dPoDVx/fLeN8TCuAmU7ilSeKRiGtGtt80Q1PhxtiNuMxtM9K1a11EM0R2Yd7lzSmury5S0JGDi
	Iop9En5Ae62/2FAyNRHZy5oqqerelz5xzG4Bi4XUXcBqwV/YFwubet8a7OnNaOGFoLoVGIHJp8JsX
	4spWz/iNZ3SiYVs7Oewu75F2MlShxM4ACI8B93pOK5dCVKR3w6Zk2YUMPXFZreSX56x0CshPiuzH2
	tcMqTw9CPMm+OgSuArjlU8HkYIT8XNYDIIdgUCZdAUiYAIKO1tWY+ZYwxAgeL0OL1oy0yMy3u1cr/
	AOljxmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su2GA-00000009xGX-06i3;
	Fri, 27 Sep 2024 04:07:14 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su2Ex-00000009x74-3rwl;
	Fri, 27 Sep 2024 04:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727409960; x=1758945960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cyeDaxD6Y4GV+oBDpuWeWZppdMCUa7jpzaaR05xTrfw=;
  b=JlXsfuzzNS2/SU/iBvDtqWSvp51XBYL/r7FZEJTmUc97luZaLZnqOjKd
   8AZ9xQvkgNBmAhg+6RxjtNxOgSxCQlIb0BYcX/6aq6qDYskWqGvTkkjLO
   uVCuAUXjNgCaBW+jGzAyxBFNYneFZKLSZpakUU+XGtXMQVBaMhkLqBO04
   BiA4mixfTltvL/mnkjnEPGw+ZuFwvJlhtMXf2xAsvhkQF4UUi/6qH8wY1
   1f5xXidewAFcw/6g43rewF2edDQJEUsCfkCF0bVpOf20i8fmeazZqXsrG
   xK7bYj+2J7Irk/lbEhkZ/IAsJXurxqpT8IG4uFim4xpi82QNMGKk0PHvx
   w==;
X-CSE-ConnectionGUID: 39c4nQGoTQeoGCHIBV2QVw==
X-CSE-MsgGUID: zzuYIHBhRKesu4Nbh2BKVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26674462"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26674462"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 21:05:57 -0700
X-CSE-ConnectionGUID: AzfU2nF/Ty6/ez1q2t4KCA==
X-CSE-MsgGUID: 5PxHDTPoQqOfSEGGWEmwBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72287376"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Sep 2024 21:05:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su2Ep-000LRh-2d;
	Fri, 27 Sep 2024 04:05:51 +0000
Date: Fri, 27 Sep 2024 12:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chaotian.jing@mediatek.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ulf.hansson@linaro.org, matthias.bgg@gmail.com,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] mmc: mtk-sd: Implement Host Software Queue for eMMC and
 SD Card
Message-ID: <202409271143.hRope856-lkp@intel.com>
References: <20240925113949.149655-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925113949.149655-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_210600_028390_5C49C3FD 
X-CRM114-Status: GOOD (  10.44  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11 next-20240926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/mmc-mtk-sd-Implement-Host-Software-Queue-for-eMMC-and-SD-Card/20240925-200025
base:   linus/master
patch link:    https://lore.kernel.org/r/20240925113949.149655-1-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH] mmc: mtk-sd: Implement Host Software Queue for eMMC and SD Card
config: i386-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271143.hRope856-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271143.hRope856-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271143.hRope856-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mmc_hsq_suspend
   >>> referenced by mtk-sd.c:3078 (drivers/mmc/host/mtk-sd.c:3078)
   >>>               drivers/mmc/host/mtk-sd.o:(msdc_runtime_suspend) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mmc_hsq_resume
   >>> referenced by mtk-sd.c:3112 (drivers/mmc/host/mtk-sd.c:3112)
   >>>               drivers/mmc/host/mtk-sd.o:(msdc_runtime_resume) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

