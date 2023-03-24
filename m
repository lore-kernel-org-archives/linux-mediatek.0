Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FE2C6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 16:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTW1c1/smVDQUVSHmVRBvkva9xau/+0SDaiKBflkSJc=; b=IwkDtCwSJGDgNncyvBla/Jkofs
	vm+Lowe5pcACBwT+7v+OoNp87hpiztMg5ZSXIO/uyIqgPEOIdTqyWLCymnx7B+4MHcs1U3Rd7Ul/M
	Z73ebFhA1eNaqcMNo1GB9vFcYL6C8PVBIMU9dQ2DFFmoF5mrpfTMQ/nY/FPC5QywR0VjrCj6Kyh75
	/aJr6WqYijKzhJDf0aGaVNaJH+Ntby39u7EfcgmGe3dZKfDi+1jaOLTOZdNryjwqQw9KhrBvnwwzG
	mZQjKP0MQVDkXAmgo3VCXvz1J22ewoQl5u86T+kqs2QIjdQluArqASccHXrI0v7AJ0P3+ThSizOsB
	J69kFFYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfk3j-004xi8-28;
	Fri, 24 Mar 2023 16:14:31 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfk3g-004xhO-0J;
	Fri, 24 Mar 2023 16:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679674468; x=1711210468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hvr/IAw6GwHmF6Ka+HdBXFuG4UC3HNZI/3j9kHSlW6I=;
  b=Yh5TiIEY0QueTxznRKJRMdTLQPcLZ1jWjaPG71+R+WOLZgXkbBvGTlhi
   NabT34wfWFftKk6tK6gKarP5wtcPi7K8kqvs/Fk8fGqNkYJwBy3J6PVQi
   g6E/bAcUJtKSPaDIcWxtX5LEusnHYp4TsOiSnRq+ss5mpCYwH3xvWyM1Q
   qKpVNgfpTQAvFpdH+OVv2xGe2tiumx2V+HMvTsRnQA8PB6blRQ2L16wLO
   Jyt7bTXqVWn6nk0VyIvLqXMX0NIHoUQrQlBQ/T+5FlhFQYM5INFUDjuoD
   7X113xHd325fUazZToT5TBv2Naqb4xv0UPNMyUNFNS6tPnHfTVswafbgD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328239376"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="328239376"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 09:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="676199945"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="676199945"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2023 09:14:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfk3a-000FS4-1E;
	Fri, 24 Mar 2023 16:14:22 +0000
Date: Sat, 25 Mar 2023 00:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: ChiaEn Wu <chiaen_wu@richtek.com>, jic23@kernel.org, lars@metafoo.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, peterwu.pub@gmail.com,
	cy_huang@richtek.com, ChiaEn Wu <chiaen_wu@richtek.com>
Subject: Re: [PATCH] iio: adc: mt6370: Fix ibus and ibat scaling value of
 some specific vendor ID chips
Message-ID: <202303250050.V7JLIADZ-lkp@intel.com>
References: <1679667167-16261-1-git-send-email-chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679667167-16261-1-git-send-email-chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_091428_200377_96AB5651 
X-CRM114-Status: GOOD (  14.81  )
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

Hi ChiaEn,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.3-rc3 next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ChiaEn-Wu/iio-adc-mt6370-Fix-ibus-and-ibat-scaling-value-of-some-specific-vendor-ID-chips/20230324-221545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/1679667167-16261-1-git-send-email-chiaen_wu%40richtek.com
patch subject: [PATCH] iio: adc: mt6370: Fix ibus and ibat scaling value of some specific vendor ID chips
config: riscv-randconfig-r034-20230324 (https://download.01.org/0day-ci/archive/20230325/202303250050.V7JLIADZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/9822359d5de2dba531d882cfee6949864a2d6170
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review ChiaEn-Wu/iio-adc-mt6370-Fix-ibus-and-ibat-scaling-value-of-some-specific-vendor-ID-chips/20230324-221545
        git checkout 9822359d5de2dba531d882cfee6949864a2d6170
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/iio/adc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250050.V7JLIADZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/mt6370-adc.c:306:31: warning: variable 'priv' is uninitialized when used here [-Wuninitialized]
           ret = mt6370_get_vendor_info(priv);
                                        ^~~~
   drivers/iio/adc/mt6370-adc.c:297:30: note: initialize the variable 'priv' to silence this warning
           struct mt6370_adc_data *priv;
                                       ^
                                        = NULL
   1 warning generated.


vim +/priv +306 drivers/iio/adc/mt6370-adc.c

   293	
   294	static int mt6370_adc_probe(struct platform_device *pdev)
   295	{
   296		struct device *dev = &pdev->dev;
   297		struct mt6370_adc_data *priv;
   298		struct iio_dev *indio_dev;
   299		struct regmap *regmap;
   300		int ret;
   301	
   302		regmap = dev_get_regmap(pdev->dev.parent, NULL);
   303		if (!regmap)
   304			return dev_err_probe(dev, -ENODEV, "Failed to get regmap\n");
   305	
 > 306		ret = mt6370_get_vendor_info(priv);
   307		if (ret)
   308			return dev_err_probe(dev, ret, "Failed to get vid\n");
   309	
   310		indio_dev = devm_iio_device_alloc(dev, sizeof(*priv));
   311		if (!indio_dev)
   312			return -ENOMEM;
   313	
   314		priv = iio_priv(indio_dev);
   315		priv->dev = dev;
   316		priv->regmap = regmap;
   317		mutex_init(&priv->adc_lock);
   318	
   319		ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, 0);
   320		if (ret)
   321			return dev_err_probe(dev, ret, "Failed to reset ADC\n");
   322	
   323		indio_dev->name = "mt6370-adc";
   324		indio_dev->info = &mt6370_adc_iio_info;
   325		indio_dev->modes = INDIO_DIRECT_MODE;
   326		indio_dev->channels = mt6370_adc_channels;
   327		indio_dev->num_channels = ARRAY_SIZE(mt6370_adc_channels);
   328	
   329		return devm_iio_device_register(dev, indio_dev);
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

