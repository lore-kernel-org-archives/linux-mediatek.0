Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7E3C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 03:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkSxXlhkH1v1U9wCZ87QYjvvmJ1NgYyPaIpXA4/0Vms=; b=JGmgNXL3ARxN7pv0Jwp6UEH0Gl
	u51YKDerGjDW5TkA5l+lGYdPzg8szxiukfrr4luqgEMW7jOr1GI7hJWSaVBC16BRf6OQ9w1ifVjMY
	PEoIYRVsLzOdn66xrbRYRwVEuxIPyH6QF8vz5B+XeiyJdqdMBKvcNWR6ptbktbVl225HocSmOqhek
	djwu6WhTltaC+lj7/pWh/1x4NvYD93/xB0WD5piV39QnX14N7niHDaOY8pl8488DRoN6nyutrvAhB
	pWgJ0K0z5qF5LwMlJ9+mTlmv/pF/aI4y1b9vY8++tK8iOUD7R/ZILZn8EX6TGcyFO5vr4fP0+rBR0
	sX1ISiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN3Vs-00A5dK-Uo; Wed, 01 Feb 2023 03:10:20 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN3Vi-00A5bO-V9; Wed, 01 Feb 2023 03:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675221010; x=1706757010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hG0Cqd9tAcf9bnbBhEdpsPgvTCJitgXKwvwPCaj9CO8=;
  b=j78ziuZflrkpqK/kU5LeGC71SXyQBqi+PTyL27PLw1QLWgaPlxTS6UX/
   hsLPk1WcdwA89QpFD/jFXmO/rn6G7uCBwNWL0ss/hUt1L+81xH+kzeEBZ
   t9pPsnPAIbfapAu54B27vX5dYvYbuN6Y9vu+xz2EaoMSbhOF2cH9/xbWC
   /ARLJ39e1ClARdFbPL0qu5zRqv4ryx9qZ5Tezs4JDQ9B8fgWUmuophKkr
   KnRSuIYu6tqexd7jHkph0msdXL9qFjEn/Wu0PtiBWJ/chPhyiwTW5KJB2
   pjDHIPCX5jjW9v5VH9U/eLQZPAyjW5u9LamA5gHK90qM3b2e0KaqdAjmP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="414233288"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="414233288"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 19:09:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="695185072"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="695185072"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Jan 2023 19:09:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN3VE-0004ys-1B;
	Wed, 01 Feb 2023 03:09:40 +0000
Date: Wed, 1 Feb 2023 11:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: bchihi@baylibre.com, daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com, rafael@kernel.org,
	amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org, ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	khilman@baylibre.com, james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
Message-ID: <202302011058.17Vvc1pN-lkp@intel.com>
References: <20230131153816.21709-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131153816.21709-1-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_191011_062512_8E7D08CC 
X-CRM114-Status: GOOD (  11.49  )
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

Hi Balsam,

Thank you for the patch! Yet something to improve:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20230131-234122/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
base:   the 4th patch of https://lore.kernel.org/r/20230124131717.128660-5-bchihi%40baylibre.com
patch link:    https://lore.kernel.org/r/20230131153816.21709-1-bchihi%40baylibre.com
patch subject: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage Thermal Sensor driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302011058.17Vvc1pN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5646ebf6f10ff0fc60c04d8c57523f7c44526b41
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20230131-234122/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
        git checkout 5646ebf6f10ff0fc60c04d8c57523f7c44526b41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/thermal/mediatek/lvts_thermal.c:20:10: fatal error: dt-bindings/thermal/mediatek,lvts-thermal.h: No such file or directory
      20 | #include <dt-bindings/thermal/mediatek,lvts-thermal.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +20 drivers/thermal/mediatek/lvts_thermal.c

  > 20	#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

