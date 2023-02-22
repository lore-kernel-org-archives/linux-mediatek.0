Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F2FC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 08:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SY2iT71R9QwtbeUZ4s/cTm40xaWy93Qq4Yc+u1BselQ=; b=4P43Si9zTXw/JvDuMO2cVJVYdB
	Jts1/fPQ1qIux8yyUA99tUDtf8pclvxYm4Ii+wgNCtwO7s3T7Q16HOwtzuW+T8JNSUxj5nbvmNmhN
	WOXQZtT7tUR/cjlmTVT9uZUMby06LkPWJJYqpT8g/5EsrRJlEVGBNsRyr2Gl4RL83E7o3cftvtjtE
	TiJcaW7dm40H7jNyUSN7DBCpY+BAEorNePgxbUkIkhZLpLzpCTCTfKj8JmVutakOVeUhsQ5WBNSg+
	bBcLPxB2J6o+VrBqm+HPH6pablYejiu1FrtlWxB6PFGMxKZgeggOgDymg6OtQB8DZyKovmlJBk4Nm
	mvAysabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUkgH-00BGRc-DS; Wed, 22 Feb 2023 08:40:53 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUkgE-00BGQ5-6y
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 08:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677055250; x=1708591250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gP3sT20/P41bGg8fPMMx5wJn2xCfBdfuCU5S4XCnPfw=;
  b=RwkTLFCUBzCCggxf6deXwgo9zoSKyZS2WHk/LcEL5RVZMvta1oUrmWoi
   a7kGVlCjIJaOu++zxr2gkJ3qvwyr4uJYJpVAdpN9svg0JTkh90cmvh73e
   c9nSCvQEYMx/QJAcFDFnIjwOk0cjU9WL+FzzGcQwZvIe0ybpt35G/m0/P
   UE1GJTdfVFafbZ4+3Vwq+ePndJMrHqo7JrizjpFug0R5KJfi++VDbm7qX
   +rCXW/LF4jOGGF6YmZRQDEi6JZPhtUtlA7sD3Ltwyfr6vLFN5g1wCFb3I
   mIFRfptOIUlh/nFkfnJDKuSbc0IxAyu4uJ0UW5QWIJKSOSwljy9dVv6wg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="316595193"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="316595193"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 00:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="760878061"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="760878061"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2023 00:39:04 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUkeV-0000Ag-2U;
	Wed, 22 Feb 2023 08:39:03 +0000
Date: Wed, 22 Feb 2023 16:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sujuan Chen <sujuan.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: oe-kbuild-all@lists.linux.dev,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Bo Jiao <bo.jiao@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Sujuan Chen <sujuan.chen@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7915: add dev->hif2 support for mt7916 WED
 device
Message-ID: <202302221620.bpkNoy9N-lkp@intel.com>
References: <5dcd2b1b74b7c46ba4245f96eaf3a4e2f84b37e7.1677039727.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dcd2b1b74b7c46ba4245f96eaf3a4e2f84b37e7.1677039727.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_004050_395982_4B319D27 
X-CRM114-Status: GOOD (  14.26  )
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

Hi Sujuan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.2 next-20230222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sujuan-Chen/wifi-mt76-mt7915-add-dev-hif2-support-for-mt7916-WED-device/20230222-143114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/5dcd2b1b74b7c46ba4245f96eaf3a4e2f84b37e7.1677039727.git.ryder.lee%40mediatek.com
patch subject: [PATCH] wifi: mt76: mt7915: add dev->hif2 support for mt7916 WED device
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230222/202302221620.bpkNoy9N-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b87d9f0ad8413128e108128b7f95e2b90db406cc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sujuan-Chen/wifi-mt76-mt7915-add-dev-hif2-support-for-mt7916-WED-device/20230222-143114
        git checkout b87d9f0ad8413128e108128b7f95e2b90db406cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/wireless/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221620.bpkNoy9N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c: In function 'mt7915_mcu_init_firmware':
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:2373:56: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
    2373 |         if (mtk_wed_device_active(&dev->mt76.mmio.wed) &&


vim +2373 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c

  2340	
  2341	int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
  2342	{
  2343		int ret;
  2344	
  2345		/* force firmware operation mode into normal state,
  2346		 * which should be set before firmware download stage.
  2347		 */
  2348		mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
  2349	
  2350		ret = mt7915_driver_own(dev, 0);
  2351		if (ret)
  2352			return ret;
  2353		/* set driver own for band1 when two hif exist */
  2354		if (dev->hif2) {
  2355			ret = mt7915_driver_own(dev, 1);
  2356			if (ret)
  2357				return ret;
  2358		}
  2359	
  2360		ret = mt7915_load_firmware(dev);
  2361		if (ret)
  2362			return ret;
  2363	
  2364		set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
  2365		ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, 0);
  2366		if (ret)
  2367			return ret;
  2368	
  2369		ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, 0);
  2370		if (ret)
  2371			return ret;
  2372	
> 2373		if (mtk_wed_device_active(&dev->mt76.mmio.wed) &&
  2374		    is_mt7915(&dev->mt76) || !mtk_wed_get_rx_capa(&dev->mt76.mmio.wed))
  2375			mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(CAPABILITY), 0, 0, 0);
  2376	
  2377		ret = mt7915_mcu_set_mwds(dev, 1);
  2378		if (ret)
  2379			return ret;
  2380	
  2381		ret = mt7915_mcu_set_muru_ctrl(dev, MURU_SET_PLATFORM_TYPE,
  2382					       MURU_PLATFORM_TYPE_PERF_LEVEL_2);
  2383		if (ret)
  2384			return ret;
  2385	
  2386		ret = mt7915_mcu_init_rx_airtime(dev);
  2387		if (ret)
  2388			return ret;
  2389	
  2390		return mt7915_mcu_set_red(dev, mtk_wed_device_active(&dev->mt76.mmio.wed));
  2391	}
  2392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

