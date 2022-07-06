Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83299C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8eS2rTzcqdOlJMWiIMUaYsTGj4T3vcWNS3erwMrH+Q=; b=UbN5/c5P3acPBDT/1yet4TZ7Ub
	QQfM0lHlvGkdASVIjx7FHt9x2IUnYglvpoS/8buvu8uj3YB7bAp5ari6DIcHdClghxgJBaC97Mhjk
	3Od5GKE8bJTlqpQue5yPmbmgIj3YUtIGJkygMIZCk6MLBD85geNMcHAG9UIbbApSyKXszoRe2iAtE
	JU3DwMMDVnRO0M7cFR8225sMYmPVU7flGtXdlfgk5Ph5U/lOGdI3R0Hm+wyIPjF3a+2xdf+nC3dCV
	cOBwB6N/fT2cddepEeiWgP2S3G52w3yxMoWLYVO1lbUzytpWHLt1+CtQPkfS2ok6zFhX1IZM0bfPd
	MgxyX9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93TM-009gkX-Ul; Wed, 06 Jul 2022 11:45:36 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93TB-009ghk-W1; Wed, 06 Jul 2022 11:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657107925; x=1688643925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9O/uk8hzidHlOKBk1K4kxy0EkY6O5XjVCbjq4/nqvi0=;
  b=E8jmvS8IbkkR5f55Pm2X6ECkuJK6tBXIxklmEAxwkgo32rTtU4GsVr/M
   zHPGB+Iqa/P90XgGB0qXTuivBb6OQ01RAorZ83Rb3QfhESz2EItHUsrNI
   V9yRLa/05fligcrYK8q7jw1/qkqXbmbWBxkHV7fqZR2ReV+eqo9DGg6FT
   Xhv7bvYTA/oegT87ubEatC+glEgcFORGh0WQZnmqJFQe04ro+M0lQtYzq
   CR2RXFpmHmzWPJXjGpNfrsBHF1sybzNcyly5MrrR2OV4AJVYlaw3ApsLo
   J+EHTdaoh/pZGF5EhPmPgj6zPEUS93nSHdW/JX+n7lA6JlqiR887Dw9+K
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="284844337"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="284844337"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 04:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="682890850"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2022 04:45:01 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o93Sm-000KXF-CP;
	Wed, 06 Jul 2022 11:45:00 +0000
Date: Wed, 6 Jul 2022 19:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmitry.torokhov@gmail.com
Cc: kbuild-all@lists.01.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, mkorpershoek@baylibre.com,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] Input: mtk-pmic-keys - Add support for MT6331
 PMIC keys
Message-ID: <202207061915.tYTQKEhu-lkp@intel.com>
References: <20220706101122.201007-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706101122.201007-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_044526_134870_7419B1BD 
X-CRM114-Status: GOOD (  13.64  )
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

Hi AngeloGioacchino,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on linus/master v5.19-rc5 next-20220705]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/Input-mtk-pmic-keys-Add-support-for-MT6331-PMIC-keys/20220706-181323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: arc-randconfig-r043-20220703 (https://download.01.org/0day-ci/archive/20220706/202207061915.tYTQKEhu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5e286347fa7c13c4674f97ed475e4f42a49ce5b4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/Input-mtk-pmic-keys-Add-support-for-MT6331-PMIC-keys/20220706-181323
        git checkout 5e286347fa7c13c4674f97ed475e4f42a49ce5b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/input/keyboard/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/input/keyboard/mtk-pmic-keys.c:12:10: fatal error: linux/mfd/mt6331/registers.h: No such file or directory
      12 | #include <linux/mfd/mt6331/registers.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +12 drivers/input/keyboard/mtk-pmic-keys.c

  > 12	#include <linux/mfd/mt6331/registers.h>
    13	#include <linux/mfd/mt6358/registers.h>
    14	#include <linux/mfd/mt6397/core.h>
    15	#include <linux/mfd/mt6397/registers.h>
    16	#include <linux/module.h>
    17	#include <linux/of_device.h>
    18	#include <linux/of.h>
    19	#include <linux/platform_device.h>
    20	#include <linux/regmap.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

