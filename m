Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEAEC6FA83
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 01:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+UMpemreMBNflavNkgTIhXZq/0Vm0z5kkfVV7t4t0A=; b=aGAz5PT5vjvuqLaVbClClZPkwJ
	7+l8ybvmAoXqWcxGzAYvodG51pl6G+M7u1KJpFD3Ay+opEnmw9IkRsA3CfAhzppZZVb23KPOO6qrO
	gCr4un2SczoTkH1h34mbnvKxSjFF5ijyiI2QkIC5Jakygzn3b9dK+Pvg76JCu0An2KfqPO3T3ZNg0
	cMxkSTjzM+Ax2Xtiaw55C213/dl60aIneCf4rqwGs6rYMyWuwOwgEcS1dg6xLCmYwNFZAG3xAxKB9
	I9XLXgMqcSqGgCYvPi0qWloUDMDE3FuB+iywWMdsiDeyuN1/uUg8Wr6K2vzQkrziy/jE6KbN7YOv4
	YtsDT1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXuRr-00GzRF-Gh; Tue, 13 Sep 2022 01:10:47 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXuRp-00GzNG-6C
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 01:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663031445; x=1694567445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IBMJmz447i1H4VhdQmfyA8wQOBBhYHA3uOT0vcuYxlg=;
  b=iz8BIuL8SuhmN2FyCgWkck9a327JxdYrRTka16ovloXNj8xTx2oi88yC
   Zih73HU0QGUYBTLrlCnWNn7wLZO8FUVnIm7PmR0cfWSzDEvDzqAb8UCmS
   X2cyHfFJ02dzznM/INdU9vLzcffi5C07XFRHLfoNvyl/uSTsMDXhXL/XF
   ZKn4OQJXV2bQVnNR0lUYQebhLsy/87YJChdsilisqr5FXqw6x+ggC74L5
   ZT2LlubBMC51ynihaPNUOPhWvL+TR+R5+igWoFH2QSRn1leR07pnoP6dm
   O8/jFPMyV8eeriGIXSXXDvZwXZ67Q8NICAv4U7WSrSM5aFH8QEkiJ2V5W
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="278400974"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="278400974"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 18:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="684655572"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2022 18:10:38 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oXuRh-00033D-2t;
	Tue, 13 Sep 2022 01:10:37 +0000
Date: Tue, 13 Sep 2022 09:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: kbuild-all@lists.01.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next 08/12] net: ethernet: mtk_eth_soc: add foe info
 in mtk_soc_data structure
Message-ID: <202209130841.kze95Xi6-lkp@intel.com>
References: <0d0bfa99e313c0b00bf75f943f58b6fe552ed004.1662661555.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d0bfa99e313c0b00bf75f943f58b6fe552ed004.1662661555.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_181045_271887_7778B609 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

Hi Lorenzo,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/Add-WED-support-for-MT7986-chipset/20220909-033910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 9f8f1933dce555d3c246f447f54fca8de8889da9
config: arm-randconfig-r005-20220911 (https://download.01.org/0day-ci/archive/20220913/202209130841.kze95Xi6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8500175ee61539b6c5cb7acb854ce592e78cf639
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lorenzo-Bianconi/Add-WED-support-for-MT7986-chipset/20220909-033910
        git checkout 8500175ee61539b6c5cb7acb854ce592e78cf639
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__ffsdi2" [drivers/net/ethernet/mediatek/mtk_eth.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

