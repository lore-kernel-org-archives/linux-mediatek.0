Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D4FC25B74
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 May 2024 21:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Gw54EQDhpSeWtmk2FoI7jwIsmxZHVbz3aBCdHeXgw0=; b=CdgOHEbSfOKmb02xB1rl4+KKEs
	/hERqh49tNJ36qXu5rXEmCLU8K0VVWpgKYwtOVXM/PFCX+0z/Ym42flI8skWCE/GBbJWHN6YrUnXY
	2m0oEv/YUPAy300haoANwoJ7rsP/u4cHIax7Yad/VcL8tvmDaFuoD7DDHQ/ekYvrj+XG3Ksxx7TiE
	gI6flx/uQsXQTLJSMMqjKRLUbLsYCZvo9ZmYWDUkboAiKaOAx39n2Qclg93hRhtW+WJpL/6cj/5s3
	VHlzB58sPWb2fovhCYZslrAy3xaD67D507m9YjVOCENwfZ6hIMs+NDjK0drTRSXkNL1uhUp37vNFy
	F4oUYpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8ReB-0000000ApiM-2Owi;
	Sat, 18 May 2024 21:31:19 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8Re7-0000000Aphg-3qkZ;
	Sat, 18 May 2024 21:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716067876; x=1747603876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YcuHLa93vOsQrMH7qC/ZJuanpLd3bFvl73b4w8gDm7k=;
  b=VBSXkLw4KuHcKdSpOwcfX8SeWmdL41XDkJxomRCNY1vaJrPU20dMn+jP
   8SR073XJO+1lHqynZTPLyZZ7uTKsUBKFlGDi/9L8dk+dV7DMhaII2He6F
   Toh/HK8iFf016PKA19EfEx3xBPpclQaoK/KsqjxIQT9tCi8FzyEu+5EFN
   hmObEKdSjE/pkfHuz1ch4Ibos0OimMoFl9Vpr0fMAtp6JccCDFZCTNZIr
   z27AveQiF5J2LK7VqcqGYZwQNiVq2bcxsJXg8+56LYlUVKw2LrcBrk9IQ
   711pl1tUsYH99XDABBMxWXc7r78w65ML9qIATOEAn66q3ymavVS+ees63
   g==;
X-CSE-ConnectionGUID: D7fvKfPURL6P7owiOZqx6Q==
X-CSE-MsgGUID: ttK6YODHTciOXuBOeD+Rlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="37608906"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="37608906"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 14:31:08 -0700
X-CSE-ConnectionGUID: sc9c9u6PRKSkFMa9ZLiDIw==
X-CSE-MsgGUID: ovrQszmMR3mDpHLmAvxfng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="32710517"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 May 2024 14:31:03 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Rds-0002do-28;
	Sat, 18 May 2024 21:31:00 +0000
Date: Sun, 19 May 2024 05:30:03 +0800
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
Subject: Re: [PATCH net-next v2 2/5] net: phy: mediatek: Move LED and
 read/write page helper functions into mtk phy lib
Message-ID: <202405190537.zWJuRc1r-lkp@intel.com>
References: <20240517102908.12079-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517102908.12079-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_143116_017411_4090AE7F 
X-CRM114-Status: GOOD (  12.01  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240517]
[cannot apply to net-next/main net/main linus/master v6.9 v6.9-rc7 v6.9-rc6 v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/net-phy-mediatek-Re-organize-MediaTek-ethernet-phy-drivers/20240517-184536
base:   next-20240517
patch link:    https://lore.kernel.org/r/20240517102908.12079-3-SkyLake.Huang%40mediatek.com
patch subject: [PATCH net-next v2 2/5] net: phy: mediatek: Move LED and read/write page helper functions into mtk phy lib
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240519/202405190537.zWJuRc1r-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405190537.zWJuRc1r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405190537.zWJuRc1r-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_eee':
   mtk-ge-soc.c:(.text+0x892): undefined reference to `phy_select_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0xaaa): undefined reference to `__phy_modify'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_led_hw_control_get':
>> mtk-ge-soc.c:(.text+0x32): undefined reference to `mtk_phy_led_hw_ctrl_get'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_led_hw_control_set':
>> mtk-ge-soc.c:(.text+0x64): undefined reference to `mtk_phy_led_hw_ctrl_set'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_led_hw_is_supported':
>> mtk-ge-soc.c:(.text+0x88): undefined reference to `mtk_phy_led_hw_is_supported'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_led_blink_set':
>> mtk-ge-soc.c:(.text+0xe0): undefined reference to `mtk_phy_hw_led_blink_set'
>> m68k-linux-ld: mtk-ge-soc.c:(.text+0xfa): undefined reference to `mtk_phy_hw_led_on_set'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_led_brightness_set':
   mtk-ge-soc.c:(.text+0x136): undefined reference to `mtk_phy_hw_led_blink_set'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x15a): undefined reference to `mtk_phy_hw_led_on_set'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7981_phy_finetune':
   mtk-ge-soc.c:(.text+0x19e): undefined reference to `phy_write_mmd'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x1ea): undefined reference to `phy_select_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x200): undefined reference to `__mdiobus_write'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x2f4): undefined reference to `phy_restore_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x30c): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7988_phy_finetune':
   mtk-ge-soc.c:(.text+0x48a): undefined reference to `phy_write_mmd'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x4c2): undefined reference to `phy_select_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x4d8): undefined reference to `__mdiobus_write'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x592): undefined reference to `phy_restore_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x5aa): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_common_finetune':
   mtk-ge-soc.c:(.text+0x5e6): undefined reference to `phy_select_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x5fc): undefined reference to `__mdiobus_write'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x766): undefined reference to `phy_restore_page'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_eee':
   mtk-ge-soc.c:(.text+0x79c): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x8ac): undefined reference to `__mdiobus_write'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0xa8a): undefined reference to `phy_restore_page'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `cal_cycle.constprop.0':
   mtk-ge-soc.c:(.text+0xb1e): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0xb50): undefined reference to `phy_read_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `tx_vcm_cal_sw':
   mtk-ge-soc.c:(.text+0xc70): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `tx_amp_fill_result.isra.0':
   mtk-ge-soc.c:(.text+0x1016): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `rext_cal_efuse':
   mtk-ge-soc.c:(.text+0x121e): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `cal_efuse':
   mtk-ge-soc.c:(.text+0x12c8): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x13e4): undefined reference to `phy_write_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7988_phy_probe':
   mtk-ge-soc.c:(.text+0x15ec): undefined reference to `devm_phy_package_join'
>> m68k-linux-ld: mtk-ge-soc.c:(.text+0x1688): undefined reference to `mtk_phy_leds_state_init'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x16ba): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7981_phy_probe':
>> mtk-ge-soc.c:(.text+0x17b4): undefined reference to `mtk_phy_leds_state_init'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x7a): undefined reference to `genphy_suspend'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x7e): undefined reference to `genphy_resume'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x92): undefined reference to `genphy_handle_interrupt_no_ack'
>> m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0xb2): undefined reference to `mtk_phy_read_page'
>> m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0xb6): undefined reference to `mtk_phy_write_page'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x18c): undefined reference to `genphy_suspend'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x190): undefined reference to `genphy_resume'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x1a4): undefined reference to `genphy_handle_interrupt_no_ack'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x1c4): undefined reference to `mtk_phy_read_page'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x1c8): undefined reference to `mtk_phy_write_page'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `phy_module_init':
   mtk-ge-soc.c:(.init.text+0x12): undefined reference to `phy_drivers_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

