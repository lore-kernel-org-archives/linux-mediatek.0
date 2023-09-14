Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C9FEDE9A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jO965HeKo6dJlfYRh72MFUfyYDoEuNkyT+sUGPOr6Ak=; b=mLnG5yLSsKUlgDDWbwGAIG0AZO
	9gMY/lSu+EHm2HN10sotJrrSzV+pw+1eKTdL5QbPbcIve8PT7/aGiQCezqCLLLtbJNtDAYOXzRhYN
	3I1L//UuwedQEqTc8MGuABrnGFg09N/A9BqSxROXVM8OEoBOHfxhdMARTFNiEuKmAvkXRinEkYMZn
	UB85elsGfXkiOIMbwPdfhmoDb1hlzVYKwbakH+5o596JdLKrM0O8sK7e5q6vMONcZxKDsxZz8nuen
	8drEdNs1mRX6mPFGcBx6whb8se2Nuq2AqWNSL7CRJ9jdpf7399+prl+AmVzdNKSjZqBkioET5dU/7
	Wie3F3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjRD-007yBe-1F;
	Thu, 14 Sep 2023 10:19:07 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjRA-007yAU-02;
	Thu, 14 Sep 2023 10:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694686743; x=1726222743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O1LLvMPKGNc5ZFEUOpVx7SNJUHBbUo3ACKo6XHAjDn8=;
  b=YhtEHe0H9Am871U0BLW6PIkwxC9RaTUKojP2lhFvOhoP1uN+cf3iRhG6
   Mlm3KGiqbVAaWcE1yptiwN82CKY3Ut3l0TagzZdKDiCTzHpnoBxIilbOr
   Q/oCU8JsUOMBGXGUBvGT4wcqbZNLY7ip+4opBPP7YemJiZ9onuSzTjsEm
   X0ahhgwZEokZWN838NFXbnKRWxWzIDEIXSC9obI4zWnJjvSGnv55H6yco
   vUSI/eChs1zZ6FpG+9XUdaIkeK++2psoh2gPfu+5FeDPTYhpIvhFmJtq1
   eO3SZMCF6fLCtiLhQK3cGoxUCDOP6LzYgWT5vs47300cs63L/BOgVapLp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363949202"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="363949202"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 03:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773840738"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="773840738"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Sep 2023 03:18:44 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgjQo-0001Tp-0F;
	Thu, 14 Sep 2023 10:18:42 +0000
Date: Thu, 14 Sep 2023 18:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Anan Sun <anan.sun@mediatek.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	jianjiao.zeng@mediatek.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tjmercier@google.com,
	linaro-mm-sig@lists.linaro.org, John Stultz <jstultz@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call
 for buffer allocating/freeing
Message-ID: <202309141707.zdT0yuMT-lkp@intel.com>
References: <20230911023038.30649-7-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-7-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_031904_115559_AE0C6E9E 
X-CRM114-Status: GOOD (  12.11  )
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
[also build test ERROR on robh/for-next linus/master v6.6-rc1 next-20230914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yong-Wu/dma-buf-heaps-Deduplicate-docs-and-adopt-common-format/20230911-103308
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230911023038.30649-7-yong.wu%40mediatek.com
patch subject: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call for buffer allocating/freeing
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230914/202309141707.zdT0yuMT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141707.zdT0yuMT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141707.zdT0yuMT-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_kree_secure_session_init':
   mtk_secure_heap.c:(.text+0x130): undefined reference to `tee_client_open_context'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `.L10':
   mtk_secure_heap.c:(.text+0x19c): undefined reference to `tee_client_open_session'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `.L12':
   mtk_secure_heap.c:(.text+0x1dc): undefined reference to `tee_client_close_context'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_sec_mem_tee_service_call.constprop.0':
>> mtk_secure_heap.c:(.text+0x274): undefined reference to `tee_client_invoke_func'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_sec_mem_release.isra.0':
   mtk_secure_heap.c:(.text+0x464): undefined reference to `tee_client_invoke_func'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

