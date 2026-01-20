Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30140D2ED0F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 11:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngMgxMsuYAaXWM2iLgCbEERMX7Daf83dQ+u3Z9+kh6Q=; b=RTTxhMyK6f4UaJRyLZTZmakANt
	da5xEBtd3w4z3kgMY1NlqzTNrO7JRWoVqZ4JBIpcCPcrR0lBY3JCeDKdAIRRc5CAxD8LI9dUQaAgu
	lj2fqbYvgyAI7U0jq5UVvFmePjAIz99odmaGM/UPseZ/VE5U2mc4cyByumxX/kwJ67zkRkv6tp/ZD
	EFSW7kX3X7lS1C/fKDP7b127NUPJqlTzsT8j/lfIYMPBfKmR1RIADdinbvfA+G2gsSG7t8z9OEY2z
	KIw61KCGXPPsvvLCgw8RupItRgCDBHpy6jpb538v7XhwM6xiQLJ+8wrEIPUnADEL/PSlvH5NMHeVj
	v3FuSStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA8a-00000003jiI-0NuL;
	Tue, 20 Jan 2026 11:43:08 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA8X-00000003jhi-067l
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 11:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768909385; x=1800445385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2jNhiXUBMyyLdyxAs9vQmmaOOOBC6WVaq/BZF27U5XY=;
  b=SzevgQPefGS9cp4gKZilPvI9lqqR5N/dm3eOmH8od2Jd5OIQhOfZZ+LZ
   w5qkpGd4g2F+NZBrAP4q7et0hw1JWRnDZcbaoax5SYW/5ZUdu947tCrv2
   SazkFnSe2AoIKl8k9Z7J6RACftg8NataQWRfHPhUY0/7rCKTfjwrHTYTU
   mO2wrF4vnX7C5cPqiciQMJdgxgPcKgQU5Uevu61I0NgY0vemVjB4yqRQa
   LcFFFIZ0GuXLf01hIAsHAxN2tLq61Jv4exsHMdzWsRUikFSAWYQ0aIlzg
   lsikojrVXb9OqWuSYDpprzxFdTNcUgZ3XR38KTBVUYMK6+l2QowRSmB+e
   Q==;
X-CSE-ConnectionGUID: Jw5+PdHmQsiyc/HptxBtdw==
X-CSE-MsgGUID: UETa4L3WQJCs6mXlquaVjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69315723"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="69315723"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 03:43:04 -0800
X-CSE-ConnectionGUID: eseWj3+4SPiBSrByS7Tl+Q==
X-CSE-MsgGUID: bOuQi7P2T3SC8cwIMbNjpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205256698"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jan 2026 03:43:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viA8P-00000000OuH-0ZsO;
	Tue, 20 Jan 2026 11:42:57 +0000
Date: Tue, 20 Jan 2026 19:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: Zac <zac@zacbowling.com>, sean.wang@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, deren.wu@mediatek.com, kvalo@kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org, lorenzo@kernel.org, nbd@nbd.name,
	ryder.lee@mediatek.com, sean.wang@mediatek.com,
	stable@vger.kernel.org, linux@frame.work, zbowling@gmail.com,
	Zac Bowling <zac@zacbowling.com>
Subject: Re: [PATCH 11/11] wifi: mt76: mt7925: fix ROC deadlocks and race
 conditions
Message-ID: <202601201954.zxO1N1DS-lkp@intel.com>
References: <20260120062854.126501-12-zac@zacbowling.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120062854.126501-12-zac@zacbowling.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_034305_105488_D736F63C 
X-CRM114-Status: GOOD (  13.85  )
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

Hi Zac,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.19-rc6 next-20260119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zac/wifi-mt76-fix-list-corruption-in-mt76_wcid_cleanup/20260120-143842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260120062854.126501-12-zac%40zacbowling.com
patch subject: [PATCH 11/11] wifi: mt76: mt7925: fix ROC deadlocks and race conditions
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260120/202601201954.zxO1N1DS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201954.zxO1N1DS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201954.zxO1N1DS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:621,
                    from include/linux/kernel.h:31,
                    from include/linux/skbuff.h:13,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/wireless/mediatek/mt76/mt7925/main.c:4:
   drivers/net/wireless/mediatek/mt76/mt7925/main.c: In function 'mt7925_set_roc':
>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:610:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
     610 |                                 "mt7925: ROC throttled, %lu ms remaining\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:609:25: note: in expansion of macro 'dev_dbg'
     609 |                         dev_dbg(phy->dev->mt76.dev,
         |                         ^~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:610:59: note: format string is defined here
     610 |                                 "mt7925: ROC throttled, %lu ms remaining\n",
         |                                                         ~~^
         |                                                           |
         |                                                           long unsigned int
         |                                                         %u
   drivers/net/wireless/mediatek/mt76/mt7925/main.c: In function 'mt7925_set_mlo_roc':
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:661:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
     661 |                                 "mt7925: MLO ROC throttled, %lu ms remaining\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:660:25: note: in expansion of macro 'dev_dbg'
     660 |                         dev_dbg(phy->dev->mt76.dev,
         |                         ^~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:661:63: note: format string is defined here
     661 |                                 "mt7925: MLO ROC throttled, %lu ms remaining\n",
         |                                                             ~~^
         |                                                               |
         |                                                               long unsigned int
         |                                                             %u


vim +610 drivers/net/wireless/mediatek/mt76/mt7925/main.c

   592	
   593	static int mt7925_set_roc(struct mt792x_phy *phy,
   594				  struct mt792x_bss_conf *mconf,
   595				  struct ieee80211_channel *chan,
   596				  int duration,
   597				  enum mt7925_roc_req type)
   598	{
   599		unsigned long throttle;
   600		int err;
   601	
   602		/* Check rate limiting - if in backoff period, wait or return busy */
   603		throttle = mt7925_roc_throttle_check(phy);
   604		if (throttle) {
   605			/* For short backoffs, wait; for longer ones, return busy */
   606			if (throttle < msecs_to_jiffies(200)) {
   607				msleep(jiffies_to_msecs(throttle));
   608			} else {
   609				dev_dbg(phy->dev->mt76.dev,
 > 610					"mt7925: ROC throttled, %lu ms remaining\n",
   611					jiffies_to_msecs(throttle));
   612				return -EBUSY;
   613			}
   614		}
   615	
   616		/* Clear stale abort flag from previous ROC */
   617		clear_bit(MT76_STATE_ROC_ABORT, &phy->mt76->state);
   618	
   619		if (test_and_set_bit(MT76_STATE_ROC, &phy->mt76->state))
   620			return -EBUSY;
   621	
   622		phy->roc_grant = false;
   623	
   624		err = mt7925_mcu_set_roc(phy, mconf, chan, duration, type,
   625					 ++phy->roc_token_id);
   626		if (err < 0) {
   627			clear_bit(MT76_STATE_ROC, &phy->mt76->state);
   628			goto out;
   629		}
   630	
   631		if (!wait_event_timeout(phy->roc_wait, phy->roc_grant, 4 * HZ)) {
   632			mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
   633			clear_bit(MT76_STATE_ROC, &phy->mt76->state);
   634			mt7925_roc_record_timeout(phy);
   635			err = -ETIMEDOUT;
   636		} else {
   637			/* Successful ROC - reset timeout tracking */
   638			mt7925_roc_clear_timeout(phy);
   639		}
   640	
   641	out:
   642		return err;
   643	}
   644	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

