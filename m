Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0C5C77B78
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Apr 2023 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cGm1z9abw9aQb16RsR4ZhsCpXEGAOIaL/20KwlX1Bk=; b=JGTy5wn87m9AL8NIy3rpp8P0zf
	fHEeyz6ZHc3WfTnH7tmGtAjWHlkCgQSy9Po90kHpJ6Ptjm7mtcm1ksKRLXHxJcvNmEryI76tX9HcI
	nfqvl4N38Osnbu2IZP3sJas/wtuzaLFlvsiKe16Ul6gkl1RT832JFXaFrZF1PTAksg9dAcvBpIK4o
	40aD8TxRfeYD/CiGn41givxclPoDoYin7lnRkIXNiriGLV4VDEPkkF/dFdycenVBx7DaKDPwSUljv
	OlvXSY/57lOzZMTVJvG2HYjz35l486xTXS7Ys/K8ua8nUSJ7RsB6KgMbrKVjGOFVucpTTk3xYXsJr
	12gNTWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqKcQ-00DRmk-03;
	Sat, 22 Apr 2023 21:18:06 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqKcM-00DRm4-28;
	Sat, 22 Apr 2023 21:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682198282; x=1713734282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eTYnPvF9fN3o1kgqHDQFSMFOfgmWEAjhvZwZlajfpiI=;
  b=iIDJ04h7mKLRacOVrV6KZYgXX9LR1YXk+bMewHvNVkFxeBlSPv7EBBq6
   +rt5CzU75lO4Q59SMqkuXxP4r/XT+z6QTZIj70qFzA4tBzE9Mat2Fc5Gf
   ot7/h25Mrt40RsOLFVfSkERmiLvk/XeGv+N8Ugmr9dkdMQIpmXqxI6jqE
   a54qt+UShI1lP/GSvs+FiHIIkH5LpIWzUK9dorXCrxQ/7rVhdvqb6OA64
   xOial9V0LZTqKWJMwdNeQfQtMeUETMggc5/t4P8dU283bIFDC7xCGyMc5
   LQU0liYWRUZrTH50rTG20st5cYzvjtFIdF+4ZHpsgvTr0gX8/KTESXg8g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="346219350"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="346219350"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 14:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="836504025"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="836504025"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2023 14:17:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqKcC-000hVU-2Q;
	Sat, 22 Apr 2023 21:17:52 +0000
Date: Sun, 23 Apr 2023 05:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	David Airlie <airlied@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-fbdev@vger.kernel.org, lvc-project@linuxtesting.org,
	dri-devel@lists.freedesktop.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Helge Deller <deller@gmx.de>, amd-gfx@lists.freedesktop.org,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH] video/hdmi: minor fixes for *_infoframe_init
 functions
Message-ID: <202304230527.lMhdvedk-lkp@intel.com>
References: <20230412152910.9486-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230412152910.9486-1-n.zhandarovich@fintech.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230422_141802_774109_ED67EA68 
X-CRM114-Status: GOOD (  11.21  )
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

Hi Nikita,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikita-Zhandarovich/video-hdmi-minor-fixes-for-_infoframe_init-functions/20230421-221128
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230412152910.9486-1-n.zhandarovich%40fintech.ru
patch subject: [Intel-gfx] [PATCH] video/hdmi: minor fixes for *_infoframe_init functions
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230423/202304230527.lMhdvedk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/63c44f02ae13a5f50eadc26f5b45d4ade624f20c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nikita-Zhandarovich/video-hdmi-minor-fixes-for-_infoframe_init-functions/20230421-221128
        git checkout 63c44f02ae13a5f50eadc26f5b45d4ade624f20c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/xen/ drivers/gpu/drm/i915/ drivers/power/supply/ drivers/vdpa/mlx5/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230527.lMhdvedk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_hdmi.c:769:37: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
           if (drm_WARN_ON(encoder->base.dev, ret))
                                              ^~~
   include/drm/drm_print.h:630:19: note: expanded from macro 'drm_WARN_ON'
           drm_WARN((drm), (x), "%s",                                      \
                            ^
   include/drm/drm_print.h:620:7: note: expanded from macro 'drm_WARN'
           WARN(condition, "%s %s: " format,                               \
                ^~~~~~~~~
   include/asm-generic/bug.h:131:25: note: expanded from macro 'WARN'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/gpu/drm/i915/display/intel_hdmi.c:756:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 error generated.


vim +/ret +769 drivers/gpu/drm/i915/display/intel_hdmi.c

b055c8f3ef9f7b drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-07-08  748  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  749  static bool
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  750  intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  751  				 struct intel_crtc_state *crtc_state,
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  752  				 struct drm_connector_state *conn_state)
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-08-03  753  {
7d1675dcb5a16c drivers/gpu/drm/i915/display/intel_hdmi.c Taylor, Clinton A   2022-11-29  754  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  755  	struct hdmi_spd_infoframe *frame = &crtc_state->infoframes.spd.spd;
5adaea799c1c2c drivers/gpu/drm/i915/intel_hdmi.c         Damien Lespiau      2013-08-06  756  	int ret;
5adaea799c1c2c drivers/gpu/drm/i915/intel_hdmi.c         Damien Lespiau      2013-08-06  757  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  758  	if (!crtc_state->has_infoframe)
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  759  		return true;
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-08-03  760  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  761  	crtc_state->infoframes.enable |=
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  762  		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_SPD);
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-08-03  763  
7d1675dcb5a16c drivers/gpu/drm/i915/display/intel_hdmi.c Taylor, Clinton A   2022-11-29  764  	if (IS_DGFX(i915))
63c44f02ae13a5 drivers/gpu/drm/i915/display/intel_hdmi.c Nikita Zhandarovich 2023-04-12  765  		hdmi_spd_infoframe_init(frame, "Intel", "Discrete gfx");
7d1675dcb5a16c drivers/gpu/drm/i915/display/intel_hdmi.c Taylor, Clinton A   2022-11-29  766  	else
63c44f02ae13a5 drivers/gpu/drm/i915/display/intel_hdmi.c Nikita Zhandarovich 2023-04-12  767  		hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx");
7d1675dcb5a16c drivers/gpu/drm/i915/display/intel_hdmi.c Taylor, Clinton A   2022-11-29  768  
3a47ae201e0749 drivers/gpu/drm/i915/display/intel_hdmi.c Pankaj Bharadiya    2020-01-15 @769  	if (drm_WARN_ON(encoder->base.dev, ret))
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  770  		return false;
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  771  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  772  	frame->sdi = HDMI_SPD_SDI_PC;
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  773  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  774  	ret = hdmi_spd_infoframe_check(frame);
3a47ae201e0749 drivers/gpu/drm/i915/display/intel_hdmi.c Pankaj Bharadiya    2020-01-15  775  	if (drm_WARN_ON(encoder->base.dev, ret))
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  776  		return false;
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  777  
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrjälä       2019-02-25  778  	return true;
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-08-03  779  }
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes        2011-08-03  780  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

