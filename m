Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F85E95A8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Dec 2025 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWOVgOaoe/TS12ellAWxVciHVb8xnkr/zV7/gw7EqCs=; b=kC+6AGX9yUSITKm3VfBHRfE+Hr
	Zkx82rTWOxody1im1rITgkw9v3sX10elnauhiXrTiP2MSCWL3YMjfxHjMhNimYmutHf1u5i4py25H
	SpU3DLV8gNcF43YoUyehwRn7TQWJGZmfv7Iz8VR1gdHO8IU9S9S4utko7Xi07tNw9Vzo0pxQy4WTW
	bUcKvPU2JLyHT7SlkRHlXXmTzs1+v57EE3+JOS+Np4O2gLgNonkDKqq7P6VeP7Pcza2c026OS8+lj
	lrwaSTcxkb+lYcadLDW0vTAbXE3a6OmqVvUBCP3s1KD7xe98ZnG9dRfKZhTT8uKDNz/ryS5C+G8dQ
	ad2T3VXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZtR-00000004s4K-34Xr;
	Tue, 30 Dec 2025 13:36:09 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZtM-00000004s3d-2CG3
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Dec 2025 13:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767101765; x=1798637765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=whRaztirvx5Wyh80MSX+DutYWxXqcp9XldzpUIBN9zk=;
  b=gcmBFvuvz+o8y1nedPXyPW5pTMMFv4jhcHU/8o66JAUd7pf2YqHCsfVu
   CRd5vRDtF519XZ+eA/vGOoLMRZvQevqNMKb6tGrWpQa46V4APFTrZJpPv
   ADiU5B6HcJlWy2xvkHVKWUXkAx1W6owH5CudRl2TqOtcEr5zc61WyRi39
   /lfrbjg32/SKAByw/4n3oeS/wdjVezGsER+jOkNohf+4udH9zF8+BhP7m
   05PbQCK117ZuE7IdW6xZio58gzZ7Sd6Lvx83xUSMI/XRrM/Kvvlbm71EU
   Nzia8J/1XPXO62egEuMAXAhXZYSvlHa2F5OXMOr9e7s6/GDxvJ5tBvRzw
   Q==;
X-CSE-ConnectionGUID: YZDa3qNGSkmUq9CD1cp2bA==
X-CSE-MsgGUID: Yo4spQeVQte9XmA7/3HLLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79809534"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="79809534"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:36:01 -0800
X-CSE-ConnectionGUID: ada3EXIlSHOIL18jvWVdKA==
X-CSE-MsgGUID: E5snTTCFSEymNkXU32GLZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="205734082"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Dec 2025 05:35:59 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaZtE-000000000P3-2Vow;
	Tue, 30 Dec 2025 13:35:56 +0000
Date: Tue, 30 Dec 2025 21:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	tzungbi@kernel.org
Subject: Re: [PATCH] pmdomain: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <202512302129.BjTBw9E6-lkp@intel.com>
References: <20251229043244.4103262-1-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229043244.4103262-1-tzungbi@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_053604_636463_9D3D72C9 
X-CRM114-Status: GOOD (  12.41  )
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

Hi Tzung-Bi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc3 next-20251219]
[cannot apply to amd-pstate/linux-next amd-pstate/bleeding-edge]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzung-Bi-Shih/pmdomain-mediatek-Break-lock-dependency-to-prepare_lock/20251229-123525
base:   linus/master
patch link:    https://lore.kernel.org/r/20251229043244.4103262-1-tzungbi%40kernel.org
patch subject: [PATCH] pmdomain: mediatek: Break lock dependency to `prepare_lock`
config: arm-randconfig-003-20251230 (https://download.01.org/0day-ci/archive/20251230/202512302129.BjTBw9E6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512302129.BjTBw9E6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512302129.BjTBw9E6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/mediatek/mtk-pm-domains.c:1304:12: warning: 'scpsys_resume' defined but not used [-Wunused-function]
    1304 | static int scpsys_resume(struct device *dev)
         |            ^~~~~~~~~~~~~
>> drivers/pmdomain/mediatek/mtk-pm-domains.c:1285:12: warning: 'scpsys_suspend' defined but not used [-Wunused-function]
    1285 | static int scpsys_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~


vim +/scpsys_resume +1304 drivers/pmdomain/mediatek/mtk-pm-domains.c

  1284	
> 1285	static int scpsys_suspend(struct device *dev)
  1286	{
  1287		struct scpsys *scpsys = dev_get_drvdata(dev);
  1288		struct generic_pm_domain *genpd;
  1289		struct scpsys_domain *pd;
  1290		int i;
  1291	
  1292		for (i = 0; i < scpsys->pd_data.num_domains; i++) {
  1293			genpd = scpsys->pd_data.domains[i];
  1294			if (!genpd)
  1295				continue;
  1296	
  1297			pd = to_scpsys_domain(genpd);
  1298			clk_bulk_unprepare(pd->num_clks, pd->clks);
  1299			clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
  1300		}
  1301		return 0;
  1302	}
  1303	
> 1304	static int scpsys_resume(struct device *dev)
  1305	{
  1306		struct scpsys *scpsys = dev_get_drvdata(dev);
  1307		struct generic_pm_domain *genpd;
  1308		struct scpsys_domain *pd;
  1309		int i, ret;
  1310	
  1311		for (i = 0; i < scpsys->pd_data.num_domains; i++) {
  1312			genpd = scpsys->pd_data.domains[i];
  1313			if (!genpd)
  1314				continue;
  1315	
  1316			pd = to_scpsys_domain(genpd);
  1317			ret = clk_bulk_prepare(pd->num_clks, pd->clks);
  1318			if (ret)
  1319				return ret;
  1320			ret = clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
  1321			if (ret)
  1322				return ret;
  1323		}
  1324		return 0;
  1325	}
  1326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

