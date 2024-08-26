Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC501C5321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwiSi/AMi5bCuUd7/iaGkc1OETinoYSm5HUDMFtEDMI=; b=zMqiuX9Nnasf1qLdt+iAvzYvi0
	0+9aTzrYNEnE13JWM85pcawZ15T5QEWeY46TzRtu+b9wm6+c3AMqk+c1bSrv04w8gwakdmLsRo6jF
	ZxyLoaUdggquinayUYwwbfiK5sO4vJmlnZijNqozZ0JRky0we7yJGP/wzuSkgiW9veB7HJYbqO7n4
	SL/dWlUXkk9gLyCTQEK8eNGamvhXs+eTf1CTDXshkkyS8A0ar9eCm4k17G+BwIf/7OHjwTUBquEZT
	bVwaLwSArukItP/hEcGXHyi9aIs05hH7zVrM5lQy5CTfrjFA95hwRjXIVcC4/os/PoD5qAmFPMBIU
	Lh5SkTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZeW-00000007U6v-3lbg;
	Mon, 26 Aug 2024 13:21:00 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZdi-00000007Tsr-0mhG;
	Mon, 26 Aug 2024 13:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724678410; x=1756214410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E3jqWk0quNbd2DIIwzH2hsPPy6kfLMiKIT4k5BaQN9I=;
  b=fLQasExfKGsnG0T/yHgv8KAo+9KixDrHRM2ORMvn4YstVPY46vqz359F
   cAneung9Oe6wk0M0DKWGMmzTsJtNuNH4NCGK7Trut84dosi9rj3KZ03tR
   W96HW35ihhYuvRnKWztRgrIfi6GkjkbM+kaBCXzH+61NRLeGRj/4tNIeY
   jO8MX3i1Q2zknQIp3/Kpd9MhTq/QrSmDWo1FBGFtUYicYOICJiUhWGjHj
   Rgpj9O8HaU1kMy5IoIP4cFXO8W/L40cFXLdCl3KaNFPrK4u3i52TMYT00
   svXJnIylTfBy2MOq+bSNmEEMbd3U/TIRdLqdhu2egvXQdvwbdNv6Civt9
   g==;
X-CSE-ConnectionGUID: 5twvcQj5SI2WBTEzH+nXVw==
X-CSE-MsgGUID: 4adT0U4vQ1+mJCQechWNxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23266507"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="23266507"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:20:10 -0700
X-CSE-ConnectionGUID: pEF2z3PSSqO4UPPXQmj/yQ==
X-CSE-MsgGUID: J7nWDYN7R/mm5vWIQnhyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93233605"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 06:20:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siZdb-000H6x-0H;
	Mon, 26 Aug 2024 13:20:03 +0000
Date: Mon, 26 Aug 2024 21:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <202408262013.YYc4obi2-lkp@intel.com>
References: <20240822092006.3134096-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_062010_265952_68202BEF 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on robh/for-next wsa/i2c/for-next linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/of-dynamic-Add-of_changeset_update_prop_string/20240826-105737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20240822092006.3134096-3-wenst%40chromium.org
patch subject: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup code to of_regulator.c
config: i386-buildonly-randconfig-003-20240826 (https://download.01.org/0day-ci/archive/20240826/202408262013.YYc4obi2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262013.YYc4obi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262013.YYc4obi2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/regulator/devres.c:15:
>> drivers/regulator/internal.h:87:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct regulator_dev *' [-Wint-conversion]
      87 |         return -ENODEV;
         |                ^~~~~~~
   1 error generated.


vim +87 drivers/regulator/internal.h

    82	
    83	#else
    84	static inline struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
    85								    const char *supply)
    86	{
  > 87		return -ENODEV;
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

