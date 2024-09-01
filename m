Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A151CA101E
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Sep 2024 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/FL66kNp186GKOdmXM+XWMwptPlQO2wFqvQNiCGvJs=; b=sdydJmNTKTKdF/Ti0bOPVl8Vmw
	DpfsmF7eEADbMEaQJzmD/sZdAX9vEe0AuD1WKW04y5S/puO7Lm/pPwlTV3sapBUbBRvwV4Nxbfl57
	RzwtvbXcAMjbNC7cREZW30ZlsVRI9/VINF8NK4u1PFqZ/DvVc/shzrvXdoiBub4Du5Z0mNFnq3b1E
	lQJuzdA4fPUotgNYPZZ0qD+JqQfUVZvsfCLapFF0s8u5WskOVrRstDv97HYLH0uZLFQj8Vh9YKglG
	pPGtBs9OwYieVy+nc6YBoApZJbHdmGvijhBa9AcvZNcb0PZTTdkrQHtlXo1BixqhVOrXnoQy+TJR6
	XCpUMcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skkdR-0000000BhNZ-3NY3;
	Sun, 01 Sep 2024 13:28:53 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skkdP-0000000BhMx-0TsD;
	Sun, 01 Sep 2024 13:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725197331; x=1756733331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B1Ym6T0bBnsNcRUf8vZAOZRZpf/YLk3MxfySZOJtVwY=;
  b=dbBTpMy3RKhDOPKZU/FS3iUr85CDRRZTU+Y3gXME3LtV2vWxnTSZJxa/
   dSixG5T0TIm2AzT4SR5abt6hUuEKpHjCrfszY3Ept1Aq49cR8MB20i+o9
   AurgscJTMQAzAdf+8g/l5QYaZ1cYXvA+VSB4hlW9Hzt0MuM61JhcQk9p/
   GY/0Tapi/aOhOQYhvw2R7x3LwMlAhxIa7A3U04Hv3Kp3xjt0ldZNHiipd
   aYqKgArf4HiOueLdSPqQcJol46qk0GGDR9gOvECO8pvnu8HT4/geFqIto
   z/Z1u6LGAc1HsMMdZB5mBmHzh946PsZIG0wWcYFrs2eEjV9zaty/uudZI
   Q==;
X-CSE-ConnectionGUID: MoUP+0kbQNW4XVx2OBFrwQ==
X-CSE-MsgGUID: oXNdDU9gQ5ycro+2/S9dxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34446833"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="34446833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 06:28:49 -0700
X-CSE-ConnectionGUID: N7yVSMzrQCWOdRkFLSXZvg==
X-CSE-MsgGUID: IjNOdIuCTVue7+VsX/XmMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64388335"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2024 06:28:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skkdG-0003gf-2L;
	Sun, 01 Sep 2024 13:28:42 +0000
Date: Sun, 1 Sep 2024 21:28:15 +0800
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
Message-ID: <202409012045.91oDLtEE-lkp@intel.com>
References: <20240831-en7581-pinctrl-v3-4-98eebfb4da66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240831-en7581-pinctrl-v3-4-98eebfb4da66@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_062851_222054_3C18FF5A 
X-CRM114-Status: GOOD (  11.32  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on defaf1a2113a22b00dfa1abc0fd2014820eaf065]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-arm-airoha-Add-the-chip-scu-node-for-EN7581-SoC/20240831-222958
base:   defaf1a2113a22b00dfa1abc0fd2014820eaf065
patch link:    https://lore.kernel.org/r/20240831-en7581-pinctrl-v3-4-98eebfb4da66%40kernel.org
patch subject: [PATCH v3 4/5] pinctrl: airoha: Add support for EN7581 SoC
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240901/202409012045.91oDLtEE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409012045.91oDLtEE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409012045.91oDLtEE-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/pinctrl/mediatek/pinctrl-airoha.o: in function `airoha_pinconf_get':
   pinctrl-airoha.c:(.text+0xa7a): undefined reference to `__ffsdi2'
>> m68k-linux-ld: pinctrl-airoha.c:(.text+0xb5e): undefined reference to `__ffsdi2'
   m68k-linux-ld: pinctrl-airoha.c:(.text+0xc2a): undefined reference to `__ffsdi2'
   m68k-linux-ld: drivers/pinctrl/mediatek/pinctrl-airoha.o: in function `airoha_pinconf_set':
   pinctrl-airoha.c:(.text+0xf84): undefined reference to `__ffsdi2'
   m68k-linux-ld: pinctrl-airoha.c:(.text+0xfda): undefined reference to `__ffsdi2'
   m68k-linux-ld: drivers/pinctrl/mediatek/pinctrl-airoha.o:pinctrl-airoha.c:(.text+0x10b0): more undefined references to `__ffsdi2' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

