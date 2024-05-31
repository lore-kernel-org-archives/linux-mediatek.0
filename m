Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F10DC25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 01:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQQ7WGlbPBl96E0mx/QChLDx4YDF1uTdv3bO9oNifa4=; b=i3VijUCm7SoXQqLc6hRd1SOAIZ
	vSj3B9MZsmgJ2DMP3hO+5uUmLsFOdLb90lcns42mUBlMPzJLR1MPswhwc8az8bnoGDUZoxh+Fiw/n
	BcJ2VzqiMrqzBcSWVYxr0Rl1Jsgi0CIjQNXGytKszi13xdWvZXDUijlvqxF+WzL763touYvJWiUu6
	DEOwNFqDfvNLKBXzLIcje0T29ZMVengkHvmLvmbxk1Er4A1o/flFi/7dRwBqfjkqzhi5A6eByFTRV
	BDWd3+gys4ktEwcM5EedAtKl7L9Zoh+POrxdXSQLasyjOEIiDvDFx8dNGD/Lo4Wj6Yg/FpDfQjEGE
	NtNzu2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCqeJ-00000008rDC-2i5N;
	Fri, 31 May 2024 01:01:39 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCqeG-00000008rAr-0U1y;
	Fri, 31 May 2024 01:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717117296; x=1748653296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HxG5osaBenuaXiNqjDMl+ACscharTtPstTDjg6QkFeI=;
  b=i5PQXi7DiA4qijz+e2v63DbwkkMEkQYFtRTdfdoTFFSCWqnwdrdB3Ayz
   a+GMUA3NTrVFA3Um+SDOKbMQtqKsfnOjF9JoiU2js4lM3NEUR1IJLkTmT
   eZ+c/UAoOR6K1sfyVW1MAmuFpjO06BrDTO/eJPom0M3XybG+GO/7/V3tF
   i5zlljJNF3OPed14Z6OR5uZn1NaZV7XAycmcs/SMj+yV1EL1xy20kMd1l
   lpJuvcb4d48mMuqQCUeUddAo1auMGq9jcWLtduqpNhjX3yvMnzJqMYGp2
   Il6gIB6/zJ/mEvV3LDopC0RGfsFAa1mwLcHrkH+twH6ZTEufqUqa87HMv
   A==;
X-CSE-ConnectionGUID: wmABk5BES7SIXVhszZvuhQ==
X-CSE-MsgGUID: KWUZMKN7R9STR229GyEyow==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17446399"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="17446399"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 18:01:22 -0700
X-CSE-ConnectionGUID: KTu1FWO8RuCq02JLF+MT2g==
X-CSE-MsgGUID: v97yehVvQbyvM9/AyyHfgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="36041608"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 May 2024 18:01:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCqdv-000GJ1-08;
	Fri, 31 May 2024 01:01:15 +0000
Date: Fri, 31 May 2024 09:00:50 +0800
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
Subject: Re: [PATCH net-next v5 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <202405310819.c3Dv1OM3-lkp@intel.com>
References: <20240530034844.11176-6-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530034844.11176-6-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_180136_602214_D1F0FA3F 
X-CRM114-Status: GOOD (  12.81  )
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

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/net-phy-mediatek-Re-organize-MediaTek-ethernet-phy-drivers/20240530-115522
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240530034844.11176-6-SkyLake.Huang%40mediatek.com
patch subject: [PATCH net-next v5 5/5] net: phy: add driver for built-in 2.5G ethernet PHY on MT7988
config: openrisc-randconfig-r121-20240531 (https://download.01.org/0day-ci/archive/20240531/202405310819.c3Dv1OM3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240531/202405310819.c3Dv1OM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310819.c3Dv1OM3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/phy/mediatek/mtk-2p5ge.c:106:9: sparse: sparse: cast to restricted __be16

vim +106 drivers/net/phy/mediatek/mtk-2p5ge.c

    56	
    57	static int mt798x_2p5ge_phy_load_fw(struct phy_device *phydev)
    58	{
    59		struct mtk_i2p5ge_phy_priv *priv = phydev->priv;
    60		void __iomem *md32_en_cfg_base, *pmb_addr;
    61		struct device *dev = &phydev->mdio.dev;
    62		const struct firmware *fw;
    63		int ret, i;
    64		u16 reg;
    65	
    66		if (priv->fw_loaded)
    67			return 0;
    68	
    69		pmb_addr = ioremap(MT7988_2P5GE_PMB_BASE, MT7988_2P5GE_PMB_LEN);
    70		if (!pmb_addr)
    71			return -ENOMEM;
    72		md32_en_cfg_base = ioremap(MT7988_2P5GE_MD32_EN_CFG_BASE, MT7988_2P5GE_MD32_EN_CFG_LEN);
    73		if (!md32_en_cfg_base) {
    74			ret = -ENOMEM;
    75			goto free_pmb;
    76		}
    77	
    78		ret = request_firmware(&fw, MT7988_2P5GE_PMB, dev);
    79		if (ret) {
    80			dev_err(dev, "failed to load firmware: %s, ret: %d\n",
    81				MT7988_2P5GE_PMB, ret);
    82			goto free;
    83		}
    84	
    85		if (fw->size != MT7988_2P5GE_PMB_SIZE) {
    86			dev_err(dev, "Firmware size 0x%zx != 0x%x\n",
    87				fw->size, MT7988_2P5GE_PMB_SIZE);
    88			ret = -EINVAL;
    89			goto free;
    90		}
    91	
    92		reg = readw(md32_en_cfg_base);
    93		if (reg & MD32_EN) {
    94			phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
    95			usleep_range(10000, 11000);
    96		}
    97		phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN);
    98	
    99		/* Write magic number to safely stall MCU */
   100		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x800e, 0x1100);
   101		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x800f, 0x00df);
   102	
   103		for (i = 0; i < MT7988_2P5GE_PMB_SIZE - 1; i += 4)
   104			writel(*((uint32_t *)(fw->data + i)), pmb_addr + i);
   105		release_firmware(fw);
 > 106		dev_info(dev, "Firmware date code: %x/%x/%x, version: %x.%x\n",
   107			 be16_to_cpu(*((uint16_t *)(fw->data + MT7988_2P5GE_PMB_SIZE - 8))),
   108			 *(fw->data + MT7988_2P5GE_PMB_SIZE - 6),
   109			 *(fw->data + MT7988_2P5GE_PMB_SIZE - 5),
   110			 *(fw->data + MT7988_2P5GE_PMB_SIZE - 2),
   111			 *(fw->data + MT7988_2P5GE_PMB_SIZE - 1));
   112	
   113		writew(reg & ~MD32_EN, md32_en_cfg_base);
   114		writew(reg | MD32_EN, md32_en_cfg_base);
   115		phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
   116		/* We need a delay here to stabilize initialization of MCU */
   117		usleep_range(7000, 8000);
   118		dev_info(dev, "Firmware loading/trigger ok.\n");
   119	
   120		priv->fw_loaded = true;
   121	
   122	free:
   123		iounmap(md32_en_cfg_base);
   124	free_pmb:
   125		iounmap(pmb_addr);
   126	
   127		return ret ? ret : 0;
   128	}
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

