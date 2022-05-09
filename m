Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C978DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mW/dmAMUEX66BQHGcSEBOw7A4lp8YIjaU8e6LeX9wwA=; b=CkH9Yd9yOw7SGx
	wfAEHKUwiC34DuQgwY7jiJnVRDmmBafjTNYnZ+xwp2L3APA2WYHcMKRlSX77efevTyX5bbQyZyclN
	kfmgE4pDl1EeIe7xl8hrf8p9T0t0L1T6PklQGcyrHNZb2LDoJFTHPqlykr+PWzF3F6iXbOQXA5kXl
	KUQEmX34vQYpcDIjh/is5UFhJN/jSDW6xU2QhivECl99Lg6/n6lvJ3srneuB4+aQV4GKnFJzeJ9Nf
	q/3lWYC1Dj+ilW0Ji28TdRFTsIRClxiYcJ5FzQdI97XAe3vl/18TnfM3pOF/kMF0Rz7HzvWH6IBXO
	9JDIr27guv5ToAntWgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no9SP-00G5SI-EM; Mon, 09 May 2022 19:54:13 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no9SE-00G5Q4-Ry; Mon, 09 May 2022 19:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652126042; x=1683662042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TQPJMVgr8Y0+pWZ1dG23nKFgTtXv/p/Uqh4dA7ld2SY=;
 b=C1vDLa9Uf5o+jMrPQAfCyP5Nhxjo3mBgaN4MuJv9aiLDSur4+crLUtLv
 e+Prhex5XUq5m5Ai4BXz+u1FDdFBrRTjqqGFKCJTIhdH2L5lD6mMLkxz7
 +33EQd7QyIToWNZ8M7untrmriAX2QrkSQAXD54bZP2/PoRLrJzzmNU85k
 XCGTI10sAkvnf8ZyoanlAtShvFp5bsmDCO5RYIBL/caolYv+SzXRF5GJh
 IgsZVHR+9au/clvE31Qxq5yK8W+rPHjCiKIfoz8MWppjBk4hx+uXuF4B9
 4fu7GQ3aami33SCxUi5lhq5yDvKL52JiYZKYXgrZt9Yax5hDv1ITVW+uH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269086724"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="269086724"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 12:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="669507546"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 09 May 2022 12:53:55 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1no9S7-000GqY-6u;
 Mon, 09 May 2022 19:53:55 +0000
Date: Tue, 10 May 2022 03:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 daniel.lezcano@linaro.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, tglx@linutronix.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/2] clocksource/drivers/timer-mediatek: Implement
 CPUXGPT timers
Message-ID: <202205100325.mvo9fxmN-lkp@intel.com>
References: <20220509102058.3064215-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220509102058.3064215-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_125402_982567_A3614651 
X-CRM114-Status: GOOD (  14.01  )
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

Hi AngeloGioacchino,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on robh/for-next v5.18-rc6 next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/MediaTek-SoC-ARM-ARM64-System-Timer/20220509-182806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git f4b62e1e1137507268c2c63dc4e6da279dc58e9f
config: mips-randconfig-r015-20220509 (https://download.01.org/0day-ci/archive/20220510/202205100325.mvo9fxmN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a385645b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/cd08992dd0c0e2c02229be62ecb2a51da4c1d315
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/MediaTek-SoC-ARM-ARM64-System-Timer/20220509-182806
        git checkout cd08992dd0c0e2c02229be62ecb2a51da4c1d315
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/clocksource/ drivers/gpu/drm/mgag200/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clocksource/timer-mediatek.c:103:6: warning: variable 'val' set but not used [-Wunused-but-set-variable]
           u32 val;
               ^
   1 warning generated.


vim +/val +103 drivers/clocksource/timer-mediatek.c

    99	
   100	static void mtk_cpux_disable_irq(struct timer_of *to)
   101	{
   102		const unsigned long *irq_mask = cpumask_bits(cpu_possible_mask);
 > 103		u32 val;
   104	
   105		val = mtk_cpux_readl(CPUX_IDX_GLOBAL_IRQ, to);
   106		val &= ~(*irq_mask);
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
