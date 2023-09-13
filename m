Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22E5EDEC4D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q360DGLPslm+3L2kBMp+qoLp/Dds0nxRU+KlA9Aqw9Y=; b=w6pHGbrQOvG3ZXRyq/pHlOpVK+
	TxWq8G7kTKvkGkGDjbj4FvhySOuvjgr0S/4EDaCW75EBD0MBptkeba3V8y/WZYinq4iWOjBI+Ns4c
	G0bvuQbtQ50TefrndaspjBR8dLztrXpctl6pc66Ce3DSq50uN5acETT3nXOjtuAfyu+TLuF8RK3IS
	6IMmkms7Gs36ZA2bQXXDrr80si9l7rC+9kWlMY0RAmfOCElqXCSLgwXfDFq8fpTDOkgsV3yMXv9Om
	N8nuCpiEYwGutTtKBleeNfKez1yuWrtEKExz/81bT1rBPmhMHqqBN37EGOg/RhcoJ4Ut0kAuOccCK
	vFP0KvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQ2E-005zoC-0H;
	Wed, 13 Sep 2023 13:36:02 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQ29-005zmm-2b;
	Wed, 13 Sep 2023 13:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694612157; x=1726148157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pj/V2UP2unub0wz1wILtsfcstjsxnGVCuZljE+FR6is=;
  b=LKRe3s4qM8ObX708zto/AAczwZLDk8VxuF978K82tYEbv0denjQM+7dG
   wFo/M+Wm6gmA8Mh1OTz/5y9+BuC/cK/BZ95oOeoLAqQqTynfKHx0uTYnk
   Z+mNJ3FrD0MheI+fp3tFirvYAivkNLAY2MzXMAgsR23F3YSAWjRwTrHwx
   cltjvvdQZG6bHTrNVBSkHdwtQ6fCVwBf1oRYVlaPtMknEavCuCG8YKP1A
   Fg/TddagIiHM6eNBPsamLNLkKIqT1cK4WpAUlXC9H8llV3eYhGvFw6Ys/
   KBKDJRdwGDUzaxLC6MdOmd4RORXPsJXhNTaiXvuiHAtOh6n0g9M0ic3zt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="375993254"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="375993254"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 06:35:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="859269609"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="859269609"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Sep 2023 06:35:50 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgQ1z-00006X-2b;
	Wed, 13 Sep 2023 13:35:47 +0000
Date: Wed, 13 Sep 2023 21:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, tjmercier@google.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yong Wu <yong.wu@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, jianjiao.zeng@mediatek.com,
	kuohong.wang@mediatek.com
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
Message-ID: <202309132148.UABRshAB-lkp@intel.com>
References: <20230911023038.30649-6-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-6-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_063557_910406_5BBF0861 
X-CRM114-Status: GOOD (  14.00  )
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
[also build test ERROR on robh/for-next linus/master v6.6-rc1 next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yong-Wu/dma-buf-heaps-Deduplicate-docs-and-adopt-common-format/20230911-103308
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230911023038.30649-6-yong.wu%40mediatek.com
patch subject: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230913/202309132148.UABRshAB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309132148.UABRshAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309132148.UABRshAB-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_kree_secure_session_init':
>> mtk_secure_heap.c:(.text+0x130): undefined reference to `tee_client_open_context'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `.L10':
>> mtk_secure_heap.c:(.text+0x19c): undefined reference to `tee_client_open_session'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `.L12':
>> mtk_secure_heap.c:(.text+0x1dc): undefined reference to `tee_client_close_context'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

