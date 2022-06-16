Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A733DC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 04:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxadkN7nqNrPrYrBldOIVxNGXXCLWBvUhyyMSwEEau0=; b=ElZyZTTPfWOEYaT+wKIxxkrSjT
	gBmIq3kz4/QcW7w88dZSeNBJWgM3TVV8v8FrZAba6wEPrQcPT+OMwXoudvAUrDUL21cUWd8PstftK
	EsTE2dsfWhiUgSd+rkDx9aoLQmikByOmYTwjyeFp7TNK0B8hh26fjLG5pURMV5AUnNm5ADH4M4YHB
	PpiE6XxVJglWuuDjd8oiFFHMF/2VAUASS+fNYp839xHyBacKZrbXc/g6pGvCvQ1TL8sGH7n2xTmOx
	weOXHMkVidwSCqxdZLgFlTMtMSStDDnbXjxjVtGzTxIDZ2mNHe1ICwEI1mKe4UasPj8UwScgHaNkW
	m9mvwBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1hXy-000RiN-46; Thu, 16 Jun 2022 04:55:58 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1hXu-000RhC-IN; Thu, 16 Jun 2022 04:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655355354; x=1686891354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kkmFQxqRSE/ckje8wFOulaGLrffZ2XBJeCW/d4bSrAY=;
  b=N4DT0qOXq3v5FXXrkkvHgEPG0243zSXsiIMKywvh2M0og2PIsnQJapzI
   ofqr8m7VC/xvlPL2QA+QCdEB0rSoo1bZPCDxbASZsmrB4ZIc9i/xZCcr6
   0MTzLbi4EQx2+Za4iXrOFkXSS11ORFzxR6FUuB5nxIHquubbJIspv8xLO
   gd1ZB9YqsjhUL3EIn6NiGqCTfG7ixZ3zXH+TWfV4ptHt826MnnIIGxvuk
   yXGjcmJrMSdHAcjaoKfHSPAmVzsuU3tRREbpY3GOWnpo5YAK+w20n0LLR
   ew13p2NhZfHQ9brJ7vd2VSczEYQ/Ab+LugdJtfcQCpZmf00Jd6VhdNFfI
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259019716"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="259019716"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 21:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="713224177"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2022 21:55:47 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1hXm-000O3l-S1;
	Thu, 16 Jun 2022 04:55:46 +0000
Date: Thu, 16 Jun 2022 12:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: yf.wang@mediatek.com, Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"open list:MEDIATEK IOMMU DRIVER" <iommu@lists.linux-foundation.org>,
	"moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: kbuild-all@lists.01.org, wsd_upstream@mediatek.com,
	Libo Kang <Libo.Kang@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Yunfei Wang <yf.wang@mediatek.com>, Ning Li <ning.li@mediatek.com>
Subject: Re: [PATCH v9 3/3] iommu/mediatek: Allow page table PA up to 35bit
Message-ID: <202206161233.WDjdWJGb-lkp@intel.com>
References: <20220615161224.6923-4-yf.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615161224.6923-4-yf.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_215554_694038_64B95F6F 
X-CRM114-Status: GOOD (  14.15  )
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

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on joro-iommu/next]
[also build test ERROR on linus/master v5.19-rc2 next-20220615]
[cannot apply to arm-perf/for-next/perf]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/yf-wang-mediatek-com/iommu-io-pgtable-arm-v7s-Add-a-quirk-to-allow-pgtable-PA-up-to-35bit/20220616-011227
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220616/202206161233.WDjdWJGb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0032fcce9c1ab50caec1ef5dd4089a8a61fcf15c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review yf-wang-mediatek-com/iommu-io-pgtable-arm-v7s-Add-a-quirk-to-allow-pgtable-PA-up-to-35bit/20220616-011227
        git checkout 0032fcce9c1ab50caec1ef5dd4089a8a61fcf15c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:10,
                    from include/linux/dma-direct.h:9,
                    from drivers/iommu/mtk_iommu.c:11:
   drivers/iommu/mtk_iommu.c: In function 'mtk_iommu_attach_device':
>> drivers/iommu/mtk_iommu.c:693:49: error: 'struct mtk_iommu_data' has no member named 'base'
     693 |                 writel(bank->m4u_dom->ttbr, data->base + REG_MMU_PT_BASE_ADDR);
         |                                                 ^~
   arch/arc/include/asm/io.h:231:75: note: in definition of macro 'writel_relaxed'
     231 | #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                           ^
   drivers/iommu/mtk_iommu.c:693:17: note: in expansion of macro 'writel'
     693 |                 writel(bank->m4u_dom->ttbr, data->base + REG_MMU_PT_BASE_ADDR);
         |                 ^~~~~~


vim +693 drivers/iommu/mtk_iommu.c

   646	
   647	static int mtk_iommu_attach_device(struct iommu_domain *domain,
   648					   struct device *dev)
   649	{
   650		struct mtk_iommu_data *data = dev_iommu_priv_get(dev), *frstdata;
   651		struct mtk_iommu_domain *dom = to_mtk_domain(domain);
   652		struct list_head *hw_list = data->hw_list;
   653		struct device *m4udev = data->dev;
   654		struct mtk_iommu_bank_data *bank;
   655		unsigned int bankid;
   656		int ret, region_id;
   657	
   658		region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
   659		if (region_id < 0)
   660			return region_id;
   661	
   662		bankid = mtk_iommu_get_bank_id(dev, data->plat_data);
   663		mutex_lock(&dom->mutex);
   664		if (!dom->bank) {
   665			/* Data is in the frstdata in sharing pgtable case. */
   666			frstdata = mtk_iommu_get_frst_data(hw_list);
   667	
   668			ret = mtk_iommu_domain_finalise(dom, frstdata, region_id);
   669			if (ret) {
   670				mutex_unlock(&dom->mutex);
   671				return -ENODEV;
   672			}
   673			dom->bank = &data->bank[bankid];
   674		}
   675		mutex_unlock(&dom->mutex);
   676	
   677		mutex_lock(&data->mutex);
   678		bank = &data->bank[bankid];
   679		if (!bank->m4u_dom) { /* Initialize the M4U HW for each a BANK */
   680			ret = pm_runtime_resume_and_get(m4udev);
   681			if (ret < 0) {
   682				dev_err(m4udev, "pm get fail(%d) in attach.\n", ret);
   683				goto err_unlock;
   684			}
   685	
   686			ret = mtk_iommu_hw_init(data, bankid);
   687			if (ret) {
   688				pm_runtime_put(m4udev);
   689				goto err_unlock;
   690			}
   691			bank->m4u_dom = dom;
   692			bank->m4u_dom->ttbr = MTK_IOMMU_ADDR(dom->cfg.arm_v7s_cfg.ttbr);
 > 693			writel(bank->m4u_dom->ttbr, data->base + REG_MMU_PT_BASE_ADDR);
   694	
   695			pm_runtime_put(m4udev);
   696		}
   697		mutex_unlock(&data->mutex);
   698	
   699		return mtk_iommu_config(data, dev, true, region_id);
   700	
   701	err_unlock:
   702		mutex_unlock(&data->mutex);
   703		return ret;
   704	}
   705	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

