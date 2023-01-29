Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BA5C05027
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Jan 2023 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApteKx9wq1DrUb3mDdRNoOD1fW0mloE8pfCK+VExzuc=; b=yN/megpHvJDICW/AgYHi4Oxiat
	s76EeXdOikWR7orzj5HeCQymti2NCYPvcHU5yTCk4R5kgKG9lLFeFXYWRrjh+oitWdcyxNcOQYWqY
	PxzID3v5C7EYEH2zgVpaX3jk8zxUhTuTgoiQFsS+8LW92lNcPoZ9cDirw+vrbUZvTZ30qXj9G64Pu
	sht8MpDZmJbENWDcfV4nD3PTFybD1bQ7Md2LutZFSHKdN7+WcckuhWqr+O0RC/iCcujqBPnWNODOF
	ebTvMTypviMfRuhdBdLyodSeThGtW6Y8ca0a51cAOYObEUb14sZ5qDRsHOeJpaJQk7b4rPYVditbd
	4NggmM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM5ty-001Nex-MD; Sun, 29 Jan 2023 11:31:14 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM5tv-001NeZ-CE
	for linux-mediatek@lists.infradead.org; Sun, 29 Jan 2023 11:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674991871; x=1706527871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=941qYSAT8AewHuWw7L2KMhlt7LAztpslaoA8f27sugc=;
  b=EjBVNm25cdLc0MgNZJzj4A5I2hCkz5QF35W2ZhdKvpR3Ohf2fGC3ceam
   rFXhZmHl2Rx2W7lhdlHsQSPt8aM/0sbVGu+b5+xlzzHyEBdqO1O1fB+U+
   7DOo3FQm3ljMhP2omqVoVfavQKS7/LeANYRANXsidetoLv2TpcUgMktvf
   2qIAtKd9/aiLN2cZjGMCe9300bxbTyJPlz8sYTZYqjZSkuc+ez7ae1z6f
   zXQA6qXCd4qn31kZFd1Dx1jgoerQZP2QOkZLK1Dg9yLRB04an0tAJGa+l
   gyIzqK2R7ifHyr1k9UPhkfl3fFJmLtAamWKKM1rA8TO7TX0PL8mQ6xMo2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="315346493"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="315346493"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 03:31:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="909174613"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="909174613"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jan 2023 03:31:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM5tp-0002lG-0S;
	Sun, 29 Jan 2023 11:31:05 +0000
Date: Sun, 29 Jan 2023 19:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Green <greenjustin@chromium.org>,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, chunkuang.hu@kernel.org,
	greenjustin@chromium.org, airlied@linux.ie,
	jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
	wenst@chromium.org, matthias.bgg@gmail.com,
	Justin Green <greenjustin@google.com>,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v3] drm/mediatek: Add support for AR30 and BA30
Message-ID: <202301291906.Az5NHf9w-lkp@intel.com>
References: <20230127230123.941930-1-greenjustin@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127230123.941930-1-greenjustin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_033111_540047_9818E2FF 
X-CRM114-Status: GOOD (  14.45  )
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

Hi Justin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Justin-Green/drm-mediatek-Add-support-for-AR30-and-BA30/20230128-112134
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230127230123.941930-1-greenjustin%40google.com
patch subject: [PATCH v3] drm/mediatek: Add support for AR30 and BA30
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291906.Az5NHf9w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c32525cf66e7bbf4e798aef3aafbf88dee5d049c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Justin-Green/drm-mediatek-Add-support-for-AR30-and-BA30/20230128-112134
        git checkout c32525cf66e7bbf4e798aef3aafbf88dee5d049c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/mediatek/ sound/soc/samsung/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_drm_crtc.h:10,
                    from drivers/gpu/drm/mediatek/mtk_disp_aal.c:15:
   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h: In function 'mtk_ddp_comp_supports_10bit':
>> drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h:159:35: warning: returning 'int (*)(struct device *)' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     159 |                 return comp->funcs->supports_10bit;
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~


vim +159 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h

   154	
   155	static inline
   156	int mtk_ddp_comp_supports_10bit(struct mtk_ddp_comp *comp)
   157	{
   158		if (comp->funcs && comp->funcs->supports_10bit)
 > 159			return comp->funcs->supports_10bit;
   160	
   161	        return 0;
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

