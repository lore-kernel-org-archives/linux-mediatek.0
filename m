Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35570C77B73
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 May 2023 15:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YT+Pv+9vRsBcxqkSXtCoiGdVwuY0wIyBU7LjKU2tXMs=; b=glDE3DUgBn5x+0sG9sZdXuCjyn
	WOD32xH9vcoGOch2CC+YaVgN3RAOWTyLLC1kqEr7GTDpdCHXp/m8N+Q9sAPxhpJhSuYuZ4qFm8Gr0
	3YeG/r1EzVHJTpX3EORkwT/EOKAshebJohf7LUeTCtpY9Ab3XRlWJnTQkxml4jh79JOJdzW/o+p9v
	H4R8Iw0oVDG7QoT0ARBzWMcdN6/qtaI0dBdRQCAkZr7fEdFl2RrkoCupjxMvKLCXT9qaQSgr5NMjv
	gLQ0W2Qx7LuTo1P2xfevGuD68MiXB7H2QlZP5h2n/nTIl0fJ2ZFnCHG1w6OB8DUTAodCGmV0ln/u4
	DbZfkMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvJh5-00Dsuh-2v;
	Sat, 06 May 2023 15:19:31 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvJh2-00Dssf-2K;
	Sat, 06 May 2023 15:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683386368; x=1714922368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hCkknZAYY5yWFfX8utaB6yqS2c4BWC6sJ7xkLkU5m0o=;
  b=hH3j67fYvpgiZiRToRl20XpdTaAOB/AYn7bahFEcH0B7IW8fotwkrv/3
   jJMHdxUBygxWK3TQXlu2YicTmoYnKrWwwpZpgPcZhWlEtT37aw3cWUb/O
   Jq1+vaXigtejgEFBmb540juvEqrOYfLFtLOpX9NgprOeoZfImhw94W47B
   D3/yjVCUalLijmL9y5AkXu4CGKWEqS9g6Vk9tZtYWautMBBuk0iByCpcV
   zpH7HNoyrTLHSUxi49Tmy2hMbVVK3bnkKwQOTbid0QKeT8MkxkCnT6Jb6
   7oms6tZTZ16KsfFWN26P4r3ladms8MwyWq0851xhb81iUjYBvHk8ahjBU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="329015359"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="329015359"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 08:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="730743043"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="730743043"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 May 2023 08:19:18 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvJgr-0000Mn-1k;
	Sat, 06 May 2023 15:19:17 +0000
Date: Sat, 6 May 2023 23:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org, kernel@collabora.com
Subject: Re: [PATCH v3 04/11] drm/mediatek: gamma: Improve and simplify HW
 LUT calculation
Message-ID: <202305062349.SFNFiiWv-lkp@intel.com>
References: <20230506123549.101727-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230506123549.101727-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_081928_769462_0A6AE1B1 
X-CRM114-Status: GOOD (  15.35  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to pza/imx-drm/next mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230506-203713
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230506123549.101727-5-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v3 04/11] drm/mediatek: gamma: Improve and simplify HW LUT calculation
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230506/202305062349.SFNFiiWv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a933258d0ee5c49d54f70fe11d3b1d719d5b6087
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230506-203713
        git checkout a933258d0ee5c49d54f70fe11d3b1d719d5b6087
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305062349.SFNFiiWv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_gamma.c: In function 'mtk_gamma_set_common':
>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:106:48: warning: suggest parentheses around '+' inside '<<' [-Wparentheses]
     106 |                         word = hwlut.red << 20 +
         |                                             ~~~^
     107 |                                hwlut.green << 10 +
         |                                ~~~~~~~~~~~      
   drivers/gpu/drm/mediatek/mtk_disp_gamma.c:107:50: warning: suggest parentheses around '+' inside '<<' [-Wparentheses]
     107 |                                hwlut.green << 10 +
         |                                               ~~~^
     108 |                                hwlut.red;
         |                                ~~~~~~~~~          
   drivers/gpu/drm/mediatek/mtk_disp_gamma.c:119:48: warning: suggest parentheses around '+' inside '<<' [-Wparentheses]
     119 |                         word = diff.blue << 20 +
         |                                             ~~~^
     120 |                                diff.green << 10 +
         |                                ~~~~~~~~~~       
   drivers/gpu/drm/mediatek/mtk_disp_gamma.c:120:49: warning: suggest parentheses around '+' inside '<<' [-Wparentheses]
     120 |                                diff.green << 10 +
         |                                              ~~~^
     121 |                                diff.red;
         |                                ~~~~~~~~          


vim +106 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

    70	
    71	void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
    72	{
    73		struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
    74		unsigned int i, reg;
    75		struct drm_color_lut *lut;
    76		void __iomem *lut_base;
    77		bool lut_diff;
    78		u16 lut_size;
    79		u32 word;
    80	
    81		/* If there's no gamma lut there's nothing to do here. */
    82		if (!state->gamma_lut)
    83			return;
    84	
    85		if (gamma && gamma->data) {
    86			lut_diff = gamma->data->lut_diff;
    87			lut_size = gamma->data->lut_size;
    88		} else {
    89			lut_diff = false;
    90			lut_size = LUT_SIZE_DEFAULT;
    91		}
    92	
    93		reg = readl(regs + DISP_GAMMA_CFG);
    94		reg = reg | GAMMA_LUT_EN;
    95		writel(reg, regs + DISP_GAMMA_CFG);
    96		lut_base = regs + DISP_GAMMA_LUT;
    97		lut = (struct drm_color_lut *)state->gamma_lut->data;
    98		for (i = 0; i < lut_size; i++) {
    99			struct drm_color_lut diff, hwlut;
   100	
   101			hwlut.red = drm_color_lut_extract(lut[i].red, 10);
   102			hwlut.green = drm_color_lut_extract(lut[i].green, 10);
   103			hwlut.blue = drm_color_lut_extract(lut[i].blue, 10);
   104	
   105			if (!lut_diff || (i % 2 == 0)) {
 > 106				word = hwlut.red << 20 +
   107				       hwlut.green << 10 +
   108				       hwlut.red;
   109			} else {
   110				diff.red = lut[i].red - lut[i - 1].red;
   111				diff.red = drm_color_lut_extract(diff.red, 10);
   112	
   113				diff.green = lut[i].green - lut[i - 1].green;
   114				diff.green = drm_color_lut_extract(diff.green, 10);
   115	
   116				diff.blue = lut[i].blue - lut[i - 1].blue;
   117				diff.blue = drm_color_lut_extract(diff.blue, 10);
   118	
   119				word = diff.blue << 20 +
   120				       diff.green << 10 +
   121				       diff.red;
   122			}
   123			writel(word, (lut_base + i * 4));
   124		}
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

