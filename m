Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92203606A32A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 11:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tpYfc0Cl;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FPXLlmoZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kt1SdcCjffIWXMIQm5IGLvK7jU+eDRRMBhPemFkwyIk=; b=tpYfc0ClkZEDYvb463xUBgzNBa
	/MmDMfKzA1jSWH8vLjjcV+7uytHGp/j0xbZAArMZHbbZrFB9KTXpuZ89og2gx5lPOdgpYwi/kQF7w
	BpABl6gwFFMWrghBURajB4enL1rELXcmKLdnha6OAa0ELOg4IoTi1PD8dk/XO0/IU+1HXKY/3xbW9
	xS62EUJU+l3s1B2UkU8AWYOICWh7jFEVSfEasRlYg8C4SHD2Q/8A7GKTvcbbuGl6kq53oK2ppF+GN
	isNbAZ/M08D761BMOfvO/oCOXHZI2hlt3WI/0YoiLecXgVewXsiMdaQ5X294kvke5RtrNkpBUDC6V
	1J+693Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkRa-00000003iVf-14Vq;
	Tue, 10 Nov 2026 11:55:18 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkRW-00000003iUl-3t1d
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 11:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794311716; x=1825847716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xLC+Kp82pZhBULyTbznvfCirX6FuTOGlXW/eTvQqYlc=;
  b=FPXLlmoZg1fUtEojG67DrtzTt6y+3mypTRzg/83RHvzqgavR4XakOfIy
   cnS1P3a03xAR5Z5VJ5Il+YLxmM28Sn6dsh5lbfcHRatDn1mX0y7ISl8Y8
   zreuTnx9o5euu4q0a3remktPVjek2rKNH5Fgcx3UB4GOuroRnh0eZbh7R
   BJGnnnz27xUQD0KtloUimwvki6xivfwgyjzglXO6nYY2WWIRhvViU7FHp
   XalfyGtwaSi7ggiEMewrdpPVWxx+Fmn0gR6gazkBeufeSq4xiD3CjlroC
   SywjycO/wJdR4ibyJbPT1CS3spPc7/owTq3OeqXm5pSJi/QqkxJ0+Zjdz
   Q==;
X-CSE-ConnectionGUID: jOF36GRZSbuaAhn0b21BwA==
X-CSE-MsgGUID: crbksWbQQfu+IaHk3xM9iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3089591"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3089591"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 03:54:58 -0800
X-CSE-ConnectionGUID: 5YMhyP92TbKKx+LivObr5w==
X-CSE-MsgGUID: soXjYcdHSc6iOzg9sreG/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="10000802"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 10 Nov 2026 03:54:54 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQkR9-00000000wlT-0yc6;
	Tue, 10 Nov 2026 11:54:51 +0000
Date: Tue, 10 Nov 2026 19:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Devin Wittmayer <lucid_duck@justthetip.ca>,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Michael Lo <michael.lo@mediatek.com>,
	James-LY Huang <james-ly.huang@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: mt792x: tell mac80211 when a disconnect
 cancels its ROC
Message-ID: <202611101937.hzmTxgbR-lkp@intel.com>
References: <20261110005846.38432-1-lucid_duck@justthetip.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110005846.38432-1-lucid_duck@justthetip.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_035514_985544_2342DBA0 
X-CRM114-Status: GOOD (  11.08  )
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

Hi Devin,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v7.4-rc2 next-20261109]
[cannot apply to linux-review/Devin-Wittmayer/wifi-mt76-mt792x-tell-mac80211-when-a-disconnect-cancels-its-ROC/20261022-184827]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Devin-Wittmayer/wifi-mt76-mt792x-tell-mac80211-when-a-disconnect-cancels-its-ROC/20261109-175846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261110005846.38432-1-lucid_duck%40justthetip.ca
patch subject: [PATCH v2] wifi: mt76: mt792x: tell mac80211 when a disconnect cancels its ROC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261110/202611101937.hzmTxgbR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project b3e2466a7ef2bbc97d31230c3bf39a6fa50a608a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101937.hzmTxgbR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101937.hzmTxgbR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7921/main.c:385:11: error: no member named 'roc_notify' in 'struct mt792x_phy'
     385 |         if (phy->roc_notify)
         |             ~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7921/main.c:423:22: error: no member named 'roc_notify' in 'struct mt792x_phy'
     423 |         if (aborted && phy->roc_notify)
         |                        ~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7921/main.c:441:7: error: no member named 'roc_notify' in 'struct mt792x_phy'
     441 |         phy->roc_notify = type == MT7921_ROC_REQ_ROC;
         |         ~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7921/main.c:484:7: error: no member named 'roc_notify' in 'struct mt792x_phy'
     484 |         phy->roc_notify = false;
         |         ~~~  ^
   4 errors generated.
--
>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:531:11: error: no member named 'roc_notify' in 'struct mt792x_phy'
     531 |         if (phy->roc_notify)
         |             ~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:569:22: error: no member named 'roc_notify' in 'struct mt792x_phy'
     569 |         if (aborted && phy->roc_notify)
         |                        ~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:657:7: error: no member named 'roc_notify' in 'struct mt792x_phy'
     657 |         phy->roc_notify = false;
         |         ~~~  ^
   3 errors generated.


vim +385 drivers/net/wireless/mediatek/mt76/mt7921/main.c

   370	
   371	void mt7921_roc_abort_sync(struct mt792x_dev *dev)
   372	{
   373		struct mt792x_phy *phy = &dev->phy;
   374	
   375		if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
   376			return;
   377	
   378		timer_delete_sync(&phy->roc_timer);
   379		cancel_work(&phy->roc_work);
   380	
   381		ieee80211_iterate_interfaces(mt76_hw(dev),
   382					     IEEE80211_IFACE_ITER_RESUME_ALL,
   383					     mt7921_roc_iter, (void *)phy);
   384	
 > 385		if (phy->roc_notify)
   386			ieee80211_remain_on_channel_expired(mt76_hw(dev));
   387	}
   388	EXPORT_SYMBOL_GPL(mt7921_roc_abort_sync);
   389	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

