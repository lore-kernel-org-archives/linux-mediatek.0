Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D43AC61D9C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 14:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpUo/rJ7VG/JhV4L+LwZR0vb7jlfzWVF0UII53bBpJU=; b=fcu9LRglW1LPCyKzlHXi3uyrj+
	Mc7HsNmP4Jb5tSxZUSxHZYg9wMvQbaCfU7VcpBtYE0KiWSdU76TNO8wbJIUCKCdmd3QevNI3+kRwo
	eVZEjq3/F3pLrjCM+OQPuAWCpjHdVqTwg8StuJg+1q4ueoJI0dMZcpRXGS3Y1L3myJBT3mtCXOxhT
	9bpsiA249QX+Bl61+/Q/00X0+Vq/MCZ68VxrVjU5BNpRG16ltAfa+vmGqwnV22VzABoudIwQnq+pB
	j05ah+++Efnt6VGOcM+3mH5qx8EJxcsAC6o/4Cdw5Fv4PgQp+d9H+OsNKIJEi142hnMAZYECjxG13
	dZUN1FAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5oXP-00295N-36;
	Wed, 22 Nov 2023 14:49:11 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5oXN-00293l-0h;
	Wed, 22 Nov 2023 14:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700664549; x=1732200549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xfM2rHlddJWb6LuHvIur/k83wR9tmmt10e5ezN6jTtk=;
  b=XxH6ohm491oEERJzzkH9fl0P7E5R71fjZG30gtpIOXIYAHM7imoMFVE2
   lvW8jntDkFec57rR4foLlIVefkt6x/smqQF0xZjzpgy6UtaIO4L1oKIFk
   mG839iKXhe6NrM2Vtnj9XonU9enUCPaWwq0yK8VGx8PVWPPgu4Owr/ELT
   QnFeiRCyLO2psyGEZ3bUT6ko+txtvmn2ynVtynOR/h8B08qEF3MV1sLO5
   zXPi6ZG/esuht2Of5YohKql9+mJJDtjQAOGyL7IxtU/IbumdjM/bAs4K6
   LsJa2uWOYHzaJwHBqsIFpsZ1h22A80Q5Xy1Nmwo/9bsIBrD/nQcYFv6Fd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478269612"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="478269612"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 06:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="15284525"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2023 06:49:02 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5oXD-0000ZL-2T;
	Wed, 22 Nov 2023 14:48:59 +0000
Date: Wed, 22 Nov 2023 22:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] PCI: mediatek: Fix sparse warning caused to
 virt_to_phys() prototype change
Message-ID: <202311221830.SR5dv3X7-lkp@intel.com>
References: <170052491316.21557.13173111699965824301.stgit@skinsburskii.>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170052491316.21557.13173111699965824301.stgit@skinsburskii.>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_064909_264392_E90C955A 
X-CRM114-Status: GOOD (  12.52  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Kinsburskii/PCI-mediatek-Fix-sparse-warning-caused-to-virt_to_phys-prototype-change/20231121-080253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/170052491316.21557.13173111699965824301.stgit%40skinsburskii.
patch subject: [PATCH v2] PCI: mediatek: Fix sparse warning caused to virt_to_phys() prototype change
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311221830.SR5dv3X7-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221830.SR5dv3X7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221830.SR5dv3X7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/pcie-mediatek.c:400:22: error: passing 'const void *' to parameter of type 'volatile void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           addr = virt_to_phys((__force const void *)port->base + PCIE_MSI_VECTOR);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/io.h:128:55: note: passing argument to parameter 'address' here
   static inline phys_addr_t virt_to_phys(volatile void *address)
                                                         ^
   drivers/pci/controller/pcie-mediatek.c:523:26: error: passing 'const void *' to parameter of type 'volatile void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           msg_addr = virt_to_phys((__force const void *)port->base + PCIE_MSI_VECTOR);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/io.h:128:55: note: passing argument to parameter 'address' here
   static inline phys_addr_t virt_to_phys(volatile void *address)
                                                         ^
   2 errors generated.


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

