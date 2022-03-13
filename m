Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d412117bjH7ykM3GO6xWOWFUXTs24Jn7FZ9GKONGvFU=; b=MQHCckGyeuGycE
	BWqwdon2HxkrOISuA0UkR/FgVqQWD1wIQNZ8Sl7CIaAZ5Gb63YkCm68rFQ9xb8arDY2/Tkq2kPF9q
	KfGICS88QfgT5F7GHAc6zW1K35KIGcIVs7M4NqpGOXt8G/CoibmjWRgKVEe0a4tx0JgtT7QoaOVB3
	tsZrVVkpNKJPqIJB/BbHYTuOLP44Q5ph/uCNDa9ClJ5cxNwbIDdtOT8xWlhe40N2sv4oqA4oam0We
	T0KE64AulIFqMuyQCZWHFpXuSJNyjD9Ur5LX5QooK5A8UmzvhhFxIj8dKKDuR+HSQnHL/M1gPDsoB
	ejhOGBFQoGHffY8LXY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTPoO-002uxt-Dj; Sun, 13 Mar 2022 15:07:12 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTPoK-002uxZ-Gu
 for linux-mediatek@lists.infradead.org; Sun, 13 Mar 2022 15:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647184028; x=1678720028;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mmvI+t9c7JC+R20YEUrxGV58zTdAMt/4tplAzgcpDE8=;
 b=hDLjTHll7ljOU5PKTvYs31ut09oNJbCEBk20WfCg/Strcva6raujzdpj
 jEIG+IucmtNrFC9snePl3lUGMy2V/sSJ0g7ouMvSHZOdFrj7zfb/v7msk
 sYRPAeCv8nfkqGcb2XRLAYeNrqOit9Af2TMBdtLFmu8CUGicAgr+oqyM3
 xa39A45GxWOcCE74GaF/MxIQZzsG8sPOeFcSNsUcQet2uQsckFsrxPWdu
 JIVj5FV9CpKEgqWxqv/QwrlmE2ECgGsTzzmO40o7PW4YPp7/yh2Zc7/Z3
 XuOoL+hVwx7MHtjnbgPM0OFs55N4ulqPdVykkNmbi40rbFG01VMuEVtuj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="235824157"
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; d="scan'208";a="235824157"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 08:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; d="scan'208";a="713437404"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 13 Mar 2022 08:06:59 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nTPoA-00093C-Ix; Sun, 13 Mar 2022 15:06:58 +0000
Date: Sun, 13 Mar 2022 23:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, nbd@nbd.name
Cc: kbuild-all@lists.01.org, linux-wireless@vger.kernel.org,
 lorenzo.bianconi@redhat.com, sean.wang@mediatek.com,
 deren.wu@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 9/9] mt76: mt7921: add mt7921u driver
Message-ID: <202203132225.CbMappWu-lkp@intel.com>
References: <af6cc4770cfed30a3baba5897c737008e0584719.1647175554.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af6cc4770cfed30a3baba5897c737008e0584719.1647175554.git.lorenzo@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_080708_619141_BF66A588 
X-CRM114-Status: GOOD (  11.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Lorenzo,

I love your patch! Yet something to improve:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on next-20220310]
[cannot apply to wireless/main v5.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lorenzo-Bianconi/introduce-mt7921u-driver/20220313-205210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220313/202203132225.CbMappWu-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/63a67380659a7ab972a09206bc2b581fdb6766b6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lorenzo-Bianconi/introduce-mt7921u-driver/20220313-205210
        git checkout 63a67380659a7ab972a09206bc2b581fdb6766b6
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7921/usb_mac.c: In function 'mt7921u_mac_reset':
>> drivers/net/wireless/mediatek/mt76/mt7921/usb_mac.c:224:8: error: too many arguments to function 'mt7921u_dma_init'
     224 |  err = mt7921u_dma_init(dev, false);
         |        ^~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7921/usb_mac.c:124:5: note: declared here
     124 | int mt7921u_dma_init(struct mt7921_dev *dev)
         |     ^~~~~~~~~~~~~~~~


vim +/mt7921u_dma_init +224 drivers/net/wireless/mediatek/mt76/mt7921/usb_mac.c

   196	
   197	int mt7921u_mac_reset(struct mt7921_dev *dev)
   198	{
   199		int err;
   200	
   201		mt76_txq_schedule_all(&dev->mphy);
   202		mt76_worker_disable(&dev->mt76.tx_worker);
   203	
   204		set_bit(MT76_RESET, &dev->mphy.state);
   205		set_bit(MT76_MCU_RESET, &dev->mphy.state);
   206	
   207		wake_up(&dev->mt76.mcu.wait);
   208		mt7921_mcu_exit(dev);
   209	
   210		mt76u_stop_rx(&dev->mt76);
   211		mt76u_stop_tx(&dev->mt76);
   212	
   213		mt7921u_wfsys_reset(dev);
   214	
   215		clear_bit(MT76_MCU_RESET, &dev->mphy.state);
   216		err = mt76u_resume_rx(&dev->mt76);
   217		if (err)
   218			goto out;
   219	
   220		err = mt7921u_mcu_power_on(dev);
   221		if (err)
   222			goto out;
   223	
 > 224		err = mt7921u_dma_init(dev, false);

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
