Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B6EC3271F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEM6r5a/QuKqax601oEClJY5MN53ky+qfYQFe/bb0xw=; b=0VgSGFaTQiYANTfR/vfgRTHXS7
	qs9ttXUmm1T+SZ+Gcppv1jfCRh9jDUwcQ27QL3b3xUs3u4EIGlkeRdg+RyUvCBQZJD+9HfKcxQskR
	mRRCyFEKzSs1u4RwXLWM/7ylhzGu2DL6noVs28B4veqUphV63Y1411Sl/UarrTZdiABQYGV3Wu9fD
	BTLBPYNZ9Xsqsz/X7NfyFMDO1qAGkxPt1tsyFtF5JhUDvsoOo2vaAgWhXlbonQzqVpLodcKwzrtyI
	7dw24r1B1+ryxnaFiyFN3vnc2eHsNrILHn4Da4oTRiUwa3r5Ay9oAbGofG7KSuT4dlPtIY4XHISQn
	iK2MvRaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPez2-0000000FPXj-19lc;
	Fri, 05 Jul 2024 09:12:00 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPeyz-0000000FPWP-30gu
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720170717; x=1751706717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CnlF5E4a5lr4vVeUZDKo/2jjL1AfhYBBcKFIy4jthv8=;
  b=d6hSEYPVMyGYVo3jJ3Ra1ARqQzYRNZz02Re2vYCXcMLsExiaRtqk7+my
   9y1Ts6oM0cZt1iJwkyCmwVRxsm1+ACwvb5HNRCojOKO6sijUD5eiVdlH2
   p5rz3mtENk3dlcz2uR5JKdIZgRtxmc22AVoXjl5MJoDJpN8JH9F1q8K8s
   jWoUm2trvZ9vMcZtYoWUt+4/xsXlcJsIVsDUc9UbfDloQuF1aGIxZgVC/
   3yTLFaskLuSFTTryxWVVlIM5v89s18pP5OYmyqTGSTzEzwNpm0P3pg4i6
   Iw/xPLKhcQ9KgOlsKKcJHQ0VeqxN1p+YnkbBSvRAFvxEVuG6egOO/mzAj
   A==;
X-CSE-ConnectionGUID: rWHCCNcWTxGwwTOK6RCgYw==
X-CSE-MsgGUID: 3LWYitK9RQWPAvaC1lU+9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="20362107"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="20362107"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 02:11:55 -0700
X-CSE-ConnectionGUID: MUT4jryPTyesu5F/VdEC4A==
X-CSE-MsgGUID: JQ705aqCRrSj5eeLcxr05g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="46937506"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Jul 2024 02:11:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPeyr-000SAm-1J;
	Fri, 05 Jul 2024 09:11:49 +0000
Date: Fri, 5 Jul 2024 17:11:11 +0800
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
Subject: Re: [PATCH v7 8/8] Bluetooth: btusb: mediatek: add ISO data
 transmission functions
Message-ID: <202407051652.C743BIjp-lkp@intel.com>
References: <20240704060116.16600-9-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704060116.16600-9-chris.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_021157_792731_DD224B13 
X-CRM114-Status: GOOD (  10.14  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on next-20240703]
[cannot apply to bluetooth/master linus/master v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth-btusb-mediatek-remove-the-unnecessary-goto-tag/20240705-043833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240704060116.16600-9-chris.lu%40mediatek.com
patch subject: [PATCH v7 8/8] Bluetooth: btusb: mediatek: add ISO data transmission functions
config: i386-buildonly-randconfig-001-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051652.C743BIjp-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051652.C743BIjp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051652.C743BIjp-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_recv_acl':
   btmtk.c:(.text+0x749): undefined reference to `usb_disable_autosuspend'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   btmtk.c:(.text+0x789): undefined reference to `usb_alloc_urb'
   ld: btmtk.c:(.text+0x81d): undefined reference to `usb_anchor_urb'
   ld: btmtk.c:(.text+0x829): undefined reference to `usb_submit_urb'
   ld: btmtk.c:(.text+0x836): undefined reference to `usb_free_urb'
   ld: btmtk.c:(.text+0x880): undefined reference to `usb_unanchor_urb'
   ld: btmtk.c:(.text+0x889): undefined reference to `usb_free_urb'
   ld: btmtk.c:(.text+0x89e): undefined reference to `usb_free_urb'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_submit_intr_urb':
   btmtk.c:(.text+0x8db): undefined reference to `usb_alloc_urb'
   ld: btmtk.c:(.text+0x991): undefined reference to `usb_anchor_urb'
   ld: btmtk.c:(.text+0x99a): undefined reference to `usb_submit_urb'
   ld: btmtk.c:(.text+0x9a7): undefined reference to `usb_free_urb'
   ld: btmtk.c:(.text+0xa18): undefined reference to `usb_unanchor_urb'
   ld: btmtk.c:(.text+0xa28): undefined reference to `usb_free_urb'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_suspend':
   btmtk.c:(.text+0xa92): undefined reference to `usb_kill_anchored_urbs'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
   btmtk.c:(.text+0xb15): undefined reference to `usb_autopm_get_interface'
   ld: btmtk.c:(.text+0xb51): undefined reference to `usb_autopm_put_interface'
   ld: btmtk.c:(.text+0xc0f): undefined reference to `usb_autopm_put_interface'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_isointf_init.constprop.0':
   btmtk.c:(.text+0xefc): undefined reference to `usb_set_interface'
>> ld: btmtk.c:(.text+0x1063): undefined reference to `usb_kill_anchored_urbs'
   ld: drivers/bluetooth/btmtk.o: in function `alloc_mtk_intr_urb':
   btmtk.c:(.text+0x113c): undefined reference to `usb_alloc_urb'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   btmtk.c:(.text+0x12bb): undefined reference to `usb_anchor_urb'
   ld: btmtk.c:(.text+0x12c7): undefined reference to `usb_submit_urb'
   ld: btmtk.c:(.text+0x13e6): undefined reference to `usb_unanchor_urb'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_reg_read':
   btmtk.c:(.text+0x14cb): undefined reference to `usb_control_msg'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_uhw_reg_write':
   btmtk.c:(.text+0x1559): undefined reference to `usb_control_msg'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_uhw_reg_read':
   btmtk.c:(.text+0x1609): undefined reference to `usb_control_msg'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_intr_complete':
   btmtk.c:(.text+0x170f): undefined reference to `usb_anchor_urb'
   ld: btmtk.c:(.text+0x171b): undefined reference to `usb_submit_urb'
   ld: btmtk.c:(.text+0x1779): undefined reference to `usb_unanchor_urb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

