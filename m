Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBADC61D9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 03:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWe9YqdXllMql//cvXvVVsv133m7orn9E3kmd5tO+4M=; b=woZCK1Q/8z69xyGBeu6TA80XE6
	rf2vuaxTxqRhXiXD5rnmzxq3MeIbwY6bcLiqsi7kDJjCvny66Cbfzl3oyVZ1+oSu4q8vq0gEhJXuF
	OsqdazAbyPOb94PZfbCfDG0FV4wYkhN55VOwNeNNukfzJfU53wSn6IAIvIq78FugkIlpDJu+lh/kR
	Zmf/W7cK70XAUFCVCAZxJI4lQaMJG3ht1pvYd2TJC5LNBHZIdCoEI3fLUDHb0wota3BwnuLjWIjt+
	l7DgPE4/XHSrYY/NIPIt1zlsrOIrwwJqkOU0WlJiVvD/o6ptXtlg5BFIWoGUBWvtqFd+uI2yNm1+I
	WzUiWT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r608o-003e0c-0e;
	Thu, 23 Nov 2023 03:12:34 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r608f-003dxW-1l;
	Thu, 23 Nov 2023 03:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709145; x=1732245145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YK+QY6r4HYFA8JXtUB/EwU57HdbWk25Z4Y1AtkcDu58=;
  b=BoIQVdvnE2dzIJ95lfQHVOhPLqfxpUDe4FkitDpVVjn9bK+OouiEUHj8
   pIQLgp0ut5yNpuj+wjEgVYoPIlZ18i+boCLqyoc+lMNNfW2KeGwvdzO73
   AfQd7k4Bjp16kArVgM6y+PfMk7ng499Ipk+CvTNo5qg79Q+8qkEj5ddQH
   peIvZnN4haSI1eCLcZSSf0/nV8Jsg8jrcn+J3KHTMo1DincgKpVxciQpT
   3p/JBv9oCLkKaVof8gsCOYyQ91RQGyA0W1n4E6uESLwHZVYy7IRZrPJGW
   7Yqi/LiiCQudcKrcJpeGWBpNlI+OCg+dT5830i6JxmTdS2T8CcL1eLH+8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458685589"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="458685589"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="716933915"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="716933915"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Nov 2023 19:12:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r608P-00019u-2S;
	Thu, 23 Nov 2023 03:12:09 +0000
Date: Thu, 23 Nov 2023 11:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v1 08/17] pinctrl: core: Embed struct pingroup into
 struct group_desc
Message-ID: <202311230849.YPJuLoNP-lkp@intel.com>
References: <20231122164040.2262742-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122164040.2262742-9-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_191225_625604_CDA4AC46 
X-CRM114-Status: GOOD (  13.74  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next next-20231122]
[cannot apply to geert-renesas-drivers/renesas-pinctrl pinctrl-samsung/for-next linus/master v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-equilibrium-Convert-to-use-struct-pingroup/20231123-005932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20231122164040.2262742-9-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 08/17] pinctrl: core: Embed struct pingroup into struct group_desc
config: i386-buildonly-randconfig-004-20231123 (https://download.01.org/0day-ci/archive/20231123/202311230849.YPJuLoNP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230849.YPJuLoNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230849.YPJuLoNP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
                    from drivers/pinctrl/mediatek/pinctrl-mt7981.c:9:
>> drivers/pinctrl/mediatek/../core.h:217:21: error: initializer element is not constant
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7981.c:795:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
     795 |         PINCTRL_PIN_GROUP("wa_aice1", mt7981_wa_aice1),
         |         ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/../core.h:217:21: note: (near initialization for 'mt7981_groups')
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7981.c:795:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
     795 |         PINCTRL_PIN_GROUP("wa_aice1", mt7981_wa_aice1),
         |         ^~~~~~~~~~~~~~~~~
--
   In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
                    from drivers/pinctrl/mediatek/pinctrl-mt7623.c:11:
>> drivers/pinctrl/mediatek/../core.h:217:21: error: initializer element is not constant
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7623.c:1079:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
    1079 |         PINCTRL_PIN_GROUP("aud_ext_clk0", mt7623_aud_ext_clk0),
         |         ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/../core.h:217:21: note: (near initialization for 'mt7623_groups')
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7623.c:1079:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
    1079 |         PINCTRL_PIN_GROUP("aud_ext_clk0", mt7623_aud_ext_clk0),
         |         ^~~~~~~~~~~~~~~~~
--
   In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
                    from drivers/pinctrl/mediatek/pinctrl-mt7629.c:9:
>> drivers/pinctrl/mediatek/../core.h:217:21: error: initializer element is not constant
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7629.c:312:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
     312 |         PINCTRL_PIN_GROUP("ephy_leds", mt7629_ephy_leds),
         |         ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/../core.h:217:21: note: (near initialization for 'mt7629_groups')
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7629.c:312:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
     312 |         PINCTRL_PIN_GROUP("ephy_leds", mt7629_ephy_leds),
         |         ^~~~~~~~~~~~~~~~~


vim +217 drivers/pinctrl/mediatek/../core.h

c7059c5ac70aea1 Tony Lindgren   2016-12-27  214  
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  215  /* Convenience macro to define a generic pin group descriptor */
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  216  #define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22 @217  (struct group_desc) {						\
4930128932e4e5e Andy Shevchenko 2023-11-22  218  	.grp = PINCTRL_PINGROUP(_name, _pins, _num_pins),	\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  219  	.name = _name,						\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  220  	.pins = _pins,						\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  221  	.num_pins = _num_pins,					\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  222  	.data = _data,						\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  223  }
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  224  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

