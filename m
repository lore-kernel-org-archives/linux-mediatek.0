Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779FAC636D6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EdGipcEG0Qp7mCrgP6VglMR+XSz58V1a6zqMth2AEc=; b=QzlKctVzYpP20TjJBLxqX1uluF
	f/iFo8tN3H83HkHAH41OZ76ZGXewC2b6GCofACd/eiM4YKdwhpTSrjBSpqrSLzWVjXus675MExZjQ
	fmZU//a/naY984DgGGlUeqaGxWgeG8XPPlKVqtHmuy2CS+GG3kFkafKZlGO8h8xDVqWQ0QOQr61PF
	WSNIcdmPXbbOaUmA9JXufvKXuIdRnXtb+Mxo2II6TMbyjbUh1FakNnhofMPW/BTGwWSwyLYEoszZu
	un3+AWWDYxycjNfznUyZNOwR5h/2AJQA2tYwZ5W//S8/bG1V8vjBq1lGlMXo8wCH16QcnGdnbu5vI
	X5ZDmWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPQc3-00Cmwc-Vo; Tue, 07 Feb 2023 16:14:31 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPQbt-00CmvA-V6; Tue, 07 Feb 2023 16:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675786461; x=1707322461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=piPvQsT8sg3M6OXkur43AQOlc9r+x7DRJBGS2pa/A0Q=;
  b=bQyEfPB6ifv0JaJe1i3Q9nYbj1lIwTjHg5WLdhWeWQWkRS0BNna8PMp9
   ijocPX7D+8KBsnSfVNkRpLy/Zum49Oavkf6mr8GcNbFhK2qKmvr21W/qZ
   BjL9Urj2T2BDr9O++E2Xm/N5sm5bkNCXpdU68x2njSGCZd1IVUfvXfji1
   7vSg+T6uom1bHBF2/QfPVq+zb1I/l5XHbQMX6GbR02HpNvuNLpBNwdt1b
   CbbVa5DedgQT/03AVYIhwDUhxxyx+xYXkV3PbJu6BrEVMsblkrHblFXzd
   6mlWM6oYU/ZayAWHPTDgfrwwNJkzqKpVdRbsuIDw5uDbDsgipF2VkBbGm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="309885593"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="309885593"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 08:14:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="699301774"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="699301774"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Feb 2023 08:14:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPQbh-0003gM-3A;
	Tue, 07 Feb 2023 16:14:09 +0000
Date: Wed, 8 Feb 2023 00:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: bchihi@baylibre.com, daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com, rafael@kernel.org,
	amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org, ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	khilman@baylibre.com, james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: Re: [PATCH v13 1/6] thermal: drivers: mediatek: Relocate driver to
 mediatek folder
Message-ID: <202302080018.wNeWiKqz-lkp@intel.com>
References: <20230207130958.608305-2-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207130958.608305-2-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_081422_026008_CAA02826 
X-CRM114-Status: GOOD (  12.01  )
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

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on a2c81dc59d41e92362ab7d41d0c15471ea50637d]

url:    https://github.com/intel-lab-lkp/linux/commits/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230207-211351
base:   a2c81dc59d41e92362ab7d41d0c15471ea50637d
patch link:    https://lore.kernel.org/r/20230207130958.608305-2-bchihi%40baylibre.com
patch subject: [PATCH v13 1/6] thermal: drivers: mediatek: Relocate driver to mediatek folder
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230208/202302080018.wNeWiKqz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0eb89997925c0d7b47bbeee93016146fc660b259
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230207-211351
        git checkout 0eb89997925c0d7b47bbeee93016146fc660b259
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/thermal/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/thermal/mediatek/auxadc_thermal.c:562: warning: expecting prototype for raw_to_mcelsius(). Prototype was for raw_to_mcelsius_v1() instead


vim +562 drivers/thermal/mediatek/auxadc_thermal.c

a4ffe6b52d27f4 drivers/thermal/mtk_thermal.c Michael Kao   2019-02-01  551  
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  552  /**
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  553   * raw_to_mcelsius - convert a raw ADC value to mcelsius
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  554   * @mt:	The thermal controller
3772bb422072d4 drivers/thermal/mtk_thermal.c Amit Kucheria 2019-11-20  555   * @sensno:	sensor number
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  556   * @raw:	raw ADC value
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  557   *
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  558   * This converts the raw ADC value to mcelsius using the SoC specific
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  559   * calibration constants
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  560   */
54bf1e5a629dfb drivers/thermal/mtk_thermal.c Henry Yen     2020-04-30  561  static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30 @562  {
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  563  	s32 tmp;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  564  
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  565  	raw &= 0xfff;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  566  
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  567  	tmp = 203450520 << 3;
f84514766985d3 drivers/thermal/mtk_thermal.c Michael Kao   2019-02-01  568  	tmp /= mt->conf->cali_val + mt->o_slope;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  569  	tmp /= 10000 + mt->adc_ge;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  570  	tmp *= raw - mt->vts[sensno] - 3350;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  571  	tmp >>= 3;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  572  
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  573  	return mt->degc_cali * 500 - tmp;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  574  }
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  575  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

