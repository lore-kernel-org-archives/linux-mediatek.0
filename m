Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6800FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 12:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUz9H7Q5N0JwUvp8ZzSJmoChdTh59+mwvKPQbciU0EM=; b=Q9c0IA0ZV6SJoA
	6gFLFgkxf3joZHNOQheAT+g11aEiww+mlghsn88V9SF/HYVXuKeDLA14ubXy7kjDy/W6GvABZczUw
	NYNrChQj8mgqnYJoesgWHo0NylGOSCs61kdD/ngOkfi037uNQT63zOOIYmLCRfFf9GFYbj1Bez09j
	zMX2cS5IXEylpPRnSqGGGTzh4hBF+C6MzEqJoCRQssWFghTA63dXYjWuhurWkQzZ5FgvgmGGtNlHA
	49OBDnrYtkD+C36n1HRYxxUD0+sYywUMoDvUZyUlT/Wu/z3m+cVKFQNpqHF4a87SwoLjvXPmsSG3b
	6ZO95cThwmDURjON+1kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuCIp-00ElNC-JS; Thu, 26 May 2022 12:09:19 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuCId-00ElK6-0E; Thu, 26 May 2022 12:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653566946; x=1685102946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8cb6LUIMboo+SIEZgujmYDLknzubtzj+xpHtKPgU8yc=;
  b=kRLkXjhF8UyjRTrMWWw0iKmWJZ0BrGPwyWF7Dc9MeHtc2LkD2dkid3JJ
   XAendlBY8i7Qfn/H9zj9lzIlzypzQgAtqeaXIUfDmlHkpACKJBUtfyLGw
   w6qsn0N3dYc5U76lhM1QynVY5GruuKLkKOEBHZlirE3qjamVoUuvfoJLr
   SBxZub+0odivcG7Aqivv9LnxrbWqf0V9Yg+FGDtgAA7nfqklltdof2g9u
   mgAqG7uo8TYci5JI+Wf/IUEg8qSAFuWglpEPY1sgJKyMGudVh2o3gsxES
   hXxa9bRqhTpZ6ZfEFmR8nGqMkPSTUfOrQ+nNjIpdX7josbmdB+XXv+PC2
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="272952219"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="272952219"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 05:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="677439120"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 May 2022 05:09:02 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nuCIX-0003qe-HV;
	Thu, 26 May 2022 12:09:01 +0000
Date: Thu, 26 May 2022 20:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	lgirdwood@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, broonie@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/4] regulator: Add driver for MT6331 PMIC regulators
Message-ID: <202205261929.FCVQ5SD3-lkp@intel.com>
References: <20220523154709.118663-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523154709.118663-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_050907_125954_AF681E65 
X-CRM114-Status: GOOD (  14.12  )
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on v5.18 next-20220526]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-MT6331-6332-Regulators/20220523-235049
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220526/202205261929.FCVQ5SD3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3d546191ad9d7d2ad2c7928204b9de51deafa675)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6dc66c0e54d0e22f6688e5b61d2740e0b839fc1e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-MT6331-6332-Regulators/20220523-235049
        git checkout 6dc66c0e54d0e22f6688e5b61d2740e0b839fc1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/regulator/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/regulator/mt6331-regulator.c:15:10: fatal error: 'linux/mfd/mt6331/registers.h' file not found
   #include <linux/mfd/mt6331/registers.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +15 drivers/regulator/mt6331-regulator.c

     9	
    10	#include <linux/module.h>
    11	#include <linux/of.h>
    12	#include <linux/platform_device.h>
    13	#include <linux/regmap.h>
    14	#include <linux/mfd/mt6397/core.h>
  > 15	#include <linux/mfd/mt6331/registers.h>
    16	#include <linux/regulator/driver.h>
    17	#include <linux/regulator/machine.h>
    18	#include <linux/regulator/mt6331-regulator.h>
    19	#include <linux/regulator/of_regulator.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
