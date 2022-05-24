Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7E1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrSDraFLwidlOmSvLGr/EpBQJLQqz0W7Y1pFWs+dQ9M=; b=P2OedvyqnsmUas
	DRkByxcyFTcpzNhaZGXk6rCQ14t7f7VdxuynP6ooRD/SbceONQJCZ4KfujD5SCYat77No3sYPr8aI
	/6g2eV3M1zlvo13DLoQw90TF15cvSQiHQkjAyz1rrbdjejmIuh4O7P5ZVFhSf0oN4MDloT+atS1LZ
	9/P9Qp0DDeTlbFTrn/OHJg+DMoGFvv7IgkgkZlOpjXbbTHZc8XfhRWlO/REPi5dt+VhspvIHrMG7Z
	XcO78DOR/39zV0NgrKF9HFUPjkdEYn2E/iBGtKUtdXwUcvOmH9XEUYYrOrWuKgWMuMd+OBCBnVYSB
	Qp/G19q84/ED2Nw0Di7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntUTx-0085pr-4K; Tue, 24 May 2022 13:21:53 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntUTj-0085mf-U5; Tue, 24 May 2022 13:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653398499; x=1684934499;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BFliaCv+cB0PXbv3YekuYdrRznvm76kroRO4soD7CkE=;
 b=Ed02iq+pgThgrQ2bIzJeAVvPOCAgBqfKEaUSmHM0LKQH0PUcBcCxjdcG
 pTCEyPNZT38IUyaAMKyxTOj70c3G4TjaChTVGzOk7mgbSRCehh0D8BUwa
 kGSPYPBFfktMLFcsScoqNa/8hd/QUEFaoH2gSPfgD6t0nK0Tj/Oe6CfLH
 XkSWiQ6ZBJMBaNY+7y1Is5gWAsD8rG52k9rA/GI4mcCGgWE9GD4+h6eQp
 GE/+ivZVosVOqojxeCk9P4FAUxkG3OvOHOytix8mKzHkM5tbklcFezCD/
 NhGUKjCrhs0RgRMCkZAjZMgh2eL50nZskYEXvIjJSsWegG9sII8xDgwDv Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273253413"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="273253413"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 06:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="641935455"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 24 May 2022 06:21:34 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ntUTe-00025e-17;
 Tue, 24 May 2022 13:21:34 +0000
Date: Tue, 24 May 2022 21:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Miles Chen <miles.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] clk: mediatek: mt6779: use mtk_clk_simple_probe
 to simplify driver
Message-ID: <202205242129.DezL7Tp0-lkp@intel.com>
References: <20220524083843.9994-5-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524083843.9994-5-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_062140_052158_4CD0020A 
X-CRM114-Status: GOOD (  13.96  )
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

Hi Miles,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on next-20220524]
[cannot apply to v5.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Miles-Chen/clk-mediatek-mt2701-use-mtk_clk_simple_probe-to-simplify-driver/20220524-173952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-randconfig-r014-20220524 (https://download.01.org/0day-ci/archive/20220524/202205242129.DezL7Tp0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/22d101bc8621971e234c34276dce52c37b82b498
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Miles-Chen/clk-mediatek-mt2701-use-mtk_clk_simple_probe-to-simplify-driver/20220524-173952
        git checkout 22d101bc8621971e234c34276dce52c37b82b498
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/imx/clk-imxrt1050.o
ERROR: modpost: "vmf_insert_pfn" [drivers/gpu/drm/drm_shmem_helper.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-aud.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-aud.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-vdec.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-vdec.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-cam.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-cam.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-ipe.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-ipe.ko] undefined!
ERROR: modpost: "imx_clk_hw_pfd" [drivers/clk/imx/clk-imxrt1050.ko] undefined!
WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on HAS_IOMEM && DRM && MMU
   Selected by
   - DRM_SSD130X && HAS_IOMEM && DRM

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
