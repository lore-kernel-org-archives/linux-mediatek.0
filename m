Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF43C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9xiwue3XXnYz9WQ1Egt36LJONEoW9JFokfEHQnDVAY=; b=hxMpvz7lUC/ZiSOtrDUZ5hy6JW
	QV/I8cUYzKwpS8rF09VJoBtLDxF4Ly0/E+PkrOg3XTgTPe6oF3DQDaRsckTTpmhlQFg4AT//sbDPI
	SiSmArwB5um0j3bUD/AYGnYOLzwAVTJAvc6qeglcLQu1iCJm46CJzXgk/mbxtCbaaQ2q2PQDUVv2O
	B6fD6TWA/5Z2GVkyuCgGfgebdWSq9D58LbTvVc4bzixQritftsFi8i/vGnkPsd24q2vYC4h5Qt+zx
	cMjtIbGPjD1tWY2IUhDAsaH29B+KmeBFL+hCtq6KkoteDF2xtmupbuJHtwmOg6qJ8qOxq+eFt1/Kp
	ElxOerKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgOLo-008LGR-36;
	Sun, 26 Mar 2023 11:15:52 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgOLi-008LEz-2r;
	Sun, 26 Mar 2023 11:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679829346; x=1711365346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cf4CLIajSvd8ZhQi5FYODYlXTdZeLjQh4x6e7Ilv8mk=;
  b=VjyRUg23VNlOcTxqMnj6mWSbAjE//pklE85yx2R6bUvxi6i8KkcdRYNP
   83BjHDRG4xEVv2TEF7/AWR0/ebaqgmMUdPGiGIjUkQbSO/AuyBIe5B72f
   DYiZKQlRjgVW0ELGT5eJECoe6pPXrWoOYKVeA3jgHNdGg87pfPisFD+Xj
   gahmOTwaUGsssMJFRqx4LI78i7KBbBbOtjrVgHLeyMdz/3C1dGFn2LwID
   vW/isenNc+pKgKNT1VLNVQog1AMEWRcRmr2oYKqNFLye6KXBllrkLP+Wc
   C0JA0dV3fvvDrhSxFS5EvZn/Sa75h57xupI/cHrExVFMxH/gS2vhGcKJO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="404995996"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="404995996"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 04:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="633332449"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="633332449"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Mar 2023 04:15:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgOLa-000H5b-09;
	Sun, 26 Mar 2023 11:15:38 +0000
Date: Sun, 26 Mar 2023 19:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhe <yuzhe@nfschina.com>, andersson@kernel.org,
	mathieu.poirier@linaro.org, angelogioacchino.delregno@collabora.com,
	agross@kernel.org, konrad.dybcio@linaro.org,
	patrice.chotard@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, liqiong@nfschina.com,
	Yu Zhe <yuzhe@nfschina.com>
Subject: Re: [PATCH v2] remoteproc: remove unnecessary (void*) conversions
Message-ID: <202303261950.I6rq9snr-lkp@intel.com>
References: <20230320061157.29660-1-yuzhe@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320061157.29660-1-yuzhe@nfschina.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_041547_004218_321F5C1C 
X-CRM114-Status: GOOD (  15.61  )
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

Hi Yu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v6.3-rc3]
[also build test WARNING on linus/master]
[cannot apply to remoteproc/rproc-next next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Zhe/remoteproc-remove-unnecessary-void-conversions/20230320-141403
patch link:    https://lore.kernel.org/r/20230320061157.29660-1-yuzhe%40nfschina.com
patch subject: [PATCH v2] remoteproc: remove unnecessary (void*) conversions
config: arm-randconfig-s053-20230326 (https://download.01.org/0day-ci/archive/20230326/202303261950.I6rq9snr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/38335303eda6c4de037cd00e20c9065a76f82291
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yu-Zhe/remoteproc-remove-unnecessary-void-conversions/20230320-141403
        git checkout 38335303eda6c4de037cd00e20c9065a76f82291
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303261950.I6rq9snr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/stm32_rproc.c:122:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/stm32_rproc.c:122:12: sparse:     expected void *va
   drivers/remoteproc/stm32_rproc.c:122:12: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/stm32_rproc.c:139:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *io_addr @@     got void *va @@
   drivers/remoteproc/stm32_rproc.c:139:20: sparse:     expected void volatile [noderef] __iomem *io_addr
   drivers/remoteproc/stm32_rproc.c:139:20: sparse:     got void *va
>> drivers/remoteproc/stm32_rproc.c:632:21: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct resource_table * @@     got void [noderef] __iomem *rsc_va @@
   drivers/remoteproc/stm32_rproc.c:632:21: sparse:     expected struct resource_table *
   drivers/remoteproc/stm32_rproc.c:632:21: sparse:     got void [noderef] __iomem *rsc_va

vim +632 drivers/remoteproc/stm32_rproc.c

   588	
   589	static struct resource_table *
   590	stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
   591	{
   592		struct stm32_rproc *ddata = rproc->priv;
   593		struct device *dev = rproc->dev.parent;
   594		phys_addr_t rsc_pa;
   595		u32 rsc_da;
   596		int err;
   597	
   598		/* The resource table has already been mapped, nothing to do */
   599		if (ddata->rsc_va)
   600			goto done;
   601	
   602		err = regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
   603		if (err) {
   604			dev_err(dev, "failed to read rsc tbl addr\n");
   605			return ERR_PTR(-EINVAL);
   606		}
   607	
   608		if (!rsc_da)
   609			/* no rsc table */
   610			return ERR_PTR(-ENOENT);
   611	
   612		err = stm32_rproc_da_to_pa(rproc, rsc_da, &rsc_pa);
   613		if (err)
   614			return ERR_PTR(err);
   615	
   616		ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
   617		if (IS_ERR_OR_NULL(ddata->rsc_va)) {
   618			dev_err(dev, "Unable to map memory region: %pa+%zx\n",
   619				&rsc_pa, RSC_TBL_SIZE);
   620			ddata->rsc_va = NULL;
   621			return ERR_PTR(-ENOMEM);
   622		}
   623	
   624	done:
   625		/*
   626		 * Assuming the resource table fits in 1kB is fair.
   627		 * Notice for the detach, that this 1 kB memory area has to be reserved in the coprocessor
   628		 * firmware for the resource table. On detach, the remoteproc core re-initializes this
   629		 * entire area by overwriting it with the initial values stored in rproc->clean_table.
   630		 */
   631		*table_sz = RSC_TBL_SIZE;
 > 632		return ddata->rsc_va;
   633	}
   634	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

