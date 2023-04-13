Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F358C77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLa2FoptY8H84UufIJMk81TuErVkhm0PDMw+QjAOrA4=; b=vYqfF8SVzfWt0/wNGklSkGC64x
	bgEK7jCqrdSro7H3WFM8K1OZ9Zh6NfFzeVkmn+70oaI2zuaKWwM1bwGlUiBu++aBjTqN5jO/J13VL
	/42BF0vAbgttQaSjScz2dvvM/x7AHZWfCD+yXweKmS4Gn2yYQ0oMZqDgMFN2Z2XFDh+qdq9Mbnc19
	aNizIuRTTTzddp2Jp/rt3peVyKhzwYXjmIniP7f3tiGTl3BTHa9T/g/5JXdjUvJimZhp80c7IVdWV
	5M6luJHUkwYYGYH0OmURg7QfDwzN1VmI6U4UHQziuikgLAwxSGqlbR4wcLDjguTUphcAO8dRg/P9u
	0OXFOq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwSi-006BLW-1q;
	Thu, 13 Apr 2023 12:54:04 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwSb-006BHi-1Z;
	Thu, 13 Apr 2023 12:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681390437; x=1712926437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=woywNa07nUXeMZ3aoFcG1W2ohwilu7egfj29eLpEe74=;
  b=EdpnTsAKYR3syeD3mrc9jQMbjezPKqpW5bLvtMgoMGBNXh01iB+qcBMw
   cHsPoFir9pvQvKFk+BIgy8y1y9wdEUjse2R8zMIZzg0hhE6BrIqi8cQ8a
   /sV98+CjTtJ/jCuNkBzGIWnO6js7FV8daNpGLxWZDsTuLxtNQ/XkjmK/c
   +uEup8ucVCdI/dsa43LZk/zdEbry6Ja2QUVttMj47lJL302djFo55QjBX
   NIFsGwdif5XfUjIxC5Oi4Z8dqIsZZnrqK20L4SW3kLvW4FdaZ0xu6eGbW
   JqtqQn+01x1L/atfNbOpRROd1CjBBsRgIVCTNUEWc70BFDrxFUxiHYQcV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="345965534"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="345965534"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 05:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="666777303"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="666777303"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Apr 2023 05:53:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmwSS-000Yh3-3B;
	Thu, 13 Apr 2023 12:53:48 +0000
Date: Thu, 13 Apr 2023 20:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jades Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Yi-De Wu <yi-de.wu@mediatek.com>
Subject: Re: [PATCH v1 3/6] soc: mediatek: virt: geniezone: Introduce
 GenieZone hypervisor support
Message-ID: <202304132053.o6E89lC6-lkp@intel.com>
References: <20230413090735.4182-4-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413090735.4182-4-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_055357_567503_9E42313B 
X-CRM114-Status: GOOD (  12.02  )
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

Hi Yi-De,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on krzk-dt/for-next arm64/for-next/core lwn/docs-next linus/master v6.3-rc6 next-20230412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230413-170932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230413090735.4182-4-yi-de.wu%40mediatek.com
patch subject: [PATCH v1 3/6] soc: mediatek: virt: geniezone: Introduce GenieZone hypervisor support
config: x86_64-randconfig-a014-20230410 (https://download.01.org/0day-ci/archive/20230413/202304132053.o6E89lC6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2d01949ddd48b1bc2cc9849154afe60781068f39
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230413-170932
        git checkout 2d01949ddd48b1bc2cc9849154afe60781068f39
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304132053.o6E89lC6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> usr/include/linux/gzvm_common.h:15: included file 'asm-x86/gzvm_arch.h' is not exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

