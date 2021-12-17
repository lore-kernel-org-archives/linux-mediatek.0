Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A39C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEWkes5U51oiAr+kLx+lUydveklD+jkjZd1EW/LwvNs=; b=Zcn6GCSlqptzmw
	wVyMlyotNDPLKfJV6FVdCr9uhJrJunD2YTjB2Fv/r7UEaE/c/C4Orjv7g+S69x42iFMA3Dx7WPKQC
	0M+XO9s/uVZ7diAUJJjNs+LeURYq0EoC9FABntTHMEUGlT7dVS9pnmfOAOmd/9hTxYno4GXJ8DurW
	M69h5nXTw8xl1vxgD1k0b2TIvDc1fFMpycBlJwlKpD8B911ixLnvQmzxLiF3MDsgdWM+VRVmKFaGk
	bKiEoQ6Ges4g7wB6Gw2AfFTn6U+Y8YBwxFM8EifY3VOOApyWBHAicbWJ3fs0BSMKnMe4mFX70U9XO
	hlYhWburoDuIR1ar6Dkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myDtX-00AZNT-Hv; Fri, 17 Dec 2021 14:07:35 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myDtL-00AZM1-Bj; Fri, 17 Dec 2021 14:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639750043; x=1671286043;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1Tr3Rfy4DHDjc7WiTpOq+P1aPRKZ4mJe5JHJHgReMOE=;
 b=VaX0oPW7Z7lLMGFr7bsQw6flHdA7VFwHflFVH54oUVaSaG1h1RskjU0R
 HH3Ap3EU3LNHe03BpLJ2qKjNTv+QrIYsSTAbnNFejrDQWEDP/hlwWA3BM
 U4HA1gvDxL6/fHQPDrhFb51tq1gqkirHwzhwqXtkdixzdfI98xa4p5qGL
 b8HVeOWg7+pKyfHe45cuUV+Hvto53J1Qv2IR0YmR+loroTFVX/U48RZO0
 v/P8D8f6hqSRHhAIUt9s184rJuPLrGddIrEWWYqBjS8P/s+UgaslQ2fSK
 lX6FCgY1HGH+P5ZdSmzXP8xEdbZV1XM4AqrIIHIsxjo/Nc6bB9Zok1CTe g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239570582"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="239570582"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 06:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="466519954"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 17 Dec 2021 06:07:14 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1myDtB-0004nD-Ce; Fri, 17 Dec 2021 14:07:13 +0000
Date: Fri, 17 Dec 2021 22:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] isoc: mediatek: potential use of error pointer
Message-ID: <202112172128.4DTbSyzc-lkp@intel.com>
References: <20211217120845.628024-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217120845.628024-1-jiasheng@iscas.ac.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_060723_481781_4EA86419 
X-CRM114-Status: GOOD (  14.14  )
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

Hi Jiasheng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on broonie-spi/for-next linus/master mbgg-mediatek/for-next v5.16-rc5 next-20211216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiasheng-Jiang/isoc-mediatek-potential-use-of-error-pointer/20211217-201022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20211217/202112172128.4DTbSyzc-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1b5bac7d5052521b10c6c7ab2279cbd8c31cd458
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jiasheng-Jiang/isoc-mediatek-potential-use-of-error-pointer/20211217-201022
        git checkout 1b5bac7d5052521b10c6c7ab2279cbd8c31cd458
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash drivers/soc/mediatek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/soc/mediatek/mtk-scpsys.c: In function 'init_clks':
>> drivers/soc/mediatek/mtk-scpsys.c:421:32: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     421 |                         return ERR_PTR(-ENOMEM);
         |                                ^~~~~~~~~~~~~~~~


vim +421 drivers/soc/mediatek/mtk-scpsys.c

   413	
   414	static int init_clks(struct platform_device *pdev, struct clk **clk)
   415	{
   416		int i;
   417	
   418		for (i = CLK_NONE + 1; i < CLK_MAX; i++) {
   419			clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
   420			if (!clk[i])
 > 421				return ERR_PTR(-ENOMEM);
   422		}
   423		return 0;
   424	}
   425	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
