Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F8CC32774
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 02:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KcDcMgUIKjnQamTeV7faHzo4/GRgdb01f938wC0FF0=; b=wswnPOAwDN/K1tWy6dRTpNFMn/
	vq8PhI/6RuD8InqmeiOxZtBJQn16AqfZtuzltSPYtzo3MXks1LyrfFMegRjCri/RrXFR+JAQEaBvH
	3aI4tD6hgiK/Ytjuz6uzE+Nh2YRXH0nPCuCWU+NAvG3PdDwVp8RLZRodQ0gmoRcJamI3nx5odsOGG
	bb8WgDAPj0KayNwW+9Z1c/ntLzpu/uX5swE5oWuijK98JjVishY40Kov2wJHdcrNm7Vt40p6DREna
	NHS1ObO1lhQLJeQ1iuZ+R+rwGDJGJHISyycnfPFdNQYGjqRvn8Wg9ncxtNzkfc2+ZCBeBx3YzaxxR
	gz7H+S6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgaD-00A5Iv-R4; Wed, 24 Aug 2022 02:57:33 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQga3-00A5Fn-8U; Wed, 24 Aug 2022 02:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661309843; x=1692845843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jy6uHgqMUfjwvrFCqsckoPadRCKuYpnXSLFD6tiP3I0=;
  b=AucP2gloKzfMmG1Y5OHjg8I12v9uJ14BH0oEXZgvCSOtPKnTuRkNJ+bD
   f2o/7yzWXRQHDnDornxYf+PiPxOyRSYL13PeAc7ZExZkZVPkM1ClcNva3
   x06Lr5n1HrkTIMzgUGa5ZpE6HynwLjrNN59hwj0dWxWXpZa7rUXIL5w96
   dEVZI9AU1kNbYcjAJuuVQxHJHtkvVlvapXynnBRwUKqhVo5tbHgpMLgNy
   x+JKXj6V3Xr3PzG+2w2+DOzabLAiHfvqgc94ho8Ga2tyw4GG/TkbRAPVp
   GUjDYS1s7J2saaDPh5I5GOTRUpLvSO1RNReF7MLnxe8oakoOYgfBV9rDG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="293851754"
X-IronPort-AV: E=Sophos;i="5.93,259,1654585200"; 
   d="scan'208";a="293851754"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 19:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,259,1654585200"; 
   d="scan'208";a="937723909"
Received: from lkp-server02.sh.intel.com (HELO 9bbcefcddf9f) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 23 Aug 2022 19:57:15 -0700
Received: from kbuild by 9bbcefcddf9f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQgZv-0000tf-0o;
	Wed, 24 Aug 2022 02:57:15 +0000
Date: Wed, 24 Aug 2022 10:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v4 4/4] clk: mediatek: add driver for MT8365 SoC
Message-ID: <202208241051.Xi9D8DaW-lkp@intel.com>
References: <20220822152652.3499972-5-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822152652.3499972-5-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_195723_332964_D74FDAF0 
X-CRM114-Status: GOOD (  11.92  )
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

Hi Markus,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next linus/master v6.0-rc2 next-20220823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/clk-mediatek-Add-mt8365-support/20220822-233030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20220824/202208241051.Xi9D8DaW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/51c1bac1ab0d284ab6c444966eee437c23095a85
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Markus-Schneider-Pargmann/clk-mediatek-Add-mt8365-support/20220822-233030
        git checkout 51c1bac1ab0d284ab6c444966eee437c23095a85
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mtk_clk_register_gates_with_dev" [drivers/clk/mediatek/clk-mt8365-mm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

