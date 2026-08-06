Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42220C5AC67
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 21:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OC10ZEOluFS/VVKaiWFZxFd6Wj1H/lb8zKFSE4udPgU=; b=MqrKW2HybyFc2qlDpQ1UHNK6a1
	WnELFo2N06iqWcFTIBDAwllgIlHZe1vLrZbBre1Dms8ktNy3KgkAPU6rcjA3EDsUzXRt3Kaclphba
	fgZWJcFXeaPB+RBodPSRKH1yzqq1ramyITk60UYPmR/fA9GvSnQjST39lsuB0RAEcz6B2JZO4MZIf
	I+4GK1N2+zBTCrtOcGc69YIQQzCfHL3S66p6WPKVeC7o6RyUM2uy7FwDevh3JcOyMQ6KAg7KSnbqn
	hUD45HJsCw8GM/rYgoRV1bzOgHo9ANc9IfLa9GMZfZicp2dvnUdZk9fTcPBjZpQI4OtZ+N2kd2YEJ
	d7tEjv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5Nh-00000006hlp-2aq8;
	Thu, 06 Aug 2026 21:12:01 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5Nc-00000006hlH-2S7z
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 21:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786050716; x=1817586716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tXWRzu2QjkjkMrRKthZt+8sxsjGH4nCQH73BAmW/Ubo=;
  b=WaOZQS65OBCLlZoBGB/fP7yeygoHK/NqkB/5sGu/+P8mfdbSfaaEq1xq
   GJ10didqLmtlBvVHNfye1NzpVHC0lTVTaqbEPrIfFObSe3aEHplR4flEn
   LpGdGyh3J930hUrWyefppSjQaxGvb4TaSHH9o6tZ/qc1mb5RJuh9hcV+h
   rXAZ5yTa3F30HsswCKqmyGLKb1UAOHwuwvCmazpHwnRwK0Tluy9r7jW6c
   XqSH2lTZy050fvKZEwBfcpmcmOkA+8XuSJSmVgz8Ixi9V7sWrQ8bqHpR7
   PZk6XWJM9A0XgZej8mGYwkYnIgFxyKXvAEtOAbWKtugyjeVZ4IPT9D/m3
   g==;
X-CSE-ConnectionGUID: 6YrC39RLRvmi/vmRahmg3g==
X-CSE-MsgGUID: dzCYYcAnSfmgZZ4K5rZjjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104060707"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="104060707"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:11:55 -0700
X-CSE-ConnectionGUID: 4j6H+A/sTDmnwF37oLj1+A==
X-CSE-MsgGUID: Amw0ygE8ReSyRfSe0k4srw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="258887367"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2026 14:11:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws5NW-00000000GFR-1NNI;
	Thu, 06 Aug 2026 21:11:50 +0000
Date: Fri, 7 Aug 2026 05:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: JB Tsai <jb.tsai@mediatek.com>, nbd@nbd.name, lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Sean.Wang@mediatek.com,
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
	Leon.Yen@mediatek.com, litien.chang@mediatek.com,
	jeff.hsu@mediatek.com, jb.tsai@mediatek.com
Subject: Re: [PATCH] wifi: mt76: mt7925: Add flag to control if need DMA
 re-init
Message-ID: <202608070519.XrTS2LxW-lkp@intel.com>
References: <20260706024306.47806-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706024306.47806-1-jb.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_141156_672613_4692FB32 
X-CRM114-Status: GOOD (  13.21  )
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

Hi JB,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless/main]
[also build test ERROR on linus/master v7.2-rc6]
[cannot apply to wireless-next/main next-20260806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/JB-Tsai/wifi-mt76-mt7925-Add-flag-to-control-if-need-DMA-re-init/20260807-004748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git main
patch link:    https://lore.kernel.org/r/20260706024306.47806-1-jb.tsai%40mediatek.com
patch subject: [PATCH] wifi: mt76: mt7925: Add flag to control if need DMA re-init
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260807/202608070519.XrTS2LxW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070519.XrTS2LxW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608070519.XrTS2LxW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/pci.c: In function 'mt7925_pci_probe':
>> drivers/net/wireless/mediatek/mt76/mt7925/pci.c:434:13: error: implicit declaration of function 'is_mt7928'; did you mean 'is_mt7922'? [-Wimplicit-function-declaration]
     434 |         if (is_mt7928(&dev->mt76))
         |             ^~~~~~~~~
         |             is_mt7922


vim +434 drivers/net/wireless/mediatek/mt76/mt7925/pci.c

   300	
   301	static const struct mt792x_irq_map mt7927_irq_map = {
   302		.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
   303		.tx = {
   304			.all_complete_mask = MT_INT_TX_DONE_ALL,
   305			.mcu_complete_mask = MT_INT_TX_DONE_MCU,
   306		},
   307		.rx = {
   308			.data_complete_mask = MT7927_RX_DONE_INT_ENA4,
   309			.wm_complete_mask = MT7927_RX_DONE_INT_ENA6,
   310			.wm2_complete_mask = MT7927_RX_DONE_INT_ENA7,
   311		},
   312	};
   313	static int mt7925_pci_probe(struct pci_dev *pdev,
   314				    const struct pci_device_id *id)
   315	{
   316		static const struct mt76_driver_ops drv_ops = {
   317			/* txwi_size = txd size + txp size */
   318			.txwi_size = MT_TXD_SIZE + sizeof(struct mt76_connac_hw_txp),
   319			.drv_flags = MT_DRV_TXWI_NO_FREE | MT_DRV_HW_MGMT_TXQ |
   320				     MT_DRV_AMSDU_OFFLOAD,
   321			.survey_flags = SURVEY_INFO_TIME_TX |
   322					SURVEY_INFO_TIME_RX |
   323					SURVEY_INFO_TIME_BSS_RX,
   324			.token_size = MT7925_TOKEN_SIZE,
   325			.tx_prepare_skb = mt7925e_tx_prepare_skb,
   326			.tx_complete_skb = mt76_connac_tx_complete_skb,
   327			.rx_check = mt7925_rx_check,
   328			.rx_skb = mt7925_queue_rx_skb,
   329			.rx_poll_complete = mt792x_rx_poll_complete,
   330			.sta_add = mt7925_mac_sta_add,
   331			.sta_event = mt7925_mac_sta_event,
   332			.sta_remove = mt7925_mac_sta_remove,
   333			.update_survey = mt792x_update_channel,
   334		};
   335		static const struct mt792x_hif_ops mt7925_pcie_ops = {
   336			.init_reset = mt7925e_init_reset,
   337			.reset = mt7925e_mac_reset,
   338			.mcu_init = mt7925e_mcu_init,
   339			.drv_own = mt792xe_mcu_drv_pmctrl,
   340			.fw_own = mt792xe_mcu_fw_pmctrl,
   341		};
   342		static const struct mt792x_irq_map irq_map = {
   343			.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
   344			.tx = {
   345				.all_complete_mask = MT_INT_TX_DONE_ALL,
   346				.mcu_complete_mask = MT_INT_TX_DONE_MCU,
   347			},
   348			.rx = {
   349				.data_complete_mask = HOST_RX_DONE_INT_ENA2,
   350				.wm_complete_mask = HOST_RX_DONE_INT_ENA0,
   351			},
   352		};
   353		struct ieee80211_ops *ops;
   354		struct mt76_bus_ops *bus_ops;
   355		struct mt792x_dev *dev;
   356		struct mt76_dev *mdev;
   357		bool is_mt7927_hw;
   358		u8 features;
   359		int ret;
   360		u16 cmd;
   361	
   362		ret = pcim_enable_device(pdev);
   363		if (ret)
   364			return ret;
   365	
   366		ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
   367		if (ret)
   368			return ret;
   369	
   370		pci_read_config_word(pdev, PCI_COMMAND, &cmd);
   371		if (!(cmd & PCI_COMMAND_MEMORY)) {
   372			cmd |= PCI_COMMAND_MEMORY;
   373			pci_write_config_word(pdev, PCI_COMMAND, cmd);
   374		}
   375		pci_set_master(pdev);
   376	
   377		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
   378		if (ret < 0)
   379			return ret;
   380	
   381		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
   382		if (ret)
   383			goto err_free_pci_vec;
   384	
   385		is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927 ||
   386				pdev->device == 0x0738);
   387	
   388		/* MT7927: ASPM L1 causes unreliable WFDMA register access */
   389		if (mt7925_disable_aspm || is_mt7927_hw)
   390			mt76_pci_disable_aspm(pdev);
   391	
   392		ops = mt792x_get_mac80211_ops(&pdev->dev, &mt7925_ops,
   393					      (void *)id->driver_data, &features);
   394		if (!ops) {
   395			ret = -ENOMEM;
   396			goto err_free_pci_vec;
   397		}
   398	
   399		mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_ops);
   400		if (!mdev) {
   401			ret = -ENOMEM;
   402			goto err_free_pci_vec;
   403		}
   404	
   405		pci_set_drvdata(pdev, mdev);
   406	
   407		dev = container_of(mdev, struct mt792x_dev, mt76);
   408		dev->fw_features = features;
   409		dev->hif_ops = &mt7925_pcie_ops;
   410		dev->irq_map = is_mt7927_hw ? &mt7927_irq_map : &irq_map;
   411		mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
   412		tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
   413	
   414		dev->phy.dev = dev;
   415		dev->phy.mt76 = &dev->mt76.phy;
   416		dev->mt76.phy.priv = &dev->phy;
   417		dev->bus_ops = dev->mt76.bus;
   418		bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
   419				       GFP_KERNEL);
   420		if (!bus_ops) {
   421			ret = -ENOMEM;
   422			goto err_free_dev;
   423		}
   424	
   425		bus_ops->rr = mt7925_rr;
   426		bus_ops->wr = mt7925_wr;
   427		bus_ops->rmw = mt7925_rmw;
   428		dev->mt76.bus = bus_ops;
   429	
   430		if (!mt7925_disable_aspm && mt76_pci_aspm_supported(pdev))
   431			dev->aspm_supported = true;
   432	
   433		/* MT7935 does not need wpdma reinit */
 > 434		if (is_mt7928(&dev->mt76))
   435			dev->skip_wpdma_reinit = true;
   436	
   437		ret = __mt792x_mcu_fw_pmctrl(dev);
   438		if (ret)
   439			goto err_free_dev;
   440	
   441		ret = __mt792xe_mcu_drv_pmctrl(dev);
   442		if (ret)
   443			goto err_free_dev;
   444	
   445		mdev->rev = (mt76_rr(dev, MT_HW_CHIPID) << 16) |
   446			    (mt76_rr(dev, MT_HW_REV) & 0xff);
   447	
   448		dev_info(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
   449	
   450		if (is_mt7927_hw && mt76_chip(mdev) != 0x7927) {
   451			dev_info(mdev->dev,
   452				 "MT7927 raw CHIPID=0x%04x, forcing chip=0x7927\n",
   453				 mt76_chip(mdev));
   454			mdev->rev = (0x7927 << 16) | (mdev->rev & 0xff);
   455		}
   456	
   457		mt76_rmw_field(dev, MT_HW_EMI_CTL, MT_HW_EMI_CTL_SLPPROT_EN, 1);
   458	
   459		ret = mt792x_wfsys_reset(dev);
   460		if (ret)
   461			goto err_free_dev;
   462	
   463		mt76_wr(dev, irq_map.host_irq_enable, 0);
   464	
   465		mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
   466	
   467		ret = devm_request_irq(mdev->dev, pdev->irq, mt792x_irq_handler,
   468				       IRQF_SHARED, KBUILD_MODNAME, dev);
   469		if (ret)
   470			goto err_free_dev;
   471	
   472		if (is_mt7927(&dev->mt76))
   473			ret = mt7927_dma_init(dev);
   474		else if (is_mt7925(&dev->mt76))
   475			ret = mt7925_dma_init(dev);
   476		else
   477			ret = -EINVAL;
   478	
   479		if (ret)
   480			goto err_free_irq;
   481	
   482		ret = mt7925_register_device(dev);
   483		if (ret)
   484			goto err_free_dma;
   485	
   486		return 0;
   487	
   488	err_free_dma:
   489		mt792x_dma_cleanup(dev);
   490	err_free_irq:
   491		devm_free_irq(&pdev->dev, pdev->irq, dev);
   492	err_free_dev:
   493		mt76_free_device(&dev->mt76);
   494	err_free_pci_vec:
   495		pci_free_irq_vectors(pdev);
   496	
   497		return ret;
   498	}
   499	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

