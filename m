Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC096606A31B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 00:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=is/foLlS;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e2nlfI8T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BDCPQwMl5ZbMSL1BG+OKV9Y6I1wzqmu2D+Tl1vlMKA8=; b=is/foLlSukXieuHQlPWK9C2FA5
	T47tILycEzbJcULWuOjOZe09fRc9dTyGPgCqO4Hm3hrNhQm+bLmZ2YeQudGsHWwYwCQ6Ttg+Hzr/l
	P+MlI9caD95cF2MAPmOx8wXr+4puVGAFyP1PcnZtlijQTb4oC4GuZ4kUkSL9JTBELcadptwTC1IKV
	wi3g0H+SAugC/Ku8H67xp9imams/NC26MaP77aIQ9wPy3MYwdlsyl89tHkvy4TEMxrViikcGfRBTu
	l7DY1+WJ7IW3r5OLWDEkuD5lNzijanKGh2mb/c6zvFUzT7x8WAAzZUj7R5rTuQVbn59+XzJtEO/OO
	UWIEhhlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP7ux-0000000AvIr-0wN1;
	Fri, 06 Nov 2026 00:34:55 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP7ut-0000000AvIE-2zCW
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 00:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793925292; x=1825461292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SOB9M6TJU1a3PJhWDum57mlUDjOGaJ0rlgoRWpTwrDw=;
  b=e2nlfI8TVDME6A1xFtBS8g9YbVgmk1lwdCH54EjlcUe0tgPy52Mp71yd
   xtJ092hgFrdLped9zrZ1GKG0CQ3xtr5/koJTNu8hx+PpjyAOQb0T0epcK
   0oVyGhV9pE+FkAP7mPLrQWksH0UshVQmEns9QkHauWT+JvFBHMbUpbDdb
   QIyAC2GHx9uA0g6H5I5AIHvCyYhu+XK5A/6BmWDs5UY5aE4KGSNoyi7LW
   OrCgXRcgVb0kWyw3zwjsnPVVDKio0QXeVdht0Z0Pjnp/CywlZs+2+p6eT
   SVjL/Z15CicROGxGg5opXeSDBx86/8lMy7ydpgqCoU91ujA6kge3A1hw9
   Q==;
X-CSE-ConnectionGUID: +PRHTVn7SdKD21MolEbFMg==
X-CSE-MsgGUID: 5Me1BpviROeDBQqDm9r/0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2613100"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2613100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 16:34:51 -0800
X-CSE-ConnectionGUID: i55uCnbIRwCGTG3fJzDP2g==
X-CSE-MsgGUID: zc/tS+8KSc+j1K2c1kWj/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7566228"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2026 16:34:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP7un-00000000n6J-2WwR;
	Fri, 06 Nov 2026 00:34:45 +0000
Date: Fri, 6 Nov 2026 08:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: JB Tsai <jb.tsai@mediatek.com>, nbd@nbd.name, lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Sean.Wang@mediatek.com,
	James-LY.Huang@mediatek.com, jb.tsai@mediatek.com
Subject: Re: [PATCH 7/9] wifi: mt76: mt7925: inject the deauth for an
 aging-timeout SAP event
Message-ID: <202611060815.93tauu28-lkp@intel.com>
References: <20261104092344.1932406-7-jb.tsai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104092344.1932406-7-jb.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_163451_831356_D09677EE 
X-CRM114-Status: GOOD (  12.58  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi JB,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on linus/master v7.4-rc1 next-20261105]
[cannot apply to wireless/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/JB-Tsai/wifi-mt76-mt7925-bound-P2P-off-channel-mgmt-TX-lifetime/20261104-172337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261104092344.1932406-7-jb.tsai%40mediatek.com
patch subject: [PATCH 7/9] wifi: mt76: mt7925: inject the deauth for an aging-timeout SAP event
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261106/202611060815.93tauu28-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060815.93tauu28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060815.93tauu28-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/p2p.c: In function 'mt7925_mcu_sap_aging_timeout':
>> drivers/net/wireless/mediatek/mt76/mt7925/p2p.c:483:9: warning: alignment 1 of 'struct <anonymous>' is less than 2 [-Wpacked-not-aligned]
     483 |         } __packed deauth = {};
         |         ^


vim +483 drivers/net/wireless/mediatek/mt76/mt7925/p2p.c

   468	
   469	/* FW reported that a peer of our AP/GO aged out (no traffic/no ack for the FW
   470	 * inactivity period); the expected reaction is a deauth with
   471	 * REASON_CODE_DISASSOC_INACTIVITY. Here the AP MLME lives in
   472	 * wpa_supplicant (softmac, device_ap_sme=0), so instead of tearing the
   473	 * STA down in the driver we synthesize the deauth frame the GO would
   474	 * have received from the GC and hand it to userspace via
   475	 * NL80211_CMD_FRAME.
   476	 */
   477	static void
   478	mt7925_mcu_sap_aging_timeout(struct mt792x_dev *dev, u16 wlan_idx)
   479	{
   480		struct {
   481			struct ieee80211_hdr_3addr hdr;
   482			__le16 reason_code;
 > 483		} __packed deauth = {};
   484		u8 peer[ETH_ALEN], own[ETH_ALEN], bssid[ETH_ALEN];
   485		struct ieee80211_chanctx_conf *ctx;
   486		struct mt792x_bss_conf *mconf;
   487		struct mt792x_link_sta *mlink;
   488		struct ieee80211_vif *vif;
   489		struct ieee80211_sta *sta;
   490		struct mt792x_vif *mvif;
   491		struct mt792x_sta *msta;
   492		struct mt76_wcid *wcid;
   493		struct wireless_dev *wdev;
   494		int freq = 0;
   495		u8 link_id;
   496	
   497		rcu_read_lock();
   498	
   499		wcid = mt76_wcid_ptr(dev, wlan_idx);
   500		if (!wcid || !wcid->sta)
   501			goto unlock;
   502	
   503		mlink = container_of(wcid, struct mt792x_link_sta, wcid);
   504		msta = mlink->sta;
   505		if (!msta || !msta->vif)
   506			goto unlock;
   507	
   508		vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
   509		if (vif->type != NL80211_IFTYPE_AP &&
   510		    vif->type != NL80211_IFTYPE_P2P_GO)
   511			goto unlock;
   512	
   513		mvif = (struct mt792x_vif *)vif->drv_priv;
   514		sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
   515		link_id = wcid->link_id;
   516	
   517		ether_addr_copy(peer, sta->addr);
   518		ether_addr_copy(own, vif->addr);
   519		ether_addr_copy(bssid, vif->bss_conf.bssid);
   520		mconf = &mvif->bss_conf;
   521	
   522		if (ieee80211_vif_is_mld(vif) && link_id < IEEE80211_LINK_UNSPECIFIED) {
   523			struct ieee80211_link_sta *link_sta;
   524			struct ieee80211_bss_conf *link_conf;
   525			struct mt792x_bss_conf *link_mconf;
   526	
   527			link_sta = rcu_dereference(sta->link[link_id]);
   528			if (link_sta)
   529				ether_addr_copy(peer, link_sta->addr);
   530	
   531			link_conf = rcu_dereference(vif->link_conf[link_id]);
   532			if (link_conf) {
   533				ether_addr_copy(own, link_conf->addr);
   534				ether_addr_copy(bssid, link_conf->bssid);
   535			}
   536	
   537			link_mconf = rcu_dereference(mvif->link_conf[link_id]);
   538			if (link_mconf)
   539				mconf = link_mconf;
   540		}
   541	
   542		ctx = mconf->mt76.ctx;
   543		if (ctx && ctx->def.chan)
   544			freq = ctx->def.chan->center_freq;
   545		else if (dev->mphy.chandef.chan)
   546			freq = dev->mphy.chandef.chan->center_freq;
   547	
   548		rcu_read_unlock();
   549	
   550		deauth.hdr.frame_control = cpu_to_le16(IEEE80211_FTYPE_MGMT |
   551						       IEEE80211_STYPE_DEAUTH);
   552		ether_addr_copy(deauth.hdr.addr1, own);	/* DA: the GO itself */
   553		ether_addr_copy(deauth.hdr.addr2, peer);	/* SA: the aged-out GC */
   554		ether_addr_copy(deauth.hdr.addr3, bssid);
   555		deauth.reason_code = cpu_to_le16(WLAN_REASON_DISASSOC_DUE_TO_INACTIVITY);
   556	
   557		wdev = ieee80211_vif_to_wdev(vif);
   558		if (!wdev)
   559			return;
   560	
   561		cfg80211_rx_mgmt_khz(wdev, MHZ_TO_KHZ(freq), 0, (const u8 *)&deauth,
   562				     sizeof(deauth), 0);
   563	
   564		return;
   565	
   566	unlock:
   567		rcu_read_unlock();
   568	}
   569	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

