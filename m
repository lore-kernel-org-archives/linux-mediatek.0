Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD068C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 19:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZYCnBCTs4snTwToJe6GYWxNFPSKtB/+Ajgpk0uQ7Oc=; b=UzA+/D1X1HTvYw
	TB9hiudnVxvL1BN1JZSdeUnK98PSNtBkrDrPBqkhvagwBEWxnB6BtkWRxS7WHuuUeFc8kOJMNmoYt
	9XLnLvBMpjezVZmk8wx4UM2vjtjQRWxljN1zNoyO7fX8+RZeMovyM8xXNvXyGRq9GN2caKt67425l
	O5XDNjXDy4cSGAxklOY4KVywv3IUOSAxoRPJmSGq9YoRJ72Td2mlxH4boWCf9X9X5ysC1K3dvZkzJ
	J+KsueH08boQu8LJMGQRR9ppDaiYMyFHFBIPkXU/vvlYZd/uuyGuGgHq9cErPKqhc9LVjEsyYpJPw
	uZckGwr/AwBvD6/mHGwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSkhF-0004aa-Rh; Fri, 11 Mar 2022 19:13:05 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSkh3-0004ZO-3M; Fri, 11 Mar 2022 19:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647025973; x=1678561973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=avT+4TnON8uQFynhMWL9RnsVIOvaVLLk/mGKUdy8nA4=;
 b=iisVOH8/iuDaczsbGp7e9/EXciVQpP3gTUiAES61VZ3zeFwRl4lswwdD
 tq7yg7xuQPhxp1Y+4SPiQGktXuTO6u8MHCLUXd1+dhlVVw1Wwabv2XMEQ
 7k6zxstrj6N4qRko2CfLnK16ovv9Ks8oUM/u9JApKuUPZG07Ihx1vLYlI
 YwtfLmbt6WvTC2U7Du4paPk+eKKkJyJkGE87T/yWjCbjK4c2QkiO/Zswy
 CP9qlBc05cK6RZmn9ZLtKpAcUrl7Bci69EKcbzH/74uwSYs53T7eLje55
 NrO/26XE9HLswIXhU9jMulTyM+9xHomNJ8rKCzkYGNgJeWPxeCd0MRAsM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="255370379"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="255370379"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 11:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="511476030"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 11 Mar 2022 11:12:49 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSkgy-0006yN-Aa; Fri, 11 Mar 2022 19:12:48 +0000
Date: Sat, 12 Mar 2022 03:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, rostedt@goodmis.org,
 mingo@redhat.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, mark-pk.tsai@mediatek.com,
 yj.chiang@mediatek.com
Subject: Re: [PATCH] tracing: make tracer_init_tracefs initcall asynchronous
Message-ID: <202203120304.sJ9EJI90-lkp@intel.com>
References: <20220311112656.25348-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311112656.25348-1-mark-pk.tsai@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_111253_251463_1694CC80 
X-CRM114-Status: GOOD (  14.73  )
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

Hi Mark-PK,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mark-PK-Tsai/tracing-make-tracer_init_tracefs-initcall-asynchronous/20220311-192857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: riscv-randconfig-r042-20220310 (https://download.01.org/0day-ci/archive/20220312/202203120304.sJ9EJI90-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/134c5fb991a16bf28b500e8e52296447013b5b01
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mark-PK-Tsai/tracing-make-tracer_init_tracefs-initcall-asynchronous/20220311-192857
        git checkout 134c5fb991a16bf28b500e8e52296447013b5b01
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0xa792a): Section mismatch in reference from the function tracefs_init() to the function .init.text:create_trace_instances()
The function tracefs_init() references
the function __init create_trace_instances().
This is often because tracefs_init lacks a __init
annotation or the annotation of create_trace_instances is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0xade5e): Section mismatch in reference from the function event_trace_init() to the function .init.text:early_event_add_tracer()
The function event_trace_init() references
the function __init early_event_add_tracer().
This is often because event_trace_init lacks a __init
annotation or the annotation of early_event_add_tracer is wrong.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
