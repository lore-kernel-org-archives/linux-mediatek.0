Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22F9C282DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 03:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75ZTN3FqxF/xLAlsA4CWmhzPDqAN4V1SgPY+q1H21i0=; b=pKnldN5XRT+5kR8tPO8Qd33wJe
	XcrNAYaBTbFhc1K55W+htmWEqCtWIO3KDjZN72btfqdqhngJxcXHTrAuyW2uUfJFlMrntgFAgRtKg
	6v5B/nu0qwDqAprnBarR3/DQHkAYZBXb1bJyD3pPtDMYOW2h6yPIxSiqAAKixb7TAULcmHhmzdEh2
	iPBnevkcquhLqofBbvi/Vs0Fo3cny78b3VxYSVCL27RWaKVb7zAAOZ5wPOQwdVOJ33vvJxfTlAINs
	2/ZxxtOy15fIKStFwpcUsBr2Vi/HHmcLY59Zdu3xJFxGG94srtb7SVFRdtjxSDuyNvGlyqzaEpVOz
	5ff5gwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZj6-0000000A25A-2rNr;
	Thu, 13 Mar 2025 03:59:20 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZj3-0000000A24i-3Z8o;
	Thu, 13 Mar 2025 03:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741838358; x=1773374358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cYwKWE3qx6aAxxggYpyZsccNMSnGdzKXacMIEiXDO/w=;
  b=kGiEvRdO7ypxyKy9Dq7ERrqi+cRZELn0kZdpKbsZ9OglnTZ44djU0w9U
   rjeUe0OEb+klJuessPL5uKt88muhj50SvsOaN0V2wnozm05W+p53IaV0a
   uPMjbQl9b2Wg4CAEsb+rHQ25D4+EY3Kcb5EWfESAoWiFyVGheoDM4By5P
   pGxliT9RptJ7/9KXDqWxzxRo5rPJYZBFRFLRvjzFf2pvYkgFRVfIYgFZP
   3ynis5t86WFyYFcm33LJOuri/7AwpZX0p4or3qkgFyNo7gqyMVpXQ2Y/T
   B2xA7uHaZV+RuLH6lzZLfwzcuMwJP+qEWPJKV8zq/4PIF8DjTxuCqN9I0
   g==;
X-CSE-ConnectionGUID: cfCqAM0HTAic+o2HVc/1IQ==
X-CSE-MsgGUID: vYz3zlCBQWiurCobKqyfqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68294335"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="68294335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 20:59:17 -0700
X-CSE-ConnectionGUID: Jk/rBPr/R+CE+fsVXvv0Hg==
X-CSE-MsgGUID: rCVWNuURQ4Kucu2VbRCsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="121530505"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Mar 2025 20:59:12 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsZij-00096K-1j;
	Thu, 13 Mar 2025 03:59:01 +0000
Date: Thu, 13 Mar 2025 11:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
	airlied@gmail.com, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
Message-ID: <202503131309.ZzS9Tova-lkp@intel.com>
References: <20250311155120.442633-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311155120.442633-19-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_205917_963678_3CF762B5 
X-CRM114-Status: GOOD (  11.81  )
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250311]
[also build test ERROR on v6.14-rc6]
[cannot apply to drm-exynos/exynos-drm-next rockchip/for-next tegra/for-next drm-xe/drm-xe-next linus/master v6.14-rc6 v6.14-rc5 v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-dumb-buffers-Sanitize-output-on-errors/20250311-235818
base:   next-20250311
patch link:    https://lore.kernel.org/r/20250311155120.442633-19-tzimmermann%40suse.de
patch subject: [PATCH v4 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
config: i386-buildonly-randconfig-003-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131309.ZzS9Tova-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131309.ZzS9Tova-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131309.ZzS9Tova-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:10:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2296:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:80:8: error: call to undeclared function 'drm_mode_size_dumb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
         |               ^
   drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:80:8: note: did you mean 'drm_mode_set_name'?
   include/drm/drm_modes.h:530:6: note: 'drm_mode_set_name' declared here
     530 | void drm_mode_set_name(struct drm_display_mode *mode);
         |      ^
   1 warning and 1 error generated.


vim +/drm_mode_size_dumb +80 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c

    70	
    71	/* -----------------------------------------------------------------------------
    72	 * Frame buffer
    73	 */
    74	
    75	int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
    76				 struct drm_mode_create_dumb *args)
    77	{
    78		int ret;
    79	
  > 80		ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
    81		if (ret)
    82			return ret;
    83	
    84		return drm_gem_dma_dumb_create_internal(file, dev, args);
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

