Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B28CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgtmyQ/BLXgKXdwlpgqJqcPAlxMPm0jSujhLlzRwWgU=; b=Wgk04GpZ8mQYKO
	cW3XrB2o4Fc3+bj99N2kDCIj9smmA/yQJDmO6sfuviwLKnljVyLcjn9WRaosJ35VnI0sfL2dPNPBF
	P0MzMeIQm7vslX56sfBGlVjjExrDTqN6Lbtwk1xvPiSEAN0w8o5UL0QDACiJLKZsV1AfWo2W4Rc3Z
	zXePqm4/5WFAxH6QlemcYQbC0xwbtIR+Xuv+kdkQa8GRpAT4n8gaDJ8b0UnWSuaQHa6ojs833jJV2
	enm/zs52kFIyb98Ayj8t0wFI6goUrS8OStr2S9KhgA6GAcHW87J/I9HgFiLBCQc4yY9wmB48Ae1Hf
	aTU0t9v5kXCO3qn2Sqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSjF5-00HW9r-TM; Fri, 11 Mar 2022 17:39:55 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSjEu-00HW8W-0r; Fri, 11 Mar 2022 17:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647020384; x=1678556384;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zYn7nenMY87v8uoKOz+5CcKHSn0YLCLJmC0iRm39VBo=;
 b=YyftK+10gEdByJadz06tF7Zb/QseOFGhpFi4Wm09m7WlKFO7q6RC6wwT
 ebJz6N6aMrCK7HO4jgQHFs5KAGa7in/aPQ+Cjdouj8y0njDkjbj9jCpqk
 i9rsdTyMOc21+/PRvetGu2cZVJ4DYhNP7MnghJz3jYINwVQjYHdyk956/
 n2Qf9hCl6Wy9imyxAMphjnNYX+jdNhdh6QkcGXNLeKjzklCGcoRmkLodZ
 4yeDQ3CmvgkmIIbvGKQWcp2r6wlpQEuJRqKYZUCKpVYxaDQQv7RDSpT1Q
 cQGQB9WkR0nHt62ouj03hCPAdbA8mVEyTM+Y7krWVeLtZ52smb+KvSz7n g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="243064302"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="243064302"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 09:39:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="579357724"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 11 Mar 2022 09:39:39 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSjEp-0006s9-7J; Fri, 11 Mar 2022 17:39:39 +0000
Date: Sat, 12 Mar 2022 01:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, rostedt@goodmis.org,
 mingo@redhat.com
Cc: kbuild-all@lists.01.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, mark-pk.tsai@mediatek.com,
 yj.chiang@mediatek.com
Subject: Re: [PATCH] tracing: make tracer_init_tracefs initcall asynchronous
Message-ID: <202203120105.7vxKh4v9-lkp@intel.com>
References: <20220311112656.25348-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311112656.25348-1-mark-pk.tsai@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_093944_153028_30EC6D48 
X-CRM114-Status: GOOD (  15.36  )
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
config: sh-randconfig-r031-20220311 (https://download.01.org/0day-ci/archive/20220312/202203120105.7vxKh4v9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/134c5fb991a16bf28b500e8e52296447013b5b01
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mark-PK-Tsai/tracing-make-tracer_init_tracefs-initcall-asynchronous/20220311-192857
        git checkout 134c5fb991a16bf28b500e8e52296447013b5b01
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0x144bfc): Section mismatch in reference from the function tracefs_init() to the function .init.text:set_reset_devices()
The function tracefs_init() references
the function __init set_reset_devices().
This is often because tracefs_init lacks a __init
annotation or the annotation of set_reset_devices is wrong.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
