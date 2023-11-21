Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925F5C61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sqKyHW1JRynY2ibfRCTOHYhOjW7GUK96GyqPsUyNtE=; b=HoKPjN7WNOX22LpkFbE/XvavyZ
	OyjT6Hz0/8Fa6iVLBtR6m/2vIWlwWLpDbJ00JIMMI+hjKN4oztqMw2aEpzEEMsILCrpolyNjqy/xK
	PNUetRN+Lg2Bq8+gtpXj1z2RSdtw2YTTdwml318n7uEOQtKIeOOxALIRGXw8keeeP8tdb3ecQp+Ca
	0Yfhb6Y/d8S5WfG1D9N6B7DW6HI2wpCE6YWPe8m+JnxP27TUxrAddm1zXBOKL7dq37i1ZU1aCc8xp
	05omiV5Oyv2rEG6hqf0rXC5XtxBRAfWIOOfY2/ws/cLLduHK/ZezwHAQuBEro5Q80Bi349Vk7dVGr
	fZzmW/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Pid-00GgvV-1O;
	Tue, 21 Nov 2023 12:19:07 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Pia-00GguR-02;
	Tue, 21 Nov 2023 12:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700569144; x=1732105144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SdXthQjnrrZo9AkzWMY7oGpGWTtB+tK49t5BJyhg9q4=;
  b=Tn1aWYogqpxOXKcNTVl6DDDXG5gHJEfCNQjWJg97OMK/9GJqKljCq0cD
   bfdDoZekPIuaj/jEPOjPbTKaSwQa/4YojGSyJkhsi1eJp1/rUwlooO/eI
   Hs+AbMoFn15egmxQx2bvZa2f6Z0YEZZ1G0nW84s86HDlS6bhr+zVwO4oT
   0GH1dlYS1qMqyOUuUS24xbR++luW8KCuA2zSNMCDvAE29wdUA497P21Bb
   82XMEA0z6gfNclg0TcJ0WJBb5h4YJ7eDZaZPK7Kt4JujE12j+T/YrqPa3
   Q69LzQ9tZPSHGH30pfTXpZxhE09MwxKmjLSPfpePLMPI+tE8yjxz8CfyP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="10493431"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="10493431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 04:19:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="8076113"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2023 04:18:58 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5PiQ-0007mW-37;
	Tue, 21 Nov 2023 12:18:55 +0000
Date: Tue, 21 Nov 2023 20:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] PCI: mediatek: Fix sparse warning caused to
 virt_to_phys() prototype change
Message-ID: <202311212050.Z3EDRIR3-lkp@intel.com>
References: <170052491316.21557.13173111699965824301.stgit@skinsburskii.>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170052491316.21557.13173111699965824301.stgit@skinsburskii.>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_041904_114471_51C174BB 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Stanislav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Kinsburskii/PCI-mediatek-Fix-sparse-warning-caused-to-virt_to_phys-prototype-change/20231121-080253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/170052491316.21557.13173111699965824301.stgit%40skinsburskii.
patch subject: [PATCH v2] PCI: mediatek: Fix sparse warning caused to virt_to_phys() prototype change
config: s390-randconfig-r113-20231121 (https://download.01.org/0day-ci/archive/20231121/202311212050.Z3EDRIR3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311212050.Z3EDRIR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311212050.Z3EDRIR3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-mediatek.c:400:62: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void volatile *address @@     got void const * @@
   drivers/pci/controller/pcie-mediatek.c:400:62: sparse:     expected void volatile *address
   drivers/pci/controller/pcie-mediatek.c:400:62: sparse:     got void const *
   drivers/pci/controller/pcie-mediatek.c:523:66: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void volatile *address @@     got void const * @@
   drivers/pci/controller/pcie-mediatek.c:523:66: sparse:     expected void volatile *address
   drivers/pci/controller/pcie-mediatek.c:523:66: sparse:     got void const *

vim +400 drivers/pci/controller/pcie-mediatek.c

   393	
   394	static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
   395	{
   396		struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
   397		phys_addr_t addr;
   398	
   399		/* MT2712/MT7622 only support 32-bit MSI addresses */
 > 400		addr = virt_to_phys((__force const void *)port->base + PCIE_MSI_VECTOR);
   401		msg->address_hi = 0;
   402		msg->address_lo = lower_32_bits(addr);
   403	
   404		msg->data = data->hwirq;
   405	
   406		dev_dbg(port->pcie->dev, "msi#%d address_hi %#x address_lo %#x\n",
   407			(int)data->hwirq, msg->address_hi, msg->address_lo);
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

