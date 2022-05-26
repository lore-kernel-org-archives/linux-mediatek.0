Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842DEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlpHEX11quMw45E1XgjdEb2/PZakKagoL/KM6IWCnj4=; b=jjMojZx5a7oZLZ
	WlN9n9/RShbveEJw47e6/4WaTH18+nF8A+vYmgqVN+GsHsYHRJ9JYDGGCt4PsJ8MvPSFreJsvWYTH
	6UgyTYaW0Jsh34Pwvt+iWYlBWMSTZipQ+C9SnA2K51842Ha+tBsX7SATZAGCrxYFybfT2RsUB6+yN
	wJo0Ud+8R1skEVoQQnS+z19gU+yUwcBetWLV7YOP5u2II5DVPjgMmpPAI62oOhEp9BSI5PcSnEWlb
	bm0isCgBdJ8lmlMS4u/tMNIrIBPtNgt8jUyq8OQQwcYWaTuRtbO+E34N8YR9WHYr6kT6Be8NC6IsC
	A6TE6zt+BAk00WuB61hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuFAz-00FIMR-L5; Thu, 26 May 2022 15:13:25 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuFAo-00FIKj-AL; Thu, 26 May 2022 15:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653577994; x=1685113994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eo04dMoSFmSo3nxdW9QEasimDjpp0m2IU8Sbp5hd+fc=;
  b=QdASGE1lhpdWH4NY28YP4jLGTDKCx7If8xBk+kx8eyDwJbAoTRh1WVgE
   VmQDFo8oBd4xdvyxfE7iCACZipBzxO99QQC77GH7Nfpe8SDpxfC2F003q
   0WznKklaub8aZzrEqm8gkddCuark98qCZAk/SX2g0woVsWbuzL6gBl1lF
   /uJjHthPIjD4iS9ouAZDqXMk+bjEsNUljuOJvlAPHp0kDT8u3082/RZgN
   iPXfBhWptbdt5bzMyQ1vLpiOX4neKZNdxpTz6GbgRV+DvVlTUrQt1NxDw
   gOQZE1jtmTk6CIdJd/oN2XGbQlXoneRsVrTGSEw5Kz0Oh24zEe0eUBh0+
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="273909575"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="273909575"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 08:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="560241410"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 May 2022 08:13:09 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nuFAj-0003wy-9J;
	Thu, 26 May 2022 15:13:09 +0000
Date: Thu, 26 May 2022 23:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	lgirdwood@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, broonie@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 4/4] regulator: Add driver for MT6332 PMIC regulators
Message-ID: <202205262341.pY4PkDL7-lkp@intel.com>
References: <20220523154709.118663-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523154709.118663-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_081314_443777_28B2A383 
X-CRM114-Status: GOOD (  14.37  )
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220526/202205262341.pY4PkDL7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3d546191ad9d7d2ad2c7928204b9de51deafa675)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/062027827142f02db7e65b052d458f424811e30e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-MT6331-6332-Regulators/20220523-235049
        git checkout 062027827142f02db7e65b052d458f424811e30e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/regulator/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/regulator/mt6332-regulator.c:15:10: fatal error: 'linux/mfd/mt6332/registers.h' file not found
   #include <linux/mfd/mt6332/registers.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +15 drivers/regulator/mt6332-regulator.c

     9	
    10	#include <linux/module.h>
    11	#include <linux/of.h>
    12	#include <linux/platform_device.h>
    13	#include <linux/regmap.h>
    14	#include <linux/mfd/mt6397/core.h>
  > 15	#include <linux/mfd/mt6332/registers.h>
    16	#include <linux/regulator/driver.h>
    17	#include <linux/regulator/machine.h>
    18	#include <linux/regulator/mt6332-regulator.h>
    19	#include <linux/regulator/of_regulator.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
