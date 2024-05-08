Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2DEC04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 07:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvjDz/GIWwpaXZUYT3Hih8RuzFmPB4D2ZxY5GbrNvuc=; b=4b/jjUOSeer6o/92ywBkCZcrBm
	3eT5KS+OpZ2mua4vKUhoyi4tJX+il1HFbcRpvrh2nu8thvEBlWQJbj+5xcVAOeE0f256rqtfb8IqZ
	FXTM9/GRgk4WsICbMuN1SB5piRTjozgpVJWL14FSYNzkv/2rsW39/VP4bgxmxHD6gVsRPWV7Q80yN
	1esgsA9SwZb+Ll0qPZOYrHF9tSFcu8PAzV6faXUR9nUw80vyyyIRAiZ397OeQJpweLUsB5TIfVBgD
	KVe4qgPV9BEI0drQfzl/yqiddo3ky6scAvHAHIm4HyTZGnBVNfBBRC9XTuhK9DjqEmVq/tGEgilsc
	4kIHPRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4bUY-0000000EMXW-3z1l;
	Wed, 08 May 2024 07:13:31 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4bUT-0000000EMSi-2DUB
	for linux-mediatek@lists.infradead.org;
	Wed, 08 May 2024 07:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715152406; x=1746688406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kcyv9B4aVwqHiIYH9soi2Une9+zbvCi85GRN+JQDBrw=;
  b=mk9DHKCCviB6iiRrt4bSeBEwuxsKtDoQkwRX1sYekybAtnm8CC2YL0p8
   3ZjktXMtAiFYU16wCRciYzryiSYssiAWTHBZuK+KRHQ35eRgg9RHJPzWI
   e7/Dld2d8okKcGlX+FBYfKUY4xwifbvsLpEnxXwcaCdziMmfm7cVYG+Av
   N4yCyW8cIsgoOANuJMpJs1c2QKGPKTivxJunDscIawj6c1m7yNi5NOmDo
   VwCRzhmcpzIAsNmITsDIeZgap3CYw8mvVdJMWoxJzJWfHbqfEHYaMCtb+
   gtkerVW1W6E/M6juo3aC3zQqzR0/KzSnCkeozy5Uec1deFHXHA511Dicx
   w==;
X-CSE-ConnectionGUID: SogdmqjhQuus7eGIh+JXNw==
X-CSE-MsgGUID: XWYdA8ApROq+RwDm0ehlAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28510636"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="28510636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 00:13:13 -0700
X-CSE-ConnectionGUID: ENhzKVk6SOGhN6R8K3Ve/w==
X-CSE-MsgGUID: 3/5Xc0TtRTCLRkYiBpYK5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="33310222"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 May 2024 00:13:10 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4bUC-00037E-0m;
	Wed, 08 May 2024 07:13:08 +0000
Date: Wed, 8 May 2024 15:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: sean.wang@kernel.org, marcel@holtmann.org, johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v4 1/5] Bluetooth: btmtk: add the function to get the fw
 name
Message-ID: <202405081456.v2MvcQ0P-lkp@intel.com>
References: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_001325_603562_6AEB4117 
X-CRM114-Status: GOOD (  11.96  )
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

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master linus/master v6.9-rc7 next-20240507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sean-wang-kernel-org/Bluetooth-btmtk-apply-the-common-btmtk_fw_get_filename/20240508-032333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang%40kernel.org
patch subject: [PATCH v4 1/5] Bluetooth: btmtk: add the function to get the fw name
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240508/202405081456.v2MvcQ0P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081456.v2MvcQ0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081456.v2MvcQ0P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bluetooth/btmtk.c: In function 'btmtk_fw_get_filename':
>> drivers/bluetooth/btmtk.c:115:35: warning: 'mediatek/BT_RAM_CODE_MT' directive output truncated writing 23 bytes into a region of size 8 [-Wformat-truncation=]
     115 |                          "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
         |                           ~~~~~~~~^~~~~~~~~~~~~~~
   drivers/bluetooth/btmtk.c:115:26: note: directive argument in the range [1, 256]
     115 |                          "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btmtk.c:114:17: note: 'snprintf' output between 41 and 43 bytes into a destination of size 8
     114 |                 snprintf(buf, sizeof(size),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
     115 |                          "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 |                          dev_id & 0xffff, (fw_ver & 0xff) + 1);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +115 drivers/bluetooth/btmtk.c

   105	
   106	void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
   107				   u32 fw_flavor)
   108	{
   109		if (dev_id == 0x7925)
   110			snprintf(buf, size,
   111				 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
   112				 dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff) + 1);
   113		else if (dev_id == 0x7961 && fw_flavor)
   114			snprintf(buf, sizeof(size),
 > 115				 "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
   116				 dev_id & 0xffff, (fw_ver & 0xff) + 1);
   117		else
   118			snprintf(buf, size,
   119				 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
   120				 dev_id & 0xffff, (fw_ver & 0xff) + 1);
   121	}
   122	EXPORT_SYMBOL_GPL(btmtk_fw_get_filename);
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

