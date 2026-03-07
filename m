Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA11FC9EF8
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Mar 2026 13:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kXGlgBEjIc60NESDWgmGviynt4vpuhwBaCCS09T+9g=; b=DerY4U/rKrMSC/CIjPWrWnXcFC
	iPVTjtg2Aov1gjugNYJ8GMJE3+jOcnddDDy/AskTV+WHu6Zj8jRZFZqm+R6+20Ar7BXdHWGnmUrJc
	uUnCYfCLcMs1d11uGDUs1io2g7YutqJmaskuRWs8/yQKfnNkZjECJieIel8f1OIXwCxm+vOJIRhBt
	qppcdUdBS2r1RXZvvPIo0t1OsfuB3toOP1DXsXAfkZQNfqcSjJzzuRmP8o6DayI32aoqHTg14b5lO
	9b606WM5L9MoR/7Ous5urlqZXbIte7Dc+EDAlLmVmzcXo/kOsyPf4FZX+vzicUfjoesDiXl+bBjVj
	rifhl/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyrz7-00000005EkC-1LzD;
	Sat, 07 Mar 2026 13:46:25 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyrz0-00000005Ejn-0DQF
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Mar 2026 13:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772891178; x=1804427178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zGPmb6vDH2Bxjv88omnlCAAtIYwow0MjtkGrQBi1h/w=;
  b=JKBL0uVRUGjRZ7490zRgSK83x3SGCOuLthypYz5xhOFEVDgf5wMUwTOE
   /6IgDcATJR6I5dlX9PdQawLPPQArkGd2Cm4DWVKVAx2W3mB1etB3UeCIM
   PV8AmkbZBtra5r8uxj4WWLmVg7owtagAbYgaV+GKtrvCo/Dy+MM8WEhcR
   UHdhnpQdQgCgtopKyWO7JKN7Za62GfwphYjR9QwU7xY2fW0nbghUET1JR
   KtYiTHNb2UhwwPiu8i62AhTE5iD4RCCg8p9opH0Etx2D8E2DPS7MFh8P7
   JlsuWa1002tzeRBxopnmxTshiVv2OF7b4Wl52e0ZqyCj9YR7rbrv39hVl
   w==;
X-CSE-ConnectionGUID: PiDL9YfXROa2TCHKPZ+nLQ==
X-CSE-MsgGUID: kq8Qm3lqQ4SWEUe/a+ZbxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73883553"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73883553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 05:46:11 -0800
X-CSE-ConnectionGUID: 3raBlUHbSZOEd6CT3scGFw==
X-CSE-MsgGUID: udvbxoShSle4r4ix8DBUCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="218503184"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2026 05:46:09 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyryp-000000002UT-1Rfc;
	Sat, 07 Mar 2026 13:46:07 +0000
Date: Sat, 7 Mar 2026 14:45:43 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Wang <sean.wang@kernel.org>, nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 02/19] wifi: mt76: mt7925: pass WCID indices to
 bss_basic_tlv()
Message-ID: <202603071400.xCvjvPoG-lkp@intel.com>
References: <20260306232238.2039675-3-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306232238.2039675-3-sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_054618_148188_F66999EB 
X-CRM114-Status: GOOD (  11.08  )
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

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Wang/wifi-mt76-mt7925-pass-mlink-to-sta_amsdu_tlv/20260307-073047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260306232238.2039675-3-sean.wang%40kernel.org
patch subject: [PATCH 02/19] wifi: mt76: mt7925: pass WCID indices to bss_basic_tlv()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260307/202603071400.xCvjvPoG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071400.xCvjvPoG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071400.xCvjvPoG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/mcu.c: In function 'mt7925_mcu_add_bss_info':
>> drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:2867:13: warning: variable 'sta_wlan_idx' set but not used [-Wunused-but-set-variable]
    2867 |         u16 sta_wlan_idx;
         |             ^~~~~~~~~~~~


vim +/sta_wlan_idx +2867 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

  2856	
  2857	int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
  2858				    struct ieee80211_chanctx_conf *ctx,
  2859				    struct ieee80211_bss_conf *link_conf,
  2860				    struct ieee80211_link_sta *link_sta,
  2861				    int enable)
  2862	{
  2863		struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
  2864		struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
  2865		struct mt792x_link_sta *mlink_bc;
  2866		struct mt792x_link_sta *mlink;
> 2867		u16 sta_wlan_idx;
  2868	
  2869		sta_wlan_idx = mvif->sta.deflink.wcid.idx;
  2870	
  2871		mlink_bc = mt792x_sta_to_link(&mvif->sta, mconf->link_id);
  2872	
  2873		if (link_sta) {
  2874			struct mt792x_sta *msta = (void *)link_sta->sta->drv_priv;
  2875	
  2876			mlink = mt792x_sta_to_link(msta, link_sta->link_id);
  2877			if (WARN_ON(!mlink))
  2878				return -1;
  2879		} else {
  2880			mlink = &mconf->vif->sta.deflink;
  2881		}
  2882	
  2883		return mt7925_mcu_add_bss_info_sta(phy, ctx, link_conf, link_sta,
  2884						   mlink_bc->wcid.idx, mlink->wcid.idx, enable);
  2885	}
  2886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

