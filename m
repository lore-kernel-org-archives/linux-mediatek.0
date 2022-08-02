Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE35C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 23:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LM2cQdNOMzX7BDYlVTWw45jJzgdLEG6baAHQDmuh21U=; b=m3jaHSE3H+fcGl+tDkyuAfWHTQ
	2J4r2dQdtlkJbdB2+3VCbwy5vsy/V1y7u2UtmV1wSPiQW+jZs2dZZ0mbtzsdYyQ37hfl06ryU5rDD
	gJ2EIBuFl1/fx09u+UlEQUG648YIaS+IF2aixV1HVsNb0I1g37axTVNADXjd32XSLnX+CXmu4Lg10
	xm77xTmBG3iDA8KbeH5dQ5jT8Iy6M71QKd7ATVdAnH8Ud8s7gSTqCnns2PnKXU8CkkPucl1zvWgGS
	qIMT8UkTVSmdEEur9fPeaJ0WpP00CrQPnnrQCfmz3VYxVDHCl342WADrgphfysnofTnNioSj9Zheu
	6zUt4DOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ1On-000g88-8q; Tue, 02 Aug 2022 23:34:05 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ1OS-000g2k-OK; Tue, 02 Aug 2022 23:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659483224; x=1691019224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ysW0jTY890mIETWgTv4B/Bx63n85mFzK50xuBsHJav8=;
  b=f6Z7d1b2Jc+wK94YDTayD60QAMVH1tvJe155NE6ACphckfaTFz0ZqCGu
   kWfefIY+uyxYDvdix1S181fSzHVTUFpN5fvCRiQHwVjlNYRZvwWIEIhyD
   dIkDSXKg2cHd0l2+eNXraSlqLPlgmA039eowpX+15M+QQXK5/5vZls8g7
   iMqtQxGINxurI2iXaDz4mc5hox7Aw6ZR+6YzNIAzOvA3MTqT4h2YiCs6c
   vUvoT2tUPNE4Yl1d52OO823PSPqJrXhm1CsarCFziIi4NxawKHZD29UgM
   H3aja9EnECl3fvvxQqXle9m4Y6l9MScgI38bu6t+oPao4hZv49cvTd0ox
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="288297831"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="288297831"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 16:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="670638968"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2022 16:33:38 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJ1OL-000GYl-2o;
	Tue, 02 Aug 2022 23:33:37 +0000
Date: Wed, 3 Aug 2022 07:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 1/1] leds: mt6360: Get rid of custom
 led_init_default_state_get()
Message-ID: <202208030736.6ZT2jOdB-lkp@intel.com>
References: <20220802212532.7091-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802212532.7091-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_163344_964905_866B61B4 
X-CRM114-Status: GOOD (  15.48  )
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

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on pavel-leds/for-next]
[also build test ERROR on linus/master v5.19 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/leds-mt6360-Get-rid-of-custom-led_init_default_state_get/20220803-052854
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: hexagon-randconfig-r045-20220802 (https://download.01.org/0day-ci/archive/20220803/202208030736.6ZT2jOdB-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/260d7c20cbd2b5da92dfa5ffa7c73499661c838f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/leds-mt6360-Get-rid-of-custom-led_init_default_state_get/20220803-052854
        git checkout 260d7c20cbd2b5da92dfa5ffa7c73499661c838f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/leds/flash/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/leds/flash/leds-mt6360.c:832:24: error: call to undeclared function 'led_init_default_state_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   led->default_state = led_init_default_state_get(child);
                                        ^
   1 error generated.


vim +/led_init_default_state_get +832 drivers/leds/flash/leds-mt6360.c

   770	
   771	static int mt6360_led_probe(struct platform_device *pdev)
   772	{
   773		struct mt6360_priv *priv;
   774		struct fwnode_handle *child;
   775		size_t count;
   776		int i = 0, ret;
   777	
   778		count = device_get_child_node_count(&pdev->dev);
   779		if (!count || count > MT6360_MAX_LEDS) {
   780			dev_err(&pdev->dev,
   781				"No child node or node count over max led number %zu\n",
   782				count);
   783			return -EINVAL;
   784		}
   785	
   786		priv = devm_kzalloc(&pdev->dev,
   787				    struct_size(priv, leds, count), GFP_KERNEL);
   788		if (!priv)
   789			return -ENOMEM;
   790	
   791		priv->leds_count = count;
   792		priv->dev = &pdev->dev;
   793		mutex_init(&priv->lock);
   794	
   795		priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
   796		if (!priv->regmap) {
   797			dev_err(&pdev->dev, "Failed to get parent regmap\n");
   798			return -ENODEV;
   799		}
   800	
   801		device_for_each_child_node(&pdev->dev, child) {
   802			struct mt6360_led *led = priv->leds + i;
   803			struct led_init_data init_data = { .fwnode = child, };
   804			u32 reg, led_color;
   805	
   806			ret = fwnode_property_read_u32(child, "color", &led_color);
   807			if (ret)
   808				goto out_flash_release;
   809	
   810			if (led_color == LED_COLOR_ID_RGB ||
   811			    led_color == LED_COLOR_ID_MULTI)
   812				reg = MT6360_VIRTUAL_MULTICOLOR;
   813			else {
   814				ret = fwnode_property_read_u32(child, "reg", &reg);
   815				if (ret)
   816					goto out_flash_release;
   817	
   818				if (reg >= MT6360_MAX_LEDS) {
   819					ret = -EINVAL;
   820					goto out_flash_release;
   821				}
   822			}
   823	
   824			if (priv->leds_active & BIT(reg)) {
   825				ret = -EINVAL;
   826				goto out_flash_release;
   827			}
   828			priv->leds_active |= BIT(reg);
   829	
   830			led->led_no = reg;
   831			led->priv = priv;
 > 832			led->default_state = led_init_default_state_get(child);
   833	
   834			if (reg == MT6360_VIRTUAL_MULTICOLOR ||
   835			    reg <= MT6360_LED_ISNKML)
   836				ret = mt6360_init_isnk_properties(led, &init_data);
   837			else
   838				ret = mt6360_init_flash_properties(led, &init_data);
   839	
   840			if (ret)
   841				goto out_flash_release;
   842	
   843			ret = mt6360_led_register(&pdev->dev, led, &init_data);
   844			if (ret)
   845				goto out_flash_release;
   846	
   847			i++;
   848		}
   849	
   850		platform_set_drvdata(pdev, priv);
   851		return 0;
   852	
   853	out_flash_release:
   854		mt6360_v4l2_flash_release(priv);
   855		return ret;
   856	}
   857	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

