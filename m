Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E25EC05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 04:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1y4f1OhTuT+Dx2rs79aJ04UgsmTZm4+YxI6nJoM84qo=; b=QFvkTOMwu4gH0rgI0VjvWuzYRE
	Z42TY7Gh9hSyQuj1Hr5aXzPSBhrS6IyNrfb9XRsHx+T+53U/vJQgrVSyaexTIJexLo4+JXIK5uYsU
	JN74aHzgK0XUDeTAwmgMHhm0v6XEZaOrBHt0vHsbvgZzVCCxCA7o+yLWGoHriY7CkvZrqPA4VRq8+
	2EHgfnXLGGgnmOmc2Ado9yjM4kBUw0FXChJDNmt8y3xl0HyL9tNZAQqKfodczAm8/dxqWfLFuU0K6
	G3R5rYbVmlMX2g66L3N3Vw8WXr07ADNVndXwmerNnV3UgC59ss66cQWpNRn/aXycqJjwmGhaNzVEJ
	0Hjllp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRmsZ-00HPtY-IW; Tue, 14 Feb 2023 04:25:19 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRmsO-00HPsC-V3; Tue, 14 Feb 2023 04:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676348708; x=1707884708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qS9r1+DDeebaYhT1Tf6BMORix1uHV7srDyqZtYE5TnQ=;
  b=PgKK3twkC++HqqTc1Pp03IMHXvoLj72oY6rzyUjCdGCVOgvclH+kc82x
   iExufEQfd/rBw8cd2It8Kw2c8inUxmW3kSetxkrvzeujbK0x/DJC8+lAD
   egT3g9kluMHlaBPMtzwmgg9j8YVl7zbVM/jBFJZBdcM/AWSvSK4lo2Z7U
   9KopezFEhJ6LfmaysoH5hQ0f1vrJfyvl8VPTwR7KzhoyaZRFatfgTGkTD
   SXF9g5kN1c4NJ/gjcVLxOZWNib2JWpxzfpZIZlBCxWcfplGLSgKE/Ou4x
   v4lU/ZBJK3bl1sYmr9romF+S4SFmKaZWyw6C7rMEveViRXtPE3Bih+iTW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393475391"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="393475391"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 20:25:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701522522"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="701522522"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Feb 2023 20:24:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRmsA-0008DA-0U;
	Tue, 14 Feb 2023 04:24:54 +0000
Date: Tue, 14 Feb 2023 12:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mac.shen@mediatek.com, stuart.lee@mediatek.com,
	Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v7 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
Message-ID: <202302141253.tAssz6h3-lkp@intel.com>
References: <20220919-v7-3-b5b58c5ccc07@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919-v7-3-b5b58c5ccc07@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_202509_066929_5D0F13B9 
X-CRM114-Status: GOOD (  11.37  )
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

[auto build test ERROR on 09e41676e35ab06e4bce8870ea3bf1f191c3cb90]

url:    https://github.com/intel-lab-lkp/linux/commits/Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230213-193958
base:   09e41676e35ab06e4bce8870ea3bf1f191c3cb90
patch link:    https://lore.kernel.org/r/20220919-v7-3-b5b58c5ccc07%40baylibre.com
patch subject: [PATCH v7 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230214/202302141253.tAssz6h3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/94dbdd48a9476284394fe686b9d3f8d9277281db
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230213-193958
        git checkout 94dbdd48a9476284394fe686b9d3f8d9277281db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141253.tAssz6h3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM
   Depends on [n]: !MMU [=y]
   Selected by [y]:
   - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

