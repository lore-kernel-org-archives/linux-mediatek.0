Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC88C3271F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 06:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DR5hN2OQXapoHl3tTMTDpRqBQFK+zPTFjZYInKtu+tI=; b=eUMjtAZrWH1Hd6FfHUKMe7AUGf
	6NA1HIzYQS0zfkc8mC1KsM4tbm81Akjp67cxLtQvTUBCrQD1GcxQ1IH2uwqIdZ1Ae2hcICA6GLTU/
	/dMlJmFXBOHQ5k8hkXNUSQ34t+V7/6yGVcs6gp0gHxzDj1KV0kxyfdzmF1bxuC3FXtjtbnmjJsdvD
	YfFHqFWmejTwoRhqERnNleOD7T/JfLQ+YPMDZNa2Ruyy29PG7IdPvvt+yUxalMGgrMoXSZRysEAra
	4Eu1peldVUvOOOLT66XqD6DbOaTjwOdb4WTe84RBeNiFi9P9WXFNy78ZPmH5cTzBl3vcjO0p/2e/0
	DnPPziwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPc96-0000000F0hP-3GeM;
	Fri, 05 Jul 2024 06:10:12 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPc93-0000000F0gA-0oaO
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 06:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720159810; x=1751695810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2M0fguvjxnITBIXwZE83kBtpWTCgS/US+uG4BdqttDE=;
  b=e7qMgmU0wBtYsCM3jHFqRgTDjLM/eX6tRtqRWHk3g90cZ0hIu3mI0o+t
   acOsc1Qb5LabV3tD0X6wkOJpCZGyD9HpGGr7+D3scmbZleOHW54cjEXcU
   Slu9Nr/rqDFSkpIYyYlWamhWbVsSP8YZue6K+81PZz4b/a96nnmS2ph6+
   9SodQUGjPBDeZ3AGvTFfxFd3vvV3hFIpWySZ76INsGxGy9SjmMWsUKGrc
   QtPQ9TvF7BJwAJJr7/8hl6Saj3g+LQxTkIqebQPe7rVDVUKx5jRlp1F4v
   hcKXD4fqL/YzCk2shUWAULLgzgw8oFZ78F0Fjgu9aVPlFl4rwyz2soMTF
   Q==;
X-CSE-ConnectionGUID: s160lBovSN6qx/SL5VzyfQ==
X-CSE-MsgGUID: bKeUS4JxRgmiuRNzmaBFAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17587072"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="17587072"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 23:10:09 -0700
X-CSE-ConnectionGUID: faNjunHSSmudEYsE/gcmUA==
X-CSE-MsgGUID: K4hQdQ3qSj68keOXZfwe/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="77518698"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jul 2024 23:10:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPc8x-000S0l-21;
	Fri, 05 Jul 2024 06:10:03 +0000
Date: Fri, 5 Jul 2024 14:09:38 +0800
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
Subject: Re: [PATCH v7 5/8] Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to
 btmtk.c
Message-ID: <202407051325.i8Ac4Nz9-lkp@intel.com>
References: <20240704060116.16600-6-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704060116.16600-6-chris.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_231009_310361_DABE0467 
X-CRM114-Status: GOOD (  10.55  )
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
patch link:    https://lore.kernel.org/r/20240704060116.16600-6-chris.lu%40mediatek.com
patch subject: [PATCH v7 5/8] Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c
config: i386-buildonly-randconfig-001-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051325.i8Ac4Nz9-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051325.i8Ac4Nz9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051325.i8Ac4Nz9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   btmtk.c:(.text+0x731): undefined reference to `usb_alloc_urb'
>> ld: btmtk.c:(.text+0x7c5): undefined reference to `usb_anchor_urb'
>> ld: btmtk.c:(.text+0x7d1): undefined reference to `usb_submit_urb'
>> ld: btmtk.c:(.text+0x7de): undefined reference to `usb_free_urb'
>> ld: btmtk.c:(.text+0x820): undefined reference to `usb_unanchor_urb'
   ld: btmtk.c:(.text+0x829): undefined reference to `usb_free_urb'
   ld: btmtk.c:(.text+0x83e): undefined reference to `usb_free_urb'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
   btmtk.c:(.text+0x8bd): undefined reference to `usb_autopm_get_interface'
>> ld: btmtk.c:(.text+0x8f9): undefined reference to `usb_autopm_put_interface'
   ld: btmtk.c:(.text+0x9bf): undefined reference to `usb_autopm_put_interface'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   btmtk.c:(.text+0xb67): undefined reference to `usb_anchor_urb'
   ld: btmtk.c:(.text+0xb73): undefined reference to `usb_submit_urb'
   ld: btmtk.c:(.text+0xc8e): undefined reference to `usb_unanchor_urb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

