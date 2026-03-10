Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48319FD4F16
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPvxRI7y4xAvkTTWlTs2rNLaK7BMkMloFzW8Ue/FVgU=; b=2BIxnc0/vtvwb/O2+iX53dvMD5
	ciDEFLdssO4qfZrjmYl4HAVj0uE/59Q3g2Wa3oXJS1Jvg9uLDoib2JhwoGr4JnQhqwnRzfoNzmY7B
	9O+x610ZF7RlmJkuNNwkiOGBRcqJYpDrmsFso5pOYVcdhA7BY46QHEK7tdTXDsmUJLoOaNC/YhTrZ
	J1xbN9InSd3GSf0sfi743zZwWawjcEy8OV2lxNmdcVHEVaPVIamuU15LNcsOq61XdBc0QYdPHK65/
	3GYznB0VqAWeZHMGmNvHss+EHXJeaTrGrebd4vjTNjEjGaEFZSC0aqemRFZKFQJn7oonhyO4RQK1M
	fZUv7kGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w022d-0000000A7aW-0xK9;
	Tue, 10 Mar 2026 18:42:51 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w022Z-0000000A7Yi-1K1v
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 18:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773168167; x=1804704167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sIZT6s5ZK51b+DsTbkUWbWjMEGK4MSRlP4cM3X8pz3I=;
  b=AIA1SxwblFPEiMS1VYZvqmhEg4xVH8rfHfhwOk504fTOiGdfbrorDT10
   D4UN/WVzmiobNZ09zH3XwgSWmvsHX5F2Eny0BefNb0glspGjxPNNtTBGY
   oiIMOr/Dop0Q2XFege/UlWN66Rtc8uqZb/uN6HcS0dntHNX49Cppqq+An
   8wiyLjUbZR7frBvLl4ZrcIBVXR2p//v5YAoBr1SHUyYwlsKRUUpD84mHM
   uhABzdcP7EhUcsRHGv0umRpgVXU/aiJwWWN1CgsRW2R3qR6r7s+nk81Ub
   OpR+p8878CSWZqfqxu5yzE7P7QTnPCJuM+MjNjM3QfyxaSxdgt7jpzvv9
   g==;
X-CSE-ConnectionGUID: LZq5RwayQcG9gI7AIzh1yw==
X-CSE-MsgGUID: qM4TPvP5Rx+p5TwyAoEBiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74308074"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74308074"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 11:42:45 -0700
X-CSE-ConnectionGUID: dIuD60AyTWOwOAgdyzcueg==
X-CSE-MsgGUID: kdZZ1WRBT5y/Nf9k7CC3UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="243215763"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2026 11:42:42 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w022R-0000000007u-0L7s;
	Tue, 10 Mar 2026 18:42:39 +0000
Date: Wed, 11 Mar 2026 02:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Message-ID: <202603110219.dgV01aTV-lkp@intel.com>
References: <20260310091947.2742004-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310091947.2742004-8-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_114247_368925_D1DC7848 
X-CRM114-Status: GOOD (  12.34  )
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

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v7.0-rc3 next-20260309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/PCI-mediatek-gen3-Clean-up-mtk_pcie_parse_port-with-dev_err_probe/20260310-175537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260310091947.2742004-8-wenst%40chromium.org
patch subject: [PATCH v4 7/7] PCI: mediatek-gen3: Integrate new pwrctrl API
config: parisc-randconfig-001-20260310 (https://download.01.org/0day-ci/archive/20260311/202603110219.dgV01aTV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110219.dgV01aTV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110219.dgV01aTV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/controller/pcie-mediatek-gen3.c: In function 'mtk_pcie_probe':
>> drivers/pci/controller/pcie-mediatek-gen3.c:1248:1: warning: label 'err_tear_down_irq' defined but not used [-Wunused-label]
    1248 | err_tear_down_irq:
         | ^~~~~~~~~~~~~~~~~
>> drivers/pci/controller/pcie-mediatek-gen3.c:1225:17: error: label 'err_teardown_irq' used but not defined
    1225 |                 goto err_teardown_irq;
         |                 ^~~~


vim +/err_teardown_irq +1225 drivers/pci/controller/pcie-mediatek-gen3.c

  1201	
  1202	static int mtk_pcie_probe(struct platform_device *pdev)
  1203	{
  1204		struct device *dev = &pdev->dev;
  1205		struct mtk_gen3_pcie *pcie;
  1206		struct pci_host_bridge *host;
  1207		int err;
  1208	
  1209		host = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
  1210		if (!host)
  1211			return -ENOMEM;
  1212	
  1213		pcie = pci_host_bridge_priv(host);
  1214	
  1215		pcie->dev = dev;
  1216		pcie->soc = device_get_match_data(dev);
  1217		platform_set_drvdata(pdev, pcie);
  1218	
  1219		err = mtk_pcie_setup_irq(pcie);
  1220		if (err)
  1221			return dev_err_probe(dev, err, "Failed to setup IRQ domains\n");
  1222	
  1223		err = pci_pwrctrl_create_devices(pcie->dev);
  1224		if (err) {
> 1225			goto err_teardown_irq;
  1226			dev_err_probe(dev, err, "failed to create pwrctrl devices\n");
  1227		}
  1228	
  1229		err = mtk_pcie_setup(pcie);
  1230		if (err)
  1231			goto err_destroy_pwrctrl;
  1232	
  1233		host->ops = &mtk_pcie_ops;
  1234		host->sysdata = pcie;
  1235	
  1236		err = pci_host_probe(host);
  1237		if (err)
  1238			goto err_power_down_pcie;
  1239	
  1240		return 0;
  1241	
  1242	err_power_down_pcie:
  1243		mtk_pcie_device_power_down(pcie);
  1244		mtk_pcie_power_down(pcie);
  1245	err_destroy_pwrctrl:
  1246		if (err != -EPROBE_DEFER)
  1247			pci_pwrctrl_destroy_devices(pcie->dev);
> 1248	err_tear_down_irq:
  1249		mtk_pcie_irq_teardown(pcie);
  1250		return err;
  1251	}
  1252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

