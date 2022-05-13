Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE712C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 22:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrU4PYhy58LYac8k5g4FBfSMrvoim4afB5+hRTbWQZE=; b=c+r44CyDOVwzzh
	onCql3G9OzzvU5S/Eh2NfQbk73Ydioihfp89lWjBzi7amzw6KeTEW/TcRbiRMifD0sYKLMjuupXxy
	ssSqzTFPHjUZbHxWNRVbejT9MtF6qBNinz41z6nb1kvLzvqwMGsnLC+SmQgqyjK7XD2YI0ST5wSxD
	qClZLuSRwa3bcNQyHw/wXxFiNQDGUqu2SY/gi0VUz92jfM4qiuq6Nk0acTtb1+7GRXni6klr8yjpd
	kQUkF6EvFFIOG8sbGhrREskV69Ho5xiEySMHUgsPTQtxyz+BnFSEaG0yY7Vj23i6/q3jS50/2ASi7
	zECK8mmztjH8+gUq95Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npdLo-0009mG-Sd; Fri, 13 May 2022 22:01:32 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npdLd-0009kV-28; Fri, 13 May 2022 22:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652479280; x=1684015280;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6W9kIUxVEytkIlePIUvHWEfOUUtB7d0gmWYOO/wGDro=;
 b=Z1lKTy5ph7pvzxIrxUf2eNyg3RDSgkFF0S7ruX4UIPwHj8b8XSTwZgHE
 2CQWZnHlJhqTSfSDB95n0w4KeHvlbLXNJ+sjP7fiEFBdpO+7ooMgLvqeM
 pODo2/vSfXLX/VUtQQwIGo1xCR+wLiYxQwavT3Wu8EAECEuwFbg7E7por
 dsX9kzvLifPfocBwj4xvRpslDgyIxbmt+xYiOiPk3WFbSPFdRvbX4irEG
 lub4Kt2PaxyWzVW0lRtyJ3owE5eNXEDMw8DQ80jbG+1fSeQZoDSiqC4bb
 bA8hyZ4yRGwtRK9bHIzihoKwYkMV/g1d07kWfZlaTGEQxFhBLrqpArYVy w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="270553156"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="270553156"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 15:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="625042653"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 13 May 2022 15:01:10 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npdLS-000M9U-0W;
 Fri, 13 May 2022 22:01:10 +0000
Date: Sat, 14 May 2022 06:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, angelogioacchino.delregno@collabora.com,
 jason-jh.lin@mediatek.com, ck.hu@mediatek.com, fparent@baylibre.com,
 rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com,
 ikjn@chromium.org, miles.chen@mediatek.com, sam.shih@mediatek.com,
 wenst@chromium.org, bgolaszewski@baylibre.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/5] clk: mediatek: Add MediaTek Helio X10 MT6795 clock
 drivers
Message-ID: <202205140535.hQjmJtwR-lkp@intel.com>
References: <20220513165050.500831-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513165050.500831-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_150121_137656_CCED57AA 
X-CRM114-Status: GOOD (  12.09  )
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

[auto build test ERROR on robh/for-next]
[also build test ERROR on next-20220513]
[cannot apply to clk/clk-next pza/reset/next mbgg-mediatek/for-next v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-Clock-drivers/20220514-005314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: arm64-buildonly-randconfig-r004-20220512 (https://download.01.org/0day-ci/archive/20220514/202205140535.hQjmJtwR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/991f92f26cc545a1836a3120408ce27ba7ddadab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-Clock-drivers/20220514-005314
        git checkout 991f92f26cc545a1836a3120408ce27ba7ddadab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/mediatek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/mediatek/clk-mt6795-infracfg.c:14:10: fatal error: 'reset.h' file not found
   #include "reset.h"
            ^~~~~~~~~
   1 error generated.
--
>> drivers/clk/mediatek/clk-mt6795-pericfg.c:13:10: fatal error: 'reset.h' file not found
   #include "reset.h"
            ^~~~~~~~~
   1 error generated.


vim +14 drivers/clk/mediatek/clk-mt6795-infracfg.c

  > 14	#include "reset.h"
    15	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
