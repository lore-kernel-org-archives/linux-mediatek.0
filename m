Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC6FC27C54
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 23:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Mr4fyngr6ftHVNi2kPcHIFknWJx3FU8rR9+8zp9npA=; b=quh/Sfgz2tLeztGyqQCXjHTmFo
	DWzD6CJckT51AUWYJqN8UV+Zhi5hS4J8EU59P4kl5AJIkyyZySAftEIi5ElQW/1ir4cavMtD2Ikb5
	pyqZmqOFmf6IQHTaosymr5QKCkt96xYtV3WbU6052J82KkAqhi96+HvFU8/+Otnq+8r6JuGcUgq6U
	UgC8YlcZEBwTcEMpWzya3tQlUvZwZ5Oa3mTWNdIPFzvnQUN8t4XAQcV90LeiLD3D1AZi0Xf1MPgVS
	acngVwMEA7wTq1MmnVpBKsKvJNquu6W3F57hpt6citdVBKsX1COOtbOsiVFvcxZTLhtVRuwy9naWE
	x1CVEAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFMvC-0000000Bl8Q-0Vsb;
	Thu, 06 Jun 2024 23:53:30 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFMv9-0000000Bl75-0Xr7
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 23:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717718007; x=1749254007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E/psiguQLxhslxk3Ia2n2N/Obzi4NeEoU2JEow9x5zs=;
  b=d9Ncydkqrj1IbJuMfHLhHdeXsBrCFX/cqjaZWXIvf+kpDBIh7GAArT4M
   YY5InRDmueSTIjd8t5ZCQnJoSH4SA8EvC5DRj0xjp0jKKeXxht85cERXl
   zjnc6XV93Nvbm8vl6ecLDwZvjv16WSvNGb2+QMwhnxYSL6+0zH6u4541Q
   EaSPwm8Kmed6tXMLT0mjGvZL+UO6xwN/zJf2QRTzt4JvOe98glnTw4WgD
   y5/+jTLNN0X5B3uEtdqRcRLZ2jHir+i/kMS2iUh6lfc4zVZj7cVO7F1xz
   bKSjCqbczQYOGWBPoe/BVJYir1b5skSX49dSXRB6fYdw01qBRjycBAAZm
   Q==;
X-CSE-ConnectionGUID: fkJnl3X7Qqa6nEzdTQS4Gw==
X-CSE-MsgGUID: cz4xz49fQiadwWIsY/BP8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14256667"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14256667"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 16:53:26 -0700
X-CSE-ConnectionGUID: qzxj3XGARuOCaxb2qIW7vg==
X-CSE-MsgGUID: ZUVJ06S5QWeSRKnoNgHKqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="69310958"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jun 2024 16:53:23 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFMv2-0003se-2y;
	Thu, 06 Jun 2024 23:53:20 +0000
Date: Fri, 7 Jun 2024 07:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Von Dentz <luiz.dentz@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Chris Lu <chris.lu@mediatek.com>
Subject: Re: [PATCH v4 4/4] Bluetooth: btusb: mediatek: add ISO data
 transmission functions
Message-ID: <202406070759.EDNrdv4q-lkp@intel.com>
References: <20240606114321.30515-5-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606114321.30515-5-chris.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_165327_243642_63B59434 
X-CRM114-Status: GOOD (  11.78  )
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
[also build test ERROR on next-20240606]
[cannot apply to bluetooth/master linus/master v6.10-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth-net-add-hci_iso_hdr-function-for-iso-data/20240606-194619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240606114321.30515-5-chris.lu%40mediatek.com
patch subject: [PATCH v4 4/4] Bluetooth: btusb: mediatek: add ISO data transmission functions
config: x86_64-buildonly-randconfig-003-20240607 (https://download.01.org/0day-ci/archive/20240607/202406070759.EDNrdv4q-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070759.EDNrdv4q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070759.EDNrdv4q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/bluetooth/btusb.c:28:
>> drivers/bluetooth/btmtk.h:259:9: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
     259 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +259 drivers/bluetooth/btmtk.h

   256	
   257	static int btmtk_isopkt_pad(struct hci_dev *hdev, struct sk_buff *skb)
   258	{
 > 259		return ERR_PTR(-EOPNOTSUPP);
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

