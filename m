Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516F1C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jun 2025 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kf40PxT0IJX/WJz44JiFx7wbhkUQvB3T9l8pvppweA=; b=LdnKZVDzfgH/hxX7KvQLv9EYBj
	6VgePu31B4qzk/97jAeBVuLEbTkgak41WEofUOe99BgWpXdb5h8haj+iF/kYePoMFL2kE+HrJpNFP
	Qu8s0/Z0Fc16axp2KTBvc/XsH3kRMY1ih/uJOQtseVWC9SivPgFikysNZ5zB/WGepzHMguiLDRKWN
	Hlokeu/XNMSlfXOLQCDqu1Zle89aZrbbqaw+rQFRCcIDTUWjGwph4lRvkaP3vyYZCw1FlsATpzVAB
	3ArBYT1hdeWSmOcGmjD3HiDPc7ZJZZv6+2nCBd/WMB2SYoqLJuf/L8yU7AjcFCZ4iXY0GqlYH+UVK
	0Ykyrnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBvp-00000006yJ2-31SF;
	Tue, 24 Jun 2025 22:15:57 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBkY-00000006wMy-1KRX
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Jun 2025 22:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750802658; x=1782338658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zu3c4TEciOFpYKhtQCdJJWXJ3340BlRL7VaZjg54aAQ=;
  b=exSUw6RWfnWE04Cm4/tb+YpEbo3gYvmwO4kzJdf7ECIX9AZIJiMFecN9
   Yd9LMbexKlXcuTdPapyT3WHVKnrobtUSTrhVgMNA78pVDiImU15ztnkz4
   XzOrUlcgF4h1+njgN4xmSWCABZXgPa9az4/PK0fcn3uUk/6fYwso31SU5
   4JMB+2K2S+J0f+qcCZPO8ElLCT5rgYUofnsFgVZ1PPaL/lXkLPx7e6EbH
   +mwmPqY7CxGZfCuaucgalX+AlB8UCxZv+L615uJpaXTMcEIUp3bxvxjoH
   kxTAGki4/tlm/dWficsxVsFv1BZKqvR40GxA8P2pHgrg6isJOGepFUq23
   Q==;
X-CSE-ConnectionGUID: kQFfRyO9T5CUl7PKBrXbxQ==
X-CSE-MsgGUID: jyjaGpwcQN6R+CdT9JYKHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56844358"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="56844358"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 15:04:16 -0700
X-CSE-ConnectionGUID: 5Ozi9P3WTIOAKzMKDUEs1g==
X-CSE-MsgGUID: qqIAdIHAT9aizBTGHjWQcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="183076432"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jun 2025 15:04:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUBkP-000SYU-2w;
	Tue, 24 Jun 2025 22:04:09 +0000
Date: Wed, 25 Jun 2025 06:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, nbd@nbd.name,
	lorenzo@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	deren.wu@mediatek.com, Sean.Wang@mediatek.com,
	Leon.Yen@mediatek.com, Michael.Lo@mediatek.com,
	allan.wang@mediatek.com, Eric-SY.Chang@mediatek.com,
	km.lin@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
	Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: Limit the concurrent STA and SoftAP to
 operate on the same channel
Message-ID: <202506250512.Q0I4znsF-lkp@intel.com>
References: <20250619112005.2071110-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619112005.2071110-1-mingyen.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_150418_400903_D30A576B 
X-CRM114-Status: GOOD (  10.72  )
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

Hi Mingyen,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.16-rc3 next-20250624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingyen-Hsieh/wifi-mt76-Limit-the-concurrent-STA-and-SoftAP-to-operate-on-the-same-channel/20250619-192503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250619112005.2071110-1-mingyen.hsieh%40mediatek.com
patch subject: [PATCH] wifi: mt76: Limit the concurrent STA and SoftAP to operate on the same channel
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250625/202506250512.Q0I4znsF-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250512.Q0I4znsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250512.Q0I4znsF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt792x_core.c:84:3: error: initializer element is not a compile-time constant
                   if_comb_chanctx_mcc[0],
                   ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +84 drivers/net/wireless/mediatek/mt76/mt792x_core.c

    82	
    83	static const struct ieee80211_iface_combination if_comb_chanctx[] = {
  > 84			if_comb_chanctx_mcc[0],
    85			if_comb_chanctx_scc[0],
    86	};
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

