Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7711CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omFH4Lxmor3lki9K8zONxtabwr8DsnPNSZMV/hVyFAI=; b=Bx8/MQI/yohMeX
	qonbnh7CqTtDjYXYpbBNPP8fMIlvYoaKa6bq3MwRq5zlt/DhWLmoP+XEElD6MQ+oaX1JqgtW8m24V
	OGJm/l8lIgd6rgSaJv/qDhF9VFXsV2+7LQXqywBVZrc7wUL3m30vCigKKf/BuusVXBzPeQH8aRj2/
	20uAQBEZW4ajweFqxWc6tzAp1vvLbNCm3m4AICLFHO+j+6CuTEw404ritT3yABd/AvKQFXflAMB1T
	gqJ9ThwXpioFsNnTgI/5El3cDahDnhvuFMT/QrAqflimFDhiKUTnmbxxkb1kANcmnYPNl/zb5JfZn
	XsFP3QTnE1T4KtqtGzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwlJ4-009fDz-5A; Mon, 13 Dec 2021 13:23:54 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwlJ0-009fCl-Sl
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 13:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639401830; x=1670937830;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NUaiRW8izVYY+jHItB+IlWmb+AOutAfJrsSjOPLwAo4=;
 b=fsl1CHqyBr6HU1VLMTWSfPUkWEqN20SO60gvbKqjY0dL0pb0L+UJXT3f
 opjapvx56mj1pB42ysMKKifZuj4ejUgpfh8AdhDpw7E1Nq64KNbpezRns
 U7UrVtDzGV1cbmdAR6RzCuyHzq/pprvstq+XUyoQ5WSsihKBfexQKz06U
 83JwM3EyXfH99uFayeXYW+j9khuhtunNuiGAI/BP0MjEL8U2CZ+ygh89c
 JBgGV+a+3wUFHschYUxHSQeeOgcyJlpDEnvqI/SV+F3Xqszgs3qrgwRcT
 5YhzmWimAjl6d3+S8CX9NpA95pl3rP8FE58uvCTLutzY5OgaPN1B/5AbM A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238952866"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="238952866"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 05:23:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="613822560"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 13 Dec 2021 05:23:47 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mwlIw-0006hT-B3; Mon, 13 Dec 2021 13:23:46 +0000
Date: Mon, 13 Dec 2021 21:23:13 +0800
From: kernel test robot <lkp@intel.com>
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: kbuild-all@lists.01.org, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Money Wang <Money.Wang@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 MeiChia Chiu <meichia.chiu@mediatek.com>
Subject: Re: [PATCH v3] mt76: mt7915: add mu-mimo and ofdma debugfs knobs
Message-ID: <202112132120.tRzeHzz5-lkp@intel.com>
References: <20211213060309.28323-1-MeiChia.Chiu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211213060309.28323-1-MeiChia.Chiu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_052351_001777_1A34540C 
X-CRM114-Status: GOOD (  11.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi MeiChia,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kvalo-wireless-drivers-next/master]
[also build test ERROR on kvalo-wireless-drivers/master v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/MeiChia-Chiu/mt76-mt7915-add-mu-mimo-and-ofdma-debugfs-knobs/20211213-140356
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git master
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20211213/202112132120.tRzeHzz5-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/91cb277e37dbed42e6b6aee256694204ba8d9a7f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review MeiChia-Chiu/mt76-mt7915-add-mu-mimo-and-ofdma-debugfs-knobs/20211213-140356
        git checkout 91cb277e37dbed42e6b6aee256694204ba8d9a7f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `kernel_entry':
   (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x238): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x258): additional relocation overflows omitted from the output
   mips-linux-ld: drivers/net/wireless/mediatek/mt76/mt7915/debugfs.o: in function `mt7915_muru_stat_show':
>> debugfs.c:(.text.mt7915_muru_stat_show+0x320): undefined reference to `__udivdi3'
>> mips-linux-ld: debugfs.c:(.text.mt7915_muru_stat_show+0x34c): undefined reference to `__udivdi3'
   mips-linux-ld: debugfs.c:(.text.mt7915_muru_stat_show+0x37c): undefined reference to `__udivdi3'
   mips-linux-ld: debugfs.c:(.text.mt7915_muru_stat_show+0x3ac): undefined reference to `__udivdi3'
   mips-linux-ld: debugfs.c:(.text.mt7915_muru_stat_show+0x3dc): undefined reference to `__udivdi3'
   mips-linux-ld: drivers/net/wireless/mediatek/mt76/mt7915/debugfs.o:debugfs.c:(.text.mt7915_muru_stat_show+0x4dc): more undefined references to `__udivdi3' follow

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
