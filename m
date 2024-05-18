Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A1CC25B74
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 May 2024 19:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9owh1zm++Rq6EDEPSPhtrxOLphnSl0MMAdDHWJmpg8o=; b=fBUZF8fnbpbddvRj4omE9/Ri79
	2BH7arq7d1eDswVaolDSZHhYmgtfOvqtx0c/2vT4GvVBZtM2laAmmGTaDrxme2R83AIINP2Aw0qAJ
	4DnxsFxVnxptQBF/k+VaZm82EtIFtubwSde9+PAHZY6zifJSaFvd6oIz0OSCa+t9pPdy9kybDe8gx
	N5dStecBam0mpKZq7K7bNfJUvYreHBhnSUCG56pvj36pn7oaGBbrxx3hOlFvYB2SfH9woup9D4DIL
	M66Ni6zJV1NEKF1xEsfBxcjx0uxhnHNg3LR6XPEso0DYqBLG/6qIT8EREIBs1Yy1FtCj8D3pSmOti
	Mat3B4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8PLM-0000000Ab2K-2YxS;
	Sat, 18 May 2024 19:03:44 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8PLI-0000000Ab1S-0nGi;
	Sat, 18 May 2024 19:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716059020; x=1747595020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7rmGpkOatz4do+81lJEjQWDYuejNH0Ay1bs4H11lIbo=;
  b=ZcJDc0LfoL+KD9VVAPgnXnU8qUYHuEBOsONsl9BNu+2lLfPDP/GewFSx
   bemRXqH4D/6itcSCTY3Uw8zr0urxPez9zaBEIPMuhtWfVp/vTnDHtbtrN
   mI6HpI6zZMFcuAv++Y/yULnn/Pr9ErbP3ZmzN5/Q61SANoZtqwgQuvJgV
   yL4bKS0WbFII506IvNvXsmgce90PEZ0YJV08QjhwWp8yU2NEzX/DhHQuw
   A/vqe8mOe6lsrZhoy/lu6iGznAocGDYhEWJ7NLSg2tJGEVALgZhur4UTa
   lk+x33Z4qU3fBolmsyYbJqbw5HfBZLkK1P25wiKlZqbGSVmuWmSNjrCFA
   w==;
X-CSE-ConnectionGUID: a49K9qx4RFWgw/3CV7ZAGQ==
X-CSE-MsgGUID: nNHLo9jNRLW44urKUf0GeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12075613"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12075613"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 12:03:35 -0700
X-CSE-ConnectionGUID: LUvghvNBQFec0W5tb3HKuw==
X-CSE-MsgGUID: 1q2z18JQSV6KxmPSeW8J6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="32533127"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 May 2024 12:03:29 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8PL5-0002YC-1M;
	Sat, 18 May 2024 19:03:27 +0000
Date: Sun, 19 May 2024 03:02:40 +0800
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
Message-ID: <202405190214.zVx19jfL-lkp@intel.com>
References: <20240517102908.12079-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517102908.12079-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_120340_313293_E5DFA35D 
X-CRM114-Status: GOOD (  11.96  )
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
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20240519/202405190214.zVx19jfL-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405190214.zVx19jfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405190214.zVx19jfL-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mtk_socphy_write_page':
   mtk-ge-soc.c:(.text+0x70): undefined reference to `__mdiobus_write'
   mtk-ge-soc.c:(.text+0x70): relocation truncated to fit: R_NIOS2_CALL26 against `__mdiobus_write'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mtk_socphy_read_page':
   mtk-ge-soc.c:(.text+0xa4): undefined reference to `__mdiobus_read'
   mtk-ge-soc.c:(.text+0xa4): relocation truncated to fit: R_NIOS2_CALL26 against `__mdiobus_read'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7981_phy_finetune':
   mtk-ge-soc.c:(.text+0x150): undefined reference to `phy_write_mmd'
>> mtk-ge-soc.c:(.text+0x150): relocation truncated to fit: R_NIOS2_CALL26 against `phy_write_mmd'
>> nios2-linux-ld: mtk-ge-soc.c:(.text+0x16c): undefined reference to `phy_select_page'
>> mtk-ge-soc.c:(.text+0x16c): relocation truncated to fit: R_NIOS2_CALL26 against `phy_select_page'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x180): undefined reference to `__mdiobus_write'
   mtk-ge-soc.c:(.text+0x180): relocation truncated to fit: R_NIOS2_CALL26 against `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x194): undefined reference to `__mdiobus_write'
   mtk-ge-soc.c:(.text+0x194): relocation truncated to fit: R_NIOS2_CALL26 against `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x1a8): undefined reference to `__mdiobus_write'
   mtk-ge-soc.c:(.text+0x1a8): relocation truncated to fit: R_NIOS2_CALL26 against `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x1bc): undefined reference to `__mdiobus_write'
   mtk-ge-soc.c:(.text+0x1bc): relocation truncated to fit: R_NIOS2_CALL26 against `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x1d0): undefined reference to `__mdiobus_write'
   mtk-ge-soc.c:(.text+0x1d0): relocation truncated to fit: R_NIOS2_CALL26 against `__mdiobus_write'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:mtk-ge-soc.c:(.text+0x1e4): more undefined references to `__mdiobus_write' follow
   drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7981_phy_finetune':
   mtk-ge-soc.c:(.text+0x1e4): relocation truncated to fit: R_NIOS2_CALL26 against `__mdiobus_write'
   mtk-ge-soc.c:(.text+0x1f8): additional relocation overflows omitted from the output
>> nios2-linux-ld: mtk-ge-soc.c:(.text+0x26c): undefined reference to `phy_restore_page'
>> nios2-linux-ld: mtk-ge-soc.c:(.text+0x288): undefined reference to `phy_modify_mmd'
>> nios2-linux-ld: mtk-ge-soc.c:(.text+0x29c): undefined reference to `phy_write_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x2b0): undefined reference to `phy_write_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x2c4): undefined reference to `phy_write_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x2d8): undefined reference to `phy_write_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x2ec): undefined reference to `phy_write_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:mtk-ge-soc.c:(.text+0x300): more undefined references to `phy_write_mmd' follow
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7981_phy_finetune':
   mtk-ge-soc.c:(.text+0x380): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x39c): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x3b0): undefined reference to `phy_write_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x3c4): undefined reference to `phy_write_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x3d8): undefined reference to `phy_write_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7988_phy_finetune':
   mtk-ge-soc.c:(.text+0x48c): undefined reference to `phy_write_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x4b0): undefined reference to `phy_write_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x4bc): undefined reference to `phy_select_page'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x4d0): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x4e4): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x4f8): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x50c): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x520): undefined reference to `__mdiobus_write'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:mtk-ge-soc.c:(.text+0x534): more undefined references to `__mdiobus_write' follow
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7988_phy_finetune':
   mtk-ge-soc.c:(.text+0x580): undefined reference to `phy_restore_page'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x59c): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x5b0): undefined reference to `phy_write_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_common_finetune':
   mtk-ge-soc.c:(.text+0x5fc): undefined reference to `phy_select_page'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x610): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x624): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x638): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x64c): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x660): undefined reference to `__mdiobus_write'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:mtk-ge-soc.c:(.text+0x674): more undefined references to `__mdiobus_write' follow
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_common_finetune':
   mtk-ge-soc.c:(.text+0x774): undefined reference to `phy_restore_page'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_eee':
   mtk-ge-soc.c:(.text+0x7c8): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x7e0): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x7f8): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x814): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x82c): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:mtk-ge-soc.c:(.text+0x848): more undefined references to `phy_modify_mmd' follow
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_eee':
   mtk-ge-soc.c:(.text+0x8f8): undefined reference to `phy_select_page'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x90c): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x920): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x934): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x948): undefined reference to `__mdiobus_write'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x95c): undefined reference to `__mdiobus_write'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:mtk-ge-soc.c:(.text+0x970): more undefined references to `__mdiobus_write' follow
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_eee':
   mtk-ge-soc.c:(.text+0xae8): undefined reference to `phy_restore_page'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xaf4): undefined reference to `phy_select_page'
>> nios2-linux-ld: mtk-ge-soc.c:(.text+0xb08): undefined reference to `__phy_modify'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xb1c): undefined reference to `__phy_modify'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xb2c): undefined reference to `phy_restore_page'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xb44): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `cal_cycle.constprop.0':
   mtk-ge-soc.c:(.text+0xba0): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xbbc): undefined reference to `phy_modify_mmd'
>> nios2-linux-ld: mtk-ge-soc.c:(.text+0xbec): undefined reference to `phy_read_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xc24): undefined reference to `phy_read_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xc54): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xc64): undefined reference to `phy_read_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `tx_vcm_cal_sw':
   mtk-ge-soc.c:(.text+0xd4c): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xd64): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xd80): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xdcc): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0xde4): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:mtk-ge-soc.c:(.text+0xdfc): more undefined references to `phy_modify_mmd' follow
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `cal_efuse':
   mtk-ge-soc.c:(.text+0x1710): undefined reference to `phy_write_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_hw_led_on_set':
   mtk-ge-soc.c:(.text+0x1b4c): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_hw_led_blink_set':
   mtk-ge-soc.c:(.text+0x1ca8): undefined reference to `phy_write_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_led_hw_control_set':
   mtk-ge-soc.c:(.text+0x1fa4): undefined reference to `phy_write_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x1fc8): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x1fec): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt798x_phy_led_hw_control_get':
   mtk-ge-soc.c:(.text+0x2070): undefined reference to `phy_read_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x20a8): undefined reference to `phy_read_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x22b8): undefined reference to `phy_read_mmd'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `mt7988_phy_probe':
   mtk-ge-soc.c:(.text+0x2344): undefined reference to `devm_phy_package_join'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x2468): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x248c): undefined reference to `phy_modify_mmd'
   nios2-linux-ld: mtk-ge-soc.c:(.text+0x24f4): undefined reference to `phy_modify_mmd'
>> nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x7c): undefined reference to `genphy_suspend'
>> nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x80): undefined reference to `genphy_resume'
>> nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x94): undefined reference to `genphy_handle_interrupt_no_ack'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x190): undefined reference to `genphy_suspend'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x194): undefined reference to `genphy_resume'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o:(.data+0x1a8): undefined reference to `genphy_handle_interrupt_no_ack'
   nios2-linux-ld: drivers/net/phy/mediatek/mtk-ge-soc.o: in function `phy_module_init':
   mtk-ge-soc.c:(.init.text+0x18): undefined reference to `phy_drivers_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

