Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92898C77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaRohCAOnCW9Hewk+vcIyu1Jx3wo3YL/56xh9XmOOhE=; b=w5oJyqcdK5xxBemph7sGvl7D2T
	yi+cwPy3InieOwQ7uOFxUfzFph7i2cwMcQMweUjcgYs7+RHZnwalh5cYsEogVEHt75UV9UirLJzS0
	AtgLVi0njBRPXSnwcQwhniHiZ0UPFxSwmcaSXeC7Bw9pWhfzIj2xyY57cG8mjHUVdcQwkifPTkkSa
	7bzx49hCAg+Z850qPRaPgl+4hnoCc58Y/G7OXscJ3Dj0ZrrbWpmVgGIw3scbusUF1Vj6Idcz1uyh6
	x2cjp7pfCtIHEs+t9gxmRx0IbBhzPRIO22LBnuiof7N35ZMKruullVQOTeXbpCCV5SjgQ1NLbZMdZ
	9+kwO2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psQp4-00BCYL-1x;
	Fri, 28 Apr 2023 16:19:50 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psQp0-00BCXE-0q;
	Fri, 28 Apr 2023 16:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682698786; x=1714234786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mJSFhPkeknNj2O1iNEZ3l9oQeY99f0eWfnaVt0hI+2w=;
  b=bl6UjfJdca4I0t3KYZMsaj06piR5gcgt3WkIaTC2GmswsP8hQKZlgGgg
   AL+FyiHvGGZTXamSVVQGgw6EVLYwAn/O85yHPpMJ/oIhGSiGe9O/jQVMQ
   aRyvPPWJkZKOhRrkja31wuQn18Qs5bjkmKyVEtqN4HXg2MHCJHOlKAAZ9
   D6V2kaOKYi2BgXMDOGZGsBQR2IBuDpJ9/S2IQp5DUlGEPlQCzIzfjQgEa
   MYE2LttJMb+xpu3IWa51HxgQK+NzqF7sF+5qoaj3kCbDJudwCDsdJos+d
   2XUNH1pu3n7/WeDCCaRVGYtiXSIxuNF6YV1kkneQxaMEzWdDhvwW1PvIw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="349816355"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="349816355"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 09:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="819061758"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="819061758"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Apr 2023 09:19:38 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psQor-0000Y9-1I;
	Fri, 28 Apr 2023 16:19:37 +0000
Date: Sat, 29 Apr 2023 00:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Jade Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>
Subject: Re: [PATCH v2 3/7] virt: geniezone: Introduce GenieZone hypervisor
 support
Message-ID: <202304290052.49kcXbnl-lkp@intel.com>
References: <20230428103622.18291-4-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428103622.18291-4-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_091946_582657_AFEEAFF3 
X-CRM114-Status: GOOD (  12.88  )
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

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on robh/for-next arnd-asm-generic/master linus/master v6.3 next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230428-183738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230428103622.18291-4-yi-de.wu%40mediatek.com
patch subject: [PATCH v2 3/7] virt: geniezone: Introduce GenieZone hypervisor support
config: x86_64-randconfig-a004 (https://download.01.org/0day-ci/archive/20230429/202304290052.49kcXbnl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0e3f05a6e4547eb309032d047115a47d8f59641d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230428-183738
        git checkout 0e3f05a6e4547eb309032d047115a47d8f59641d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290052.49kcXbnl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> usr/include/linux/gzvm.h:15: included file 'asm-x86/gzvm_arch.h' is not exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

