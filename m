Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992CAC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 11:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBN4JVV9RjcEbb9KVdCkUUpF2H5HX4MsBTRJ07knrOM=; b=UaL+myP1Zc6k0Tfw7wrsfVPL5k
	sYq7iIoc29JAhzgCyzh6eOVPzytgkacwfrkFiNKERwHM5S9aLJ99A4oJoCAjV9tq8PkINfSJH/lm+
	GIuoqiFdiWW2GdT+KdNCDwGuSjZPrMn+8/bvph4UzB8pBsWJ9Yb0nMXVAONHk+u2sAtc10WlX8TJq
	N2Aowz7+A6LInLU6J+WdP1mjfCCTw+IN+L4sF9qmeMQlt/rvv4lq4g2kr5UrZ77AZER73n0/SF/nA
	VljWfS8ExcJgZD7UhMQam77mS1P+QxfeIvsV7ZcL5bP2EklvCMjRdsvhzwuby7t4iRLuiYRAeW/2a
	ruGpEjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOyLd-0000000A2x3-1knH;
	Wed, 03 Jul 2024 11:40:29 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOyLQ-0000000A2u9-1yJm;
	Wed, 03 Jul 2024 11:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720006816; x=1751542816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S9U3sM9N5A0LiKw6Q3g4fEO8EPPuQt5Lh9IuVLH+CKM=;
  b=B64uKIJTJsKpGo1JOTw/GUSdZGeEj20uuiIHO45Pzw5xlkz/VrmIuc7G
   mv8fs9ZTF/NcCPYyFgQ2VF3mSri32dP602a3CiHbx4kES4BWrFpr1O6Yu
   ESyZzsyE2asWFt7cA7Hmll6uZsJwchsaWA28eMsS2CBkpbqS6HnNN31hC
   Ewt4ixLwYkLVdCiYHfAj/PHciLTsOP8NPFo0PccYgLRl6DV75as2Vt79n
   AJ2QXpREn5ZD/qjpJPg3yOzVzl2Ud+TUE8r9eVueUpIij+GqJuqg+yfvz
   Pq9GWrpi2tDsNntZFYeINnH98Ba1KaO6Ioz+lrI3dWFD0ip4cVzUF+duE
   Q==;
X-CSE-ConnectionGUID: Cw8t2huUR2G4kPXeE6qFWA==
X-CSE-MsgGUID: /gQ9DSCVQAy3xjRjiZQ5PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16884910"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="16884910"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 04:40:14 -0700
X-CSE-ConnectionGUID: AkWT8IW8SJ28jeGL1Ftfmg==
X-CSE-MsgGUID: Y55JEonPSJqeOYx9X3Qd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="46007675"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2024 04:40:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOyLI-000PfO-2w;
	Wed, 03 Jul 2024 11:40:08 +0000
Date: Wed, 3 Jul 2024 19:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: Leith Bade <leith@bade.nz>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, frank-w@public-files.de
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, didi.debian@cknow.org,
	Leith Bade <leith@bade.nz>
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt7986: add gpio-hog for boot
 mode switch on BPI-R3
Message-ID: <202407031954.bBLv9YRp-lkp@intel.com>
References: <20240627075856.2314804-3-leith@bade.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627075856.2314804-3-leith@bade.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_044016_642848_5C65E04C 
X-CRM114-Status: GOOD (  10.85  )
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

Hi Leith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leith-Bade/arm64-dts-mediatek-mt7986-fix-the-switch-reset-line-on-BPI-R3/20240628-001353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240627075856.2314804-3-leith%40bade.nz
patch subject: [PATCH 2/4] arm64: dts: mediatek: mt7986: add gpio-hog for boot mode switch on BPI-R3
config: arm64-randconfig-051-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031954.bBLv9YRp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031954.bBLv9YRp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031954.bBLv9YRp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pinctrl@1001f000: 'boot-mode-hog' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7986-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@31: 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

