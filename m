Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A9AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TL2uoy5qOcCrx9CebUur/PvmRpFuhxAMjETO/xCzcYA=; b=yCorQziP4cJ6Xa
	fs7JCxMkMd7flvj03otWW1zTdyG9hKHGzxKUXRckExgwFynyrlB2F/gYRAGazSgGfCk3jNYsRKG2o
	/ftIfm1huPkClNQeX1pqp1G8a9R5mGOITJtGLsOsWIqBBXDxI0b60S8jzCThYWbGRwJcOhQd4j5NO
	J7xjYDSaIzXh0uVrSIlvpPsugqceSKlQgxf6r23hzexN47h8WCtYRkKoB1cj3JGHLBZK582AzuFuZ
	QdMYfLiKqfxeaa7j1xvKrp+Jxf1KXLy8YWWt0xYMZQcBSBMGkh7WofvketGB65eMf6WOh6ayGkwzi
	47Tq0Ys6jE6QJLlIovOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njKr2-00ERft-Kz; Tue, 26 Apr 2022 13:03:44 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njKfJ-00EMe4-No; Tue, 26 Apr 2022 12:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650977497; x=1682513497;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QEZA6z/saYNcGIv2cK6Ze+0gwvA8JMxQU+rfd8GKwvU=;
 b=JjV1ShnxDRIIqDCiE+yse7Q8z4vD8zi2d1awWNAL+WRxrpFBS8fj8biI
 9O4ZJW51VPKWD4x/M1q/EcxybKeDQoyJVN1FUvSYN+b+Y1gWRSyBnVoMm
 cJJpGz01VK1Z94Yf+r48veJWZuDk19F9w3h4BG0QeRnol6HITtfZS9a93
 RzdQclVQXemSaOotyW42KOUg4YWY6kR9w+GIY84693g7vq3cHugw8omaI
 4GXDacJKOEDEiVDqnC7k0cCVAkFHIv2CAX5e54ETCmtgX0iAs22G5OceA
 o33LDUQH/DpCyzK2XXQlf+NXGeeVl/qqIDvW6L4ap/bhsl1o7b2Qg2Pwk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265730120"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="265730120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 05:51:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="705035272"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2022 05:51:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1njKfA-0003ZU-AF;
 Tue, 26 Apr 2022 12:51:28 +0000
Date: Tue, 26 Apr 2022 20:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: kbuild-all@lists.01.org, khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, jia-wei.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Johnson Wang <johnson.wang@mediatek.com>
Subject: Re: [PATCH v3 2/2] PM / devfreq: mediatek: Introduce MediaTek CCI
 devfreq driver
Message-ID: <202204262037.g8ZK9iOF-lkp@intel.com>
References: <20220425125546.4129-3-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425125546.4129-3-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_055137_888223_5BE02B2A 
X-CRM114-Status: GOOD (  23.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Johnson,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v5.18-rc4 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Johnson-Wang/Introduce-MediaTek-CCI-devfreq-driver/20220425-205820
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220426/202204262037.g8ZK9iOF-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/98b34c0587837b0e5b880b11a52433f8f0eee19f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Johnson-Wang/Introduce-MediaTek-CCI-devfreq-driver/20220425-205820
        git checkout 98b34c0587837b0e5b880b11a52433f8f0eee19f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/devfreq/ sound/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/devfreq/mtk-cci-devfreq.c: In function 'mtk_ccifreq_probe':
   drivers/devfreq/mtk-cci-devfreq.c:372:21: error: 'struct devfreq_passive_data' has no member named 'parent_type'
     372 |         passive_data->parent_type = CPUFREQ_PARENT_DEV;
         |                     ^~
   drivers/devfreq/mtk-cci-devfreq.c:372:37: error: 'CPUFREQ_PARENT_DEV' undeclared (first use in this function)
     372 |         passive_data->parent_type = CPUFREQ_PARENT_DEV;
         |                                     ^~~~~~~~~~~~~~~~~~
   drivers/devfreq/mtk-cci-devfreq.c:372:37: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/device.h:15,
                    from include/linux/devfreq.h:13,
                    from drivers/devfreq/mtk-cci-devfreq.c:7:
>> drivers/devfreq/mtk-cci-devfreq.c:378:30: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long int' [-Wformat=]
     378 |                 dev_err(dev, "failed to add devfreq device: %d\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/devfreq/mtk-cci-devfreq.c:378:17: note: in expansion of macro 'dev_err'
     378 |                 dev_err(dev, "failed to add devfreq device: %d\n",
         |                 ^~~~~~~
   drivers/devfreq/mtk-cci-devfreq.c:378:62: note: format string is defined here
     378 |                 dev_err(dev, "failed to add devfreq device: %d\n",
         |                                                             ~^
         |                                                              |
         |                                                              int
         |                                                             %ld


vim +378 drivers/devfreq/mtk-cci-devfreq.c

   255	
   256	static int mtk_ccifreq_probe(struct platform_device *pdev)
   257	{
   258		struct device *dev = &pdev->dev;
   259		struct mtk_ccifreq_drv *drv;
   260		struct devfreq_passive_data *passive_data;
   261		struct dev_pm_opp *opp;
   262		unsigned long rate, opp_volt;
   263		int ret;
   264	
   265		drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
   266		if (!drv)
   267			return -ENOMEM;
   268	
   269		drv->dev = dev;
   270		drv->soc_data = (const struct mtk_ccifreq_platform_data *)
   271					of_device_get_match_data(&pdev->dev);
   272		mutex_init(&drv->reg_lock);
   273		platform_set_drvdata(pdev, drv);
   274	
   275		drv->cci_clk = devm_clk_get(dev, "cci");
   276		if (IS_ERR(drv->cci_clk)) {
   277			ret = PTR_ERR(drv->cci_clk);
   278			return dev_err_probe(dev, ret,
   279					     "failed to get cci clk: %d\n", ret);
   280		}
   281	
   282		drv->inter_clk = devm_clk_get(dev, "intermediate");
   283		if (IS_ERR(drv->inter_clk)) {
   284			ret = PTR_ERR(drv->inter_clk);
   285			dev_err_probe(dev, ret,
   286				      "failed to get intermediate clk: %d\n", ret);
   287			goto out_free_resources;
   288		}
   289	
   290		drv->proc_reg = devm_regulator_get_optional(dev, "proc");
   291		if (IS_ERR(drv->proc_reg)) {
   292			ret = PTR_ERR(drv->proc_reg);
   293			dev_err_probe(dev, ret,
   294				      "failed to get proc regulator: %d\n", ret);
   295			goto out_free_resources;
   296		}
   297	
   298		ret = regulator_enable(drv->proc_reg);
   299		if (ret) {
   300			dev_err(dev, "failed to enable proc regulator\n");
   301			goto out_free_resources;
   302		}
   303	
   304		drv->sram_reg = regulator_get_optional(dev, "sram");
   305		if (IS_ERR(drv->sram_reg))
   306			drv->sram_reg = NULL;
   307		else {
   308			ret = regulator_enable(drv->sram_reg);
   309			if (ret) {
   310				dev_err(dev, "failed to enable sram regulator\n");
   311				goto out_free_resources;
   312			}
   313		}
   314	
   315		/*
   316		 * We assume min voltage is 0 and tracking target voltage using
   317		 * min_volt_shift for each iteration.
   318		 * The retry_max is 3 times of expeted iteration count.
   319		 */
   320		drv->vtrack_max = 3 * DIV_ROUND_UP(max(drv->soc_data->sram_max_volt,
   321						       drv->soc_data->proc_max_volt),
   322						   drv->soc_data->min_volt_shift);
   323	
   324		ret = clk_prepare_enable(drv->cci_clk);
   325		if (ret)
   326			goto out_free_resources;
   327	
   328		ret = clk_prepare_enable(drv->inter_clk);
   329		if (ret)
   330			goto out_disable_cci_clk;
   331	
   332		ret = dev_pm_opp_of_add_table(dev);
   333		if (ret) {
   334			dev_err(dev, "failed to add opp table: %d\n", ret);
   335			goto out_disable_inter_clk;
   336		}
   337	
   338		rate = clk_get_rate(drv->inter_clk);
   339		opp = dev_pm_opp_find_freq_ceil(dev, &rate);
   340		if (IS_ERR(opp)) {
   341			ret = PTR_ERR(opp);
   342			dev_err(dev, "failed to get intermediate opp: %d\n", ret);
   343			goto out_remove_opp_table;
   344		}
   345		drv->inter_voltage = dev_pm_opp_get_voltage(opp);
   346		dev_pm_opp_put(opp);
   347	
   348		rate = U32_MAX;
   349		opp = dev_pm_opp_find_freq_floor(drv->dev, &rate);
   350		if (IS_ERR(opp)) {
   351			dev_err(dev, "failed to get opp\n");
   352			ret = PTR_ERR(opp);
   353			goto out_remove_opp_table;
   354		}
   355	
   356		opp_volt = dev_pm_opp_get_voltage(opp);
   357		dev_pm_opp_put(opp);
   358		ret = mtk_ccifreq_set_voltage(drv, opp_volt);
   359		if (ret) {
   360			dev_err(dev, "failed to scale to highest voltage %lu in proc_reg\n",
   361				opp_volt);
   362			goto out_remove_opp_table;
   363		}
   364	
   365		passive_data = devm_kzalloc(dev, sizeof(struct devfreq_passive_data),
   366					    GFP_KERNEL);
   367		if (!passive_data) {
   368			ret = -ENOMEM;
   369			goto out_remove_opp_table;
   370		}
   371	
   372		passive_data->parent_type = CPUFREQ_PARENT_DEV;
   373		drv->devfreq = devm_devfreq_add_device(dev, &mtk_ccifreq_profile,
   374						       DEVFREQ_GOV_PASSIVE,
   375						       passive_data);
   376		if (IS_ERR(drv->devfreq)) {
   377			ret = -EPROBE_DEFER;
 > 378			dev_err(dev, "failed to add devfreq device: %d\n",
   379				PTR_ERR(drv->devfreq));
   380			goto out_remove_opp_table;
   381		}
   382	
   383		drv->opp_nb.notifier_call = mtk_ccifreq_opp_notifier;
   384		ret = dev_pm_opp_register_notifier(dev, &drv->opp_nb);
   385		if (ret) {
   386			dev_err(dev, "failed to register opp notifier: %d\n", ret);
   387			goto out_remove_devfreq_device;
   388		}
   389		return 0;
   390	
   391	out_remove_devfreq_device:
   392		devm_devfreq_remove_device(dev, drv->devfreq);
   393	
   394	out_remove_opp_table:
   395		dev_pm_opp_of_remove_table(dev);
   396	
   397	out_disable_inter_clk:
   398		clk_disable_unprepare(drv->inter_clk);
   399	
   400	out_disable_cci_clk:
   401		clk_disable_unprepare(drv->cci_clk);
   402	
   403	out_free_resources:
   404		if (regulator_is_enabled(drv->proc_reg))
   405			regulator_disable(drv->proc_reg);
   406		if (drv->sram_reg && regulator_is_enabled(drv->sram_reg))
   407			regulator_disable(drv->sram_reg);
   408	
   409		if (!IS_ERR(drv->proc_reg))
   410			regulator_put(drv->proc_reg);
   411		if (!IS_ERR(drv->sram_reg))
   412			regulator_put(drv->sram_reg);
   413		if (!IS_ERR(drv->cci_clk))
   414			clk_put(drv->cci_clk);
   415		if (!IS_ERR(drv->inter_clk))
   416			clk_put(drv->inter_clk);
   417	
   418		return ret;
   419	}
   420	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
