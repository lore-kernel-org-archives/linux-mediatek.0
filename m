Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB460C7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3z3KCVaf41a7u62V6QQc4HTHww8v8Dd8rXW/10QcPU=; b=C+CPfbPFR9VUo6arm9GpdzXN4p
	lOyCecpxlZDoehDG8iYrGpcrWMRq1GKJGqsmib6uCSC6zFMXyZElNXTEKkAVCvy7Im+7Fczvd4Cd+
	zTonhuRh7gGfEVvZjCKFq5cTICeKxrLH5f0ZurbNuXrprbB0gF3HvSV/7Q0jGWewh2KEnzXAXJSc2
	S/SRQQ/zsggu+99tHicUmvPc6JvA/2Pl9chu8ZxaxIKxvHHFf8pDG5ln6MTka9vfWjGdrubTcZZfr
	BihY2SNgvGZvJZd+Y7qkLvsK5zlK5Mi9Hk2tlOlciu+jiFM3pJwBJQzpV7fh20LuLVtpMv/Poeex+
	i/v9UIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu916-0043RK-0y;
	Wed, 03 May 2023 09:43:20 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu913-0043Qj-0V
	for linux-mediatek@lists.infradead.org;
	Wed, 03 May 2023 09:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683106997; x=1714642997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vhqFdTzhGexCAv6U0OS1J8ZaNH/S/YqaydBy/c8yYQo=;
  b=XzBOFmSghYbHRl1hKO5DRr9kabrI7FGm1O83Y2w3BGqKPno+yb1993mj
   brEp4pce+GLWh/ND6GOucbaH05WbBl/KwHOkiZH9OWxLoLLq+SdDt4uqy
   jKKdBXBHq9IpAHYAgkmdB4oMyEnEYwOdASf4DQqkeZkQXKMxGCDXFBjj1
   lFw6zI8ke2nrHPPIZSLvP1OclM8mkamsf38AH0QuSYIQA7JIUA+zGGgKf
   kom8SOrbS9bKeELH4MlP0Y3GY8MWy6xk1WWxDwcG0XZ03Mi56rCd7HWW5
   +eBjDA8f/UXdD6t8LTHlc12+ObvsU9eCQBecFx2sFlOSC+J2mdvo7A6l2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350688529"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="350688529"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 02:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026439652"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="1026439652"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 May 2023 02:43:09 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu90u-0001ou-2c;
	Wed, 03 May 2023 09:43:08 +0000
Date: Wed, 3 May 2023 17:42:09 +0800
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
Subject: Re: [PATCH v5 3/3] Bluetooth: btusb: mediatek: add MediaTek
 devcoredump support
Message-ID: <202305031708.UQZ6jRn6-lkp@intel.com>
References: <ddcbc509b5024882583d5c143ec5f4520bef860a.1683065391.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddcbc509b5024882583d5c143ec5f4520bef860a.1683065391.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_024317_233372_A2D35FB6 
X-CRM114-Status: GOOD (  13.37  )
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
[also build test ERROR on bluetooth-next/master linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sean-wang-mediatek-com/Bluetooth-btmtk-introduce-btmtk-reset-work/20230503-070640
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/ddcbc509b5024882583d5c143ec5f4520bef860a.1683065391.git.objelf%40gmail.com
patch subject: [PATCH v5 3/3] Bluetooth: btusb: mediatek: add MediaTek devcoredump support
config: x86_64-randconfig-a016-20230501 (https://download.01.org/0day-ci/archive/20230503/202305031708.UQZ6jRn6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/635545fc4095e7e6b159177a07b0359b7eafe482
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review sean-wang-mediatek-com/Bluetooth-btmtk-introduce-btmtk-reset-work/20230503-070640
        git checkout 635545fc4095e7e6b159177a07b0359b7eafe482
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305031708.UQZ6jRn6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bluetooth/btmtk.c:97:7: error: use of undeclared identifier 'HCI_DEVCOREDUMP_IDLE'
           case HCI_DEVCOREDUMP_IDLE:
                ^
   drivers/bluetooth/btmtk.c:100:7: error: use of undeclared identifier 'HCI_DEVCOREDUMP_ACTIVE'; did you mean 'BTMTK_COREDUMP_ACTIVE'?
           case HCI_DEVCOREDUMP_ACTIVE:
                ^~~~~~~~~~~~~~~~~~~~~~
                BTMTK_COREDUMP_ACTIVE
   drivers/bluetooth/btmtk.c:25:2: note: 'BTMTK_COREDUMP_ACTIVE' declared here
           BTMTK_COREDUMP_ACTIVE,
           ^
   drivers/bluetooth/btmtk.c:103:7: error: use of undeclared identifier 'HCI_DEVCOREDUMP_TIMEOUT'
           case HCI_DEVCOREDUMP_TIMEOUT:
                ^
   drivers/bluetooth/btmtk.c:104:7: error: use of undeclared identifier 'HCI_DEVCOREDUMP_ABORT'
           case HCI_DEVCOREDUMP_ABORT:
                ^
   drivers/bluetooth/btmtk.c:105:7: error: use of undeclared identifier 'HCI_DEVCOREDUMP_DONE'
           case HCI_DEVCOREDUMP_DONE:
                ^
   drivers/bluetooth/btmtk.c:367:9: error: implicit declaration of function 'hci_devcd_register' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return hci_devcd_register(hdev, btmtk_coredump, btmtk_coredump_hdr,
                  ^
   drivers/bluetooth/btmtk.c:385:9: error: implicit declaration of function 'hci_devcd_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   err = hci_devcd_init(hdev, MTK_COREDUMP_SIZE);
                         ^
   drivers/bluetooth/btmtk.c:385:9: note: did you mean 'hci_sock_init'?
   include/net/bluetooth/bluetooth.h:577:5: note: 'hci_sock_init' declared here
   int hci_sock_init(void);
       ^
>> drivers/bluetooth/btmtk.c:389:32: error: no member named 'dump' in 'struct hci_dev'
                   schedule_delayed_work(&hdev->dump.dump_timeout,
                                          ~~~~  ^
   drivers/bluetooth/btmtk.c:394:9: error: implicit declaration of function 'hci_devcd_append' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   err = hci_devcd_append(hdev, skb);
                         ^
   drivers/bluetooth/btmtk.c:394:9: note: did you mean 'hci_dev_open'?
   include/net/bluetooth/hci_core.h:1500:5: note: 'hci_dev_open' declared here
   int hci_dev_open(__u16 dev);
       ^
   drivers/bluetooth/btmtk.c:401:4: error: implicit declaration of function 'hci_devcd_complete' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           hci_devcd_complete(hdev);
                           ^
   drivers/bluetooth/btmtk.c:401:4: note: did you mean 'hci_devcd_append'?
   drivers/bluetooth/btmtk.c:394:9: note: 'hci_devcd_append' declared here
                   err = hci_devcd_append(hdev, skb);
                         ^
   10 errors generated.


vim +389 drivers/bluetooth/btmtk.c

   371	
   372	int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
   373	{
   374		struct btmtk_data *data = hci_get_priv(hdev);
   375		int err;
   376	
   377		if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
   378			return 0;
   379	
   380		switch (data->cd_info.state) {
   381		case BTMTK_COREDUMP_DISABLED:
   382			err = -EINVAL;
   383			break;
   384		case BTMTK_COREDUMP_INIT:
 > 385			err = hci_devcd_init(hdev, MTK_COREDUMP_SIZE);
   386			if (err < 0)
   387				break;
   388			/* It is supposed coredump can be done within 5 seconds */
 > 389			schedule_delayed_work(&hdev->dump.dump_timeout,
   390					      msecs_to_jiffies(5000));
   391			fallthrough;
   392		case BTMTK_COREDUMP_ACTIVE:
   393		default:
   394			err = hci_devcd_append(hdev, skb);
   395			if (err < 0)
   396				break;
   397	
   398			if (skb->len > 12 &&
   399			    !strncmp((char *)&skb->data[skb->len - 13],
   400				     MTK_COREDUMP_END, 12))
   401				hci_devcd_complete(hdev);
   402	
   403			break;
   404		}
   405	
   406		if (err < 0) {
   407			data->cd_info.state = BTMTK_COREDUMP_DISABLED;
   408			kfree_skb(skb);
   409		}
   410	
   411		return err;
   412	}
   413	EXPORT_SYMBOL_GPL(btmtk_process_coredump);
   414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

