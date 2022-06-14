Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99569C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 06:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zx+n8f9huypVsn3kww8mkRfgAsmEMJblPCZ3wSKNj+A=; b=BpBVStFVs4K+jy
	VfTBaE6aQI+sxPGQ0Rkz0raQYi6IRTFqlmmZhX9fwihEcWjX/qF0JXikvtV8YqH/Dgr1z8qi0Qe/7
	nRN8gQQ4NZ9VQUlpJxv8Uz27qiskGpbPHFTTyCzHZ/iEVRLHXVNireGDYYCAcqW3BNhjOsdI1ICkt
	/dLsAvEDWNzlk/r+1Sb+7nC1zazuAwuoe0wLqbJdwSjohP4XdirlGEqOcVfdQpj04hEDWMoMR4Hqr
	hQ8wuabLELemkg8R7KwMF5V2BV2v7zVAElc9lHs5bOaaKLB2Vbh7OFMsu4/79fyYduKE+ojrWsS8N
	FxRWBzRIkL0KN9k5T0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ztn-007E6P-Vr; Tue, 14 Jun 2022 06:19:36 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ztc-007E4C-Ri; Tue, 14 Jun 2022 06:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655187564; x=1686723564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G7Y9H6pjfhFNNFt9HzcJbUr6NMbLnNfbUFKiekG8WDg=;
  b=QIiGelqvQx6QCyXc4FiMYU+EYqDLjSEdxQmtYCaIW+piwrfEcJMccAS4
   fFOo8qMIeFtoPHP1t+B5nrC/NL+K/swjm02KrriZeme0nUgCfnSE96uYY
   JOmAIPsn2ChvgM6kHd6uRxBlM8s4ZCt/p15Z12I3AGX5HCOaUAoVW+ad+
   TVxSfM26JVceiuCQf6JnHJBtBgHfFYiXxasUAa+My/5jeaktXXUOfzLhA
   CHeMGTcDOjYtUcTes7Xu6rA9GZO5oZenNgaLPI4cyB409j90W5D83frLN
   9l4D2Oy/R6V+EI1MIFw3BXuOCStu17mYq84MuK6XUrB4bD/FaaFNDEqYW
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="277298465"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="277298465"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 23:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="588249606"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2022 23:19:17 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0ztU-000LYn-QI;
	Tue, 14 Jun 2022 06:19:16 +0000
Date: Tue, 14 Jun 2022 14:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, pmladek@suse.com,
	acme@kernel.org, akpm@linux-foundation.org,
	alexander.shishkin@linux.intel.com, catalin.marinas@arm.com,
	davem@davemloft.net, jolsa@redhat.com, jthierry@redhat.com,
	keescook@chromium.org, kernelfans@gmail.com,
	lecopzer.chen@mediatek.com, linux-mediatek@lists.infradead.org,
	linux-perf-users@vger.kernel.org, mark.rutland@arm.com,
	masahiroy@kernel.org, matthias.bgg@gmail.com, maz@kernel.org,
	mcgrof@kernel.org, mingo@redhat.com, namhyung@kernel.org,
	nixiaoming@huawei.com, peterz@infradead.org,
	sparclinux@vger.kernel.org, sumit.garg@linaro.org,
	wangqing@vivo.com, will@kernel.org, yj.chiang@mediatek.com
Subject: Re: [PATCH v5 4/6] kernel/watchdog: Adapt the watchdog_hld interface
 for async model
Message-ID: <202206141412.PeVDy6qk-lkp@intel.com>
References: <20220613135956.15711-5-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613135956.15711-5-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_231924_954218_B3674E17 
X-CRM114-Status: GOOD (  11.97  )
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
[also build test ERROR on arm/for-next kvmarm/next soc/for-next]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Lecopzer-Chen/Support-hld-delayed-init-based-on-Pseudo-NMI-for/20220614-021318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: hexagon-randconfig-r024-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141412.PeVDy6qk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7df94eb967160312b005f9d8a29b558beec2d5a7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lecopzer-Chen/Support-hld-delayed-init-based-on-Pseudo-NMI-for/20220614-021318
        git checkout 7df94eb967160312b005f9d8a29b558beec2d5a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/watchdog.c:915:3: error: use of undeclared identifier 'allow_lockup_detector_init_retry'
                   allow_lockup_detector_init_retry = true;
                   ^
   1 error generated.


vim +/allow_lockup_detector_init_retry +915 kernel/watchdog.c

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
