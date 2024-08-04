Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA734C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Aug 2024 02:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ofk3ttt9Z17RBVQzFM9I9nqKGgMe8AXETtHvfhuz1LQ=; b=AMwhJ/n+WQFGBRFx+H3ErBQUvs
	z3h4tsVDMIAB1vk9gD6aKLH9zgNdARguthvK+gfJDrEtcOGcJaoRT3wTuHIewWNJxhvd5C3ikJq/d
	c1x60DGjlW7uiebAN344VjFAqPfa/pEBGiXBIb7UtFyqwo7uUiHFd1QeY9UDtJpStrpmXofqipb3n
	3IEs55IJgiU8OA3b1HGLG2bKqKEe1d+DNn6zv/4d6fsWRHdHCfFhsJli6q6cJ7vAcxKLeSvhKeYfI
	5S1q/Agc0UG7dSozZ2i4DF0DO0Os7TTwmHq6i3mu19dU+fliHY6qnp/4trwLZQIRSjA/VdkXL0VWJ
	bykrUsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saRGf-0000000CWKh-40lk;
	Sun, 04 Aug 2024 02:46:46 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saRGc-0000000CWKC-1Cf3;
	Sun, 04 Aug 2024 02:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722739602; x=1754275602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UZPIB9k/6HryMcopKOFaXfW3Di8l2l4XGoixC2YRSz8=;
  b=Kt5Wtm+oaMKcMT2tQzgN8INXS+cnyPk89kvwTbqF/K5ItGPOCxpRtuFH
   ggXakjEs2UwPxE94y61ImYTwvoGx1Pe5l/9RCDTBh7n0c8vDLohR8FHdh
   /L3AaQM26a310pJW+6tfu2m3MGlBnH2TLXH9ZtfD0mEnBIHb3uxmQvMia
   jN/GAk9XAtwZ0N9pWopEYfi16KFjC62xDCCkrGRgycGjBwzjabOVrJcOu
   EK7McUfvUAxEtsmV1SjCg8Z/AVRaQCj0WIePWahIawxTUecvTC+9z9DAl
   nvyQySVzPLF/1UM45B9U7gN1BGmUrwNsYNa5kXOf7X7jtgTQWqhSe5s6n
   A==;
X-CSE-ConnectionGUID: pJ1VveQ1RVi3551gli+EyA==
X-CSE-MsgGUID: jLRVHCNWRY+OU8P6xNshYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="31305313"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="31305313"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 19:46:12 -0700
X-CSE-ConnectionGUID: tUdbOXShQoy0NydWwrTSUQ==
X-CSE-MsgGUID: oWFehfiCQXOYzSahTnzoKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="55909432"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Aug 2024 19:46:08 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saRG1-000163-1x;
	Sun, 04 Aug 2024 02:46:05 +0000
Date: Sun, 4 Aug 2024 10:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Shengyu Qu <wiagn233@outlook.com>, nbd@nbd.name, lorenzo@kernel.org,
	ryder.lee@mediatek.com, shayne.chen@mediatek.com,
	sean.wang@mediatek.com, kvalo@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, chui-hao.chiu@mediatek.com,
	emmanuel.grumbach@intel.com, StanleyYP.Wang@mediatek.com,
	meichia.chiu@mediatek.com, johannes.berg@intel.com,
	quic_adisi@quicinc.com, allen.ye@mediatek.com, bo.jiao@mediatek.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Shengyu Qu <wiagn233@outlook.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>
Subject: Re: [PATCH v5] wifi: mt76: mt7915: add wds support when wed is
 enabled
Message-ID: <202408041039.BqVRJOqp-lkp@intel.com>
References: <TY3P286MB2611CB2F4F5FA27D782AA80A98BC2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3P286MB2611CB2F4F5FA27D782AA80A98BC2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240803_194642_401053_1F42A751 
X-CRM114-Status: GOOD (  11.65  )
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

Hi Shengyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengyu-Qu/wifi-mt76-mt7915-add-wds-support-when-wed-is-enabled/20240803-231632
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/TY3P286MB2611CB2F4F5FA27D782AA80A98BC2%40TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
patch subject: [PATCH v5] wifi: mt76: mt7915: add wds support when wed is enabled
config: x86_64-buildonly-randconfig-003-20240804 (https://download.01.org/0day-ci/archive/20240804/202408041039.BqVRJOqp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408041039.BqVRJOqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408041039.BqVRJOqp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c: In function 'mt7915_mcu_init_firmware':
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:2363:67: error: 'struct mtk_wed_device' has no member named 'rev_id'
    2363 |                                                 dev->mt76.mmio.wed.rev_id, 0);
         |                                                                   ^


vim +2363 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c

  2322	
  2323	int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
  2324	{
  2325		int ret;
  2326	
  2327		/* force firmware operation mode into normal state,
  2328		 * which should be set before firmware download stage.
  2329		 */
  2330		mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
  2331	
  2332		ret = mt7915_driver_own(dev, 0);
  2333		if (ret)
  2334			return ret;
  2335		/* set driver own for band1 when two hif exist */
  2336		if (dev->hif2) {
  2337			ret = mt7915_driver_own(dev, 1);
  2338			if (ret)
  2339				return ret;
  2340		}
  2341	
  2342		ret = mt7915_load_firmware(dev);
  2343		if (ret)
  2344			return ret;
  2345	
  2346		set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
  2347		ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, 0);
  2348		if (ret)
  2349			return ret;
  2350	
  2351		ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, 0);
  2352		if (ret)
  2353			return ret;
  2354	
  2355		if (mtk_wed_device_active(&dev->mt76.mmio.wed)) {
  2356			if (is_mt7915(&dev->mt76) ||
  2357			    !mtk_wed_get_rx_capa(&dev->mt76.mmio.wed))
  2358				ret = mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(CAPABILITY),
  2359							0, 0, 0);
  2360			else
  2361				ret = mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
  2362							MCU_WA_PARAM_WED_VERSION,
> 2363							dev->mt76.mmio.wed.rev_id, 0);
  2364			if (ret)
  2365				return ret;
  2366		}
  2367	
  2368		ret = mt7915_mcu_set_mwds(dev, 1);
  2369		if (ret)
  2370			return ret;
  2371	
  2372		ret = mt7915_mcu_set_muru_ctrl(dev, MURU_SET_PLATFORM_TYPE,
  2373					       MURU_PLATFORM_TYPE_PERF_LEVEL_2);
  2374		if (ret)
  2375			return ret;
  2376	
  2377		ret = mt7915_mcu_init_rx_airtime(dev);
  2378		if (ret)
  2379			return ret;
  2380	
  2381		return mt7915_mcu_set_red(dev, mtk_wed_device_active(&dev->mt76.mmio.wed));
  2382	}
  2383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

