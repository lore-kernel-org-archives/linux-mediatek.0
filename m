Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F14FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 10:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4Uf/08ijOsGiT19F553fGrsISHMFZ9aeksCIUtmr0g=; b=IEx9UQOy61g24l
	dbqYxOv8l3WmgTLNnpVXHZzj8JezY3k9Ick+TwuBdArzPNTzYECV3yzfttmQ21A62/V/JI16DswnQ
	litNWnriPsi0gb9i2W+RVzB4nIS+MzMraF0xbnyfkt/xs/trApx5lLmfXekMNND1abMEmLQ83au6o
	DqTpOdMQWoi+hC8NOIpEV+Y3zN6QDJxupI2rv3nx5+H1biny5SZxH02+9ZrALkqzmaGR+zeZ/WB7S
	ieM3ScufbiXoKOAi4S03T9sijHfhzeAPgt1olvIkH/vNPkKySmeMyqjnEIO4eN92so65H4g3oYKlq
	ycU/kcgfrvgpaMxONsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwhj2-002fDB-CE; Thu, 02 Jun 2022 10:06:44 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwhip-002f0V-9q; Thu, 02 Jun 2022 10:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654164391; x=1685700391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tpy1h6rxcXVO9xLL8s23Z2+kWlBjSZ7Dkplh6lZNrSI=;
  b=hhppczxs6cymdCmc1+HK690sr2xvAgCm1u6JPbqogtOC82YkagTzluIJ
   vM69juBhpqtSlOFJfYPTUV+fcXJGrEFjmeT7SCrXUzGK5+0kihbmbbC1q
   VZounqenTz9p/xKnTbcb6j/nAowz33z5gQ+d/XBczT/+z8FoFDLRbVmzt
   nFp4R6lglDxPmepI3ZTJ7rpjmqunbv4Cd1nluTprGQ+Ag2x+aNkfXgsZQ
   8n681m6/YNB9AC2FlwnoR47A3bwkBGtWu+P2sgjxpq4NV6tladw/PTtBl
   z5Vrac7UxBlRwIzXRhXvqXzYjfVJZpDfmZjvsQl7gdEJ4em3UpnuXLC90
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="255768777"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="255768777"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 03:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="582020563"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jun 2022 03:06:21 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwhie-0004xf-QH;
	Thu, 02 Jun 2022 10:06:20 +0000
Date: Thu, 2 Jun 2022 18:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
	daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: kbuild-all@lists.01.org, cy_huang@richtek.com, alice_chen@richtek.com,
	chiaen_wu@richtek.com, peterwu.pub@gmail.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [RESEND 13/14] leds: flashlight: mt6370: Add Mediatek MT6370
 flashlight support
Message-ID: <202206021739.LZjU7zjg-lkp@intel.com>
References: <20220531111900.19422-14-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220531111900.19422-14-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_030631_474206_B9F4268A 
X-CRM114-Status: GOOD (  14.45  )
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

Hi ChiaEn,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on pavel-leds/for-next]
[also build test WARNING on lee-mfd/for-mfd-next lee-backlight/for-backlight-next v5.18 next-20220602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/ChiaEn-Wu/Add-Mediatek-MT6370-PMIC-support/20220531-211432
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20220602/202206021739.LZjU7zjg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/805a8af17c769562ec4b85e9b7d2669d004fe3a6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review ChiaEn-Wu/Add-Mediatek-MT6370-PMIC-support/20220531-211432
        git checkout 805a8af17c769562ec4b85e9b7d2669d004fe3a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/gpu/drm/v3d/ drivers/leds/ sound/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/leds.h:12,
                    from include/linux/led-class-flash.h:11,
                    from drivers/leds/flash/leds-mt6370-flash.c:8:
   drivers/leds/flash/leds-mt6370-flash.c: In function 'mt6370_led_probe':
>> drivers/leds/flash/leds-mt6370-flash.c:591:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     591 |                 "No child node or node count over max led number %lu\n", count);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/leds/flash/leds-mt6370-flash.c:590:17: note: in expansion of macro 'dev_err'
     590 |                 dev_err(&pdev->dev,
         |                 ^~~~~~~
   drivers/leds/flash/leds-mt6370-flash.c:591:68: note: format string is defined here
     591 |                 "No child node or node count over max led number %lu\n", count);
         |                                                                  ~~^
         |                                                                    |
         |                                                                    long unsigned int
         |                                                                  %u


vim +591 drivers/leds/flash/leds-mt6370-flash.c

   580	
   581	static int mt6370_led_probe(struct platform_device *pdev)
   582	{
   583		struct mt6370_priv *priv;
   584		struct fwnode_handle *child;
   585		size_t count;
   586		int i = 0, ret;
   587	
   588		count = device_get_child_node_count(&pdev->dev);
   589		if (!count || count > MT6370_MAX_LEDS) {
   590			dev_err(&pdev->dev,
 > 591			"No child node or node count over max led number %lu\n", count);
   592			return -EINVAL;
   593		}
   594	
   595		priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds, count),
   596				    GFP_KERNEL);
   597		if (!priv)
   598			return -ENOMEM;
   599	
   600		priv->leds_count = count;
   601		priv->dev = &pdev->dev;
   602		mutex_init(&priv->lock);
   603	
   604		priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
   605		if (!priv->regmap) {
   606			dev_err(&pdev->dev, "Failed to get parent regmap\n");
   607			return -ENODEV;
   608		}
   609	
   610		device_for_each_child_node(&pdev->dev, child) {
   611			struct mt6370_led *led = priv->leds + i;
   612			struct led_init_data init_data = { .fwnode = child, };
   613	
   614			led->priv = priv;
   615			ret = mt6370_init_common_properties(led, &init_data);
   616			if (ret)
   617				goto out_flash_release;
   618	
   619			ret = mt6370_init_flash_properties(led, &init_data);
   620	
   621			if (ret)
   622				goto out_flash_release;
   623	
   624			ret = mt6370_led_register(&pdev->dev, led, &init_data);
   625			if (ret)
   626				goto out_flash_release;
   627	
   628			i++;
   629		}
   630	
   631		platform_set_drvdata(pdev, priv);
   632		return 0;
   633	
   634	out_flash_release:
   635		mt6370_v4l2_flash_release(priv);
   636		return ret;
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
