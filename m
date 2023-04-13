Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A86BC77B71
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOzV2SBhFw+VHfjQBSFk6nelhOdTCbmbhdmw181xaw4=; b=KANuKXxTSl89DtAQkTUPup9UpP
	EJ96KBB0h0Yt9mG8UCSouE5unVNSshWpB3Vam2wh2hZdFoYIvpr/fd+6p9L3JFO44rFcP5WHaxuqR
	DXwoAeu2sQQsIlqzO78RaMI5/CR1xczlWseEhjfJPM8ScYXMtyzhTYlFcO/JB05MtTnmhHERokIwJ
	/g+hkq0UJfzsZ41BqZUpuK00Tva9GHw7RsvqLFq3A8Ymd8oRKj8rjaKonRRchuMd7Wu2+oI28prOq
	wr4mnuzzRfr7QeNyvUhn7Hm/SOVtTRq7Z+WKaWhxCWG6KLSwBhvDjJmylSzyUu4NNHD7gmSLF75Py
	QQXFaEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmxbf-006M7d-2W;
	Thu, 13 Apr 2023 14:07:23 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmxbb-006M4b-1s;
	Thu, 13 Apr 2023 14:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681394839; x=1712930839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o3ui4+B9QONrA1DxR7CqtVx0f1GoF/Cuz8I+r7IyAkc=;
  b=kVduAYet/lOoMO3G1c1BwnoFMnr7ytY+gT/TQwOCCLT/h2R6Gav6iF6s
   wLX99SF+iSzeV/cd6sS+8yYijpQNWaNgtLIg/PBbYDYlbQ7zlGRzXDOgh
   Jcw8lTdHieCyfCTB442G5Q/tt2TaEquSL/RmSxYhN3KH3z/lKnLX9f+c2
   d67SA7WSYvdCNrPpDWJd5FxXJZZA/zWym0uA1mCEakoA+l6a8Grb8sM/A
   QKdEUrGSiIhBvPxDM1sNulrS8RyoSrYP5sIEmGCVY7fGh/kmzWm66hyoN
   6AgcRFbwT6EfUmVPrDPSkiIChUGMndY+rO3d3CPrT7AAxhoOU1GChFhlO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="409359222"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="409359222"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 06:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="833154339"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="833154339"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2023 06:34:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmx69-000YiI-2u;
	Thu, 13 Apr 2023 13:34:49 +0000
Date: Thu, 13 Apr 2023 21:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jades Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Yi-De Wu <yi-de.wu@mediatek.com>
Subject: Re: [PATCH v1 6/6] soc: mediatek: virt: geniezone: Add irqfd support
Message-ID: <202304132123.rrVq3AEP-lkp@intel.com>
References: <20230413090735.4182-7-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413090735.4182-7-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_070719_667706_BB598399 
X-CRM114-Status: GOOD (  14.40  )
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

Hi Yi-De,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next arm64/for-next/core lwn/docs-next linus/master v6.3-rc6 next-20230412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230413-170932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230413090735.4182-7-yi-de.wu%40mediatek.com
patch subject: [PATCH v1 6/6] soc: mediatek: virt: geniezone: Add irqfd support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230413/202304132123.rrVq3AEP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ae996a1c7d12837f16f28975712a8bf63525cac4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230413-170932
        git checkout ae996a1c7d12837f16f28975712a8bf63525cac4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/soc/mediatek/virt/geniezone/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304132123.rrVq3AEP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/virt/geniezone/gzvm_eventfd.c:463:6: warning: no previous prototype for 'gzvm_irqfd_release' [-Wmissing-prototypes]
     463 | void gzvm_irqfd_release(struct gzvm *gzvm)
         |      ^~~~~~~~~~~~~~~~~~


vim +/gzvm_irqfd_release +463 drivers/soc/mediatek/virt/geniezone/gzvm_eventfd.c

   458	
   459	/*
   460	 * This function is called as the gzvm VM fd is being released. Shutdown all
   461	 * irqfds that still remain open
   462	 */
 > 463	void gzvm_irqfd_release(struct gzvm *gzvm)
   464	{
   465		struct gzvm_kernel_irqfd *irqfd, *tmp;
   466	
   467		spin_lock_irq(&gzvm->irqfds.lock);
   468	
   469		list_for_each_entry_safe(irqfd, tmp, &gzvm->irqfds.items, list)
   470			irqfd_deactivate(irqfd);
   471	
   472		spin_unlock_irq(&gzvm->irqfds.lock);
   473	
   474		/*
   475		 * Block until we know all outstanding shutdown jobs have completed.
   476		 */
   477		flush_workqueue(irqfd_cleanup_wq);
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

