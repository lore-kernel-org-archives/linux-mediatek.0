Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7030BCF9C73
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 23:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+TXKENwJdpA9K3H+iyalOFiLAdWjJ32cVOqriXKvCw=; b=LDId65yvVqF2XWVWz5lw842Ubb
	ycLRNxaMDRp/wmeHwjf7UfGPhUnsHtb8fwuwBVnh/vBBS2uPjGMA1qnL4QEJZ2yv2MvemVvLxny6T
	7Pd1iIodWQlR7Ah7p66UJyI56Cy7ftlxi4u34Nsejs9qt+v6iZzowSTc3K2E7BHYDiAU6t4uhU3Ll
	m+mvKnkctAo8qDFvyClVROmcsVAd8UXEf2RpfGkWW2dmfpzktJn3Z9SJIALXan3l3GCDD4Q8bIPz8
	ewh0ouzP4yqe62E52v2rcOxfimAuHMFE6PAprWpkRMuk6et50dRFJyF/pSJlnSdWKzwq8KQBsmLW1
	jLFlSTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sssm9-00000000idR-2glf;
	Mon, 23 Sep 2024 23:47:29 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sssm6-00000000ici-1bN7;
	Mon, 23 Sep 2024 23:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727135247; x=1758671247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Uj5mtdoOAx4kTnVRoWRzMXPTIVr/7eKH1rcTgJl9kw=;
  b=ANZa1RzS8Z3CVhcoZCnTjimQQqJcm5/+rNHRjtObtMIV/jwSK0H5sZVo
   lpaOb3zhDOfzCeXLfWZ56oT59aa8A4+bEd34gYkzvGfhfupH7sbu6AlBr
   yXrYhP8Lhkj6roZlhq96fUsevZ4RArvw8I/F9Uo8hG9yz3WsKsNrSPuBb
   3psbn0Tz/0TFslKILFJ8F64mFKVxV5oXdtn06EYI3vZvVLV5zSL5HdNrt
   B1AZiWkS6C4MUNOpoSRan434q5gimNiOGQYbPUPFtX6Pmc+7ADOv6AVh/
   sjIAxKD4SFexp3cUlaIk9TOv/EFJl2GWjK5aVMOIuUVzKpTqf61LaYsbW
   w==;
X-CSE-ConnectionGUID: PevOyKxgSBmUgahma7XH+A==
X-CSE-MsgGUID: 797eWArhQ3+BQE98yDb74A==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26201990"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="26201990"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 16:47:25 -0700
X-CSE-ConnectionGUID: Ka2oBSuyTKOd3Z5PG+7EYQ==
X-CSE-MsgGUID: ZyAwx6NvSC2ErgBnx4lVTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="94575117"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2024 16:44:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sssjX-000HhL-0L;
	Mon, 23 Sep 2024 23:44:47 +0000
Date: Tue, 24 Sep 2024 07:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com, mac.shen@mediatek.com,
	peng.liu@mediatek.com
Cc: oe-kbuild-all@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/1] drm/mediatek: dp: Add sdp path reset
Message-ID: <202409240700.ARp9pDUk-lkp@intel.com>
References: <20240923133610.23728-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923133610.23728-1-liankun.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_164726_499284_E77805AA 
X-CRM114-Status: GOOD (  14.39  )
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
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409240700.ARp9pDUk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240700.ARp9pDUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240700.ARp9pDUk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp.c: In function 'mtk_dp_sdp_path_reset':
>> drivers/gpu/drm/mediatek/mtk_dp.c:1058:33: error: 'SDP_RESET_SW_DP_ENC0_P0' undeclared (first use in this function); did you mean 'SDP_PACKET_W_DP_ENC1_P0'?
    1058 |                                 SDP_RESET_SW_DP_ENC0_P0,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                                 SDP_PACKET_W_DP_ENC1_P0
   drivers/gpu/drm/mediatek/mtk_dp.c:1058:33: note: each undeclared identifier is reported only once for each function it appears in


vim +1058 drivers/gpu/drm/mediatek/mtk_dp.c

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

