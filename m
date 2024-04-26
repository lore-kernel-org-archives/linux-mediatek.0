Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC8DC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 02:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLlQJUd+h/8YBvzmBBPlNG7KT72qJaz6fU64U57uZ8s=; b=UcH8zB5Tw/2HtsPaX/Cu0SpYYC
	dWnRnd4CcoVYqWVz4IPnVRuruBh5gT42hYO3f6QzsfhOzsAztycqSNIzLih6N/eSHhTtc5uS3zY7w
	lmHkeF5t6UtgN2cMSKbI9ncEAaGql6Q6Ra4IMXocKzLRrKpDOi09hic9cwe2vZud+hPPonlbuYPWZ
	IQx1oBaf2ikE/rI4HDUe09Qg8xzcmIt/CUP0XhEwKeQ4km2HVXLH97OZdh6eaKOrpSaV+4AHnylKz
	qRo3km9m1XjRrEIiLafb2U3ZVl7aLUxfR8x4kEM6632WSvdAGsNmkdgqcQGkweY7w97LfJ5W/YeXe
	HlUK0b4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0BKh-0000000Asjd-08gq;
	Fri, 26 Apr 2024 02:29:03 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0BKb-0000000AsiW-3scd;
	Fri, 26 Apr 2024 02:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714098538; x=1745634538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a7GCnBwqMy29DV7yfejurYzqI+BjrI2g+dPqUPElVxY=;
  b=Kw/cpDiLx/t2TBgKj2EeOEq5Zd7TZtnqpmk43w1NbPYU2TFBXeCLpdKH
   ISUKRzxgNTyShM5LO8gNDnD+mgfBDDOH2L7v/+qwGWasI5b1SegNvYH00
   QD9n80mh/zb8YVdbNBxn/4J38Rb55v0RrD4ncA5fTty1J+BnEuoD0/vtP
   CFiDPVqpKHUNn/kKHVNhsihT4yKTaQidoP81FBKslt3/l51oaX7Da3hx2
   nIKAoJSlPS2anTR4DNS7A2UPyKsVu4RXz0VG2P6ZYXacsMo4q9oPx2ssh
   o3qDANUIGBTrGH64gSwkQLY2wNzHORnj2hpO3PVv2WJcu414x49z0p/8T
   w==;
X-CSE-ConnectionGUID: rHeiNHdbRM602e+N0DlHLw==
X-CSE-MsgGUID: C1VcuA1IQ7+HN4rsgIWNXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9658993"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9658993"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 19:28:31 -0700
X-CSE-ConnectionGUID: Muomi0QGS/GUkiANgz9eDA==
X-CSE-MsgGUID: i31M9VSMRcKlVW3m4otSoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="25276471"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Apr 2024 19:28:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0BK4-0003Ai-29;
	Fri, 26 Apr 2024 02:28:24 +0000
Date: Fri, 26 Apr 2024 10:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Steven Liu <Steven.Liu@mediatek.com>,
	"SkyLake.Huang" <skylake.huang@mediatek.com>
Subject: Re: [PATCH 1/3] net: phy: mediatek: Re-organize MediaTek ethernet
 phy drivers
Message-ID: <202404261047.Dx118RCc-lkp@intel.com>
References: <20240425023325.15586-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425023325.15586-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_192858_037112_803BCB6B 
X-CRM114-Status: GOOD (  11.16  )
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

Hi Sky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240424]
[cannot apply to net-next/main net/main linus/master v6.9-rc5 v6.9-rc4 v6.9-rc3 v6.9-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/net-phy-mediatek-Re-organize-MediaTek-ethernet-phy-drivers/20240425-103608
base:   next-20240424
patch link:    https://lore.kernel.org/r/20240425023325.15586-2-SkyLake.Huang%40mediatek.com
patch subject: [PATCH 1/3] net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
config: i386-kismet-CONFIG_NVMEM_MTK_EFUSE-CONFIG_MEDIATEK_GE_SOC_PHY-0-0 (https://download.01.org/0day-ci/archive/20240426/202404261047.Dx118RCc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240426/202404261047.Dx118RCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404261047.Dx118RCc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NVMEM_MTK_EFUSE when selected by MEDIATEK_GE_SOC_PHY
   WARNING: unmet direct dependencies detected for NVMEM_MTK_EFUSE
     Depends on [n]: NVMEM [=n] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
     Selected by [y]:
     - MEDIATEK_GE_SOC_PHY [=y] && NETDEVICES [=y] && PHYLIB [=y] && (ARM64 && ARCH_MEDIATEK || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

