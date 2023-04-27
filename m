Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2883CC77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 17:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcGlD52OBDRB2HJoc6HQTgtvZYyR7QplzYFBh6TMSUk=; b=P2l3tgYETBvhiD1yrAKrZ2//Us
	XjuQwNRPd7ttiBR8SVJDopM8uC6P65rf640jJ0ONmfHdwh02Omi8GO4ZTXzoGLPB3GbI00BuN4/3w
	DhCC2465AS2tw95XAvYmunv9tdmMelWjqJi+a5fxgI29GnS3w4OksT7d4QQarOYaL+xcJVFs8+LSu
	4kQATWXR8xm6tntz1lQyxh3UbeDeL4PagDocP5csDQeZcMqmiD37UVHA7w7MleeAMcZvFhFeLcOyF
	dmDMBkVuWCk2n4dp706nSTVhv4X8lzruYy1efLbvX+Ug01Z4kLVV8OAyVjADgR7oxPNzXIv/lwZb1
	ux/Ho3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps5Ku-0076O4-1Z;
	Thu, 27 Apr 2023 17:23:16 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps5Kr-0076NO-0b
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Apr 2023 17:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682616193; x=1714152193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e7t003heJi1XAtLbnW5RQXVk9/BjNHIn2f+EIk07P0Y=;
  b=UVbr1XIDJy32QL/HOhtYOdQBEmmC20jzF99MKDDuSiXq+BPVTBQfNCoO
   X/kcbzSOvqRmsYmnvGRHOXLn0sKeAvjl8UtIhCsG4sUnpWAPUYgupPpzJ
   hqy47UER5Lc8w7dDVpHNBHRV6ORtpUiDKDU2ChuDzc3KDPCVLwDD0Q1Cp
   bwAb1hmg8RDpbtkVk6liUb5JDPcYHA28gPrKwm8/T1MxjXMNyc9Xk8MBt
   K+afqcfso2EEfLzu7DbPhKjCtzZIZDXXQneOlxn2+y82UfdqhL7BUmcC3
   P8+5yCY0JmpWWbVONr0grqrMl03IWD9Lm1kcdo+8DAwxxmfARvGAGvP34
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="344962034"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="344962034"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 10:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868809209"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="868809209"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 10:21:23 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps5J4-00002z-2a;
	Thu, 27 Apr 2023 17:21:22 +0000
Date: Fri, 28 Apr 2023 01:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, sean.wang@mediatek.com,
	chris.lu@mediatek.com, Soul.Huang@mediatek.com,
	Leon.Yen@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
	ch.yeh@mediatek.com, jenhao.yang@mediatek.com,
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
	steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
	abhishekpandit@google.com, michaelfsun@google.com,
	abhishekpandit@chromium.org, mcchou@chromium.org,
	shawnku@google.com, linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jing Cai <jing.cai@mediatek.com>
Subject: Re: [PATCH v4 3/3] Bluetooth: btusb: mediatek: add MediaTek
 devcoredump support
Message-ID: <202304280130.Aoglg07c-lkp@intel.com>
References: <01d3fe06d3a1e333b193e7d9fbc9cbfb4ee5d02b.1682549719.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01d3fe06d3a1e333b193e7d9fbc9cbfb4ee5d02b.1682549719.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_102313_236885_24294ECB 
X-CRM114-Status: GOOD (  12.07  )
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
[also build test WARNING on bluetooth-next/master linus/master v6.3 next-20230426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sean-wang-mediatek-com/Bluetooth-btmtk-introduce-btmtk-reset-work/20230427-071054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/01d3fe06d3a1e333b193e7d9fbc9cbfb4ee5d02b.1682549719.git.objelf%40gmail.com
patch subject: [PATCH v4 3/3] Bluetooth: btusb: mediatek: add MediaTek devcoredump support
config: x86_64-randconfig-r035-20211003 (https://download.01.org/0day-ci/archive/20230428/202304280130.Aoglg07c-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d253c927e94cb7e88bfcd0182449d29e477ca011
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review sean-wang-mediatek-com/Bluetooth-btmtk-introduce-btmtk-reset-work/20230427-071054
        git checkout d253c927e94cb7e88bfcd0182449d29e477ca011
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280130.Aoglg07c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/btusb.c:28:
>> drivers/bluetooth/btmtk.h:172:6: warning: no previous prototype for 'btmtk_register_coredump' [-Wmissing-prototypes]
     172 | void btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id, const char *name,
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/btmtk_register_coredump +172 drivers/bluetooth/btmtk.h

   171	
 > 172	void btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id, const char *name,
   173				     u32 fw_version)
   174	{
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

