Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EEEC2BA2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 14:35:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F682206C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 14:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ORHJYMeg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F682206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohsl9+eAUOKNhy8BAVari7hRcN/r+tTxHgvg9gx8bSI=; b=ORHJYMegAr7DN/
	lg1MgRG4p0VJiN5t2H7Ek94Iuv0VvszQ3OnM823Z93gxdGdVp0vZfUomrW+eDjPZ1KPIJPhXBLusC
	vChve4nWroafqWUkhsg/WfbOl4vqo+xa9I9stGSqqfNLxL5f+zjRs5v4CV6GBhNGuW/a1J0GUUUrQ
	bgmHgJKob+EFIOM9T44MhV2RTp2UBhiS9SJ+q31QB7Prn5lOw6uNaTH6WUGx5QwP2HLAaLyDN+h6M
	B/j7Uy2HF4hsi5y+cRzey2sVh4+s8f+P6TuQ9wC8FhHH7R1jYkQj+6aN/ndTyaM2wx+d36acRP321
	rGW5k34bYLCBSnY1Rziw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMul6-0005zh-2X; Fri, 10 Apr 2020 14:35:52 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMul2-0005yu-AY; Fri, 10 Apr 2020 14:35:50 +0000
IronPort-SDR: bnhzqzE9lVa59gIAb/Abw5TE/KMvdsplrUnw1Svv7ffa4+vZkVnCVinU8H6LtCspK8aVmgBV8j
 SStlJ3EORuVQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2020 07:35:47 -0700
IronPort-SDR: zbr0ICL8riBJrAXbriEa/9w1ujdIoqqgAGMjnLyN9w4Nec3cKPTFsGtKgxVvoM//J3X4m11JrW
 N6k7oPxJliCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,367,1580803200"; d="scan'208";a="260698530"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 10 Apr 2020 07:35:36 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jMukq-000Dv4-1O; Fri, 10 Apr 2020 22:35:36 +0800
Date: Fri, 10 Apr 2020 22:35:28 +0800
From: kbuild test robot <lkp@intel.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than
 CPUs in Energy Model
Message-ID: <202004102201.DHeSXu2d%lkp@intel.com>
References: <20200410084210.24932-5-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410084210.24932-5-lukasz.luba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_073548_404610_73C6AC43 
X-CRM114-Status: GOOD (  14.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, mka@chromium.org,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 kbuild-all@lists.01.org, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, shawnguo@kernel.org,
 lukasz.luba@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Lukasz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20200409]
[cannot apply to pm/linux-next tip/sched/core linus/master linux/master v5.6 v5.6-rc7 v5.6-rc6 v5.6]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Lukasz-Luba/Add-support-for-devices-in-the-Energy-Model/20200410-172456
base:    873e37a44b1ee8ad4628ca257dc51c0c7c654326

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> kernel/power/energy_model.c:394:15: warning: Variable 'ret' is assigned a value that is never used. [unreadVariable]
    int cpu, ret = 0;
                 ^

vim +/ret +394 kernel/power/energy_model.c

27871f7a8a341e Quentin Perret  2018-12-03  370  
27871f7a8a341e Quentin Perret  2018-12-03  371  /**
b4dc5cca354b8a Lukasz Luba     2020-04-10  372   * em_dev_register_perf_domain() - Register the Energy Model (EM) for a device
b4dc5cca354b8a Lukasz Luba     2020-04-10  373   * @dev		: Device for which the EM is to register
1ccc27ced21bf5 Lukasz Luba     2020-04-10  374   * @nr_states	: Number of performance states to register
27871f7a8a341e Quentin Perret  2018-12-03  375   * @cb		: Callback functions providing the data of the Energy Model
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  376   * @cpus	: Pointer to cpumask_t, which in case of a CPU device is
b4dc5cca354b8a Lukasz Luba     2020-04-10  377   *		obligatory. It can be taken from i.e. 'policy->cpus'. For other
b4dc5cca354b8a Lukasz Luba     2020-04-10  378   *		type of devices this should be set to NULL.
27871f7a8a341e Quentin Perret  2018-12-03  379   *
27871f7a8a341e Quentin Perret  2018-12-03  380   * Create Energy Model tables for a performance domain using the callbacks
27871f7a8a341e Quentin Perret  2018-12-03  381   * defined in cb.
27871f7a8a341e Quentin Perret  2018-12-03  382   *
27871f7a8a341e Quentin Perret  2018-12-03  383   * If multiple clients register the same performance domain, all but the first
27871f7a8a341e Quentin Perret  2018-12-03  384   * registration will be ignored.
27871f7a8a341e Quentin Perret  2018-12-03  385   *
27871f7a8a341e Quentin Perret  2018-12-03  386   * Return 0 on success
27871f7a8a341e Quentin Perret  2018-12-03  387   */
b4dc5cca354b8a Lukasz Luba     2020-04-10  388  int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  389  				struct em_data_callback *cb, cpumask_t *cpus)
27871f7a8a341e Quentin Perret  2018-12-03  390  {
27871f7a8a341e Quentin Perret  2018-12-03  391  	unsigned long cap, prev_cap = 0;
27871f7a8a341e Quentin Perret  2018-12-03  392  	struct em_perf_domain *pd;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  393  	struct em_device *em_dev;
27871f7a8a341e Quentin Perret  2018-12-03 @394  	int cpu, ret = 0;
27871f7a8a341e Quentin Perret  2018-12-03  395  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  396  	if (!dev || !nr_states || !cb)
27871f7a8a341e Quentin Perret  2018-12-03  397  		return -EINVAL;
27871f7a8a341e Quentin Perret  2018-12-03  398  
27871f7a8a341e Quentin Perret  2018-12-03  399  	/*
27871f7a8a341e Quentin Perret  2018-12-03  400  	 * Use a mutex to serialize the registration of performance domains and
27871f7a8a341e Quentin Perret  2018-12-03  401  	 * let the driver-defined callback functions sleep.
27871f7a8a341e Quentin Perret  2018-12-03  402  	 */
27871f7a8a341e Quentin Perret  2018-12-03  403  	mutex_lock(&em_pd_mutex);
27871f7a8a341e Quentin Perret  2018-12-03  404  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  405  	em_dev = _em_dev_find_existing(dev);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  406  	if (em_dev) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  407  		mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  408  		dev_dbg(dev, "EM: found exisiting pd%d\n", em_dev->id);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  409  		return -EEXIST;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  410  	}
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  411  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  412  	if (_is_cpu_device(dev)) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  413  		if (!cpus) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  414  			mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  415  			dev_err(dev, "EM: invalid CPU mask\n");
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  416  			return -EINVAL;
27871f7a8a341e Quentin Perret  2018-12-03  417  		}
27871f7a8a341e Quentin Perret  2018-12-03  418  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  419  		/* Make sure we don't register domain for existing CPUs */
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  420  		if (em_cpus_pd_exist(cpus)) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  421  			mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  422  			return -EEXIST;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  423  		}
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  424  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  425  		for_each_cpu(cpu, cpus) {
27871f7a8a341e Quentin Perret  2018-12-03  426  			/*
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  427  			 * All CPUs of a domain must have the same
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  428  			 * micro-architecture since they all share the same
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  429  			 * table.
27871f7a8a341e Quentin Perret  2018-12-03  430  			 */
8ec59c0f5f4966 Vincent Guittot 2019-06-17  431  			cap = arch_scale_cpu_capacity(cpu);
27871f7a8a341e Quentin Perret  2018-12-03  432  			if (prev_cap && prev_cap != cap) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  433  				dev_err(dev, "EM: CPUs of %*pbl must have the same capacity\n",
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  434  					cpumask_pr_args(cpus));
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  435  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  436  				mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  437  				return -EINVAL;
27871f7a8a341e Quentin Perret  2018-12-03  438  			}
27871f7a8a341e Quentin Perret  2018-12-03  439  			prev_cap = cap;
27871f7a8a341e Quentin Perret  2018-12-03  440  		}
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  441  	}
27871f7a8a341e Quentin Perret  2018-12-03  442  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  443  	pd = em_create_pd(dev, nr_states, cb, cpus);
27871f7a8a341e Quentin Perret  2018-12-03  444  	if (!pd) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  445  		mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  446  		return -EINVAL;
27871f7a8a341e Quentin Perret  2018-12-03  447  	}
27871f7a8a341e Quentin Perret  2018-12-03  448  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  449  	em_dev = kzalloc(sizeof(struct em_device), GFP_KERNEL);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  450  	if (!em_dev) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  451  		ret = -ENOMEM;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  452  		goto free_pd;
27871f7a8a341e Quentin Perret  2018-12-03  453  	}
27871f7a8a341e Quentin Perret  2018-12-03  454  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  455  	em_dev->id = ida_simple_get(&em_dev_ida, 0, 0, GFP_KERNEL);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  456  	if (em_dev->id < 0) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  457  		ret = em_dev->id;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  458  		goto free_em_dev;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  459  	}
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  460  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  461  	em_dev->em_pd = pd;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  462  	em_dev->dev = dev;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  463  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  464  	kref_init(&em_dev->kref);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  465  	list_add(&em_dev->em_dev_list, &em_pd_dev_list);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  466  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  467  	em_debug_create_pd(em_dev);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  468  	dev_dbg(dev, "EM: created perf domain pd%d\n", em_dev->id);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  469  
27871f7a8a341e Quentin Perret  2018-12-03  470  	mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  471  	return 0;
27871f7a8a341e Quentin Perret  2018-12-03  472  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  473  free_em_dev:
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  474  	kfree(em_dev);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  475  free_pd:
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  476  	kfree(pd->table);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  477  	kfree(pd);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  478  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  479  	mutex_unlock(&em_pd_mutex);
27871f7a8a341e Quentin Perret  2018-12-03  480  	return ret;
27871f7a8a341e Quentin Perret  2018-12-03  481  }
b4dc5cca354b8a Lukasz Luba     2020-04-10  482  EXPORT_SYMBOL_GPL(em_dev_register_perf_domain);
b4dc5cca354b8a Lukasz Luba     2020-04-10  483  

:::::: The code at line 394 was first introduced by commit
:::::: 27871f7a8a341ef5c636a337856369acf8013e4e PM: Introduce an Energy Model management framework

:::::: TO: Quentin Perret <quentin.perret@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
