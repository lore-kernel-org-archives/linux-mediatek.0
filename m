Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B39C27C44
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 18:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsPFVl50512fzdSHn/TjkMgHFG+pYcfiORaRtNmU/DA=; b=baVTQ5Ejw5KNTYorUsqqSq0hr2
	NIBY2DfOr8vabWSZoDklnaIC8v345OOFqp2crO8RDAfcyget95zotNFP9NekWSKPdAc8iTLphNpWR
	xqFO4M6woShBlr/xVYcT1Pf9Olqs1azMDvoatTe4rcdtmqX1PAhV71SQzLxai3bllweVBAe6ngwdq
	jdbFVXUoab9bjP+TYLBmLfaJUAE/jTa3UOyMhoiUXqGkb1HzHxtJ4MgkQhvT9U7ijBdKZls9WJeZq
	F6ZybZDhUx9GQsOHYADzER5Grh5Sa6GU6RMt/VMCaNYiNTH5iNKJckG3Mn044lydILPD0vh8BR0vF
	IiOMRuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCk8H-00000008416-3zew;
	Thu, 30 May 2024 18:04:09 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCk8E-0000000840L-1LkH;
	Thu, 30 May 2024 18:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717092246; x=1748628246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BEIEhrG9qX9RIUaoual1xQdHFV9ZgAZNbmY16Qsocp4=;
  b=EKFtIJOEYZSwj6wRugEF+CzS6Eru2ELTtsg78fV3qzgr4Tv1gG/Zm2zx
   cwukg4VJfvvkfCcu9CVo5Y7RzyxnrNL/2g/lEMyzeHqZnMnGqh+xzyr6o
   mmm9BZs8cAjoh73SMe+mB11cjzgEYoykmT+BzsGhTENGIasznPR5aVcdL
   Z9GorAsi4uxdHvcuGTlgfhBNfpuQf+lwQMmms3hg3rrcCXhXRRkc/7myQ
   ytLMnjFRglW8xDFe9QUqjM3OxmAGQtb3cxRAgKqD4FnNJR//bJnDBZpow
   TvFKay74vZzgSDveud6kumokg6bXArJiMhG0cep2dVDZmxV4bA9WFd95J
   w==;
X-CSE-ConnectionGUID: 9d5EvYYMTsuvACLbi8gMUg==
X-CSE-MsgGUID: /6uARkf6QJmQbXZgyGyfXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13828131"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13828131"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 11:04:05 -0700
X-CSE-ConnectionGUID: zucVqWpJR0mBCJBFt7Bqzw==
X-CSE-MsgGUID: p3huy5JiRFKNX17xuU9R6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="36389437"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 May 2024 11:04:00 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCk85-000For-1p;
	Thu, 30 May 2024 18:03:57 +0000
Date: Fri, 31 May 2024 02:03:33 +0800
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
Message-ID: <202405310123.KWoPspRr-lkp@intel.com>
References: <20240530083513.4135052-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530083513.4135052-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_110406_400635_B7C9FBE2 
X-CRM114-Status: GOOD (  12.66  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-clock-mediatek-Add-mt8173-mfgtop/20240530-163739
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240530083513.4135052-3-wenst%40chromium.org
patch subject: [PATCH 2/6] clk: mediatek: Add mt8173-mfgtop driver
config: x86_64-buildonly-randconfig-002-20240531 (https://download.01.org/0day-ci/archive/20240531/202405310123.KWoPspRr-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310123.KWoPspRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310123.KWoPspRr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/core.c:2965:34: warning: 'idle_state_match' defined but not used [-Wunused-const-variable=]
    2965 | static const struct of_device_id idle_state_match[] = {
         |                                  ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y]


vim +/idle_state_match +2965 drivers/pmdomain/core.c

5d6be70add65e3 drivers/base/power/domain.c Ulf Hansson 2018-06-29  2964  
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14 @2965  static const struct of_device_id idle_state_match[] = {
598da548ef7892 drivers/base/power/domain.c Lina Iyer   2016-11-03  2966  	{ .compatible = "domain-idle-state", },
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14  2967  	{ }
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14  2968  };
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14  2969  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

