Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33588C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CmsgVNKfLs37u+47U1x73kgYLvN7zCXohTC7j/ZnIU=; b=1viTDtkyyZCYn2cP+Gvzf1rYcu
	qMzyVODMawiUYY/a1vbzk7ZN7h1GtBTYC3pciMTVrFqkj1CrPH4pbpBEKYvNBs5BH3seBD5fAT8WC
	Zlw6GPKhVclnd8VWku5S7OiGR2oytyrdDgcT819/uchwzSlQLiRLEPx+s4Ar6/qaTSgdUg5blSEfg
	8R4w3zeA1ameuelLFyHLgH7ZnHQ8wLk7o48kjRdLZgKeuKLsHcq0T0iiOR8HHsaoOewnskiIQeFXF
	DChVgavvQ49flmMfOfmdtlzWkBjgnJYHFoNif5RTZi7v72i+Xi3qBgi1JSOYMm5ws9uBC3Joy4pzd
	PkfYE60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCiVh-00000007oyK-2sWy;
	Thu, 30 May 2024 16:20:13 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCiVZ-00000007owv-3Vci;
	Thu, 30 May 2024 16:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717086005; x=1748622005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4kn4vjazlOgWAkFWvL+DJ8Sb/gYaYuXSroU8uHXVN+E=;
  b=NTB4O9Obx0Ufeu6Fu9JFUu1EYUzlt7992Tz44hOiuqigVrkVoPI3ROfe
   HmYPhzS7/UtMCTaxk1/ZSJ59fniP2i7ECPzh2yI1n+3MV1NDu/9gJRrhm
   fvFc/w+z0/PTzv+TLPVLQamHMyaaDUOO7mRmINjdqx8pJMT8mBeL5lXl/
   m2RcS8XfkM/FfmSxzEMicQ9FG7Lo/i2G1+CjjpQltZa3tlyOk8HO21rRf
   TZx4dnrDF+/tUROzKxKst/8gMTbDHvVODX14aA0yolr5Y1bOqFRbbjsm8
   mXkhxt+IisrXrs8E+/o9H/UuQVnyiDQLKMN1GwURikR7TbC3qyf8lFr+l
   g==;
X-CSE-ConnectionGUID: SqWywrr9QJaZwp7ME8iZwA==
X-CSE-MsgGUID: Hk2g9TpQS7O6stvc34KryA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24139722"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="24139722"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 09:19:45 -0700
X-CSE-ConnectionGUID: aEyrTQvAS7ivZk9nl5t0+g==
X-CSE-MsgGUID: Ydc/93sIThmnu9UFkE6+XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35946498"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 May 2024 09:19:40 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCiUl-000Fgf-2G;
	Thu, 30 May 2024 16:19:20 +0000
Date: Fri, 31 May 2024 00:15:28 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: mediatek: Add mt8173-mfgtop driver
Message-ID: <202405310018.2eeqgDyV-lkp@intel.com>
References: <20240530083513.4135052-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530083513.4135052-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_092005_948495_BB204FF9 
X-CRM114-Status: GOOD (  16.58  )
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

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-clock-mediatek-Add-mt8173-mfgtop/20240530-163739
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240530083513.4135052-3-wenst%40chromium.org
patch subject: [PATCH 2/6] clk: mediatek: Add mt8173-mfgtop driver
config: arc-randconfig-001-20240530 (https://download.01.org/0day-ci/archive/20240531/202405310018.2eeqgDyV-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310018.2eeqgDyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310018.2eeqgDyV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pmdomain/core.c: In function 'genpd_queue_power_off_work':
   drivers/pmdomain/core.c:701:20: error: 'pm_wq' undeclared (first use in this function)
     701 |         queue_work(pm_wq, &genpd->power_off_work);
         |                    ^~~~~
   drivers/pmdomain/core.c:701:20: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pmdomain/core.c: In function 'genpd_dev_pm_qos_notifier':
   drivers/pmdomain/core.c:900:39: error: 'struct dev_pm_info' has no member named 'ignore_children'
     900 |                 if (!dev || dev->power.ignore_children)
         |                                       ^
   drivers/pmdomain/core.c: In function 'rtpm_status_str':
>> drivers/pmdomain/core.c:3111:23: error: 'struct dev_pm_info' has no member named 'runtime_error'
    3111 |         if (dev->power.runtime_error)
         |                       ^
>> drivers/pmdomain/core.c:3113:28: error: 'struct dev_pm_info' has no member named 'disable_depth'
    3113 |         else if (dev->power.disable_depth)
         |                            ^
>> drivers/pmdomain/core.c:3115:28: error: 'struct dev_pm_info' has no member named 'runtime_status'
    3115 |         else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
         |                            ^
   drivers/pmdomain/core.c:3116:45: error: 'struct dev_pm_info' has no member named 'runtime_status'
    3116 |                 p = status_lookup[dev->power.runtime_status];
         |                                             ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
   Depends on [n]: PM [=n]
   Selected by [m]:
   - COMMON_CLK_MT8173_MFGTOP [=m] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=m]


vim +3111 drivers/pmdomain/core.c

2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3095  
8b0510b52478a4e drivers/base/power/domain.c Jon Hunter        2016-08-11  3096  #ifdef CONFIG_DEBUG_FS
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3097  /*
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3098   * TODO: This function is a slightly modified version of rtpm_status_show
d30d819dc831078 drivers/base/power/domain.c Rafael J. Wysocki 2014-11-27  3099   * from sysfs.c, so generalize it.
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3100   */
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3101  static void rtpm_status_str(struct seq_file *s, struct device *dev)
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3102  {
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3103  	static const char * const status_lookup[] = {
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3104  		[RPM_ACTIVE] = "active",
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3105  		[RPM_RESUMING] = "resuming",
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3106  		[RPM_SUSPENDED] = "suspended",
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3107  		[RPM_SUSPENDING] = "suspending"
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3108  	};
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3109  	const char *p = "";
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3110  
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15 @3111  	if (dev->power.runtime_error)
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3112  		p = "error";
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15 @3113  	else if (dev->power.disable_depth)
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3114  		p = "unsupported";
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15 @3115  	else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3116  		p = status_lookup[dev->power.runtime_status];
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3117  	else
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3118  		WARN_ON(1);
2bd5306a8764d94 drivers/base/power/domain.c Maciej Matraszek  2014-09-15  3119  
45fbc464b047b3f drivers/base/power/domain.c Dmitry Osipenko   2021-01-21  3120  	seq_printf(s, "%-25s  ", p);
45fbc464b047b3f drivers/base/power/domain.c Dmitry Osipenko   2021-01-21  3121  }
45fbc464b047b3f drivers/base/power/domain.c Dmitry Osipenko   2021-01-21  3122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

