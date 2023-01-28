Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FF3C38142
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jan 2023 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1bCGBLgovi3q/v8ET4W8PyBl4sU90EbZek6jk/NEZw=; b=fEQXfaQ5sr665IELQI7zDCACrp
	Te3GlK0hFakLK8rmlj4BcszD79Pnvp1bzImfP9ZSnpse682vn8rRefpc3GbVtFTA5vh2HRJMQRbzm
	Ogj+FenC2s9wh1CqiMDmvwIcrjz8vRuXb5nDcD72ibuJX5Dfklz5wC00JjzQGileckIb1oNxfGqPi
	J4m22viMqSmGilzMEZB2yFcCTbvxhU4o5ijGI+RWFxuU5x44n4DrVZ2RcJ23o+3Y04moaTm070IcQ
	yNJcQxCJhAsYcSSBv7H0Dy3NyM2Uec0L70QR4FGVOqNS5s061/LclPSVHUjP85m6TdkEUxk7caHlk
	+tJxmMiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLqOl-000YIj-Sj; Sat, 28 Jan 2023 18:57:59 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLqOi-000YHr-LT; Sat, 28 Jan 2023 18:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674932276; x=1706468276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C/Fj/U8MY72zX0xzMfuMhE7ROEG03cf3gcA25/GnMq4=;
  b=ldLgtIu5X1m/oWzLfJVcfmijWVWsr8Im2uIA3x9AsxxFQfI7D4AvB4KS
   B4LJKCJ3tZKHH8qNGUmOiIu+UEiBlIsGQP3DaNESGH5kLZdbb2BSTGI3y
   CKLragBRlRpQzOCwGcMKn6auP7Z90Bv7WdrYSRCl29pv0p/Y6R1PxrCeS
   DzFZadgIYFK9PLpNH9LUVwh9jp0DY+84xk95/sa/Yh9KJK97+6KX6plLd
   x2+3DHCv7xtvQ3+v6Htwn2ZZuOqRZ7a4C7Wl7jV34vufpJVa5UcBkIC7o
   Y/YZUYtVveqa8PtmK9bbOhSsWoFQp5QdO2mKxsWQbMtb9IZ9MYCYBLaU0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="325015354"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="325015354"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 10:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="771960911"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="771960911"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2023 10:57:47 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLqOY-000109-2z;
	Sat, 28 Jan 2023 18:57:46 +0000
Date: Sun, 29 Jan 2023 02:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mac.shen@mediatek.com, linux-phy@lists.infradead.org,
	Guillaume Ranquet <granquet@baylibre.com>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	stuart.lee@mediatek.com
Subject: Re: [PATCH v5 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
Message-ID: <202301290245.KWRXz5OS-lkp@intel.com>
References: <20220919-v5-3-cfb0e5ad29b2@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919-v5-3-cfb0e5ad29b2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_105756_787645_27C34078 
X-CRM114-Status: GOOD (  12.90  )
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

Hi Guillaume,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49]

url:    https://github.com/intel-lab-lkp/linux/commits/Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230128-160522
base:   e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49
patch link:    https://lore.kernel.org/r/20220919-v5-3-cfb0e5ad29b2%40baylibre.com
patch subject: [PATCH v5 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
config: arm-buildonly-randconfig-r005-20230129 (https://download.01.org/0day-ci/archive/20230129/202301290245.KWRXz5OS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2cc45518a7fd551117426c770070d93acb31166e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230128-160522
        git checkout 2cc45518a7fd551117426c770070d93acb31166e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

