Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F37C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63LJ2St8CXgOMOscozJgCqktMHVYHhiFRBAI1drKQbE=; b=bzJuhiSfvzMGNJ
	CMod69gNUK+aRnffhXeEPMZwv6v4Ch5MhXy1IVoDE3lBgTpwoHsOK4RM0o54cq4vXux3rh+5PKT3m
	yi/DK5k1JB8iUlThevWlRMzr5DGCUDmtFdZSDvOCeFZPMn82wtAKjGuRgKD7NYJtXtzaRXbioOMxu
	4wHrEpZWGq8lxUzd4v6XeFryNdprX8wOKMLXHzW2yt1eH77PHPm4OsUtxXxc3p69n2SxNCG49mf+z
	gz9tq7kXYxw8sSqd11xtPJbRJ7w1JcQ0eGGvTpiZYEYxcdR4tJIK/LkJO8OUNibg8FGmyB6Ffc7rC
	kgjr9muc7BW1fZQ/HpYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDjo-001W0s-76; Mon, 06 Jun 2022 14:29:48 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDjW-001Vqi-KP; Mon, 06 Jun 2022 14:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654525770; x=1686061770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6gFuK9m/CegkpD/g+gX8hVz/ChSurSOe3kM0kYWm6aE=;
  b=Bp9gHUEur61qxVduUAQaeWNlUj6okOD/UxwIe8hOKdLzyyXO4yl1tXsb
   k2scWlKE7SRHkHwTsw3tMj2pveCJVLv1dX3SS7Xtegg67PR4PisoMzPMX
   +ZcRlHPm+bjE3YTuRnAXyh+i93rsWcomi+pYJ/NCw/HYKlJKUVIEmaQzm
   ovYrv/fHyulnqL+e/eh0I9h4XRWVjviICc5g2nzxfdqsz3atOAsKqOTZP
   oDIXuqide2sfoRlRK6aHn/4iIKILewPIas0IlYo/Wgx112dLvTa3ALVZ8
   CGx20axXsI35su6Btun2UeBEIbaB9NICxOtNA5iMpucFTrE0zJUaAnRhW
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="276699571"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="276699571"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 07:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="554471422"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Jun 2022 07:29:19 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyDjK-000Cnd-JV;
	Mon, 06 Jun 2022 14:29:18 +0000
Date: Mon, 6 Jun 2022 22:28:27 +0800
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
Subject: Re: [RESEND 12/14] leds: mt6370: Add Mediatek MT6370 Indicator
 support
Message-ID: <202206062207.q0S8wxpj-lkp@intel.com>
References: <20220531111900.19422-13-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220531111900.19422-13-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_072930_711229_C45B4503 
X-CRM114-Status: GOOD (  12.64  )
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on pavel-leds/for-next]
[also build test ERROR on lee-mfd/for-mfd-next lee-backlight/for-backlight-next v5.19-rc1 next-20220606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/ChiaEn-Wu/Add-Mediatek-MT6370-PMIC-support/20220531-211432
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20220606/202206062207.q0S8wxpj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4de9e5ff11aeade155aa744bcaf9efca82b3d4ee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review ChiaEn-Wu/Add-Mediatek-MT6370-PMIC-support/20220531-211432
        git checkout 4de9e5ff11aeade155aa744bcaf9efca82b3d4ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/leds/leds-mt6370.c: In function 'mt6370_check_vendor_info':
>> drivers/leds/leds-mt6370.c:873:15: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
     873 |         vid = FIELD_GET(MT6370_VENID_MASK, devinfo);
         |               ^~~~~~~~~
         |               FOLL_GET
   cc1: some warnings being treated as errors


vim +873 drivers/leds/leds-mt6370.c

   863	
   864	static int mt6370_check_vendor_info(struct mt6370_priv *priv)
   865	{
   866		unsigned int devinfo, vid;
   867		int ret;
   868	
   869		ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &devinfo);
   870		if (ret)
   871			return ret;
   872	
 > 873		vid = FIELD_GET(MT6370_VENID_MASK, devinfo);
   874		if (vid == 0x9 || vid == 0xb) {
   875			priv->reg_fields = mt6372_reg_fields;
   876			priv->ranges = mt6372_led_ranges;
   877			priv->is_mt6372 = true;
   878		} else {
   879			priv->reg_fields = common_reg_fields;
   880			priv->ranges = common_led_ranges;
   881		}
   882	
   883		return 0;
   884	}
   885	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
