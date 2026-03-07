Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F34EF55102
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Mar 2026 18:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SH14p8JOOvpmdHRWzICkJWSQ6bGoCvxvt1Etu9cRC6M=; b=MSOjarS2Eh2J0gPFHU87NHrvsr
	nYgNVdViBFh9Z+8v3MrElWSKlX+AzFpI+8TB6ZmHstaZxbirRKpFV2NwmfgBWqEdrzvGOpCZwFwkK
	ewKRCn01MuXIFljYzbkT5dtsU4htIzoXl+SuzfsS5VimDUgeh9kdvt98M7LUDhigL9O+c6SGp1Mmx
	4QexaCvoKx5kAdR3JM+97ufsVS01w1nGTUD5ttel5Q+2XndijQoXn8EQ2rKqd+mlcJdwnFVuL4Ia9
	HS6W243GlDHt+VYP3in0fpqyj/XmHPzv2EuuSJhL+eK4gl40wMw3ajXIC3sWa4TXMCu/zcTM3TDvD
	6iqES+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyvxc-00000005PhM-2Fd4;
	Sat, 07 Mar 2026 18:01:08 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyvxY-00000005PgJ-13rh
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Mar 2026 18:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772906464; x=1804442464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o+OgiOKCiGlbiWTc23wi3lpP9cofsuhMFa5k1sJzTRo=;
  b=kU7KU3k6YlvUBZNO3AmAQtsYtobOTGcxnONbTRtx6ot+wuhlI3P/0N37
   pmn2MFHmJu+s2lgOhevMEZCdwqgPBrpBIwcSVVu2MMnxdWmzfVE/i9fjv
   /wt0eBKsmg7JckYdQgoL1yjxXhxsia6Dgd7P4VIQ9muJCqSaeDsQDF2ZQ
   GGxHRyVeKhcmbhQQc7zXNraXHlJ3FLhjqKpcGnnRhcyZEM9SkAOys+sld
   uv9VlUUCYzkIWvwyep4E5aE2lgnn4rqMKX6RaVxkdNIBUDBBJbdgtBnjR
   IFtX1KtY+Oc6tPFX5Q+An2jQb0ORkzGlthUGhHKTLoVrlGnhmhA+J46sS
   w==;
X-CSE-ConnectionGUID: eLJQrZzwT1yt8Zawyy8rWw==
X-CSE-MsgGUID: RWYwfqVQR7+5rEw/cgE4vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73904279"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="73904279"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 10:00:58 -0800
X-CSE-ConnectionGUID: FFCQ3tfLTyys6zG6cjpjeQ==
X-CSE-MsgGUID: ymZKOBe2TbOIg+nclKliEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="215926897"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2026 10:00:56 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyvxN-000000002Uj-2jOo;
	Sat, 07 Mar 2026 18:00:53 +0000
Date: Sun, 8 Mar 2026 01:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Wang <sean.wang@kernel.org>, nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 02/19] wifi: mt76: mt7925: pass WCID indices to
 bss_basic_tlv()
Message-ID: <202603080115.kvbVwfTB-lkp@intel.com>
References: <20260306232238.2039675-3-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306232238.2039675-3-sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_100104_369910_D8C3BF58 
X-CRM114-Status: GOOD (  11.32  )
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260308/202603080115.kvbVwfTB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080115.kvbVwfTB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080115.kvbVwfTB-lkp@intel.com/

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

