Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF5CC61DB6
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISP2HnalfXi1s14+lupit6KMIPXbfbSbTzW+NKavAJY=; b=dXK1fEZQJmWO54TM0QoWJWwzfK
	IHdB9hpRVvjHU1Hk6fF4D6woHP3+N6fWA01JXNdHCIUMMgOhQp5HuuYQDGI1/da7Zhk8FkcpRFN3R
	0lO/HJTOdm02Zxsi7tev0Mqna3b5IjeEv3hD5Ye3ztlcf+MtMWFzpBTYK2QQUX/RzWtQ1dOeNSQnJ
	GVWgwHrQdzCD68GsbmmQTWnah9LtP1DGZSZkFgAnELKj1LVnNIGN9k8xksMXRzl+4tw9ZJpX7PtdE
	s1oeKrNlb87oJaMuM5DLe3Qg+Lhy8EkqfP9+uO8CUxTWp8iIjG8XtuNNp2N2KyniF2R3FLjfD4Mvw
	B0pZEvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wym0f-00000000KVB-1qT0;
	Tue, 25 Aug 2026 07:55:53 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wym0b-00000000KUj-2zvu
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 07:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787644550; x=1819180550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEEg94RxDrjn+V/9mMrTEw7XG6ZVjtZXmvPUbdJ0qvQ=;
  b=Rl9katNxyMBlMuIedthTXGqyX5tR9q2PtjTeVgErEkLLxWiAy4r+9tqS
   5izR5g3YMUp+oQKGqY2MxWNvhjaygeOqQq76p+XvNiMvHs+eb6C0UZYOR
   1uoeR8ZjhXAqUwMMtjH3SBEG+Gf8MNelHH+mo378yXHZWp8eXPaBdj53S
   5f6QzYjrcXeLNjCQmVLY1zXJO66KX+85t4nVwhJLyKEUQRMYiWlgbcOQT
   VYQY2oJT/aEOC9aMwQOc+WWi/3/zrgCYSceNLPDcZLhTQAe4xGmf21uW7
   6w5pec76GCJkIHMlYx4Bs0grxAdk1qa9qetYaQyqt+gkUp+7A0ZO27yoP
   Q==;
X-CSE-ConnectionGUID: TDNse2teS0uT8Nf7hRH0bg==
X-CSE-MsgGUID: 96WUo7IZQJCUnI0z2ewh9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91785854"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="91785854"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:55:49 -0700
X-CSE-ConnectionGUID: hN3GQjCqQlG5afb4P/iBHw==
X-CSE-MsgGUID: abvU8nloQ8iQxVDMl3slLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="271424992"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Aug 2026 00:55:46 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wym0V-000000005FD-2WKr;
	Tue, 25 Aug 2026 07:55:43 +0000
Date: Tue, 25 Aug 2026 15:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: Eason Lai <eason.lai@mediatek.com>, nbd@nbd.name, lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kun.wu@mediatek.com,
	deren.wu@mediatek.com, sean.wang@mediatek.com,
	quan.zhou@mediatek.com, ryder.lee@mediatek.com,
	leon.yen@mediatek.com, litien.chang@mediatek.com,
	jb.tsai@mediatek.com, michael.shih@mediatek.com,
	eason.lai@mediatek.com
Subject: Re: [PATCH v1] wifi: mt76: mt7928: Add debugfs for stats to provide
 debug purpose
Message-ID: <202608251526.VgKMT8Lv-lkp@intel.com>
References: <20260824030746.60706-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824030746.60706-1-eason.lai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_005549_814974_4838EE9A 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Eason,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on linus/master next-20260821]
[cannot apply to wireless/main v7.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eason-Lai/wifi-mt76-mt7928-Add-debugfs-for-stats-to-provide-debug-purpose/20260824-110746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260824030746.60706-1-eason.lai%40mediatek.com
patch subject: [PATCH v1] wifi: mt76: mt7928: Add debugfs for stats to provide debug purpose
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260825/202608251526.VgKMT8Lv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251526.VgKMT8Lv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251526.VgKMT8Lv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/mt7996/init.c:13:
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.h:1000:9: error: redeclaration of enumerator 'UNI_CMD_MIB_DATA'
    1000 |         UNI_CMD_MIB_DATA,
         |         ^~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/mediatek/mt76/mt7996/mcu.h:9:
   drivers/net/wireless/mediatek/mt76/mt7996/../mt76_connac_mcu.h:1511:9: note: previous definition of 'UNI_CMD_MIB_DATA' with type 'enum <anonymous>'
    1511 |         UNI_CMD_MIB_DATA,
         |         ^~~~~~~~~~~~~~~~


vim +/UNI_CMD_MIB_DATA +1000 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h

98686cd21624c7 Shayne Chen 2022-11-22   998  
98686cd21624c7 Shayne Chen 2022-11-22   999  enum {
98686cd21624c7 Shayne Chen 2022-11-22 @1000  	UNI_CMD_MIB_DATA,
98686cd21624c7 Shayne Chen 2022-11-22  1001  };
98686cd21624c7 Shayne Chen 2022-11-22  1002  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

