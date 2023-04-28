Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37789C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 06:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+bFugyBZCAYDZftXxUUtIRLE4MdY3Eu+25e91c4qSc=; b=J5+7EYb5TFc+UU9d1kn90RDQzG
	GkXlsdaBYn9HtxTm6bt2u3jNVSrf7WGKxmy7gS7CZSyHgSLIgm9z3dyD1Uw9A+EaWLm58lAvgHezS
	3W8NIjn85p1bJeLSM/8xwZo0LuLrLxHtpN0pO8lUCT4MMUBOEelQyeKBbohRcF9CiwqSLpsmqHSYj
	5+abEbv+77733amB5ul2vTT7H2/GcEzj8yUvcEKISRTACyXCJY16S/IrEluBxuMi9BPFEh2SWntz5
	vfu/uxYic/F9UYVfVbb9iE+WC+IR0iAN4AFmzedIEwNTVUU3CRdbF76fcKwojNMmwiYkco0dcbWwe
	/dwxbPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psHtT-008L62-0N;
	Fri, 28 Apr 2023 06:47:47 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psHtN-008L4P-1E;
	Fri, 28 Apr 2023 06:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682664461; x=1714200461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o1MesbxQUeFFuqPMyIt4zSHtiw8RFkyRrqvlg+0BV7U=;
  b=CbW8fRyfxU0D6Hr8ABqtcQ7uEzOVHfFxlmLZ9fL0Ym58Ec87zQVtvO8g
   +9v6LKd8YyC66MXj0g0oHw/suZr+hnbM834KvQ7o0kOHF7fcOeRk8t5i9
   /2+ZQhvcjCUNDVjeGXbhNo4Z3ukLHiZWYhhfnv1N7fmJbG4Q94T1jjC07
   8TO4sfmc+bpNukTUXe1AiBwTl9HpjZCPsJTdBkMIZwWY3ljh16sTSl13m
   oGs+VHgdEj3ZMqDplJNEuVgGtIbFjONxmrsvCaDmXIptpglNlccg3b4Mr
   KzpgrrJrR/Vk8p2FdV0zA0Xba3Z6qB1Av8gzwZI3QPIZ1rKe7wPZZ34NR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346430027"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="346430027"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 23:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="818893117"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="818893117"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Apr 2023 23:47:23 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psHt4-0000Dp-2F;
	Fri, 28 Apr 2023 06:47:22 +0000
Date: Fri, 28 Apr 2023 14:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] media: mediatek: vcodec: support stateless hevc decoder
Message-ID: <202304281422.UiLLTEo5-lkp@intel.com>
References: <20230428024000.26558-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428024000.26558-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_234741_461913_B5AB9619 
X-CRM114-Status: GOOD (  13.27  )
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

Hi Yunfei,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.3 next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunfei-Dong/media-mediatek-vcodec-support-stateless-hevc-decoder/20230428-104227
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230428024000.26558-1-yunfei.dong%40mediatek.com
patch subject: [PATCH] media: mediatek: vcodec: support stateless hevc decoder
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230428/202304281422.UiLLTEo5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e916526fc9c32f4062d328a41f18d5efd2e2b058
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yunfei-Dong/media-mediatek-vcodec-support-stateless-hevc-decoder/20230428-104227
        git checkout e916526fc9c32f4062d328a41f18d5efd2e2b058
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281422.UiLLTEo5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c: In function 'vdec_hevc_fill_dpb_info':
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:412:29: error: implicit declaration of function 'vb2_find_timestamp' [-Werror=implicit-function-declaration]
     412 |                 vb2_index = vb2_find_timestamp(vq, dpb->timestamp, 0);
         |                             ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:403:33: warning: variable 'vb2_v4l2' set but not used [-Wunused-but-set-variable]
     403 |         struct vb2_v4l2_buffer *vb2_v4l2;
         |                                 ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c: In function 'vdec_hevc_copy_decode_params':
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:593:63: error: 'const struct v4l2_ctrl_hevc_decode_params' has no member named 'num_delta_pocs_of_ref_rps_idx'
     593 |         dst_params->num_delta_pocs_of_ref_rps_idx = src_params->num_delta_pocs_of_ref_rps_idx;
         |                                                               ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c: In function 'vdec_hevc_slice_fill_decode_parameters':
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:636:27: error: 'const struct v4l2_ctrl_hevc_decode_params' has no member named 'num_delta_pocs_of_ref_rps_idx'
     636 |                 dec_params->num_delta_pocs_of_ref_rps_idx;
         |                           ^~
   In file included from drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:11:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c: In function 'vdec_hevc_slice_setup_lat_buffer':
>> drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in expansion of macro 'pr_fmt'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:791:9: note: in expansion of macro 'mtk_vcodec_debug'
     791 |         mtk_vcodec_debug(inst, "lat:trans(0x%llx 0x%llx) err:0x%llx",
         |         ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in expansion of macro 'pr_fmt'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:791:9: note: in expansion of macro 'mtk_vcodec_debug'
     791 |         mtk_vcodec_debug(inst, "lat:trans(0x%llx 0x%llx) err:0x%llx",
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in expansion of macro 'pr_fmt'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:791:9: note: in expansion of macro 'mtk_vcodec_debug'
     791 |         mtk_vcodec_debug(inst, "lat:trans(0x%llx 0x%llx) err:0x%llx",
         |         ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in expansion of macro 'pr_fmt'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:796:9: note: in expansion of macro 'mtk_vcodec_debug'
     796 |         mtk_vcodec_debug(inst, "slice(0x%llx 0x%llx) rprt((0x%llx 0x%llx))",
         |         ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in expansion of macro 'pr_fmt'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:796:9: note: in expansion of macro 'mtk_vcodec_debug'
     796 |         mtk_vcodec_debug(inst, "slice(0x%llx 0x%llx) rprt((0x%llx 0x%llx))",
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in expansion of macro 'pr_fmt'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:796:9: note: in expansion of macro 'mtk_vcodec_debug'
     796 |         mtk_vcodec_debug(inst, "slice(0x%llx 0x%llx) rprt((0x%llx 0x%llx))",
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 9 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in expansion of macro 'pr_fmt'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:796:9: note: in expansion of macro 'mtk_vcodec_debug'
     796 |         mtk_vcodec_debug(inst, "slice(0x%llx 0x%llx) rprt((0x%llx 0x%llx))",
         |         ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/vb2_find_timestamp +412 drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c

   395	
   396	static void vdec_hevc_fill_dpb_info(struct mtk_vcodec_ctx *ctx,
   397					    struct slice_api_hevc_decode_param *decode_params,
   398					    struct mtk_hevc_dpb_info *hevc_dpb_info)
   399	{
   400		const struct slice_hevc_dpb_entry *dpb;
   401		struct vb2_queue *vq;
   402		struct vb2_buffer *vb;
 > 403		struct vb2_v4l2_buffer *vb2_v4l2;
   404		int index, vb2_index;
   405	
   406		vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
   407		for (index = 0; index < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; index++) {
   408			dpb = &decode_params->dpb[index];
   409			if (index >= decode_params->num_active_dpb_entries)
   410				continue;
   411	
 > 412			vb2_index = vb2_find_timestamp(vq, dpb->timestamp, 0);
   413			if (vb2_index < 0) {
   414				dev_err(&ctx->dev->plat_dev->dev,
   415					"Reference invalid: dpb_index(%d) timestamp(%lld)",
   416					index, dpb->timestamp);
   417				continue;
   418			}
   419	
   420			vb = vq->bufs[vb2_index];
   421			vb2_v4l2 = container_of(vb, struct vb2_v4l2_buffer, vb2_buf);
   422			hevc_dpb_info[index].field = dpb->field_pic;
   423	
   424			hevc_dpb_info[index].y_dma_addr =
   425				vb2_dma_contig_plane_dma_addr(vb, 0);
   426			if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
   427				hevc_dpb_info[index].c_dma_addr =
   428					vb2_dma_contig_plane_dma_addr(vb, 1);
   429			else
   430				hevc_dpb_info[index].c_dma_addr =
   431					hevc_dpb_info[index].y_dma_addr +
   432					ctx->picinfo.fb_sz[0];
   433		}
   434	}
   435	
   436	static void vdec_hevc_copy_sps_params(struct mtk_hevc_sps_param *dst_param,
   437					      const struct v4l2_ctrl_hevc_sps *src_param)
   438	{
   439		GET_HEVC_VDEC_PARAM(video_parameter_set_id);
   440		GET_HEVC_VDEC_PARAM(seq_parameter_set_id);
   441		GET_HEVC_VDEC_PARAM(pic_width_in_luma_samples);
   442		GET_HEVC_VDEC_PARAM(pic_height_in_luma_samples);
   443		GET_HEVC_VDEC_PARAM(bit_depth_luma_minus8);
   444		GET_HEVC_VDEC_PARAM(bit_depth_chroma_minus8);
   445		GET_HEVC_VDEC_PARAM(log2_max_pic_order_cnt_lsb_minus4);
   446		GET_HEVC_VDEC_PARAM(sps_max_dec_pic_buffering_minus1);
   447		GET_HEVC_VDEC_PARAM(sps_max_num_reorder_pics);
   448		GET_HEVC_VDEC_PARAM(sps_max_latency_increase_plus1);
   449		GET_HEVC_VDEC_PARAM(log2_min_luma_coding_block_size_minus3);
   450		GET_HEVC_VDEC_PARAM(log2_diff_max_min_luma_coding_block_size);
   451		GET_HEVC_VDEC_PARAM(log2_min_luma_transform_block_size_minus2);
   452		GET_HEVC_VDEC_PARAM(log2_diff_max_min_luma_transform_block_size);
   453		GET_HEVC_VDEC_PARAM(max_transform_hierarchy_depth_inter);
   454		GET_HEVC_VDEC_PARAM(max_transform_hierarchy_depth_intra);
   455		GET_HEVC_VDEC_PARAM(pcm_sample_bit_depth_luma_minus1);
   456		GET_HEVC_VDEC_PARAM(pcm_sample_bit_depth_chroma_minus1);
   457		GET_HEVC_VDEC_PARAM(log2_min_pcm_luma_coding_block_size_minus3);
   458		GET_HEVC_VDEC_PARAM(log2_diff_max_min_pcm_luma_coding_block_size);
   459		GET_HEVC_VDEC_PARAM(num_short_term_ref_pic_sets);
   460		GET_HEVC_VDEC_PARAM(num_long_term_ref_pics_sps);
   461		GET_HEVC_VDEC_PARAM(chroma_format_idc);
   462		GET_HEVC_VDEC_PARAM(sps_max_sub_layers_minus1);
   463	
   464		GET_HEVC_VDEC_FLAG(separate_colour_plane,
   465				   V4L2_HEVC_SPS_FLAG_SEPARATE_COLOUR_PLANE);
   466		GET_HEVC_VDEC_FLAG(scaling_list_enabled,
   467				   V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED);
   468		GET_HEVC_VDEC_FLAG(amp_enabled,
   469				   V4L2_HEVC_SPS_FLAG_AMP_ENABLED);
   470		GET_HEVC_VDEC_FLAG(sample_adaptive_offset,
   471				   V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET);
   472		GET_HEVC_VDEC_FLAG(pcm_enabled,
   473				   V4L2_HEVC_SPS_FLAG_PCM_ENABLED);
   474		GET_HEVC_VDEC_FLAG(pcm_loop_filter_disabled,
   475				   V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED);
   476		GET_HEVC_VDEC_FLAG(long_term_ref_pics_enabled,
   477				   V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT);
   478		GET_HEVC_VDEC_FLAG(sps_temporal_mvp_enabled,
   479				   V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED);
   480		GET_HEVC_VDEC_FLAG(strong_intra_smoothing_enabled,
   481				   V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED);
   482	}
   483	
   484	static void vdec_hevc_copy_pps_params(struct mtk_hevc_pps_param *dst_param,
   485					      const struct v4l2_ctrl_hevc_pps *src_param)
   486	{
   487		int i;
   488	
   489		GET_HEVC_VDEC_PARAM(pic_parameter_set_id);
   490		GET_HEVC_VDEC_PARAM(num_extra_slice_header_bits);
   491		GET_HEVC_VDEC_PARAM(num_ref_idx_l0_default_active_minus1);
   492		GET_HEVC_VDEC_PARAM(num_ref_idx_l1_default_active_minus1);
   493		GET_HEVC_VDEC_PARAM(init_qp_minus26);
   494		GET_HEVC_VDEC_PARAM(diff_cu_qp_delta_depth);
   495		GET_HEVC_VDEC_PARAM(pps_cb_qp_offset);
   496		GET_HEVC_VDEC_PARAM(pps_cr_qp_offset);
   497		GET_HEVC_VDEC_PARAM(num_tile_columns_minus1);
   498		GET_HEVC_VDEC_PARAM(num_tile_rows_minus1);
   499		GET_HEVC_VDEC_PARAM(init_qp_minus26);
   500		GET_HEVC_VDEC_PARAM(diff_cu_qp_delta_depth);
   501		GET_HEVC_VDEC_PARAM(pic_parameter_set_id);
   502		GET_HEVC_VDEC_PARAM(num_extra_slice_header_bits);
   503		GET_HEVC_VDEC_PARAM(num_ref_idx_l0_default_active_minus1);
   504		GET_HEVC_VDEC_PARAM(num_ref_idx_l1_default_active_minus1);
   505		GET_HEVC_VDEC_PARAM(pps_beta_offset_div2);
   506		GET_HEVC_VDEC_PARAM(pps_tc_offset_div2);
   507		GET_HEVC_VDEC_PARAM(log2_parallel_merge_level_minus2);
   508	
   509		for (i = 0; i < 20; i++)
   510			dst_param->column_width_minus1[i] = src_param->column_width_minus1[i];
   511		for (i = 0; i < 22; i++)
   512			dst_param->row_height_minus1[i] = src_param->row_height_minus1[i];
   513	
   514		GET_HEVC_VDEC_FLAG(dependent_slice_segment_enabled,
   515				   V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED);
   516		GET_HEVC_VDEC_FLAG(output_flag_present,
   517				   V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT);
   518		GET_HEVC_VDEC_FLAG(sign_data_hiding_enabled,
   519				   V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED);
   520		GET_HEVC_VDEC_FLAG(cabac_init_present,
   521				   V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT);
   522		GET_HEVC_VDEC_FLAG(constrained_intra_pred,
   523				   V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED);
   524		GET_HEVC_VDEC_FLAG(transform_skip_enabled,
   525				   V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED);
   526		GET_HEVC_VDEC_FLAG(cu_qp_delta_enabled,
   527				   V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED);
   528		GET_HEVC_VDEC_FLAG(pps_slice_chroma_qp_offsets_present,
   529				   V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT);
   530		GET_HEVC_VDEC_FLAG(weighted_pred,
   531				   V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED);
   532		GET_HEVC_VDEC_FLAG(weighted_bipred,
   533				   V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED);
   534		GET_HEVC_VDEC_FLAG(transquant_bypass_enabled,
   535				   V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED);
   536		GET_HEVC_VDEC_FLAG(pps_flag_tiles_enabled,
   537				   V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
   538		GET_HEVC_VDEC_FLAG(entropy_coding_sync_enabled,
   539				   V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED);
   540		GET_HEVC_VDEC_FLAG(loop_filter_across_tiles_enabled,
   541				   V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED);
   542		GET_HEVC_VDEC_FLAG(pps_loop_filter_across_slices_enabled,
   543				   V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED);
   544		GET_HEVC_VDEC_FLAG(deblocking_filter_override_enabled,
   545				   V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED);
   546		GET_HEVC_VDEC_FLAG(pps_disable_deflocking_filter,
   547				   V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER);
   548		GET_HEVC_VDEC_FLAG(lists_modification_present,
   549				   V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT);
   550		GET_HEVC_VDEC_FLAG(slice_segment_header_extersion_present,
   551				   V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT);
   552		GET_HEVC_VDEC_FLAG(deblocking_filter_control_present,
   553				   V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT);
   554		GET_HEVC_VDEC_FLAG(uniform_spacing,
   555				   V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING);
   556	}
   557	
   558	static void vdec_hevc_copy_scaling_matrix(struct slice_api_hevc_scaling_matrix *dst_matrix,
   559						  const struct v4l2_ctrl_hevc_scaling_matrix *src_matrix)
   560	{
   561		memcpy(dst_matrix, src_matrix, sizeof(*src_matrix));
   562	}
   563	
   564	static void
   565	vdec_hevc_copy_decode_params(struct slice_api_hevc_decode_param *dst_params,
   566				     const struct v4l2_ctrl_hevc_decode_params *src_params,
   567				     const struct v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX])
   568	{
   569		struct slice_hevc_dpb_entry *dst_entry;
   570		const struct v4l2_hevc_dpb_entry *src_entry;
   571		int i;
   572	
   573		for (i = 0; i < ARRAY_SIZE(dst_params->dpb); i++) {
   574			dst_entry = &dst_params->dpb[i];
   575			src_entry = &dpb[i];
   576	
   577			dst_entry->timestamp = src_entry->timestamp;
   578			dst_entry->flags = src_entry->flags;
   579			dst_entry->field_pic = src_entry->field_pic;
   580			dst_entry->pic_order_cnt_val = src_entry->pic_order_cnt_val;
   581	
   582			dst_params->poc_st_curr_before[i] = src_params->poc_st_curr_before[i];
   583			dst_params->poc_st_curr_after[i] = src_params->poc_st_curr_after[i];
   584			dst_params->poc_lt_curr[i] = src_params->poc_lt_curr[i];
   585		}
   586	
   587		dst_params->pic_order_cnt_val = src_params->pic_order_cnt_val;
   588		dst_params->short_term_ref_pic_set_size = src_params->short_term_ref_pic_set_size;
   589		dst_params->long_term_ref_pic_set_size = src_params->long_term_ref_pic_set_size;
   590		dst_params->num_active_dpb_entries = src_params->num_active_dpb_entries;
   591		dst_params->num_poc_st_curr_before = src_params->num_poc_st_curr_before;
   592		dst_params->num_poc_st_curr_after = src_params->num_poc_st_curr_after;
 > 593		dst_params->num_delta_pocs_of_ref_rps_idx = src_params->num_delta_pocs_of_ref_rps_idx;
   594		dst_params->num_poc_lt_curr = src_params->num_poc_lt_curr;
   595		dst_params->flags = src_params->flags;
   596	}
   597	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

