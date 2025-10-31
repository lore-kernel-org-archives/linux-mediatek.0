Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0033CCF9F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Oct 2025 01:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKCnrE1Fwyn4SLQWtdjM+IXjLzE/oGyh5RcT/kfdlEI=; b=Zr/QkEwJSjazndHodU81QbKMkp
	lxzBIhqiBnh75OREjNMvqFFjIT/QSFvoVTv5IrBw7dGmVtgNovOcoH8BV92MX+7svHNxKvvsg3zkf
	X9btoaidc5Hx4owyy1RoIjkqFeI6mxaMqkb2Pze2otUWfwBXGpzrB8uI4P00BKZ5kFjbSB1wpybtF
	kXpRbAhnB4LHpZaxNKo+iPNMrbbvIjoMBdtRLEC07rBr4qsZgdzWRg1JSfVOZsv8Thx1kndaskkYv
	mZ9AQVKGn9733IyNE17UyL4AuXCJcTYlYFWEPQruun55LPZr5L/gDasE1DqbSCkWm/M80fH0RFAS5
	yvGw62dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdnf-00000005Dcz-2Qtw;
	Fri, 31 Oct 2025 01:19:31 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdnb-00000005DcY-3JcX
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Oct 2025 01:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761873568; x=1793409568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s3KxTLvxykwuQMgwYymSDxBhPd0V8H4sWyAgWwULAKI=;
  b=KxWgkhibFNk2OBR338daFTnQuyNBMUavEjdbyx5wclbp2wQh85cs99ZP
   ay0whbO4SrVi73cMCmS/Nnj14H/2/9A8D2AdpN0PnAdM1K+DCMtfvb6PE
   luu+UiDUzWapY3c/1t3xWTXhM+uzHJOIgJpURYsX7YF+wOBcwm4w5tvSk
   KXtzajBxdOAtWlZZorLhi0kGWnEnkzq+YB/kncBDyOcmPOFtGOZoxkUjS
   covSCGdo74xSzf0D9eUUyPtrVeK9u0PQsT4crAkWPYhpz21/4jt5a4YPs
   xKnRdjXAArG46v0FD6yDiHY+cGA9LW4PqowpcynKeb0sl0AYtj/soPdqs
   A==;
X-CSE-ConnectionGUID: nO8Xq/14SmuLPoWbJz1bUA==
X-CSE-MsgGUID: aDNY3OeFQzuBNIybKAbTng==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63235789"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="63235789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 18:19:27 -0700
X-CSE-ConnectionGUID: mCjhLEe6QCKcT9fN0jidcg==
X-CSE-MsgGUID: jQINaZDsRf6rcrtZb6y02w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="185979707"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Oct 2025 18:19:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEdnS-000Mem-0M;
	Fri, 31 Oct 2025 01:19:20 +0000
Date: Fri, 31 Oct 2025 09:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, nbd@nbd.name, lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: Re: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big
 Endian
Message-ID: <202510310816.kyDHJNiS-lkp@intel.com>
References: <20251027171759.1484844-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027171759.1484844-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_181927_907885_2A555699 
X-CRM114-Status: GOOD (  11.07  )
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

Hi Caleb,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-James-DeLisle/wifi-mt76-mmio_-read-write-_copy-byte-swap-when-on-Big-Endian/20251028-012349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20251027171759.1484844-1-cjd%40cjdns.fr
patch subject: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big Endian
config: i386-randconfig-061-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310816.kyDHJNiS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310816.kyDHJNiS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310816.kyDHJNiS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse: sparse: cast from restricted __le32
>> drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse:     expected unsigned int val
   drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse:     got restricted __le32 [usertype]
>> drivers/net/wireless/mediatek/mt76/mmio.c:63:23: sparse: sparse: cast to restricted __le32

vim +41 drivers/net/wireless/mediatek/mt76/mmio.c

    32	
    33	static void mt76_mmio_write_copy_portable(void __iomem *dst,
    34						  const u8 *src, int len)
    35	{
    36		__le32 val;
    37		int i = 0;
    38	
    39		for (i = 0; i < ALIGN(len, 4); i += 4) {
    40			memcpy(&val, src + i, sizeof(val));
  > 41			writel(cpu_to_le32(val), dst + i);
    42		}
    43	}
    44	
    45	static void mt76_mmio_write_copy(struct mt76_dev *dev, u32 offset,
    46					 const void *data, int len)
    47	{
    48		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
    49			mt76_mmio_write_copy_portable(dev->mmio.regs + offset, data,
    50						      len);
    51			return;
    52		}
    53		__iowrite32_copy(dev->mmio.regs + offset, data, DIV_ROUND_UP(len, 4));
    54	}
    55	
    56	static void mt76_mmio_read_copy_portable(u8 *dst,
    57						 const void __iomem *src, int len)
    58	{
    59		u32 val;
    60		int i;
    61	
    62		for (i = 0; i < ALIGN(len, 4); i += 4) {
  > 63			val = le32_to_cpu(readl(src + i));
    64			memcpy(dst + i, &val, sizeof(val));
    65		}
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

