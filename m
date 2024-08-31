Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B77CD1297
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59ZJ3OgUdIYyXvWX/Jj6HD+0T/jfFSl0CJX84upiO1o=; b=bvpqm+Rc77nFgITskDZP4PRYbY
	rczSlv/79NXB2iYeQeSZfMOZVxeeS40V1Q0o1RBrlgjs1RzLKoGOBs08aSmNFYl9xxZGl6O8ovbom
	ahtsM/RBtdfslSk2gFzGcBKfRRn96fs8LkTzD4mr/QDmKJwBizLgt8kYiCiEgA17PpnwSbex9h40u
	bL7ouTzGDDpUiiD2wocMvm5XChZke25T5k+5KguJTqFdlrjj5L9WeL54RUu1padUMyl6KqOZv9IeM
	DSL7n+OdH0Smz+zfaV2O3Et/yST5Q1tswtTkgrqEhevuUsw4LP+o12idOjIEWPnU2aPoxL3I5EoBz
	MaGULDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skS0V-00000009lwc-0EYC;
	Sat, 31 Aug 2024 17:35:27 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skS0S-00000009lvl-0Ib6;
	Sat, 31 Aug 2024 17:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725125724; x=1756661724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XN2PsVitdwqyT+0EuFJyx51meuS/idl3glEF5fMYEO0=;
  b=S/5qXrzE3Dv8Clgfpk8KAncNoXR94bVaZokg8uAg5bLKsYUe/z0DR5rJ
   t/lPE5966n/PWBYnaOPTQ3nto35hnn5DxXvJcBXNJ9Gyeq8BFmJDeeDwH
   kTPwG8XTAcUwci9HJP5TQ6ACkxz+g7qO+Uv8wISJ2lY7xxvKHlFtiKBti
   wRbceAqujf6Mua1ULF49C9VGRHXOodls3UalhowGsQePGPeyYhVTkXl/h
   IJAAm0rPJYBqZoWJvdipCc5g+lSEnqetpP7oLJHAkpkHhWG2BLp8bhA1z
   rV7+wVGBk9gqECw8ndKX7B8DNxCMQ9t2P8w2Y1S/eiOiJTDTQAlOsSc0Y
   Q==;
X-CSE-ConnectionGUID: GLdZL226Tym575SAcbR9oA==
X-CSE-MsgGUID: TxUNHjNlS/2WUQgCeW24vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="46258299"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="46258299"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 10:35:19 -0700
X-CSE-ConnectionGUID: PT2O5JZcSyCtWNy+z3Irog==
X-CSE-MsgGUID: qyimSlEjTtmy07lmiKhruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="63885974"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2024 10:35:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skS0G-0002yK-0M;
	Sat, 31 Aug 2024 17:35:12 +0000
Date: Sun, 1 Sep 2024 01:35:06 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	benjamin.larsson@genexis.eu, ansuelsmth@gmail.com,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 4/5] pinctrl: airoha: Add support for EN7581 SoC
Message-ID: <202409010106.kqFZrO3g-lkp@intel.com>
References: <20240831-en7581-pinctrl-v3-4-98eebfb4da66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240831-en7581-pinctrl-v3-4-98eebfb4da66@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_103524_214367_D1892BA5 
X-CRM114-Status: GOOD (  10.98  )
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

[auto build test WARNING on defaf1a2113a22b00dfa1abc0fd2014820eaf065]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-arm-airoha-Add-the-chip-scu-node-for-EN7581-SoC/20240831-222958
base:   defaf1a2113a22b00dfa1abc0fd2014820eaf065
patch link:    https://lore.kernel.org/r/20240831-en7581-pinctrl-v3-4-98eebfb4da66%40kernel.org
patch subject: [PATCH v3 4/5] pinctrl: airoha: Add support for EN7581 SoC
reproduce: (https://download.01.org/0day-ci/archive/20240901/202409010106.kqFZrO3g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010106.kqFZrO3g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

