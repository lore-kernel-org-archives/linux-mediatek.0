Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76597606A33B
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 19:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ydNslvYM;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nDHtOsaW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U6jYZ+Xb2RUTQwwnMpQL3qOxWFKiJS39xLrqJeDZ5fA=; b=ydNslvYMyRayFaMrQjNHUI+iFK
	A1E1L1pdpRGINssKXWZe5QAr+1o4m6cAImklhNusEqzOXAgV3jW/SuGaNoNvbpyRwyrb6ln8MkdRS
	I7xZac6Tttoke/xT1ILSTKS7NDzuChE3C8kBeE5WMeNE0C4gFo3Kx2/jvcSsR+EHj5Oz0PCGEog7Y
	zxlyvCfwqNQWw4ewhYZ66ArG6a9PgoQf3gXWuYnLh6DWuLQROP1PKfqOuF7/sIBFuOsvI90sIiBS7
	5Yhq5xHBNQYmWcOPMnQBj62AwfOg4wqriDW0s8qCEYKbBEkcLsqRbuyRcortEXHxynCeHGKvg3w59
	FJylysrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRx0l-0000000EBwy-0I7K;
	Fri, 13 Nov 2026 19:32:35 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRx0g-0000000EBuq-0Dmk;
	Fri, 13 Nov 2026 19:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794598350; x=1826134350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C16sG7RV76XLEk2qA+4C2ckJRlKBWDd3KFO09Alt5n4=;
  b=nDHtOsaWlRVrLxBj9sJ09EwpdtSy299KoHVHp44hfqGLGUWjBIo5XcxA
   fDBy6ZSoMIshYImIcOcdwZ4cXfaAYNgs4abNWPxBj9ModzuoOsyJcT4B7
   fuyJCxewTzksJK/LnIIbykPJwXA9NH0WWz5t1MvgPmLsW5wXAZnAC2v03
   sbthl3K6vFb7R9vrtZJXyk6DnIyEhTz2tXR/7+ltlqoKtFbtiG7JQC8/p
   0i+Qx29aSCyaLVkY2nAwIN7y+v7vV329i+JsPmzBFSOccms+1eOW2v2WU
   h0b7gfR7ZtY0G1lAGxIxxYVH+ZNDKOflvl0kQLcFPQfDtSM1FbAPBoGk1
   g==;
X-CSE-ConnectionGUID: gZHQ9QlqT7GEFEAx3Q2ETA==
X-CSE-MsgGUID: L6qdw/WLQL2d66IHUmAJKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3412652"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3412652"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 11:32:28 -0800
X-CSE-ConnectionGUID: vuBoyPenQ9GazlmpB0O6zA==
X-CSE-MsgGUID: WCFSVtONQaugQB+cZYtX7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="10784803"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 13 Nov 2026 11:32:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRx0W-000000013o9-39fS;
	Fri, 13 Nov 2026 19:32:20 +0000
Date: Sat, 14 Nov 2026 03:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: John Crispin <john@phrozen.org>, Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Rajeev.kumar@airoha.com,
	upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH v2 3/3] i2c: mt7621: add support for Airoha AN7589
Message-ID: <202611140348.p9TnfxBF-lkp@intel.com>
References: <20261112185820.1315718-4-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112185820.1315718-4-john@phrozen.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_113231_361642_F7BE8316 
X-CRM114-Status: GOOD (  14.51  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on andi-shyti/i2c/i2c-host linus/master v7.4-rc2 next-20261112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Crispin/dt-bindings-i2c-mt7621-add-Airoha-AN7589/20261112-195819
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261112185820.1315718-4-john%40phrozen.org
patch subject: [PATCH v2 3/3] i2c: mt7621: add support for Airoha AN7589
config: sparc-randconfig-1000-20261113 (https://download.01.org/0day-ci/archive/20261114/202611140348.p9TnfxBF-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140348.p9TnfxBF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140348.p9TnfxBF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'mtk_i2c_init',
       inlined from 'mtk_i2c_probe' at drivers/i2c/busses/i2c-mt7621.c:364:2:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_437' declared with attribute error: clamp() low limit div_min greater than high limit div_max
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:188:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:195:2: note: in expansion of macro '__clamp_once'
     __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
     ^~~~~~~~~~~~
   include/linux/minmax.h:206:28: note: in expansion of macro '__careful_clamp'
    #define clamp(val, lo, hi) __careful_clamp(auto, val, lo, hi)
                               ^~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mt7621.c:308:17: note: in expansion of macro 'clamp'
     i2c->clk_div = clamp(rate / i2c->bus_freq - 1, div_min, div_max);
                    ^~~~~


vim +/__compiletime_assert_437 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

