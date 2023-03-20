Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBCAC7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAIfZI5MtANB1KC8EoacpIKHc7OoMMemT9OkZVfmoAQ=; b=cws+gM1GWDY9ey7b6pXPxmIwhR
	NXX05WEbYSHXrbvuIuCZhWAe1RoDJ5X4DTPOaDqSua2IWFlYrlb9TJHxEgMrR8fliM/uyCS+3tJ+K
	xOfC0PkTV01JfO1svxei/yIj2CRzVmTZ6Pg6Ql6ZgYYveg6K86KkidyCmFilNtv0r9Jewpv37SeFU
	rmj9ukretN+jkd17j/UhczCJeOhNj5IfOT2/k3+2FpSsS49XWKLje3EC17dOWjsrq5pvvh1N5QQCR
	7ZW8w7iMTdghVBT21SsNyWZBHn/qkWMkBI0YEoSQpz6Td8u61zVI5WNWMktSePwiBiyab+4SkzVV8
	L0+c22sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9k7-008Hrp-1g;
	Mon, 20 Mar 2023 07:15:43 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9k4-008Hqz-0b;
	Mon, 20 Mar 2023 07:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679296540; x=1710832540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=96gp98CgPmdI61qm0TB29Gzv3LWLZoLSpLgfOEYGVIo=;
  b=FxDCrjFOsjB+zh082ihP8pUX9rHoDUE5hnX1Ls0/HCKdijBv18i5/p4y
   Nz0WpvDV0YNymY2iz+1SEMZyu0L4L+X9U7ikgyVMYvU7AQjnjVWcNWWmf
   DgpKckF9P5E3PGuv4A+E2Uc5Nw4Q69rAX/Im3hUZpJocaVWlj8vBIzepr
   mBJtdz/wh6SamxYhY8gqOc6i0cYVXPNdLGf5aTXIcHEJh/IKCOIHaxLPg
   tA8dROPvxM7f66C4Vy8aV7A7nvsVR0N9Wm4Wb/uSw00yBt0ZTmUDiBFax
   QQTjpe29FobntXvxrDJT9ZkMeWYa44Gcy7ObszrJOK+HY7q/ac78x5NMs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="337308498"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="337308498"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 00:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="1010362285"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="1010362285"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2023 00:15:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pe9jx-000AtG-0G;
	Mon, 20 Mar 2023 07:15:33 +0000
Date: Mon, 20 Mar 2023 15:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
	Maxime Ripard <maxime@cerno.tech>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [v3, PATCH] drm/mediatek: add dma buffer control for drm plane
 disable
Message-ID: <202303201543.ahrAhliY-lkp@intel.com>
References: <20230320030449.5397-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320030449.5397-1-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_001540_254273_CE7C06F4 
X-CRM114-Status: GOOD (  11.64  )
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

Hi Yongqiang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yongqiang-Niu/drm-mediatek-add-dma-buffer-control-for-drm-plane-disable/20230320-110649
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230320030449.5397-1-yongqiang.niu%40mediatek.com
patch subject: [v3, PATCH] drm/mediatek: add dma buffer control for drm plane disable
config: arm64-randconfig-r001-20230320 (https://download.01.org/0day-ci/archive/20230320/202303201543.ahrAhliY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/ae19fefd6d548a2766bc6d1902c46d5baa39a202
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yongqiang-Niu/drm-mediatek-add-dma-buffer-control-for-drm-plane-disable/20230320-110649
        git checkout ae19fefd6d548a2766bc6d1902c46d5baa39a202
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303201543.ahrAhliY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module mediatek-drm uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

