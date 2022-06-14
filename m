Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB515C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 05:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mYUCmDb6px3pxf6Qk1PQZEFoB2M0A5TYOPkER0X1pE=; b=tHrm2KdifCvdrQ
	9pyj6Rao1PaFDEqtmGcRJ+Lhgywk+nz1hVcIYSiBKggrED5RL/8kzuXxmuPH6tVYQAryDRBT2ZDdM
	djyUvsG+w2R8An5eetkA5wy0MXx7Iw9Mt+8hxueBeaitzrpaEl+lgR4DkwIRdE7F1j8/ZLFS17lb3
	KkSuuGOD1wJZk0RyXq4X4QOFn+7sMozp7idomNNmUQpbSvZv8H0ghNwIGxCvHw8QEH0nXkRqWVyu5
	o3rdkClYpwvISy+BDDnop7SKrvmoN757g3bIQzazVS5So6nmXyYzZ3WJbV/60Udtwtj93NkA7+ViI
	/PZ79pne9KfQjeflHvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0zZV-007Ah4-RR; Tue, 14 Jun 2022 05:58:37 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0zZJ-007Ady-2s; Tue, 14 Jun 2022 05:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655186305; x=1686722305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ywmOAFbDeYJlfmJGeX0tKQffJo9BReoENhKIXWT7mPc=;
  b=UX5XUHwpGADxWhEscw0nLSGTyVah86VzTTZNy3TJn0ehuZFtEoyDUVh8
   FD/RnowR8zHa2CYEiwkF4Qdo/RzJSd8spCDEqkjKV585fIqtxspMq4FIp
   75HgGkIBMqSiMkUK1AyQ6/trA7cjHSHDc2uycrD9XnDA7P99Vyk+X66Aq
   4b0tYjgodz6JiKrzwmdcNMxDBTk38C2eI1HiidB9Zl1ZG4x9o/UBXOrqw
   8KKaNz9rgyMAU3kaDwGyWx5u1vKIgVbNzHZPe/1NWHcXHAOH2yrSZHkne
   cADXd3r4ZO2ZOwAe5hv7P/ycPbIeiqe61Xby/PCnqTNzRQIRqguGn25JH
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="258347352"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="258347352"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 22:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="830209036"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2022 22:58:16 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0zZ9-000LXv-Jb;
	Tue, 14 Jun 2022 05:58:15 +0000
Date: Tue, 14 Jun 2022 13:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, pmladek@suse.com, acme@kernel.org,
	akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
	catalin.marinas@arm.com, davem@davemloft.net, jolsa@redhat.com,
	jthierry@redhat.com, keescook@chromium.org, kernelfans@gmail.com,
	lecopzer.chen@mediatek.com, linux-mediatek@lists.infradead.org,
	linux-perf-users@vger.kernel.org, mark.rutland@arm.com,
	masahiroy@kernel.org, matthias.bgg@gmail.com, maz@kernel.org,
	mcgrof@kernel.org, mingo@redhat.com, namhyung@kernel.org,
	nixiaoming@huawei.com, peterz@infradead.org,
	sparclinux@vger.kernel.org, sumit.garg@linaro.org,
	wangqing@vivo.com, will@kernel.org, yj.chiang@mediatek.com
Subject: Re: [PATCH v5 4/6] kernel/watchdog: Adapt the watchdog_hld interface
 for async model
Message-ID: <202206141348.e7aqnN0q-lkp@intel.com>
References: <20220613135956.15711-5-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613135956.15711-5-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_225825_216293_05A72A09 
X-CRM114-Status: GOOD (  15.22  )
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

Hi Lecopzer,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm/for-next kvmarm/next soc/for-next linus/master v5.19-rc2 next-20220610]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Lecopzer-Chen/Support-hld-delayed-init-based-on-Pseudo-NMI-for/20220614-021318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: sparc64-randconfig-r026-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141348.e7aqnN0q-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7df94eb967160312b005f9d8a29b558beec2d5a7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lecopzer-Chen/Support-hld-delayed-init-based-on-Pseudo-NMI-for/20220614-021318
        git checkout 7df94eb967160312b005f9d8a29b558beec2d5a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/watchdog.c: In function 'lockup_detector_init':
>> kernel/watchdog.c:915:17: error: 'allow_lockup_detector_init_retry' undeclared (first use in this function); did you mean 'retry_lockup_detector_init'?
     915 |                 allow_lockup_detector_init_retry = true;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 retry_lockup_detector_init
   kernel/watchdog.c:915:17: note: each undeclared identifier is reported only once for each function it appears in


vim +915 kernel/watchdog.c

   903	
   904	void __init lockup_detector_init(void)
   905	{
   906		if (tick_nohz_full_enabled())
   907			pr_info("Disabling watchdog on nohz_full cores by default\n");
   908	
   909		cpumask_copy(&watchdog_cpumask,
   910			     housekeeping_cpumask(HK_TYPE_TIMER));
   911	
   912		if (!watchdog_nmi_probe())
   913			nmi_watchdog_available = true;
   914		else
 > 915			allow_lockup_detector_init_retry = true;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
