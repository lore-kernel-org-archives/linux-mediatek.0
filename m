Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB77C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 23:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+atjVYl7LjhXrAFurbO07YSMwIGIl9njHEnrFBJ0/sE=; b=B5SGY2aqS8FOnI
	+bTQJoGHM7vXuT5fSIHYr4ofh9sPEEwQOsm4Z68RGMq675DQcKoxKbBGilKmYAzTLRevTmTMl8LVx
	e+tGbVL0icikZIaqgSBQ9sgMtmZChGmuVWQpUNuxwi6JQM/PHOpLBUeaqxF8NbFAktmbZvqf486AV
	NioEA93Geq8DGs+dapaqkAkmjzEXg80WEnEM0vMCxILt8uYxHGy7bEcyGcoi4+cUmX+Sc/RecfYak
	hX3hxpcOGP/m54hRdaekbsW7Ew43vTHrS3naMaZUnjG1YeLe2D3yV57d102KFmp4MC7iIrNb72nPk
	I/t4hV8jyFDYsOgU13Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npeJ1-000Gn0-CH; Fri, 13 May 2022 23:02:43 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npeIo-000GkC-7E; Fri, 13 May 2022 23:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652482950; x=1684018950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bKBFNxyjnCkMsxqdrqa/uxOzIiSmy1cjAExYWSR7qr8=;
 b=iydfEWdbTKd0YmvcuC5BGIUfqxY4AwFLMObv2c1Tequu9pgTBn/LVEHD
 Nn9jkL+9fqbbk1VRLRIuusNzjKVGfC1s7EK1KWqbkA135o3Fv0hGCVgs8
 NjgN2M6uNqd8m74K7sji08eeQEhQv4wNt16Yt/2EFn05D+ExKpBYJTetu
 UlSlTEY10MZmY+BmdB23nRyOvY3fPfN8P/k1cyTPDyM4Te5swot1WzWWC
 Lh73htYpU24UxzNq9Sfa3deeKHV1KUWCNhgdKzAWbIpTbdp3sE9y0ulnn
 qMQa2PFxaBuC/74YHmEAKuErjrJjlhMA4MUTBq3TIe7FMKiqEmT/yyq04 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="268020584"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="268020584"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 16:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="671531657"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 13 May 2022 16:02:19 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npeIX-000MCA-6q;
 Fri, 13 May 2022 23:02:13 +0000
Date: Sat, 14 May 2022 07:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: kbuild-all@lists.01.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, y.oudjana@protonmail.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 ck.hu@mediatek.com, fparent@baylibre.com, rex-bc.chen@mediatek.com,
 tinghan.shen@mediatek.com, chun-jie.chen@mediatek.com,
 weiyi.lu@mediatek.com, ikjn@chromium.org, miles.chen@mediatek.com,
 sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/5] clk: mediatek: Add MediaTek Helio X10 MT6795 clock
 drivers
Message-ID: <202205140634.WJLdMWaS-lkp@intel.com>
References: <20220513165050.500831-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513165050.500831-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_160230_352633_B8B88F24 
X-CRM114-Status: GOOD (  16.22  )
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

Hi AngeloGioacchino,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on next-20220513]
[cannot apply to clk/clk-next pza/reset/next v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-Clock-drivers/20220514-005314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220514/202205140634.WJLdMWaS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/991f92f26cc545a1836a3120408ce27ba7ddadab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-Clock-drivers/20220514-005314
        git checkout 991f92f26cc545a1836a3120408ce27ba7ddadab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/clk/mediatek/clk-mt6795-topckgen.c: In function 'clk_mt6795_topckgen_probe':
>> drivers/clk/mediatek/clk-mt6795-topckgen.c:543:18: error: assignment to 'struct clk_hw_onecell_data *' from incompatible pointer type 'struct clk_onecell_data *' [-Werror=incompatible-pointer-types]
     543 |         clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
         |                  ^
>> drivers/clk/mediatek/clk-mt6795-topckgen.c:547:79: error: passing argument 3 of 'mtk_clk_register_fixed_clks' from incompatible pointer type [-Werror=incompatible-pointer-types]
     547 |         ret = mtk_clk_register_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks), clk_data);
         |                                                                               ^~~~~~~~
         |                                                                               |
         |                                                                               struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:38:58: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      38 |                                 struct clk_onecell_data *clk_data);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/clk/mediatek/clk-mt6795-topckgen.c:551:72: error: passing argument 3 of 'mtk_clk_register_factors' from incompatible pointer type [-Werror=incompatible-pointer-types]
     551 |         ret = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
         |                                                                        ^~~~~~~~
         |                                                                        |
         |                                                                        struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:59:55: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      59 |                              struct clk_onecell_data *clk_data);
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/clk/mediatek/clk-mt6795-topckgen.c:556:60: error: passing argument 5 of 'mtk_clk_register_muxes' from incompatible pointer type [-Werror=incompatible-pointer-types]
     556 |                                      &mt6795_top_clk_lock, clk_data);
         |                                                            ^~~~~~~~
         |                                                            |
         |                                                            struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:12:
   drivers/clk/mediatek/clk-mux.h:87:53: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      87 |                            struct clk_onecell_data *clk_data);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/clk/mediatek/clk-mt6795-topckgen.c:561:65: error: passing argument 5 of 'mtk_clk_register_composites' from incompatible pointer type [-Werror=incompatible-pointer-types]
     561 |                                           &mt6795_top_clk_lock, clk_data);
         |                                                                 ^~~~~~~~
         |                                                                 |
         |                                                                 struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:155:58: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
     155 |                                 struct clk_onecell_data *clk_data);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/clk/mediatek/clk-mt6795-topckgen.c:572:79: error: passing argument 3 of 'mtk_clk_unregister_composites' from incompatible pointer type [-Werror=incompatible-pointer-types]
     572 |         mtk_clk_unregister_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs), clk_data);
         |                                                                               ^~~~~~~~
         |                                                                               |
         |                                                                               struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:157:61: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
     157 |                                    struct clk_onecell_data *clk_data);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/clk/mediatek/clk-mt6795-topckgen.c:574:68: error: passing argument 3 of 'mtk_clk_unregister_muxes' from incompatible pointer type [-Werror=incompatible-pointer-types]
     574 |         mtk_clk_unregister_muxes(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
         |                                                                    ^~~~~~~~
         |                                                                    |
         |                                                                    struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:12:
   drivers/clk/mediatek/clk-mux.h:90:56: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      90 |                               struct clk_onecell_data *clk_data);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/clk/mediatek/clk-mt6795-topckgen.c:576:68: error: passing argument 3 of 'mtk_clk_unregister_factors' from incompatible pointer type [-Werror=incompatible-pointer-types]
     576 |         mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
         |                                                                    ^~~~~~~~
         |                                                                    |
         |                                                                    struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:61:58: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      61 |                                 struct clk_onecell_data *clk_data);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/clk/mediatek/clk-mt6795-topckgen.c:578:75: error: passing argument 3 of 'mtk_clk_unregister_fixed_clks' from incompatible pointer type [-Werror=incompatible-pointer-types]
     578 |         mtk_clk_unregister_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks), clk_data);
         |                                                                           ^~~~~~~~
         |                                                                           |
         |                                                                           struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:40:61: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      40 |                                    struct clk_onecell_data *clk_data);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/clk/mediatek/clk-mt6795-topckgen.c:580:27: error: passing argument 1 of 'mtk_free_clk_data' from incompatible pointer type [-Werror=incompatible-pointer-types]
     580 |         mtk_free_clk_data(clk_data);
         |                           ^~~~~~~~
         |                           |
         |                           struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:188:49: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
     188 | void mtk_free_clk_data(struct clk_onecell_data *clk_data);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/clk/mediatek/clk-mt6795-topckgen.c: In function 'clk_mt6795_topckgen_remove':
   drivers/clk/mediatek/clk-mt6795-topckgen.c:590:79: error: passing argument 3 of 'mtk_clk_unregister_composites' from incompatible pointer type [-Werror=incompatible-pointer-types]
     590 |         mtk_clk_unregister_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs), clk_data);
         |                                                                               ^~~~~~~~
         |                                                                               |
         |                                                                               struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:157:61: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
     157 |                                    struct clk_onecell_data *clk_data);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/clk/mediatek/clk-mt6795-topckgen.c:591:68: error: passing argument 3 of 'mtk_clk_unregister_muxes' from incompatible pointer type [-Werror=incompatible-pointer-types]
     591 |         mtk_clk_unregister_muxes(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
         |                                                                    ^~~~~~~~
         |                                                                    |
         |                                                                    struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:12:
   drivers/clk/mediatek/clk-mux.h:90:56: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      90 |                               struct clk_onecell_data *clk_data);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/clk/mediatek/clk-mt6795-topckgen.c:592:68: error: passing argument 3 of 'mtk_clk_unregister_factors' from incompatible pointer type [-Werror=incompatible-pointer-types]
     592 |         mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
         |                                                                    ^~~~~~~~
         |                                                                    |
         |                                                                    struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:61:58: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      61 |                                 struct clk_onecell_data *clk_data);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/clk/mediatek/clk-mt6795-topckgen.c:593:75: error: passing argument 3 of 'mtk_clk_unregister_fixed_clks' from incompatible pointer type [-Werror=incompatible-pointer-types]
     593 |         mtk_clk_unregister_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks), clk_data);
         |                                                                           ^~~~~~~~
         |                                                                           |
         |                                                                           struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:40:61: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      40 |                                    struct clk_onecell_data *clk_data);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/clk/mediatek/clk-mt6795-topckgen.c:594:27: error: passing argument 1 of 'mtk_free_clk_data' from incompatible pointer type [-Werror=incompatible-pointer-types]
     594 |         mtk_free_clk_data(clk_data);
         |                           ^~~~~~~~
         |                           |
         |                           struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-topckgen.c:11:
   drivers/clk/mediatek/clk-mtk.h:188:49: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
     188 | void mtk_free_clk_data(struct clk_onecell_data *clk_data);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/clk/mediatek/clk-mt6795-mm.c: In function 'clk_mt6795_mm_probe':
>> drivers/clk/mediatek/clk-mt6795-mm.c:86:18: error: assignment to 'struct clk_hw_onecell_data *' from incompatible pointer type 'struct clk_onecell_data *' [-Werror=incompatible-pointer-types]
      86 |         clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
         |                  ^
>> drivers/clk/mediatek/clk-mt6795-mm.c:90:76: error: passing argument 4 of 'mtk_clk_register_gates' from incompatible pointer type [-Werror=incompatible-pointer-types]
      90 |         ret = mtk_clk_register_gates(node, mm_gates, ARRAY_SIZE(mm_gates), clk_data);
         |                                                                            ^~~~~~~~
         |                                                                            |
         |                                                                            struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-mm.c:10:
   drivers/clk/mediatek/clk-gate.h:55:53: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      55 |                            struct clk_onecell_data *clk_data);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/clk/mediatek/clk-mt6795-apmixedsys.c: In function 'clk_mt6795_apmixed_probe':
>> drivers/clk/mediatek/clk-mt6795-apmixedsys.c:96:18: error: assignment to 'struct clk_hw_onecell_data *' from incompatible pointer type 'struct clk_onecell_data *' [-Werror=incompatible-pointer-types]
      96 |         clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
         |                  ^
>> drivers/clk/mediatek/clk-mt6795-apmixedsys.c:100:67: error: passing argument 4 of 'mtk_clk_register_plls' from incompatible pointer type [-Werror=incompatible-pointer-types]
     100 |         ret = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
         |                                                                   ^~~~~~~~
         |                                                                   |
         |                                                                   struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-apmixedsys.c:11:
   drivers/clk/mediatek/clk-pll.h:53:52: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      53 |                           struct clk_onecell_data *clk_data);
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/clk/mediatek/clk-mt6795-apmixedsys.c:104:12: error: assignment to 'struct clk_hw *' from incompatible pointer type 'struct clk *' [-Werror=incompatible-pointer-types]
     104 |         hw = mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base + REG_REF2USB);
         |            ^
>> drivers/clk/mediatek/clk-mt6795-apmixedsys.c:127:57: error: passing argument 3 of 'mtk_clk_unregister_plls' from incompatible pointer type [-Werror=incompatible-pointer-types]
     127 |         mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
         |                                                         ^~~~~~~~
         |                                                         |
         |                                                         struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-apmixedsys.c:11:
   drivers/clk/mediatek/clk-pll.h:55:55: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      55 |                              struct clk_onecell_data *clk_data);
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/clk/mediatek/clk-mt6795-apmixedsys.c:129:27: error: passing argument 1 of 'mtk_free_clk_data' from incompatible pointer type [-Werror=incompatible-pointer-types]
     129 |         mtk_free_clk_data(clk_data);
         |                           ^~~~~~~~
         |                           |
         |                           struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-apmixedsys.c:10:
   drivers/clk/mediatek/clk-mtk.h:188:49: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
     188 | void mtk_free_clk_data(struct clk_onecell_data *clk_data);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/clk/mediatek/clk-mt6795-apmixedsys.c: In function 'clk_mt6795_apmixed_remove':
   drivers/clk/mediatek/clk-mt6795-apmixedsys.c:140:57: error: passing argument 3 of 'mtk_clk_unregister_plls' from incompatible pointer type [-Werror=incompatible-pointer-types]
     140 |         mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
         |                                                         ^~~~~~~~
         |                                                         |
         |                                                         struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-apmixedsys.c:11:
   drivers/clk/mediatek/clk-pll.h:55:55: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
      55 |                              struct clk_onecell_data *clk_data);
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/clk/mediatek/clk-mt6795-apmixedsys.c:141:27: error: passing argument 1 of 'mtk_free_clk_data' from incompatible pointer type [-Werror=incompatible-pointer-types]
     141 |         mtk_free_clk_data(clk_data);
         |                           ^~~~~~~~
         |                           |
         |                           struct clk_hw_onecell_data *
   In file included from drivers/clk/mediatek/clk-mt6795-apmixedsys.c:10:
   drivers/clk/mediatek/clk-mtk.h:188:49: note: expected 'struct clk_onecell_data *' but argument is of type 'struct clk_hw_onecell_data *'
     188 | void mtk_free_clk_data(struct clk_onecell_data *clk_data);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/clk/mediatek/clk-mt6795-infracfg.c:14:10: fatal error: reset.h: No such file or directory
      14 | #include "reset.h"
         |          ^~~~~~~~~
   compilation terminated.
--
>> drivers/clk/mediatek/clk-mt6795-pericfg.c:13:10: fatal error: reset.h: No such file or directory
      13 | #include "reset.h"
         |          ^~~~~~~~~
   compilation terminated.


vim +543 drivers/clk/mediatek/clk-mt6795-topckgen.c

   531	
   532	static int clk_mt6795_topckgen_probe(struct platform_device *pdev)
   533	{
   534		struct clk_hw_onecell_data *clk_data;
   535		struct device_node *node = pdev->dev.of_node;
   536		void __iomem *base;
   537		int ret;
   538	
   539		base = devm_platform_ioremap_resource(pdev, 0);
   540		if (IS_ERR(base))
   541			return PTR_ERR(base);
   542	
 > 543		clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
   544		if (!clk_data)
   545			return -ENOMEM;
   546	
 > 547		ret = mtk_clk_register_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks), clk_data);
   548		if (ret)
   549			goto free_clk_data;
   550	
 > 551		ret = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
   552		if (ret)
   553			goto unregister_fixed_clks;
   554	
   555		ret = mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes), node,
 > 556					     &mt6795_top_clk_lock, clk_data);
   557		if (ret)
   558			goto unregister_factors;
   559	
   560		ret = mtk_clk_register_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs), base,
 > 561						  &mt6795_top_clk_lock, clk_data);
   562		if (ret)
   563			goto unregister_muxes;
   564	
   565		ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
   566		if (ret)
   567			goto unregister_composites;
   568	
   569		return 0;
   570	
   571	unregister_composites:
 > 572		mtk_clk_unregister_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs), clk_data);
   573	unregister_muxes:
 > 574		mtk_clk_unregister_muxes(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
   575	unregister_factors:
 > 576		mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
   577	unregister_fixed_clks:
 > 578		mtk_clk_unregister_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks), clk_data);
   579	free_clk_data:
 > 580		mtk_free_clk_data(clk_data);
   581		return ret;
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
