Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6938ACF6496
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Sep 2024 22:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYew1sdg4ZO1dCxPvxWvhz03Xrp7Z3mURzu7qPenODE=; b=kuTiKCaTyy3NeSxSLBAA8rvSAk
	A7kGCG/bMLhGjNGfAxA4VfobKPq5cT0juPMkdhSm094NzPUygtUZKciOhnnI9KxEaXcqpODSleZly
	MW7i32mg50ZKgtQa1T5f2Qh/5v4YADQFeW8HbCosm6wU65VM3u8BOqBMoVXBumnXvyU6ECAMYD78G
	6re6a5JY/0pc4SDE5ly+rz+xdLT2Y1ZmjbInZheg40v4Fb2Vf/ZzJVCOiRdAhLiJQSOJhm8dd0YT6
	+l+0aGSKUTnOdM2yXAoZksK7sPy3zSW3beOBj2fAE9E5QCF1JcKelIQZRu1H4zkXWpkqpRA9QFK7G
	dl91VL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sugJM-0000000Dm1k-02Mk;
	Sat, 28 Sep 2024 22:53:12 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sugJI-0000000Dm0p-2p8s;
	Sat, 28 Sep 2024 22:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727563988; x=1759099988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JQc0Z2OjYL4V5ha5EFr4cWv2UKg0TOWssALGaegsMts=;
  b=EwiXOZ5ebUhC0CpZec0gBfYq5iHqAyx1bQhATfMoSIIbkmPOMBWLqPHu
   HE8oeNFy+S9L/yxFqYfD8cDc3HU5WJiRfco6SYGo4Qx4P4PdRwHkK30xH
   R+2cyIMbkUAMtzbGqN9F8btYBbn5i90h8SJixjP1SmJ5rkVaRj0nGfW17
   4dqMi5pnCv3aaaQ+T+m0OKGkVR0u/xRN9pr61Y3EzVda90zcGmx//mafQ
   uu+jHamo0zi0M+/HUsgv3v64y+A5rAgW3uEIWbJVCuJ4Klkxhkz9MXHsR
   eFyzdArgxnk2GWrI+kmXgoqURKrqs0jiuvsM9CxY9woSGfhbWSCndrrEq
   A==;
X-CSE-ConnectionGUID: QzJbVsyFQf2lIV1SVa5+qQ==
X-CSE-MsgGUID: abcUy9FsS6emmjOvvwZj+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="52096696"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="52096696"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 15:53:06 -0700
X-CSE-ConnectionGUID: S4HAL6U0THeeehG2HcCX5A==
X-CSE-MsgGUID: kbcuEdr5Rqa1gR96kN6zNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72760530"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 15:53:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sugJA-000Njn-05;
	Sat, 28 Sep 2024 22:53:00 +0000
Date: Sun, 29 Sep 2024 06:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Shawn Sung <shawn.sung@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 2/2] drm/mediatek: Add blend_modes to mtk_plane_init()
 for different SoCs
Message-ID: <202409290651.YLKsl39c-lkp@intel.com>
References: <20240926083526.24629-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926083526.24629-3-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_155308_792926_015CF397 
X-CRM114-Status: GOOD (  12.63  )
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

Hi Jason-JH.Lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on linus/master next-20240927]
[cannot apply to v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/drm-mediatek-ovl-Add-blend_modes-to-driver-data/20240926-163734
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240926083526.24629-3-jason-jh.lin%40mediatek.com
patch subject: [PATCH v6 2/2] drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs
config: arm64-randconfig-001-20240929 (https://download.01.org/0day-ci/archive/20240929/202409290651.YLKsl39c-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290651.YLKsl39c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290651.YLKsl39c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_ethdr.c:18:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:9:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/mediatek/mtk_ethdr.c:18:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:10:
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_ethdr.c:21:
>> drivers/gpu/drm/mediatek/mtk_ethdr.h:16:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      16 | const u32 mtk_ethdr_get_blend_modes(struct device *dev);
         | ^~~~~
>> drivers/gpu/drm/mediatek/mtk_ethdr.c:148:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     148 | const u32 mtk_ethdr_get_blend_modes(struct device *dev)
         | ^~~~~
   5 warnings generated.
--
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:7:
   In file included from include/drm/drm_of.h:8:
   In file included from include/drm/drm_bridge.h:30:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:20:
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:21:
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:23:
>> drivers/gpu/drm/mediatek/mtk_ethdr.h:16:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      16 | const u32 mtk_ethdr_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:403:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     403 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev)
         | ^~~~~
   7 warnings generated.


vim +/const +16 drivers/gpu/drm/mediatek/mtk_ethdr.h

     8	
     9	void mtk_ethdr_start(struct device *dev);
    10	void mtk_ethdr_stop(struct device *dev);
    11	int mtk_ethdr_clk_enable(struct device *dev);
    12	void mtk_ethdr_clk_disable(struct device *dev);
    13	void mtk_ethdr_config(struct device *dev, unsigned int w,
    14			      unsigned int h, unsigned int vrefresh,
    15			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
  > 16	const u32 mtk_ethdr_get_blend_modes(struct device *dev);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

