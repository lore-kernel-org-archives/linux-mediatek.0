Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAC3D2ECF7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRsyVXo+utfOV7xUHj3FwKRXwOPzHU3LO1yl6vqb7DY=; b=p29wODEB8y3B5WIokNxbLMaiSm
	vl5VjED0HuGGzeoUiTiNzMyb+Y+8/4R8g9c75GfgUFZx9+Qf2gusNKnBWzq5bc9A5BeIcvxb+w0v+
	dIHCy+pVpSxzQL4XwkXvOFC0POOUlzGpyttZLngwTrvMDNuCYDVoLTxt8dwd/nFyWtfpbS/cqvnC+
	nIbpHoSr4kOJHsetxldDMynb6et2mKV/L3lXA2I80SiCJTkKBVH4ezYz8Q8VUjMB/orX+MjRue78Z
	0YHsIuNwLfBkpb9BEQSzRpdKKiJO83esF4UnhSgtk7HpZQCJWHYKAxeNpUhPOAo6Uc7M+1Rt/45aT
	RjYSMm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBlO-00000003urQ-0d13;
	Tue, 20 Jan 2026 13:27:18 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBlL-00000003ur0-0T1y
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 13:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768915634; x=1800451634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zliMfnqN7+4qWXkakteLMnL1rqDZXpRuUMDYk9dV31A=;
  b=daGrMGhhfDoXYsw72hwnb0zmoftMFvcPLGoGRMVD/uuInE4EHhtMTydZ
   AAt3c7mFC8q4uKTVb8SI6rk+8ZCod9GIloX2QPGaHpcAacdLFwZFniWKU
   C7WXbtqgZkzU0DHmI4BGwQvxC9flTiH+YE89Y2kUuGz85Mgn1B7x0X2lg
   7Kdx5PjUHi8p2M9AC3jiTlsk+426BkUQyhqjWQjs/NbNied0TjBE4WMPo
   NxW2owjvupI1Ni2h4GJOPjT/1buaTOUay0XGrHJc+4EQL5QckSLTiOHFP
   zLpJuKHQnmAYA9FCXw6CsavTVAvZpEaafCyL+P1iFHahUHB0WLzAS8+XS
   g==;
X-CSE-ConnectionGUID: SEeyI5vZSOylyehUFrHnQw==
X-CSE-MsgGUID: BH+U2P6uRuWGMfuMhMf96A==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81232155"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="81232155"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:27:12 -0800
X-CSE-ConnectionGUID: qs6DvTcrSlGaTFKGlwR8NQ==
X-CSE-MsgGUID: dy0vDc1tSN2LQyhVI9nNbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205362466"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jan 2026 05:27:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viBlB-00000000P1B-45b7;
	Tue, 20 Jan 2026 13:27:05 +0000
Date: Tue, 20 Jan 2026 21:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Zac <zac@zacbowling.com>, sean.wang@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	deren.wu@mediatek.com, kvalo@kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org, lorenzo@kernel.org, nbd@nbd.name,
	ryder.lee@mediatek.com, sean.wang@mediatek.com,
	stable@vger.kernel.org, linux@frame.work, zbowling@gmail.com,
	Zac Bowling <zac@zacbowling.com>
Subject: Re: [PATCH 11/11] wifi: mt76: mt7925: fix ROC deadlocks and race
 conditions
Message-ID: <202601202144.ee4DM9Pz-lkp@intel.com>
References: <20260120062854.126501-12-zac@zacbowling.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120062854.126501-12-zac@zacbowling.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_052715_241435_609E2D18 
X-CRM114-Status: GOOD (  12.90  )
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
config: i386-randconfig-015-20260120 (https://download.01.org/0day-ci/archive/20260120/202601202144.ee4DM9Pz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601202144.ee4DM9Pz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601202144.ee4DM9Pz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:611:5: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     610 |                                 "mt7925: ROC throttled, %lu ms remaining\n",
         |                                                         ~~~
         |                                                         %u
     611 |                                 jiffies_to_msecs(throttle));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:662:5: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     661 |                                 "mt7925: MLO ROC throttled, %lu ms remaining\n",
         |                                                             ~~~
         |                                                             %u
     662 |                                 jiffies_to_msecs(throttle));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   2 warnings generated.


vim +611 drivers/net/wireless/mediatek/mt76/mt7925/main.c

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
   610					"mt7925: ROC throttled, %lu ms remaining\n",
 > 611					jiffies_to_msecs(throttle));
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

