Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA1EC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 00:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGSX3sPrhOYF2pHPwzv9nMY0XWHV7phvLIGKYFtpfEk=; b=mmeAhjtdXMEV11bfQGnilNz+l2
	JlPPY1bdoD4dSFQuRlo9xUrudp/km+plR+ms8PCa2A52xsBWi5tdmT7c0P9hca8xc0gvMwGv5Zud4
	Q5uHQnFuFhg2/qsI4vlTIF71G3aKu431sqSk8iQW/BxFEyoHJE/0l4HnZAUPypwUoyRmBDsuHIVGv
	mGPimvZ/PVLnhHLcpo8hWdYhEkp01fUfRo9UOxCtQNOKXs4XpmviOadXjBlgHaIEwaW3kgKfT2sQB
	7UtcdT84rjvhNWdmv/BhgNJDIS0LEjGMojEl8iRZFDhwq/i7BV91pzFKg5Gm0g7xZcckefDzoEJ+J
	2eVytDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbrG8-00000006g6N-08ce;
	Thu, 08 Aug 2024 00:44:04 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbrFY-00000006fyJ-0bk3;
	Thu, 08 Aug 2024 00:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723077808; x=1754613808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nMQeQO9juOP/urzyZwNp6oAyWdRfl3fIrxLNYUjD1Yo=;
  b=E/+VWmjzp1gxI1fmHP7QDrqx9fNZeKNegTqinf7iG1GkYntMfykX5Scn
   l4D+kmbGCmhxWHLCtWhvCAtEyjdu7qxpq8PGy/cn5PyHUI8SPsDMavbCz
   s09VHsl7r+8VQfmzeDUzvRl8bKp64V3rfe6l8w4d82LcvtzaX83uwwGG2
   8kADpsGuPRiYVjlEDpYFWbP7U/A56Btp/GTBRh3j9Qqrtp5sODGrnsSJS
   eiLWaMBBDVpil9hzAv2XKuzDq6zwcQVoHTT3j9JG+Hq03P99X1RW9cYxY
   bmVTBlwLzhqWO6Gb4Lby5AYIteRITd1PqzUkqJiHHVv0nhtDQAb3p5wCP
   w==;
X-CSE-ConnectionGUID: zyWsEWLoQGyhd1rljUqI/Q==
X-CSE-MsgGUID: stxxIBsnQXuxjL52JqBgAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38638284"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="38638284"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 17:43:25 -0700
X-CSE-ConnectionGUID: kWCySDzrT2qyKCo25dnpnA==
X-CSE-MsgGUID: HiRH4qizSYOE3YptmFQVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="61446502"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2024 17:43:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbrFQ-0005p2-2U;
	Thu, 08 Aug 2024 00:43:20 +0000
Date: Thu, 8 Aug 2024 08:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>, daniel.almeida@collabora.com,
	mchehab@kernel.org, angelogioacchino.delregno@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jianhua Lin <jianhua.lin@mediatek.com>
Subject: Re: [PATCH v5 1/1] media: mediatek: jpeg: support 34bits
Message-ID: <202408080826.MtdkQQdh-lkp@intel.com>
References: <20240807130835.26739-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807130835.26739-1-jianhua.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_174328_282434_B23C76BC 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Jianhua,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.11-rc2 next-20240807]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianhua-Lin/media-mediatek-jpeg-support-34bits/20240807-211309
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240807130835.26739-1-jianhua.lin%40mediatek.com
patch subject: [PATCH v5 1/1] media: mediatek: jpeg: support 34bits
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240808/202408080826.MtdkQQdh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080826.MtdkQQdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080826.MtdkQQdh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c: In function 'mtk_jpeg_set_enc_src':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:104:39: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     104 |                                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
         |                                       ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: In function 'mtk_jpeg_dec_set_dst_bank0':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:294:23: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     294 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
         |                       ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +104 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c

    87	
    88	void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
    89				  struct vb2_buffer *src_buf)
    90	{
    91		int i;
    92		dma_addr_t dma_addr;
    93		u32 val;
    94		u32 upper;
    95		bool support_34bit = ctx->jpeg->variant->support_34bit;
    96	
    97		for (i = 0; i < src_buf->num_planes; i++) {
    98			dma_addr = vb2_dma_contig_plane_dma_addr(src_buf, i) +
    99				   src_buf->planes[i].data_offset;
   100			if (!i) {
   101				writel(dma_addr, base + JPEG_ENC_SRC_LUMA_ADDR);
   102				if (support_34bit) {
   103					upper = upper_32_bits(dma_addr);
 > 104					val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
   105					writel(val, base + JPEG_ENC_SRC_LUMA_ADDR_EXT);
   106				}
   107			} else {
   108				writel(dma_addr, base + JPEG_ENC_SRC_CHROMA_ADDR);
   109				if (support_34bit) {
   110					upper = upper_32_bits(dma_addr);
   111					val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
   112					writel(val, base + JPEG_ENC_SRC_CHRO_ADDR_EXT);
   113				}
   114			}
   115		}
   116	}
   117	EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_src);
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

