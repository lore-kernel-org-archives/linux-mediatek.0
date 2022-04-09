Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D18C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Apr 2022 05:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMTg83Df4xL4rtX/WhCWjaQOhpRl6nYqVljw2nzLOKA=; b=4kxUmry9nOMFIh
	OOQ2tTVl5Gg23Qe8VhpCTocr2Ne/yYVRNWBv/EmFqJOS+HgMf43HKwOoP7n4rhq4Hp7JA/PYRwFfb
	5WfJf+ZgYtjtQ12oC2Ekf8LRxpadnSiDr2GwMlA89Ug5/Y2X88q93DT3RfZkDHSupa19i4SodrtyT
	2+fymcS3aQjj+vm71IWK9kYQzcpeX8UFXwQu4QrHQwcaIKYuUgjFuHwH7e47PAupfUYsWbBQv6Vod
	lCEN7m0N/KUqj4qWqO3hZvM0U8H1BsLIHjGHoWLzokE5M0U2s6viIXXAPePIdDYOn3gzPfsthCfva
	LxQjq7SHOvHLfUUi9FEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd3if-002L4o-Jp; Sat, 09 Apr 2022 05:33:09 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd3ib-002L2F-7I; Sat, 09 Apr 2022 05:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649482385; x=1681018385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VI8FWE1dGcaXVLEWOk5YvZUOuYotXV+G+WRr6XZpzas=;
 b=dfkihQDVFQjQUN4TREXO2IOXHHELJvZFuhWMGtYP0vnpB6ZbvVeOAJ+4
 YrE9EKD81ljO7DYKJPOOhS2tRCkoTMaQF5OISbRjhFAlL+pTQHGNGzwR7
 T1XLEDASFxXPm9ReIpiDDGZ3Kxl57lYizBgvkisEdhaCq+y1U3Dg3TqEM
 iNnYJW67dRfMdG44peSVpwAXs33WM3s23j4ALRjqzkxM9jJbpf7jvPNBb
 RrP1hQ3iFUW+4D+2JUrtVc0WQJfUPkQcM1f0sTGwrwQyUCxcCBV5nrhZE
 bRldOlmDnF7tNlrt5Z/NuYQW4Wvasn982gJUHPHyROWfTh8AgQF2+Kgtw w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="348198876"
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; d="scan'208";a="348198876"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 22:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; d="scan'208";a="852420338"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 08 Apr 2022 22:32:57 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nd3iS-0000uY-Mr;
 Sat, 09 Apr 2022 05:32:56 +0000
Date: Sat, 9 Apr 2022 13:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil <hverkuil@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Cc: kbuild-all@lists.01.org, linux-media@vger.kernel.org,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9, 16/17] media: mediatek: vcodec: support stateless VP9
 decoding
Message-ID: <202204091319.iO0pMmRf-lkp@intel.com>
References: <20220408120240.29571-17-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408120240.29571-17-yunfei.dong@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_223305_382976_05035ECB 
X-CRM114-Status: GOOD (  14.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Yunfei,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc1 next-20220408]
[cannot apply to remoteproc/rproc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunfei-Dong/media-mediatek-vcodec-Add-vdec-enable-disable-hardware-helpers/20220408-210244
base:   git://linuxtv.org/media_tree.git master
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220409/202204091319.iO0pMmRf-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/251c7c77f6690881357df39867a32a03eb7db3b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yunfei-Dong/media-mediatek-vcodec-Add-vdec-enable-disable-hardware-helpers/20220408-210244
        git checkout 251c7c77f6690881357df39867a32a03eb7db3b7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:12:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c: In function 'vdec_vp9_slice_lat_decode':
>> drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'long long unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in expansion of macro 'pr_fmt'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dynamic_func_call'
     152 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:162:9: note: in expansion of macro '_dynamic_func_call'
     162 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:570:9: note: in expansion of macro 'dynamic_pr_debug'
     570 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:1938:9: note: in expansion of macro 'mtk_vcodec_debug'
    1938 |         mtk_vcodec_debug(instance, "lat dma addr: 0x%lx 0x%lx\n",
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'dma_addr_t' {aka 'long long unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in expansion of macro 'pr_fmt'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dynamic_func_call'
     152 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:162:9: note: in expansion of macro '_dynamic_func_call'
     162 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:570:9: note: in expansion of macro 'dynamic_pr_debug'
     570 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:1938:9: note: in expansion of macro 'mtk_vcodec_debug'
    1938 |         mtk_vcodec_debug(instance, "lat dma addr: 0x%lx 0x%lx\n",
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c: In function 'vdec_vp9_slice_core_decode':
>> drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'long long unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in expansion of macro 'pr_fmt'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dynamic_func_call'
     152 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:162:9: note: in expansion of macro '_dynamic_func_call'
     162 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:570:9: note: in expansion of macro 'dynamic_pr_debug'
     570 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:2007:9: note: in expansion of macro 'mtk_vcodec_debug'
    2007 |         mtk_vcodec_debug(instance, "core dma_addr_end 0x%lx\n", pfc->vsi.trans.dma_addr_end);
         |         ^~~~~~~~~~~~~~~~


vim +29 drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h

4e855a6efa5470 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h Tiffany Lin      2016-05-03  27  
71c789760ff9ba drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h Dafna Hirschfeld 2021-11-17  28  #undef pr_fmt
71c789760ff9ba drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h Dafna Hirschfeld 2021-11-17 @29  #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
4e855a6efa5470 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h Tiffany Lin      2016-05-03  30  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
