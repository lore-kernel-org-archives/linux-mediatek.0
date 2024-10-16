Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA2BD2068C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 01:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqJQxpkaQ84Omq4S5BZS3eZAj9p52e6i4KObvOeZuE4=; b=oGR0b6oipcgwQ53yrd5m8yi5UU
	mM1Uuem34/+RIwFCzbPuK0rY5LjEW8gYQebi5pLedrx7Lquxcus8EB0P7J4tKIvI/iXYO+/1fq8oz
	kULeF3eTEQXXAPXmMmlkb1sy2OqIK3PJWf6Bh4ZTO+tZuJ69PZWgNstUpyVJ4x2/+ye5m7whsTeSn
	MVWJlI0JmiemOSjUbo0767Jwr24Vx+GKuTlJr4IFSbSxxEBov+6OPKpJhcmHgzesCgWHbUi6JaIVL
	+SfpxWX0nL1ysEupgi91/shj+BCR5RDabqo/Xl98i+TNminPWP7jp+B3LqQWIL3Z3fjmMQmqNR/HZ
	fB4UnonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0tB1-0000000AASB-15s5;
	Wed, 16 Oct 2024 01:50:15 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0tAy-0000000AARd-3LVH;
	Wed, 16 Oct 2024 01:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729043413; x=1760579413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ogJRD7lo4S6s+KuznmGPgcg7uHGMRwprMLi5z+gZn+8=;
  b=Iam0k9YUpAbORVuwsbsrn5kJd4JV1glKYsZPuNl6IobZLR3WhjeUQMdT
   MbQTOR/ROkUrF80r+hjvqUBGmMY3hUAP5NcjmLGr+/4orm4F1Jgx8LAKd
   UCFux6aHLQUyj1zQBhxa1foxGl7ZW/sXefuV9/fRJWCarwrE70HqcFAtY
   x9izeLKOR/NOTFSuBAbPybpa+tu2VAp9vplyrSSysuYW5UXMPaFInomqo
   a4bqLGclk8aGRopvrtFaUAp+KJGq4gwFN7KUrYqFCWwPTawZaKo3d0qCY
   JSn2lAvJC9dFjtAefrtctspru9/OJJodWRbaEJVoE35V8gxZnZou5puxV
   A==;
X-CSE-ConnectionGUID: Leksf/u9SIS2QbfIzS/uGg==
X-CSE-MsgGUID: ZiqFjczkSwWLqnEKZPFRBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28568957"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="28568957"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 18:50:10 -0700
X-CSE-ConnectionGUID: ooHWMSH5QEWTfsT6B5/V8A==
X-CSE-MsgGUID: nQ632r7fQSCDFT/zHroR2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78028952"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Oct 2024 18:50:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0tAo-000K9V-2K;
	Wed, 16 Oct 2024 01:50:02 +0000
Date: Wed, 16 Oct 2024 09:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 5/6] pinctrl: airoha: Add support for EN7581 SoC
Message-ID: <202410160957.YN6r1XvO-lkp@intel.com>
References: <20241013-en7581-pinctrl-v6-5-2048e2d099c2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013-en7581-pinctrl-v6-5-2048e2d099c2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_185012_903666_FE52237B 
X-CRM114-Status: GOOD (  11.81  )
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

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6dbd1577b7dc10263d515045ef6460e80d6c9afa]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-arm-airoha-Add-the-chip-scu-node-for-EN7581-SoC/20241013-060857
base:   6dbd1577b7dc10263d515045ef6460e80d6c9afa
patch link:    https://lore.kernel.org/r/20241013-en7581-pinctrl-v6-5-2048e2d099c2%40kernel.org
patch subject: [PATCH v6 5/6] pinctrl: airoha: Add support for EN7581 SoC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241016/202410160957.YN6r1XvO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160957.YN6r1XvO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160957.YN6r1XvO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2884:35: warning: unused variable 'regmap_config' [-Wunused-const-variable]
    2884 | static const struct regmap_config regmap_config = {
         |                                   ^~~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/regmap_config +2884 drivers/pinctrl/mediatek/pinctrl-airoha.c

  2883	
> 2884	static const struct regmap_config regmap_config = {
  2885		.reg_bits		= 32,
  2886		.val_bits		= 32,
  2887		.reg_stride		= 4,
  2888	};
  2889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

