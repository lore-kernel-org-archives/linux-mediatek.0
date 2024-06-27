Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E33C3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tx7jh0B58cxFxmVHCLdBqlLQSjDYtx8+afXP5fcmOT0=; b=T2PhVODhwp/gpKz+QzwMFWh5cu
	UunTMxBjV5Cy34K2Yb+udz0C2O6kTbYnOpf64RN9Bd0IbzwxLbdpXwpWfazv9oNax2YY5FWriRuZU
	cpLaY5TisExEy5Pb64fK+8eg6DNjhcwED5DLktp5WTSLKejow2RZIp6P5HdoLBPxwblSvvu8Bmwnn
	luiE+QtOaGcCEFnvuopHK9A0wF2AcIIOZzz0VOp3WJsbsjWlsc4flLy/CVw5i+dI5M87o0n29HifB
	ph8eVTcAiFnl44Tdxtl0CkJ3GqcrHIbACoLJQj3kgtuaZXzFKwOuW6Ke+Bo1Nh8rQDxHnzSE+VC5l
	06vctqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMto9-0000000BNq8-1cbl;
	Thu, 27 Jun 2024 18:25:21 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMto5-0000000BNnb-028a
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 18:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719512717; x=1751048717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Ajy1en2qPpu1h+fHYclENO/17vYGHDO6/UafbA2Eyw=;
  b=BzBoSDOEpvos7v85ndADrRPvx7TcjYyKcqKwCsFxakpbhNRdqw3BeTLa
   qW3fyUa6gpuIG4zWp51XV8/D5tmsMwyFy45LuyvUqiAczNTtekxuK225B
   2ZpZhSHPQ3CtyOtZ3HM7Q+26gGwf5d2KkvHvjiKM5jQUzse6YKvl3Mg1I
   UKZ2HZQcCJO+Kopjw57OzjpugtengKJbnSdoAiUjserqGWvAE2OmfKC5/
   VfdsNkYcy8vYVAig3Q+C+cPTSZOZpbKoI5B+jKiJfhApksxMcsHQCf+UO
   J0zUJbEvsHTgPNegLuMApMinGMOVMuWixkjEcUhEECJxK3Lbgo9g82lBK
   w==;
X-CSE-ConnectionGUID: Z/KgtpkWT/CUAH4q8IcaMA==
X-CSE-MsgGUID: 6n6+oXDgS4yXRls+Lvtonw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16488370"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="16488370"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 11:25:15 -0700
X-CSE-ConnectionGUID: ahlKCS5gSKyDs0rBA+MtJg==
X-CSE-MsgGUID: ivEELg1lQLe/k2fFRQLdeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="44303023"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jun 2024 11:25:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMtny-000GQA-36;
	Thu, 27 Jun 2024 18:25:10 +0000
Date: Fri, 28 Jun 2024 02:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Von Dentz <luiz.dentz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Chris Lu <chris.lu@mediatek.com>
Subject: Re: [PATCH v5 8/8] Bluetooth: btusb: mediatek: add ISO data
 transmission functions
Message-ID: <202406280211.EtaVcgeY-lkp@intel.com>
References: <20240626025329.26424-9-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626025329.26424-9-chris.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_112517_172442_1360DCC9 
X-CRM114-Status: GOOD (  13.06  )
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

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20240626]
[cannot apply to bluetooth/master linus/master v6.10-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth-btusb-mediatek-remove-the-unnecessary-goto-tag/20240626-114003
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240626025329.26424-9-chris.lu%40mediatek.com
patch subject: [PATCH v5 8/8] Bluetooth: btusb: mediatek: add ISO data transmission functions
config: mips-lemote2f_defconfig (https://download.01.org/0day-ci/archive/20240628/202406280211.EtaVcgeY-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280211.EtaVcgeY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280211.EtaVcgeY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/btusb.c:28:
   drivers/bluetooth/btmtk.h: In function 'alloc_mtk_intr_urb':
>> drivers/bluetooth/btmtk.h:274:24: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
     274 |         return PTR_ERR(-EOPNOTSUPP);
   In file included from include/linux/kernfs.h:9,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/dmi.h:6,
                    from drivers/bluetooth/btusb.c:9:
   include/linux/err.h:49:61: note: expected 'const void *' but argument is of type 'int'
      49 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~
>> drivers/bluetooth/btmtk.h:274:16: warning: returning 'long int' from a function with return type 'struct urb *' makes pointer from integer without a cast [-Wint-conversion]
     274 |         return PTR_ERR(-EOPNOTSUPP);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btmtk.h: At top level:
   drivers/bluetooth/btmtk.h:256:13: warning: 'btmtk_fw_get_filename' defined but not used [-Wunused-function]
     256 | static void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btmtk.h:251:12: warning: 'btmtk_process_coredump' defined but not used [-Wunused-function]
     251 | static int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btmtk.h:245:12: warning: 'btmtk_register_coredump' defined but not used [-Wunused-function]
     245 | static int btmtk_register_coredump(struct hci_dev *hdev, const char *name,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btmtk.h:235:12: warning: 'btmtk_setup_firmware' defined but not used [-Wunused-function]
     235 | static int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btmtk.h:229:12: warning: 'btmtk_setup_firmware_79xx' defined but not used [-Wunused-function]
     229 | static int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/PTR_ERR +274 drivers/bluetooth/btmtk.h

   270	
   271	static struct urb *alloc_mtk_intr_urb(struct hci_dev *hdev, struct sk_buff *skb,
   272					      usb_complete_t tx_complete)
   273	{
 > 274		return PTR_ERR(-EOPNOTSUPP);
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

