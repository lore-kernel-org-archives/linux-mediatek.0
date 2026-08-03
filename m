Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45F1C55184
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 22:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/nq0L+HCBu/VVlNCjhE/XdgRdWy3/vgJ4mB7nFnRLo=; b=xe/dMjTFdRqlCV6kdIur8mk4I3
	yhhSo822jJyEZVZTj74uoTgLKpqVAKHFjVAtch62aK2iZuMNULOhnCWAZwPa4UDa/4v7wTUaRHqMo
	NLjyvSJgtO1QFQIlxJr9XO47IAZA1kXeYfN63gib5aBdzqY+jGg4H6IEGYI/l7/NJCBOMBMgRs+Mz
	Ir2Ls4wUQUtvmTZ+oNxyMIdpZkwcENaj+dVcVviL3D/IULaHN1nJPMJapWdVxNQwtbtc3LD5jqTe+
	k6uVJyaxvwisruJd1pvEZrhesqxi1pO9FH3zey0ta0pqH0dVzeytE2e7D7cKKu11usUDfm+dbCk8T
	vOAUJ5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1HB-00000000c4c-1ALz;
	Mon, 03 Aug 2026 22:36:53 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1H8-00000000c4H-0Atb
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 22:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785796610; x=1817332610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SMhjVdU2ZDAmJkhf9Tg7h3l0ADU6HH3S2XK+03kIQNw=;
  b=Nzd5nc3R+CaOSqWaJ3toWoRZ01lsZ16tuIRMjDEmPTcUOk9Nh9rFKMHP
   tVpjuS10PAN3ZFjnBeScMIl8TstTzhCw32TrGRnrOy65KFLyWkX7X1SjX
   caO+gHNLNfJ3zsoJ88RbWN4VHTIVnvVkXkWKwkw+d4hDHBq5rwtSqNtTC
   Ma161qZdxorOPSm03xrv4SwrIg87JJY9BpsYeyIhNNlS1jEtQ4ycqSJxL
   gD9xvHGczSSFJ/MUs+P8EiA7ymQ48gwpHHB+BGn8tei2A2vgC1tMCl74i
   RSZ9DsFpOvCD6uafMyx8Q5dVqIv7YNpbhvHYxjpUNBDY3RxK670hOkVNa
   w==;
X-CSE-ConnectionGUID: c8+Xr+oPQEe75GlrQDSWJA==
X-CSE-MsgGUID: h2VYf7ETT36wWlLtrMvrqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85474329"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="85474329"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 15:36:49 -0700
X-CSE-ConnectionGUID: Mzxjk8tvTWqrXS+MdLLxUA==
X-CSE-MsgGUID: /gGtqyWdQXaebCJpfJmvfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="263324267"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Aug 2026 15:36:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr1H2-000000008AD-0x9z;
	Mon, 03 Aug 2026 22:36:44 +0000
Date: Tue, 4 Aug 2026 06:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: JB Tsai <jb.tsai@mediatek.com>, nbd@nbd.name, lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Sean.Wang@mediatek.com,
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
	litien.chang@mediatek.com, Charlie-cy.Wu@mediatek.com,
	jb.tsai@mediatek.com
Subject: Re: [PATCH] wifi: mt76: connac3: implement 6GHz power type detection
 and dynamic CLC filtering
Message-ID: <202608040641.uKGpvScD-lkp@intel.com>
References: <20260724085103.3155942-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724085103.3155942-1-jb.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_153650_116830_FFA6323A 
X-CRM114-Status: GOOD (  11.15  )
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

Hi JB,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on next-20260803]
[cannot apply to wireless/main linus/master v7.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/JB-Tsai/wifi-mt76-connac3-implement-6GHz-power-type-detection-and-dynamic-CLC-filtering/20260803-215116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260724085103.3155942-1-jb.tsai%40mediatek.com
patch subject: [PATCH] wifi: mt76: connac3: implement 6GHz power type detection and dynamic CLC filtering
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608040641.uKGpvScD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040641.uKGpvScD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608040641.uKGpvScD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/main.c: In function 'mt7925_set_sar_specs':
>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:1986:15: error: too few arguments to function 'mt7925_mcu_set_clc'
    1986 |         err = mt7925_mcu_set_clc(dev, dev->mt76.alpha2,
         |               ^~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/mediatek/mt76/mt7925/main.c:10:
   drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h:387:5: note: declared here
     387 | int mt7925_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
         |     ^~~~~~~~~~~~~~~~~~


vim +/mt7925_mcu_set_clc +1986 drivers/net/wireless/mediatek/mt76/mt7925/main.c

c948b5da6bbec74 Deren Wu    2023-09-18  1978  
c948b5da6bbec74 Deren Wu    2023-09-18  1979  static int mt7925_set_sar_specs(struct ieee80211_hw *hw,
c948b5da6bbec74 Deren Wu    2023-09-18  1980  				const struct cfg80211_sar_specs *sar)
c948b5da6bbec74 Deren Wu    2023-09-18  1981  {
c948b5da6bbec74 Deren Wu    2023-09-18  1982  	struct mt792x_dev *dev = mt792x_hw_dev(hw);
c948b5da6bbec74 Deren Wu    2023-09-18  1983  	int err;
c948b5da6bbec74 Deren Wu    2023-09-18  1984  
c948b5da6bbec74 Deren Wu    2023-09-18  1985  	mt792x_mutex_acquire(dev);
8a27c5c764040fb Jared.Huang 2026-06-17 @1986  	err = mt7925_mcu_set_clc(dev, dev->mt76.alpha2,
8a27c5c764040fb Jared.Huang 2026-06-17  1987  			 dev->country_ie_env);
8a27c5c764040fb Jared.Huang 2026-06-17  1988  	if (err < 0)
8a27c5c764040fb Jared.Huang 2026-06-17  1989  		goto out;
8a27c5c764040fb Jared.Huang 2026-06-17  1990  
c948b5da6bbec74 Deren Wu    2023-09-18  1991  	err = mt7925_set_tx_sar_pwr(hw, sar);
c948b5da6bbec74 Deren Wu    2023-09-18  1992  
8a27c5c764040fb Jared.Huang 2026-06-17  1993  out:
8a27c5c764040fb Jared.Huang 2026-06-17  1994  	mt792x_mutex_release(dev);
c948b5da6bbec74 Deren Wu    2023-09-18  1995  	return err;
c948b5da6bbec74 Deren Wu    2023-09-18  1996  }
c948b5da6bbec74 Deren Wu    2023-09-18  1997  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

