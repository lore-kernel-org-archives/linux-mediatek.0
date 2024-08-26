Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CEEC5321D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5qyV0V8w2ikVnVyHBWh5QpGl7/llaDY3xiKOiW7ZhY=; b=BpEGP8c1A/9UIUWVFbMa0ntol5
	g0oNTjIf+M2dIlsrOlGJb+RTOuyAmZ16pu7dAVujttIt6+AsCQds4cB4B8mPlPy5G+HobIG1EFNCf
	UOHllncP8KwNIRhxsCtpvQlnIlts45WeTsJvm67vvGI+ocjhySOILaOVfY71AGVGITMWIXOGQzQT+
	o1fA9JfzrcWoifRfgtALh3GRAyCFpdcTOWlIR604safTdeOzoLIRVnGeXt/Jb7vWu4/dUg15k2hhE
	xtUfgt/fVBuKj85y6YPWfVQy6G9QS79GzfRtRPIMZ4nYtZrlKm7z68vMLjejwkrqRK7PICVvAFMXl
	EtItiXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siYYP-00000007GGQ-1lwU;
	Mon, 26 Aug 2024 12:10:37 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siYVI-00000007F8Q-2PbR;
	Mon, 26 Aug 2024 12:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724674044; x=1756210044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q6zAaais8yQO7/lj2YLHErYNNLiGQAdftv65IYjCPsw=;
  b=kJIIlvU8PzR143AkOxvE2uv8dYwSYCsYz7sHmKq6X9It+R5A2dNjAtK+
   CnpNMEfMXoANWprVZFfwgoiI8IcasU/6u4tEJLdjOVTI6NGmI4i7rTGkq
   pxKjD5hbAOjb5lummTE8uAy3MWxcJ4cm9eFU81y1Rko6/m44H17dIqMxk
   A/xA0KQF7USuhlNuDneIKtlMQwUY0YdOwd1oqQtHd/yu3bzz4ZcXi/Vw8
   NgEgganE+G9uwcRMHy5MaBrPUKpWMSmrkyKmqvjLvitQwNhVkBK24XjmE
   J/3MH7kuikklfIQLFLl9vn8OSpD+kp+kyaAWs5ARKr9WYsSLOG5H9Sv2i
   w==;
X-CSE-ConnectionGUID: tRxiFq7rQ3SkYJXX1V3Hpw==
X-CSE-MsgGUID: 4LmUUbhHSyigFXJyUPk/Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33754876"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33754876"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 05:07:05 -0700
X-CSE-ConnectionGUID: Yra7qN0AQKaieBzWERPjtA==
X-CSE-MsgGUID: WsjGkh2XSXCcq71a+8i8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="63010400"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Aug 2024 05:07:01 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siYUs-000H0x-0n;
	Mon, 26 Aug 2024 12:06:58 +0000
Date: Mon, 26 Aug 2024 20:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <202408261956.PHxQEruO-lkp@intel.com>
References: <20240822092006.3134096-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_050724_655744_EB54FD78 
X-CRM114-Status: GOOD (  12.98  )
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
[also build test ERROR on robh/for-next wsa/i2c/for-next linus/master v6.11-rc5 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/of-dynamic-Add-of_changeset_update_prop_string/20240826-105737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20240822092006.3134096-3-wenst%40chromium.org
patch subject: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup code to of_regulator.c
config: parisc-randconfig-002-20240826 (https://download.01.org/0day-ci/archive/20240826/202408261956.PHxQEruO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408261956.PHxQEruO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408261956.PHxQEruO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/regulator/helpers.c:17:
   drivers/regulator/internal.h: In function 'of_regulator_dev_lookup':
>> drivers/regulator/internal.h:87:16: error: returning 'int' from a function with return type 'struct regulator_dev *' makes pointer from integer without a cast [-Wint-conversion]
      87 |         return -ENODEV;
         |                ^


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

