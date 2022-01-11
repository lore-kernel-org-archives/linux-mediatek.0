Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FAEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 00:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xClyjS9U/WaMx0R7Y235Yd7uudbNt09CG01ekBkdcIQ=; b=a8QXY+FebmZUaP
	zrHpeIZB+kZXoaZrGcU1694zCwNp6d5GRNSBl3j8eyOLle9tZKlimf6OBwqrDR0+ARwZRY0aEgW54
	ePHyq3svuFp7Cz/GeIx3qw5YyXPqpv9wJ+mYMj1XKDb/GMF5Z3RaKYNAgGVS9I1+9ZY1yhVRGqOyU
	6ZLMOaUhClCWVCwxR/ZjO+LywqYoGqg1odhsd8kU4UnWduuM1cM2rCOe+ULVOZPNblUUptc+HYmaC
	NTfIYc1SetmN4DMLfCwVAPizFlPQcTSGmEamzzNj7YAL+Ls0rVn44hIIdq0sT14XI3Mw6n3pLO1bi
	XwiMgnUuGHAVm1dXheyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n74gK-00E2zk-MS; Tue, 11 Jan 2022 00:06:32 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n74g8-00E2x7-CA; Tue, 11 Jan 2022 00:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641859580; x=1673395580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p7nsmEccBKpPlOWZFEkdVoJGgRfuwq0AFf2KH3+X540=;
 b=Jercf1yjNQ2wIbNKGIi1AjasbbGPxx/p6ONmjmcONFf/qgL5q5l6oAV1
 cEb3ZqPlARd1Iv8q+whjPWUoAkTX4wbPTnUXPIhOHqpy5H9Fba22qe4wJ
 ZTmqzL6/gFgC2d47GHd7VSDCtc5FKybx8rPjTIBefSDQPk80K9+h1GZqr
 NU9DS1YdvwJaKn5RWHu6E770M32E6vuBWw3fJH3t+gHEn0OnOdxHtG2Km
 wDE1cY8MfUCdtROUm61ewSUNWysDXmMWvVQvYdWn5ruptyjZhgvHD5BNv
 LHGEwqr8rbr7ypN8NzISIeHDqgkALSdyy90WUTBNGauh+yW8KmB5bAx4E Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="329707023"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="329707023"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 16:06:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="622863838"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 10 Jan 2022 16:06:16 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n74g3-00045s-Jr; Tue, 11 Jan 2022 00:06:15 +0000
Date: Tue, 11 Jan 2022 08:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com
Subject: Re: [v1 06/16] clk: mediatek: Add MT8186 apmixedsys clock support
Message-ID: <202201110701.jdDbg8yY-lkp@intel.com>
References: <20220110134416.5191-7-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110134416.5191-7-chun-jie.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_160620_457754_3B24CD55 
X-CRM114-Status: GOOD (  14.83  )
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

Hi Chun-Jie,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next v5.16 next-20220110]
[cannot apply to mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Chun-Jie-Chen/dt-bindings-ARM-Mediatek-Add-new-document-bindings-of-MT8186-clock/20220110-224451
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20220111/202201110701.jdDbg8yY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2b9fcab7333544a52a4e5fd9e42764e1f1e7a7b1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Chun-Jie-Chen/dt-bindings-ARM-Mediatek-Add-new-document-bindings-of-MT8186-clock/20220110-224451
        git checkout 2b9fcab7333544a52a4e5fd9e42764e1f1e7a7b1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/clk/mediatek/clk-mt8186-apmixedsys.c: In function 'clk_mt8186_apmixed_probe':
>> drivers/clk/mediatek/clk-mt8186-apmixedsys.c:102:9: error: implicit declaration of function 'mtk_clk_unregister'; did you mean 'devm_clk_unregister'? [-Werror=implicit-function-declaration]
     102 |         mtk_clk_unregister(clk_data);
         |         ^~~~~~~~~~~~~~~~~~
         |         devm_clk_unregister
   cc1: some warnings being treated as errors


vim +102 drivers/clk/mediatek/clk-mt8186-apmixedsys.c

    82	
    83	static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
    84	{
    85		struct clk_onecell_data *clk_data;
    86		struct device_node *node = pdev->dev.of_node;
    87		int r;
    88	
    89		clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
    90		if (!clk_data)
    91			return -ENOMEM;
    92	
    93		mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
    94	
    95		r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
    96		if (r)
    97			goto unregister_clk;
    98	
    99		return r;
   100	
   101	unregister_clk:
 > 102		mtk_clk_unregister(clk_data);
   103		mtk_free_clk_data(clk_data);
   104		return r;
   105	}
   106	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
