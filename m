Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D55C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 06:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ulMfUWUhlkCXGFx0HUB6mhvRRwkBi6ngLZ9kQu8i6M=; b=Wp+W06+IiayyIr6ZaRrfw49t6z
	qQMYyz+7ZkANGAd5Q6yOeqNzeDlU0GCtyJtJsEd+XKsnB3d4yHzgHL6Rwz2cdk4+zuuSRFE0add4F
	97DBOzQd5rOIKLRfFUi6Znxyb8S8cA20+2aRV4hn4wnIvWk21nggb/ItsUpeuHruX9rQC6LwFS+yl
	jCAS+FZ5z1+64PEBUarjEh3L/wM3CkwMoZS7qA2SJqgLG5v2bPTNwk7H/LPPwh6bKxDOXPZvaHJ1h
	XOul9CU8y4Ft/vHqOeyyZq5pAdagA2mCwUo6qvXOjKTSNK7bEOtjjaDh6kFUQJ33ZB4tJUvY8tkmL
	M2CWh5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRocr-00023R-Oe; Tue, 14 Feb 2023 06:17:13 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRoch-00020r-DI; Tue, 14 Feb 2023 06:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676355423; x=1707891423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=03gfl7nTjTP9LJuGUTYnI/DE/HmA7cJs/uy9X6zRFt0=;
  b=OHUSG18lLw3qaD/f2TiQRtZYogrTVOMo1ZtzfhIiW4D21N6rnPu/rYgW
   4bQb9xwKql9wxBKaCwqGB4YCQf8bsLMOq/Y47aY1gJlNSOTBixK7PE5bS
   TYzCHyG6aEehalYwv3bSFoRXjbLwnLBwCzmITiruedg3jdkUfavOEhmLC
   JxAt5y40UVtU7doweJTEKZ/hiUseoGZK8xDp1VlCaRdEiTk3TXBrq/WzO
   88cK9f9uO/Ng5o0aMNRJoLby4rcLId2ymRU1fjV0rIUdkKGrvJsdkVmch
   Ih1XlBZLldIlf72J430V1TIHq6YDphAzi/S6K5cUvMulINWdW6bmXlGxJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395705130"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="395705130"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 22:17:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="671122290"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="671122290"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 22:16:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRocb-0008GS-1Q;
	Tue, 14 Feb 2023 06:16:57 +0000
Date: Tue, 14 Feb 2023 14:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mac.shen@mediatek.com, stuart.lee@mediatek.com,
	Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v7 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
Message-ID: <202302141356.VMQ4kOvN-lkp@intel.com>
References: <20220919-v7-3-b5b58c5ccc07@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919-v7-3-b5b58c5ccc07@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_221703_509973_95D3AD9A 
X-CRM114-Status: GOOD (  10.50  )
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

Hi Guillaume,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 09e41676e35ab06e4bce8870ea3bf1f191c3cb90]

url:    https://github.com/intel-lab-lkp/linux/commits/Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230213-193958
base:   09e41676e35ab06e4bce8870ea3bf1f191c3cb90
patch link:    https://lore.kernel.org/r/20220919-v7-3-b5b58c5ccc07%40baylibre.com
patch subject: [PATCH v7 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230214/202302141356.VMQ4kOvN-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/94dbdd48a9476284394fe686b9d3f8d9277281db
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230213-193958
        git checkout 94dbdd48a9476284394fe686b9d3f8d9277281db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141356.VMQ4kOvN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `kernel_entry':
   (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x234): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x254): additional relocation overflows omitted from the output
   mips-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_pll_set_rate':
>> phy-mtk-hdmi-mt8195.c:(.text.mtk_hdmi_pll_set_rate+0x450): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

