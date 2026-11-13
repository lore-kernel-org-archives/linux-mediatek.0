Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A218606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y2uOb7f5;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k12J1BWr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6xb6otvf5Qr4wvHdfXzuwdi9ONtxaN5erYItBU28LlU=; b=Y2uOb7f5w4C65S6uSbwmChwJS+
	cjQ/g5jM/5liqa6XwaAFYwrJ2TNFNcNbyMPSVy2NKtU+Z0D/VkCCJxYPw3fwFPML8Cp4QgrHzZTSL
	4b+AZgK/jlZ3WYchSRv6k25KnnKVK0aF7T6cybjSgD3KBB/QgxO2rnIKkNm9whPGdAbJAIovQLOQ0
	9VyNW3Ym1qXBFnJCdtC2FN8wItLKPggPCWiCs15lxRcXTtvb5v/o+CAsjJwOkBirNQWumjl9OiBAt
	jLGKqr9yWWi1GVZTfiPupS5s6S3tUPr3CxLJTckEvhmG/ACQZcJ1LSRIJe1pupcGWUE5Vu9OIlVTE
	gPSgdJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp9p-0000000CTwc-09QA;
	Fri, 13 Nov 2026 11:09:25 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp9m-0000000CTvD-14e8
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 11:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794568162; x=1826104162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hm8/nm9vKhZtzMex8CaMsv03W79t4fqBOFYZfR4Lq7s=;
  b=k12J1BWr7bRocgu3DGwZ752zQfkpkbBGJ+XhiVPYCI/fg/LfphzmBxYG
   nJewXKiCRuNbPd5jfslg1O+ObyRCMRtuNpAC1B4LX0tyxGJRMkH3VUfgc
   EGjy7nc2vwj7zUJ7RQYUeXM1lfj3FtIpFX/0GwrqfsJ6fite5RnjEPA6A
   PLFrey5xNHC44whDnP9ehitYN8BZPJ73hBXlyGBXUUEGOXqvcdAP9kLH9
   qEafk9hHDe5ctn18bXRpUdpHm2Ud8vZes7DA32vqSYtgJxS8GbYXAzTNa
   cnWnBAwEBnORQIojpCfPortPvl2E4qOA2nVqd9vghxCRNggsg5Y+RwZRf
   A==;
X-CSE-ConnectionGUID: zlU+CENMRryrwN4bV3zuuQ==
X-CSE-MsgGUID: +j5Fcy5oRXWhBLDh6037qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3259920"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3259920"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:09:21 -0800
X-CSE-ConnectionGUID: 4kkBGNq3RQ6T78QsYIcQRg==
X-CSE-MsgGUID: CiIijtDHRbqRxIhmmKwp3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9446078"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2026 03:09:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRp9f-000000012hv-1uuY;
	Fri, 13 Nov 2026 11:09:15 +0000
Date: Fri, 13 Nov 2026 19:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Shih <michael.shih@mediatek.com>, nbd@nbd.name,
	lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kun.wu@mediatek.com,
	deren.wu@mediatek.com, sean.wang@mediatek.com,
	quan.zhou@mediatek.com, ryder.lee@mediatek.com,
	leon.yen@mediatek.com, litien.chang@mediatek.com,
	jb.tsai@mediatek.com, eason.Lai@mediatek.com,
	Michael Shih <michael.shih@mediatek.com>
Subject: Re: [PATCH v5 1/2] wifi: mt76: mt7928: Add debugfs for stats to
 provide debug purpose
Message-ID: <202611131943.bgeayFva-lkp@intel.com>
References: <20261112075558.1813785-2-michael.shih@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112075558.1813785-2-michael.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030922_335018_CE8DC40A 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v7.4-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Shih/wifi-mt76-mt7928-Add-debugfs-for-stats-to-provide-debug-purpose/20261112-155556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261112075558.1813785-2-michael.shih%40mediatek.com
patch subject: [PATCH v5 1/2] wifi: mt76: mt7928: Add debugfs for stats to provide debug purpose
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611131943.bgeayFva-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131943.bgeayFva-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131943.bgeayFva-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x14 (section: .data) -> ice_adv_lnk_speed_100 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x30 (section: .data) -> ice_adv_lnk_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x4c (section: .data) -> ice_adv_lnk_speed_2500 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x68 (section: .data) -> ice_adv_lnk_speed_5000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x84 (section: .data) -> ice_adv_lnk_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0xa0 (section: .data) -> ice_adv_lnk_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0xbc (section: .data) -> ice_adv_lnk_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0xd8 (section: .data) -> ice_adv_lnk_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0xf4 (section: .data) -> ice_adv_lnk_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x110 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0x14 (section: .data) -> qed_mfw_ext_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0x30 (section: .data) -> qed_mfw_ext_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0x4c (section: .data) -> qed_mfw_ext_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0x68 (section: .data) -> qed_mfw_ext_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0x84 (section: .data) -> qed_mfw_ext_50g_base_r (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0xa0 (section: .data) -> qed_mfw_ext_50g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0xbc (section: .data) -> qed_mfw_ext_100g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0xd8 (section: .data) -> qed_mfw_ext_100g_base_r4 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0x14 (section: .data) -> qed_mfw_legacy_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0x30 (section: .data) -> qed_mfw_legacy_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0x4c (section: .data) -> qed_mfw_legacy_20g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0x68 (section: .data) -> qed_mfw_legacy_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0x84 (section: .data) -> qed_mfw_legacy_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0xa0 (section: .data) -> qed_mfw_legacy_50g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0xbc (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x14 (section: .data) -> qede_forced_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x30 (section: .data) -> qede_forced_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x4c (section: .data) -> qede_forced_speed_20000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x68 (section: .data) -> qede_forced_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x84 (section: .data) -> qede_forced_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0xa0 (section: .data) -> qede_forced_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0xbc (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
>> ERROR: modpost: drivers/net/wireless/mediatek/mt76/mt7925/mt7925-common.ko: symbol '__umoddi3' undefined!
ERROR: modpost: drivers/net/wireless/mediatek/mt76/mt7925/mt7925-common.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

