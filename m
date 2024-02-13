Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E794C4829F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 09:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/3dG6QKaJPU3/PiAIW2QX8gKXQbGMbbFsBlZrWa/Zo=; b=h9QogVLdzFwuyHWPY00RQXodhF
	l9HYr87zRZJqY3syQ7/z1JgmqKtvw3D5LYwlP1TLPyHd0YRzTqQpHIuLVtP7uDxXYnqZVXspO40aD
	sytA/w9dWx+PGOWSv4/qvThRpNsVnRVsGkB4N1rOa8Xe1icn0+bjRZyiL5ahaHcevBD91LBO7vSZK
	Xadq324+jGQ1zdcBz0pGUYMB3EteOSMKqJu/zBFTYVMi7J2lv21YVuDdNPWIZeTDlkrNa2xk86EGy
	teQ0UX38SE2z+N/gO2peilFIw9DiRJq8WgzFWrSpRCvtxjis0sqtIb9YrVl49xUFMgAKiRNF/Tti0
	SobFop2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpTH-00000008hMN-2j1A;
	Tue, 13 Feb 2024 09:52:59 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpTD-00000008hID-3QJl;
	Tue, 13 Feb 2024 09:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707817976; x=1739353976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TWjIIYxvPFkc36kIc6UBZiZzo/ccXERIOjGsYHm8iUo=;
  b=SLxd0FN2eQDgGBqec2H+kp33FNYETRG+dD/rwQfDmzJFXYOA/fzzVEEL
   b2AlHCPTktpLJdCiMkzNPcN2hfhn+eV8gzdmlzrAy2G33lsHucMeHAuT2
   XfusIngnhnv5XmRcr6kuqmLJk7eY1K6FXoOPyl+zMkI6yVqSrXINGmd8r
   rn/xqkti2LndnCqfD+iC5+G7PhFnlxG3t0rCY7VxasVYJ7RADfGzVZie7
   hF82dAVAARL+52WgbMgRyPZ/edDPGOK51hY5Zp51HSuvgHyEQxP27x7yZ
   T5BNtj2C5AmmMmNcqsXukvLYf09ltstkEHPbWeFIQDSuap1PqrWf/9M2W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12368713"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="12368713"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 01:52:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7474576"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2024 01:52:45 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZpT0-0007dh-2B;
	Tue, 13 Feb 2024 09:52:42 +0000
Date: Tue, 13 Feb 2024 17:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: "mac.shen" <mac.shen@mediatek.com>, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com
Cc: oe-kbuild-all@lists.linux.dev, mac.shen@mediatek.com,
	shuijing.li@mediatek.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Message-ID: <202402131731.OMfzWywy-lkp@intel.com>
References: <20240205055055.25340-3-mac.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205055055.25340-3-mac.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_015255_959556_95268D2F 
X-CRM114-Status: GOOD (  12.14  )
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

Hi mac.shen,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on pza/reset/next linus/master v6.8-rc4 next-20240213]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mac-shen/Subject-PATCH-drm-mediatek-dp-Add-tee-client-application-for-HDCP-feature/20240205-163727
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240205055055.25340-3-mac.shen%40mediatek.com
patch subject: [PATCH v2 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x feature for DisplayPort
config: arm-randconfig-001-20240213 (https://download.01.org/0day-ci/archive/20240213/202402131731.OMfzWywy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402131731.OMfzWywy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402131731.OMfzWywy-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/mediatek/mtk_dp.o: in function `mtk_dp_get_system_time':
>> mtk_dp.c:(.text+0x41c0): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: mtk_dp.c:(.text+0x41ce): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/gpu/drm/mediatek/mtk_dp.o: in function `mtk_dp_get_time_diff':
   mtk_dp.c:(.text+0x41ea): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: mtk_dp.c:(.text+0x41f8): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

