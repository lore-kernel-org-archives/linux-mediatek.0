Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82263E77185
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2024 04:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbLDbnMkAFtIPquyuOpep8ktm6JngaE4JHx2gE4OS/g=; b=I2JTspohA9/O6iTrHZfSXizT8g
	i/sziahIxjIT+1oq3uWK022DaM9BGCLNuqH4AJKcYlDgM6hb00XTFXyNjCoTy6XuPq9COdfXAlDGO
	EDG46HkF44ZiJBh1fMSj3ydCAiVGbspdbHmn7fDNL+UO/DkPqzKeVwKYf+szLcwnvEsoHcUy9Bcjb
	OCW4P4Bj/KAYFkHAJ8Mc3/lufUwpmq7rAJ4P7fz3BPuPmDmIpo4prfY6bg3NZE9WNMR/qVtTgSzLA
	PCTJDHv0BFDjTwyCklqqFwA0ut7MHWZ5gwpEFbf+Rrox0seeOLe9bpnDjVvW2uQh7tSRZiFWpiMYV
	HGDVLxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLarW-0000000Gtpd-28FZ;
	Thu, 12 Dec 2024 04:31:42 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLarT-0000000GtoT-0IjT
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Dec 2024 04:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733977899; x=1765513899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5YZA2j3sUfOMpP0SPfYfSizTKfq/iiwV6Ec1/cBNMr4=;
  b=bETHJ5eakPBDECGWcam3PkyQy2LPLPZr8ZqQFQgr4uh9IN7/Ssv6nuZN
   0lWybgwFXHoaROt34M88Cavds50vZ/kXmnquvSwQqiVldWgGAA7Tr0EwB
   JPaUCXiefvGAlMcUQ1KpSylazA69aeQd3pwCECveRJk5G8L3AYwle2qdu
   OkJIFaSnyhDxe/9VeK5gfKSvdFnxk6lMWAAyuChf1ITHNAJ4NNr2hXoPI
   uO48XFDrc+VfYJ705uhWVQOghNUL/FA4NW8W72JnxSqq9NMILoi6a+vFF
   n0u9/pa/lKs2OuXpr6JXAbg7iBiCaPk9lJ8K9Ant01jIiGnec+QOpm4w3
   Q==;
X-CSE-ConnectionGUID: sTkSNrIrQaWAguXeTb0Jvw==
X-CSE-MsgGUID: KNzVXgNFSMCIUz4v54T34g==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34253918"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34253918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:31:37 -0800
X-CSE-ConnectionGUID: y7HqZ6/nRhmgxnByBUnGiw==
X-CSE-MsgGUID: iZW5l9gJRBqFExCC25+png==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="101114606"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2024 20:31:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLarN-0007Qr-0n;
	Thu, 12 Dec 2024 04:31:33 +0000
Date: Thu, 12 Dec 2024 12:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: sean.wang@kernel.org, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, sean.wang@mediatek.com,
	deren.wu@mediatek.com, mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 12/17] wifi: mt76: mt7925: Update
 mt7925_unassign_vif_chanctx for per-link BSS
Message-ID: <202412121200.voBerw6W-lkp@intel.com>
References: <20241211011926.5002-12-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211011926.5002-12-sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_203139_157307_A74BD519 
X-CRM114-Status: GOOD (  10.69  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sean-wang-kernel-org/wifi-mt76-mt7925-Fix-incorrect-MLD-address-in-bss_mld_tlv-for-MLO-support/20241211-092359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20241211011926.5002-12-sean.wang%40kernel.org
patch subject: [PATCH 12/17] wifi: mt76: mt7925: Update mt7925_unassign_vif_chanctx for per-link BSS
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20241212/202412121200.voBerw6W-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121200.voBerw6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121200.voBerw6W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/main.c: In function 'mt7925_unassign_vif_chanctx':
>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:2082:36: warning: variable 'pri_link_conf' set but not used [-Wunused-but-set-variable]
    2082 |         struct ieee80211_bss_conf *pri_link_conf;
         |                                    ^~~~~~~~~~~~~


vim +/pri_link_conf +2082 drivers/net/wireless/mediatek/mt76/mt7925/main.c

621e9e22b8d031 Sean Wang      2024-07-06  2073  
621e9e22b8d031 Sean Wang      2024-07-06  2074  static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
621e9e22b8d031 Sean Wang      2024-07-06  2075  					struct ieee80211_vif *vif,
621e9e22b8d031 Sean Wang      2024-07-06  2076  					struct ieee80211_bss_conf *link_conf,
621e9e22b8d031 Sean Wang      2024-07-06  2077  					struct ieee80211_chanctx_conf *ctx)
621e9e22b8d031 Sean Wang      2024-07-06  2078  {
621e9e22b8d031 Sean Wang      2024-07-06  2079  	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
621e9e22b8d031 Sean Wang      2024-07-06  2080  	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
621e9e22b8d031 Sean Wang      2024-07-06  2081  	struct mt792x_dev *dev = mt792x_hw_dev(hw);
621e9e22b8d031 Sean Wang      2024-07-06 @2082  	struct ieee80211_bss_conf *pri_link_conf;
621e9e22b8d031 Sean Wang      2024-07-06  2083  	struct mt792x_bss_conf *mconf;
621e9e22b8d031 Sean Wang      2024-07-06  2084  
621e9e22b8d031 Sean Wang      2024-07-06  2085  	mutex_lock(&dev->mt76.mutex);
621e9e22b8d031 Sean Wang      2024-07-06  2086  
621e9e22b8d031 Sean Wang      2024-07-06  2087  	if (ieee80211_vif_is_mld(vif)) {
621e9e22b8d031 Sean Wang      2024-07-06  2088  		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
621e9e22b8d031 Sean Wang      2024-07-06  2089  		pri_link_conf = mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
621e9e22b8d031 Sean Wang      2024-07-06  2090  
621e9e22b8d031 Sean Wang      2024-07-06  2091  		if (vif->type == NL80211_IFTYPE_STATION &&
621e9e22b8d031 Sean Wang      2024-07-06  2092  		    mconf == &mvif->bss_conf)
ef9f0dc93583f5 Ming Yen Hsieh 2024-12-10  2093  			mt7925_mcu_add_bss_info(&dev->phy, NULL, link_conf,
621e9e22b8d031 Sean Wang      2024-07-06  2094  						NULL, false);
621e9e22b8d031 Sean Wang      2024-07-06  2095  	} else {
621e9e22b8d031 Sean Wang      2024-07-06  2096  		mconf = &mvif->bss_conf;
621e9e22b8d031 Sean Wang      2024-07-06  2097  	}
621e9e22b8d031 Sean Wang      2024-07-06  2098  
621e9e22b8d031 Sean Wang      2024-07-06  2099  	mctx->bss_conf = NULL;
621e9e22b8d031 Sean Wang      2024-07-06  2100  	mconf->mt76.ctx = NULL;
621e9e22b8d031 Sean Wang      2024-07-06  2101  	mutex_unlock(&dev->mt76.mutex);
621e9e22b8d031 Sean Wang      2024-07-06  2102  }
621e9e22b8d031 Sean Wang      2024-07-06  2103  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

