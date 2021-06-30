Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36289C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 10:56:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE6B061C9F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 10:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE6B061C9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8WQUo8MU2wwCYRsg1ar7zPliVM8wzh2Cj/d657IuYs=; b=OOM8QRCp0vz2N0iS3a8qpp+cOp
	QAFcUY+QZKBj1lLECDczOJyB85I9xdSQzyBwK2G7//YUZ4CUhEfbz5lTx0yvgRd1FesYgmkMcU3nP
	ouC6VFxIxkA+qmB6M9Lx+crEXP3KUl+H35kOwNZWIyidQ8J7ZeqhYVDY2quB3RnRFJ8k0V1iz7xZe
	GsydpAeGIO0lTFyIbygODkHpIuBbBiKfIqsp1YOzuaN5t7/MD4xcD6ZGSWAtjo13JFy/xkpSZBOYZ
	SQy/Ri/MXHYKNU5F78D+V5G591dhzeSzWEUsBU1gTRe71xyldEm/3cHLXnHNO015JjbU+jN+KLdIW
	G3X71USQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyXtR-00DfJk-Nd; Wed, 30 Jun 2021 10:56:33 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyXtM-00DfIz-3g
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 10:56:32 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="206505719"
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; 
 d="gz'50?scan'50,208,50";a="206505719"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 03:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; 
 d="gz'50?scan'50,208,50";a="641666969"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2021 03:56:22 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lyXtF-0009jP-NT; Wed, 30 Jun 2021 10:56:21 +0000
Date: Wed, 30 Jun 2021 18:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: kbuild-all@lists.01.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH 18/24] iommu/mediatek: Add mtk_iommu_bank_data structure
Message-ID: <202106301825.5KpFCSMU-lkp@intel.com>
References: <20210630023504.18177-19-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <20210630023504.18177-19-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yong,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v5.13 next-20210629]
[cannot apply to iommu/next mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yong-Wu/MT8195-IOMMU-SUPPORT/20210630-103848
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: arm-allyesconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/62a17847a7123ec4214df02c30afad93be62900a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yong-Wu/MT8195-IOMMU-SUPPORT/20210630-103848
        git checkout 62a17847a7123ec4214df02c30afad93be62900a
        # save the attached .config to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:10,
                    from drivers/iommu/mtk_iommu_v1.c:15:
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_tlb_flush_all':
>> drivers/iommu/mtk_iommu_v1.c:131:8: error: 'struct mtk_iommu_data' has no member named 'base'
     131 |    data->base + REG_MMU_INV_SEL);
         |        ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c:132:34: error: 'struct mtk_iommu_data' has no member named 'base'
     132 |  writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
         |                                  ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_tlb_flush_range':
   drivers/iommu/mtk_iommu_v1.c:143:7: error: 'struct mtk_iommu_data' has no member named 'base'
     143 |   data->base + REG_MMU_INV_SEL);
         |       ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c:145:7: error: 'struct mtk_iommu_data' has no member named 'base'
     145 |   data->base + REG_MMU_INVLD_START_A);
         |       ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c:147:7: error: 'struct mtk_iommu_data' has no member named 'base'
     147 |   data->base + REG_MMU_INVLD_END_A);
         |       ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c:148:38: error: 'struct mtk_iommu_data' has no member named 'base'
     148 |  writel_relaxed(F_MMU_INV_RANGE, data->base + REG_MMU_INVALIDATE);
         |                                      ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   In file included from include/linux/swab.h:5,
                    from arch/arm/include/asm/opcodes.h:86,
                    from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from include/linux/memblock.h:13,
                    from drivers/iommu/mtk_iommu_v1.c:10:
   drivers/iommu/mtk_iommu_v1.c:150:38: error: 'struct mtk_iommu_data' has no member named 'base'
     150 |  ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
         |                                      ^~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/arm/include/asm/io.h:303:32: note: in expansion of macro 'readl_relaxed'
     303 | #define readl(c)  ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
         |                                ^~~~~~~~~~~~~
   include/linux/iopoll.h:88:11: note: in expansion of macro 'readl'
      88 |   (val) = op(args); \
         |           ^~
   include/linux/iopoll.h:141:2: note: in expansion of macro 'read_poll_timeout_atomic'
     141 |  read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, false, addr)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:159:2: note: in expansion of macro 'readx_poll_timeout_atomic'
     159 |  readx_poll_timeout_atomic(readl, addr, val, cond, delay_us, timeout_us)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:150:8: note: in expansion of macro 'readl_poll_timeout_atomic'
     150 |  ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:150:38: error: 'struct mtk_iommu_data' has no member named 'base'
     150 |  ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
         |                                      ^~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/arm/include/asm/io.h:303:32: note: in expansion of macro 'readl_relaxed'
     303 | #define readl(c)  ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
         |                                ^~~~~~~~~~~~~
   include/linux/iopoll.h:93:12: note: in expansion of macro 'readl'
      93 |    (val) = op(args); \
         |            ^~
   include/linux/iopoll.h:141:2: note: in expansion of macro 'read_poll_timeout_atomic'
     141 |  read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, false, addr)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:159:2: note: in expansion of macro 'readx_poll_timeout_atomic'
     159 |  readx_poll_timeout_atomic(readl, addr, val, cond, delay_us, timeout_us)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:150:8: note: in expansion of macro 'readl_poll_timeout_atomic'
     150 |  ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:10,
                    from drivers/iommu/mtk_iommu_v1.c:15:
   drivers/iommu/mtk_iommu_v1.c:158:24: error: 'struct mtk_iommu_data' has no member named 'base'
     158 |  writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
         |                        ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_isr':
>> drivers/iommu/mtk_iommu_v1.c:164:37: error: 'struct mtk_iommu_data' has no member named 'm4u_dom'
     164 |  struct mtk_iommu_domain *dom = data->m4u_dom;
         |                                     ^~
   In file included from include/linux/swab.h:5,
                    from arch/arm/include/asm/opcodes.h:86,
                    from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from include/linux/memblock.h:13,
                    from drivers/iommu/mtk_iommu_v1.c:10:
   drivers/iommu/mtk_iommu_v1.c:169:32: error: 'struct mtk_iommu_data' has no member named 'base'
     169 |  int_state = readl_relaxed(data->base + REG_MMU_FAULT_ST);
         |                                ^~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:169:14: note: in expansion of macro 'readl_relaxed'
     169 |  int_state = readl_relaxed(data->base + REG_MMU_FAULT_ST);
         |              ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:170:33: error: 'struct mtk_iommu_data' has no member named 'base'
     170 |  fault_iova = readl_relaxed(data->base + REG_MMU_FAULT_VA);
         |                                 ^~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:170:15: note: in expansion of macro 'readl_relaxed'
     170 |  fault_iova = readl_relaxed(data->base + REG_MMU_FAULT_VA);
         |               ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:173:31: error: 'struct mtk_iommu_data' has no member named 'base'
     173 |  fault_pa = readl_relaxed(data->base + REG_MMU_INVLD_PA);
         |                               ^~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:173:13: note: in expansion of macro 'readl_relaxed'
     173 |  fault_pa = readl_relaxed(data->base + REG_MMU_INVLD_PA);
         |             ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:174:29: error: 'struct mtk_iommu_data' has no member named 'base'
     174 |  regval = readl_relaxed(data->base + REG_MMU_INT_ID);
         |                             ^~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:174:11: note: in expansion of macro 'readl_relaxed'
     174 |  regval = readl_relaxed(data->base + REG_MMU_INT_ID);
         |           ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:190:29: error: 'struct mtk_iommu_data' has no member named 'base'
     190 |  regval = readl_relaxed(data->base + REG_MMU_INT_CONTROL);
         |                             ^~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:190:11: note: in expansion of macro 'readl_relaxed'
     190 |  regval = readl_relaxed(data->base + REG_MMU_INT_CONTROL);
         |           ^~~~~~~~~~~~~
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:10,
                    from drivers/iommu/mtk_iommu_v1.c:15:
   drivers/iommu/mtk_iommu_v1.c:192:29: error: 'struct mtk_iommu_data' has no member named 'base'
     192 |  writel_relaxed(regval, data->base + REG_MMU_INT_CONTROL);
         |                             ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_domain_finalise':
   drivers/iommu/mtk_iommu_v1.c:224:37: error: 'struct mtk_iommu_data' has no member named 'm4u_dom'
     224 |  struct mtk_iommu_domain *dom = data->m4u_dom;
         |                                     ^~
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:10,
                    from drivers/iommu/mtk_iommu_v1.c:15:
   drivers/iommu/mtk_iommu_v1.c:233:26: error: 'struct mtk_iommu_data' has no member named 'base'
     233 |  writel(dom->pgt_pa, data->base + REG_MMU_PT_BASE_ADDR);
         |                          ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c:233:2: note: in expansion of macro 'writel'
     233 |  writel(dom->pgt_pa, data->base + REG_MMU_PT_BASE_ADDR);
         |  ^~~~~~
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_attach_device':
   drivers/iommu/mtk_iommu_v1.c:277:11: error: 'struct mtk_iommu_data' has no member named 'm4u_dom'
     277 |  if (!data->m4u_dom) {
         |           ^~
   drivers/iommu/mtk_iommu_v1.c:278:7: error: 'struct mtk_iommu_data' has no member named 'm4u_dom'
     278 |   data->m4u_dom = dom;
         |       ^~
   drivers/iommu/mtk_iommu_v1.c:281:8: error: 'struct mtk_iommu_data' has no member named 'm4u_dom'
     281 |    data->m4u_dom = NULL;
         |        ^~
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:10,
                    from drivers/iommu/mtk_iommu_v1.c:15:
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_hw_init':
>> drivers/iommu/mtk_iommu_v1.c:488:29: error: 'const struct mtk_iommu_data' has no member named 'base'
     488 |  writel_relaxed(regval, data->base + REG_MMU_CTRL_REG);
         |                             ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c:498:29: error: 'const struct mtk_iommu_data' has no member named 'base'
     498 |  writel_relaxed(regval, data->base + REG_MMU_INT_CONTROL);
         |                             ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c:502:8: error: 'const struct mtk_iommu_data' has no member named 'base'
     502 |    data->base + REG_MMU_IVRP_PADDR);
         |        ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   drivers/iommu/mtk_iommu_v1.c:504:35: error: 'const struct mtk_iommu_data' has no member named 'base'
     504 |  writel_relaxed(F_MMU_DCM_ON, data->base + REG_MMU_DCM);
         |                                   ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
>> drivers/iommu/mtk_iommu_v1.c:506:38: error: 'const struct mtk_iommu_data' has no member named 'irq'
     506 |  if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
         |                                      ^~
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:10,
                    from drivers/iommu/mtk_iommu_v1.c:15:
   drivers/iommu/mtk_iommu_v1.c:508:25: error: 'const struct mtk_iommu_data' has no member named 'base'
     508 |   writel_relaxed(0, data->base + REG_MMU_PT_BASE_ADDR);
         |                         ^~
   arch/arm/include/asm/io.h:299:71: note: in definition of macro 'writel_relaxed'
     299 | #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                       ^
   In file included from include/linux/device.h:15,
                    from drivers/iommu/mtk_iommu_v1.c:14:
   drivers/iommu/mtk_iommu_v1.c:510:55: error: 'const struct mtk_iommu_data' has no member named 'irq'
     510 |   dev_err(data->dev, "Failed @ IRQ-%d Request\n", data->irq);
         |                                                       ^~
   include/linux/dev_printk.h:112:32: note: in definition of macro 'dev_err'
     112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                ^~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_probe':
   drivers/iommu/mtk_iommu_v1.c:567:6: error: 'struct mtk_iommu_data' has no member named 'base'
     567 |  data->base = devm_ioremap_resource(dev, res);
         |      ^~
   drivers/iommu/mtk_iommu_v1.c:568:17: error: 'struct mtk_iommu_data' has no member named 'base'
     568 |  if (IS_ERR(data->base))
         |                 ^~
   drivers/iommu/mtk_iommu_v1.c:569:22: error: 'struct mtk_iommu_data' has no member named 'base'
     569 |   return PTR_ERR(data->base);
         |                      ^~
>> drivers/iommu/mtk_iommu_v1.c:571:6: error: 'struct mtk_iommu_data' has no member named 'irq'
     571 |  data->irq = platform_get_irq(pdev, 0);
         |      ^~
   drivers/iommu/mtk_iommu_v1.c:572:10: error: 'struct mtk_iommu_data' has no member named 'irq'
     572 |  if (data->irq < 0)
         |          ^~
   drivers/iommu/mtk_iommu_v1.c:573:14: error: 'struct mtk_iommu_data' has no member named 'irq'
     573 |   return data->irq;
         |              ^~
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_remove':
   drivers/iommu/mtk_iommu_v1.c:654:32: error: 'struct mtk_iommu_data' has no member named 'irq'
     654 |  devm_free_irq(&pdev->dev, data->irq, data);
         |                                ^~
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_suspend':
   drivers/iommu/mtk_iommu_v1.c:663:27: error: 'struct mtk_iommu_data' has no member named 'base'
     663 |  void __iomem *base = data->base;
         |                           ^~
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_resume':
   drivers/iommu/mtk_iommu_v1.c:677:27: error: 'struct mtk_iommu_data' has no member named 'base'
     677 |  void __iomem *base = data->base;
         |                           ^~
   In file included from include/linux/swab.h:5,
                    from arch/arm/include/asm/opcodes.h:86,
                    from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from include/linux/memblock.h:13,
                    from drivers/iommu/mtk_iommu_v1.c:10:
   drivers/iommu/mtk_iommu_v1.c:679:21: error: 'struct mtk_iommu_data' has no member named 'm4u_dom'
     679 |  writel_relaxed(data->m4u_dom->pgt_pa, base + REG_MMU_PT_BASE_ADDR);
         |                     ^~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:679:2: note: in expansion of macro 'writel_relaxed'
     679 |  writel_relaxed(data->m4u_dom->pgt_pa, base + REG_MMU_PT_BASE_ADDR);
         |  ^~~~~~~~~~~~~~


vim +131 drivers/iommu/mtk_iommu_v1.c

745b6e74704782 Arnd Bergmann    2017-05-11  @15  #include <linux/dma-mapping.h>
b17336c55d8928 Honghui Zhang    2016-06-08   16  #include <linux/dma-iommu.h>
b17336c55d8928 Honghui Zhang    2016-06-08   17  #include <linux/err.h>
b17336c55d8928 Honghui Zhang    2016-06-08   18  #include <linux/interrupt.h>
b17336c55d8928 Honghui Zhang    2016-06-08   19  #include <linux/io.h>
b17336c55d8928 Honghui Zhang    2016-06-08   20  #include <linux/iommu.h>
b17336c55d8928 Honghui Zhang    2016-06-08   21  #include <linux/iopoll.h>
b17336c55d8928 Honghui Zhang    2016-06-08   22  #include <linux/list.h>
8de000cf0265ea Yong Wu          2021-03-26   23  #include <linux/module.h>
b17336c55d8928 Honghui Zhang    2016-06-08   24  #include <linux/of_address.h>
b17336c55d8928 Honghui Zhang    2016-06-08   25  #include <linux/of_iommu.h>
b17336c55d8928 Honghui Zhang    2016-06-08   26  #include <linux/of_irq.h>
b17336c55d8928 Honghui Zhang    2016-06-08   27  #include <linux/of_platform.h>
b17336c55d8928 Honghui Zhang    2016-06-08   28  #include <linux/platform_device.h>
b17336c55d8928 Honghui Zhang    2016-06-08   29  #include <linux/slab.h>
b17336c55d8928 Honghui Zhang    2016-06-08   30  #include <linux/spinlock.h>
b17336c55d8928 Honghui Zhang    2016-06-08   31  #include <asm/barrier.h>
b17336c55d8928 Honghui Zhang    2016-06-08   32  #include <asm/dma-iommu.h>
d4cf5bbd56f5b7 Paul Gortmaker   2018-12-01   33  #include <linux/init.h>
b17336c55d8928 Honghui Zhang    2016-06-08   34  #include <dt-bindings/memory/mt2701-larb-port.h>
b17336c55d8928 Honghui Zhang    2016-06-08   35  #include <soc/mediatek/smi.h>
b17336c55d8928 Honghui Zhang    2016-06-08   36  #include "mtk_iommu.h"
b17336c55d8928 Honghui Zhang    2016-06-08   37  
b17336c55d8928 Honghui Zhang    2016-06-08   38  #define REG_MMU_PT_BASE_ADDR			0x000
b17336c55d8928 Honghui Zhang    2016-06-08   39  
b17336c55d8928 Honghui Zhang    2016-06-08   40  #define F_ALL_INVLD				0x2
b17336c55d8928 Honghui Zhang    2016-06-08   41  #define F_MMU_INV_RANGE				0x1
b17336c55d8928 Honghui Zhang    2016-06-08   42  #define F_INVLD_EN0				BIT(0)
b17336c55d8928 Honghui Zhang    2016-06-08   43  #define F_INVLD_EN1				BIT(1)
b17336c55d8928 Honghui Zhang    2016-06-08   44  
b17336c55d8928 Honghui Zhang    2016-06-08   45  #define F_MMU_FAULT_VA_MSK			0xfffff000
b17336c55d8928 Honghui Zhang    2016-06-08   46  #define MTK_PROTECT_PA_ALIGN			128
b17336c55d8928 Honghui Zhang    2016-06-08   47  
b17336c55d8928 Honghui Zhang    2016-06-08   48  #define REG_MMU_CTRL_REG			0x210
b17336c55d8928 Honghui Zhang    2016-06-08   49  #define F_MMU_CTRL_COHERENT_EN			BIT(8)
b17336c55d8928 Honghui Zhang    2016-06-08   50  #define REG_MMU_IVRP_PADDR			0x214
b17336c55d8928 Honghui Zhang    2016-06-08   51  #define REG_MMU_INT_CONTROL			0x220
b17336c55d8928 Honghui Zhang    2016-06-08   52  #define F_INT_TRANSLATION_FAULT			BIT(0)
b17336c55d8928 Honghui Zhang    2016-06-08   53  #define F_INT_MAIN_MULTI_HIT_FAULT		BIT(1)
b17336c55d8928 Honghui Zhang    2016-06-08   54  #define F_INT_INVALID_PA_FAULT			BIT(2)
b17336c55d8928 Honghui Zhang    2016-06-08   55  #define F_INT_ENTRY_REPLACEMENT_FAULT		BIT(3)
b17336c55d8928 Honghui Zhang    2016-06-08   56  #define F_INT_TABLE_WALK_FAULT			BIT(4)
b17336c55d8928 Honghui Zhang    2016-06-08   57  #define F_INT_TLB_MISS_FAULT			BIT(5)
b17336c55d8928 Honghui Zhang    2016-06-08   58  #define F_INT_PFH_DMA_FIFO_OVERFLOW		BIT(6)
b17336c55d8928 Honghui Zhang    2016-06-08   59  #define F_INT_MISS_DMA_FIFO_OVERFLOW		BIT(7)
b17336c55d8928 Honghui Zhang    2016-06-08   60  
b17336c55d8928 Honghui Zhang    2016-06-08   61  #define F_MMU_TF_PROTECT_SEL(prot)		(((prot) & 0x3) << 5)
b17336c55d8928 Honghui Zhang    2016-06-08   62  #define F_INT_CLR_BIT				BIT(12)
b17336c55d8928 Honghui Zhang    2016-06-08   63  
b17336c55d8928 Honghui Zhang    2016-06-08   64  #define REG_MMU_FAULT_ST			0x224
b17336c55d8928 Honghui Zhang    2016-06-08   65  #define REG_MMU_FAULT_VA			0x228
b17336c55d8928 Honghui Zhang    2016-06-08   66  #define REG_MMU_INVLD_PA			0x22C
b17336c55d8928 Honghui Zhang    2016-06-08   67  #define REG_MMU_INT_ID				0x388
b17336c55d8928 Honghui Zhang    2016-06-08   68  #define REG_MMU_INVALIDATE			0x5c0
b17336c55d8928 Honghui Zhang    2016-06-08   69  #define REG_MMU_INVLD_START_A			0x5c4
b17336c55d8928 Honghui Zhang    2016-06-08   70  #define REG_MMU_INVLD_END_A			0x5c8
b17336c55d8928 Honghui Zhang    2016-06-08   71  
b17336c55d8928 Honghui Zhang    2016-06-08   72  #define REG_MMU_INV_SEL				0x5d8
b17336c55d8928 Honghui Zhang    2016-06-08   73  #define REG_MMU_STANDARD_AXI_MODE		0x5e8
b17336c55d8928 Honghui Zhang    2016-06-08   74  
b17336c55d8928 Honghui Zhang    2016-06-08   75  #define REG_MMU_DCM				0x5f0
b17336c55d8928 Honghui Zhang    2016-06-08   76  #define F_MMU_DCM_ON				BIT(1)
b17336c55d8928 Honghui Zhang    2016-06-08   77  #define REG_MMU_CPE_DONE			0x60c
b17336c55d8928 Honghui Zhang    2016-06-08   78  #define F_DESC_VALID				0x2
b17336c55d8928 Honghui Zhang    2016-06-08   79  #define F_DESC_NONSEC				BIT(3)
b17336c55d8928 Honghui Zhang    2016-06-08   80  #define MT2701_M4U_TF_LARB(TF)			(6 - (((TF) >> 13) & 0x7))
b17336c55d8928 Honghui Zhang    2016-06-08   81  #define MT2701_M4U_TF_PORT(TF)			(((TF) >> 8) & 0xF)
b17336c55d8928 Honghui Zhang    2016-06-08   82  /* MTK generation one iommu HW only support 4K size mapping */
b17336c55d8928 Honghui Zhang    2016-06-08   83  #define MT2701_IOMMU_PAGE_SHIFT			12
b17336c55d8928 Honghui Zhang    2016-06-08   84  #define MT2701_IOMMU_PAGE_SIZE			(1UL << MT2701_IOMMU_PAGE_SHIFT)
b17336c55d8928 Honghui Zhang    2016-06-08   85  
b17336c55d8928 Honghui Zhang    2016-06-08   86  /*
b17336c55d8928 Honghui Zhang    2016-06-08   87   * MTK m4u support 4GB iova address space, and only support 4K page
b17336c55d8928 Honghui Zhang    2016-06-08   88   * mapping. So the pagetable size should be exactly as 4M.
b17336c55d8928 Honghui Zhang    2016-06-08   89   */
b17336c55d8928 Honghui Zhang    2016-06-08   90  #define M2701_IOMMU_PGT_SIZE			SZ_4M
b17336c55d8928 Honghui Zhang    2016-06-08   91  
b17336c55d8928 Honghui Zhang    2016-06-08   92  struct mtk_iommu_domain {
b17336c55d8928 Honghui Zhang    2016-06-08   93  	spinlock_t			pgtlock; /* lock for page table */
b17336c55d8928 Honghui Zhang    2016-06-08   94  	struct iommu_domain		domain;
b17336c55d8928 Honghui Zhang    2016-06-08   95  	u32				*pgt_va;
b17336c55d8928 Honghui Zhang    2016-06-08   96  	dma_addr_t			pgt_pa;
b17336c55d8928 Honghui Zhang    2016-06-08   97  	struct mtk_iommu_data		*data;
b17336c55d8928 Honghui Zhang    2016-06-08   98  };
b17336c55d8928 Honghui Zhang    2016-06-08   99  
b17336c55d8928 Honghui Zhang    2016-06-08  100  static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
b17336c55d8928 Honghui Zhang    2016-06-08  101  {
b17336c55d8928 Honghui Zhang    2016-06-08  102  	return container_of(dom, struct mtk_iommu_domain, domain);
b17336c55d8928 Honghui Zhang    2016-06-08  103  }
b17336c55d8928 Honghui Zhang    2016-06-08  104  
b17336c55d8928 Honghui Zhang    2016-06-08  105  static const int mt2701_m4u_in_larb[] = {
b17336c55d8928 Honghui Zhang    2016-06-08  106  	LARB0_PORT_OFFSET, LARB1_PORT_OFFSET,
b17336c55d8928 Honghui Zhang    2016-06-08  107  	LARB2_PORT_OFFSET, LARB3_PORT_OFFSET
b17336c55d8928 Honghui Zhang    2016-06-08  108  };
b17336c55d8928 Honghui Zhang    2016-06-08  109  
b17336c55d8928 Honghui Zhang    2016-06-08  110  static inline int mt2701_m4u_to_larb(int id)
b17336c55d8928 Honghui Zhang    2016-06-08  111  {
b17336c55d8928 Honghui Zhang    2016-06-08  112  	int i;
b17336c55d8928 Honghui Zhang    2016-06-08  113  
b17336c55d8928 Honghui Zhang    2016-06-08  114  	for (i = ARRAY_SIZE(mt2701_m4u_in_larb) - 1; i >= 0; i--)
b17336c55d8928 Honghui Zhang    2016-06-08  115  		if ((id) >= mt2701_m4u_in_larb[i])
b17336c55d8928 Honghui Zhang    2016-06-08  116  			return i;
b17336c55d8928 Honghui Zhang    2016-06-08  117  
b17336c55d8928 Honghui Zhang    2016-06-08  118  	return 0;
b17336c55d8928 Honghui Zhang    2016-06-08  119  }
b17336c55d8928 Honghui Zhang    2016-06-08  120  
b17336c55d8928 Honghui Zhang    2016-06-08  121  static inline int mt2701_m4u_to_port(int id)
b17336c55d8928 Honghui Zhang    2016-06-08  122  {
b17336c55d8928 Honghui Zhang    2016-06-08  123  	int larb = mt2701_m4u_to_larb(id);
b17336c55d8928 Honghui Zhang    2016-06-08  124  
b17336c55d8928 Honghui Zhang    2016-06-08  125  	return id - mt2701_m4u_in_larb[larb];
b17336c55d8928 Honghui Zhang    2016-06-08  126  }
b17336c55d8928 Honghui Zhang    2016-06-08  127  
b17336c55d8928 Honghui Zhang    2016-06-08  128  static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
b17336c55d8928 Honghui Zhang    2016-06-08  129  {
b17336c55d8928 Honghui Zhang    2016-06-08  130  	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
b17336c55d8928 Honghui Zhang    2016-06-08 @131  			data->base + REG_MMU_INV_SEL);
b17336c55d8928 Honghui Zhang    2016-06-08  132  	writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
b17336c55d8928 Honghui Zhang    2016-06-08  133  	wmb(); /* Make sure the tlb flush all done */
b17336c55d8928 Honghui Zhang    2016-06-08  134  }
b17336c55d8928 Honghui Zhang    2016-06-08  135  
b17336c55d8928 Honghui Zhang    2016-06-08  136  static void mtk_iommu_tlb_flush_range(struct mtk_iommu_data *data,
b17336c55d8928 Honghui Zhang    2016-06-08  137  				unsigned long iova, size_t size)
b17336c55d8928 Honghui Zhang    2016-06-08  138  {
b17336c55d8928 Honghui Zhang    2016-06-08  139  	int ret;
b17336c55d8928 Honghui Zhang    2016-06-08  140  	u32 tmp;
b17336c55d8928 Honghui Zhang    2016-06-08  141  
b17336c55d8928 Honghui Zhang    2016-06-08  142  	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
b17336c55d8928 Honghui Zhang    2016-06-08  143  		data->base + REG_MMU_INV_SEL);
b17336c55d8928 Honghui Zhang    2016-06-08  144  	writel_relaxed(iova & F_MMU_FAULT_VA_MSK,
b17336c55d8928 Honghui Zhang    2016-06-08  145  		data->base + REG_MMU_INVLD_START_A);
b17336c55d8928 Honghui Zhang    2016-06-08  146  	writel_relaxed((iova + size - 1) & F_MMU_FAULT_VA_MSK,
b17336c55d8928 Honghui Zhang    2016-06-08  147  		data->base + REG_MMU_INVLD_END_A);
b17336c55d8928 Honghui Zhang    2016-06-08  148  	writel_relaxed(F_MMU_INV_RANGE, data->base + REG_MMU_INVALIDATE);
b17336c55d8928 Honghui Zhang    2016-06-08  149  
b17336c55d8928 Honghui Zhang    2016-06-08  150  	ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
b17336c55d8928 Honghui Zhang    2016-06-08  151  				tmp, tmp != 0, 10, 100000);
b17336c55d8928 Honghui Zhang    2016-06-08  152  	if (ret) {
b17336c55d8928 Honghui Zhang    2016-06-08  153  		dev_warn(data->dev,
b17336c55d8928 Honghui Zhang    2016-06-08  154  			 "Partial TLB flush timed out, falling back to full flush\n");
b17336c55d8928 Honghui Zhang    2016-06-08  155  		mtk_iommu_tlb_flush_all(data);
b17336c55d8928 Honghui Zhang    2016-06-08  156  	}
b17336c55d8928 Honghui Zhang    2016-06-08  157  	/* Clear the CPE status */
b17336c55d8928 Honghui Zhang    2016-06-08  158  	writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
b17336c55d8928 Honghui Zhang    2016-06-08  159  }
b17336c55d8928 Honghui Zhang    2016-06-08  160  
b17336c55d8928 Honghui Zhang    2016-06-08  161  static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
b17336c55d8928 Honghui Zhang    2016-06-08  162  {
b17336c55d8928 Honghui Zhang    2016-06-08  163  	struct mtk_iommu_data *data = dev_id;
b17336c55d8928 Honghui Zhang    2016-06-08 @164  	struct mtk_iommu_domain *dom = data->m4u_dom;
b17336c55d8928 Honghui Zhang    2016-06-08  165  	u32 int_state, regval, fault_iova, fault_pa;
b17336c55d8928 Honghui Zhang    2016-06-08  166  	unsigned int fault_larb, fault_port;
b17336c55d8928 Honghui Zhang    2016-06-08  167  
b17336c55d8928 Honghui Zhang    2016-06-08  168  	/* Read error information from registers */
b17336c55d8928 Honghui Zhang    2016-06-08  169  	int_state = readl_relaxed(data->base + REG_MMU_FAULT_ST);
b17336c55d8928 Honghui Zhang    2016-06-08  170  	fault_iova = readl_relaxed(data->base + REG_MMU_FAULT_VA);
b17336c55d8928 Honghui Zhang    2016-06-08  171  
b17336c55d8928 Honghui Zhang    2016-06-08  172  	fault_iova &= F_MMU_FAULT_VA_MSK;
b17336c55d8928 Honghui Zhang    2016-06-08  173  	fault_pa = readl_relaxed(data->base + REG_MMU_INVLD_PA);
b17336c55d8928 Honghui Zhang    2016-06-08  174  	regval = readl_relaxed(data->base + REG_MMU_INT_ID);
b17336c55d8928 Honghui Zhang    2016-06-08  175  	fault_larb = MT2701_M4U_TF_LARB(regval);
b17336c55d8928 Honghui Zhang    2016-06-08  176  	fault_port = MT2701_M4U_TF_PORT(regval);
b17336c55d8928 Honghui Zhang    2016-06-08  177  
b17336c55d8928 Honghui Zhang    2016-06-08  178  	/*
b17336c55d8928 Honghui Zhang    2016-06-08  179  	 * MTK v1 iommu HW could not determine whether the fault is read or
b17336c55d8928 Honghui Zhang    2016-06-08  180  	 * write fault, report as read fault.
b17336c55d8928 Honghui Zhang    2016-06-08  181  	 */
b17336c55d8928 Honghui Zhang    2016-06-08  182  	if (report_iommu_fault(&dom->domain, data->dev, fault_iova,
b17336c55d8928 Honghui Zhang    2016-06-08  183  			IOMMU_FAULT_READ))
b17336c55d8928 Honghui Zhang    2016-06-08  184  		dev_err_ratelimited(data->dev,
b17336c55d8928 Honghui Zhang    2016-06-08  185  			"fault type=0x%x iova=0x%x pa=0x%x larb=%d port=%d\n",
b17336c55d8928 Honghui Zhang    2016-06-08  186  			int_state, fault_iova, fault_pa,
b17336c55d8928 Honghui Zhang    2016-06-08  187  			fault_larb, fault_port);
b17336c55d8928 Honghui Zhang    2016-06-08  188  
b17336c55d8928 Honghui Zhang    2016-06-08  189  	/* Interrupt clear */
b17336c55d8928 Honghui Zhang    2016-06-08  190  	regval = readl_relaxed(data->base + REG_MMU_INT_CONTROL);
b17336c55d8928 Honghui Zhang    2016-06-08  191  	regval |= F_INT_CLR_BIT;
b17336c55d8928 Honghui Zhang    2016-06-08  192  	writel_relaxed(regval, data->base + REG_MMU_INT_CONTROL);
b17336c55d8928 Honghui Zhang    2016-06-08  193  
b17336c55d8928 Honghui Zhang    2016-06-08  194  	mtk_iommu_tlb_flush_all(data);
b17336c55d8928 Honghui Zhang    2016-06-08  195  
b17336c55d8928 Honghui Zhang    2016-06-08  196  	return IRQ_HANDLED;
b17336c55d8928 Honghui Zhang    2016-06-08  197  }
b17336c55d8928 Honghui Zhang    2016-06-08  198  
b17336c55d8928 Honghui Zhang    2016-06-08  199  static void mtk_iommu_config(struct mtk_iommu_data *data,
b17336c55d8928 Honghui Zhang    2016-06-08  200  			     struct device *dev, bool enable)
b17336c55d8928 Honghui Zhang    2016-06-08  201  {
b17336c55d8928 Honghui Zhang    2016-06-08  202  	struct mtk_smi_larb_iommu    *larb_mmu;
b17336c55d8928 Honghui Zhang    2016-06-08  203  	unsigned int                 larbid, portid;
a9bf2eec5a6fc0 Joerg Roedel     2018-11-29  204  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
84672f192671e6 Robin Murphy     2016-10-17  205  	int i;
b17336c55d8928 Honghui Zhang    2016-06-08  206  
84672f192671e6 Robin Murphy     2016-10-17  207  	for (i = 0; i < fwspec->num_ids; ++i) {
84672f192671e6 Robin Murphy     2016-10-17  208  		larbid = mt2701_m4u_to_larb(fwspec->ids[i]);
84672f192671e6 Robin Murphy     2016-10-17  209  		portid = mt2701_m4u_to_port(fwspec->ids[i]);
1ee9feb2c9f893 Yong Wu          2019-08-24  210  		larb_mmu = &data->larb_imu[larbid];
b17336c55d8928 Honghui Zhang    2016-06-08  211  
b17336c55d8928 Honghui Zhang    2016-06-08  212  		dev_dbg(dev, "%s iommu port: %d\n",
b17336c55d8928 Honghui Zhang    2016-06-08  213  			enable ? "enable" : "disable", portid);
b17336c55d8928 Honghui Zhang    2016-06-08  214  
b17336c55d8928 Honghui Zhang    2016-06-08  215  		if (enable)
b17336c55d8928 Honghui Zhang    2016-06-08  216  			larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
b17336c55d8928 Honghui Zhang    2016-06-08  217  		else
b17336c55d8928 Honghui Zhang    2016-06-08  218  			larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
b17336c55d8928 Honghui Zhang    2016-06-08  219  	}
b17336c55d8928 Honghui Zhang    2016-06-08  220  }
b17336c55d8928 Honghui Zhang    2016-06-08  221  
b17336c55d8928 Honghui Zhang    2016-06-08  222  static int mtk_iommu_domain_finalise(struct mtk_iommu_data *data)
b17336c55d8928 Honghui Zhang    2016-06-08  223  {
b17336c55d8928 Honghui Zhang    2016-06-08  224  	struct mtk_iommu_domain *dom = data->m4u_dom;
b17336c55d8928 Honghui Zhang    2016-06-08  225  
b17336c55d8928 Honghui Zhang    2016-06-08  226  	spin_lock_init(&dom->pgtlock);
b17336c55d8928 Honghui Zhang    2016-06-08  227  
750afb08ca7131 Luis Chamberlain 2019-01-04  228  	dom->pgt_va = dma_alloc_coherent(data->dev, M2701_IOMMU_PGT_SIZE,
b17336c55d8928 Honghui Zhang    2016-06-08  229  					 &dom->pgt_pa, GFP_KERNEL);
b17336c55d8928 Honghui Zhang    2016-06-08  230  	if (!dom->pgt_va)
b17336c55d8928 Honghui Zhang    2016-06-08  231  		return -ENOMEM;
b17336c55d8928 Honghui Zhang    2016-06-08  232  
b17336c55d8928 Honghui Zhang    2016-06-08  233  	writel(dom->pgt_pa, data->base + REG_MMU_PT_BASE_ADDR);
b17336c55d8928 Honghui Zhang    2016-06-08  234  
b17336c55d8928 Honghui Zhang    2016-06-08  235  	dom->data = data;
b17336c55d8928 Honghui Zhang    2016-06-08  236  
b17336c55d8928 Honghui Zhang    2016-06-08  237  	return 0;
b17336c55d8928 Honghui Zhang    2016-06-08  238  }
b17336c55d8928 Honghui Zhang    2016-06-08  239  
b17336c55d8928 Honghui Zhang    2016-06-08  240  static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
b17336c55d8928 Honghui Zhang    2016-06-08  241  {
b17336c55d8928 Honghui Zhang    2016-06-08  242  	struct mtk_iommu_domain *dom;
b17336c55d8928 Honghui Zhang    2016-06-08  243  
b17336c55d8928 Honghui Zhang    2016-06-08  244  	if (type != IOMMU_DOMAIN_UNMANAGED)
b17336c55d8928 Honghui Zhang    2016-06-08  245  		return NULL;
b17336c55d8928 Honghui Zhang    2016-06-08  246  
b17336c55d8928 Honghui Zhang    2016-06-08  247  	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
b17336c55d8928 Honghui Zhang    2016-06-08  248  	if (!dom)
b17336c55d8928 Honghui Zhang    2016-06-08  249  		return NULL;
b17336c55d8928 Honghui Zhang    2016-06-08  250  
b17336c55d8928 Honghui Zhang    2016-06-08  251  	return &dom->domain;
b17336c55d8928 Honghui Zhang    2016-06-08  252  }
b17336c55d8928 Honghui Zhang    2016-06-08  253  
b17336c55d8928 Honghui Zhang    2016-06-08  254  static void mtk_iommu_domain_free(struct iommu_domain *domain)
b17336c55d8928 Honghui Zhang    2016-06-08  255  {
b17336c55d8928 Honghui Zhang    2016-06-08  256  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
b17336c55d8928 Honghui Zhang    2016-06-08  257  	struct mtk_iommu_data *data = dom->data;
b17336c55d8928 Honghui Zhang    2016-06-08  258  
b17336c55d8928 Honghui Zhang    2016-06-08  259  	dma_free_coherent(data->dev, M2701_IOMMU_PGT_SIZE,
b17336c55d8928 Honghui Zhang    2016-06-08  260  			dom->pgt_va, dom->pgt_pa);
b17336c55d8928 Honghui Zhang    2016-06-08  261  	kfree(to_mtk_domain(domain));
b17336c55d8928 Honghui Zhang    2016-06-08  262  }
b17336c55d8928 Honghui Zhang    2016-06-08  263  
b17336c55d8928 Honghui Zhang    2016-06-08  264  static int mtk_iommu_attach_device(struct iommu_domain *domain,
b17336c55d8928 Honghui Zhang    2016-06-08  265  				   struct device *dev)
b17336c55d8928 Honghui Zhang    2016-06-08  266  {
3524b5592cad63 Joerg Roedel     2020-03-26  267  	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
b17336c55d8928 Honghui Zhang    2016-06-08  268  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
8bbe13f52cb796 Yong Wu          2020-05-15  269  	struct dma_iommu_mapping *mtk_mapping;
b17336c55d8928 Honghui Zhang    2016-06-08  270  	int ret;
b17336c55d8928 Honghui Zhang    2016-06-08  271  
8bbe13f52cb796 Yong Wu          2020-05-15  272  	/* Only allow the domain created internally. */
589601720d9d03 Joerg Roedel     2020-06-25  273  	mtk_mapping = data->mapping;
8bbe13f52cb796 Yong Wu          2020-05-15  274  	if (mtk_mapping->domain != domain)
8bbe13f52cb796 Yong Wu          2020-05-15  275  		return 0;
b17336c55d8928 Honghui Zhang    2016-06-08  276  
b17336c55d8928 Honghui Zhang    2016-06-08  277  	if (!data->m4u_dom) {
b17336c55d8928 Honghui Zhang    2016-06-08  278  		data->m4u_dom = dom;
b17336c55d8928 Honghui Zhang    2016-06-08  279  		ret = mtk_iommu_domain_finalise(data);
b17336c55d8928 Honghui Zhang    2016-06-08  280  		if (ret) {
b17336c55d8928 Honghui Zhang    2016-06-08 @281  			data->m4u_dom = NULL;
b17336c55d8928 Honghui Zhang    2016-06-08  282  			return ret;
b17336c55d8928 Honghui Zhang    2016-06-08  283  		}
b17336c55d8928 Honghui Zhang    2016-06-08  284  	}
b17336c55d8928 Honghui Zhang    2016-06-08  285  
b17336c55d8928 Honghui Zhang    2016-06-08  286  	mtk_iommu_config(data, dev, true);
b17336c55d8928 Honghui Zhang    2016-06-08  287  	return 0;
b17336c55d8928 Honghui Zhang    2016-06-08  288  }
b17336c55d8928 Honghui Zhang    2016-06-08  289  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--vkogqOf2sHV7VnPd
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
0ChRzhOzDyoh+c6q9P8BY8tqUsoeBQA=

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--vkogqOf2sHV7VnPd--

