Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DBEC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 00:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77VcWK0lrmQvqbExYpl2P0h88IY5ng+l4taYew+D5XY=; b=hxsxyf4PMtlw6WflB86btpaAUf
	aLjTlRso6P1qEEuTATBC/zR2f3IJNOLcPjZBcsqdV/+gskz9CVh/ni6E0j/LUnoRdOGMAKsBbqIsw
	6ybWpdmr5YsEu1vqSwvBxv1jFSUJ2TpVfa5O4gSNoD5thqG/cn58Gsvq4B2Hbehpu98/2O4wCtR7V
	FzY3j90kzLalFrv1vcf0qQSJ5/noTI/vvW47b2T97IHKlQSqhqfNUK6r6UbK9QA9OajbY8D6g6fkj
	/EphS6Ei3wEYVUVaF+q6wXF7FA0GOOOcx/pUjlkF2EjA5WSRTWbb3dkyjJ9+aGFtP8nmFQ+5ZInZM
	+j9MZM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSRWY-000wnT-0Y;
	Wed, 24 Jan 2024 00:53:50 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSRWU-000wmz-2Y;
	Wed, 24 Jan 2024 00:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706057626; x=1737593626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yU9VsaBUrWtQtZ+GU86aDxwFo8ytu1/OKjeCrxQZZw8=;
  b=kiqvywg0QEgWWqu1p/pfXkyeu9eQlTZgE/h4TsOGozzNbFoHwJt4FuF+
   Gw6v/tXWnmluV6bErjs5axGyyTLFR+gN8oNJb4tawd6GKvp98y8tv2uor
   GBGvmr7opSmY99PMkjAKZwqa+kNpnC9GPhyOqqSJ08HTyw/Yf01Mef7Cf
   w9349wnp/Gaudjo8ArCSEqxKiC/LuKlW6bvuHSGBaGEJcSEb1SajYWEg0
   a+XsTBUD+TJ2D0fOtvmtAyCuNoTTMuJQgRfa6HbISVjPCuNjQMkgVa4CA
   ggDh9nNweujvcU0B3Ps3vv9Eg018yTqPS6VhEirN7l6yICBUm70gMjoAd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405454540"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="405454540"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 16:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929509990"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="929509990"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2024 16:53:40 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSRWM-0007lN-0F;
	Wed, 24 Jan 2024 00:53:38 +0000
Date: Wed, 24 Jan 2024 08:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ziyang Huang <hzyitc@outlook.com>, mcoquelin.stm32@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alexandre.torgue@foss.st.com, richardcochran@gmail.com,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: ipq5018-rdp432-c2: enable ethernet
 support
Message-ID: <202401240841.gfbyp3Lz-lkp@intel.com>
References: <TYZPR01MB5556D3E73D7F7242F810F915C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB5556D3E73D7F7242F810F915C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_165346_939158_1C327C46 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Ziyang,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on clk/clk-next pza/reset/next]
[cannot apply to linus/master pza/imx-drm/next v6.8-rc1 next-20240123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziyang-Huang/net-phy-Introduce-Qualcomm-IPQ5018-internal-PHY-driver/20240121-204840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/TYZPR01MB5556D3E73D7F7242F810F915C9762%40TYZPR01MB5556.apcprd01.prod.exchangelabs.com
patch subject: [PATCH 8/8] arm64: dts: qcom: ipq5018-rdp432-c2: enable ethernet support
config: arm64-randconfig-001-20240124 (https://download.01.org/0day-ci/archive/20240124/202401240841.gfbyp3Lz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401240841.gfbyp3Lz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240841.gfbyp3Lz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts:102.26-27 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

