Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A10CDB483
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuepSk48zjq0WiqtgGt9Ag/5eHScpXcmGXSyg20NzKs=; b=YX7Qn3xcXMf6ks9iyZoLwWwnYh
	dGvdxuW0l5/KtBfwYQ7/FQFsPkD8YXuaOQS1mMaG9QYqtXc88c6s3VDB0/5bZUNGKl00EnI2wU3Gm
	901JvAMJvQoJ21vA97Vm5+Lh+pVix2lH7bIZLeuC0l/iwJu9dV5w2G1iwBW/tP6tZDZl+QOvs62gb
	DeV9D+mqnsTz4s9NFH/JLGpBUpnrAg7/ejByz+Ip30W27n8C/ynAQHj/4e4BKv603SKgmvEcdPkzO
	3vUpbPk0sf23m/hVMPuxhp0WabbJ/k8wl3sykrvD6Atv8KZu88yDiRErF4oyB1gFktbDkhRoALLQe
	KF6fiNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrFLs-0033VO-1S;
	Fri, 13 Oct 2023 10:25:04 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrFLo-0033UP-1o;
	Fri, 13 Oct 2023 10:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697192700; x=1728728700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XVTI+KtH248Y6N2mDkGmVGWxc0Mtj1GwtiXmRY/C2Xo=;
  b=L17zPuYNHZUE6zpb7m2DFHOp814RWRTaQmaEFgFX5P4KbzkEsLecxYPi
   Y0XKUjs8of6nMZbV+DDH9phB6qiIhdcm11aitEzF9Ex9HsiRcgRLkxJQf
   qcPMwBk4Ca/MbM9HdgnGc9sm6Gz1xQdFHMx//qVn0JeHqq6atwkBqGEo+
   ixivsOr5jKcVLY2Fs+Y4WPMAeoACaXloLJG4APFN2dliM19y+oiEHrsBf
   CDxYCKpiDa+Zir4ZAGtCGjHHgAlXZMDTxoN3almQUrq1VnphUWVbsvOip
   APXRy545t/XUyvPAh3R8th3AGXpPVaOA6ayomRUA9WEAxicySwIPxmZTX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375499629"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="375499629"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731318523"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="731318523"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 03:24:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrFLa-0004cw-29;
	Fri, 13 Oct 2023 10:24:46 +0000
Date: Fri, 13 Oct 2023 18:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: Zhengping Jiang <jiangzp@google.com>, linux-bluetooth@vger.kernel.org,
	marcel@holtmann.org, luiz.dentz@gmail.com
Cc: oe-kbuild-all@lists.linux.dev,
	chromeos-bluetooth-upstreaming@chromium.org,
	Zhengping Jiang <jiangzp@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [kernel PATCH v2] Bluetooth: btmtksdio: enable bluetooth wakeup
 in system suspend
Message-ID: <202310131817.oEUPvya8-lkp@intel.com>
References: <20231011153928.kernel.v2.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011153928.kernel.v2.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_032500_643232_BC757D0D 
X-CRM114-Status: GOOD (  14.17  )
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

Hi Zhengping,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master linus/master v6.6-rc5 next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhengping-Jiang/Bluetooth-btmtksdio-enable-bluetooth-wakeup-in-system-suspend/20231012-064116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20231011153928.kernel.v2.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc%40changeid
patch subject: [kernel PATCH v2] Bluetooth: btmtksdio: enable bluetooth wakeup in system suspend
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131817.oEUPvya8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131817.oEUPvya8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131817.oEUPvya8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btmtksdio.c:1501:12: warning: 'btmtksdio_system_resume' defined but not used [-Wunused-function]
    1501 | static int btmtksdio_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bluetooth/btmtksdio.c:1464:12: warning: 'btmtksdio_system_suspend' defined but not used [-Wunused-function]
    1464 | static int btmtksdio_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/btmtksdio_system_resume +1501 drivers/bluetooth/btmtksdio.c

  1463	
> 1464	static int btmtksdio_system_suspend(struct device *dev)
  1465	{
  1466		struct sdio_func *func = dev_to_sdio_func(dev);
  1467		struct btmtksdio_dev *bdev;
  1468	
  1469		bdev = sdio_get_drvdata(func);
  1470		if (!bdev)
  1471			return 0;
  1472	
  1473		if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
  1474			return 0;
  1475	
  1476		set_bit(BTMTKSDIO_BT_WAKE_ENABLED, &bdev->tx_state);
  1477	
  1478		return btmtksdio_runtime_suspend(dev);
  1479	}
  1480	
  1481	static int btmtksdio_runtime_resume(struct device *dev)
  1482	{
  1483		struct sdio_func *func = dev_to_sdio_func(dev);
  1484		struct btmtksdio_dev *bdev;
  1485		int err;
  1486	
  1487		bdev = sdio_get_drvdata(func);
  1488		if (!bdev)
  1489			return 0;
  1490	
  1491		if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
  1492			return 0;
  1493	
  1494		err = btmtksdio_drv_pmctrl(bdev);
  1495	
  1496		bt_dev_dbg(bdev->hdev, "status (%d) get ownership from device", err);
  1497	
  1498		return err;
  1499	}
  1500	
> 1501	static int btmtksdio_system_resume(struct device *dev)
  1502	{
  1503		return btmtksdio_runtime_resume(dev);
  1504	}
  1505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

