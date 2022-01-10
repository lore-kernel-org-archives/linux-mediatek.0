Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQPHXFyKStlvKXxVEZiIAck/LUQZ11TeL4YQLRLoMIM=; b=hbKHjJiG0lX/Eh
	okXiyqgsf9+BNXq5nbfc0zs4P9Q87q1S6YXsdnvtG0mfre3oR3/VE4M04lnE9SkEgLeFusOVpCDFU
	wTNDJqw6uVY7Ca0K6v8Wcix7xYZkvKVTPBRAXZu4Dw2MfGT/11yQQSMSHozIKk3TM4gIeeozotCGU
	3BJtuyIPDWfBfwB4/r9Z6HB/oJ7WekujHDK4Z/cku48AhpBcde3G712vpwJz35Zc0LK9iekn3sShv
	CJPEEmnB/YLA1mvNj9qaYzCtzJwLtBPclzBsFZAbp0bDg13tqE6Itvcq0Qn+bOO4DCNNzLq3hopkX
	NrZ94T8I2M+na6TNXGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6zaj-00Cobe-7H; Mon, 10 Jan 2022 18:40:25 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6zaX-00CoYx-9o; Mon, 10 Jan 2022 18:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641840013; x=1673376013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U+Glj/h5tYRthQXKeKVdr/rRhv+kw5dVVIG5/MTuWRQ=;
 b=BWzqYv+/Gx/9ySS1uKc7g105Qhg0GhGlDz8hOnH1FL56dMNsmA//bdRF
 f/XH7y4XcHBcAoRYZljiZ0yAviW1EHT39Q0VYX1rPmI7UiKYQeiPqt3U7
 Kq0oBMPn82oskIXq1rZJMWtiYmHw5MwSvH77BbETMNV2Ux61fd2mjQC3h
 6qFRMCKHZPh7CWbn+ny7B4Za/GyQ9YmScuv6BcCfehorTnYMVBJz0pnMv
 SoI3mombkGss6ruyBfPRvJweQwn3Ivd+XSW8UbiidokiZ/lvQt0Y9YR3J
 InchGmmkUVbofzEhJYVfH24zfsVwqtaL3AIhnUwhDfi2CZOuGH3QS3T3e w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="223277347"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="223277347"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 10:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="690672972"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2022 10:40:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n6zaS-0003px-HT; Mon, 10 Jan 2022 18:40:08 +0000
Date: Tue, 11 Jan 2022 02:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com
Subject: Re: [v1 03/16] clk: mediatek: Add MT8186 mcusys clock support
Message-ID: <202201110231.DNu9pn4H-lkp@intel.com>
References: <20220110134416.5191-4-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110134416.5191-4-chun-jie.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_104013_389850_9646B58C 
X-CRM114-Status: GOOD (  15.17  )
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
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20220111/202201110231.DNu9pn4H-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d28b64e80990fd336192ccdd31676120bf4e2696
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Chun-Jie-Chen/dt-bindings-ARM-Mediatek-Add-new-document-bindings-of-MT8186-clock/20220110-224451
        git checkout d28b64e80990fd336192ccdd31676120bf4e2696
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/clk/mediatek/clk-mt8186-mcu.c: In function 'clk_mt8186_mcu_probe':
>> drivers/clk/mediatek/clk-mt8186-mcu.c:74:9: error: implicit declaration of function 'mtk_clk_unregister'; did you mean 'devm_clk_unregister'? [-Werror=implicit-function-declaration]
      74 |         mtk_clk_unregister(clk_data);
         |         ^~~~~~~~~~~~~~~~~~
         |         devm_clk_unregister
   cc1: some warnings being treated as errors


vim +74 drivers/clk/mediatek/clk-mt8186-mcu.c

    48	
    49	static int clk_mt8186_mcu_probe(struct platform_device *pdev)
    50	{
    51		struct clk_onecell_data *clk_data;
    52		struct device_node *node = pdev->dev.of_node;
    53		int r;
    54		void __iomem *base;
    55	
    56		base = devm_platform_ioremap_resource(pdev, 0);
    57		if (IS_ERR(base))
    58			return PTR_ERR(base);
    59	
    60		clk_data = mtk_alloc_clk_data(CLK_MCU_NR_CLK);
    61		if (!clk_data)
    62			return -ENOMEM;
    63	
    64		mtk_clk_register_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), base,
    65					    &mt8186_clk_lock, clk_data);
    66	
    67		r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
    68		if (r)
    69			goto unregister_clk;
    70	
    71		return r;
    72	
    73	unregister_clk:
  > 74		mtk_clk_unregister(clk_data);
    75		mtk_free_clk_data(clk_data);
    76		return r;
    77	}
    78	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
