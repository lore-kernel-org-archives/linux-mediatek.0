Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C859BC28B28
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 02:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faQe9BCRCOP85POSA2ct374W3d3ci+CWNbY6HYBflDw=; b=LFYi+jjBZASwJTl+KP3ccjuMej
	k207nsNhkpKkKHldr2bFxiQjKXM2ElpMHDdBUMg6MTEbpXgUAxUx0HRqQWKt84F2kXIDgrmHYoc+R
	fXSM4K1fTx6Wd0ds7wRZEgu4lWar0aGFyfKEdCC7NiycRa/L9GNgeE9Lxu0usp1ZVTB90u71lHNap
	t5wdaQ2wREJpNwqjEBk1TcB33bZIT/OgXigeQCiw4d37Wrfvv2QiWGGwGMqmddwDiz6HWZmHqghDB
	zb5iXF6C4v0BlYGDkiV+4r/1TbOdPRmadrQNeSFC4megnYD/aWeQ1rh0XvvLvCw62dZY0tJVg/LQr
	9KIXSqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsY78-00000009uTx-2lRI;
	Thu, 13 Mar 2025 02:16:02 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsY75-00000009uSl-254v;
	Thu, 13 Mar 2025 02:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741832159; x=1773368159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=96yJDyEP9BeK2cVK+9MUvmIHjdk7wR1LKgFfN3+p/fM=;
  b=G84TJZqugmG+cV2GRcJA7EejKnBYR0pjZP90LE3ccCKyLv7KBMjaqMhT
   zVyk6YCI7/tO/kZudICx5EWKOU8VFx0QCVGx5L3CuJ76G0PITa9edoetv
   mMWkWT8igplhb4JK89C3yZQjYiC4E++NwaFZrtom6s39asJ2hFoWXJldS
   IJPboUJQDhd20UjYrQM07NK1jNM0XDh9XdbJ6eJCQmXjxV2RWQVmj+8C7
   N/+28tnoc5sAAJWmWDPlr9uoN/vQ20hE/oBit76ULEIs+X0MxL/7lX2fC
   xP8m09RAkhpzLJrNYEKm2pUeK41EilJiXvYZAELNVLYqeF240+Vs/QqOp
   A==;
X-CSE-ConnectionGUID: NMv97ZgvT3SFNdsk37+7WQ==
X-CSE-MsgGUID: SB1eTCYVQ4C5CIVt8CWcjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43038841"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="43038841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 19:15:55 -0700
X-CSE-ConnectionGUID: KHahmpZOTNOqvrR+C7Song==
X-CSE-MsgGUID: H65afRTcQ5CspG2G7V7fvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125887063"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2025 19:15:31 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsY6V-000936-1q;
	Thu, 13 Mar 2025 02:15:25 +0000
Date: Thu, 13 Mar 2025 10:15:12 +0800
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
Message-ID: <202503130956.VyNIuYfU-lkp@intel.com>
References: <20250311155120.442633-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311155120.442633-19-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_191559_632173_9F9F7605 
X-CRM114-Status: GOOD (  10.35  )
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
config: powerpc64-randconfig-003-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130956.VyNIuYfU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130956.VyNIuYfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130956.VyNIuYfU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c: In function 'rzg2l_du_dumb_create':
>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:80:15: error: implicit declaration of function 'drm_mode_size_dumb'; did you mean 'drm_mode_set_name'? [-Wimplicit-function-declaration]
      80 |         ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
         |               ^~~~~~~~~~~~~~~~~~
         |               drm_mode_set_name


vim +80 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c

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

