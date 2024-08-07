Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34B8C52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 22:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYAuhRQXUyXqH6K8Jxi3hDjLjN8SaOmsrIvfzTDmcv8=; b=eXtHIEqWi8PZQ+6fMMzSPRfi2G
	tPUacpYAfYeOMp7i1twtM1beQO9IhH1Orb806fmN02u3UYGfe8qIYCuy96UeyCPt/rT1Z9f4UZaJR
	NT9e034kuY7VTCgKYDUuDcgLAmsHz/+u0nRMXqXA+F0st2AbOxucfMwzor0HAf6LsIATGMO58HwsR
	9yjGddcPtOrsv9QPbANxTGky0DdEglgoIqxtiSMIovGA6bhcT1mH0w0mTCoYBg5gkuietBRxaPAmB
	IO1Pft33IxLipuc32JY5ztkALmiqVAPXEQgeBW1ZQFlv5k0o7tv/GGmzBahDvj/IwT44NGrEBvDDN
	Sm4N7/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbp0m-00000006QYo-1feb;
	Wed, 07 Aug 2024 22:20:04 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbp0C-00000006QU7-2dWy;
	Wed, 07 Aug 2024 22:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723069169; x=1754605169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IVYXIWKGlvai2Nw4bIQ4c+3y+TNTnHUC1vLvdJPUyXM=;
  b=QlQOOR9uzCvb4CehmpAkPXayy/3YdQAcrDWoYKl537iQyEWy9UYJlqva
   gZCpACExdbiVb/hZIpigaxBCh2pX+dUPCihP6Ky72YbzgQes66bZq/ovq
   GcWE/1jhAfPi5MMa//XdTooyd/bEKEagbq63jtmiBkfWqazGDOl6W7PtP
   e7ThhUK5sBFjByLNG5Go23DkX/CbDG12l76hkFT/sxhLGKw4OUjk1j/Vf
   68mFVgAjLAb0Be6/NNnSBJoZw4efLndxZDiE7dRf9TJTqW+SJ3HZghZPl
   lH9Ak4BHva+UmIulK9y2Qibv3t1VxoObHgKGtooV+0v/FJ9F6kGrp8J51
   w==;
X-CSE-ConnectionGUID: rM7q620aTRqJ9UfGhoOnSg==
X-CSE-MsgGUID: 2cNMO7czQVWrpixdA1huUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31839794"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="31839794"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 15:19:26 -0700
X-CSE-ConnectionGUID: JCRXln45QsOASf/GHJjkFg==
X-CSE-MsgGUID: Mr1BAUkySh6+SJtqhfgZ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="56686251"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2024 15:19:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbp05-0005lG-0M;
	Wed, 07 Aug 2024 22:19:21 +0000
Date: Thu, 8 Aug 2024 06:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>, daniel.almeida@collabora.com,
	mchehab@kernel.org, angelogioacchino.delregno@collabora.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jianhua Lin <jianhua.lin@mediatek.com>
Subject: Re: [PATCH v5 1/1] media: mediatek: jpeg: support 34bits
Message-ID: <202408080501.8b0EGVQW-lkp@intel.com>
References: <20240807130835.26739-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807130835.26739-1-jianhua.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_151928_753385_BFF60C72 
X-CRM114-Status: GOOD (  13.78  )
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240808/202408080501.8b0EGVQW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080501.8b0EGVQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080501.8b0EGVQW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:18:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2669:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:104:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     104 |                                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
         |                                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:111:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     111 |                                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
         |                                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:138:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     138 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
         |                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:144:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     144 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
         |                       ^
   7 warnings and 4 errors generated.
--
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:18:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2669:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:294:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     294 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
         |                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:312:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     312 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
         |                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:353:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     353 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(ptr));
         |                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:367:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     367 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr));
         |                       ^
   7 warnings and 4 errors generated.


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

