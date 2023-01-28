Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24103C38142
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jan 2023 15:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vZ1fgWBVahP4wcYUAaLn6RLlPZjZayrbafsKONh27U=; b=OXE4Kps8oBvitZ3e0OdsaxiTP5
	TlVTGJzUci0Gd9zVrocGPkV/1N8q+fQJMC3js+g04bhNjFP4OREG6m9SeSZcVB6J7RuS72hCPPYBB
	KrQ4VLhhJCKI8TzyDnIRgrpmnaKtttKXHk1B5uJCrmXCWmpiugowuTV+nzVlwiNfzQ6cl1ak5ZV1C
	ov3lmu9OSWklLswOkWULPBYUV/Omy9NPYXTJibF9EPEosfllU5X5oBju4lArLrAmkjebcKFwC8RDL
	FF0jYYlGl8VCdNLM83R/Y1DIj0p/NFSsPVKYzeZ0LHfXljWqrL5fO/xPpMD6o1EKlzw8OlRa0KzYg
	MXjpwMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLnAQ-000LSS-TR; Sat, 28 Jan 2023 15:30:58 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLnAN-000LQf-Jz; Sat, 28 Jan 2023 15:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674919855; x=1706455855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qynek6zoefEm+bgckY3vlCkUxIOmlSiLUfKkdp0MrNA=;
  b=AaFOor58iPyMoJaO1wXgo0QRrLtZEJpHSHTQGC9BFTmXMvWxZ3ozDz+g
   L8mk6BlYCYlQNtxEW1IO/jVV3CEX46OGOuejiQNEDNphVLmkZskN+m79M
   0T2sFOTy637qSIv1+Pq0oukwGRXWQr8wSCAGFw311gmyCAv3BM+h6Fieg
   PceHWZs3jDCAYSwqgm18GM/pbCFbjjalT4nvekR7ITqXdXTtNGE7WD/Gn
   AxVeO61etNgBf8QNnmYxvJPLHaI9Xkdko0FF8wLw8yCeOrLjT23w50SsM
   YCqpNrDKRXRQr+nFvVRewyZJy+TjZ1aVB7O1JwsmAogcLaSic6rHLdt4A
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="391853990"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="391853990"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 07:30:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="837491300"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="837491300"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Jan 2023 07:30:38 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLnA5-0000qX-2w;
	Sat, 28 Jan 2023 15:30:37 +0000
Date: Sat, 28 Jan 2023 23:30:12 +0800
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
Message-ID: <202301282319.Z1Kqm6bN-lkp@intel.com>
References: <20220919-v5-3-cfb0e5ad29b2@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919-v5-3-cfb0e5ad29b2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_073055_731078_7954E4C0 
X-CRM114-Status: GOOD (  15.60  )
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49]

url:    https://github.com/intel-lab-lkp/linux/commits/Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230128-160522
base:   e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49
patch link:    https://lore.kernel.org/r/20220919-v5-3-cfb0e5ad29b2%40baylibre.com
patch subject: [PATCH v5 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
config: arc-randconfig-r043-20230123 (https://download.01.org/0day-ci/archive/20230128/202301282319.Z1Kqm6bN-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2cc45518a7fd551117426c770070d93acb31166e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230128-160522
        git checkout 2cc45518a7fd551117426c770070d93acb31166e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/phy/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:22,
                    from drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:6:
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function 'mtk_hdmi_pll_calc':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:299:20: note: in expansion of macro 'BIT'
     299 |         if ((pcw / BIT(32)) > 1) {
         |                    ^~~
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:299:18: warning: division by zero [-Wdiv-by-zero]
     299 |         if ((pcw / BIT(32)) > 1) {
         |                  ^
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:301:27: note: in expansion of macro 'BIT'
     301 |         } else if ((pcw / BIT(32)) == 1) {
         |                           ^~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:301:25: warning: division by zero [-Wdiv-by-zero]
     301 |         } else if ((pcw / BIT(32)) == 1) {
         |                         ^
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:303:36: note: in expansion of macro 'BIT'
     303 |                 fbkdiv_low = pcw % BIT(32);
         |                                    ^~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:303:34: warning: division by zero [-Wdiv-by-zero]
     303 |                 fbkdiv_low = pcw % BIT(32);
         |                                  ^


vim +299 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c

   211	
   212	static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
   213						 unsigned long rate, unsigned long parent_rate)
   214	{
   215		int i = 0;
   216		int ret;
   217		u64 tmds_clk;
   218		u64 pixel_clk;
   219		/* pll input source frequency */
   220		u64 da_hdmitx21_ref_ck;
   221		/* ICO output clk */
   222		u64 ns_hdmipll_ck;
   223		/* source clk for Display digital */
   224		u64 ad_hdmipll_pixel_ck;
   225		u64 pcw;
   226		u32 fbkdiv_low;
   227		u8 digital_div;
   228		u8 txprediv;
   229		u8 txposdiv;
   230		u8 fbkdiv_high;
   231		u8 posdiv1;
   232		u8 posdiv2;
   233		/* prediv is always 1 */
   234		u8 prediv = 1;
   235		/* fbkdiv_hs3 is always 1 */
   236		u8 fbkdiv_hs3 = 1;
   237		u8 txpredivs[4] = { 2, 4, 6, 12 };
   238	
   239		pixel_clk = rate;
   240		tmds_clk = pixel_clk;
   241	
   242		if (tmds_clk < 25000000 || tmds_clk > 594000000)
   243			return -EINVAL;
   244	
   245		if (tmds_clk >= 340000000)
   246			hdmi_phy->tmds_over_340M = true;
   247		else
   248			hdmi_phy->tmds_over_340M = false;
   249	
   250		/* in Hz */
   251		da_hdmitx21_ref_ck = 26000000UL;
   252	
   253		/*  TXPOSDIV stage treatment:
   254		 *	0M  <  TMDS clk  < 54M		  /8
   255		 *	54M <= TMDS clk  < 148.35M    /4
   256		 *	148.35M <=TMDS clk < 296.7M   /2
   257		 *	296.7 <=TMDS clk <= 594M	  /1
   258		 */
   259		if (tmds_clk < 54000000UL)
   260			txposdiv = 8;
   261		else if (tmds_clk >= 54000000UL && tmds_clk < 148350000UL)
   262			txposdiv = 4;
   263		else if (tmds_clk >= 148350000UL && tmds_clk < 296700000UL)
   264			txposdiv = 2;
   265		else if (tmds_clk >= 296700000UL && tmds_clk <= 594000000UL)
   266			txposdiv = 1;
   267		else
   268			return -EINVAL;
   269	
   270		/* calculate txprediv: can be 2, 4, 6, 12
   271		 * ICO clk = 5*TMDS_CLK*TXPOSDIV*TXPREDIV
   272		 * ICO clk constraint: 5G =< ICO clk <= 12G
   273		 */
   274		for (i = 0; i < ARRAY_SIZE(txpredivs); i++) {
   275			ns_hdmipll_ck = 5 * tmds_clk * txposdiv * txpredivs[i];
   276			if (ns_hdmipll_ck >= 5000000000UL &&
   277			    ns_hdmipll_ck <= 12000000000UL)
   278				break;
   279		}
   280		if (i == (ARRAY_SIZE(txpredivs) - 1) &&
   281		    (ns_hdmipll_ck < 5000000000UL || ns_hdmipll_ck > 12000000000UL)) {
   282			return -EINVAL;
   283		}
   284		if (i == ARRAY_SIZE(txpredivs))
   285			return -EINVAL;
   286	
   287		txprediv = txpredivs[i];
   288	
   289		/* PCW calculation: FBKDIV
   290		 * formula: pcw=(frequency_out*2^pcw_bit) / frequency_in / FBKDIV_HS3;
   291		 * RG_HDMITXPLL_FBKDIV[32:0]:
   292		 * [32,24] 9bit integer, [23,0]:24bit fraction
   293		 */
   294		pcw = ns_hdmipll_ck;
   295		pcw = pcw << PCW_DECIMAL_WIDTH;
   296		pcw = pcw / da_hdmitx21_ref_ck;
   297		pcw = pcw / fbkdiv_hs3;
   298	
 > 299		if ((pcw / BIT(32)) > 1) {
   300			return -EINVAL;
   301		} else if ((pcw / BIT(32)) == 1) {
   302			fbkdiv_high = 1;
   303			fbkdiv_low = pcw % BIT(32);
   304		} else {
   305			fbkdiv_high = 0;
   306			fbkdiv_low = pcw;
   307		}
   308	
   309		/* posdiv1:
   310		 * posdiv1 stage treatment according to color_depth:
   311		 * 24bit -> posdiv1 /10, 30bit -> posdiv1 /12.5,
   312		 * 36bit -> posdiv1 /15, 48bit -> posdiv1 /10
   313		 */
   314		posdiv1 = 10;
   315		posdiv2 = 1;
   316		ad_hdmipll_pixel_ck = (ns_hdmipll_ck / 10) / 1;
   317	
   318		/* Digital clk divider, max /32 */
   319		digital_div = ad_hdmipll_pixel_ck / pixel_clk;
   320		if (!(digital_div <= 32 && digital_div >= 1))
   321			return -EINVAL;
   322	
   323		mtk_hdmi_pll_set_hw(hw, prediv, fbkdiv_high, fbkdiv_low,
   324					  fbkdiv_hs3, posdiv1, posdiv2, txprediv,
   325					  txposdiv, digital_div);
   326		if (ret)
   327			return -EINVAL;
   328	
   329		return 0;
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

