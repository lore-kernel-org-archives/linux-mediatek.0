Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7563EC04A6A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 07:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fd677BkogHm3LkB/Ls/Y8AzINoXkeRg+34bzvD2EOrY=; b=fEUvCy8PNq5GlLU5M9G+emHMxj
	wcWVaWed49VgY/V52e4v5C32vCWMHVZTAmU3dfPveLgYlV/7CKBgCoygHac91pVS59CIunkKATn5o
	AL6z2eYLeuq1/p4ckkHY7M+Yf13k/mQSmGD0nN0dcA5hOA9A+SCRA9CsoTXPAG8bUVEg9dgVCtXPe
	W9iQFNJgMxoRQivRijat0lMuLs4tYXD+xMmx4ud/XW4F64Jtyu984cDpXCQZ668lHeFMtYYfNTIlJ
	SXgZXH1RpdZ2yZX+7HrLlXTfFtSvUEbhtc8R7H7Y19h6coxzYOy8uU4lVBEGVSuzwrc02UbZtCGfu
	HkNHt3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRp5g-00Bl9H-06;
	Fri, 04 Aug 2023 07:19:16 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRp5d-00Bl77-0J;
	Fri, 04 Aug 2023 07:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691133553; x=1722669553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BDuVT36s7rZhAHeXZPbnbKNVyVqHUNqlGW4Nm9uSNYM=;
  b=aG2WEULvsqOTamEEPWMbH5JqH05phEk79t7s83ZJji/xwuem+WMt5Q2c
   PrmoEZXJDYWmWIaSoCONbZ3QBgYl9KGiGDxmV1fzEm3GWtCJWfuBJPEzF
   TCUsgxyRmIZxVIG0ZRgBBDXtVFW6R/V4Fg+22BLY6D8IZo5Yr5T7goD7i
   FVeO3rZAYh7334O0Yl9XkhS7SXy5iIvYtXCixB8yjLc4C9+efNbbAsFz2
   j8OreQFtUhvtEDe6F1+jUHb/cKt1s2mgky/X86Pog2eU5vPgO+t4sT5VK
   pDYjqMSDmPoXwTGuILWwarSsmhx45UY6DYui1k9NuVWKz5lhCR908vSPO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373737470"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="373737470"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 00:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="759451252"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="759451252"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2023 00:19:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRp5X-0002ij-2o;
	Fri, 04 Aug 2023 07:19:07 +0000
Date: Fri, 4 Aug 2023 15:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v9 07/16] drm/mediatek: aal: Use bitfield macros
Message-ID: <202308041431.xXkaXQ8u-lkp@intel.com>
References: <20230803110214.163645-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803110214.163645-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_001913_195885_39EEC50B 
X-CRM114-Status: GOOD (  15.79  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on pza/reset/next]
[cannot apply to pza/imx-drm/next mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230803-190918
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230803110214.163645-8-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v9 07/16] drm/mediatek: aal: Use bitfield macros
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230804/202308041431.xXkaXQ8u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041431.xXkaXQ8u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041431.xXkaXQ8u-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_aal.c: In function 'mtk_aal_config':
>> drivers/gpu/drm/mediatek/mtk_disp_aal.c:63:14: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      63 |         sz = FIELD_PREP(DISP_GAMMA_SIZE_HSIZE, w);
         |              ^~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_disp_aal.c:63:25: error: 'DISP_GAMMA_SIZE_HSIZE' undeclared (first use in this function); did you mean 'DISP_AAL_SIZE_HSIZE'?
      63 |         sz = FIELD_PREP(DISP_GAMMA_SIZE_HSIZE, w);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         DISP_AAL_SIZE_HSIZE
   drivers/gpu/drm/mediatek/mtk_disp_aal.c:63:25: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/mediatek/mtk_disp_aal.c:64:26: error: 'DISP_GAMMA_SIZE_VSIZE' undeclared (first use in this function); did you mean 'DISP_AAL_SIZE_VSIZE'?
      64 |         sz |= FIELD_PREP(DISP_GAMMA_SIZE_VSIZE, h);
         |                          ^~~~~~~~~~~~~~~~~~~~~
         |                          DISP_AAL_SIZE_VSIZE
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +63 drivers/gpu/drm/mediatek/mtk_disp_aal.c

    55	
    56	void mtk_aal_config(struct device *dev, unsigned int w,
    57				   unsigned int h, unsigned int vrefresh,
    58				   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
    59	{
    60		struct mtk_disp_aal *aal = dev_get_drvdata(dev);
    61		u32 sz;
    62	
  > 63		sz = FIELD_PREP(DISP_GAMMA_SIZE_HSIZE, w);
    64		sz |= FIELD_PREP(DISP_GAMMA_SIZE_VSIZE, h);
    65	
    66		mtk_ddp_write(cmdq_pkt, sz, &aal->cmdq_reg, aal->regs, DISP_AAL_SIZE);
    67		mtk_ddp_write(cmdq_pkt, sz, &aal->cmdq_reg, aal->regs, DISP_AAL_OUTPUT_SIZE);
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

