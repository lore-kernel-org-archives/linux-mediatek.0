Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB14C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9/5selkZ5yrUPeYdPcazBN4tA41LO6FprFdrctunnM=; b=KAhEEfJcciRX4fSXlIO1gJEOkL
	KaxmxUiVsBYFm3Qo6gMQJ7ybPWagK2Pp/K0cK00TDfkEjZESTZtb+lar5hzR2KSm9SD8q8BB8wHFW
	nM9y6S0zMmv6D+7A1jLp486LdYAssmCK0jg96258GMbvM12ZReDNY5BsNZJo22lC/1GClzPVgFhkM
	W8zQ41Fzt63doWEQti4TA72F94LQIluYiRDT8qFZTsQpp5GRrmku1C+Sb9niuCfXGgxQvjOuVlGNd
	M7m3qNlFbxi8H995SFgh2JvxqEQSFG8aR0GLpTPaHlzjGi/DEE/PzvqTbXImUbYEY9dvauyMfBr1L
	pD3KdPUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q66Sa-00EqZM-1S;
	Mon, 05 Jun 2023 09:25:08 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q66SV-00EqXe-2S;
	Mon, 05 Jun 2023 09:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685957104; x=1717493104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n4xRGPRm/p5MAs4bYzHa8ejdar9i5Ity0Y5LODvyDkw=;
  b=JTCwRBfWfC7WW2Av7jB1MTUcH4Dd5wcRshMUAUQbyEl/vH4pUuNHpSeb
   fG0NrSnIb+YRk4hU3ojSXc/FDBI1FQRhkBQxl85jxNw+art2zE4NWXwC/
   jTw/ihhlQFRseH/PJQRuTcMVbHgBkHWM5IqbHm8GexjXGv6wuKbr4Z4LJ
   FSjB9gsQtiWfvld09B1bLhuswY2MiChP18ljhKr8YOXkbR/o1vPW5fQ+0
   Qmcj9AibFY/yQsN/m4qEvchf40fsOr5v21bWUuhxlL6ZZ6SWJZqcMBcp+
   js+J8wRATk9feeYMUql+C3cvY8jKE22V+CiO5nwSdaMMeI4ZRtp6nGjim
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="336679220"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="336679220"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 02:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="711748842"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="711748842"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2023 02:24:57 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q66SO-00044B-1B;
	Mon, 05 Jun 2023 09:24:56 +0000
Date: Mon, 5 Jun 2023 17:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ritesh Harjani <riteshh@codeaurora.org>,
	Asutosh Das <asutoshd@codeaurora.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [PATCH v3] mmc: mtk-sd: reduce CIT for better performance
Message-ID: <202306051755.pR3fhYlB-lkp@intel.com>
References: <20230605060107.22044-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605060107.22044-1-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_022504_185791_45E30BD0 
X-CRM114-Status: GOOD (  15.14  )
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

Hi Wenbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on ulf-hansson-mmc-mirror/next v6.4-rc5 next-20230605]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenbin-Mei/mmc-mtk-sd-reduce-CIT-for-better-performance/20230605-140238
base:   linus/master
patch link:    https://lore.kernel.org/r/20230605060107.22044-1-wenbin.mei%40mediatek.com
patch subject: [PATCH v3] mmc: mtk-sd: reduce CIT for better performance
config: openrisc-randconfig-r035-20230605 (https://download.01.org/0day-ci/archive/20230605/202306051755.pR3fhYlB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/225e46f420d48f7ad73253636a0553bd5f986435
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wenbin-Mei/mmc-mtk-sd-reduce-CIT-for-better-performance/20230605-140238
        git checkout 225e46f420d48f7ad73253636a0553bd5f986435
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/mmc/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051755.pR3fhYlB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./arch/openrisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/mmc/host/mtk-sd.c:7:
   drivers/mmc/host/mtk-sd.c: In function 'msdc_cqe_cit_cal':
>> include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/mmc/host/mtk-sd.c:2470:25: note: in expansion of macro 'do_div'
    2470 |                         do_div(hclk_freq, 1000);
         |                         ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
>> include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/mmc/host/mtk-sd.c:2470:25: note: in expansion of macro 'do_div'
    2470 |                         do_div(hclk_freq, 1000);
         |                         ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u32 * {aka unsigned int *}
   drivers/mmc/host/mtk-sd.c:2470:25: note: in expansion of macro 'do_div'
    2470 |                         do_div(hclk_freq, 1000);
         |                         ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u32 *' {aka 'unsigned int *'}
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
>> include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/mmc/host/mtk-sd.c:2473:25: note: in expansion of macro 'do_div'
    2473 |                         do_div(hclk_freq, 100);
         |                         ^~~~~~
>> include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/mmc/host/mtk-sd.c:2473:25: note: in expansion of macro 'do_div'
    2473 |                         do_div(hclk_freq, 100);
         |                         ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u32 * {aka unsigned int *}
   drivers/mmc/host/mtk-sd.c:2473:25: note: in expansion of macro 'do_div'
    2473 |                         do_div(hclk_freq, 100);
         |                         ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u32 *' {aka 'unsigned int *'}
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
>> include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/mmc/host/mtk-sd.c:2476:25: note: in expansion of macro 'do_div'
    2476 |                         do_div(hclk_freq, 10);
         |                         ^~~~~~
>> include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/mmc/host/mtk-sd.c:2476:25: note: in expansion of macro 'do_div'
    2476 |                         do_div(hclk_freq, 10);
         |                         ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u32 * {aka unsigned int *}
   drivers/mmc/host/mtk-sd.c:2476:25: note: in expansion of macro 'do_div'
    2476 |                         do_div(hclk_freq, 10);
         |                         ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u32 *' {aka 'unsigned int *'}
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
>> drivers/mmc/host/mtk-sd.c:2489:11: error: expected '}' before 'else'
    2489 |         } else {
         |           ^~~~
   cc1: some warnings being treated as errors


vim +2489 drivers/mmc/host/mtk-sd.c

  2453	
  2454	static void msdc_cqe_cit_cal(struct msdc_host *host, u64 timer_ns)
  2455	{
  2456		struct mmc_host *mmc = mmc_from_priv(host);
  2457		struct cqhci_host *cq_host = mmc->cqe_private;
  2458		u8 itcfmul;
  2459		u32 hclk_freq;
  2460		u64 value;
  2461	
  2462		/* Since MSDC CQE uses msdc_hclk as ITCFVAL, so driver should use hclk
  2463		 * frequency to get the actual time for CIT.
  2464		 */
  2465		if (host->h_clk) {
  2466			hclk_freq = clk_get_rate(host->h_clk);
  2467			itcfmul = CQHCI_CAP_ITCFMUL(cqhci_readl(cq_host, CQHCI_CAP));
  2468			switch (itcfmul) {
  2469			case 0x0:
  2470				do_div(hclk_freq, 1000);
  2471				break;
  2472			case 0x1:
  2473				do_div(hclk_freq, 100);
  2474				break;
  2475			case 0x2:
  2476				do_div(hclk_freq, 10);
  2477				break;
  2478			case 0x3:
  2479				break;
  2480			case 0x4:
  2481				hclk_freq = hclk_freq * 10;
  2482				break;
  2483			default:
  2484				host->cq_ssc1_time = 0x40;
  2485				return;
  2486			value = hclk_freq * timer_ns;
  2487			do_div(value, 1000000000ULL);
  2488			host->cq_ssc1_time = value;
> 2489		} else {
  2490			host->cq_ssc1_time = 0x40;
  2491		}
  2492	}
  2493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

