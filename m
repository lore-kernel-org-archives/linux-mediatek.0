Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C748C25B74
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 May 2024 18:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfkE6yOCdHFCjHP9b9zHLYvWoLWZ3RM6H0aNrPYdwIo=; b=yxvbtN3da77nCopRZwB9SIB30e
	jji4BNOlAaJl8lR9KPHiwWEHIWmp9hXb9iSKdIW1H0eLfuR5/4LiHhFzFPmv++h9DHesQ/LUhUIF0
	rjl4YEDlJuZsgv77f7//nkTL+SJz3tsBJYmohA6k8BZD0DoBxNEZY3RiVMY/XgoFhMcmF0JlevuT4
	wNRwHwJR5E50u7PLZKhMVoUiduDrumm7I099mgz8JKd5CE/YlmJvW7I31Xm5P1n82Mix44YDNEsjU
	DBhXwYJkwb3y9bsuyi10gwdgHnQ0r7uBl0PVyTWN0N/vntvuBFTMXKki4HnFSho1de4E8hPqU2zQZ
	xc7N5yyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8Ofl-0000000AWaU-17f6;
	Sat, 18 May 2024 18:20:45 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8Ofe-0000000AWYl-1MlL;
	Sat, 18 May 2024 18:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716056438; x=1747592438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=71RabXOq6vDxowg3qtAHm2HVaMGle+7+ZRIk+BCvGj8=;
  b=faKABtvqsotY8dG1r8B8x/L4RkgOf2HerQD7W8rW4DcOW7Ar2kdVJ5dR
   SvzPCiv3fhgXskHR4j2gqEzy5dILMtqf8lUuzRkE3gwbgqfq6LbAa5FYU
   ntQc8jNH0QbzwXt+GORwwmPSyTqjaJdCFc15P7ov+pqpiil8c07a05CBG
   AWd2IQOI1cbZp87hqASZEwJi3t3Dvb2QQwL1XFhOYMKYDSlsSrduJf9uJ
   1FgsKuEKBPzMC04yAk+hNd7HFP3Ot5HYWV0POcUxJ/nKtSIX3mjBLk5EQ
   WJutreV3C0QDogA8S6cDBMb8xZsz4vM13gRGAFGb3CseGHVQeGCfo5Ji0
   A==;
X-CSE-ConnectionGUID: 8BTVrNcvTda/jNvBNCtNLg==
X-CSE-MsgGUID: nDxq3IUISe2Jm/YPfG3hkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12337509"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12337509"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 11:20:32 -0700
X-CSE-ConnectionGUID: XIbSxsbPQo2VzxIuGvKSig==
X-CSE-MsgGUID: k4SG/OyfT8WUIPObcss+mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="32687008"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 May 2024 11:20:27 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8OfR-0002UH-1I;
	Sat, 18 May 2024 18:20:25 +0000
Date: Sun, 19 May 2024 02:19:34 +0800
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
Subject: Re: [PATCH net-next v2 1/5] net: phy: mediatek: Re-organize MediaTek
 ethernet phy drivers
Message-ID: <202405190238.VoQDfwSS-lkp@intel.com>
References: <20240517102908.12079-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517102908.12079-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_112038_448590_61D78E9D 
X-CRM114-Status: GOOD (  11.78  )
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
patch link:    https://lore.kernel.org/r/20240517102908.12079-2-SkyLake.Huang%40mediatek.com
patch subject: [PATCH net-next v2 1/5] net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240519/202405190238.VoQDfwSS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405190238.VoQDfwSS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405190238.VoQDfwSS-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_eee':
>> mtk-ge-soc.c:(.text+0xc5e): undefined reference to `phy_select_page'
>> m68k-linux-ld: mtk-ge-soc.c:(.text+0xe76): undefined reference to `__phy_modify'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_hw_led_on_set':
>> mtk-ge-soc.c:(.text+0xac): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_led_hw_control_set':
>> mtk-ge-soc.c:(.text+0x1d4): undefined reference to `phy_write_mmd'
>> m68k-linux-ld: mtk-ge-soc.c:(.text+0x1fe): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x228): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_hw_led_blink_set':
   mtk-ge-soc.c:(.text+0x29c): undefined reference to `phy_write_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_led_hw_control_get':
   mtk-ge-soc.c:(.text+0x3d2): undefined reference to `phy_read_mmd'
>> m68k-linux-ld: mtk-ge-soc.c:(.text+0x4c6): undefined reference to `phy_read_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mtk_socphy_write_page':
   mtk-ge-soc.c:(.text+0x50e): undefined reference to `__mdiobus_write'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mtk_socphy_read_page':
   mtk-ge-soc.c:(.text+0x52e): undefined reference to `__mdiobus_read'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7981_phy_finetune':
   mtk-ge-soc.c:(.text+0x56a): undefined reference to `phy_write_mmd'
>> m68k-linux-ld: mtk-ge-soc.c:(.text+0x5b6): undefined reference to `phy_select_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x5cc): undefined reference to `__mdiobus_write'
>> m68k-linux-ld: mtk-ge-soc.c:(.text+0x6c0): undefined reference to `phy_restore_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x6d8): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7988_phy_finetune':
   mtk-ge-soc.c:(.text+0x856): undefined reference to `phy_write_mmd'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x88e): undefined reference to `phy_select_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x8a4): undefined reference to `__mdiobus_write'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x95e): undefined reference to `phy_restore_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x976): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_common_finetune':
   mtk-ge-soc.c:(.text+0x9b2): undefined reference to `phy_select_page'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x9c8): undefined reference to `__mdiobus_write'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0xb32): undefined reference to `phy_restore_page'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_eee':
   mtk-ge-soc.c:(.text+0xb68): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0xc78): undefined reference to `__mdiobus_write'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0xe56): undefined reference to `phy_restore_page'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `cal_cycle.constprop.0':
   mtk-ge-soc.c:(.text+0xeea): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0xf1c): undefined reference to `phy_read_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `tx_vcm_cal_sw':
   mtk-ge-soc.c:(.text+0x103c): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `tx_amp_fill_result.isra.0':
   mtk-ge-soc.c:(.text+0x13e2): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `rext_cal_efuse':
   mtk-ge-soc.c:(.text+0x15ea): undefined reference to `phy_modify_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `cal_efuse':
   mtk-ge-soc.c:(.text+0x1694): undefined reference to `phy_modify_mmd'
>> m68k-linux-ld: mtk-ge-soc.c:(.text+0x17b0): undefined reference to `phy_write_mmd'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7988_phy_probe':
>> mtk-ge-soc.c:(.text+0x19b8): undefined reference to `devm_phy_package_join'
   m68k-linux-ld: mtk-ge-soc.c:(.text+0x1a94): undefined reference to `phy_modify_mmd'
>> m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x7a): undefined reference to `genphy_suspend'
>> m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x7e): undefined reference to `genphy_resume'
>> m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x92): undefined reference to `genphy_handle_interrupt_no_ack'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x18c): undefined reference to `genphy_suspend'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x190): undefined reference to `genphy_resume'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x1a4): undefined reference to `genphy_handle_interrupt_no_ack'
   m68k-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `phy_module_init':
>> mtk-ge-soc.c:(.init.text+0x12): undefined reference to `phy_drivers_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

