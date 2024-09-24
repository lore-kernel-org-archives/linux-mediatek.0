Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3A0CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 01:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBzMsN5RHfPhudOYqJs3hdHWT2zf6o3BRLLDwtCh/wg=; b=Ex86/dnXflDs1Uc8DKmytK/x6C
	zD7zJT9JqMJhmSZ3X6Z8h3nISj7K6c7Uu/wsGCUNdwKoaEO4JHHyzRMlsXcENjE2/6OGidw9tl3Rs
	PG7H9rlUFUduyAg6k24kctmOHMJZLzS0E+B80jn2mKRw+wN8+cOiY+xU0ABqMNDY88hHalccH6uEB
	X/qPn7/7dLblcuf8uv5C/LS7X36pq6zb1GMO+/4PfECUHimqj+CDsfK8XKC/Pv6NlvOJLkA+qQS2w
	ceYj6D8GElKB+f/4i7H54rB60IHiMQ26tuvlgnQqQTcVS40BEZYST6WPbLyoj2Bk5r4poskVm5dIf
	A/p8EayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssu42-00000000myi-1Ive;
	Tue, 24 Sep 2024 01:10:02 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssu3z-00000000mxt-1P1e;
	Tue, 24 Sep 2024 01:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727140199; x=1758676199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=moV2zLeHFU9ICjjabYswCIKJ83Q3EhyizzysDPkZHb4=;
  b=cb81UliDYNT4Ijozg+6ZSMvQobG7M38yRAhu3UUZ2C+uUIl0D/5d00/K
   p599ac1EpLvsvgFiu2ruNJWro98QejE7I07LQr7ymw6c6MZOMpaBf2nfN
   oQ2Ve9yG12f/vjsXzhV5l85JPl/KTDOblfj/qn4Xttge2dY7grDuu0LMJ
   sp7sJt1NkufIZeHibw4/aI8pw6TWfFWNS+Aoml8JOlxC1Eofz8lAHAp2G
   pDEdN7dP5nRiQfLKLfQUjL/YMHjpL8uM0UgfF+CoP6vVEOOLy8hJ9BIQO
   mceQA6ub2FMcsRt0lf/P5jYQPBH2/hZ2S/Q4U8+w9yH1LwKslWwjjG9kD
   A==;
X-CSE-ConnectionGUID: gLzyiWN8SHeTcqnIONHtVA==
X-CSE-MsgGUID: JqAKg5UWRyW2DCfdB3IQJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37479261"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="37479261"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 18:09:56 -0700
X-CSE-ConnectionGUID: zxpuOZbGTD+sVOcZfs4p5A==
X-CSE-MsgGUID: 0LmOncA4T92wi79gKfhj1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="71292986"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Sep 2024 18:09:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssu3p-000HlT-2m;
	Tue, 24 Sep 2024 01:09:49 +0000
Date: Tue, 24 Sep 2024 09:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com, mac.shen@mediatek.com,
	peng.liu@mediatek.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/1] drm/mediatek: dp: Add sdp path reset
Message-ID: <202409240818.3cqdkw5o-lkp@intel.com>
References: <20240923133610.23728-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923133610.23728-1-liankun.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_180959_418055_DE217432 
X-CRM114-Status: GOOD (  12.46  )
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

Hi Liankun,

kernel test robot noticed the following build errors:

[auto build test ERROR on pza/reset/next]
[also build test ERROR on linus/master v6.11 next-20240923]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liankun-Yang/drm-mediatek-dp-Add-sdp-path-reset/20240923-213747
base:   https://git.pengutronix.de/git/pza/linux reset/next
patch link:    https://lore.kernel.org/r/20240923133610.23728-1-liankun.yang%40mediatek.com
patch subject: [PATCH v1 1/1] drm/mediatek: dp: Add sdp path reset
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409240818.3cqdkw5o-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240818.3cqdkw5o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240818.3cqdkw5o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_dp.c:9:
   In file included from include/drm/display/drm_dp_helper.h:27:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp.c:1058:5: error: use of undeclared identifier 'SDP_RESET_SW_DP_ENC0_P0'
    1058 |                                 SDP_RESET_SW_DP_ENC0_P0,
         |                                 ^
   drivers/gpu/drm/mediatek/mtk_dp.c:1059:5: error: use of undeclared identifier 'SDP_RESET_SW_DP_ENC0_P0'
    1059 |                                 SDP_RESET_SW_DP_ENC0_P0);
         |                                 ^
   drivers/gpu/drm/mediatek/mtk_dp.c:1064:8: error: use of undeclared identifier 'SDP_RESET_SW_DP_ENC0_P0'
    1064 |                                 0, SDP_RESET_SW_DP_ENC0_P0);
         |                                    ^
   4 warnings and 3 errors generated.


vim +/SDP_RESET_SW_DP_ENC0_P0 +1058 drivers/gpu/drm/mediatek/mtk_dp.c

  1054	
  1055	static void mtk_dp_sdp_path_reset(struct mtk_dp *mtk_dp)
  1056	{
  1057		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
> 1058					SDP_RESET_SW_DP_ENC0_P0,
  1059					SDP_RESET_SW_DP_ENC0_P0);
  1060	
  1061		/* Wait for sdp path reset to complete */
  1062		usleep_range(1000, 5000);
  1063		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
  1064					0, SDP_RESET_SW_DP_ENC0_P0);
  1065	}
  1066	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

