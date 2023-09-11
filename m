Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1ECEEB581
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZ8PvEzMqUbV6xqvf+kQ0cgc0XJq06HRjLhnik1dBRk=; b=wK/Wx+igcGaa+5aGv5VDDkOn47
	MH+TAtfWyEKWEPXhsbPCHv/DizWOsu4Fvx9Y5EG2zA4VnXJpYV0F65QiQqRI0xM1SsfFXXQjyBUL6
	z1xH4rUZb0JBwFnw2c2Ldl6HqAsTGbfxv4G6wEGnlJC7e3eAAtT2F4Q40/G+5IqoZeAP+5G4nHKXw
	VGB5TIc21RHxUJjM9FqdyvEC9ITYPxnsdW98vLrEu+eRV1n0dSbw0rLmGm+HXHfWR8rhHimE1AfJT
	RKMwQylQ1meVExMtvu4vU9Ia7aQr51stKjkzeNtjWfQ2jYzCTRba3S35EQu3pvIUNVwsFVOnwTysc
	AwXHjp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbwg-00HVKj-2w;
	Mon, 11 Sep 2023 08:06:58 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbwd-00HVIk-1A;
	Mon, 11 Sep 2023 08:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694419615; x=1725955615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EKc2l8u/kKBul3gNAYJEk/Ck38NKo2uvJewBdyW546M=;
  b=lECQ/OfMVVsMk6XvMcEMam1akf3A9mEz4HaIxcIlLBeS9meGtnWN9Qf2
   e/knpvvOiu/6k70KwTdqINgQVRH8FYuVys6Bp7zV6hu/C0xO182u6eh82
   jcaabgVxW1rTr2/l/ig1ep9rSkJju4IpgAGSdZQvqAUiBRmykYTyWjusn
   6ajLPXZcIleD6t+/iodSUqb5ZMJi3Soh/L1Uo8TieL0jLiiCWZcFuRVDI
   RabUd6wvqtAp7eQiL5dLo09CXj/hAW5ot5zqBIO31NlmCRBYbu2SKRi+0
   ty1+l/g2ZtTiKkmp886LZ/Q5bHI4wsKGef/RSMr0dmbCBogl9u4UnK1lO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="444438888"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="444438888"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 01:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="693005175"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="693005175"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Sep 2023 01:06:47 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfbwS-0005yc-30;
	Mon, 11 Sep 2023 08:06:44 +0000
Date: Mon, 11 Sep 2023 16:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, jianjiao.zeng@mediatek.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tjmercier@google.com,
	linaro-mm-sig@lists.linaro.org, John Stultz <jstultz@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
Message-ID: <202309111534.u4wfJ4vk-lkp@intel.com>
References: <20230911023038.30649-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-5-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_010655_497701_58F6F647 
X-CRM114-Status: GOOD (  14.42  )
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

Hi Yong,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on robh/for-next linus/master v6.6-rc1 next-20230911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yong-Wu/dma-buf-heaps-Deduplicate-docs-and-adopt-common-format/20230911-103308
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230911023038.30649-5-yong.wu%40mediatek.com
patch subject: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20230911/202309111534.u4wfJ4vk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111534.u4wfJ4vk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111534.u4wfJ4vk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/heaps/mtk_secure_heap.c:68:27: error: initialization of 'struct dma_buf * (*)(struct dma_heap *, long unsigned int,  long unsigned int,  long unsigned int)' from incompatible pointer type 'struct dma_buf * (*)(struct dma_heap *, size_t,  long unsigned int,  long unsigned int)' {aka 'struct dma_buf * (*)(struct dma_heap *, unsigned int,  long unsigned int,  long unsigned int)'} [-Werror=incompatible-pointer-types]
      68 |         .allocate       = mtk_sec_heap_allocate,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/heaps/mtk_secure_heap.c:68:27: note: (near initialization for 'mtk_sec_heap_ops.allocate')
   cc1: some warnings being treated as errors


vim +68 drivers/dma-buf/heaps/mtk_secure_heap.c

    66	
    67	static const struct dma_heap_ops mtk_sec_heap_ops = {
  > 68		.allocate	= mtk_sec_heap_allocate,
    69	};
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

