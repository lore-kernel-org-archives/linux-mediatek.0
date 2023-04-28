Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCC2C77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7D0+YocoeJvf1thUGaGSO463SdmHYCVEGmBaguCXaH0=; b=23Uv8q9zxTcUmzuwJHVHfGAmY8
	TX9/fGX4JuWYJMrmlj45x2szKVc8awbG0PUbtiJJrajF/Xocq07jEhKK9h3UtP9QHeaqMHA/Er5Ky
	9Jye4xJUi5VZJdffVF2bbdIiuBUC1y7H6oLwsAHCRXCKyFFhxXRfAUJuG8tn9C/tBsd8U6NNlzDab
	D+2Ra1V9LrgcKC4voiG9csEnaFwAA2Zn2BuEu9PlFfBaAP2KjXGmoDyiw14EB6/IbLkvbISJoP3lb
	Ew3nQ6bQngQz9NW3XQcAfe/p9K45sAv3DH8KFsQno3+Jbu5kuj+E/DAM8OCC6DsGmTlLlx7ceOmf4
	RFDNwHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psMXb-009NCU-2j;
	Fri, 28 Apr 2023 11:45:31 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psMXW-009N63-0g;
	Fri, 28 Apr 2023 11:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682682325; x=1714218325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rBbdv+hk3UP8M0WMEzt4+wWIQYS5wnCgtva4F2d/DLY=;
  b=gbe23I3nmbcQ99dJWXtTYKtBvR+x1qYa4Om146pQ93mCLwCl1JYClzyY
   L7vCGJA97m3vw6KaGAvOJJnxhZ+DyDt7+Tu25dfwCMJvmGDJz6MAbVUa3
   MkFjCNvjIpM7NYUCLTXlpFA8aJZuHbISTRF7DVZiIaDJPwK/GDikr5L6l
   Yo9pk1/yI//MTacbWVYbhwi/Vccby0HTF87o9YfSGLPAxBeKXZzvRqJJe
   xFrX/DgtPlvCbPKMd7nxvQv92bbcEk9U1nrcMLQsXFFyU5DmGjnwCM41f
   gImjdeIJKW0BZLxaoL28Y7M/6fKHLBAemJ4mq8MuNhzz8JUy9YRycWQdg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="349750750"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="349750750"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 04:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="645092016"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="645092016"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Apr 2023 04:42:31 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psMUh-0000Ov-0s;
	Fri, 28 Apr 2023 11:42:31 +0000
Date: Fri, 28 Apr 2023 19:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	"Nicolas F . R . A . Prado" <nfraprado@collabora.com>
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
Subject: Re: [PATCH v2] media: mediatek: vcodec: support stateless hevc
 decoder
Message-ID: <202304281935.cHbo4d1P-lkp@intel.com>
References: <20230428082329.28606-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428082329.28606-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_044526_398386_F7FC8511 
X-CRM114-Status: GOOD (  15.10  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.3 next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunfei-Dong/media-mediatek-vcodec-support-stateless-hevc-decoder/20230428-162427
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230428082329.28606-1-yunfei.dong%40mediatek.com
patch subject: [PATCH v2] media: mediatek: vcodec: support stateless hevc decoder
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230428/202304281935.cHbo4d1P-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/193b8e8eece4506c90eac97b973ef059aaf5c0e1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yunfei-Dong/media-mediatek-vcodec-support-stateless-hevc-decoder/20230428-162427
        git checkout 193b8e8eece4506c90eac97b973ef059aaf5c0e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281935.cHbo4d1P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c: In function 'vdec_hevc_fill_dpb_info':
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:412:24: warning: ordered comparison of pointer with integer zero [-Wextra]
     412 |                 if (vb < 0) {
         |                        ^
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c: In function 'vdec_hevc_copy_decode_params':
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:587:63: error: 'const struct v4l2_ctrl_hevc_decode_params' has no member named 'num_delta_pocs_of_ref_rps_idx'
     587 |         dst_params->num_delta_pocs_of_ref_rps_idx = src_params->num_delta_pocs_of_ref_rps_idx;
         |                                                               ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c: In function 'vdec_hevc_slice_fill_decode_parameters':
   drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c:630:27: error: 'const struct v4l2_ctrl_hevc_decode_params' has no member named 'num_delta_pocs_of_ref_rps_idx'
     630 |                 dec_params->num_delta_pocs_of_ref_rps_idx;
         |                           ^~


vim +412 drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c

   395	
   396	static void vdec_hevc_fill_dpb_info(struct mtk_vcodec_ctx *ctx,
   397					    struct slice_api_hevc_decode_param *decode_params,
   398					    struct mtk_hevc_dpb_info *hevc_dpb_info)
   399	{
   400		const struct slice_hevc_dpb_entry *dpb;
   401		struct vb2_queue *vq;
   402		struct vb2_buffer *vb;
   403		int index;
   404	
   405		vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
   406		for (index = 0; index < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; index++) {
   407			dpb = &decode_params->dpb[index];
   408			if (index >= decode_params->num_active_dpb_entries)
   409				continue;
   410	
   411			vb = vb2_find_buffer(vq, dpb->timestamp);
 > 412			if (vb < 0) {
   413				dev_err(&ctx->dev->plat_dev->dev,
   414					"Reference invalid: dpb_index(%d) timestamp(%lld)",
   415					index, dpb->timestamp);
   416				continue;
   417			}
   418	
   419			hevc_dpb_info[index].field = dpb->field_pic;
   420	
   421			hevc_dpb_info[index].y_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
   422			if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
   423				hevc_dpb_info[index].c_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
   424			else
   425				hevc_dpb_info[index].c_dma_addr =
   426					hevc_dpb_info[index].y_dma_addr + ctx->picinfo.fb_sz[0];
   427		}
   428	}
   429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

