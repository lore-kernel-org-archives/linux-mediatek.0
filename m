Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97892C25B76
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jun 2024 06:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TK5JZcMa/FULxTuXVOvJeLZjO0PcpEf+5HlSvVMtplc=; b=gm9+T4CorozWsqeZM7wANdtB60
	ZEYpPJ2jzz4aZdN3F5z3d1/wTGL1LvWlDCNAOkQP2XXrxD/gfcDuoycaAQVChb7CPQM3Vms5MQCam
	7TbXPM+iRGS258QOA3NibUsgaeuc2iZ6Ovmln4HyuFfgtpM55i517p/+OztwMRGFUPmJJSCb+TZ6l
	Dqly+84hJFRuX1sfIeg78Aqzd9DYpU2uKINCwAPThmw1U4gQanLqdQZZ3vtuEyF042q08SPfnSWYk
	MX3egVL9bgPTpVhhQsrVqb9iFXTaQN0lRZu+Xo3EOeYvtySpqagU6X8N4EvDJf7LIra/6HkYnRcEY
	+7zmcNDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFpla-0000000Gmde-3794;
	Sat, 08 Jun 2024 06:41:30 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFplX-0000000Gmd6-40Jq
	for linux-mediatek@lists.infradead.org;
	Sat, 08 Jun 2024 06:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717828888; x=1749364888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pz6JJDnPVbtOuWZggs2YrW4Hk1PhUbc/pSMDPeFzVXU=;
  b=Z/bl6l9e9gJMxQRVyzyCwd01zujd0ERDfRIhtqNkhoD+PIPYw9Kd/9V0
   xInmERV4gdHsN2iIEYZ2JudTA2foS1yhyr/lNULYuFF0tRmKIP56Yxogb
   +oPZkrWAOSUdd0WQ5zy7s7KrytuElgzRhEaQbKjtHwCr1w8KcImpXlC8g
   Z7pxwPQPQbsMN88GQGNBWYAhHK3kVZQFqzpz0+U2oCnYkN44X3UhOJnCe
   wn58VxfltP2gt9INaAPURK5Hbt630fJryZ96+5wwKYLQxq/buvmF+X1m1
   Q7hrbHtkWYUkZr26SJtZWyk7i476nkiTTQNmP4Rlj8QqmT5AINjGCGy0z
   g==;
X-CSE-ConnectionGUID: Y1gV85KSSPyMmoI7Bn2zvg==
X-CSE-MsgGUID: b6nB05MjQLOPQ0kQnnSQoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25665531"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="25665531"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 23:41:24 -0700
X-CSE-ConnectionGUID: rQiIXXhXQLam8mUrsUe/EQ==
X-CSE-MsgGUID: HQDi8NehR1GPayLwmC8BdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="39212369"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jun 2024 23:41:21 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFplO-0001CA-1c;
	Sat, 08 Jun 2024 06:41:18 +0000
Date: Sat, 8 Jun 2024 14:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Von Dentz <luiz.dentz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Chris Lu <chris.lu@mediatek.com>
Subject: Re: [PATCH v4 4/4] Bluetooth: btusb: mediatek: add ISO data
 transmission functions
Message-ID: <202406081451.S72dkwTp-lkp@intel.com>
References: <20240606114321.30515-5-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606114321.30515-5-chris.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_234128_134118_9FEE0664 
X-CRM114-Status: GOOD (  11.92  )
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
[also build test WARNING on next-20240607]
[cannot apply to bluetooth/master linus/master v6.10-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth-net-add-hci_iso_hdr-function-for-iso-data/20240606-194619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240606114321.30515-5-chris.lu%40mediatek.com
patch subject: [PATCH v4 4/4] Bluetooth: btusb: mediatek: add ISO data transmission functions
config: arm-omap2plus_defconfig (https://download.01.org/0day-ci/archive/20240608/202406081451.S72dkwTp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081451.S72dkwTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081451.S72dkwTp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/btusb.c:28:
   drivers/bluetooth/btmtk.h: In function 'btmtk_isopkt_pad':
>> drivers/bluetooth/btmtk.h:259:16: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     259 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~~~~~~~~~~~~~~


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

