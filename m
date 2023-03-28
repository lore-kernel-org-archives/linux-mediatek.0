Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08701C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 17:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHE1RrCAJfJcGAB0JmqIHZ+SqLs404/w5VEFFqL6AXU=; b=KyztF2zi3hbOwAptapKJRSOX6s
	wphUf0XwLG1SGKSDWAOiHHfq1dfVDE7yrQaKL9ajm05/MCuX2N3qkfPws+ChP7dbIztpXlOx+91Ip
	FOHtZ4f6HwokhE62niASbsfOzq0MwxOVv2yOXUHYk3V0amjpIfS4jDgzixeJjUnxF0+nZXw6LO3Wl
	unTR2KBoUqQnLYhw7x/LsluBhZ6FX9bLemS1TRolo9jgSgP8sKqFErc2cQsj8/LIyTA+0NAehhQ46
	e81eltRLfhMKL3/izbx9JifmCPq2Mfjmeoa9sKxUubf1ohkkdhw9VbK2fQEFbCWp2IFeVfbT0A58m
	PjJXSaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phDXe-00FNoK-0Y;
	Tue, 28 Mar 2023 17:55:30 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phDXZ-00FNn0-2j;
	Tue, 28 Mar 2023 17:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680026124; x=1711562124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2VwTQJIr4BTFvryXJU5QaWYWC5ASSVnz8DiJqX6T0i8=;
  b=KOt43Tv8/ZAi+NtplNvSi+/YtkRXTQCkJ6hTqBDvX3J2XcYngqfv78xO
   ME/I9WHIBFueCw3YjplZNjvjrro7/+quvBDKpwlSSQajPB70/QOAClZIV
   +3IPNapodH5W2IdmKPpN3in2NG2nhvtY3absVRibYyg3UhId7iQliXQUp
   z5E5oToqocxihBLxe77gO71f79DPvNR7Tme/7N2RgleiSR9v++otGx4WX
   52Db1sIDBXOipIQLydSzmNGED6dy+uei697ErytTJYqolRFJ1+G/1UgPy
   M9ExiSfp7mdU7oqYbu5ewVjbDAwgsQAmCjhA0oWBQXSARgIDXPX8Vd7XM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="342235635"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="342235635"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 10:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="677459329"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="677459329"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Mar 2023 10:55:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phDXP-000Iml-0d;
	Tue, 28 Mar 2023 17:55:15 +0000
Date: Wed, 29 Mar 2023 01:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com
Cc: oe-kbuild-all@lists.linux.dev, andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com, mchehab@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Wei Chen <harperchen1110@gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix potential array
 out-of-bounds in decoder queue_setup
Message-ID: <202303290137.F9lOyCT4-lkp@intel.com>
References: <20230328100951.536955-1-harperchen1110@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328100951.536955-1-harperchen1110@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_105525_957212_F8CC7C3F 
X-CRM114-Status: GOOD (  13.16  )
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

Hi Wei,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.3-rc4 next-20230328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Chen/media-mediatek-vcodec-Fix-potential-array-out-of-bounds-in-decoder-queue_setup/20230328-181142
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230328100951.536955-1-harperchen1110%40gmail.com
patch subject: [PATCH] media: mediatek: vcodec: Fix potential array out-of-bounds in decoder queue_setup
config: csky-randconfig-r013-20230327 (https://download.01.org/0day-ci/archive/20230329/202303290137.F9lOyCT4-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/caa43627286fb5f3b0b3af7e01e1baeca5c5f9cc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wei-Chen/media-mediatek-vcodec-Fix-potential-array-out-of-bounds-in-decoder-queue_setup/20230328-181142
        git checkout caa43627286fb5f3b0b3af7e01e1baeca5c5f9cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/media/platform/mediatek/vcodec/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290137.F9lOyCT4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/div64.h:27,
                    from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/videodev2.h:59,
                    from include/media/v4l2-event.h:16,
                    from drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c:8:
   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c: In function 'vb2ops_vdec_queue_setup':
>> include/linux/compiler.h:56:26: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                          ^
   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c:756:17: note: in expansion of macro 'if'
     756 |                 if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
         |                 ^~


vim +/else +56 include/linux/compiler.h

2bcd521a684cc9 Steven Rostedt 2008-11-21  50  
2bcd521a684cc9 Steven Rostedt 2008-11-21  51  #ifdef CONFIG_PROFILE_ALL_BRANCHES
2bcd521a684cc9 Steven Rostedt 2008-11-21  52  /*
2bcd521a684cc9 Steven Rostedt 2008-11-21  53   * "Define 'is'", Bill Clinton
2bcd521a684cc9 Steven Rostedt 2008-11-21  54   * "Define 'if'", Steven Rostedt
2bcd521a684cc9 Steven Rostedt 2008-11-21  55   */
a15fd609ad53a6 Linus Torvalds 2019-03-20 @56  #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
a15fd609ad53a6 Linus Torvalds 2019-03-20  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

