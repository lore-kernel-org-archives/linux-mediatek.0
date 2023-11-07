Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7244C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 21:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRDQT/Gj38B5WnfPsc14jzWtmSEXk54MQWGWxLyTCHY=; b=b8jkW++NKyH5wgj/jdyPi8v2WN
	wGSW6sVF1sOPNWbu+TOgePNZKxEiF0B3pZCN8Ke3hPvetoHhMO3EHt8KpnD0MZ9xSJXJdQnctDkjM
	jeFkJzJHLljmngckuY2neW3CePHE0Hri1fss2M9laOGHyiTh/6ivsFNTXBT9q7houHjwZHihV71IM
	0qsqcWUZ4/FZ5E04HlZyFF+JFnsx3D1ooZ+dhwuVVLHwe2Fl1uVt/gc9cH6wuwN/gfqhb/+X/LRAG
	KPprSULB+JiwCsFHFwmZ/MFYXfJzOXDwu6ExP8t7jYJ2Rzph2qWM3dL5+L4NecK0P7/BYFXN+MJcJ
	xfxQdn3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Tx7-002TAA-0q;
	Tue, 07 Nov 2023 21:49:41 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Tx3-002T9U-1Q
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 21:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699393777; x=1730929777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0KHj1k7qfeW+W1ip/XseMAhArMjz1QbT3cyHL68ABYE=;
  b=VDjKb6A9g9nieTkYWuJIkemClygqFdmFkGJZHFl7xY/EqUC36ZUkVad5
   8Ek0/YsY1OpS9jSlTha/ULvSVNcUoOAgddrTnG1kVc6+KnJG8dqIqDqQE
   zB+BUi3HM07NAbis4TymtisfqMUfRdKbLSbU2sIlRpOVDXPLf5Ggjoto3
   BZSJIzdaN4wtG8XEmd3h+PKfWgDclmJZi810FjyExjiwK/NYWjZ5IH2W0
   EyoWVzVU/e+WP7YG9lSOWQj7/1CUcY+FmamWJK6+EiPzA3+3xU2rkxtGi
   w2G4ZiopqSqBoTu2PGTmKx19QsOx0bJKmpGMglQc4FDJFhR5wDWhtQzjc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="393552993"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="393552993"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 13:49:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="936297183"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="936297183"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Nov 2023 13:49:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Twu-0007Pa-0C;
	Tue, 07 Nov 2023 21:49:28 +0000
Date: Wed, 8 Nov 2023 05:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael-CY Lee <michael-cy.lee@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes@sipsolutions.net>,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Michael-CY Lee <michael-cy.lee@mediatek.com>
Subject: Re: [PATCH 1/2] wifi: mac80211: Add utilities for converting op_class
Message-ID: <202311080415.70MyjizQ-lkp@intel.com>
References: <20231106073301.7351-1-michael-cy.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106073301.7351-1-michael-cy.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_134937_605727_D13A3DDF 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Michael-CY,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.6 next-20231107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-CY-Lee/wifi-mac80211-Refactor-STA-CSA-parsing-flow/20231106-161059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20231106073301.7351-1-michael-cy.lee%40mediatek.com
patch subject: [PATCH 1/2] wifi: mac80211: Add utilities for converting op_class
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231108/202311080415.70MyjizQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080415.70MyjizQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080415.70MyjizQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/wireless/util.c:2039:11: warning: variable 'offset' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           else if (control_freq >= 5180)
                    ^~~~~~~~~~~~~~~~~~~~
   net/wireless/util.c:2041:2: note: uninitialized use occurs here
           offset /= 20;
           ^~~~~~
   net/wireless/util.c:2039:7: note: remove the 'if' if its condition is always true
           else if (control_freq >= 5180)
                ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/util.c:2025:26: note: initialize the variable 'offset' to silence this warning
           u32 control_freq, offset;
                                   ^
                                    = 0
   1 warning generated.


vim +2039 net/wireless/util.c

  2019	
  2020	bool ieee80211_operating_class_to_center_freq(u8 operating_class,
  2021						      struct ieee80211_channel *chan,
  2022						      u32 *center_freq1,
  2023						      u32 *center_freq2)
  2024	{
  2025		u32 control_freq, offset;
  2026		enum nl80211_band band;
  2027	
  2028		control_freq = chan->center_freq;
  2029		if (!ieee80211_operating_class_to_band(operating_class, &band))
  2030			return false;
  2031	
  2032		if (band != chan->band)
  2033			return false;
  2034	
  2035		if (control_freq >= 5955)
  2036			offset = control_freq - 5955;
  2037		else if (control_freq >= 5745)
  2038			offset = control_freq - 5745;
> 2039		else if (control_freq >= 5180)
  2040			offset = control_freq - 5180;
  2041		offset /= 20;
  2042	
  2043		*center_freq2 = 0;
  2044		switch (operating_class) {
  2045		case 81:  /* 2 GHz band; 20 MHz; channels 1..13 */
  2046		case 82:  /* 2 GHz band; 20 MHz; channel 14 */
  2047		case 115: /* 5 GHz band; 20 MHz; channels 36,40,44,48 */
  2048		case 118: /* 5 GHz band; 20 MHz; channels 52,56,60,64 */
  2049		case 121: /* 5 GHz band; 20 MHz; channels 100..144 */
  2050		case 124: /* 5 GHz band; 20 MHz; channels 149,153,157,161 */
  2051		case 125: /* 5 GHz band; 20 MHz; channels 149..177 */
  2052		case 131: /* 6 GHz band; 20 MHz; channels 1..233*/
  2053		case 136: /* 6 GHz band; 20 MHz; channel 2 */
  2054			*center_freq1 = control_freq;
  2055			return true;
  2056		case 83:  /* 2 GHz band; 40 MHz; channels 1..9 */
  2057		case 116: /* 5 GHz band; 40 MHz; channels 36,44 */
  2058		case 119: /* 5 GHz band; 40 MHz; channels 52,60 */
  2059		case 122: /* 5 GHz band; 40 MHz; channels 100,108,116,124,132,140 */
  2060		case 126: /* 5 GHz band; 40 MHz; channels 149,157,165,173 */
  2061			*center_freq1 = control_freq + 10;
  2062			return true;
  2063		case 84:  /* 2 GHz band; 40 MHz; channels 5..13 */
  2064		case 117: /* 5 GHz band; 40 MHz; channels 40,48 */
  2065		case 120: /* 5 GHz band; 40 MHz; channels 56,64 */
  2066		case 123: /* 5 GHz band; 40 MHz; channels 104,112,120,128,136,144 */
  2067		case 127: /* 5 GHz band; 40 MHz; channels 153,161,169,177 */
  2068			*center_freq1 = control_freq - 10;
  2069			return true;
  2070		case 132: /* 6 GHz band; 40 MHz; channels 1,5,..,229*/
  2071			*center_freq1 = control_freq + 10 - (offset & 1) * 20;
  2072			return true;
  2073		case 128: /* 5 GHz band; 80 MHz; channels 36..64,100..144,149..177 */
  2074			*center_freq1 = control_freq + 30 - (offset & 3) * 20;
  2075			return true;
  2076		case 130: /* 5 GHz band; 80+80 MHz; channels 36..64,100..144,149..177 */
  2077			/* TODO How to know the center_freq2 of 80+80 MHz?*/
  2078			*center_freq1 = 0;
  2079			return false;
  2080		case 133: /* 6 GHz band; 80 MHz; channels 1,5,..,229 */
  2081			*center_freq1 = control_freq + 30 - (offset & 3) * 20;
  2082			return true;
  2083		case 129: /* 5 GHz band; 160 MHz; channels 36..64,100..144,149..177 */
  2084			*center_freq1 = control_freq + 70 - (offset & 7) * 20;
  2085			return true;
  2086		case 134: /* 6 GHz band; 160 MHz; channels 1,5,..,229 */
  2087			*center_freq1 = control_freq + 70 - (offset & 7) * 20;
  2088			return true;
  2089		case 135: /* 6 GHz band; 80+80 MHz; channels 1,5,..,229 */
  2090			/* TODO How to know the center_freq2 of 80+80 MHz?*/
  2091			*center_freq1 = 0;
  2092			return false;
  2093		case 137: /* 6 GHz band; 320 MHz; channels 1,5,..,229 */
  2094			/* TODO it's 320 MHz-1 or 320 MHz-2 channelization? */
  2095			*center_freq1 = 0;
  2096			return false;
  2097		default:
  2098			return false;
  2099		}
  2100	}
  2101	EXPORT_SYMBOL(ieee80211_operating_class_to_center_freq);
  2102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

