Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04F3C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 03:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMjStWtWzxzZbXAKKOvMi2mncZ8hIjyS5ZjKmxD1A54=; b=uEry+gJdRhBaHDkbpGWhxxVNQp
	30KV1GMbyleAXpigW2mviGo4E3P4giM3OnkdiKuOUw3NvcQAEB77zxBy7Iz2ry6zqapYr1bIgljXQ
	q8+UvLIZmjMKNdTwE9a1snlLlkFBMrQYtct9TKwI9BscefcFHMt4bd09UrqWfXrZafv/kdK4ZzPT6
	P9wQXY6KorKgC5JGrCxOaPGcgduXxbuaBXrMkvT2x+KEzxisL3MMc9v1t/EUhdsOeq0eFoEaOkCHh
	Bg22A+5uIh8duSU3iWefnG3xLc/mHV968rYo2EOEHHAxGuiq/DRk7p8xBhbXhWv50PhXQ0CliSrqh
	BdGF3gGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prsBZ-005LGq-0t;
	Thu, 27 Apr 2023 03:20:45 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prsBV-005LFP-33
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Apr 2023 03:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682565641; x=1714101641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OyXNcul4Z1z505giNdrRSXjTIM440X0mC1Ilj99V4kQ=;
  b=CY53eoHGU64MOHsQadbqj4NES3i8N3vVUvZijwxrTcp1oHf2YbSbVsmR
   3TJvUjUDNYW4u1nFZsVPdcgvaBJLRQi0fBKOcBOlctkmHkWNaKH83O4Dh
   /BnMo6Lc31QamzTt2rgki15KoVq8Ht7z0rL+8ZkAtnhLH9n3vDimysOWZ
   Q+fVfLO96YyWkuXuAJTiAeWuNcYIuo3HtGEf8Dap6PRMsdR40GeXDrswe
   Bj6PFcwGTaHBcOT2yDAh8X/Ipug6FRIABVO1DaNmKoV0kbu+nYGdTq8jR
   llZ7UUfi3XMQR07T6HBz7JNnxiE2IT7s9qxy+DK43YWdjT6/kQFBJ0GII
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433594188"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="433594188"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 20:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="838192114"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="838192114"
Received: from lkp-server01.sh.intel.com (HELO 848ce1e85e7c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2023 20:20:26 -0700
Received: from kbuild by 848ce1e85e7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prsBF-000015-2g;
	Thu, 27 Apr 2023 03:20:25 +0000
Date: Thu, 27 Apr 2023 11:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	sean.wang@mediatek.com, chris.lu@mediatek.com,
	Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
	Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
	Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
	jenhao.yang@mediatek.com, Stella.Chang@mediatek.com,
	Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
	frankgor@google.com, abhishekpandit@google.com,
	michaelfsun@google.com, abhishekpandit@chromium.org,
	mcchou@chromium.org, shawnku@google.com,
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jing Cai <jing.cai@mediatek.com>
Subject: Re: [PATCH v4 3/3] Bluetooth: btusb: mediatek: add MediaTek
 devcoredump support
Message-ID: <202304271131.HetsXcxM-lkp@intel.com>
References: <01d3fe06d3a1e333b193e7d9fbc9cbfb4ee5d02b.1682549719.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01d3fe06d3a1e333b193e7d9fbc9cbfb4ee5d02b.1682549719.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_202042_001104_57AB55A4 
X-CRM114-Status: GOOD (  12.83  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master linus/master v6.3 next-20230426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sean-wang-mediatek-com/Bluetooth-btmtk-introduce-btmtk-reset-work/20230427-071054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/01d3fe06d3a1e333b193e7d9fbc9cbfb4ee5d02b.1682549719.git.objelf%40gmail.com
patch subject: [PATCH v4 3/3] Bluetooth: btusb: mediatek: add MediaTek devcoredump support
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230427/202304271131.HetsXcxM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d253c927e94cb7e88bfcd0182449d29e477ca011
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review sean-wang-mediatek-com/Bluetooth-btmtk-introduce-btmtk-reset-work/20230427-071054
        git checkout d253c927e94cb7e88bfcd0182449d29e477ca011
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271131.HetsXcxM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/btmtk.c:104:7: error: use of undeclared identifier 'HCI_DEVCOREDUMP_IDLE'
           case HCI_DEVCOREDUMP_IDLE:
                ^
>> drivers/bluetooth/btmtk.c:107:7: error: use of undeclared identifier 'HCI_DEVCOREDUMP_ACTIVE'; did you mean 'BTMTK_COREDUMP_ACTIVE'?
           case HCI_DEVCOREDUMP_ACTIVE:
                ^~~~~~~~~~~~~~~~~~~~~~
                BTMTK_COREDUMP_ACTIVE
   drivers/bluetooth/btmtk.c:28:2: note: 'BTMTK_COREDUMP_ACTIVE' declared here
           BTMTK_COREDUMP_ACTIVE,
           ^
>> drivers/bluetooth/btmtk.c:110:7: error: use of undeclared identifier 'HCI_DEVCOREDUMP_TIMEOUT'
           case HCI_DEVCOREDUMP_TIMEOUT:
                ^
>> drivers/bluetooth/btmtk.c:111:7: error: use of undeclared identifier 'HCI_DEVCOREDUMP_ABORT'
           case HCI_DEVCOREDUMP_ABORT:
                ^
>> drivers/bluetooth/btmtk.c:112:7: error: use of undeclared identifier 'HCI_DEVCOREDUMP_DONE'
           case HCI_DEVCOREDUMP_DONE:
                ^
>> drivers/bluetooth/btmtk.c:372:2: error: implicit declaration of function 'hci_devcd_register' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           hci_devcd_register(hdev, btmtk_coredump, btmtk_coredump_hdr,
           ^
>> drivers/bluetooth/btmtk.c:389:9: error: implicit declaration of function 'hci_devcd_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   err = hci_devcd_init(hdev, MTK_COREDUMP_SIZE);
                         ^
   drivers/bluetooth/btmtk.c:389:9: note: did you mean 'hci_sock_init'?
   include/net/bluetooth/bluetooth.h:577:5: note: 'hci_sock_init' declared here
   int hci_sock_init(void);
       ^
>> drivers/bluetooth/btmtk.c:393:32: error: no member named 'dump' in 'struct hci_dev'
                   schedule_delayed_work(&hdev->dump.dump_timeout,
                                          ~~~~  ^
>> drivers/bluetooth/btmtk.c:398:9: error: implicit declaration of function 'hci_devcd_append' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   err = hci_devcd_append(hdev, skb);
                         ^
   drivers/bluetooth/btmtk.c:398:9: note: did you mean 'hci_dev_open'?
   include/net/bluetooth/hci_core.h:1500:5: note: 'hci_dev_open' declared here
   int hci_dev_open(__u16 dev);
       ^
>> drivers/bluetooth/btmtk.c:405:4: error: implicit declaration of function 'hci_devcd_complete' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           hci_devcd_complete(hdev);
                           ^
   drivers/bluetooth/btmtk.c:405:4: note: did you mean 'hci_devcd_append'?
   drivers/bluetooth/btmtk.c:398:9: note: 'hci_devcd_append' declared here
                   err = hci_devcd_append(hdev, skb);
                         ^
   10 errors generated.


vim +/HCI_DEVCOREDUMP_IDLE +104 drivers/bluetooth/btmtk.c

   100	
   101	static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
   102	{
   103		switch (state) {
 > 104		case HCI_DEVCOREDUMP_IDLE:
   105			coredump_info.state = BTMTK_COREDUMP_INIT;
   106			break;
 > 107		case HCI_DEVCOREDUMP_ACTIVE:
   108			coredump_info.state = BTMTK_COREDUMP_ACTIVE;
   109			break;
 > 110		case HCI_DEVCOREDUMP_TIMEOUT:
 > 111		case HCI_DEVCOREDUMP_ABORT:
 > 112		case HCI_DEVCOREDUMP_DONE:
   113			coredump_info.state = BTMTK_COREDUMP_INIT;
   114			btmtk_reset_sync(coredump_info.hdev);
   115			break;
   116		}
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

