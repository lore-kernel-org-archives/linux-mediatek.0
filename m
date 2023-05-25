Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28020C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 01:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tD5P2XcT+ltjAGUVJSG5rGEuX0unaqFFQjkO1n4Di08=; b=J/mv5s4+DSYQMx0c9I4lyR4VXH
	RBHfp+BkJNEuUgqNQ8qNHCwwArfT3w1ru+094sGlsEgSBGbgxt4mSIigQRx14O4Hq5vOO5SLA8Ekb
	4GU68tx/VQtF/Vq8FqtvI0R3hUnFFnDgOkAvYf4tzNkAntrqPxFY1t9OJCJB/19npLC9GX5gwh6i0
	EfHj5fXRwyn8dhoy+Pd1e77j7zGQx2fMRXzDe3Ps9nZFyNIRlAse7xpCk8eIExWFmW4O08EdF+qKu
	f/VY/djOxxPLpaF1rKlfqGczJZNOQ82Ryb1ttlT+VZoE6iHuU9HNVCykEie/YuOGQb5F01MblG12c
	T2hp34Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1zik-00F9bz-3A;
	Thu, 25 May 2023 01:24:50 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1zig-00F9ax-3A;
	Thu, 25 May 2023 01:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684977886; x=1716513886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hFml+IFBGpyck4Ofg1pKOuGV669kPAVkwNRi7Imskrg=;
  b=GERwE8jZ7j5AyVbLO+k6Wna+LUChj0EU8+aHmDDUXggk7U3ScDiEfyxw
   GcuJ7sM+CuH60YZnDUT1mgXxI22iyp9+8PGAoIP5ChH3k67u60VuA16DK
   QU+iAB6ogWG73TDMr2V6nN0VH7/JlQ0f4IsX0nzpmzcehaVK9VW1ga8HK
   CLyIvzenG/OuddI8pmlcqK3ccts5e/zTjghLc8//AodW3sC5yDWvjER99
   Dp2SoeUVxMZ511azEPialJGJVzA/dGs+PxGfbIBCmZrY9/E8tUuUJ3NAu
   jvymS0U57F7wJS5SAt88Enlx+ddZ/9g6W7yJLI0hkUOmcfyLcFT4Zh0Wf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343208098"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="343208098"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 18:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="769672043"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="769672043"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 May 2023 18:24:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1ziO-000FLD-0t;
	Thu, 25 May 2023 01:24:28 +0000
Date: Thu, 25 May 2023 09:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Runyang Chen <runyang.chen@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Runyang Chen <runyang.chen@mediatek.com>
Subject: Re: [PATCH v3 2/2] clk: mediatek: reset: add infra_ao reset support
 for MT8188
Message-ID: <202305250908.Uvas9u4E-lkp@intel.com>
References: <20230524133439.20659-3-runyang.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524133439.20659-3-runyang.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_182447_085510_7A523595 
X-CRM114-Status: GOOD (  14.97  )
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

Hi Runyang,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on pza/reset/next]
[cannot apply to pza/imx-drm/next mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Runyang-Chen/dt-bindings-reset-mt8188-add-thermal-reset-control-bit/20230524-213538
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230524133439.20659-3-runyang.chen%40mediatek.com
patch subject: [PATCH v3 2/2] clk: mediatek: reset: add infra_ao reset support for MT8188
config: riscv-randconfig-r042-20230524 (https://download.01.org/0day-ci/archive/20230525/202305250908.Uvas9u4E-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7d969d160489d561f9b1fb6388adaa1ba8fe06a1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Runyang-Chen/dt-bindings-reset-mt8188-add-thermal-reset-control-bit/20230524-213538
        git checkout 7d969d160489d561f9b1fb6388adaa1ba8fe06a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305250908.Uvas9u4E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/mediatek/clk-mt8188-infra_ao.c:196:18: error: initializing 'u16 *' (aka 'unsigned short *') with an expression of type 'const u16[5]' (aka 'const unsigned short[5]') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .rst_bank_ofs = infra_ao_rst_ofs,
                           ^~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8188-infra_ao.c:198:17: error: initializing 'u16 *' (aka 'unsigned short *') with an expression of type 'const u16[3]' (aka 'const unsigned short[3]') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .rst_idx_map = infra_ao_idx_map,
                          ^~~~~~~~~~~~~~~~
   2 errors generated.


vim +196 drivers/clk/mediatek/clk-mt8188-infra_ao.c

   193	
   194	static const struct mtk_clk_rst_desc infra_ao_rst_desc = {
   195		.version = MTK_RST_SET_CLR,
 > 196		.rst_bank_ofs = infra_ao_rst_ofs,
   197		.rst_bank_nr = ARRAY_SIZE(infra_ao_rst_ofs),
   198		.rst_idx_map = infra_ao_idx_map,
   199		.rst_idx_map_nr = ARRAY_SIZE(infra_ao_idx_map),
   200	};
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

