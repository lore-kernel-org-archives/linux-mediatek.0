Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDF9C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTYQh8X78OINtvsKkA9QbmHrhCYoK0nxsRg5tpKo6QI=; b=XWo6N+Jx6Y1TVja8YfFyCaXMI4
	EBJfE8/aSRldklEN1flWl2XVLznyPo2PhGgNJ4OLUEZKX0qPDTk12Og/Q8XQUK85RNVe7PQYNVHDw
	rmhep+aSI+sW98XfCS8EamwHou9u1wfo4KKLBSMlIixl+DbeTlHNfEJlNWDCIHJIz779gdz7sFNCv
	kV7wmrP/wpEWwAfJjfNryF5Dl8+h/4Wiz0HgamynUJpca6B4Vpxk47oSaYJ2cH5y5DsiUt7aArPCX
	VT+Ft5AYcPoS/NtxMazpOsAGmZhfq//W17fv5Xgqcl1CkUM8StT4ruB2OYjPTHVwkVrXRAXAALvAG
	KqB8rQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03UL-00000009fBo-141Q;
	Thu, 25 Apr 2024 18:06:29 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03UH-00000009f9U-03H0;
	Thu, 25 Apr 2024 18:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714068385; x=1745604385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BDad7BMP0Go/r5l+KQ6WZzGzf90LuHfz7J8+KLDA4ZY=;
  b=BIdTrPpNabANirCHtknNXOMcRRhkzVPUGQSW96T0lPcZoIRKhqDlngEq
   uLLXl8ns63IV4aGtaMF6kXpGr13Tgh3VOcdk1OZzrkd5Cc8LM9FSQzomk
   rciK8H3NNNurDbR+nK7R9c+dGBPAzgbE+Ocitc5HCrO2uZXp/+kDAMfwW
   forFrhEoALl/3wLVeeiJJQ4uxH3/oFHGW9qEphZKSS9p7RDm/0XiUKhGR
   c8SwfWkgpErGyUjy+rfR0/8+xGwO2kL7BHgve+pGp2ef59VR1gV+H2PEl
   KSnooFwQtaF/l8QCTpYsW0QUlN5sVL6v4+edgR3FHAM2NVeQr69ju1xol
   Q==;
X-CSE-ConnectionGUID: gmC7exRYRACnXWd4JcAcHw==
X-CSE-MsgGUID: 6XvQ2Zt1Sla19kRm7P4Irg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="12713751"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="12713751"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 11:06:16 -0700
X-CSE-ConnectionGUID: AlN4B2RPSmC8whK7zIIljQ==
X-CSE-MsgGUID: /2TQMtoURYSy30O74AOM1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="29798118"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2024 11:06:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s03U0-0002hs-2B;
	Thu, 25 Apr 2024 18:06:08 +0000
Date: Fri, 26 Apr 2024 02:05:41 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Steven Liu <Steven.Liu@mediatek.com>,
	"SkyLake.Huang" <skylake.huang@mediatek.com>
Subject: Re: [PATCH 2/3] net: phy: mediatek: Add mtk phy lib for token ring
 access & LED/other manipulations
Message-ID: <202404260115.HS8G6ns3-lkp@intel.com>
References: <20240425023325.15586-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425023325.15586-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_110625_133569_CDC5D3D3 
X-CRM114-Status: GOOD (  12.39  )
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
patch link:    https://lore.kernel.org/r/20240425023325.15586-3-SkyLake.Huang%40mediatek.com
patch subject: [PATCH 2/3] net: phy: mediatek: Add mtk phy lib for token ring access & LED/other manipulations
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240426/202404260115.HS8G6ns3-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260115.HS8G6ns3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260115.HS8G6ns3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/mediatek/mtk-phy-lib.c:51:13: warning: 'tr_write' defined but not used [-Wunused-function]
      51 | static void tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr, u8 data_addr, u32 tr_data)
         |             ^~~~~~~~
>> drivers/net/phy/mediatek/mtk-phy-lib.c:33:13: warning: 'tr_read' defined but not used [-Wunused-function]
      33 | static void tr_read(struct phy_device *phydev, u8 ch_addr, u8 node_addr, u8 data_addr,
         |             ^~~~~~~


vim +/tr_write +51 drivers/net/phy/mediatek/mtk-phy-lib.c

    32	
  > 33	static void tr_read(struct phy_device *phydev, u8 ch_addr, u8 node_addr, u8 data_addr,
    34			    u16 *tr_high, u16 *tr_low)
    35	{
    36		phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
    37		__tr_read(phydev, ch_addr, node_addr, data_addr, tr_high, tr_low);
    38		phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
    39	}
    40	
    41	static void __tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr, u8 data_addr,
    42			       u32 tr_data)
    43	{
    44		__phy_write(phydev, 0x11, tr_data & 0xffff);
    45		__phy_write(phydev, 0x12, tr_data >> 16);
    46		dev_dbg(&phydev->mdio.dev, "tr_high write: 0x%x, tr_low write: 0x%x\n",
    47			tr_data >> 16, tr_data & 0xffff);
    48		tr_access(phydev, false, ch_addr, node_addr, data_addr);
    49	}
    50	
  > 51	static void tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr, u8 data_addr, u32 tr_data)
    52	{
    53		phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
    54		__tr_write(phydev, ch_addr, node_addr, data_addr, tr_data);
    55		phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

